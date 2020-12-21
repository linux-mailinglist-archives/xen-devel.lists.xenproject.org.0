Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAF2DFE3D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57459.100534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOTs-0001LM-ST; Mon, 21 Dec 2020 16:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57459.100534; Mon, 21 Dec 2020 16:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOTs-0001Kx-PA; Mon, 21 Dec 2020 16:56:20 +0000
Received: by outflank-mailman (input) for mailman id 57459;
 Mon, 21 Dec 2020 16:56:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krOTq-0001Kk-F5
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:56:18 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a143e90-1e86-4abb-a1ec-d249478af553;
 Mon, 21 Dec 2020 16:56:16 +0000 (UTC)
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
X-Inumbo-ID: 2a143e90-1e86-4abb-a1ec-d249478af553
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608569776;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Vwl+JSEjTJiV4xk2PRVSPLpkk4yey6eAiUUp2Yn5AjY=;
  b=Hj0OHhf8d5wF5CZTMFzUcJzttnyc4vkE8DSq75AT9t7JZKwuHJalbmrR
   xKrYyu5s4Yzhlg7H86k1ZYE8OlPTpsUw72T8ocXYCpqviW4Kd1Ewh3nO3
   ah+S05+8d9mPE0AGLxWGS5W1pGP4XqVGMl3PYkQ5pw1Cf6O2WMPphrfpo
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KNjvq+SvnSBKEGpoYHLz+ZJy+31+j6dz1/nIvN9JsKhEwTvDLXlgEKQ1zwtrQcpX4oTIiZ+QJU
 w+KcSdewBRmbCXWh7BbdnV9Dz+BAfnDftnjA5ZUZZggjxBy7xDPLitkfcq6a4fHW5gaLa3oT06
 oXNvPi1VlDuzkKrJe+BfDd7zyrJ7+dRKwRUwMwDoLffFB/hLrFvUqwQyI7jya+aFJK4y5HpDCi
 zwetE7lHHKaptrif9WC6RO3FZjnl4a7irRtTEWvT4olKWMP/5/D/uh4tjiQZ4u7hzNrWYiDEk5
 alw=
X-SBRS: 5.2
X-MesageID: 33680936
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,436,1599537600"; 
   d="scan'208";a="33680936"
Subject: Re: [PATCH] x86/Intel: insert Tiger Lake model numbers
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <97963ff7-e37e-693b-5c02-a4f99669ccbe@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <92ec3c47-0411-132d-36ea-911e16b1b383@citrix.com>
Date: Mon, 21 Dec 2020 16:56:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97963ff7-e37e-693b-5c02-a4f99669ccbe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 21/12/2020 16:50, Jan Beulich wrote:
> Both match prior generation processors as far as LBR and C-state MSRs
> go (SDM rev 073). The if_pschange_mc erratum, according to the spec
> update, is not applicable.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -183,6 +183,9 @@ static void do_get_hw_residencies(void *
>      /* Ice Lake */
>      case 0x7D:
>      case 0x7E:
> +    /* Tiger Lake */
> +    case 0x8C:
> +    case 0x8D:
>      /* Kaby Lake */
>      case 0x8E:
>      case 0x9E:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2436,6 +2436,12 @@ static bool __init has_if_pschange_mc(vo
>          return true;
>  
>          /*
> +         * Newer Core processors are not vulnerable.
> +         */
> +    case 0x8c: /* Tiger Lake */
> +    case 0x8d: /* Tiger Lake */
> +

This hunk should be dropped.  TGL should enumerate
ARCH_CAPS_IF_PSCHANGE_MC_NO and take the early exit path.

If it doesn't, we need to know (i.e. hitting the default case), and I'll
do even more pestering to have ucode fixed.

Others Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +        /*
>           * Atom processors are not vulnerable.
>           */
>      case 0x1c: /* Pineview */
> @@ -2776,6 +2782,8 @@ static const struct lbr_info *last_branc
>          case 0x7a:
>          /* Ice Lake */
>          case 0x7d: case 0x7e:
> +        /* Tiger Lake */
> +        case 0x8c: case 0x8d:
>          /* Tremont */
>          case 0x86:
>          /* Kaby Lake */


