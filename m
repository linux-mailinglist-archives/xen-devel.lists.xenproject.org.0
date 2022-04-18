Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9A504D62
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 10:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306994.522215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMJS-0004ew-7B; Mon, 18 Apr 2022 08:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306994.522215; Mon, 18 Apr 2022 08:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMJS-0004d6-4J; Mon, 18 Apr 2022 08:00:46 +0000
Received: by outflank-mailman (input) for mailman id 306994;
 Mon, 18 Apr 2022 08:00:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOmA=U4=opensource.wdc.com=prvs=10001294c=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1ngMJQ-0004cS-Bm
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 08:00:45 +0000
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a27bdda8-beed-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 10:00:41 +0200 (CEST)
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:00:18 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 00:30:40 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 01:00:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfVq2fB6z1SVnx
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 01:00:19 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id BhgU8AvAgnJR for <xen-devel@lists.xenproject.org>;
 Mon, 18 Apr 2022 01:00:18 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfVj0QSXz1Rvlx;
 Mon, 18 Apr 2022 01:00:12 -0700 (PDT)
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
X-Inumbo-ID: a27bdda8-beed-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650268839; x=1681804839;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N3pAk4FME4FfpMn1iEoaJawKiDbUT/rSC5t+NXLtpDE=;
  b=Np4I5saXpkuSNJ8xGxhlXAfjyM0dEp1de1CyGzRZkncAtx4Kn1Mo2Qd1
   3uFpRHIQUM9joO9XPonyU0Q/uUSCYkWofj1b++JnzvTtz3YfTiiyiZo1j
   Mo0aeArXhToJrf51OVGiw65dbtNv9U56Y/FyBmXUvW1gFxBRyaMhQgSUy
   yOkG4lqgGcbadx6UMn5+HIVjU9hR5fs8igBL1fCksSANAHJMfVnHPXfQF
   F7f1WPsWCfy//hTtR161Q7wDEVZRMDTnzByEjSE28CniQZRbnA5gTM1lm
   BRcsi0uwZWH1ZuEL61dHq7coQnieNiSypiL/QgzmEjndfi/+y/LF1nKr7
   w==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="198149975"
IronPort-SDR: TxjYTGZzvwB7psWV6W3KI5gHtngzKvQ9JxaTVaOTeJ4NZK4GDI2cdHKphZ7YJnAEDVEkvrehp/
 MAf5al43fZSUKkug6uH5WjF2aCvht2WrBzxmOq7Wgq/TeAKWpiWCP3t5lU1HcAsc378XmzKCi2
 qDJiza/Pln0FR8FhC36WJjPliM1zumqCBQSX7G9owKqF+IZ2LG1za0kSZfsUL08F4oOzaglZjJ
 86LcQUngZjo7+HI25Jnkx913fesX3QTYhBJ+Oz7g96HU/LzilCpc/PCqii+rycQlaT6HSNc1rF
 SE+VZcuH4cR8el44w5YJEJUs
IronPort-SDR: dqA0xkY883fVijO20XJqeYblV2DWNXbc84/nNH4mXZoWrmsCDmq9yK0hYQF03HZX3QBHQEDplf
 +595UVSkEuhf+7Bi3heEvTHwVRoUxmVPvShU8Ttgw1tcHKIATDvo/BSjz8rJFVXrLrTIykzjJT
 QsWw7WLn2LBR1V9OdkCICVSyxsYAbFr7P9XukHnxb0pLM72ibiNBafAorxUru7d2Uovq555V+V
 JnpVEHe6b4S7ggDv9tKgG+ze4OR9H4hkqMHt5h2SIz6gSZreoeiZla8Y4q56rvVpde6bN8fDXb
 Lk0=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268818; x=1652860819; bh=N3pAk4FME4FfpMn1iEoaJawKiDbUT/rSC5t
	+NXLtpDE=; b=ngOD3AFWFrt/ceE/OfeSecQhSFkdIAqL4au/Ckft9QaJpM386gc
	0ImAPwGT7Psw9TW4U9H1Wk016Xt8xz3e58a2jMPjv2GUTU3lwqJDabo248ANBg9B
	yGm/JHCOf+MkaWwS0ckjilCWJPsn++mDNKE/DElMmPiwsl/DnA2X8O5j9+e1FI/O
	Sb9z/z+qdyd3Y9JHSpmMHGQ4hYiRLI2EmbjDJfQUe+XGmCnY6Hi2UDi/exS4y7fr
	1KX3e3L6UMTrKsZi4KA7lcWdg1otbXp3BYKvKqOI1E8g+9m6JavT2WjH+kV8tJq0
	p4fOa4l54RqiF7FiS1+NPOJ/yFRpyCwiSew==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <fd915a51-035f-d5c6-42a1-c517e3d1f1b1@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:00:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 05/11] dm-zoned: don't set the
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
 <20220418045314.360785-6-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/22 13:53, Christoph Hellwig wrote:
> The discard_alignment queue limit is named a bit misleading means the
> offset into the block device at which the discard granularity starts.
> Setting it to the discard granularity as done by dm-zoned is mostly
> harmless but also useless.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/dm-zoned-target.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index cac295cc8840e..0ec5d8b9b1a4e 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1001,7 +1001,7 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  	blk_limits_io_min(limits, DMZ_BLOCK_SIZE);
>  	blk_limits_io_opt(limits, DMZ_BLOCK_SIZE);
>  
> -	limits->discard_alignment = DMZ_BLOCK_SIZE;
> +	limits->discard_alignment = 0;
>  	limits->discard_granularity = DMZ_BLOCK_SIZE;
>  	limits->max_discard_sectors = chunk_sectors;
>  	limits->max_hw_discard_sectors = chunk_sectors
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

