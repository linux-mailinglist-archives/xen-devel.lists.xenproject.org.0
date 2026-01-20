Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA6LO/mzb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772DE4816B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209114.1521228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDcJ-0006jo-El; Tue, 20 Jan 2026 15:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209114.1521228; Tue, 20 Jan 2026 15:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDcJ-0006iN-Az; Tue, 20 Jan 2026 15:26:03 +0000
Received: by outflank-mailman (input) for mailman id 1209114;
 Tue, 20 Jan 2026 15:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfLJ=7Z=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1viDcI-0006i9-Sp
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:26:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 532fbb5f-f614-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 16:26:00 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 201EE4EE0750;
 Tue, 20 Jan 2026 16:25:59 +0100 (CET)
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
X-Inumbo-ID: 532fbb5f-f614-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768922759;
	b=QXXljVw3Ko32xeaD7dLhUbUFYt1hLvmB3kAbizDrsgd/5U5iB0Ebm2/lCpFGNBK51Nk7
	 OEHp7vkhFp5XP1uATZuhg24+VdjaO7OjjiQzEkuozVU7SpVw44PoE4XyopHrP7GtjqSgj
	 MVSONRym29ETU2GnJ5KruaeR+f6vq9YkLam4gLqXLTgGr3yBYJvGxdFd4lIDcawQ/RPL+
	 JK9bkA2PM6NfZcfH5yP8PA4wa9lLj/h/C994OCC77jEBQNv5ybhhyUWts2kbBIQq1o+MP
	 0vJGEPon+nq+CqYOyMSWDWR4exZYOAzuR7sjCdQuj2dzztT4dd5NIeTe23MSGal6ZbYs/
	 oDTHoaEQREpfa3zPmPLxh8a1IzprqGlDBm828gt1zSzt23qTo9FlPkB92a0l2qqeLqhay
	 J8ac5dL3Z2RG4yfEld6wkenbtyvAo++HvkhZvsDsh0bKN6a1SRzBbrmivaw8XtADXs5q7
	 Lk0kecCBpR6a1b2UcGSWsv/hkLUFP2IJ4V3DwQe8TfYNAA8COs3n85RVtI4XJqqIunFH0
	 XAbXxO8pDDMmjaVaoxXFZkj5R10AN5ASqyIvYsaPUjWGKd9f0oE/Z47WkIV3p8+r79aQm
	 Upe5S6YPe+fPUH0dFETdS5LJzxxC31NsPtajGU0Lqe6sJBXRKoAyxTAQPfyU0o8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768922759;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=1X2fBUsSdCnu5gLNKdnwWlqRGMJT3adt2MdAjjk/8v4=;
	b=wVJYO5UD2qGmfqzQmLJwlrav/KjWokxvbIyxNKTXyabowpNu5diNoyZuCX18VSm2jV4I
	 RQkYl+vpu/ZBO4V1Rv5iEEVCR5xMJ8GWG4kJBOM6ibhh7tS9pOlDe2tZpJKY3QeauaJmp
	 GPaGD4j/S5MjnGMTX2Z54Nbd+AHNY7eclIHw2+1ksDwFw9VyFlh8DGnRqq+ehAwOFl2wG
	 8x6vY72dwcq9wQAFZ3eBh85oHQ6q/dq8oEGrRrEoLech5qTrrJcIPfLFUuXvoYXNRG3uf
	 ZR+rk17i27gvyX9CQ75NOAPpNwYF6toqxWqoC2rZ+3TKTwB7EZ+zOC8ys+Tgbdj3BRwM1
	 raQN1s75ptSO3s4wU7mBnM0wlBMrn4/wXOTlE1eqxWWYjognT2pxi2l7lJ1OdzjBKAGNX
	 Kgn+g5o5xc6jGvTmm22QDgf2NM1LOVFqLaQ+dIEWVOmIutX8Wihwtk1ugUtli5tpyNJO8
	 RQdzC8nKpsqXivVonQNxHwfZ5fbHOIQBBT9w6y0QJWBm8cXQW2la/zcC4zkp89JdDZmMY
	 7IKo9lS/xyp+d8geMbCTUUrUM/2WbKEZiE+BGtrNDM1JnUsIuodNIUQVesduEUpiChSxR
	 bFgzQajC8ZulNuIHjugyBYH7mOm3ktdgOlOOIftJkKq80QoTDMSW54BpMDp7gPI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 16:25:59 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jbeulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
