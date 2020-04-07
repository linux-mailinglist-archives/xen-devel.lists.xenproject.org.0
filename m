Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C841A12CB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 19:38:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLsBP-0000rE-VJ; Tue, 07 Apr 2020 17:38:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLsBO-0000r9-H6
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 17:38:42 +0000
X-Inumbo-ID: 9f5e1a6e-78f6-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f5e1a6e-78f6-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTUhw75EAcIsBdxvOhBuDMN2uHNORvVO9OdgrVxBkgI=; b=Gi9kP/nXnKoRQLfOY5k33XING8
 j7Kx8WyZqCsmNzdsoAIFN/IEQ/s14uQK+6oOz8guPSiqK+pilHZHy3Hpp3pNn/smrSHO7o5GLsqDk
 0c0U+vpzfaaBYyXHlfTmq4nHboqnZ6uo8buX8XXn4NMLCRQJuc293rKcEa1FSq91WJwM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLsBK-0000JQ-8f; Tue, 07 Apr 2020 17:38:38 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLsBJ-00087A-Ve; Tue, 07 Apr 2020 17:38:38 +0000
Subject: Re: [PATCH] MAINTAINERS: Remove all S: entries
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20200407161519.16493-1-ian.jackson@eu.citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e768f715-7d39-539d-f44f-863f9bff0576@xen.org>
Date: Tue, 7 Apr 2020 18:38:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407161519.16493-1-ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 07/04/2020 17:15, Ian Jackson wrote:
> Feature support status is tracked in SUPPORT.md nowadays.

I don't think we track everything the same way. At least...

> 
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
>   MAINTAINERS | 60 ------------------------------------------------------------
>   1 file changed, 60 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a4c869704..e784169d1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -69,16 +69,6 @@ Descriptions of section entries:
>   	L: Mailing list that is relevant to this area
>   	W: Web-page with status/info
>   	T: SCM tree type and location.  Type is one of: git, hg, quilt, stgit.
> -	S: Status, one of the following:
> -	   Supported:	Someone is actually paid to look after this.
> -	   Maintained:	Someone actually looks after it.

... we don't have a way to track code that are maintained but no-one is 
paid.

IHMO, this is an important to track as a contributor should not expect 
the same level of support between someone that is paid for it and 
someone that is not.

Cheers,

-- 
Julien Grall

