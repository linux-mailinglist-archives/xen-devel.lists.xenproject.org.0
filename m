Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C2504D68
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 10:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306996.522227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMJs-00056B-H7; Mon, 18 Apr 2022 08:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306996.522227; Mon, 18 Apr 2022 08:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMJs-00053g-Dn; Mon, 18 Apr 2022 08:01:12 +0000
Received: by outflank-mailman (input) for mailman id 306996;
 Mon, 18 Apr 2022 08:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOmA=U4=opensource.wdc.com=prvs=10001294c=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1ngMJr-0004cS-Cs
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 08:01:11 +0000
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b2543f-beed-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 10:01:09 +0200 (CEST)
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:01:06 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 00:31:27 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 01:01:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfWk35dFz1SVp4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 01:01:06 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id bb1julzUhVc3 for <xen-devel@lists.xenproject.org>;
 Mon, 18 Apr 2022 01:01:05 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfWd1wHlz1Rvlx;
 Mon, 18 Apr 2022 01:01:01 -0700 (PDT)
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
X-Inumbo-ID: b3b2543f-beed-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650268869; x=1681804869;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3/KeY74fCa89/HKmeQeN7bAvF9g3Fcpr0R9Z+15MzFA=;
  b=n3VUvakaw7u3ZLZBeVEpaOvi+Kn8121F2/n6FX023+B8RaAGfVaF0fXQ
   N34pdiutwzL6az2zVCDYIj3hQpxl2hGGa1dLED/RuGaB7rU5c5um9Pgxr
   2UwNGqUfZfJN21r86IXAZBg2E+K/XmLGINFkt1woms3U2zAmJ+u3qEkOk
   k1b0bZA/efGvbT2lpxzLsmainMQkMGoUKuoDwECbjTE/7xImw3X7o/aGC
   tPg60J21kEmukKrYqYJSOyaajwcPsutNTrsy531MZbwYZn6h2tewlkr3g
   5UO+tzh86RaaPWMtEM/dwzEnDKY8guZTnecWSlyPoMyODPJhVNbE0nxCi
   g==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="302341556"
IronPort-SDR: FSK+niTIVWPIyQbKdZR9DcXH2NU6rXAVwfSU3IUc17ZRuhaFIUSqjuaaVYFAHmVocOswTKA0Jj
 qtKQiGIMElpiVUi2RKfk+fQ+h5/KTCQvhu4KB7CoawlWtmaJsSzr9TPVWhC1MJOD+bcpLbZrJZ
 dAtWWZj1Cqzyy+eArFi7qCLsFTVq/lQ+pCVGjVNKXbGy2TelIM3xRuO8ZN8r8Av1uMqy1Ef98/
 dyC41Jwxg89q1C1TuMRoHzKG6qahryggP9DWCyCaYL2z0FRgvCazs7sLmjT1SkIHsu8zTJzgy+
 0mNFOMzyT89mlqD7N81UOr5B
IronPort-SDR: LL/yxAMcvWV+8u3amKRZeDi8bALPYNhlL4Sb3gUsUW50/sY+GVheGM96arfLRe4Bm2Y1g6v9fF
 ww9vz41jQVM0cSKvYpiSEUuoPLUGM7BgBkABRuM1xk6Im7rPnNpZ9CLs33UUz93aRXmwe+9P5u
 sN3Gs8GclG4ODsOZOJ9yGZoEPEnPnNPAiLMIowOfx+gVAEqepruGYwD87t9xWYmR5G0x0tY4wb
 ePWSQ9G9OOaXHtQV038VahJpQu08ivHwGf5s0SVNmKBuwi/xHFx8Qw0ituC0MIey4s9x5GyAj3
 6qo=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268865; x=1652860866; bh=3/KeY74fCa89/HKmeQeN7bAvF9g3Fcpr0R9
	Z+15MzFA=; b=ACjR9UWryki+eudgsq/STqOr+GWbZj16v+u8a2Dftxm2lDM945o
	bVfFaY/GsX43zY1Oaqxrub1Jc7lHHvzftjDWfDRuVxraf/ZRLqw//ZXMp0b77lQF
	9nYnsBvjkMg6iSu1Rv/HmkRv1DVTbN1qSEzerCzsXyF6bp1SxFaGiDvrfWwA/S8s
	Ou+wVx4dk6/UkHkzLXk1TgA23a21B8j7ugHMvIsEFVP+7333Loa1WdkbITzQ4Hw9
	emhVU3z9B140JbFTYr/MrEfmv94Pd9Ofm/6fRMxFKfgG5QPr8AyMYWl9tghfqOsu
	In8Vw6oTR+9i83mC26mJTU/FoazxybA/EHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <fb5baf81-fa19-bb48-865c-e13277a0952a@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:01:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 03/11] null_blk: don't set the
 discard_alignment queue limit
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 xen-devel@lists.xenproject.org, linux-um@lists.infradead.org,
 Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 Stefan Haberland <sth@linux.ibm.com>, linux-raid@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-4-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/22 13:53, Christoph Hellwig wrote:
> The discard_alignment queue limit is named a bit misleading means the
> offset into the block device at which the discard granularity starts.
> Setting it to the discard granularity as done by null_blk is mostly
> harmless but also useless.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/null_blk/main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> index 5cb4c92cdffea..a521e914a9843 100644
> --- a/drivers/block/null_blk/main.c
> +++ b/drivers/block/null_blk/main.c
> @@ -1765,7 +1765,6 @@ static void null_config_discard(struct nullb *nullb)
>  	}
>  
>  	nullb->q->limits.discard_granularity = nullb->dev->blocksize;
> -	nullb->q->limits.discard_alignment = nullb->dev->blocksize;
>  	blk_queue_max_discard_sectors(nullb->q, UINT_MAX >> 9);
>  }
>  

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

