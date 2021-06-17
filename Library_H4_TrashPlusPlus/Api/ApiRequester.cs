using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Api
{
    public class ApiRequester
    {
        private readonly List<Cookie> cookies;
        private readonly string API_PATH;
        private readonly int TIMEOUT_WAIT = 10000;
        private readonly HttpClient client = new HttpClient();
        public string jwtToken { get; set; }

        public ApiRequester(string api_path)
        {
            this.API_PATH = api_path;
            cookies = new List<Cookie>();
        }

        public T GetApi<T>(string apiUrlParam)
        {
            string streamTask = this.ProcessApiGet(apiUrlParam).Result;
            JsonSerializerOptions serializerSettings = new JsonSerializerOptions();
            serializerSettings.PropertyNameCaseInsensitive = true;
            return System.Text.Json.JsonSerializer.Deserialize<T>(streamTask, serializerSettings);
        }

        public T PostApi<T>(string apiUrlParam, object postBody)
        {
            string streamTask = this.ProcessApiPost(apiUrlParam, postBody).Result;
            JsonSerializerOptions serializerSettings = new JsonSerializerOptions();
            serializerSettings.PropertyNameCaseInsensitive = true;
            return System.Text.Json.JsonSerializer.Deserialize<T>(streamTask, serializerSettings);
        }


        private async Task<string> ProcessApiGet(string urlParams)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(this.API_PATH + urlParams);
            httpWebRequest.Method = "GET";
            if (!(jwtToken == "" || jwtToken == null))
            {
                httpWebRequest.PreAuthenticate = true;
                httpWebRequest.Headers.Add("Authorization", "Bearer " + jwtToken);
            }

            this.AddCookies(ref httpWebRequest);

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();

            if (httpResponse.Headers.AllKeys.Contains("Set-Cookie"))
            {
                string[] token = httpResponse.Headers["Set-Cookie"].Split('=');
                cookies.Add(new Cookie(token[0], token[1].Split(';')[0], "/", "localhost"));
            }

            string result;

            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {

                result = streamReader.ReadToEnd();
            }

            return result;
            //return httpResponse.GetResponseStream();
        }

        private void AddCookies(ref HttpWebRequest httpWebRequest)
        {
            httpWebRequest.CookieContainer = new CookieContainer();
            foreach (Cookie cookie in cookies)
            {
                httpWebRequest.CookieContainer.Add(cookie);
            }
        }

        private async Task<string> ProcessApiPost(string urlParams, object postBody)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(this.API_PATH + urlParams);
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            if (!(jwtToken != "" || jwtToken != null))
            {
                httpWebRequest.PreAuthenticate = true;
                httpWebRequest.Headers.Add("Authorization", "Bearer " + jwtToken);
            }


            this.AddCookies(ref httpWebRequest);

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string jsonString = System.Text.Json.JsonSerializer.Serialize(postBody);
                streamWriter.Write(jsonString);
            }

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();

            if (httpResponse.Headers.AllKeys.Contains("Set-Cookie"))
            {
                string[] token = httpResponse.Headers["Set-Cookie"].Split('=');
                cookies.Add(new Cookie(token[0], token[1].Split(';')[0], "/", "localhost"));
            }

            string result;
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {

                result = streamReader.ReadToEnd();
            }
            return result;
            //return httpResponse.GetResponseStream();
        }

    }
}
