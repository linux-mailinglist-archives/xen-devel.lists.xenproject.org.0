Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJrVMEK0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E9482C5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208775.1520918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viA6m-0003yI-PC; Tue, 20 Jan 2026 11:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208775.1520918; Tue, 20 Jan 2026 11:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viA6m-0003vi-M9; Tue, 20 Jan 2026 11:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1208775;
 Tue, 20 Jan 2026 11:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfLJ=7Z=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1viA6l-0003vc-LG
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:41:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca90d69-f5f4-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 12:41:14 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 417264EE3C04;
 Tue, 20 Jan 2026 12:41:13 +0100 (CET)
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
X-Inumbo-ID: eca90d69-f5f4-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768909273;
	b=2sENNBmYoNlemZAySaSQEuUBf/kp6vdokj5ZRfSU7o0EPtraZncdNZJZfQHdSPEwur5z
	 IXQrbvuPKDo4nq6Li+r/5hrYE1e9elofFaU6SDhCOt+tIxQ6WKPql33jczbx8S7U0WJTO
	 84R0PbBo8RV4SempYbmtDMp/QGT6t3ClaNj0Doklh+qUr7Y8P5dj2igqaS7HQVE/Rc/6h
	 NmGDcHWtXSfpup4F0Dz8NsmtEPYcijtRUNKClEqndPOTQfMA7rsmWmXVyn8jwK/aLzmg2
	 XsdQh/BTSEJo4WxFTGC1yCQf0k8NpJrjQGY9D7RbUpffEXWwm2Brt3h35wVUo/P3zS02X
	 OLu2bkbyJmeLjv9RADm7CiRWp6UYJXnZeNgvXErQlf8I2qgwrB3srSqGI8b1YLQK4Wwgg
	 JtwqDpczW/d/pl6VGoLR7TyXsFYQ3w4Vehw0b0cRV4tyWa99JDgLN7+DNeByGcaglp+rn
	 DO6rd1U3MnBwcBhCyGg+eLzfLlbOXXN47fzMBNmHinmfZwoLMGy+0eRUFKI8i3xCYpTA7
	 vk0L05LBKxOoO+nD7kPYDGH1vHn4aeQT7bDwEs2M025wrdBZVmOLc3GoE4OsfIoD1YSJu
	 dAnlOqQ/JC8VCQih97DhCLTIz2kep/BUPNewwGZcc31mWZsejFauYTeTrQ2gUS8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768909273;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=g0LphDrjBBBcNeS6PTBpBmzF9zhHVCAUEqStmqI40k4=;
	b=uXIzD+LJeMNTQjfjHc+07FkoRN2lw+E2FxbDoEIqBBLFdLn859Nzim9c6wxjIj9o6gwB
	 kYzHqkh3s7FkvAv/735LaNfvw2uZUimGrELiPipPt80hYiuRrBSIQxanHJj6smRMavDiM
	 BKPvb2Yb00lqErKbjrshlBy5QYKRZTdiu07qmXYRwJM9k/DtxvGLcqXseLZNU3KqlN3NC
	 cZ9O8VCJ/cM3RJZtoIH2J4qaDeMxO6egImUgDnOJRHsEFlkIDOQvnKxtcgC7dMVbD5TvH
	 7Adw3Zb0oEYNkDOTOjYnXap1FdVKXim/z8EaILVjcD8n9YYrynLkJlIsXjwxxjlqer3Nk
	 0sE6bc1M2NF9Y7Mfocsz6c4IpKP00ymtRQZHmiJC8yNGYr6LBSbW3cuqERR9uDjFHRw6f
	 VFU4mpPSpTsCNXwLoJarqkyYWYrgoprY6oXYMDhSgc3lvG2JxhP9oZwqvnEI4rLlJNJyn
	 yDE4hiUcut48yUxXnwr9LbapmNehUvfH2/hbigSHK9vmzCgIORZ9lDYdgNtF0+WKIb85U
	 uNIAR9Laps8ZnDYdfczwGWWM0hRNwdwk/NOyfx/U+w68IjYUfr6foiR/OPT1EUihPFvL0
	 Y6uaTuR51uexJVgHnKL6JNvADN5UQ1oAJlPx3wJXtsaRFaNn/ukNX9i6Iu3jls4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 12:41:13 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
In-Reply-To: <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
Message-ID: <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,linkedin.com:url,b.sc:url,xenproject.org:url]
X-Rspamd-Queue-Id: A04E9482C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 12:27, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>> It's clean.
>>> 
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>>  docs/misra/exclude-list.json | 4 ----
>>>  1 file changed, 4 deletions(-)
>>> 
>> 
>> Hi. Do you have a link to a pipeline?
> 
> In the cover letter. I only run it on allcode.
> 

I see. I can spot these additional violations from earlycpio.c. It does 
not result in a failure, but only because x86_64-allcode has also other 
non-clean guidelines and is thus allowed to fail. Ideally in some 
copious free time I'd send a patch to create a subset of clean 
guidelines for the *-allcode analysis that is failing, so that the 
"allow_fail: true" can be removed.

https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html

> Cheers,
> Alejandro
> 
>> 
>>> diff --git a/docs/misra/exclude-list.json
>>> b/docs/misra/exclude-list.json
>>> index 388397dd3b..273e24db4a 100644
>>> --- a/docs/misra/exclude-list.json
>>> +++ b/docs/misra/exclude-list.json
>>> @@ -121,10 +121,6 @@
>>>              "rel_path": "common/bunzip2.c",
>>>              "comment": "Imported from Linux, ignore for now"
>>>          },
>>> -        {
>>> -            "rel_path": "common/earlycpio.c",
>>> -            "comment": "Imported from Linux, ignore for now"
>>> -        },
>>>          {
>>>              "rel_path": "common/gzip/*",
>>>              "comment": "Imported from Linux, ignore for now"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

