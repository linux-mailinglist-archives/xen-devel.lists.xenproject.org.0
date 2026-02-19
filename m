Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMHZD9IFl2kWtwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 13:45:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC415EA74
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 13:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236231.1538974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3On-0007uK-4y; Thu, 19 Feb 2026 12:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236231.1538974; Thu, 19 Feb 2026 12:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3On-0007sU-26; Thu, 19 Feb 2026 12:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1236231;
 Thu, 19 Feb 2026 12:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5se=AX=bounce.vates.tech=bounce-md_30504962.699705bf.v1-a51c4b1ad364496ab8140e652e13eaad@srs-se1.protection.inumbo.net>)
 id 1vt3Ol-0007sM-L7
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 12:44:51 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c66ac20f-0d90-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 13:44:49 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fGtPW2c27zPm0j4M
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 12:44:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a51c4b1ad364496ab8140e652e13eaad; Thu, 19 Feb 2026 12:44:47 +0000
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
X-Inumbo-ID: c66ac20f-0d90-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771505087; x=1771775087;
	bh=ekWC7xbCItHTVzn4dwCJQg3s6mD0YG5ENhFdY0aWNz4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e0T40mm+9tjpxFrxDRrbShiZc7ptlQtvldKDeh7c/bJHmxyI37g+pQn+uuAg+h2Y7
	 bS3ECWlk1a23/UgtFFLvLRKmE6ByNlH2NS3MVJhOwTQta/eOKvqLh3rqtTQcybhqxY
	 GvQWPgSiCplAWqvLhc8kuZvcR/Wj/TPg8y7sxJ4l20N8MVJpGKFXbLqfbY4pTR/nL8
	 qyxF6l6Zrf86z9JSB9X2aINUIoB0O9retu5Iq4IdoXENPm3XFGMrzUg1czfEeeMi+H
	 d3aH7ZIWCImsm2Q8xTsa/AMCsj+FNbHhyX5sAkBFC96LmpZlj6lPMLmGTkU8iPFMRf
	 6rdgCnYi8yJrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771505087; x=1771765587; i=julian.vetter@vates.tech;
	bh=ekWC7xbCItHTVzn4dwCJQg3s6mD0YG5ENhFdY0aWNz4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wbTIi4ceiE5yhOIngd9xgYNx9XGvCUo/2nUSf/wZ7HBUa+78OThcGhm55Eo0hIN2E
	 LjUQWK/Xt2BqokGNksPn0h9z2Z7YtWoNtNrdyTFcJkPGr+nsDsFK3krESadOjhrS5O
	 XVQx6c3E+eIaFhjwgXZlrFSVmD2vfi+PcQyjkdCchrQxFXjf3RXX6LOWYPu1yZtr3Q
	 8M3cZezYOB/7rfYG1MGTiraDoDTdNFEkScnFRz71bzuvMruka4+X8v/jLEDA7Rtshv
	 js9VV4y1CDYhJsOb6X3WmDllzn8MXnswupJ1MONHRyOTP/EQOdxK7O1cSPNMn6qBJq
	 x2/QjV9Z+t/JA==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hvm:=20Advertise=20and=20support=20extended=20destination=20IDs=20for=20MSI/IO-APIC?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771505086332
Message-Id: <993fafc6-330b-4680-8284-983efb7694f8@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20260209113412.2603088-1-julian.vetter@vates.tech> <aYneEnAa-LqQt8Gm@Mac.lan>
In-Reply-To: <aYneEnAa-LqQt8Gm@Mac.lan>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a51c4b1ad364496ab8140e652e13eaad?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260219:md
Date: Thu, 19 Feb 2026 12:44:47 +0000
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.662];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 87CC415EA74
X-Rspamd-Action: no action



On 2/9/26 14:16, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 09, 2026 at 11:34:18AM +0000, Julian Vetter wrote:
>> x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
>> addresses and IO-APIC RTEs only provide an 8-bit destination field.
>> Without extended destination ID support, Linux limits the maximum usable
>> APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
>> advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
>> signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
>> bits 55:49 as additional high destination ID bits. This expands the
>> destination ID from 8 to 15 bits.
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> ---
>>   xen/arch/x86/cpuid.c                   |  9 +++++++++
>>   xen/arch/x86/hvm/irq.c                 | 11 ++++++++++-
>>   xen/arch/x86/hvm/vioapic.c             |  2 +-
>>   xen/arch/x86/hvm/vmsi.c                |  4 ++--
>>   xen/arch/x86/include/asm/hvm/hvm.h     |  4 ++--
>>   xen/arch/x86/include/asm/hvm/vioapic.h | 13 +++++++++++++
>>   xen/arch/x86/include/asm/msi.h         |  3 +++
>>   7 files changed, 40 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>> index d85be20d86..fb17c71d74 100644
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -148,6 +148,15 @@ static void cpuid_hypervisor_leaves(const struct vc=
pu *v, uint32_t leaf,
>>           res->a |=3D XEN_HVM_CPUID_DOMID_PRESENT;
>>           res->c =3D d->domain_id;
>>   
>> +        /*
>> +         * Advertise extended destination ID support. This allows guest=
s to use
>> +         * bits 11:5 of the MSI address and bits 55:49 of the IO-APIC R=
TE for
>> +         * additional destination ID bits, expanding the addressable AP=
IC ID
>> +         * range from 8 to 15 bits. This is required for x2APIC guests =
with
>> +         * APIC IDs > 255.
>> +         */
>> +        res->a |=3D XEN_HVM_CPUID_EXT_DEST_ID;
> 
> This cannot be unilaterally advertised: you need a QEMU (or in general
> any device model that manages PCI passthrough) to understand the
> extended destination mode.  This requires the introduction of
> a new XEN_DOMCTL_bind_pt_irq equivalent hypercall, that can take an
> extended destination ID not limited to 256 values:
> 
> struct xen_domctl_bind_pt_irq {
> [...]
>               uint32_t gflags;
> #define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff
> 
> When doing PCI passthrough it's QEMU the entity that decodes the MSI
> address and data fields, and hence would need expanding (and
> negotiation with Xen) about whether the Extended ID feature can be
> advertised.
> 
> It would be good to introduce a new XEN_DMOP_* set of hypercalls that
> support Extended ID to do the PCI passthrough interrupt binding.

Thank you for your feedback. But wouldn't it be enough if QEMU extracts 
the additional bits from the gflags and pass it on to XEN? In 
pt_irq_create_bind I already extract the additional bits. In QEMU the 
function msi_dest_id would just need to extract the additional bits 
before calling xc_domain_update_msi_irq. The gflags argument in 
xc_domain_update_msi_irq is 32Bits, so there is enough room to pass the 
additional bits. What do you think?

Thank you
Julian

> 
> Thanks, Roger.



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



