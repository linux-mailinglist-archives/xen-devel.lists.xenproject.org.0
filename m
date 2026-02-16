Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP1kLGgXk2nD1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 14:11:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAEC143B53
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 14:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234144.1537471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vryMe-0003hc-Gg; Mon, 16 Feb 2026 13:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234144.1537471; Mon, 16 Feb 2026 13:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vryMe-0003fW-DN; Mon, 16 Feb 2026 13:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1234144;
 Mon, 16 Feb 2026 13:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IXXV=AU=bounce.vates.tech=bounce-md_30504962.6993172f.v1-0415e6e0ca8f4fd48707d1ca93f3384e@srs-se1.protection.inumbo.net>)
 id 1vryMd-0003fQ-70
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 13:10:11 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1781f68-0b38-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 14:10:09 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fF36759Y3zPm5Z6C
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 13:10:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0415e6e0ca8f4fd48707d1ca93f3384e; Mon, 16 Feb 2026 13:10:07 +0000
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
X-Inumbo-ID: d1781f68-0b38-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771247407; x=1771517407;
	bh=ebWpv+99PC6pmg8no6MymYF+5pC5DvJcuRWeQg0zdUM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vQaSIZTMosSa3HeUhFViy+vwKmlMn1SEwRIRnLmUdztUHE2HF3q21h2G5uvWZ+rva
	 hQp2E/fOjILrAqG/BQFPczYHRtnx7+D++FlcHpu4S2LjN8eCCnRQSTEFvN0c9QIY+S
	 233KSij9SaMooo44tHSxhiM2mGnEqwCWic7avLcqTlT/HIVk/VFnzE+4Xoe4A6fwzl
	 s+tOVzq5G9+nMXCgmavbDnMVjQHcX/Zq/5OoaoTltr1CkvHdsnLfXlpvSmO4XkwLwz
	 gm15VGcs0TXhvADAAsJgJs0Y3VI5lPl+2DCjMpnEnxIY0cPt2ynPR9rdGSP+JZMJsn
	 AkQJw1KF9HZPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771247407; x=1771507907; i=teddy.astie@vates.tech;
	bh=ebWpv+99PC6pmg8no6MymYF+5pC5DvJcuRWeQg0zdUM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=R6aWgOw7CL7MlgILEFCCXq3b912z5kqqFnc9T8VGVK/7ALQBxpfp4amlQMt7abkxo
	 4LMvE3VReVnssUijq0Ng/C1CGuTLdB7xER59JedQJQvEjk0FzlItmK+2dmg4lvN1QU
	 1SvO4gvwRc5ajXFpyKUAcORf7dTLuzCyqkIzpvNjYBn9zKqDBDIA0sE9r655kwykct
	 e8FNQF2OG/TmzH5yttVU+gm4OXFMC60gur96erjhfL4Op9IXoyNuFVTk2BNE/IgGfZ
	 /sER9iGn34kw3EgRoiqAtVZIS2Z+ag+Qhnwgf7SZCJY0ZfvbIOF9urUd4OGmNTj+QG
	 O+ByO20pYsn6g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/2]=20x86/svm:=20Use=20the=20virtual=20NMI=20when=20available?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771247406302
Message-Id: <87801307-0c7e-4d34-9f14-645c1cd73426@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Abdelkareem Abdelsaamad" <abdelkareem.abdelsaamad@citrix.com>, xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, "Jan Beulich" <jbeulich@suse.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com> <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com> <c0c2e0cd-173a-496f-a643-7d19c9418a2a@vates.tech> <ea21a66e-a4ab-41f9-92af-0111292ecb3a@citrix.com> <626c3f3b-9176-493c-9d96-e2a5344e7100@vates.tech> <518e7576-a88d-4172-bf93-f6a368c173d0@citrix.com>
In-Reply-To: <518e7576-a88d-4172-bf93-f6a368c173d0@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0415e6e0ca8f4fd48707d1ca93f3384e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 13:10:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,vates.tech:mid,vates.tech:url,vates.tech:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1CAEC143B53
X-Rspamd-Action: no action

Le 16/02/2026 =C3=A0 12:47, Andrew Cooper a =C3=A9crit=C2=A0:
> On 16/02/2026 10:46 am, Teddy Astie wrote:
>> Le 16/02/2026 =C3=A0 11:16, Andrew Cooper a =C3=A9crit=C2=A0:
>>> On 16/02/2026 10:07 am, Teddy Astie wrote:
>>>> Le 15/02/2026 =C3=A0 19:24, Abdelkareem Abdelsaamad a =C3=A9crit=C2=A0=
:
>>>>> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into t=
he VMCB
>>>>> and handed off to the hardware. There is no need for the artificial t=
racking
>>>>> of the NMI handling completion with the IRET instruction interception=
.
>>>>>
>>>>> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Ha=
rdware
>>>>> accelerated feature when the AMD platform support the vNMI.
>>>>>
>>>>> Adjust the svm_get_interrupt_shadow to check if the vNMI is currently=
 blocked
>>>>> by servicing another in-progress NMI.
>>>>>
>>>>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citri=
x.com>
>>>>> ---
>>>>>     xen/arch/x86/hvm/svm/intr.c | 9 +++++++++
>>>>>     xen/arch/x86/hvm/svm/svm.c  | 5 ++++-
>>>>>     xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>>>>>     3 files changed, 15 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.=
c
>>>>> index 6453a46b85..3e8959f155 100644
>>>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>>>> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>>>>>         u32 general1_intercepts =3D vmcb_get_general1_intercepts(vmcb=
);
>>>>>         intinfo_t event;
>>>>>     
>>>>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>>>>> +    {
>>>>> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
>>>>> +            !vmcb->_vintr.fields.vnmi_blocking )
>>>>> +           vmcb->_vintr.fields.vnmi_pending =3D 1;
>>>>> +
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>> I think you need to update the clearbit for tpr (related to vintr) for
>>>> the hardware to know that you modified the vnmi_pending bit.
>>> What makes you think this?=C2=A0 The APM states otherwise.
>>>
>> The APM state doesn't appears to state regarding this;
> 
> The APM does state what is part of the TPR cleanbit, and vNMI is not
> amongst these.
> 

APM doesn't explicitly state that; though KVM assumes that it is and 
sets the cleanbits [1]. I think we want to have some clarifications from 
AMD on what's actually required here.

[1] 
https://github.com/torvalds/linux/blob/0f2acd3148e0ef42bdacbd477f90e8533f96=
b2ac/arch/x86/kvm/svm/svm.c#L3707-L3708

>>   it's neither a
>> part of the "VMCB Clear Field" layout part nor the the "explicitely not
>> cached" list.
>>
>> So I assume that it may be covered by the TPR clean-bit (which is the
>> same part of vmcb); as it's actually unclear if hardware wants it or not=
.
> 
> This is very different to your original feedback though.
> 
> It's fine for review feedback to be of the form "have you investigated
> the clean bits?", but if you're not sure, you must not phrase your
> feedback as an instruction to check the cleanbit.
> 

Sorry, I may have been a bit too fast on that.

> ~Andrew
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



