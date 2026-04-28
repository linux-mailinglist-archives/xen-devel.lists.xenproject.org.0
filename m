Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL6tOgoX8Wm6dAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 22:22:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666648BB2D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 22:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296845.1573057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHowf-0004HF-Ne; Tue, 28 Apr 2026 20:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296845.1573057; Tue, 28 Apr 2026 20:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHowf-0004Ef-KZ; Tue, 28 Apr 2026 20:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1296845;
 Tue, 28 Apr 2026 20:22:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wHowd-0004EZ-UF
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 20:22:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHowd-0066fT-AU
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 22:22:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69f116ef-bab6-0a2a0a5309dd-0a2a4502d1a6-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 22:22:11 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69f116f3-af86-0a2a45020019-a237832fc7c0-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 22:22:11 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id CDB514EE3D4B;
 Tue, 28 Apr 2026 22:22:10 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1777407731;
	b=L9HYxzD6yfMPRcXI/KX4VWloGcTZVZZ30lzMkkt93oSxTomS1U/RkMKT6xEKT8GuasXw
	 SHeOI56NMaIV4GsSxO9VsoDxtfhFVFVC2AzihpUhu0GHRUVOZnuaHiGBVqYpyR4ARXUJH
	 aiNVUdbH6cS2SMZ+HwE/pM0kG4feaT0IY5iHT0KLchqWsWBvIuR3rAw1hPSBFGdhT8cjC
	 LK6E4h58TldThHe+A1ZUCuku3i3/e0mqOTxz4Hj8qwM1BdfoJU7i1qnjlUU8DZviOu6/F
	 ekDuVdD93D7iTvRdBkC6p8iiLxDr/ABqrgbWwTK4KeSgX1zg5h9iTVatYWDko0/vRAVHF
	 hpO9/O4gEsve1GmIcUI8gGey0eqOC4iFCI4375q6ETb3xtd87ePzJxDRhnqSGfAaAOCWr
	 wE45EzhfzM3zXB4u/gEDkSEKGiWQ9ZOUSUS3x9qJyBGQpSzHX6OMSYddfjYUox23tYNSH
	 guR4NornV8V0dvRqNztFt/tAiHQfCMRE1nNC0INUOMZTbHfvi7rG5dzWHkxALPchlKL0Y
	 WHNnOStdK9M8w2JkwfIDFvnM5nRXvIHw67rJ8yk/pgnV6jipIswWZS4ffnyj7mIm5TLpW
	 yEd7UPihXrHVqixabJV9FyNBmD5ZZi3SHQtmM6b33mW+obf17CpJZdKPVeGzTOk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1777407731;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=MeGrH7FFVtCqyv/NbgnvNcXlzgvwjVd3HPzbRlDpFcA=;
	b=XR0X/LFs+qjMVkkJXw12/NPWZHxnmWz3/JWRN5mzwxFw2ABmqQK8uiGkzQhBiMw/VQFb
	 A1gqOlzmTR07Uo/fHugo/gUgtKtTgB98psyiaPoslfuGzfubminfX1++0SKolO/nIrsf0
	 IQoTCIFZAy3ft8w0IAdgiFYHSoFHhII61HAvmV2YsjZcJMcPRSaelGLdRZ5dzu1PBW/kG
	 HDBGgLA40ru/Lu71sKz8IiNyxg0V4K2sAsqjCuhn4gzNI6kxLMF8uj09j5OkXpfro7BnA
	 IWFxhbsAzvOvp+ZeceuboT/S9pL7V1N3c5yGNKMH4AoaknKDa/ck3oHJga5sroc+HQcYD
	 eJ2yGg5oSm2Gly0k4LeWEzZxJ6kTcdFD/YjTM3FPiUGMQE7FW/dA1ImNTuBxWw4LdyMNy
	 McSMnwY+mRW6iwdEwZzC2PoTtVgip7tu8qBqPtzakMMWqO56nJzeVT2HZjDGEsHqs6+tB
	 20/X2PUpTRoJwfAlTz7CGTF9QHcxZQK5K4WFEeX+GsiHtAHw3lhOzu6ZUWL3tF86bGi1/
	 /7yZnch+CM/Qe27cHb4sz85410uZjB9V8grepeJuJqqts+ejmuNoG8+gnuOi/CwKte1FW
	 erine2Zim4qdXYQ02fDQr9ihsuqpKMFZnJ9SwIrbWJ9dyfE4d0qS0bIDBmXNFAI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 22:22:10 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs: Format (void *) to fix reStructuredText emphasis
 warnings
