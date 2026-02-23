Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJGpOGoBnGn6+wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 08:27:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB2172A26
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 08:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238445.1540056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuQKj-0003uQ-RU; Mon, 23 Feb 2026 07:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238445.1540056; Mon, 23 Feb 2026 07:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuQKj-0003s2-Oj; Mon, 23 Feb 2026 07:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1238445;
 Mon, 23 Feb 2026 07:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RlNO=A3=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1vuQKi-0003ru-RL
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 07:26:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf18e95-1088-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 08:26:08 +0100 (CET)
Received: from [192.168.1.170] (net-2-38-49-5.cust.vodafonedsl.it [2.38.49.5])
 (Authenticated sender: roberto)
 by support.bugseng.com (Postfix) with ESMTPSA id A33434EE77F9;
 Mon, 23 Feb 2026 08:26:06 +0100 (CET)
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
X-Inumbo-ID: ebf18e95-1088-11f1-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=2.38.49.5
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771831567;
	b=TZNyPqrNVKcx7wLIz4awO+SMrLrBvy3a6WkyVgYYSVvz8Pc7YqLJPzDNML2cmCBZj9Qf
	 EKP1o2JqLO18F/bJatqXvJpO0T0kI4GCoVP6B9VxTDxxbSKSIFm709xxSpya4kiG4dHZO
	 21ArhJriWvoXkX8Z3dDsqS7K7SKLLV0Q0j/ON4H0Aqu06W287cw2BVROwCfIjTq4uHlIh
	 XGN5fiAEW5sNEGwPk0DRyw12GVoowoXJwpE+BWFs5xn4ywmv6GpIn47Zv+8AGagBaGojQ
	 VdTIlqJsNnrmkv3en89J8P0q8xejjVEn0TWUSjSs3kcVlVia05wBbAukpvoxk7uTAfZlX
	 cyKTvQ6vPy3CuraSFUbkJnIQzlsepL72wsNVBbUrttj+NmKYjmbTSCIEC2t5QKnyO5Dye
	 v0JTwwQVwPzUqih2c1TOp5piF1mO3BLDIrZtSu22ufc/tEWdp3ifEopwUUcfurBrcaL9R
	 +T0wOgd7RSnwVZM01UGW8Unn8P53CI5yLVNnIaXWblsPNr87ZS661+YQg/0dJR6a+I4Ku
	 e8mXAgv9Bnc4ROne6/K6MY1jK4LQfpZVDADulxgIAsK4tq1TXmaLBim+KkG3GBYkGRFWN
	 E67Q/sbtsy51yLBV4CYSLF9WBQx15JaD4kFznRqnNEr7JWKC8ifYnmSueX/KnH0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771831567;
	h=Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DwE/1ASKJC5tWZ7jTRV4LXXRfDVeXh2O3vipPCqXy38=;
	b=EXeCL+Z9oKZUs0oewbvReI7K6Kc5pVxXeJ79u8/F874RhnDgNfQWULT16SNvXbaX8wP0
	 thNSxpnGpGO/ILIFHQiv7H204P7Dt6/SbJ4ev/jpqTN72Q1rw566h4Y9MLfU3Qfcgs1Xy
	 hsBtFcRVQdiVZX86N8BaD4wlGUTQ3EPJu+4v0JbHFIUHBXkO+3HRKMBAi6bqNczycBtfN
	 lDQl6oDHTZd6dmO7rMDxg/iabFvFycztM/6r9Gmrdc1xzQCGFPNNB8Ur4vXDgl4CkUlTV
	 1xQw/kryspVCPvgmANrDt3gLn98I1aGM2LcYE6nH+HKWpxr4lNmq83m0EDdCJjkyjEQ2C
	 /BCPMVE8W/iiM2Eo8wRwc+9NPnHbyys02RX0ILuYIESvLfjVS+b5AXuH9fBbUI1wLSP52
	 rdwdR2kiqXQ/uDJ/8EivZsgunfSQrCVrK6qi7V653DS2pn0bGeBkF6Z7zN15rCuwHSIgv
	 dJALSaf3D93MOpJrqF7wNVayAUh26oaZj1KxOTXNlX6YmeU9b3wfSYb1dV+DL5UUNb8vl
	 QokHbjmpqLQAEzCYMMWbpwmhxjYdiFdoiO2tmf0+N/4gOj7em2JGSKP4Uy7Pyw/H65EIj
	 6ZzikIGAZ0dCDKJw3fiWEJ1MOq/2PihkTW+jAhDdlnn7X1/gf1sWmccMEc+SYpc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=2.38.49.5
Message-ID: <0148ea9f-6486-44a1-b4dd-47af7c978351@bugseng.com>
Date: Mon, 23 Feb 2026 08:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] x86/shadow: Rework write_atomic() call in
 shadow_write_entries()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-10-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <20260220214653.3497384-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roberto.bagnara@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roberto.bagnara@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bugseng.com:mid,bugseng.com:email,citrix.com:email]
X-Rspamd-Queue-Id: 55BB2172A26
X-Rspamd-Action: no action

On 20/02/26 22:46, Andrew Cooper wrote:
> Eclair complains of a side effect in a sizeof() expression (R13.6).

I disagree with comments of the form "Eclair complains" used whereas
the right thing to say is, e.g.:

   sizeof() expressions with "potential side effects" violate
   MISRA C:2012 + AMD2 Rule 13.6, for which each function call
   is a potential side effect

or

   Take out potential side effects from sizeof() as mandated by
   MISRA C:2012 + AMD2 Rule 13.6.

Note that in recent versions of MISRA C that rule is no longer
mandatory.  More generally, note also that, IMHO, switching to
a more modern version of MISRA C would simplify compliance.

BTW: the correct spelling is "ECLAIR", all capitals.

> write_atomic() only evaluates each parameter once, but rewrite the expression
> to less resemble entries in an obfuscation contest.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   xen/arch/x86/mm/shadow/set.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
> index 8b670b6bb555..96ba2811077e 100644
> --- a/xen/arch/x86/mm/shadow/set.c
> +++ b/xen/arch/x86/mm/shadow/set.c
> @@ -62,8 +62,8 @@ shadow_write_entries(void *d, const void *s, unsigned int entries, mfn_t mfn)
>   
>       ASSERT(IS_ALIGNED((unsigned long)dst, sizeof(*dst)));
>   
> -    for ( ; i < entries; i++ )
> -        write_atomic(&dst++->l1, src++->l1);
> +    for ( ; i < entries; i++, dst++, src++ )
> +        write_atomic(&dst->l1, src->l1);
>   
>       unmap_domain_page(map);
>   }


