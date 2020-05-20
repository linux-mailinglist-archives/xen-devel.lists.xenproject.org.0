Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EC1DB1E6
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbN1a-0001Q1-Nf; Wed, 20 May 2020 11:36:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rB2F=7C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbN1Z-0001Pu-Ug
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:36:37 +0000
X-Inumbo-ID: 2a4625dc-9a8e-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a4625dc-9a8e-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 11:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pgJTbuyPYmB+dyjkzYvEhRods9vwp8ua0UNTnQqMXt0=; b=f2NiTNdb6jI85b/dpN0OA5xHka
 p17a6SPu2itrm0+IgxA2y7YQwRR1+m9P9ipiOZ1OVP+0twdBMC+/F/7/DDzlLtrMyvQ7wZcOxHcKX
 /CO9FOxRa3z6qw/FukdApN9vmufPRKKwZ1AJCWn6UAOwbbUBgaNyr/S6Jh4j8HFOH2pw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbN1Z-0008G2-6o; Wed, 20 May 2020 11:36:37 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbN1Y-0001y9-Vq; Wed, 20 May 2020 11:36:37 +0000
Subject: Re: [OSSTEST PATCH 34/38] buster: grub, arm64: extend chainloading
 workaround
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-35-ian.jackson@eu.citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f3becdd7-a7e1-3e99-ca90-4ce0f74aa467@xen.org>
Date: Wed, 20 May 2020 12:36:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519190230.29519-35-ian.jackson@eu.citrix.com>
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

Hi,

On 19/05/2020 20:02, Ian Jackson wrote:
> multiboot[2] isn't supported.
> 
> Also link to the bug report.
> 
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   Osstest/Debian.pm | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
> index 77508d19..151677ed 100644
> --- a/Osstest/Debian.pm
> +++ b/Osstest/Debian.pm
> @@ -443,9 +443,10 @@ sub setupboot_grub2 ($$$$) {
>       my $kernkey= (defined $xenhopt ? 'KernDom0' : 'KernOnly');
>   
>       # Grub2 on jessie/stretch ARM* doesn't do multiboot, so we must chainload.
> +    # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=884770
>       my $need_uefi_chainload =
>           get_host_property($ho, "firmware") eq "uefi" &&
> -        $ho->{Suite} =~ m/jessie|stretch/ && $ho->{Arch} =~ m/^arm/;
> +        $ho->{Suite} =~ m/jessie|stretch|buster/ && $ho->{Arch} =~ m/^arm/;

FWIW, the next version of Debian seems to have a newer GRUB version with 
Xen on Arm support.

Cheers,

-- 
Julien Grall