In-Reply-To: <05b61bdfce381176a6c4b8844db1fba3fa0982ce.1777401225.git.bernhard.kaindl@citrix.com>
References: <05b61bdfce381176a6c4b8844db1fba3fa0982ce.1777401225.git.bernhard.kaindl@citrix.com>
Message-ID: <a5b035c721707c53756b45e48ad473ee@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777407731-82D6F161-4F702448/0/0
X-purgate-type: clean
X-purgate-size: 3849
X-Rspamd-Queue-Id: 4666648BB2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	NEURAL_SPAM(0.00)[0.549];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,citrix.com:email,b.sc:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,bernhard-xen.readthedocs.io:url]

On 2026-04-28 20:34, Bernhard Kaindl wrote:
> Fix warnings when rendering the Sphinx documentation because
> with reStructuredText, in the character sequence of '(void *)',
> the characters *) are seen as an emphasis start-string:
> 
> WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Fix this by formatting it with ``(void *)`` as an inline literal
> which can be used for monospaced code snippets like these that
> can contain any characters without any markup interpretation.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

See nit below
> ---
> Preview based on the new theme and design docs arrangement just 
> submitted:
> https://bernhard-xen.readthedocs.io/en/void/misra/rules.html
> https://bernhard-xen.readthedocs.io/en/void/misra/deviations.html
> ---
>  docs/misra/deviations.rst | 4 ++--
>  docs/misra/rules.rst      | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index b04830959694..c972d5b2ad49 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -366,13 +366,13 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `safe` for ECLAIR.
> 
>     * - R11.1
> -     - The conversion from a function pointer to unsigned long or 
> '(void *)' does
> +     - The conversion from a function pointer to unsigned long or 
> ``(void *)`` does
>         not lose any information, provided that the target type has 
> enough bits
>         to store it.
>       - Tagged as `safe` for ECLAIR.
> 
>     * - R11.1
> -     - Conversion from unsigned long or '(void *)' to a function 
> pointer can
> +     - Conversion from unsigned long or ``(void *)`` to a function 
> pointer can
>         restore full information, provided that the source type has 
> enough bits
>         to restore it.

There are further instance below which should similarly be rendered with 
a monospaced font, as they are code

e.g.

The conversion from ‘void noreturn (*)(…)’ to ‘void (*)(…)’ is safe 
because the semantics of the ‘noreturn’ attribute

Perhaps those don't cause warnings, but if we want to visualize this as 
code in a monospaced font, then it probably should be uniformly used in 
the document. We haven't been 100% consistent when writing these 
documents originally; partly due to the fact that different people were 
involved, but this could be an occasion to remedy that.

But perhaps that is best done in a follow-up patch, so feel free to take 
my r-by for this patch.

>       - Tagged as `safe` for ECLAIR.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index b3e929307d51..fc6fdfd313d0 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -430,9 +430,9 @@ maintainers if you want to suggest a change.
>         and any other type
>       - All conversions to integer types are permitted if the 
> destination
>         type has enough bits to hold the entire value. Conversions to 
> bool
> -       and void* are permitted. Conversions from 'void noreturn 
> (*)(...)'
> -       to 'void (*)(...)' are permitted. Conversions from unsigned 
> long or
> -       '(void *)' to a function pointer are permitted.
> +       and ``void *`` are permitted. Conversions from ``void noreturn 
> (*)(...)``
> +       to ``void (*)(...)`` are permitted. Conversions from unsigned 
> long or
> +       ``(void *)`` to a function pointer are permitted.
>         Example::
> 
>             unsigned long func_addr = (unsigned long)&some_function;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

