Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3639A4B7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 17:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136481.253032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lopPX-0006ii-5e; Thu, 03 Jun 2021 15:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136481.253032; Thu, 03 Jun 2021 15:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lopPX-0006gM-1U; Thu, 03 Jun 2021 15:37:31 +0000
Received: by outflank-mailman (input) for mailman id 136481;
 Thu, 03 Jun 2021 15:37:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=012H=K5=linaro.org=ulf.hansson@srs-us1.protection.inumbo.net>)
 id 1lopPW-00065X-21
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 15:37:30 +0000
Received: from mail-ua1-x933.google.com (unknown [2607:f8b0:4864:20::933])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12a9bbe6-fa12-4fa4-849d-5f39f80d9427;
 Thu, 03 Jun 2021 15:37:23 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id l12so3566083uai.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 08:37:23 -0700 (PDT)
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
X-Inumbo-ID: 12a9bbe6-fa12-4fa4-849d-5f39f80d9427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DKVf+GiS9951bpd4cfEBh88PiRutTQ//wVEud26id8=;
        b=XGhrfqnzBbfnTVSNkFDv5GHmpnKX09udhfIYlIGvsHf5udWupM3hEeaCuAp1/iGcK2
         itxazCeDLeGnN0Ew9V7mjQKrXGASjKXLT43xef2dS4qB5N1wZq329ew5d1FZXKKcqiVw
         6FD/vr0CrXQkvA5Vx5CUZuiBjtgVFz1ZbiUU7kgR3MEWuPhMcO948V0XjU30zv2QSu9a
         tohz+jrjUWOtrbk55SyLep3Y8Ie2TFo0EIpc+U1g5ZdabSEhCf2ga/7pzz9IJem82LbC
         xz7dKg0/t3XaDdcBysnSaVg/DwjADlBkyj4crHUSmvNFlYRf/JXspkWoLbMUskTXooPD
         5/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DKVf+GiS9951bpd4cfEBh88PiRutTQ//wVEud26id8=;
        b=UJYmgyV+pUzWi9x60Lg0CW2CI0CPL1mQhsejmwHyePUEjvkLsMPfava57X9Ld1la4F
         MGkHJENRW17/iXiAsx6C2AnSGW/mHKIgopYarUnTTCOmrlkjf+EpSHl4okbsVHvqR1pW
         tb3wvPdaIOVPb7Cqa/f6MBAugDHle2wBHDPCH+25cBEj0v42vvTq5fEukcSoo+gbar0p
         7ZcvM7wPW9wQ+CqC/2YVqvj4VUGPQQrx+cpi1DHS7fxJIaKGJdnjurPKk2KyOowu9kaY
         2wdWb7S1dUKGnrDDrNbjEfyfuVxR6XWdtn3Se29cHr4AfWvBTASfvmM13ZSKBxtK3D+g
         wvxw==
X-Gm-Message-State: AOAM533F4JzJT89LO6R78ro5HUni8LDnQqXYmb9klIWHH5l8AYr2yE3n
	dBRaeNTyC+jS2UVENSaziTbOB2ONM+q/BvHnbWSINw==
X-Google-Smtp-Source: ABdhPJyc/MDglzj7ZqHuKLnfpO6vVPHNJJJjAhghObYaMjdvGQtxzeGy+jhwPjnJIpGZowWwyMtWi1MuD2fSyYUnfEo=
X-Received: by 2002:ab0:7c5b:: with SMTP id d27mr407242uaw.15.1622734642855;
 Thu, 03 Jun 2021 08:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de> <20210602065345.355274-9-hch@lst.de>
In-Reply-To: <20210602065345.355274-9-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jun 2021 17:36:45 +0200
Message-ID: <CAPDyKFoh6HKx2rHHRXvw--Ou53TR2wLFGrKCDuetigxQ8QbvfQ@mail.gmail.com>
Subject: Re: [PATCH 08/30] mspro: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, 
	Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com, 
	linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jun 2021 at 08:54, Christoph Hellwig <hch@lst.de> wrote:
>
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/memstick/core/mspro_block.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
> index cf7fe0d58ee7..22778d0e24f5 100644
> --- a/drivers/memstick/core/mspro_block.c
> +++ b/drivers/memstick/core/mspro_block.c
> @@ -1205,21 +1205,17 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>         if (disk_id < 0)
>                 return disk_id;
>
> -       msb->disk = alloc_disk(1 << MSPRO_BLOCK_PART_SHIFT);
> -       if (!msb->disk) {
> -               rc = -ENOMEM;
> +       rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &mspro_mq_ops, 2,
> +                                    BLK_MQ_F_SHOULD_MERGE);
> +       if (rc)
>                 goto out_release_id;
> -       }
>
> -       msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &mspro_mq_ops, 2,
> -                                               BLK_MQ_F_SHOULD_MERGE);
> -       if (IS_ERR(msb->queue)) {
> -               rc = PTR_ERR(msb->queue);
> -               msb->queue = NULL;
> -               goto out_put_disk;
> +       msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
> +       if (IS_ERR(msb->disk)) {
> +               rc = PTR_ERR(msb->disk);
> +               goto out_free_tag_set;
>         }
> -
> -       msb->queue->queuedata = card;
> +       msb->queue = msb->disk->queue;
>
>         blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
>         blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
> @@ -1228,10 +1224,10 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>
>         msb->disk->major = major;
>         msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
> +       msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
>         msb->disk->fops = &ms_block_bdops;
>         msb->usage_count = 1;
>         msb->disk->private_data = msb;
> -       msb->disk->queue = msb->queue;
>
>         sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
>
> @@ -1247,8 +1243,8 @@ static int mspro_block_init_disk(struct memstick_dev *card)
>         msb->active = 1;
>         return 0;
>
> -out_put_disk:
> -       put_disk(msb->disk);
> +out_free_tag_set:
> +       blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
>         mutex_lock(&mspro_block_disk_lock);
>         idr_remove(&mspro_block_disk_idr, disk_id);
> --
> 2.30.2
>

