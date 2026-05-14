Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF9lBwxaBWomVQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 07:13:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7EB53DEEB
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 07:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308654.1580025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNOO7-0002FM-9B; Thu, 14 May 2026 05:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308654.1580025; Thu, 14 May 2026 05:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNOO7-0002DB-6S; Thu, 14 May 2026 05:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1308654;
 Thu, 14 May 2026 05:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNOO6-0002Cz-0O
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 05:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNOO2-00E6X3-DX
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 07:13:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0559bf-bab6-0a2a0a5309dd-0a2a4502a652-46
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 07:13:31 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0559fb-af86-0a2a45020019-a237832fe72e-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 07:13:31 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 936184EE3CC6;
 Thu, 14 May 2026 07:13:31 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778735611;
	b=o4LYxBwvn6sKBJvvv8iC0km2iJEX+krdKHCzU5aDaBBep9QsB8gISDaJCSMWQjI7esSg
	 xJNPhCaTBNidtBCQWuA5ofkBANRoVQ8u3EMzCh4ylGM3t/WK+4uXNYQDE+l51aqqknJfF
	 VnPbh93zI4IhwuBZH7fH/GrL5rmU5jOSdHbvU9fMEvkAX+TWcbKT9EZwbY4kh5Ob3Poid
	 h10tMllmS85UezQeOS3r+CyrkhyTKffjs05qJD8B2derQA4fr+6yhvWSTtc1ncdwqka3C
	 575jVJK9wRoQUyWhrJ5QRjiByU4VHtaIP32dFXKjGHCCgS8HgpdJi4jqFKrCVI9Zr/KnK
	 j6GQsiCwh2mHYAExyeyB33Ntn9lY16WnoNUabVP8teAbnIyWWvT6zBWtRjmOlGmj7DadW
	 UGhZ8duKtGohheCCZYDOexgW4HNNpyRnzM7fOT0un4wJ2x+Wkk+KbIslCO+xZHHon0dGM
	 BBKZ2jzlEJPiT12UOP5XaBW9bcRarXjrkUWXBKx4ajXLi8tjZQ7cm8fdeMMiD2owTySHd
	 tBV5KkUgZNR8JXPrD9bh9AELykA2dob6uzqnx4iaMrC1Mqd/YW58PDC0TcVZI7nlVF6hH
	 gC3B/UZJsXTE607y5AK/hYZq56hiMHB/bFsA7QbbZGXLjUkyT3l5ll6ORuejCjE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778735611;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=qMgjClQG4L0Cwyij0BS7SjO9YGLwjbCqLC4+pd/ehuY=;
	b=GCttkv0KgW4YdmwUkdmrlLifMbd8YYpGqHd27oKo+GVvu43M6huEpFy0dfkEwQVk3l0X
	 C4Bq865lMTmPHUesbLaUo4c0xJ8xbUrAvCe2KtLdnXSLbf5q/X0zndBMzTQUm102yYjdQ
	 S2ytP47WIrSNgIguRCAjufyMEqtdIQbfxrFKMcXk4ktOtN9aqUmKyBx45vm3zTRFbG6fx
	 uBvoWDdERkFSa/0jAZrx2prgGGWEZFWOlZtjQ37wMU1NMHKRt4muzsSWEbyNTFStdiK5H
	 iJyI3jWMNXr6nyquKdegO9si9nUq19lYwiCaanmgUndhb8ltRdsIdTu/5g5KpK/RT9aKr
	 3gvD3PnT81FfGrsir+TKuqVcUYv7RGL7CgcCNMCsDMBU6JQ6OkIP2JDJv5NVuHrPI8utH
	 +WfUXw6rrDdrNqXwIvHNwQ6GchuIVyGrN/EsFfkc/3KjJLVj6GTy5sG9EhAomPLQ7/OcY
	 q/SClOcmdw0Yi+cvhL4X7+9hHhqjql7/ZryoAK1CVJuhkA5B5hIaaZ8ZOmsLYEPf/anHp
	 6yg2WCMFJlB1h30RT38f4ca2ySKfeXbhq0MFFJZ07JhUTY57eXeGSDfe0MAfssQBkWqMq
	 k456tILie2TqJcmMs4cuB19NZZrtchJMQFJiUInYLtNaCw0ccgbS/fEosYWH3Q8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 14 May 2026 07:13:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/shadow: deviate guest_va_t wrt Misra C:2012 rule 5.6
In-Reply-To: <4c96b39c-ddfe-41ad-ae6c-3393dd4f9e90@suse.com>
References: <4c96b39c-ddfe-41ad-ae6c-3393dd4f9e90@suse.com>
Message-ID: <f23600207d41194b1773cf21a37cecea@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778735611-AB563161-AFF1F1CB/0/0
X-purgate-type: clean
X-purgate-size: 1367
X-Rspamd-Queue-Id: BD7EB53DEEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[b.sc:url,suse.com:email,linkedin.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,bugseng.com:email,bugseng.com:mid,bugseng.com:url];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On 2026-05-13 13:48, Jan Beulich wrote:
> ... ("A `typedef' name shall be a unique identifier"). Much like 
> already
> done for guest_intpte_t and guest_l[12]e_t, but limited to 
> shadow/multi.c.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> 
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -143,6 +143,11 @@ number of guest paging levels."
>  
> -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
>  -doc_end
> 
> +-doc_begin="In x86 shadow code, the type \"guest_va_t\" is 
> deliberately defined
> +multiple times, depending on the number of guest paging levels."
> +-config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/mm/shadow/multi\\.c$)))&&any_area(any_loc(text(^.*guest_va_t.*$)))"}
> +-doc_end
> +
>  -doc_begin="The following files are imported from the gnu-efi 
> package."
>  -file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
>  -file_tag+={adopted_r5_6,"^xen/arch/.*/include/asm/.*/efibind\\.h$"}

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

