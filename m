Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA2E1DB1A0
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:26:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbMro-0000QC-2I; Wed, 20 May 2020 11:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rB2F=7C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbMrm-0000Q7-7n
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:26:30 +0000
X-Inumbo-ID: bf7baa91-9a8c-11ea-a9ef-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf7baa91-9a8c-11ea-a9ef-12813bfff9fa;
 Wed, 20 May 2020 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W6iLhcTIkVKf6db6un2M1F/DBtaEYgUu3r3lVVDOgB0=; b=4Wvk4Sz+bAcRkA43so9xeksvRR
 3YIjGx/ZuIp9XcSkH/9kv2FINZMecBcyHR39xrDwGyyPIl76lfYhpYfXn7MUO6rZBL/03saU1bNqs
 GJJSRQiQwGALneuMEwKO6D+w1Ijg/EbCLKicMWMr8hwjRhDnNpa06vEpqCjkrLMHbxz8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbMrl-00081t-HE; Wed, 20 May 2020 11:26:29 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbMrl-0001Ii-AT; Wed, 20 May 2020 11:26:29 +0000
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
Date: Wed, 20 May 2020 12:26:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519190230.29519-23-ian.jackson@eu.citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 19/05/2020 20:02, Ian Jackson wrote:
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   Osstest/Debian.pm | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
> index 6fed0b75..77508d19 100644
> --- a/Osstest/Debian.pm
> +++ b/Osstest/Debian.pm
> @@ -1064,7 +1064,7 @@ END
>       logm("\$arch is $arch, \$suite is $suite");
>       if ($xopts{PvMenuLst} &&
>   	$arch =~ /^arm/ &&
> -	$suite =~ /wheezy|jessie|stretch|sid/ ) {
> +	$suite =~ /wheezy|jessie|stretch|buster|sid/ ) {
>   
>   	# Debian doesn't currently know what bootloader to install in
>   	# a Xen guest on ARM. We install pv-grub-menu above which

OOI, what does Debian install for x86 HVM guest? Is there any ticket 
tracking this issue?

Cheers,

-- 
Julien Grall

