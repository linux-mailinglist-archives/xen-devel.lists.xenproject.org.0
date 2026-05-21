Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLiiMwUWD2otFAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5A5A73A1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315283.1585108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4LY-0005eX-4B; Thu, 21 May 2026 14:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315283.1585108; Thu, 21 May 2026 14:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4LY-0005bh-0Q; Thu, 21 May 2026 14:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1315283;
 Thu, 21 May 2026 14:25:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wQ4LW-0005bW-8T
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:25:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ4LV-00B8Ai-Kz
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:25:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0f15f2-e002-0a2a0a5209dd-0a2a450aa83a-16
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:25:57 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0f15f5-56b3-0a2a450a0019-a237832fa9c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:25:57 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5515F4EE3FFD;
 Thu, 21 May 2026 16:25:57 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779373557;
	b=aE7aC+DuA42lS5q/Bg/smYtOC5vKwnG3cKYbSl8ybREkIDp3bfQG/U7kR22US7UCH4j2
	 f7LwO+eYuQK1+2MdfVwY9PlxHkC/izmdD+bxsmStk06gfAKZOILtlyXir4paqIDpOWYoB
	 KWBUxcHbagvGwI+WgKh6eIPUa8WU9xzbOUgiCE9VZ6dd60xn1U6uenAJt5Si+kTpAGnBn
	 OzcP45NBWFQcs2v6AVCNJli4KIpu4Hn9YvyOWpMYZJaCABQzO2yKy0pMZo3sBEJpPtQb6
	 qgwapN2cq/n8Na2XUjeFdXyoZpzcMUuXIRD5AjBNihdNVfAoUFLTzd83nvRwnO8M6Ncj6
	 IjCO3AMnN5M/rOCaO2O12b4miVThlbzXkwhcxYZoCY2/+9aJ3a1a5GzsVcuWV1kVr87jP
	 7qGHYEroIIolMNQEeg5uh3rumvX4Z4r+Tl/aIckD8+Y2d3It6BY0Y6vJ1mR7GYj4YjTA+
	 cKqe9u3/PkEE966uPB10ETFNvHQA18F9fjLmAV++odMkxLGeLdhlkJEjGaEHvs7wPzH3K
	 yaehrYNBpzaHwl69tsGgDT75p3PqZW1Ys2890m3GZU/pEuR39M4u86g392jrY73mNhFlH
	 i8v7wrKgh0Pomtx2KsffumJKNSdcxNijuaCtNNjuP4HOeHT9FCE1Tc7axBiMnj4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779373557;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=dp/o+oIXXcCCQ2xcGMfkA4KluUYXWS+QdJHoSLMHecE=;
	b=CaYo8076vqgDTd9d4Xs2H0OjHDP805kxsoPEyDVuhUqKGfKwYNgeLBInda7upCdIHTv8
	 WC2rCj+botuDSvbihAT+abFhyl7nbKQNIeEbnAPvonmI3K9RtP1SeQAH27xryUIdm99qW
	 xR8v+IE/KU5Q62+aVP5iKQfgNJRlOcxoPhwFzVq0JNjFN+/mQ2HkG+at/n7RUem5pAMXZ
	 D/LoFnhZB7Ce7ootsposjq92qjeTcz/e/PFzMkv1vtgOLaiL58zDtZG5uxm8kTUqvS76X
	 WELid01B3ZqEmOLOOe+NYjsTnlbX0AnyocLTMnwYzeNpiUHpcoiLemCnVo8VarEMT8/WS
	 mrQxd8M5wHOMrTslqWcrjZFMUnzJo3lMwCntOdAEhkmio73bew6fbR1/RhCmU41ipOyED
	 6Q0IUd00UkOjtP56Lfj0j1J1Gny+ztc0fFE6RNLqQxvpIGBbBJ1khV2Q+nNpRenL0P+Pn
	 LxDykfS6Rg0DuZvddcaRQ6o7Sa5/VthbP7fRwofkLJZfhcHmDPrWDTcVnW0cxfJHMzZev
	 /5WvF6SePu0ZuIR19hXFKXNsYIazYuq8OJoXG2Z/knCMlKecvd+EFlPR6SS8Q6nk7sChh
	 f27kq0iD7i0GqNoct6vRQsKX7GOPHh/U2miG0LXpOIalTVc0vb8d/gk2dEG1Ej0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 21 May 2026 16:25:57 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] x86/time: don't exclude from Eclair scanning
In-Reply-To: <81995cf4-19f4-4146-aea7-d3e57609aa2a@suse.com>
References: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
 <81995cf4-19f4-4146-aea7-d3e57609aa2a@suse.com>
Message-ID: <3fd25161430c25f855fe0ba291b5bebf@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1779373557-7D7878B7-BBA745B5/0/0
X-purgate-type: clean
X-purgate-size: 1280
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,b.sc:url];
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
X-Rspamd-Queue-Id: 7EA5A5A73A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 14:27, Jan Beulich wrote:
> The justification is wrong, and the file hence shouldn't really be
> excluded.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks for addressing this

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -214,11 +214,6 @@ const-qualified."
>  -doc_end
> 
>  -doc_begin="The following file is imported from Linux: ignore for 
> now."
> --file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
> --config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
> --doc_end
> -
> --doc_begin="The following file is imported from Linux: ignore for 
> now."
>  -file_tag+={adopted_cpu_idle_r8_3,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
>  
> -config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_cpu_idle_r8_3)))&&any_area(any_loc(file(^xen/include/xen/pmstat\\.h$)))"}
>  -doc_end

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

