Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Mb8JQG0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21232481A0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209121.1521237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDeL-0007OF-PN; Tue, 20 Jan 2026 15:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209121.1521237; Tue, 20 Jan 2026 15:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDeL-0007MR-Mk; Tue, 20 Jan 2026 15:28:09 +0000
Received: by outflank-mailman (input) for mailman id 1209121;
 Tue, 20 Jan 2026 15:28:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eRHx=7Z=bounce.vates.tech=bounce-md_30504962.696f9efd.v1-1547d01774b0433ab9b06053565abfce@srs-se1.protection.inumbo.net>)
 id 1viDeK-0007MF-C2
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:28:08 +0000
Received: from mail14.wdc04.mandrillapp.com (mail14.wdc04.mandrillapp.com
 [205.201.139.14]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994665e8-f614-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 16:27:58 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail14.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4dwWRd2xwTz8XRwk8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 15:27:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1547d01774b0433ab9b06053565abfce; Tue, 20 Jan 2026 15:27:57 +0000
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
X-Inumbo-ID: 994665e8-f614-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768922877; x=1769192877;
	bh=PKhCAAD87VzD+4z95CXnWFWiEpmifOzout8OQHxo4rw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VUOQew70N9S1Rzjtzu0zy1tX+Z7RPGy9ygVb+mTnouIONTF4IIJMDH0uz4vJEBDQt
	 JTENXMNCWl7SgZLRCaiewhcFdOABDXKoJ6ljvqcTf/KAz38LseZE3EN2w9xhqK/R15
	 SlbwESkdFkEw3aFFbsTB9EVK/NbGXVkAzO3R/ddMVwNCwaKAaP/wX1GeUycvd0MnXi
	 nyPWJQne7FPN8RY2kop2wSJ7OPGOp6u7Ks4zZMGdZ8oVd6f9tBEb5r/77ft1QI603R
	 8LUYOsvWWWxj1s8AcuSgCisiOvLlmNyKocJQ5QRd5TCRBcoiq1mh802u/3vYGngBxm
	 0AbeN+eYp6fwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768922877; x=1769183377; i=ngoc-tu.dinh@vates.tech;
	bh=PKhCAAD87VzD+4z95CXnWFWiEpmifOzout8OQHxo4rw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xs7w+B6m7Wwubhguafks/+/8BEO/IeVOmdKBCXmencwFD2QAWCNRnggOKjYv1qr+I
	 NzLX1q+ExcrScK//pRjudGuP9hjRuZq1RllfAIMZW7uOPaNPd+rPt5hy1hV9zin2fl
	 mGqe7gcBP/Hz/Z8usAWJ6VNHzyy23T+I/hseRBDymRzAxEI1NCGnItonD2eBp7PHbi
	 V4E0V/wBSU/x1yd0y6cj5aLWF3qxTalK4NLVwMXi4UNQsjoWUYUgPiflcWsiKweYTl
	 MtVdCwYmL6dl+6UwAacww0uq8JlwVh0GbT+1ttr7ChTPzXH06HNiUG1k9drH+Kz045
	 hjSWnrrm5u9Pg==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768922875712
Message-Id: <9df8cf47-d3ec-474e-b1c8-7978e55627d6@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech> <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com> <cff32c5b-a085-468a-be26-a858244b228d@vates.tech> <7a61a16c-93d7-4cc2-bc47-11e236cf83fb@suse.com>
In-Reply-To: <7a61a16c-93d7-4cc2-bc47-11e236cf83fb@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1547d01774b0433ab9b06053565abfce?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260120:md
Date: Tue, 20 Jan 2026 15:27:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 21232481A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 13:42, Jan Beulich wrote:
> On 20.01.2026 13:12, Tu Dinh wrote:
>> On 20/01/2026 11:35, Jan Beulich wrote:
>>> On 20.01.2026 10:57, Tu Dinh wrote:
>>>> time_offset is currently always added to wc_sec. This means that without
>>>> the actual value of time_offset, guests have no way of knowing what's
>>>> the actual host clock. Once the guest clock drifts beyond 1 second,
>>>> updates to the guest RTC would themselves change time_offset and make it
>>>> impossible to resync guest time to host time.
>>>
>>> Despite my earlier comments this part of the description looks unchanged.
>>> I still don't see why host time (or in fact about any host property) should
>>> be exposed to guests.
>>
>> I've answered this question in a followup reply from November, which
>> I'll reproduce here:
> 
> I did read your reply, yet nothing of it appeared here as additional
> justification.

Is the new description OK for you?

> Plus I fear I don't view any of this a basis to suggest
> to expose some host property to guests.
> 

The only host property being exposed would be the UTC wallclock as kept 
track by the host (as is specified by XENPF_settime). This information 
(wallclock from an external reference) is necessary for guest timesync, 
whereas an RTC which guests can update by themselves simply cannot be 
used for this purpose.

Also, IMO Xen is the right place for adding proper timekeeping to the 
guest, as it's aware of both the "true" time as tracked by the host's 
hardware and the guest's TSC values (used for virtual clock 
calculations. Similar functionalities are provided by other hypervisors 
(KVM ptpclock, Hyper-V).

>>>> Since there's no way to add more fields to struct shared_info, the
>>>> addition has to be done through struct arch_shared_info instead. Add two
>>>> fields in arch_shared_info representing time_offset's low and high
>>>> 32-bit halves.
>>>
>>> Again, despite my earlier question, reasoning of why two halves rather than
>>> a (signed) 64-bit value isn't supplied here.
>>
>> This was also in my last email:
>>
>> Both are just for easy consumption of the time offset on 32-bit guests.
> 
> I don't buy this. I should probably have replied to this effect when
> you first wrote it. {,u}int64_t is hardly a hurdle anymore there. Nor
> would I expect any halfway up-to-date 32-bit guest to manage time as
> a 32-bit quantity anymore.
> 
>> Unsigned is particularly because these are only parts of an int64_t (and
>> therefore have no signedness themselves) and I prefer to let the
>> conversion happen after reading the two fields.
> 
> There may be benefits to this, yes, but imo they want to be spelled out,
> rather than left vague.
> 
>> (Follow up: Also, the alignment of int64_t differs between GCC and MSVC
>> compilers. Using int64_t here would change the alignment of struct
>> arch_shared_info)
> 
> Does it? For which target and in which way? This would, after all, render
> other uses of {,u}int64_t in the public headers problematic as well.
> 

For the x86 32-bit target, the Windows ABI uses 8-byte alignment for 
(u)int64_t as opposed to 4-byte for the System V ABI [1]. Most of the 
other uses of 64-bit integers look to be manually aligned and/or using 
(u)int64_aligned_t (I haven't looked at them all). I can switch 
time_offset to int64_aligned_t and avoid the issues above.

[1] https://godbolt.org/z/x8o8K51Kv

> Jan



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


