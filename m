Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33826A39B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 12:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI8X7-0002aU-Oo; Tue, 15 Sep 2020 10:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF/R=CY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kI8X6-0002aN-8e
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 10:49:56 +0000
X-Inumbo-ID: b42c6e41-03c4-48e5-bcd5-f2341d5c8ee7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b42c6e41-03c4-48e5-bcd5-f2341d5c8ee7;
 Tue, 15 Sep 2020 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600166995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MviU19StN+7gsp7YkFPZz4Co11dsk1+qZ/KnNdeMxww=;
 b=cgq3NHSjRxYOvutwOxPiVJBa3kT2GQVbZ5LR9ZUrCDS8mycg0APlVmr9
 jc0rYAdAIblIp4eM9CL4wRpU+yJLrtLOQ/lEh8j7ob81iO7YFwo9sM/Cd
 fVDvmcjA8rFD88JOCtzhAaXxjP5bk4sb3y/VKbdxl+GqhvHyvAbWkRZGH I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B482KW0pY+YstqbKe8sq7+37K4nWKrdF9rismrLMIcIJBgujG0GPalWLFA1mWrk7M7ea2FNgFt
 zhTIRGus288s42hu/xjif+VkpSwQJ4/N7pHYrRZfMadAzOf0B2WZ2e/8Ck4QQr06zl8vcFIpaf
 OzG6duP+pfSMgBIbIeLkJZwU00c5MUh+gwSaobZJiyVROCecEVdE95l0Y5nerfSGrcO1zY+wnU
 /aeRl1o1crM8fPn0YAVjIOK3cygTvwKj6LhLXWJbAUJpbXy/NfcDpwKrlo4xzq22Wyf5ufzGzf
 FQY=
X-SBRS: 2.7
X-MesageID: 27046373
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,429,1592884800"; d="scan'208";a="27046373"
Date: Tue, 15 Sep 2020 12:49:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 2/3] x86/shim: adjust Kconfig defaults
Message-ID: <20200915104939.GJ753@Air-de-Roger>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
 <7eb74774-f8dc-ef97-c66d-0c4ac50ed9e0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eb74774-f8dc-ef97-c66d-0c4ac50ed9e0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 02:39:08PM +0200, Jan Beulich wrote:
> Just like HVM, defaulting SHADOW_PAGING and TBOOT to Yes in shim-
> exclusive mode makes no sense, as the respective code is dead there.
> 
> Also adjust the shim default config file: It needs to specifiy values
> only for settings where a non-default value is wanted.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -116,9 +116,9 @@ config XEN_SHSTK
>  	  compatiblity can be provided via the PV Shim mechanism.
>  
>  config SHADOW_PAGING
> -        bool "Shadow Paging"
> -        default y
> -        ---help---
> +	bool "Shadow Paging"
> +	default y if !PV_SHIM_EXCLUSIVE

I think you could also do: default !PV_SHIM_EXCLUSIVE?

I'm fine with using the current form.

Thanks, Roger.

