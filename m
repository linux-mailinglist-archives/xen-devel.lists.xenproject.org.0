Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKyPK/PTcGkOaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:26:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9757802
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209763.1521685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viYDU-0004ot-RK; Wed, 21 Jan 2026 13:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209763.1521685; Wed, 21 Jan 2026 13:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viYDU-0004m7-OJ; Wed, 21 Jan 2026 13:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1209763;
 Wed, 21 Jan 2026 13:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c8Gd=72=bounce.vates.tech=bounce-md_30504962.6970d3d0.v1-ec6f7ea80c0c48b891d46cce46e4e117@srs-se1.protection.inumbo.net>)
 id 1viYDS-0004m1-OZ
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 13:25:47 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac5b29bc-f6cc-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 14:25:38 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dx4h02gRNzBsTwB1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 13:25:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ec6f7ea80c0c48b891d46cce46e4e117; Wed, 21 Jan 2026 13:25:36 +0000
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
X-Inumbo-ID: ac5b29bc-f6cc-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769001936; x=1769271936;
	bh=mxXHzAiccdxttWHerv55pkGSDXmpXkI6NpSj/Q4Ei8M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ApWmXe1UpmYlF3Q60CTZdKxwK/JVZPftSbCYl5QZ3fhDxRFOZa6hnDc8JnClOf0h5
	 DnA7KnBJze5YGAb0GsWZXIZmyzlfJ+I4wEVxjwZZEfLmKsr/dx20wiyjbMbrCjSImR
	 BuLTkLq69VZLg4hfKI21sbx3VrVbraqA1F3opU+zOiw48HLFUObtKkIl6gL1HiCvkh
	 L+WPhO/DlaahwNqOEVv/FMwp+Fh3au8FTN2p/XJEfid5pcbrZZ/WK0yHGCqdUgOvUP
	 sS6nE1TR52xbtH2Osbpr28g5CStCwARcmHtJ65WkWhbBN0qt5wV8Ce9JGHl7qb7IFc
	 GJ36ieQW50h/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769001936; x=1769262436; i=ngoc-tu.dinh@vates.tech;
	bh=mxXHzAiccdxttWHerv55pkGSDXmpXkI6NpSj/Q4Ei8M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yj77X/q6ZgWI7+5EbJZAfoGim9u3pSw3XOLTyd+7UM387u9zk2XU0+QBIr1xhL2Ap
	 V8RbSXoBt0YOKzHXNdn5DPLjmUM1f0Zk9OZTu141TH2Xo7DV+hD7NSRULH6BfjqQbB
	 snVKir+HSE1eRSAZIwusro567IRKV4aK/F6HQ/t62ffa0KpeH1GRU5cfWPI39rGCH7
	 Q+svy1akkAjVhCYLhLPBHqkM8YruYTssG+N3p+hrOESUNXBoBvGf0skBvEsg1JWRF2
	 OYlKSrVlECdaqhJg9TGuUXW4uihmjIw71wp4OxD7qjj2+aTHoxsxSweXnXC0hWsm5R
	 pUyUPv6jNFRxQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769001934525
