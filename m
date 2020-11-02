Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F832A25C4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 09:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17448.42227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZUm9-0005Cu-66; Mon, 02 Nov 2020 08:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17448.42227; Mon, 02 Nov 2020 08:01:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZUm9-0005CV-3B; Mon, 02 Nov 2020 08:01:13 +0000
Received: by outflank-mailman (input) for mailman id 17448;
 Mon, 02 Nov 2020 08:01:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZUm7-0005CP-6F
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 08:01:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8fafef0-1772-4d2d-97c9-b081d63fb8ec;
 Mon, 02 Nov 2020 08:01:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B906BACF6;
 Mon,  2 Nov 2020 08:01:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iSH1=EI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZUm7-0005CP-6F
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 08:01:11 +0000
X-Inumbo-ID: a8fafef0-1772-4d2d-97c9-b081d63fb8ec
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a8fafef0-1772-4d2d-97c9-b081d63fb8ec;
	Mon, 02 Nov 2020 08:01:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604304066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eASlqPS2sMyXaJyuaVVUn00Iuuc1tTvT28lcNIMn5Ls=;
	b=GyzVGfbuCkbTv+LDLSgMYQE3Rb35CzldsqmPFMT4JBJa+jIs2B+n6rMMVhXBt1LZuAiuXZ
	INFE5XbaR+a8VQ7BXdzEp+W4ncp1wzwQ9grnolcgvRUHVeWd8C1axHztv6UqlPdnuHesD7
	Ov3/mn+EazA6bDyveK/3OL4Awpc0kfQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B906BACF6;
	Mon,  2 Nov 2020 08:01:06 +0000 (UTC)
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <20201031002405.4545-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com>
Date: Mon, 2 Nov 2020 09:01:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201031002405.4545-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.10.2020 01:24, Stefano Stabellini wrote:
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -35,14 +35,13 @@ config DEFCONFIG_LIST
>  	default ARCH_DEFCONFIG
>  
>  config EXPERT
> -	bool "Configure standard Xen features (expert users)"
> +	bool "Configure EXPERT features"
>  	help
> -	  This option allows certain base Xen options and settings
> -	  to be disabled or tweaked. This is for specialized environments
> -	  which can tolerate a "non-standard" Xen.
> -	  Only use this if you really know what you are doing.
> -	  Xen binaries built with this option enabled are not security
> -	  supported.
> +	  This option allows certain experimental (see SUPPORT.md) Xen
> +	  options and settings to be enabled/disabled. This is for
> +	  specialized environments which can tolerate a "non-standard" Xen.
> +	  Only use this if you really know what you are doing.  Xen binaries
> +	  built with this option enabled are not security supported.
>  	default n

I'm definitely in favor of this - it was more than once that I
wondered about the prompt text.

> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>  
>  config ARM_SSBD
> -	bool "Speculative Store Bypass Disable" if EXPERT
> -	depends on HAS_ALTERNATIVE
> +	bool "Speculative Store Bypass Disable"
> +	depends on HAS_ALTERNATIVE && EXPERT
>  	default y

At the example of this, I'm afraid when the default isn't "n"
(or there's no default directive at all, as ought to be
equivalent to and preferred over "default n"), such a
transformation is not functionally identical: Before your
change, with !EXPERT this option defaults to y. After your
change this option is unavailable (which resolves to it being
off for all consuming purposes).

IOW there are reasons to have "if ..." attached to the prompts
(for this construct indeed only making the prompt conditional,
not the entire option), but there are also cases where the
cleanup you do is indeed desirable / helpful.

Jan

