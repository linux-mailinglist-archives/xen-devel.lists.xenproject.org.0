Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD74E4F65
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 10:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293823.499274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWxJD-0000bS-DF; Wed, 23 Mar 2022 09:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293823.499274; Wed, 23 Mar 2022 09:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWxJD-0000YL-A4; Wed, 23 Mar 2022 09:29:39 +0000
Received: by outflank-mailman (input) for mailman id 293823;
 Wed, 23 Mar 2022 09:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jiN7=UC=gmail.com=konishi.ryusuke@srs-se1.protection.inumbo.net>)
 id 1nWxJB-0000YF-3F
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 09:29:37 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf63a3af-aa8b-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 10:29:33 +0100 (CET)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e612af95e3so9923257b3.9
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 02:29:36 -0700 (PDT)
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
X-Inumbo-ID: bf63a3af-aa8b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RTdntLwWP7UcoqdxIbtO2gBEwkCYFZ/lgUjrNqmrzxY=;
        b=T61hvAd7cJiSJIGmZk3tv26qPToF8HN5U/lQ/m08EAvWa2SmtE6To2nDTNf374lnhT
         GPKcxTCuuPtJXa5gmEw+gX2f1CnhO+VLeiTWr2XmuaL6dVuTtvBLqYJtSXHPPzFlHs5d
         Ri/6Ne7YUODQm8T3VMLlOYE4KOjFASZnLeZ8IqhaE9iuhu7q9KNKFvXczv/h7Sgwfpuk
         P+Ovst/9RkkokTnzdrENQ2gJQlJX7TsW9sSFizNo9ppyZqVHj+5ghhwpu4GTzkQKNuQt
         kjsxCrJT+nOf4qUF+msiy+R5Tj/zMWQPy3RSPf7HIGYLtyZhwIakdPpQAIpFcLhlFiZB
         DguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTdntLwWP7UcoqdxIbtO2gBEwkCYFZ/lgUjrNqmrzxY=;
        b=fHSl2MMQP/xuZKZa5cywYsVViVgtq24NzIXq9LrCzQbeKWmPYRG1vTartNRbz3f0vO
         dbiA2jM+cgBhK4YXV9FQiLvBG0rLEE7IiaEdPXbVcQe5fb+9wroJaNzeWs2bXOoT3KpJ
         5Ln8E3z34ba1tYRFD4ePCFUn6hyI3VCtW/0cz0JWHLzYmaU7w5GZzMAQOzcpg1D8H1nK
         Z99Knrxt9sxUv/FQbQ9z00+TYTtqz1wKwKp7UzVOStX0Xzn0MjXlqsW6J2LLujiVLGUK
         tdW9ZV/I4BAnd0NLBA18pDQPjy86YnzsI/qoJrA6EaYBSdlx3AXvkGYV9YZOEbP64e7l
         C+PA==
X-Gm-Message-State: AOAM530gr0hyqXXPZH/zYVCxEuurYIm/ACSowtQT0t6T2nvr8REb01HB
	HDnx7NIp63weXFyWXaDW4U/voZjVDrnxsMjetLQ=
X-Google-Smtp-Source: ABdhPJxsStnlEm2/XrSzPGOBMOTw5PlnKDFjWTj/c9kKouVbhUo8itraPrOCZBSFmdgor+QYZSqQ1SYIOcVDz/aGNlE=
X-Received: by 2002:a0d:c284:0:b0:2dc:37ec:f02c with SMTP id
 e126-20020a0dc284000000b002dc37ecf02cmr33701891ywd.503.1648027774854; Wed, 23
 Mar 2022 02:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de> <20220124091107.642561-2-hch@lst.de>
 <20220322211915.GA2413063@roeck-us.net> <CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
 <20220323064248.GA24874@lst.de>
In-Reply-To: <20220323064248.GA24874@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 23 Mar 2022 18:29:23 +0900
Message-ID: <CAKFNMonANUN7_99oVBOq=iCJpt6jQs3qhu1ez5SwMm2g7sZUyw@mail.gmail.com>
Subject: Re: [dm-devel] [PATCH 01/19] fs: remove mpage_alloc
To: Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, Mike Snitzer <snitzer@redhat.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>, 
	device-mapper development <dm-devel@redhat.com>, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-fsdevel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, 
	ntfs3@lists.linux.dev, Jack Wang <jinpu.wang@ionos.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 23, 2022 at 3:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Mar 23, 2022 at 06:38:22AM +0900, Ryusuke Konishi wrote:
> > This looks because the mask of GFP_KERNEL is removed along with
> > the removal of mpage_alloc().
> >
>
> > The default value of the gfp flag is set to GFP_HIGHUSER_MOVABLE by
> > inode_init_always().
> > So, __GFP_HIGHMEM hits the gfp warning at bio_alloc() that
> > do_mpage_readpage() calls.
>
> Yeah.  Let's try this to match the iomap code:
>
> diff --git a/fs/mpage.c b/fs/mpage.c
> index 9ed1e58e8d70b..d465883edf719 100644
> --- a/fs/mpage.c
> +++ b/fs/mpage.c
> @@ -148,13 +148,11 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
>         int op = REQ_OP_READ;
>         unsigned nblocks;
>         unsigned relative_block;
> -       gfp_t gfp;
> +       gfp_t gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
>
>         if (args->is_readahead) {
>                 op |= REQ_RAHEAD;
> -               gfp = readahead_gfp_mask(page->mapping);
> -       } else {
> -               gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
> +               gfp |= __GFP_NORETRY | __GFP_NOWARN;
>         }
>
>         if (page_has_buffers(page))

I did not test for iomap, but this patch has fixed the same regression on the
latest mainline at least for ext2, exfat, vfat and nilfs2.  Thanks!

Ryusuke Konishi