Message-Id: <6ed580a8-92a9-4e50-9c40-d38db3e3f94c@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <20260120095657.237-1-ngoc-tu.dinh@vates.tech> <3213454a-38cd-4e5d-8a30-853e37f70c18@suse.com> <cff32c5b-a085-468a-be26-a858244b228d@vates.tech> <7a61a16c-93d7-4cc2-bc47-11e236cf83fb@suse.com> <9df8cf47-d3ec-474e-b1c8-7978e55627d6@vates.tech> <da3811f5-d5cb-4a53-87ad-e29b2cdaadf6@suse.com> <a13594d1-17df-4f45-aebc-b9978f898d8a@vates.tech> <637ad4a0-bc8f-4e75-8906-643f28f94a2b@suse.com> <3bde98b0-5563-4e17-bcc5-c622863d3b07@vates.tech> <169c3509-b2fe-4a5f-8184-0aa9c089ccce@suse.com>
In-Reply-To: <169c3509-b2fe-4a5f-8184-0aa9c089ccce@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ec6f7ea80c0c48b891d46cce46e4e117?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260121:md
Date: Wed, 21 Jan 2026 13:25:36 +0000
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
	FORGED_SENDER(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 14D9757802
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 14:06, Jan Beulich wrote:
> On 21.01.2026 14:02, Tu Dinh wrote:
>> Hello,
>>
>> On 21/01/2026 10:17, Jan Beulich wrote:
>>> On 20.01.2026 17:06, Tu Dinh wrote:
>>>> On 20/01/2026 16:39, Jan Beulich wrote:
>>>>> On 20.01.2026 16:27, Tu Dinh wrote:
>>>>>> On 20/01/2026 13:42, Jan Beulich wrote:
>>>>>>> On 20.01.2026 13:12, Tu Dinh wrote:
>>>>>>>> On 20/01/2026 11:35, Jan Beulich wrote:
>>>>>>>>> On 20.01.2026 10:57, Tu Dinh wrote:
>>>>>>>>>> time_offset is currently always added to wc_sec. This means that without
>>>>>>>>>> the actual value of time_offset, guests have no way of knowing what's
>>>>>>>>>> the actual host clock. Once the guest clock drifts beyond 1 second,
>>>>>>>>>> updates to the guest RTC would themselves change time_offset and make it
>>>>>>>>>> impossible to resync guest time to host time.
>>>>>>>>>
>>>>>>>>> Despite my earlier comments this part of the description looks unchanged.
>>>>>>>>> I still don't see why host time (or in fact about any host property) should
>>>>>>>>> be exposed to guests.
>>>>>>>>
>>>>>>>> I've answered this question in a followup reply from November, which
>>>>>>>> I'll reproduce here:
>>>>>>>
>>>>>>> I did read your reply, yet nothing of it appeared here as additional
>>>>>>> justification.
>>>>>>
>>>>>> Is the new description OK for you?
>>>>>
>>>>> Which new description? So far I only saw your responses to my questions, not
>>>>> an updated patch description.
>>>>>
>>>>
>>>> Maybe my last email wasn't clear, it was in the part marked "Follow up",
>>>> reproduced below:
>>>>
>>>> Xen currently does not expose the host's wall clock time in shared_info.
>>>> This means while shared_info can be used as an alternative to the
>>>> emulated RTC, it can't be used to keep the virtual wall clock in sync.
>>>> Expose the time_offset value in struct shared_info in order to allow
>>>> guests to synchronize their own wall clock to that of the host.
>>>>
>>>> This is needed because on Windows guests, the PV drivers don't control
>>>> the timing of RTC updates, as this is done by the kernel itself
>>>> periodically. If the guest's internal clock deviates from the RTC (e.g.
>>>> after resuming from suspend), a RTC write would cause time_offset to
>>>> deviate from the supposed value (timezone offset) and thus cause the RTC
>>>> to become incorrect.
>>>
>>> What I still can't extract from this is why Windows running bare-metal is
>>> fine but Windows running on Xen's vRTC isn't. If there's a problem with
>>> our vRTC, shouldn't that be addressed there?
>>>
>>
>> In this case, it's not because the vRTC emulation was wrong, but rather
>> because Windows's internal wallclock is not Xen-aware
> 
> And it shouldn't need to be.
> 
>> and needs to be
>> synchronized after some Xen-specific events. So it's more of an
>> accommodation for Windows guests.
>>
>> Also, Windows timekeeping integrates closely with its internal time
>> service, which assumes a NTP-like interface (and thus an external time
>> reference). The current way of time synchronization in the Windows PV
>> drivers doesn't work well in this model, which is why I'm looking for a
>> way to get the external time reference from Xen.
> 
> Are you suggesting then that plain Windows is fine, but Windows with the
> PV drivers isn't? That would look to be an issue with the PV drivers then,
> wouldn't it?
> 

No, it just means that Windows running on Xen without PV drivers is not 
fine, and the PV drivers currently need this feature in order to 
correctly sync the guest time. This new functionality will be used in 
the Windows PV drivers if it were to be merged.

> Jan



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


