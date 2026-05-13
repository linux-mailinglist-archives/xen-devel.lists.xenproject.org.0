Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELYSCWrjBGoNQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 22:47:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25853AA7D
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 22:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308446.1579882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGUH-0002Wm-Sj; Wed, 13 May 2026 20:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308446.1579882; Wed, 13 May 2026 20:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGUH-0002UP-Pc; Wed, 13 May 2026 20:47:25 +0000
Received: by outflank-mailman (input) for mailman id 1308446;
 Wed, 13 May 2026 20:47:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNGUG-0002UJ-Av
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 20:47:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGUF-00ERZn-OH
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 22:47:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e351-bab6-0a2a0a5309dd-0a2a45029ac4-30
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:47:23 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e35b-af86-0a2a45020019-a237832f960c-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:47:23 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 597354EE1D37;
 Wed, 13 May 2026 22:47:23 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778705243;
	b=XTMkqSKfD4wferpWcybbA25dl8SbGm+a5kQujPg8Vs5oydboMwj4yF3Z7naNkS5Y09F6
	 F0ajzAMNfppX84bhf8gQP0+NFeYcKums6pm3ihgT3n3T4XCJ7YPImfh+6FTitto8BJndo
	 4wcZvijFoivjWJj9sfFvWmFieLulYaBgJYLia50wYJ7iRcWxU1yokzsULcK8B7nU/VIzX
	 3fgHteTjE8Eh7Zpb70XPuCOaiVFEiUHjxHhN52iy2TI8/oBspK5Vd8pCESfOEVRJqZqry
	 86IEVUgJiBaRBaPNg+YmzN9Oh+oW+GKbLWGtw5Mll48cVuEkCLLHSbj4sB5CuHpXrSd7A
	 vjQ9FjPG5Q+9BQSV+NRXkNcnBn7QAKBF9FvpIj34UwZLUSakBycfi+O0VrXSXuZp8G2wc
	 Q14PVolSB2h33cW9sfrT1Zc42jmoHDCTAQ9lgPh0DHutLqROzXVa0h/X+XvGGqWEHgwGo
	 REiJe97/++S71oyNfcaKKB72Y7ZO7ftshARaagBMYosHOPlmhoMldknqLd46j/xQqIsFE
	 0PzNDRX0ALzaH2nVArrU6IUqMkaLyZilpGsZf2atLEivZTOK+SuDoTOrirNKPH9WSYCZ+
	 pWUDUyaOYEp3tvA2Ah3lWKeyPaF4wb8GhYqUmM+TtnA+yByZJA6MDxAdNVeKzfI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778705243;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=fEw7R8gfi4CKLZ7U1ZfvbeZdcg7q6TFeK8CtUy8K9P4=;
	b=G6nQMx3hJiPuOf7E4s7NQx9C5c50DfLN2TncDG6aPmY3L0ox1jEk0hvELTmS27tgtDyv
	 xufr2tREQpW7hpfCfZGtfuVn8nzXIb+ghRHbpixAgTWYoZFmAA9tQ3BHZoy9N3yj+oq3T
	 AlrxmbN1Zdq8t1uYKnHihOZdiyhw8RRWoRcvVQYvXj7ZnUqMlJCwoEtgKk3eaLtyrMOiw
	 Wx5O2rV67CRBEW08UyW4cX/UlUztijNXcdFjK6UQgF4iFPisK2/aWRTiE+L2X/VfSLE64
	 tCsNQmnKyhYydl/Nfyw+uMGwrf9TxUvJCqt/khlL5mOlIiu34j8UXITP+5sUY980FeO6D
	 Ge/HMFYPfvJk06oR7X5FgZo7zb5h2xbgUqrc4cQ8RSt6jhnz2JPZSw2htNB9Aab7Gk5sv
	 18nyKV912W3sc6uNdDTDEJgb6YU5EeTfHCc0mAr21o5rhUbOBdQbwF8tlS+pOGJXplgBi
	 mfn5s80CGZTscy1LvgqYokPpKTTJb49KU3N2IVlfk1CwcjAkeKWAiW8MoigiNkJhDPdd6
	 b3zlW+pxGDGllBJ+7WKk8ERYpXjzZOoe5yYJ/Xo5+G+w4LQfudIwtYqpP0PFC9iJCMMxp
	 X4knx6cAE4a3Xo6g872wFMBk8+q2F04oqfqgRGlYvgxHuBzzP30cyn1ve3qCngE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 13 May 2026 22:47:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
In-Reply-To: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
References: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
Message-ID: <36723a55f4465ab1a99041b8bb0575c4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778705243-A8979161-26DCF6F3/0/0
X-purgate-type: clean
X-purgate-size: 1121
X-Rspamd-Queue-Id: AB25853AA7D
X-Rspamd-Server: lfdr
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
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,b.sc:url,suse.com:email,bugseng.com:url,bugseng.com:mid]
X-Rspamd-Action: no action

On 2026-05-13 16:03, Jan Beulich wrote:
> ... ("Conversions shall not be performed between a pointer to an
> incomplete type and any other type"): Add an intermediate cat to void 
> *.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
> (covering more than just this)
> 
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
> 
>  #if BITS_PER_LONG == 64
> 
> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))

Notwithstanding the comment from Andrew, I think a comment here could be 
nice to explain what it going on, otherwise the double cast looks quite 
odd.

Unrelated: why not contextually marking this rule as clean to prevent 
regressions?

>  #define COOKIE2ID(c) ((uint64_t)(c))
> 
>  #elif defined(BITS_PER_LONG)

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