In-Reply-To: <d07d6040-cc6b-4634-b4ac-041bb903d6fa@citrix.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
 <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
 <DFTE7R78R78U.2T09MMJU7F0CF@amd.com> <DFTELY2QHKPN.P7317UWE8QZR@amd.com>
 <0a6eca6eb344e9829ed9e0b381f26e95@bugseng.com>
 <d07d6040-cc6b-4634-b4ac-041bb903d6fa@citrix.com>
Message-ID: <a5a217974ec7c6c0aa96610bbbe48dd5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,linkedin.com:url,xenproject.org:url]
X-Rspamd-Queue-Id: 772DE4816B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 16:14, Andrew Cooper wrote:
> On 20/01/2026 2:20 pm, Nicola Vetrini wrote:
>> On 2026-01-20 13:09, Alejandro Vallejo wrote:
>>> On Tue Jan 20, 2026 at 12:51 PM CET, Alejandro Vallejo wrote:
>>>> On Tue Jan 20, 2026 at 12:41 PM CET, Nicola Vetrini wrote:
>>>>> On 2026-01-20 12:27, Alejandro Vallejo wrote:
>>>>>> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>>>>>>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>>>>>>> It's clean.
>>>>>>>> 
>>>>>>>> Signed-off-by: Alejandro Vallejo 
>>>>>>>> <alejandro.garciavallejo@amd.com>
>>>>>>>> ---
>>>>>>>>  docs/misra/exclude-list.json | 4 ----
>>>>>>>>  1 file changed, 4 deletions(-)
>>>>>>>> 
>>>>>>> 
>>>>>>> Hi. Do you have a link to a pipeline?
>>>>>> 
>>>>>> In the cover letter. I only run it on allcode.
>>>>>> 
>>>>> 
>>>>> I see. I can spot these additional violations from earlycpio.c. It
>>>>> does
>>>>> not result in a failure, but only because x86_64-allcode has also
>>>>> other
>>>>> non-clean guidelines and is thus allowed to fail. Ideally in some
>>>>> copious free time I'd send a patch to create a subset of clean
>>>>> guidelines for the *-allcode analysis that is failing, so that the
>>>>> "allow_fail: true" can be removed.
>>>>> 
>>>>> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html
>>>>> 
>>>> 
>>>> The web interface doesn't allow to search?! Sigh... thanks for the
>>>> pointer.
>>> 
>>> It's your usual mess of miscasting, enum-as-int, etc.
>>> 
>>> Would you rather keep the exclusion and deal with it later or let it
>>> pile up?
>>> I just don't have the time to go into it myself.
>>> 
>> 
>> Well, including more stuff in the scan doesn't hurt and it's only a
>> handful of reports that could be fixed, but the maintainers will have
>> the final say. This file is not really inside my area as a reviewer,
>> but if it helps:
>> 
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
> 
> I'm not seeing anything in that report that's on the clean and blocking
> list.  But to double check, I've started
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2274001675
> 
> which is this patch in isolation to see if anything shows up in the
> *-amd runs.
> 

https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":1,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"clean","inputs":[{"enabled":true,"text":"added"}]},{"enabled":true,"negated":true,"kind":0,"domain":"kind","inputs":[{"enabled":true,"text":"caution"}]}]}}}

Looks ugly, but it's a direct view into the clean:added selection: 
R10.2, R20.7, R7.1 in short.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

