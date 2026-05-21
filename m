Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMkVK8cVD2qVFQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:25:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EF5A731C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315278.1585099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4KU-00056P-RP; Thu, 21 May 2026 14:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315278.1585099; Thu, 21 May 2026 14:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4KU-00054J-OY; Thu, 21 May 2026 14:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1315278;
 Thu, 21 May 2026 14:24:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wQ4KT-00054C-Bb
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:24:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ4KS-003O6f-OD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:24:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0f15a1-2eae-0a2a0a5409dd-0a2a450b86aa-48
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:24:52 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0f15b4-212f-0a2a450b0019-a237832fb00e-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:24:52 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3D79C4EE3D8A;
 Thu, 21 May 2026 16:24:51 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779373492;
	b=2nJZJvCDfthLX3d/AywBUR82gf+zpaZt+Fjn+/N/jhLvD0mnN1Nu0D+AMW1e7yqDNHnB
	 vRAzuYnzuUII+0W8TSJsLTntHvN3EjXoLZVvNWMDRFiU3A+PBjokLkI0at6FD5O2FspV3
	 TFA4vP9MJLQA7wqVvCSVRblsq0+xazQO6aUBkOYZV8udEBYaxTrqqwiVmWU+SIDvMau/H
	 F4liOyiVC8GkOU5Gd36O6+9KikKUq8/1XZ9uUdv28fCWP4mSVCqkRRRdk50CkEB9qZWCH
	 j5AMFh2YUO1+n72putv2R2pBNKn+/nBLYzhV1149apiVXsjqJ74FmOpVHBkg/Xb2VgDQI
	 qrILVW98IjzsybiCiAe0CpizqoH1h4Zg0nVEQyUIRZYM1/G516EM1P4V4XdLQYVAp1yP5
	 AnM9GFk16cY0fXovTA97MgqbkBt5c5vYPaoAofe5Q8LEH1OIkAyYB7INWsz5N9kBE0PpX
	 H0IxjbKtn8fRNXnStJFV3tDUrm86z8RRBFS71xt8Us+2Np0qbJrHmiqFMA0NFY9KOtBwc
	 9GbBZDijN1j4lrbViOx22oOESb8/f/mDQe2vQ3YBTFScL5B5YTvSZQj1X/vron7oAtSvk
	 0mrw2BAZCEw9KpYf2B2fw6Cbg+bmYWot8wVZouIAB/f7SobphD/rn154IjaYZ8Y=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779373492;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=2kIBIalVSnUduM9+XigotZF1KqV+aPJCsd7ouGZg7UQ=;
	b=bAnrFCYgdiEhtlgUR6oZNTLhYBe3C1y0CDZ8sRWD8Y8RkN35nPoh7yG9JNVq8lS8l/Ge
	 8FSJ/uF4hg3zoBlDbVFOCmasSCSubREGTsJQBHAUWo0lttQbUFg2AD4xvBikIeKmR5kV2
	 6XoYSoXGA7fBN9gE/UK+e0j/bwoqJGTAASKks561uzYXlYUKX1eWIVQ8tXdt5trE1iL2p
	 9fYDylh7CusIxphULML42DrcPiu98BusOy2Gq1ZqCGgVpD5iNU2srraRlU8J2zPOXGj00
	 vFnCZ1fG559eMzVDQ6cO+28FpTnhb2/K5YgNKkJmc7w8YQ7ZLMv8bAL8rqCkC5cDeA4vt
	 yAfQKZbTw4V3tsFR2pvzPFN/8pQiDY9Aw/VDHxm/zsS+bnFngcHznB1jyI4ar1oWVLyvs
	 oVyZwHj5W4u6etNqMZTuQgQhdKwXlMqiOCzONMmJNsM3bOmdWDq33VgNEKrvDr5vhwKUh
	 eBp/qNdCvArEW2hxlCJlHR83zX0JasljVvmMgtFfe20aIcWjCrfVBNgcpcvM4v3rMeiu4
	 enZk2qtxu91ZOyAbn1i4yvDJT86VrH1ZE12H1Gs8UOvPfPaPWxWOeNBtN2SIwSnrTswmL
	 kLP8KIwMitCCS+S9K65wRGl1cDwuX+XqOGySjxYUdLbApeRyE72Mkl4XQ76JCj8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 21 May 2026 16:24:51 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/2] x86/time: address Misra C:2012 rule 8.3
In-Reply-To: <09e58463-4eda-46da-83e0-bc66c84afb25@suse.com>
References: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
 <09e58463-4eda-46da-83e0-bc66c84afb25@suse.com>
Message-ID: <1b9724be44ac321a7efa0852014312f6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779373492-19364F3B-B24F2715/0/0
X-purgate-type: clean
X-purgate-size: 2229
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,b.sc:url]
X-Rspamd-Queue-Id: 5D7EF5A731C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 14:26, Jan Beulich wrote:
> Before we can enable scanning of time.c, it needs to be clean wrt 
> blocking
> rules. Bring boot_tsc_stamp's definition in line with its declaration. 
> For
> get_s_time_fixed() go a little farther and move it to the x86 header 
> (the
> function only exists in x86) and do, along with correcting the 
> parameter
> name, the u64 -> uint64_t a little more widely than strictly necessary.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> --- a/xen/arch/x86/include/asm/time.h
> +++ b/xen/arch/x86/include/asm/time.h
> @@ -13,6 +13,8 @@ static inline cycles_t get_cycles(void)
>      return rdtsc_ordered();
>  }
> 
> +s_time_t get_s_time_fixed(uint64_t at_tsc);
> +
>  unsigned long
>  mktime (unsigned int year, unsigned int mon,
>          unsigned int day, unsigned int hour,
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -95,7 +95,7 @@ static u32 pit_stamp32;
>  static bool __read_mostly using_pit;
> 
>  /* Boot timestamp, filled in head.S */
> -u64 __initdata boot_tsc_stamp;
> +uint64_t __initdata boot_tsc_stamp;
> 
>  /* Per-socket TSC_ADJUST values, for secondary cores/threads to sync 
> to. */
>  static uint64_t *__read_mostly tsc_adjust;
> @@ -1656,10 +1656,10 @@ static unsigned long get_wallclock_time(
>   * System Time
>   
> ***************************************************************************/
> 
> -s_time_t get_s_time_fixed(u64 at_tsc)
> +s_time_t get_s_time_fixed(uint64_t at_tsc)
>  {
>      const struct cpu_time *t = &this_cpu(cpu_time);
> -    u64 tsc, delta;
> +    uint64_t tsc, delta;
> 
>      if ( at_tsc )
>          tsc = at_tsc;
> --- a/xen/include/xen/time.h
> +++ b/xen/include/xen/time.h
> @@ -33,7 +33,6 @@ struct vcpu;
>  typedef int64_t s_time_t;
>  #define PRI_stime PRId64
> 
> -s_time_t get_s_time_fixed(u64 at_tick);
>  s_time_t get_s_time(void);
>  unsigned long get_localtime(struct domain *d);
>  uint64_t get_localtime_us(struct domain *d);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

