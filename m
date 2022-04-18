Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6592504D81
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 10:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307014.522259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMMQ-00075R-HN; Mon, 18 Apr 2022 08:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307014.522259; Mon, 18 Apr 2022 08:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMMQ-00073Z-ED; Mon, 18 Apr 2022 08:03:50 +0000
Received: by outflank-mailman (input) for mailman id 307014;
 Mon, 18 Apr 2022 08:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOmA=U4=opensource.wdc.com=prvs=10001294c=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1ngMMO-0006DK-Ho
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 08:03:48 +0000
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f0512e-beee-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 10:03:47 +0200 (CEST)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:03:46 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 00:34:05 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 01:03:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfZm2prXz1SVp4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 01:03:44 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id g-pMfqZHpZX9 for <xen-devel@lists.xenproject.org>;
 Mon, 18 Apr 2022 01:03:43 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfZg2dWsz1Rvlx;
 Mon, 18 Apr 2022 01:03:39 -0700 (PDT)
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
X-Inumbo-ID: 11f0512e-beee-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650269028; x=1681805028;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rst7WZOXaJnTOprfWYkoaRENgax/3SjcG41/Nf0ZaiQ=;
  b=EmdD7FamYGmavx1pUGfT1fI8RCXuQt/sLKvEI6XvEoYEa8tCQJHYWMyo
   Da7WKAwPjA16523o9E8lfx4JbLWg8frrVTynHnbW9K4X48xKLE17yOQLs
   mkwASqVuZyKzzQoisr5JTJIuVDHTf26WfCZIso66cwu/xCcidWuGkO/W5
   R2/CQ+sSFuMH4Emih9V5GXcnM+a6LIp0jX3c0cIm/hzBYecHWGkNHDbnr
   SNsZV1bfPDTMSWIFjZamgunEf/JRpA0fPKVSddWPtklGmwtuFtP0tGN0C
   JK6ot2tLzuYFojWRJpFcL7kjrrKZTllBi1m/OJDf+a8cDnRllznYi9wjH
   g==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="199047834"
IronPort-SDR: EZv3uLcC1dQHJThopLQlejGyQWVPvjXLdxnQ0C0w01HLMA5o0ZJRaogTV1wlHb4/Q/w+zPZ9+9
 OExgT3jfo+3CY1cf8MX53I/BHrLEDIVqwmZURG1jHV/Z0AUkdV/KsXlz2Q/RFUZ/L3UcJECC8l
 c3ZTJnxarvJj/i9PGps9tkWBZ0rHDGtgI82SOWSn5fzGv1sj9YkQAAzkDqSmIuTbsqCpxyD3Ag
 R4VrbcrR9aj+AWBnkiYAyXozG1hE7P2P4ZlYq27sCCmlwAAnzE2KL8KVdz0mPijUhR4G738pkw
 nSUUmuWbG0y0J237G2SRYwv5
IronPort-SDR: FzI1DlYTfmOdUDHCnSQhuP5LJ92ZlCsmTBwLm4MWvTpCgx0kq8WRmc45c51e5Q/2qCCDa+kaHb
 JkYJslACdFipRMLvDG2/IaELV8LT75MwLLDSZsFxt27g/nCIhKhu9hoSsW/65tDZlc21QAe4Ev
 u6jz1dAoIP9q3iMl8K7EuiqnJACe4WEMUyYWxqxT/H6khAflJ2I4IGsLnPPLuCtkyP5/0Jv+Y2
 KvlECgNMWmnCJ5JCQ3cP9UnqaVNIUcc8WXwh3H9wQ+BVXVGKw7mXbXHR328Ub/eNaUMjnUGqns
 aZM=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650269023; x=1652861024; bh=rst7WZOXaJnTOprfWYkoaRENgax/3SjcG41
	/Nf0ZaiQ=; b=YwIZvBG+Q6As3HMHZdqx3chNbvRrKNFPClgQ9l4SFijMhFWKZ8E
	YhLeA+aCumtaM4E8BSAw9tPoo+DFBjRdgzlDdYb1CVrznhaoDlJ5uLs4geuSL4/H
	TFurAULN2uVb/wBvNTrstEc0MtfZQQC0eAZB0U4q1eddErc1Eqd9jJiRpAIQbe+k
	Q6pWlnCRUg6h1llQU+3m8+z63aBnXWWbfre3psRJEGoWwAs955kZAevrPBkjOGNR
	HWtFV1/L0EzZNT5wA87k5Wfl0lxZ+bjousfqKAOSqGkvi12NRpaAXEsEXcJSsNpy
	VzvPiiCk/j6EtUs7OZ5fTKWjV1EJcsRrgNg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <034efb57-9e1d-41ed-1855-e2b057b03ea7@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:03:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 11/11] xen-blkback: use bdev_discard_alignment
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
 <20220418045314.360785-12-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/22 13:53, Christoph Hellwig wrote:
> Use bdev_discard_alignment to calculate the correct discard alignment
> offset even for partitions instead of just looking at the queue limit.
> 
> Also switch to use bdev_discard_granularity to get rid of the last direct
> queue reference in xen_blkbk_discard.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/xen-blkback/xenbus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index b21bffc9c50bc..04c90cb8955f6 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -583,14 +583,14 @@ static void xen_blkbk_discard(struct xenbus_transaction xbt, struct backend_info
>  	if (bdev_max_discard_sectors(bdev)) {
>  		err = xenbus_printf(xbt, dev->nodename,
>  			"discard-granularity", "%u",
> -			q->limits.discard_granularity);
> +			bdev_discard_granularity(bdev));
>  		if (err) {
>  			dev_warn(&dev->dev, "writing discard-granularity (%d)", err);
>  			return;
>  		}
>  		err = xenbus_printf(xbt, dev->nodename,
>  			"discard-alignment", "%u",
> -			q->limits.discard_alignment);
> +			bdev_discard_alignment(bdev));
>  		if (err) {
>  			dev_warn(&dev->dev, "writing discard-alignment (%d)", err);
>  			return;

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

