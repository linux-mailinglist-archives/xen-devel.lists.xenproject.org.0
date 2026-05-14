Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fc0KAdZBWomVQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 07:09:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F953DE17
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 07:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308649.1580016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNOJ2-0000j6-Ok; Thu, 14 May 2026 05:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308649.1580016; Thu, 14 May 2026 05:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNOJ2-0000gL-LM; Thu, 14 May 2026 05:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1308649;
 Thu, 14 May 2026 05:08:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNOJ0-0000gF-RC
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 05:08:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNOJ0-00CCBm-4N
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 07:08:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a055840-bab6-0a2a0a5309dd-0a2a4503cafe-40
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 07:08:18 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0558c1-672d-0a2a45030019-a237832fc9bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 07:08:18 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 75C674EE3CC6;
 Thu, 14 May 2026 07:08:17 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778735297;
	b=HU7ir73JHh4bqBYVlghZSSy9tINrqM0O46x9IbQsS9AtmVRo44wtvXLJRL00tHKcVMU9
	 P3s+s+Ms4n0Mgm0q+6WxHjidXTvGiTgGTmdvzq9sd0J1dEEb01vYBrbX8UfuvL7j8Yf1V
	 jlM8/bTJkFLfW1akiId3fUcTIK267MVRA+dUeWXLM2U3+ifLxV0jAHiObj/GKeVNr8Mcm
	 UAc2SFmdnr1cU3eMtWFNjX34QmMYKXqa9QZzB8Ob8qWGrY15RnSWns1vSiSW+PDymUekS
	 c0ip5hpm3N6r0u3dS/faLGMLGlepJ9N2pzeyHLqYPDlJD0AOADGCVZBrAO9NGD41ydfNr
	 Zn24700m0Y21nqUYMCpJ3G7ui5Bf9l1j+F1lL7Un4I4cVENjT/uHF8svdJQjoO+9wpbLt
	 677JCK361Us6pkRSh0IPimPRWq5P4xg+tZbJnhKafJWwcCiqEACaz9Kyh7tdl0DYfj+aI
	 PVrzKkAFIh1I1zQ29kxm8eKu3XA9sB78rmU1xRGWUCdJEY6876qMD7L0RSSsF87s9Sn9L
	 cIgnIKpDQJ1eBNihbmEQDQWBzQ79XtLkXldfejd8VdPANDepljnUDG3P0MXtDKNSPpZiS
	 2s++f6BsM2wCaCLJw7/6bjgQTTk2SOI+p3nzknhKMotqRoht/yoRmjD37TFNl6Q=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778735297;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=7WnhF5P5oyrjZcB+Lkpp4p2tNB2BJVW4TYeLJP1ZrWw=;
	b=d5tQ8LtNIo1oRlyHywkztgwLysYOBQlMO5yni4ahpeRe2VEFmrNb51nhdtlDwesNhX+E
	 RVgQGhOQxltaV1bfDkVZyaGwMsAFl8nDdI+3+PhuQi6HL+g5uFCYO42POGXerRexxaGF7
	 LG/RKYTKGXZZ4PENaEf/2J4ZN95oFy9bvf9sNTih9oWZgfKcOl2CmBkus0GTGxLwz5JL7
	 r3UoKo40ndIQIpUkH21If8t1f3AvAkj2v+ulMxvIb+l66f1NlSNRaVmZhkQ865RayEUv6
	 gsyXZAbNd+CvZrpROaUT0MC8zCXZy5y7r/O/wkiiSWwWeAL7pRSZoc9g0+ZChI/G+VWTf
	 E30nFn5lDP9WDwgFuQs54BtYXcE7h1a85EfF2ExzNqbC8n/7IuCH2lk/AI78ZdBG4Lmtt
	 7pqZZDpNti/s8unYy0I+mBzFX6TNXjBi6QYjJOHuwJZMUW7nqTYpzkuVrZ7BqiSCJnBe3
	 x8BV6JM5gpxK6N3a976tWvt8GGoJxVHIFbY69abf5TT2osnfZuPxYIM+BGDAmTpkchSIH
	 JSfttKvRfMpesHWc9dX9zvCtv/oe+SNU5hjwt9HccsnLO1TVapkXbWpPvj5Qum4lMwcaK
	 j+I6PvdJvtXACAOzembfR1hsFYr61Gtl1zkJ+udj9kdZdDQD9QxVio6PDFulmoI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 14 May 2026 07:08:17 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/5] x86/shadow: split a nested max() invocation
In-Reply-To: <146d214c-e766-4b3f-bc50-0b9beee50473@suse.com>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <146d214c-e766-4b3f-bc50-0b9beee50473@suse.com>
Message-ID: <337dd83065dae7555dfecb2163241ead@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1778735298-3BF6A938-84558477/0/0
X-purgate-type: clean
X-purgate-size: 2674
X-Rspamd-Queue-Id: EE1F953DE17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[6];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,linkedin.com:url,b.sc:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

On 2026-05-13 13:46, Jan Beulich wrote:
> Such nesting causes the inner instance to shadow the outer instance's
> macro-local variables, thus violating Misra C:2012 rule 5.3 ("An
> identifier declared in an inner scope shall not hide an identifier
> declared in an outer scope"). Use an intermediate variable for the
> inner invocation. No difference in generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Supposedly this case is deviated (rules.rst). Does that deviation not 
> work
> quite right? Actually, am I mis-reading deviations.ecl or is the
> respective setting only covering the combination of min() and max(), 
> but
> not multiple use of the same macro? Furthermore, why would e.g.
> min(max_t(), ...) need a deviation? Even more generally, aren't those
> expressions too permissive?

Yeah, it does cover only mixing max(_t)?/min(_t)? because that was the 
only pattern that emerged in the safety scope originally. the _t is not 
there for mixing e.g. min(max_t(...), ...) but rather for 
min_t(max_t(...), ...) and viceversa; could be split if you think it's 
worth it. These expressions are a tad broad, because it's way more 
complicated to express the condition: "ignore overlapping only beetween 
identifiers defined in the expansion of max/min when used together". 
Perhaps it could be done, but then if you are already implicitly using 
shadowing in those instances maybe that's not as serious a concern?

In any case, the patch looks ok to me, so

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> 
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -767,11 +767,12 @@ static unsigned int sh_min_allocation(co
>       * megabyte of RAM (for the p2m table, minimally enough for HVM's 
> setting
>       * up of slot zero and an LAPIC page), plus one for HVM's 1-to-1 
> pagetable.
>       */
> +    unsigned int extra = max(domain_tot_pages(d) / 256,
> +                             is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 
> 2 : 0U) +
> +                         is_hvm_domain(d);
> +
>      return shadow_min_acceptable_pages(d) +
> -           max(max(domain_tot_pages(d) / 256,
> -                   is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0U) +
> -               is_hvm_domain(d),
> -               d->arch.paging.p2m_pages);
> +           max(extra, d->arch.paging.p2m_pages);
>  }
> 
>  int shadow_set_allocation(struct domain *d, unsigned int pages, bool 
> *preempted)

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

