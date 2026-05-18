Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAKfKk8jC2pJDwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:33:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60856EE26
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311944.1582066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOz25-0007s7-PT; Mon, 18 May 2026 14:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311944.1582066; Mon, 18 May 2026 14:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOz25-0007pz-Mt; Mon, 18 May 2026 14:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1311944;
 Mon, 18 May 2026 14:33:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wOz24-0007pt-Gk
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:33:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOz23-0092FU-PT
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:33:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0b232d-2eae-0a2a0a5409dd-0a2a45058cf6-18
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:33:23 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0b2333-aaa8-0a2a45050019-a237832f9944-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:33:23 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5DD7C4EE3C71;
 Mon, 18 May 2026 16:33:23 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779114803;
	b=zM1cam5UnbwEIFgpMrLQi/1p7NIsxD6QUcGRP3AKJ7WCC8U71vVutumxIWgdnOauSdv6
	 tSekD85K8F/wmq0q8XG8btHVgdHPSGaaxGT+JW5MKyv0wT+zQ3ZFWoDGDInYFDo1hc94J
	 D2hjAbz1MR/E+cXFg+yMjI2D5grnQO+IZWQsdEyPnY6o2BdYJJklaBBfRtr1XKjx/1WEf
	 k0y8RKj8eeY7Q7NWWIgN5heCWiIygBrlsKEkfBK18zgtIH8dmvGVKzyxzI1K0ZxH/Jk08
	 YfAILxV07gNVWe1ykYeLvOUhvtRHy6U9tf0Rrr+HPIjZE+JGRzU63yna/RKe/GD2IKhpc
	 KDu9s1VZ7I0OLNmKW81WhXVzGul7RBbRwxjFvG/6VKW2Sz5acF9fJaNtAUi1HuwZfEdZE
	 ujBJpMFO6x2FU2+ptFXM0wZ1CyByg5PP/qtvYtPkHp/v7l8RbRhvy1D9wLsai8PLNUFnG
	 olrPsgC12V91MRGpv26DuImDlSU3hJMsn7UCOXyMOZMR0uGRBHJxjaPL3hxfIYJbNx/4H
	 zyuZWnJ9VHsavrgRRGdUg3cmUaCclJcXmTvfKc8iKjpvuQRrfmjnCQdojaYClKagmh5JT
	 iVf8X70pXglh3jSsUILnXe68EjYCe8UGC226eeIM0LHgTTf/MNN7XKntNQmhiSM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779114803;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dd2ARLc2Z+Ur//usrJ76J0MSevPdvxnzlrXcmxl7Hi8=;
	b=W/Bn/PhnzR5cFjU0i6He8g+dsTElHsy3qbk79GGgMgUhyVf7F3FO0MzRTpDXMam48bQ2
	 Zv6fevnnkWS591gY9gKMY/4r5Qpvdj3yNmhl38GRwCEsid+tr00KLEb3+gYU/lPqtyOM/
	 rfoFytERfY3ax4+6zdRu33aPDzVGsjul+GWLV7kMbS3QTU6QIKj7AAKG2rcg0eVS8XuJe
	 eyEtzMnlggM/Asa7NggXlD9wANKf0EkUEakme3tPFJfNCJDWq/zNzbi+gf16Y7XnXriAH
	 Jowc65egdl7VcCs1H+2SviUAKlLYn3Iz3hyqVmgj6WpIV2uN6upscOdKUIfafBWl3PvU9
	 leM5jmbtP9z7q+KlGt+JpCcXTeaCKIjElyheeTii91NcwY79kX34LVMCJPK7XXhr0g6Tb
	 egT6pw1q+BcBkHVGh22ew5Nd/rHf70vOTVjsiNSzixaMsawy4PX/vu9hToRrtS+/1qC5T
	 FoUmz2ugMrTqT+1K+4cFB7UI1q7P6ONbInXmRnyo/ke+hxe4ul693wLPY99kP6hCSD+Oh
	 hNXQzqFs1+IsDumT96CZQanOktvOXzxtvou2fIXO2qvf7GYO5W9FlOHSw+UEP6FJBM5F1
	 7NV3K4I6mHDr9B1pffkcfmSdJI8MMRARrIK0/QPVl0KNgzvevEtYAR6wE/vo0y0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 18 May 2026 16:33:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] x86/shim: adjust for Misra C:2012 rule 20.12
In-Reply-To: <fddf4e43-8b8b-4b89-97b9-24deb46e2c9c@suse.com>
References: <fddf4e43-8b8b-4b89-97b9-24deb46e2c9c@suse.com>
Message-ID: <8fc9b5efd6c83bc2aadbe058eed83615@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779114803-D917D443-ED6A177B/0/0
X-purgate-type: clean
X-purgate-size: 2306
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,linkedin.com:url,bugseng.com:url,bugseng.com:email,bugseng.com:mid,b.sc:url]
X-Rspamd-Queue-Id: 5C60856EE26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-18 13:42, Jan Beulich wrote:
> ... ("A macro parameter used as an operand to the `#' or `##' 
> operators,
> which is itself subject to further macro replacement, shall only be 
> used
> as an operand to these operators"). Leverage the SAF-6 annotation we 
> have
> available.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> As per the placement in arm/tee/ffa.c two instances of the SAF comment
> (ahead of the macro definitions) should suffice. Eclair demands one
> instance per macro use here, however (much like we have it in
> x86/dom{ain,ctl}.c).
> ---
> v2: Use SAF-6 annotations.
> 
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -124,8 +124,10 @@ void __init pv_shim_fixup_e820(void)
>      ASSERT(i < ARRAY_SIZE(reserved_pages));     \
>      reserved_pages[i++].mfn = pfn;              \
>  })
> +    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
>      MARK_PARAM_RAM(HVM_PARAM_STORE_PFN);
>      if ( !pv_console )
> +        /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
>          MARK_PARAM_RAM(HVM_PARAM_CONSOLE_PFN);
>  #undef MARK_PARAM_RAM
>  }
> @@ -207,10 +209,14 @@ void __init pv_shim_setup_dom(struct dom
>          evtchn_reserve(d, param);                                      
>         \
>      }                                                                  
>         \
>  })
> +    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
>      SET_AND_MAP_PARAM(HVM_PARAM_STORE_PFN, si->store_mfn, store_va);
> +    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
>      SET_AND_MAP_PARAM(HVM_PARAM_STORE_EVTCHN, si->store_evtchn, 0);
> +    /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
>      SET_AND_MAP_PARAM(HVM_PARAM_CONSOLE_EVTCHN, 
> si->console.domU.evtchn, 0);
>      if ( !pv_console )
> +        /* SAF-6-safe Rule 20.12 expansion of macros HVM_PARAM_*. */
>          SET_AND_MAP_PARAM(HVM_PARAM_CONSOLE_PFN, si->console.domU.mfn,
>                            console_va);
>  #undef SET_AND_MAP_PARAM

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

