Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035E229D9D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 18:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyI4l-0005O8-0L; Wed, 22 Jul 2020 16:58:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u0rb=BB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyI4k-0005O3-8l
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 16:58:38 +0000
X-Inumbo-ID: 9606fcc6-cc3c-11ea-8684-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9606fcc6-cc3c-11ea-8684-bc764e2007e4;
 Wed, 22 Jul 2020 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udL5Yv2gUFU0tQQcIQ2s/epuPnsaDNAFz0eBRjhX+po=; b=31k8nW32I90lzWwA0RZcVvJM0E
 mG04UEP5Qm/hSP+sOyAje0OiGyTyyNZWFIBk63QAEIL88YOVUfTkX9+DTF90BXRJp9T6xOdyNlo+p
 iAnBMhVNgTWwMBMY7vltFhNpaAoCIN8LJHTtChJoKiHmqFejel9vOmuhtb2LR3gK2m3k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyI4g-0003yR-CE; Wed, 22 Jul 2020 16:58:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyI4g-000127-3A; Wed, 22 Jul 2020 16:58:34 +0000
Subject: Re: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200722165544.557-1-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7d608d35-e373-07bf-81a4-16f3a4ee03c1@xen.org>
Date: Wed, 22 Jul 2020 17:58:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722165544.557-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 22/07/2020 17:55, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> 
> Obviously this has my implicit Release-acked-by and is to be committed to
> the staging-4.14 branch only.

I will commit it.

> ---
>   SUPPORT.md | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index efbcb26ddf..88a182ac31 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
>   
>   # Release Support
>   
> -    Xen-Version: 4.14-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.14
> +    Initial-Release: 2020-07-24
> +    Supported-Until: 2022-01-24
> +    Security-Support-Until: 2023-07-24
>   
>   Release Notes
>   : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.14_Release_Notes">RN</a>
> 

-- 
Julien Grall

