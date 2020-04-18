﻿using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Sample.Core.Common
{
    public interface IApplicationDbContext
    {
        DbSet<T> Set<T>() where T : class;
        Task<int> SaveChangesAsync(CancellationToken cancellationToken);

    }
}