Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAwRA4ocuGlYZAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:06:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD329BFB4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255619.1550519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w29WQ-0005rw-UU; Mon, 16 Mar 2026 15:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255619.1550519; Mon, 16 Mar 2026 15:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w29WQ-0005ov-Rq; Mon, 16 Mar 2026 15:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1255619;
 Mon, 16 Mar 2026 15:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Dji=BQ=bounce.vates.tech=bounce-md_30504962.69b81c69.v1-271f0506bb074d7e981029c0320f1b4c@srs-se1.protection.inumbo.net>)
 id 1w29WP-0005op-JU
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 15:06:21 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af9449ee-2149-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 16:06:19 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZJMF6nMBz5QkW2Q
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 15:06:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 271f0506bb074d7e981029c0320f1b4c; Mon, 16 Mar 2026 15:06:17 +0000
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
X-Inumbo-ID: af9449ee-2149-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773673577; x=1773943577;
	bh=8V88MMOnEVAEXfQpk4zoBHdDg3/63NOPBcKopCaDPG8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ss9wE/uFayCf0VXV4qhWKOGLli6dnPlxSLd0bm9a8BqloDhinkBw82LwAl670TE6h
	 93fj2Yjswz7c2H5yk9rpg/31K2W3OLhLK3aRhr+WaAndxoMVGysubDyhTEh6tiAGm9
	 /+GOJujszo4ZPzsW8EaxZOlycTAp8muHS/zuibhJpHVF63VNuQ1kcCrEomECcz7UBM
	 P/VvUCJ8rqIc7eXpCg/Rhyn7XS6Dq1XGrl8p7avxSZ42H1SEfrxuaf1qN1a4sEtAfn
	 HuPiI5Y7lU3lz6tMiR+49IlgujAGkQlCis0nXNgslC9bLRkm4uX1hRfFBR3ipvD5bU
	 DBkZtvuFYfYlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773673577; x=1773934077; i=julian.vetter@vates.tech;
	bh=8V88MMOnEVAEXfQpk4zoBHdDg3/63NOPBcKopCaDPG8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oljvqHrqklepyFZKcCRdQs+Zg/GlyKivxYRg9OH3Kyu7eLAdZYaeNne8BK1fDVC5H
	 aEEp4BAn8uum7Wot4ub3PPH7kc/8oql9EA/BL+/rTAQMe82GV58Nkl8Y+Qu7ayJlHU
	 Rxsq4qXBm7+ytSiJNytiCtLIXJYigR5XJC6ke/TYZSn+o2zr0Ea5dJVXK14M9c8CGP
	 RZjDV9iqYeT2BnOQPXmxWYKeSpkltnab2eIdMi0pEFNtU+7jK5CktMIgxD2u8g9VRP
	 O1Qk0NSWY1BjlCfl6/pS4ntqlu9i1zP2Sfq+TVxjiFu08fbIbFgd2WnPby5wqkCaQw
	 PJm72qNntr6Bg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=203/7]=20x86/hvm:=20Support=20extended=20destination=20IDs=20in=20virtual=20MSI=20and=20IO-APIC?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773673576518
Message-Id: <635f1e21-f1e0-451a-9374-c91b33784894@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech> <20260309123055.880050-3-julian.vetter@vates.tech> <1e371e65-ca79-42a0-93f9-804f73084033@suse.com> <9f40fbec-008f-4a50-bfb2-27c35d88f2a2@suse.com>
In-Reply-To: <9f40fbec-008f-4a50-bfb2-27c35d88f2a2@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.271f0506bb074d7e981029c0320f1b4c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 15:06:17 +0000
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:url];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.924];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AFFD329BFB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:15 PM, Jan Beulich wrote:
> On 11.03.2026 16:27, Jan Beulich wrote:
>> On 09.03.2026 13:31, Julian Vetter wrote:
>>> @@ -618,6 +620,21 @@ static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h
>>>                e->fields.reserved[0] || e->fields.reserved[1] ||
>>>                e->fields.reserved[2] || e->fields.reserved2 )
>>>               return -EINVAL;
>>> +
>>> +        /*
>>> +         * An RTE in the saved state has ext_dest_id bits set. Check that
>>> +         * the destination Xen has extended destination ID support enabled,
>>> +         * otherwise interrupt routing to APIC IDs > 255 would be broken
>>> +         * after restore.
>>> +         */
>>> +        if ( e->fields.ext_dest_id && !d->arch.hvm.ext_dest_id_enabled )

Thank you for your feedback Jan! Yes, right the 'ext_dest_id_enabled' 
must be defined before it can be checked. I have rearranged this in my 
patch set.

>>
>> This won't build, as the ext_dest_id_enabled field appears only in patch 6.
>> But yes, that looks to be the opt-in mechanism I mentioned above.
> 
> Actually no, how could it be. That's for the DM to invoke.

But this comment here I'm not sure I fully understand. You mean that 
checking 'if ( e->fields.ext_dest_id && !d->arch.hvm.ext_dest_id_enabled 
)' is not enough? This check only verifies that if the target domain 
doesn't support ext_dest_id_enabled, no RTE in the source domain is 
allowed to have a ext_dest_id set. But now we also have to check that if 
the source domain has ext_dest_id_enabled, the target also have to 
announce it, right? So,

if ( s->ext_dest_id_enabled && !d->arch.hvm.ext_dest_id_enabled )
{
     //ERROR
}

Is this what you meant?

Julian

> 
> Jan



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


