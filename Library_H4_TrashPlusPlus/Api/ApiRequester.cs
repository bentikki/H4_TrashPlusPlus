using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Api
{
    public class ApiRequester
    {
        private readonly string API_PATH;
        private readonly int TIMEOUT_WAIT = 10000;
        private readonly HttpClient client = new HttpClient();

        public ApiRequester(string api_path)
        {
            this.API_PATH = api_path;
        }

        public T GetApi<T>(string apiUrlParam)
        {
            var streamTask = this.ProcessApiGet(apiUrlParam).Result;
            return System.Text.Json.JsonSerializer.DeserializeAsync<T>(streamTask).Result;
        }

        public T PostApi<T>(string apiUrlParam, object postBody)
        {
            var streamTask = this.ProcessApiPost(apiUrlParam, postBody).Result;
            return System.Text.Json.JsonSerializer.DeserializeAsync<T>(streamTask).Result;
        }

        private async Task<System.IO.Stream> ProcessApiGet(string urlParams)
        {
            client.DefaultRequestHeaders.Accept.Clear();


            CancellationTokenSource cancellationToken = new CancellationTokenSource();

            try
            {
                cancellationToken.CancelAfter(this.TIMEOUT_WAIT);

                var streamTask = client.GetStreamAsync(this.API_PATH + urlParams);

                return await streamTask;
            }
            catch (System.Net.Http.HttpRequestException e)
            {
                throw new HttpRequestException("Could not connect to API. Site could not be reached", e);
            }
            catch (TaskCanceledException e)
            {
                throw new TaskCanceledException("Could not connect to API. The request timed out.", e);
            }
            catch (Exception e)
            {
                throw new Exception("Could not connect to API. An unexpected error occured.", e);

            }
            finally
            {
                cancellationToken.Dispose();
            }
        }



        private async Task<Stream> ProcessApiPost(string urlParams, object postBody)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(this.API_PATH + urlParams);
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string jsonString = System.Text.Json.JsonSerializer.Serialize(postBody);
                streamWriter.Write(jsonString);
            }

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();

            return httpResponse.GetResponseStream();
            //using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            //{
                
            //    var result = streamReader.ReadToEnd();
            //    return result;
            //}
        }

    }
}
