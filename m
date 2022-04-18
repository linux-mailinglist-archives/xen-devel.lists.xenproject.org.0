Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68CA504D83
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 10:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307020.522271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMMw-0007dL-Rc; Mon, 18 Apr 2022 08:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307020.522271; Mon, 18 Apr 2022 08:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMMw-0007bF-No; Mon, 18 Apr 2022 08:04:22 +0000
Received: by outflank-mailman (input) for mailman id 307020;
 Mon, 18 Apr 2022 08:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOmA=U4=opensource.wdc.com=prvs=10001294c=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1ngMMv-0007PH-6V
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 08:04:21 +0000
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25dfe76e-beee-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 10:04:20 +0200 (CEST)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:04:16 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 00:34:39 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 01:04:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfbQ06vHz1SVp2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 01:04:18 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id CAb-oJ30zaVu for <xen-devel@lists.xenproject.org>;
 Mon, 18 Apr 2022 01:04:17 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfbJ6g7Wz1Rwrw;
 Mon, 18 Apr 2022 01:04:12 -0700 (PDT)
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
X-Inumbo-ID: 25dfe76e-beee-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269058; x=1681805058;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rpofyDUALxK7dXMfprZ48DmzWqCt1/MYuoJj74ZUCIU=;
  b=c9HAt/u1QTECNqD99ajVLnA0kiUyw8EXC3GohKr0tgRmsbCdTxLvT5nx
   XVEBeQyO5WE4rQqY8IMWAZwZLQ8umD9b3qjCS0pJEeHF5PnDnGLE4wz/F
   Yt401ou+JYYO5EP3yUsMz/u6t8qC9UCHADscrUSyZ448zz4GTBZ88W/+t
   8Z32kccOmUCy2zCqmpZf8FfAGiqxB0vbq9WXIK5FpYk9yZ7cDBRKkHt6u
   REJdHyTgh4smym+HHCdPdYCajMtnCg8CzZVCTogT/6GHrBI6WJBvrxVa6
   a6S8SqE8Z9Cu3MuqG6BuAJCH8Mmk5VkplZzV4mR9RsJPX4y4lUZSoydN8
   A==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="310120332"
IronPort-SDR: bLAYGLCb7s8Y/SCiExQ10X8inQBGQs5XYT3Ch4hjMMOvZfGbMz1IkJa8WKrtmamWpxtYRzw/bI
 mu4XBidqURZaAz1juycP6OQ6GJNwPndF14rmCvJJpgKI4iUjtynG8NvMZukvwyoGS++cW06oCI
 R/5ZwY2zPSr8SuDF6RY1pCVQ+D1xgMGVRpryeBt94/nRIN0G4FVTQs2Nm5PPmY3xttT9mHFgfQ
 R46zKgM93m1qCg5ToeHdQPGR8W3Y37wM3CC/Ouq2vRBpeMzctk+ctTTwCyNQFnZ4OVDJLMiNSh
 C4X6DbML/BsjVaFyy9W/R8Qc
IronPort-SDR: lTnMAMxNN/Q0vLxpw8sxmmKrj2CJ2mma0hhAEW+rH9dCGEonA/7O5HV+dTkZu9C0gQGJQyVD+q
 IaLYmy8sxEOuGoPoT/os/U2nTcOhzF/PJCia/5abgVYlvQWCP1YKoSJyyvcwdJO+USNZtxgIOP
 VBdXbIEGJHu+CgAbFUudCmEDMPeB6D18eGYG9zwIY1Pcz3bVCwRdqqa89PlyN+IAfLdqRanNcj
 Td29iafgMgDMFyGLPHMr4GHkHQqcCnTnrJUwSsLXinB7XOF5j6J2UkveYUAHpI9NnuwUo0VnOi
 FrU=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650269057; x=1652861058; bh=rpofyDUALxK7dXMfprZ48DmzWqCt1/MYuoJ
	j74ZUCIU=; b=HJZNzwH+Ya8Lh7fQ8EMITGW2E5Om7BfPbFoRhLpWnW1FNcZ8M97
	TK23SdL3V92f6aNBG2vIYI0gDssBn/mhxBwSaBmQ/xfiGX6JpTqdbyplEcM3/QPd
	YyR04YET0AyNeqqGu/qYp7lW/huq0m6CT68sYmcr630FWrzGkdmCtJbqrWNypH2Y
	TJVuIpVo+OZCpO89xGW7fGtNGyFZvGt5M0KC+IJs3BaNbOroa0IUVJXir/qiQd5B
	lqD1wpmPTbVXvHTfgzngWAccyjf/xfEF71aKD++ki43Kx1QfUXAHkCRRPeo2dA+i
	R2SGy4d83q83vsdCn6C41e1TqK2ajxRurdQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <18032025-f1aa-2daa-d012-8996590ada6a@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:04:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 08/11] loop: remove a spurious clear of
 discard_alignment
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
 <20220418045314.360785-9-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/22 13:53, Christoph Hellwig wrote:
> The loop driver never sets a discard_alignment, so it also doens't need
> to clear it to zero.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 976cf987b3920..61b642b966a08 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -789,7 +789,6 @@ static void loop_config_discard(struct loop_device *lo)
>  		blk_queue_max_discard_sectors(q, 0);
>  		blk_queue_max_write_zeroes_sectors(q, 0);
>  	}
> -	q->limits.discard_alignment = 0;
>  }
>  
>  struct loop_worker {

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

