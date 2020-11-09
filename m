Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDF2ACEE0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 06:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22831.49536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcLz3-0006j3-NL; Tue, 10 Nov 2020 05:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22831.49536; Tue, 10 Nov 2020 05:14:21 +0000
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
	id 1kcLz3-0006ie-Jp; Tue, 10 Nov 2020 05:14:21 +0000
Received: by outflank-mailman (input) for mailman id 22831;
 Mon, 09 Nov 2020 18:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/yET=EP=toxicpanda.com=josef@srs-us1.protection.inumbo.net>)
 id 1kcBa9-0001u5-HZ
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:07:57 +0000
Received: from mail-qt1-x831.google.com (unknown [2607:f8b0:4864:20::831])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d17f325-28b7-460b-a0fb-c09e3ea6acab;
 Mon, 09 Nov 2020 18:07:56 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id t5so6649800qtp.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 10:07:56 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
 [174.109.172.136])
 by smtp.gmail.com with ESMTPSA id z2sm6588768qkl.22.2020.11.09.10.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 10:07:55 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/yET=EP=toxicpanda.com=josef@srs-us1.protection.inumbo.net>)
	id 1kcBa9-0001u5-HZ
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:07:57 +0000
X-Inumbo-ID: 9d17f325-28b7-460b-a0fb-c09e3ea6acab
Received: from mail-qt1-x831.google.com (unknown [2607:f8b0:4864:20::831])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d17f325-28b7-460b-a0fb-c09e3ea6acab;
	Mon, 09 Nov 2020 18:07:56 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id t5so6649800qtp.2
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7NGOsjZERbiE5w2MHC1mFU2jxp4Wb+n3njEEiJYjdrs=;
        b=O4/l9OEaWnaVVx9mA/+hODfmoKgGQIEUNKB0HmUGrD+LhRciIQAcMV79vjoQi/4L15
         CDVLebLFqwtrXUj2MValkzQKsvuvZ+bIj/HDHunVOXdD5rmqC2zDcm6G2ntA+MvXnqhC
         vTEl8uxCxkWixlkEepU/54lrdZYMGD0U3koL7aiUg0SUzZXfN7ZexvE/u58j8exqrb0L
         /O1jcvVnjraSt/kGOG4mDP8TkZHx3MoMGZRLY1X+es3rUicc6WotFmSs08rTBby/Yuep
         Z7z6vRhPWjHEqJ+TL+UexVhcPZExA43AO0zs4xR+XnsHWVoRk8SDKKD+pe0DirmCEgT1
         wWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7NGOsjZERbiE5w2MHC1mFU2jxp4Wb+n3njEEiJYjdrs=;
        b=nplbdFEP/ss5c3919zFbgqeuJLyZMVs8QYB4/Ds/+hl+YjHb9REtC+tqNa3ZFSO5eL
         XVObDdAOkthYPkb4nlv3IOfECsHLxoCG2XjWX1WxRotIIIMeYKC/DKvDzLJv8+Spe2St
         35FQ2zNMLvGExXmC1G0/ErFySdv8EWfrsXVb81A5NV72HF8GQyyqoutelggQPUSNpC2/
         Zu/WIP4xRbw29RYolXF+TvkF8ygBrcaplsI3COpnVw1USxQeKO+2ksGgmcZ24f2KmeGX
         qQ9hrlBEMC9p/ZomvSpP84fwaDIFqNLDBzEyjzL7rqFoz15ErBU2t5lpHBgTzTNQDyCt
         Bfug==
X-Gm-Message-State: AOAM533enl4CQpapjhaUS6xFhpWpMqsS8jd+5bcp02rzT/0Ev3avo248
	l1kbCbz4IcsROd1ilXJWRmLz4w==
X-Google-Smtp-Source: ABdhPJz1XdtisV/lRv5ASDEyKBu7yVqtI15E3NOcCNcW+bkgomAeHWz+gX9FyFOWQktTiYmlqxOYiw==
X-Received: by 2002:aed:3147:: with SMTP id 65mr14719130qtg.295.1604945276157;
        Mon, 09 Nov 2020 10:07:56 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id z2sm6588768qkl.22.2020.11.09.10.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 10:07:55 -0800 (PST)
Subject: Re: cleanup updating the size of block devices
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Ilya Dryomov <idryomov@gmail.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
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
References: <20201106190337.1973127-1-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <7ddd60ce-f588-028f-7e47-2df4d52e22d5@toxicpanda.com>
Date: Mon, 9 Nov 2020 13:07:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/6/20 2:03 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series builds on top of the work that went into the last merge window,
> and make sure we have a single coherent interfac for updating the size of a
> block device.
> 

You can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

for the nbd bits, thanks,

Josef

