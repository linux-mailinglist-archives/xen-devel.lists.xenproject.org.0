Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6B2B4993
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28487.57581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegc3-0005R5-OP; Mon, 16 Nov 2020 15:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28487.57581; Mon, 16 Nov 2020 15:40:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegc3-0005Qg-Kp; Mon, 16 Nov 2020 15:40:15 +0000
Received: by outflank-mailman (input) for mailman id 28487;
 Mon, 16 Nov 2020 15:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5kkY=EW=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1kegc2-0005Qb-3W
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:40:14 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 755abfd4-ebea-4ac9-8a7d-5c4968dbd515;
 Mon, 16 Nov 2020 15:40:12 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id i18so16365855ioa.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 07:40:12 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id i82sm10491839ill.84.2020.11.16.07.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 07:40:11 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5kkY=EW=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
	id 1kegc2-0005Qb-3W
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:40:14 +0000
X-Inumbo-ID: 755abfd4-ebea-4ac9-8a7d-5c4968dbd515
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 755abfd4-ebea-4ac9-8a7d-5c4968dbd515;
	Mon, 16 Nov 2020 15:40:12 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id i18so16365855ioa.3
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tp0p5PHbr2FkOYp8vx6enMy9SJ7npMGO8ToOlTZAVD0=;
        b=vJHuCgkLtyaYNtKWJGKWTC2HAaX7Y9m8y1VpqDKgvUWa8d0I51VY3ALJeXJtOlsGpr
         QzxZZWfSIBe9Z9YJVgCkUF04iuHI0uFspV4JwGcoTFtYktgjnY7A8CRm243mremkxSFW
         /W8ZuC0hXxmoHn+ezTFvYhGe2XU1ttQu6xlHRIQZSFb9V/9nguKyH01uIZBsQIBla1sm
         kSpCVk0QJdWteogX0XEWe3MJV6jr1Lh++tWh99mrFKS4zYsaeRBflt08zg4X1OBFoLaD
         OZKwfBprL/CxXZIUp5e8ounGHLLXOFSswyyzQU1smV5YfKh+taZ0KanaNv47asHmejvk
         eLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tp0p5PHbr2FkOYp8vx6enMy9SJ7npMGO8ToOlTZAVD0=;
        b=IJpNW+WFfsoTs9/l43YyOM23NRFFM8kjIJA/IA03D7syNcpcmXQ9Rf5Q/jdzq3ehCq
         dl16qKylbMM9+3SGFUg4eZA8c4D5/P/Kf/6NRzLtHPtZ4/rVlIawHhNQ6GPj32jFoe7h
         h2+Hwlbb8dAO4IP5n4ToABN1qGcXkG/QqDQWFykmNy6KaoGwAAN8EASm6IKSXMZGFcKx
         Z8g+XugkrtapArBXsgku3jJor/6VY2cfLFKA3d11uvwbypbv6kmsx1gqA50++Vtwhodk
         0NwJZ3fgiUDVIA4mnHVPoLqVya/TPowOx5hh6rkOuVzMBJzAHtOjXlP4muDbBaZSzWQM
         rfiQ==
X-Gm-Message-State: AOAM532pfO3XcoJjz6Z8p+4sLs+hvNZ6UmY5RNUYaL1AifojcN48kh70
	xVE9Tg4BbZdq6B84wr4qW2sONA==
X-Google-Smtp-Source: ABdhPJzORiPywjBgXN2NzytHbmvXHQyepXDfzUWSZfRzXJXzcmliMaw8xrhzAaFsEhdxvHHHShuK7g==
X-Received: by 2002:a5e:9e0b:: with SMTP id i11mr3534187ioq.33.1605541212314;
        Mon, 16 Nov 2020 07:40:12 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id i82sm10491839ill.84.2020.11.16.07.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 07:40:11 -0800 (PST)
Subject: Re: cleanup updating the size of block devices v3
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <506876ff-65b0-7610-6f9e-8228fcd201c8@kernel.dk>
Date: Mon, 16 Nov 2020 08:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/20 7:56 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series builds on top of the work that went into the last merge window,
> and make sure we have a single coherent interfac for updating the size of a
> block device.
> 
> Changes since v2:
>  - rebased to the set_capacity_revalidate_and_notify in mainline
>  - keep the loop_set_size function
>  - fix two mixed up acks

Applied 1-23 for 5.11, thanks.

-- 
Jens Axboe


