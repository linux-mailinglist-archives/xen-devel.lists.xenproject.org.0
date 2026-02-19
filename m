Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEahKMMVl2kSugIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:53:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5115F431
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236322.1539064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4SW-0004kS-Nd; Thu, 19 Feb 2026 13:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236322.1539064; Thu, 19 Feb 2026 13:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4SW-0004hz-Kw; Thu, 19 Feb 2026 13:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1236322;
 Thu, 19 Feb 2026 13:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUjJ=AX=bounce.vates.tech=bounce-md_30504962.699715aa.v1-810292f8c720492387bbb50698c81adf@srs-se1.protection.inumbo.net>)
 id 1vt4SU-0004ht-JC
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:52:46 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43680ca5-0d9a-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 14:52:44 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fGvvt3RSYz5QlX0x
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 13:52:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 810292f8c720492387bbb50698c81adf; Thu, 19 Feb 2026 13:52:42 +0000
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
X-Inumbo-ID: 43680ca5-0d9a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771509162; x=1771779162;
	bh=BBrVcbbNtwYn8Bw8VHyl0I/9e0TWPexjO3vd3ypTCUs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y6GFnuQLdEYX56T1dQPrfWjf1M95TXBSENnYgNxvQILOtV57zy9A81UycTDKQEFS1
	 dVgwvqv6mJAzZM8CaIOZbboY3AhNoKe2FX8v0XIFXQFtcUmVOoleteetlG0L/QOip+
	 WSZNG3WPJbK7nlrbyDncPh9gsIOrcZNC1HY1ZueyXzARSV3CRaXPvzzQP2i3KezVgb
	 0tVB/Cyp+1i6JJfTA1v8EUo7OO5RWw0McChbhLQvwnwCIrz2kJICyAq89HEwnyEFE0
	 46fhpHk/yx9N12GZA3ffTEkSesoW5oqy6dyP9QcPZl+Dp+8Zw21rYOVq0K0klwSbDT
	 V6LaeRyaBBJMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771509162; x=1771769662; i=julian.vetter@vates.tech;
	bh=BBrVcbbNtwYn8Bw8VHyl0I/9e0TWPexjO3vd3ypTCUs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QjnaUTfrn8wvnGNntTEyL1T2KVAS4lefsc1PGHCWhKSIw84Rqdk3odDc1IhB70MU6
	 IwiUq5kd4K61/P+N1ZZQTye19rHLWEb1oFS5TdBg8+tBhFfrhetaLuRqo7hHVGljSF
	 n3FKE+h5Zy5f+j2FQBhY/ht+ezkgIu7uWVEpY39uDErmOZiRmqOfw4eN6NwMq9GQZq
	 QS1WqcVhMImd4RUjvs/7ng6ctkAh4n7D950jIxvhSdZt4wCk360ox6+r5M9NN/x+lj
	 1WTtLmGeAzrGmO/MUTNVfPt87inPrxOOScSXc4RNHPWovnQHirKkJtEQ7GUUMtLN/p
	 5HrqWfHlGHUNQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hvm:=20Advertise=20and=20support=20extended=20destination=20IDs=20for=20MSI/IO-APIC?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771509161453
Message-Id: <bb00446e-ed6a-4c9f-9c6f-e49fd7b81997@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Teddy Astie" <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260209113412.2603088-1-julian.vetter@vates.tech> <87be26c1-52fe-438f-8aad-1d5ea0f0a325@vates.tech> <d3b71e9b-c026-4cda-99cc-a8037f302bd5@vates.tech> <eb4363a6-9035-4922-9314-60f4c6ca9309@suse.com>
In-Reply-To: <eb4363a6-9035-4922-9314-60f4c6ca9309@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.810292f8c720492387bbb50698c81adf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260219:md
Date: Thu, 19 Feb 2026 13:52:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.709];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 32E5115F431
X-Rspamd-Action: no action



On 2/19/26 14:28, Jan Beulich wrote:
> On 19.02.2026 14:08, Julian Vetter wrote:
>> On 2/9/26 14:40, Teddy Astie wrote:
>>> Le 09/02/2026 =C3=A0 12:36, Julian Vetter a =C3=A9crit=C2=A0:
>>>> --- a/xen/arch/x86/hvm/vioapic.c
>>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>>> @@ -411,7 +411,7 @@ static void ioapic_inj_irq(
>>>>     
>>>>     static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned =
int pin)
>>>>     {
>>>> -    uint16_t dest =3D vioapic->redirtbl[pin].fields.dest_id;
>>>> +    uint32_t dest =3D VIOAPIC_RTE_DEST(vioapic->redirtbl[pin].bits);
>>>
>>> I would rather introduce a new field in vioapic_redir_entry for the
>>> extended dest part; and compute dest from that and dest_id.
>>
>> Here I have a question. This struct is a public ABI struct.
>> vioapic_redir_entry is defined in
>> xen/include/public/arch-x86/hvm/save.h. It's part of XENs VM
>> save/restore operation. It is used by libxc and toolstacks to migrate
>> VMs between hosts. Changing the struct might be undesirable? Yes, it
>> would make the code cleaner. having a bit entry for the extended dest
>> bits. What's the general opinion on this? With the VIOAPIC_RTE_DEST
>> macro I avoided touching this struct...
> 
> Which in turn raises the question: How do you migrate those bits? It look=
s
> like you're losing them.

The bits are preserved correctly. The migration saves/restores the full 
uint64_t bit union member, not the individual bit fields. But, the issue 
is maybe in the other direction? If we migrate a VM from a new XEN 
(where the guest has programmed extended dest IDs into RTEs) to an old 
XEN that doesn't understand them. The raw bits would be restored 
correctly into bits, but the old XENs vioapic_deliver only reads 
fields.dest_id (8 bits) and would silently ignore the extended bits. The 
guest would end up with broken interrupt routing to vCPUs with APIC ID > 
255. But there is not much we can do?!

> 
> Jan



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



