Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F1805AAB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 18:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648146.1012203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYpz-0007RB-M7; Tue, 05 Dec 2023 17:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648146.1012203; Tue, 05 Dec 2023 17:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYpz-0007PC-Ir; Tue, 05 Dec 2023 17:03:59 +0000
Received: by outflank-mailman (input) for mailman id 648146;
 Tue, 05 Dec 2023 17:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZseQ=HQ=gmail.com=bart.vanassche@srs-se1.protection.inumbo.net>)
 id 1rAYpx-0007Nv-Ic
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 17:03:57 +0000
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46004397-9390-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 18:03:56 +0100 (CET)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-58d9a4e9464so2495521eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 09:03:56 -0800 (PST)
Received: from [172.20.2.177] (rrcs-173-197-90-226.west.biz.rr.com.
 [173.197.90.226]) by smtp.gmail.com with ESMTPSA id
 s25-20020a639259000000b00578afd8e012sm5146562pgn.92.2023.12.05.09.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 09:03:54 -0800 (PST)
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
X-Inumbo-ID: 46004397-9390-11ee-98e5-6d05b1d4d9a1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701795835; x=1702400635;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Kxt6CKccKyM2aD5KqaYbJ+5NRAtsSu20TdTe87tfro=;
        b=Bdbf//CfjFlBq1PTy6Ibkt6e+wPhM9h7opL2oVbEi7Wsd0H9no0HojWN9W7AtgVL9G
         ry5g7oCKgOsDUcuQVIbH3iucZmD5BaF3ke0L3wBWI+xGYc0Up1MErE+7i9LxYZ223wQD
         NMAhnaAvgxD19tQoVt8eGEbTtvFW44xjZMmGA1NIuTV7Z6wCr+0LOg4pxRIVL0Bz4DIj
         WYSWNbodi2HnAgAAFRXUORs3z80S9wS1ymttApW71ROB4l6fhYpDHVxdeE+VtawqKYYJ
         PNWlYu5ziHpLf4MHNkztu1Ko21D7lhf/r4BLzIhSrneQhX5pZItBCthPEim8xdF3QsTc
         vmrA==
X-Gm-Message-State: AOJu0YzR57EDnI8SqMGGhukqsxUXEcBzfwqAFAdSBjbvNWq0xMAkhqNh
	BcDjJwcvlJNw9LQL6g0Y5Aw=
X-Google-Smtp-Source: AGHT+IHREsBDTR/fguPuUAOPGrQJFqdX7+L934/9nqEfo9v3T6jgbM8x1qOuTAd7fOfx1S8tYfwMzA==
X-Received: by 2002:a05:6358:6f95:b0:16e:43a1:6881 with SMTP id s21-20020a0563586f9500b0016e43a16881mr2252180rwn.26.1701795834695;
        Tue, 05 Dec 2023 09:03:54 -0800 (PST)
Message-ID: <189fa9b2-bcc8-4839-ac04-33a29bba9aaa@acm.org>
Date: Tue, 5 Dec 2023 09:03:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Content-Language: en-US
To: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 hare@suse.de, p.raghav@samsung.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
 yangerkun@huawei.com
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231205123728.1866699-2-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 04:37, Yu Kuai wrote:
> +static inline u8 block_bits(struct block_device *bdev)
> +{
> +	return bdev->bd_inode->i_blkbits;
> +}

This function needs a name that's more descriptive.

Thanks,

Bart.

