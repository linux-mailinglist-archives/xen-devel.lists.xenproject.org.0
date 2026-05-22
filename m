Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJK+CNEwEGoaUwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:32:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BF5B229D
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316599.1585984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNBD-00074l-0B; Fri, 22 May 2026 10:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316599.1585984; Fri, 22 May 2026 10:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNBC-00072g-Tu; Fri, 22 May 2026 10:32:34 +0000
Received: by outflank-mailman (input) for mailman id 1316599;
 Fri, 22 May 2026 10:32:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wQNBC-00072Y-6P
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNBB-006seh-Ii
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:32:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a1030b0-5cb7-0a2a0a5109dd-0a2a4503cb80-36
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:32:33 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a1030c1-672d-0a2a45030019-a237832fd45a-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:32:33 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 2511D4EE1D33;
 Fri, 22 May 2026 12:32:33 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779445953;
	b=uGDw6n1+cwBc12diuIu8WV1U03OQwKoKk8509VJOk/X9kwm5/sr+KmMTpVeMlWdTOXn2
	 ZzwlWMYiKCPHClHbOyZePQOU6vudWfmkUEoImH5S5tAo2OntiPyMbmWQF3RBi8Lsg6rC8
	 kqpKXXpI1Ckh4rLiK6NI+ekbnzpMnfoZZ2wXea2y+KOHGYvUW0dVUlR1Zcf/FaJZkdlhu
	 5U6wY4hQ7fXBpCOQ8z882JVSPi05xrzPgyLs+gfHhzhCM2cUkBcu/t4fgHhRVxMYZiIbP
	 6gUJlr8w8oE5R/Kw4u8PRaLCGsWNGHAeC3m4m3WUzw90V/dO14aSh76j4MQ9C/DK2vTCf
	 eI1N/z70cFVNu/C0I+0LSqPH2AwYa8/xs4jlUDYyaSXUNUDqbdI+N0OSvt0rKfbq4JUCg
	 zfOPYh91mamidsGFuxXAcozz5j5MPeynwo8ORxmNWJJ3ZUtJzOwh2LYeJC8CnAF6nPktF
	 WuGMXM/dvC5U+Q2lJiLq0DwpWKYsk27791Xop02R2ECpqaSp3pdwzRueotKRnl6YEfS8W
	 FGwFmQ2T2HgrOxGz9a+wRfF/Tms4FAmj9DwuP5wKfnJgrSEE0ZFI2ZVNXB8tw4Tz352YM
	 NBXvGH3A9JvLomEa0PGrSpaOHBMSCEB208RRJd5W+nBYHkvS+/q7DhECMaRuyag=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779445953;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=VHF9eWhlJjXjtVykFe+kyXDIrT8vJHUE5nERukubOlg=;
	b=QqQHTB4muovvrS1tyyJ3fd99IGBNTIT1Ip0Z+SjUYVUY8F/9kbWtln+R+EFXpG2FRnxq
	 zexm80yLwewxh/y4lDAiQPtAHGO3qu7CAE17u4hUNYmRFjNoNbITN/Xzi1qNr052pXlM4
	 J/jzFC/LNEupOHDO/jaZWli/r8J2LAWWK191zTpKpxFWXtYWCifHWp/oaJRvdufUxmpc3
	 IdNpHopBpDeFzkcsJ8OaJEyOiRSZ6tcNuqIxb+I4HoNToZDh1brtyyGIaX9wSRcJKVH6i
	 xN4AEe0A8pxr5SKkB5ef3qVBJeI6V223HnTDZb0CphevWfarw+MIVEVVScJWi3RVRqOKX
	 ArHqRZIdET2RWAyTbYWTbmL+HdtG9SOg54HKKKV6iNdHhW6qgUvgblW9oITTcLZgVR55t
	 8lR9TRlaRSnmu+uyyTXWTH6YIigJs5lY8109nuVo697PAOpBUZpE8tZ24Ql0gqyYBWYOq
	 cFzJTMNTcO83Sg2DWmCmCiFWyrleoOBHtpFmbgcDTUwKcksK+ZE241mylJVCibnJq+5WU
	 Lk9jICTYDaNXFAWfhh2HJW3HpgD5SOo1MqL8AnWYVFo3/9fKE0FmexNn2HhWxkxU1wHKp
	 9LXzAO78QQ3FmLIaMP9whqdBLB+x5cqgNm8OoLz6paph+FYpvO5bcElKQe93J3k=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 22 May 2026 12:32:33 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Victor Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] automation: edit rules for analyze jobs
In-Reply-To: <00d987d3-6a9c-440e-beb8-6587a3fd1d9b@citrix.com>
References: <20260520225820.31550-1-victorm.lira@amd.com>
 <00d987d3-6a9c-440e-beb8-6587a3fd1d9b@citrix.com>
Message-ID: <751c1684902e41fdd9d29b71670b49f0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779445953-36D43938-CE043129/0/0
X-purgate-type: clean
X-purgate-size: 2260
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:victorm.lira@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C85BF5B229D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-22 12:20, Andrew Cooper wrote:
> On 20/05/2026 11:58 pm, Victor Lira wrote:
>> rewrite analyze jobs rules to simplify the conditions under which the
>> jobs appear and run
>> 
>> after these changes:
>>  - to appear, all jobs must be selected (SELECTED_JOBS_ONLY), have 
>> token
>>    (WTOKEN), and be in an allowed path (CI_PROJECT_PATH), this is 
>> specified in
>>    .eclair-analysis
>>  - the subcategories have their own exceptions, keeping current 
>> behavior:
>>    - ECLAIR_SAFETY/ECLAIR_TESTING can force enable some
>>    - eclair-testing jobs will not appear outside xen-project/people
>> 
>> This assumes we don't use pipeline sources other than 
>> push/api/schedule.
>> 
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>> ---
>> this preseves the current behavior of the -testing jobs running 
>> anywhere on
>> xen-project/people but maybe we want to limit it to whoever is doing 
>> the
>> testing, or in some other way
>> 
>> tested on my own repo xen-project/people/victormlira/xen
>> 
>> push 
>> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541858231
>> push /eclair-x86_64-amd$|alpine-3.18-gcc$/ 
>> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541859057
>> push /alpine-3.18-gcc$/ 
>> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541859605
>> schedule 
>> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541871689
>> schedule /eclair-x86_64-amd$|alpine-3.18-gcc$/ 
>> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541875599
>> schudule /alpine-3.18-gcc$/ 
>> https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541876512
> 
> I'm afraid this still doesn't work.
> 
> I pushed with ci.variable=SELECTED_JOBS_ONLY="/eclair-x86_64-allcode/"
> and still got the eclair-*-amd jobs started.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2545988798
> 
> ~Andrew

Perhaps it's because the runner is marked as a safety runner?

   rules:
     - if: $ECLAIR_SAFETY
       when: always

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

