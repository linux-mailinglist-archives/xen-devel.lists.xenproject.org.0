Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE819939580
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762380.1172552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0cO-0001Uu-FF; Mon, 22 Jul 2024 21:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762380.1172552; Mon, 22 Jul 2024 21:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0cO-0001T8-CS; Mon, 22 Jul 2024 21:30:52 +0000
Received: by outflank-mailman (input) for mailman id 762380;
 Mon, 22 Jul 2024 21:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0cN-00019C-5l
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:30:51 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8bdc70e-4871-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 23:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 1077FA02D3;
 Mon, 22 Jul 2024 23:30:47 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3I1mg7LgkGu; Mon, 22 Jul 2024 23:30:46 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id E9A85A02CA;
 Mon, 22 Jul 2024 23:30:46 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0cI-0000000Aa9g-2KYE; Mon, 22 Jul 2024 23:30:46 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a8bdc70e-4871-11ef-8776-851b0ebba9a2
Date: Mon, 22 Jul 2024 23:30:46 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/4] mini-os: mm: remove not needed struct chunk_tail_st
Message-ID: <20240722213046.3or2tuaipgggxyp4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722150141.31391-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 17:01:39 +0200, a ecrit:
> The struct chunk_tail_st isn't really used other than writing to it.
> 
> Remove it in order to simplify the code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  mm.c | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/mm.c b/mm.c
> index 1dcd954c..2cc49e94 100644
> --- a/mm.c
> +++ b/mm.c
> @@ -123,7 +123,6 @@ static void map_free(unsigned long first_page, unsigned long nr_pages)
>  /* BINARY BUDDY ALLOCATOR */
>  
>  typedef struct chunk_head_st chunk_head_t;
> -typedef struct chunk_tail_st chunk_tail_t;
>  
>  struct chunk_head_st {
>      chunk_head_t  *next;
> @@ -131,10 +130,6 @@ struct chunk_head_st {
>      int            level;
>  };
>  
> -struct chunk_tail_st {
> -    int level;
> -};
> -
>  /* Linked lists of free chunks of different powers-of-two in size. */
>  #define FREELIST_SIZE ((sizeof(void *) << 3) - PAGE_SHIFT)
>  static chunk_head_t *free_head[FREELIST_SIZE];
> @@ -151,7 +146,6 @@ static void init_page_allocator(unsigned long min, unsigned long max)
>      unsigned long range;
>      unsigned long r_min, r_max;
>      chunk_head_t *ch;
> -    chunk_tail_t *ct;
>  
>      printk("MM: Initialise page allocator for %lx(%lx)-%lx(%lx)\n",
>             (u_long)to_virt(min), min, (u_long)to_virt(max), max);
> @@ -215,14 +209,12 @@ static void init_page_allocator(unsigned long min, unsigned long max)
>              ch = (chunk_head_t *)r_min;
>              r_min += 1UL << i;
>              range -= 1UL << i;
> -            ct = (chunk_tail_t *)r_min - 1;
>              i -= PAGE_SHIFT;
>              ch->level       = i;
>              ch->next        = free_head[i];
>              ch->pprev       = &free_head[i];
>              ch->next->pprev = &ch->next;
>              free_head[i]    = ch;
> -            ct->level       = i;
>          }
>      }
>  
> @@ -234,7 +226,6 @@ unsigned long alloc_pages(int order)
>  {
>      int i;
>      chunk_head_t *alloc_ch, *spare_ch;
> -    chunk_tail_t            *spare_ct;
>  
>      if ( !chk_free_pages(1UL << order) )
>          goto no_memory;
> @@ -261,14 +252,11 @@ unsigned long alloc_pages(int order)
>          i--;
>          spare_ch = (chunk_head_t *)((char *)alloc_ch +
>                                      (1UL << (i + PAGE_SHIFT)));
> -        spare_ct = (chunk_tail_t *)((char *)spare_ch +
> -                                    (1UL << (i + PAGE_SHIFT))) - 1;
>  
>          /* Create new header for spare chunk. */
>          spare_ch->level = i;
>          spare_ch->next  = free_head[i];
>          spare_ch->pprev = &free_head[i];
> -        spare_ct->level = i;
>  
>          /* Link in the spare chunk. */
>          spare_ch->next->pprev = &spare_ch->next;
> @@ -289,7 +277,6 @@ EXPORT_SYMBOL(alloc_pages);
>  void free_pages(void *pointer, int order)
>  {
>      chunk_head_t *freed_ch, *to_merge_ch;
> -    chunk_tail_t *freed_ct;
>      unsigned long mask;
>  
>      /* First free the chunk */
> @@ -297,8 +284,6 @@ void free_pages(void *pointer, int order)
>  
>      /* Create free chunk */
>      freed_ch = (chunk_head_t *)pointer;
> -    freed_ct = (chunk_tail_t *)((char *)pointer +
> -                                (1UL << (order + PAGE_SHIFT))) - 1;
>  
>      /* Now, possibly we can conseal chunks together */
>      while ( order < FREELIST_SIZE )
> @@ -320,9 +305,6 @@ void free_pages(void *pointer, int order)
>              if ( allocated_in_map(virt_to_pfn(to_merge_ch)) ||
>                   to_merge_ch->level != order )
>                  break;
> -
> -            /* Merge with successor */
> -            freed_ct = (chunk_tail_t *)((char *)to_merge_ch + mask) - 1;
>          }
>  
>          /* We are committed to merging, unlink the chunk */
> @@ -336,8 +318,6 @@ void free_pages(void *pointer, int order)
>      freed_ch->level = order;
>      freed_ch->next  = free_head[order];
>      freed_ch->pprev = &free_head[order];
> -    freed_ct->level = order;
> -
>      freed_ch->next->pprev = &freed_ch->next;
>      free_head[order] = freed_ch;
>  
> -- 
> 2.43.0
> 

-- 
Samuel
/*
 * [...] Note that 120 sec is defined in the protocol as the maximum
 * possible RTT.  I guess we'll have to use something other than TCP
 * to talk to the University of Mars.
 * PAWS allows us longer timeouts and large windows, so once implemented
 * ftp to mars will work nicely.
 */
(from /usr/src/linux/net/inet/tcp.c, concerning RTT [retransmission timeout])

