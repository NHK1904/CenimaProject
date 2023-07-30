using PRNFinalProject.Data;
using PRNFinalProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PRNFinalProject.Logics
{
    public class GenreManager
    {
        public List<Genre> GetAllGenres()
        {
            using (var context = new CenimaDBContext())
            {
                return context.Genres.ToList();
            }
        }
        public Genre GetGenresById(int id)
        {
            using (var context = new CenimaDBContext())
            {
                return context.Genres.Where(g => g.GenreId == id).FirstOrDefault();
            }
        }
        public void DeleteGenre(int id)
        {
            List<Genre> genres = new List<Genre>();
            List<Movie> movie = new List<Movie>();
            using (var context = new CenimaDBContext())
            {

                movie = context.Movies.Where(x => x.GenreId == id).ToList();
                if (movie.Count > 0)
                {
                    context.SaveChanges();

                }
                else
                {
                    genres = context.Genres.Where(x => x.GenreId == id).ToList();
                    if (genres.Count > 0)
                    {
                        context.Genres.RemoveRange(genres);
                    }
                    context.SaveChanges();
                }
                

                
            }
        }

    }
}
