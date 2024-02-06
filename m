Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DD84BB9A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 18:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677049.1053450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXOu9-0005cs-DL; Tue, 06 Feb 2024 17:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677049.1053450; Tue, 06 Feb 2024 17:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXOu9-0005b4-9z; Tue, 06 Feb 2024 17:06:41 +0000
Received: by outflank-mailman (input) for mailman id 677049;
 Tue, 06 Feb 2024 17:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tN57=JP=embeddedor.com=gustavo@srs-se1.protection.inumbo.net>)
 id 1rXOu7-0005aw-Rq
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 17:06:40 +0000
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16094190-c512-11ee-8a48-1f161083a0e0;
 Tue, 06 Feb 2024 18:06:37 +0100 (CET)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
 by cmsmtp with ESMTPS
 id X5gxr4gHzTHHuXOu4r1C0R; Tue, 06 Feb 2024 17:06:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id XOu2ryq8ziDDpXOu3r5RmY; Tue, 06 Feb 2024 17:06:35 +0000
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:34842
 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1rXOu2-003dF2-1M;
 Tue, 06 Feb 2024 11:06:34 -0600
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
X-Inumbo-ID: 16094190-c512-11ee-8a48-1f161083a0e0
X-Authority-Analysis: v=2.4 cv=dIkFm/Zb c=1 sm=1 tr=0 ts=65c2671b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=DBfv99YmAAAA:8 a=cWRNjhkoAAAA:8
 a=cm27Pg_UAAAA:8 a=IUHhT28BEWNEk4qSCmMA:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22 a=c73wXdw0ADZYY2z2LwuN:22
 a=sVa6W5Aao32NNC1mekxh:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xom8zApxC86I/dIUvjWT77cxYWKLUOyYSTZXqNSiH60=; b=anFh+OynbpLIpeaK4DkLUiuKxJ
	YP0kUfSLPy0oZqhN8WGkhXzTW8gTKmyudSMVqvPb6hb8+ryTPcLq9GDTzBPQ5DZ01/nvt2aySxi0s
	FRkatydQWF9N2CqV/xky/GkmFDvEjMT821hPBQQCtNqaF6iKGq4EVUXiMnb9aeqbCrPRmnQHnes7a
	QlRIomTosqjQwLShSekZdWLQnvJkWvKtHffRg8V4AMuuh2SSfRSD066TtvkdmY8teGJopfegd3pWI
	nZ4szOJYIQ/+mUHUhY7YPRT7E8d0qw0iQKaYXrwV3W1AOtMnk9Y5hNjU8Kb9Y9vSnU2jxdXHi466d
	ggnsl+Zg==;
Message-ID: <33b313d4-ee53-4cd5-842e-147d60f462d6@embeddedor.com>
Date: Tue, 6 Feb 2024 11:06:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gntalloc: Replace UAPI 1-element array
To: Kees Cook <keescook@chromium.org>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240206170320.work.437-kees@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240206170320.work.437-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rXOu2-003dF2-1M
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:34842
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOM5DpdON3qFgfxUu1DobqtAksbT1w7udGcYHS+AaSxYQ54GflvE+GpN+Sscv6PMFIvkTv9owA/LIRxN01JimhU0m4+idmyNkkAfulXIRixzIKAx9KUD
 wnWZp+auIXBDZdjrMmiYYLgERTOBVVxzoov4mNBU58QTzHsFkBSKcRtud6cXP9PFKPx6fayjwbIpPw5mB3GRfThvtMAyqikX9BbAVZ6FHNU4LtOedKcLYRtK



On 2/6/24 11:03, Kees Cook wrote:
> Without changing the structure size (since it is UAPI), add a proper
> flexible array member, and reference it in the kernel so that it will
> not be trip the array-bounds sanitizer[1].
> 
> Link: https://github.com/KSPP/linux/issues/113 [1]
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/xen/gntalloc.c      | 2 +-
>   include/uapi/xen/gntalloc.h | 5 ++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
> index 26ffb8755ffb..f93f73ecefee 100644
> --- a/drivers/xen/gntalloc.c
> +++ b/drivers/xen/gntalloc.c
> @@ -317,7 +317,7 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
>   		rc = -EFAULT;
>   		goto out_free;
>   	}
> -	if (copy_to_user(arg->gref_ids, gref_ids,
> +	if (copy_to_user(arg->gref_ids_flex, gref_ids,
>   			sizeof(gref_ids[0]) * op.count)) {
>   		rc = -EFAULT;
>   		goto out_free;
> diff --git a/include/uapi/xen/gntalloc.h b/include/uapi/xen/gntalloc.h
> index 48d2790ef928..3109282672f3 100644
> --- a/include/uapi/xen/gntalloc.h
> +++ b/include/uapi/xen/gntalloc.h
> @@ -31,7 +31,10 @@ struct ioctl_gntalloc_alloc_gref {
>   	__u64 index;
>   	/* The grant references of the newly created grant, one per page */
>   	/* Variable size, depending on count */
> -	__u32 gref_ids[1];
> +	union {
> +		__u32 gref_ids[1];
> +		__DECLARE_FLEX_ARRAY(__u32, gref_ids_flex);
> +	};
>   };
>   
>   #define GNTALLOC_FLAG_WRITABLE 1

