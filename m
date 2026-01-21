Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHXsB53OcGkOaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:03:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D15749A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209706.1521633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viXqY-00005L-4Y; Wed, 21 Jan 2026 13:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209706.1521633; Wed, 21 Jan 2026 13:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viXqY-0008U3-1R; Wed, 21 Jan 2026 13:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1209706;
 Wed, 21 Jan 2026 13:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFJ9=72=bounce.vates.tech=bounce-md_30504962.6970ce48.v1-bafad410bad14741bff91d9a6e359c7a@srs-se1.protection.inumbo.net>)
 id 1viXqW-0008Ts-Mh
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 13:02:04 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ff6c2f2-f6c9-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 14:02:01 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dx48m0tfjzBsTrcD
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 13:02:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bafad410bad14741bff91d9a6e359c7a; Wed, 21 Jan 2026 13:02:00 +0000
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
X-Inumbo-ID: 5ff6c2f2-f6c9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769000520; x=1769270520;
	bh=Ok32w0YNU9W7wLHmbAtvd49p84lfkCbb0Aa/amd7EiE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G5nH1EGkX1OSyJgQOTSA9nI+nlHZ1R1OabBGLCu6fshata8UotkVV/WcaCHOb4cuW
	 czC18begRrdda+M9el/Hk+B30B+B6HqeFE5MwlVIOUpTvcJGd3fvTN7pwTIiZcOhsB
	 zq1ExVBdz3ZFN0mV1M8eyqibL72DVfo1oCNs7Xf57ruLoZx62+kCwoO3SqqKWyYaw5
	 0aWTrp5Awsmw2p9eh5F0RMTvqc5W1qHl3BAbNDRnFTp7l3ZBhif4bZz+yOVBBPSB/a
	 VAfneKqPbo16iwmIbmO/KutBtfeLxAHkwtaDkHFHSeFGKcd8cV4BpRTr/k1kU/jtq5
	 9Uw5YMGwAQ4QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769000520; x=1769261020; i=ngoc-tu.dinh@vates.tech;
	bh=Ok32w0YNU9W7wLHmbAtvd49p84lfkCbb0Aa/amd7EiE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NmgopeAmWeRidxJr0TJbChOUrrIqg3CTjebDKN954nCqm955Qh0jZeFpivV+Y39C7
	 3omZm/0aFcmQxz5Q/V3lcSThQQoV5WwvpU9nQMPmX6EAgpUC4RurtS7QGLJwraEemb
	 pnhnOgcmH0C6usGPcPaVPYC5cNmwtHbkbCTMrXFg68YokCitxdpB2ArUGaYqwJVmzg
	 KyM97Bw/WWBaolkrXmXrcSpJ1DCpRY8eN5ZRgsF0YX6YW+N71cSnR/GA7WFt096yBY
	 X+3o/q63bT8ZC+wAFvLNIAiAB5YB+hDQmgWppoiYnhtvXAG0k6Tj9WsCW5xH+H7Bcs
	 2HuIw3wft0NJw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769000518308
Message-Id: <3bde98b0-5563-4e17-bcc5-c622863d3b07@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech> <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com> <cff32c5b-a085-468a-be26-a858244b228d@vates.tech> <7a61a16c-93d7-4cc2-bc47-11e236cf83fb@suse.com> <9df8cf47-d3ec-474e-b1c8-7978e55627d6@vates.tech> <da3811f5-d5cb-4a53-87ad-e29b2cdaadf6@suse.com> <a13594d1-17df-4f45-aebc-b9978f898d8a@vates.tech> <637ad4a0-bc8f-4e75-8906-643f28f94a2b@suse.com>
In-Reply-To: <637ad4a0-bc8f-4e75-8906-643f28f94a2b@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bafad410bad14741bff91d9a6e359c7a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260121:md
Date: Wed, 21 Jan 2026 13:02:00 +0000
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim];
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
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 808D15749A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On 21/01/2026 10:17, Jan Beulich wrote:
> On 20.01.2026 17:06, Tu Dinh wrote:
>> On 20/01/2026 16:39, Jan Beulich wrote:
>>> On 20.01.2026 16:27, Tu Dinh wrote:
>>>> On 20/01/2026 13:42, Jan Beulich wrote:
>>>>> On 20.01.2026 13:12, Tu Dinh wrote:
>>>>>> On 20/01/2026 11:35, Jan Beulich wrote:
>>>>>>> On 20.01.2026 10:57, Tu Dinh wrote:
>>>>>>>> time_offset is currently always added to wc_sec. This means that without
>>>>>>>> the actual value of time_offset, guests have no way of knowing what's
>>>>>>>> the actual host clock. Once the guest clock drifts beyond 1 second,
>>>>>>>> updates to the guest RTC would themselves change time_offset and make it
>>>>>>>> impossible to resync guest time to host time.
>>>>>>>
>>>>>>> Despite my earlier comments this part of the description looks unchanged.
>>>>>>> I still don't see why host time (or in fact about any host property) should
>>>>>>> be exposed to guests.
>>>>>>
>>>>>> I've answered this question in a followup reply from November, which
>>>>>> I'll reproduce here:
>>>>>
>>>>> I did read your reply, yet nothing of it appeared here as additional
>>>>> justification.
>>>>
>>>> Is the new description OK for you?
>>>
>>> Which new description? So far I only saw your responses to my questions, not
>>> an updated patch description.
>>>
>>
>> Maybe my last email wasn't clear, it was in the part marked "Follow up",
>> reproduced below:
>>
>> Xen currently does not expose the host's wall clock time in shared_info.
>> This means while shared_info can be used as an alternative to the
>> emulated RTC, it can't be used to keep the virtual wall clock in sync.
>> Expose the time_offset value in struct shared_info in order to allow
>> guests to synchronize their own wall clock to that of the host.
>>
>> This is needed because on Windows guests, the PV drivers don't control
>> the timing of RTC updates, as this is done by the kernel itself
>> periodically. If the guest's internal clock deviates from the RTC (e.g.
>> after resuming from suspend), a RTC write would cause time_offset to
>> deviate from the supposed value (timezone offset) and thus cause the RTC
>> to become incorrect.
> 
> What I still can't extract from this is why Windows running bare-metal is
> fine but Windows running on Xen's vRTC isn't. If there's a problem with
> our vRTC, shouldn't that be addressed there?
> 

In this case, it's not because the vRTC emulation was wrong, but rather 
because Windows's internal wallclock is not Xen-aware and needs to be 
synchronized after some Xen-specific events. So it's more of an 
accommodation for Windows guests.

Also, Windows timekeeping integrates closely with its internal time 
service, which assumes a NTP-like interface (and thus an external time 
reference). The current way of time synchronization in the Windows PV 
drivers doesn't work well in this model, which is why I'm looking for a 
way to get the external time reference from Xen.

> Also, just ftaod: If other maintainers find this convincing, my failure to
> understand shouldn't get in the way. They may still approve this change,
> i.e. I'm not vetoing it. It's just that as of now I also wouldn't ack it.
> 
> Jan
> 



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


