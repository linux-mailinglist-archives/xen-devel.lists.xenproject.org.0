Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO1rEhzoBGqnQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 23:07:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56353AD3E
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 23:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308487.1579926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGnZ-0007l9-6w; Wed, 13 May 2026 21:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308487.1579926; Wed, 13 May 2026 21:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGnZ-0007jI-4G; Wed, 13 May 2026 21:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1308487;
 Wed, 13 May 2026 21:07:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNGnX-0007jC-O9
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 21:07:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGnX-00EIfJ-4w
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 23:07:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e7d2-5cb7-0a2a0a5109dd-0a2a450adac6-46
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 23:07:19 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e806-56b3-0a2a450a0019-a237832f930e-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 23:07:19 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8DACE4EE1D2C;
 Wed, 13 May 2026 23:07:18 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778706438;
	b=lKYF5CtIub/XWAkXp17OZplT/s0L8RDupaMeV2fcptHWimgDLVVyayXjxd0izOuSQ5kK
	 HP/xFU4Q0IbNXDeZ5zurZ7KXQIuGoZoez7GgnXjEhBl9HT7dWf3ZyxWtdT6XDfnkkL/QV
	 xq48BShyJpP76l/8Ifb8H5UMn9CJGb+oGnW4XR90WfDMqwcMGYB8YUAMzH5US+mcsfwYJ
	 Bw9Pm57cgQqWYkq8yF2NBzNt/P1kmWziirY5mge6S3NFl6Bb5jbfnXklA3WFi9D9/2wcc
	 7Y/m7XTBkUGbBXHvVeejUyV8Pi44mCkc+yUYxzZIEelCh2cVvpnbuKam64Gq+6VIgWvbO
	 7VyIL86BmhHGMYE9cFKk+gfjhFycAmxQDO9ile21ZLL1d5yGpR1znBKROvGaFtiyXhEyt
	 D98bMP9Qa5qmRGpC1eNC7GiwpcFF0q+4a8aUEglS+R5DfJzEwZr4zA7rCf1BxH/r2Op2V
	 YBAB8V+lVUUyXksT2vQKTUqEcGWnqj77HDB1QcrSJ4s5pHX3la+X1eycO98Cy+LD+mbed
	 fOox3BuuWJBrvqI3eXrH6tZxdIMa68GaSVXTP7JV5LcuMRYEXKtL4Y9LU7DUtMH+yHWqj
	 6Q4cJqHVn0FCeKGNrDXlknn74a0zJnfj0z78DRsOXZj7gpFE2J1/Q72KUQtvtnM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778706438;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=EJJPGORqhSahaG4Yo4YCJnTQFEkFGg7G9VmW7fkOktY=;
	b=jL81OBv/jDmMzaMllh0tWpOinFJ83UyVEZRGk9aHIR3dKCqRa5osC9AuYP8OaCt4R9XK
	 tOJnJZIrrY7t7aVXGf0XwaV78Byx5oC8MJQNqNMucRmp3wxUbLy4Qfo4kjXc+TVO/dzUg
	 aVOSXnuI7BPaK3feh1MvkjRVZ2sx2wn0aYi8K5Xg+6QEOOV5ipKMtDMZ+NOMaEj8sBf5w
	 tzDngkV5LsnNZOY5BP7FsSS7QFdMLm3fW6DcWabC4icc2dNvh9tZwx/1F9IyRsac7gUiC
	 M/6L0UPeefmxfl5txDiGG4z2bD55Jh7Ocbs3AQi3vrtlWwNkMZ0xYMrD+9+JY0L2KSrKb
	 CWYOdZ/fAbiywG9xR83nv8INDMYV4OAE0F7XaacF6W2RlpZZnl9lUdzn+Ezq4zmmULWIS
	 GpVil0npQ7fGxgnn6pvdeIkLUvWMaBvkIlQkHmE8P/IiyKO9WZPTvl/RLDF5TCzfWw9+X
	 db8H73WiwTpapxAnZATxbrvvO0KJibyIYYI0PGdqD3DqKEYHymTRmYn9js/x7PHE4trtz
	 qxQ7o/ppU+S/YNvMzlFFM5Y5AWQw5M6gLiU41feKTCYd+o+PuW4Y4i5w/iWeEZYIy6sOl
	 34d7/S2YqH1ZkcQJ7oE1QpwsVXJeF8ZXcd+14eC9GYrl1L+FIRq8i5wNw7u6c0w=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 13 May 2026 23:07:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/shim: adjust for Misra C:2012 rule 20.12
In-Reply-To: <c82c5255-f2df-4822-b03a-c90ad3759e9a@citrix.com>
References: <ed512e2e-a3ff-4fe3-8847-80985722c4d3@suse.com>
 <c82c5255-f2df-4822-b03a-c90ad3759e9a@citrix.com>
Message-ID: <29550088408bfcfec43901c58e0f423f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778706439-7FD788B7-31CC842A/0/0
X-purgate-type: clean
X-purgate-size: 2449
X-Rspamd-Queue-Id: EA56353AD3E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,gitlab.com:url,b.sc:url,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

On 2026-05-13 18:30, Andrew Cooper wrote:
> On 13/05/2026 4:52 pm, Jan Beulich wrote:
>> ... ("A macro parameter used as an operand to the `#' or `##' 
>> operators,
>> which is itself subject to further macro replacement, shall only be 
>> used
>> as an operand to these operators"). Move the HVM_PARAM_ prefixes into 
>> the
>> macro body, to use ## on the 2nd use (each) of the macro parameter.
>> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I understand that this "absorbing" of prefixes isn't liked by some 
>> people,
>> so I'm all ears towards alternative suggestions.
>> 
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14354119193
>> (also covering the 17.5 patch)
> 
> Yeah, I'm a firm -1 to absorbing the prefixes.  This is simple
> obfuscation just to hide it from Eclair's eyes.
> 
> The ARM folks fixed this by using a SAF-6 annotation.  e.g. 
> 195d754170891
> 
> Although honestly, the more I think about this, the more I think we
> should just globally deviate.  I don't consider the concept having a
> well-named constant be used both as a value and a string a confusing 
> thing.
> 

There are already special cases for R20.12 also for things like 
GENERATE_CASE

-doc_begin="The helper macro GENERATE_CASE may use a macro parameter for 
ordinary
expansion and token pasting to improve readability. Only instances where 
this
leads to a violation of the Rule are deviated."
-file_tag+={deliberate_generate_case, "^xen/arch/arm/vcpreg\\.c$"}
-config=MC3A2.R20.12,macros+={deliberate, 
"name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
-doc_end

which fits this macro perfectly. The more general question is whether we 
want to whitelist certain macros uniformely, or in general Xen 
developers want to use that pattern, because that conversation has two 
very different outcomes: one is the disabling of the rule, though there 
is an associated unspecified behaviour. Us.B 25 for C99 to be precise: 
The order in which # and ## operations are evaluated during macro 
substitution (6.10.3.2, 6.10.3.3). The other possible outcome is 
deciding that the allowed cases, which should be very few (and indeed 
they are currently) should use a single deviation pattern to be handled 
uniformely.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

