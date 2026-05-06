Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPVDBjMQ+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:56:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C484D9054
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301496.1575780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYye-0005pK-Jn; Wed, 06 May 2026 09:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301496.1575780; Wed, 06 May 2026 09:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYye-0005mk-G2; Wed, 06 May 2026 09:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1301496;
 Wed, 06 May 2026 09:55:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wKYyd-0005me-4M
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:55:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYyc-00FYJY-BV
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:55:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69fb100e-bab6-0a2a0a5309dd-0a2a450ac94c-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:55:34 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69fb0f9d-56b3-0a2a450a0019-a237832fa2ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:53:34 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id BCFCE4EE3CD2;
 Wed,  6 May 2026 11:53:33 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778061213;
	b=px8G2yXEIN9aQ0VKbJeoLEXkn3Pqgo1XmG1bO7jb80ujXnvEGjXCtRJg+M2EdiIULwGi
	 5c4yziMexQoRlWyC5CZCPjwIkJdtIh+ik2ZDR2fJKhyc/HyOnu5+DBZvi5WR5HbyJK2xp
	 f5ef142YxTojay6wZLwuxKqZT8JEL6LpjdutwfX7z/9H/zNfHMU1l29WDI1/RyBkNzDaf
	 OUu8vot3hsunXEW0UY3QdCi+37MKUckLSDJ9asIRjyo40MuWBy6oEzwGYrjqGl1jx6tLL
	 i2PmKxPfraiMTw77nk7+pQQI0MsuSLqRBjc7ZuoLGO4SXK0e3BzNtO2ONHl/QjohlUfxU
	 eUWpKAbiiCJBdNOZv8xWBOLTtkAYLN7YaPIM6Y67ODll6IYfaspZWWWZokouy5TEFlOwt
	 uZZFUyDTQlrJlVViUiBrucemanQcKF8wMzaLDCriO1OZ8d2OPpdscK+P4nfm0NNpwOmIn
	 Y3lXMRR8tsaJAS92uzoapDAVJJZFSu+a7Ezo8BNxLwrfYiWavOXd4XWHXKHUBSU9BBWHa
	 8iX6OjnMIlGjoDMmE85Vq/PdpSeQ5b+vskFz17KKnHKPZrADEheS4xgG0oYPlWjSqYbSc
	 FYPqbqXg3NpGI0plxACm/bOTkk59JG5QiMvY4DQr0ohh9kTslDdTSRWVcb+bfiA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778061213;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=t0TU+owBELoRIKHKbCVQjRfjhvioRegLSxOHOhzdJbI=;
	b=hBnQ3hx3j+Y/H/erJ9e1T8U/b55iL3twIELe5OZSCqxM/q0UU8kq0jNqZaa0D9HsNkbH
	 3EdvCgCto5skC7XYNVDPIezf1PExGR8R9wuWXF31i6ywIk2B2SbLkx7i+J8uFzBtuOQsI
	 fjn9/7DoJtc5qRW8eJ7cIee9LQlXKmykjbLV/wWjQV95x5x/6Tb94rvZ7C7OrGxTl4Ghg
	 /IWI7O7ugWAaMRtaquXAIzl1FyKhId8C+vFv56qHuZyIMvQihjyG8ymAo3SS57HJiTiev
	 4kzeHbSJ8LvHMSReHidSWB7y58xMIdk5xz5BEgswB9HUD4TZzJA9BC35pS3Z4fL1AFMDH
	 LVouKHdtFLAXt04GsnBLh2MWqfoo7o6bSJLfqje7Ld+8o7sDlKsXPAlsn0r2yDKslt3eO
	 Fa5JogGliHzcMW2Smw55BglDbnoFjEMK8O91z5uzh1+QH1nZsutpIeVOvBDwiCw6NZrf9
	 dC/DHWXNDkAsrdAAkzifm+94yDVq4N3NHUrZLeSdnq5fgDB5hU8CCW+A2rZBhZlaoAaIS
	 rCJ4/AGLiYkgFCY2cTsiB8kFI3hxjtahv4CsGiHgKvTBl7Dh8VvTxFoanguquAMpiDK19
	 +dfHnuxY09Bj89wPRGMVnifBYVrC/9auEhrBJL7LnNBKfoex8+/23tRK2az9B54=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 06 May 2026 11:53:33 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
In-Reply-To: <bb0174df-6e69-4b7a-b0e1-496fb351dc75@citrix.com>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
 <b47302bf-50a0-4535-b5b2-42d8de3f6dc6@citrix.com>
 <bb0174df-6e69-4b7a-b0e1-496fb351dc75@citrix.com>
Message-ID: <8d96673827e5d38f2e665ba3a1126fbb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778061214-70D608B7-759A420C/13/0
X-purgate-type: clean
X-purgate-size: 2180
X-Rspamd-Queue-Id: B8C484D9054
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linkedin.com:url]

On 2026-05-06 11:48, Andrew Cooper wrote:
> On 06/05/2026 10:47 am, Andrew Cooper wrote:
>> On 06/05/2026 10:35 am, Jan Beulich wrote:
>>> As a comment next to one of the invocations states, 
>>> get_wallclock_time()
>>> can take over a second. The order of evaluation of function arguments 
>>> is
>>> in principle unspecified; in practice at least gcc looks to be 
>>> evaluating
>>> them from last to first. Hence with NOW() invoked first, the 
>>> respective
>>> value passed to do_settime() can be off by over a second (which is in
>>> contrast to __get_cmos_time() attempting to get the time exactly 
>>> after an
>>> update, i.e. [pretty] precisely at a seconds boundary).
>>> 
>>> This also addresses a Misra C:2012 rule 13.2 ("The value of an 
>>> expression
>>> and its persistent side-effects shall be the same under all permitted
>>> evaluation orders") violation each.
>>> 
>>> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of 
>>> wallclock change")
>>> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Of course the time it takes to do all the CMOS reads (or whichever 
>>> else
>>> wallclock time source is in use) also results in an inaccuracy. For
>>> __get_cmos_time() this might be solvable by having it latch NOW() 
>>> before
>>> doing the 6 reads, but in particular for efi_get_time() there's 
>>> hardly
>>> anything we can do.
>>> 
>>> As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also 
>>> can't
>>> find any deviation for the two instances fixed here. What am I 
>>> missing?
>> From deviations.ecl:
>> 
>> -doc_begin="The following file is imported from Linux: ignore for 
>> now."
>> -file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
>> 
>> I've said before and it bears repeating.  This claim is false and 
>> should
>> never have been put in to start with, and time.c is not impacted file.
> 
> is not the only*
> 

Patches welcome :)

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

