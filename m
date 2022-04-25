Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4750EB0F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 23:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313275.530786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj5wh-0006LW-Gh; Mon, 25 Apr 2022 21:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313275.530786; Mon, 25 Apr 2022 21:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj5wh-0006JG-DB; Mon, 25 Apr 2022 21:08:35 +0000
Received: by outflank-mailman (input) for mailman id 313275;
 Mon, 25 Apr 2022 21:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=32Y1=VD=kernel.org=song@srs-se1.protection.inumbo.net>)
 id 1nj5wg-0006JA-Nr
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 21:08:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc6000d7-c4db-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 23:08:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 222AF61348
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 21:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AADC385B8
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 21:08:30 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2f7b90e8b37so84988497b3.6
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 14:08:30 -0700 (PDT)
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
X-Inumbo-ID: dc6000d7-c4db-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650920910;
	bh=yN2FFsgqiwWmpQIWXC94b82E2wpYjQTq/CU/u3g3cjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pdKHj+9jtFEKRxbFIKbp6BN5W0SKHdhPUGdQDXd7Xqx9vi4EpkMV1Y4FokX/IkPYa
	 fcHGk/4On2XWYf3uADhfEsr+7LxnZ49Mj82N7KMHrZLd/dwLJ08US+RaehkUasA6/k
	 ULzEmN8W11D5KZ+Cm4S93JoYXPgu2ne6zBKyDbG+PP7TNy6nKJUI/Prlkq4aTHvM+N
	 eDTgN5VZZLATieGxC8vMqcHVTHdQIL63mmQQGdiCPeBj+cARAR4cnGnqJ35UI9ZFbn
	 uSL8Ys/PCGOp1a6uCJDJdZhN6mhZ0J51T+/xZ6Bj+aFJUo7nkxoRQiwNXWKGnT6ByK
	 ZiFdXEcFhWfZg==
X-Gm-Message-State: AOAM533ZNvMSDVeVcgUasI0FfLdbIDXzqaB4J4huqrStbgYMvlZ3OTGN
	SvK/O6RWF7hAdy2copdUj1kU41jFQqtNb+VytBk=
X-Google-Smtp-Source: ABdhPJxgUnh58spmwdi5KGXzmrzAEx/WM60nf6Oi6YSWPgwfZEJsfaGjWIDBRUKlPyettQyT9R0PC00gVw9kzJ9ffYQ=
X-Received: by 2002:a0d:e343:0:b0:2f7:cefb:577b with SMTP id
 m64-20020a0de343000000b002f7cefb577bmr9909411ywe.472.1650920909604; Mon, 25
 Apr 2022 14:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220418045314.360785-1-hch@lst.de> <20220418045314.360785-7-hch@lst.de>
In-Reply-To: <20220418045314.360785-7-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Mon, 25 Apr 2022 14:08:18 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7fpiAqAf+U491dTH4mWORZQCxfyT6zWQwN=4r5WJ429Q@mail.gmail.com>
Message-ID: <CAPhsuW7fpiAqAf+U491dTH4mWORZQCxfyT6zWQwN=4r5WJ429Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] raid5: don't set the discard_alignment queue limit
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@kernel.org>, Stefan Haberland <sth@linux.ibm.com>, 
	Jan Hoeppner <hoeppner@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-raid <linux-raid@vger.kernel.org>, 
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org, 
	dm-devel@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 17, 2022 at 9:53 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The discard_alignment queue limit is named a bit misleading means the
> offset into the block device at which the discard granularity starts.
> Setting it to the discard granularity as done by raid5 is mostly
> harmless but also useless.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/raid5.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 59f91e392a2ae..39b0afdf40d0a 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -7749,7 +7749,6 @@ static int raid5_run(struct mddev *mddev)
>                  */
>                 stripe = stripe * PAGE_SIZE;
>                 stripe = roundup_pow_of_two(stripe);
> -               mddev->queue->limits.discard_alignment = stripe;
>                 mddev->queue->limits.discard_granularity = stripe;
>
>                 blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
> --
> 2.30.2
>

