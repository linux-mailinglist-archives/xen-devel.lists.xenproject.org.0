Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9DBC24DFF
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 12:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154218.1484307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnig-0000sP-Aa; Fri, 31 Oct 2025 11:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154218.1484307; Fri, 31 Oct 2025 11:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnig-0000qR-7x; Fri, 31 Oct 2025 11:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1154218;
 Fri, 31 Oct 2025 11:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exqh=5I=unpredictable.fr=mohamed@srs-se1.protection.inumbo.net>)
 id 1vEnif-0000qL-1w
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 11:55:01 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster7-host12-snip4-1.eps.apple.com [57.103.84.242])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68565936-b650-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 12:54:51 +0100 (CET)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-100-percent-1 (Postfix) with ESMTPS id
 31D24180011E; Fri, 31 Oct 2025 11:54:50 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-100-percent-1 (Postfix) with ESMTPSA id
 400291800179; Fri, 31 Oct 2025 11:54:49 +0000 (UTC)
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
X-Inumbo-ID: 68565936-b650-11f0-980a-7dc792cee155
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unpredictable.fr; s=sig1; bh=kzMGTw6HxWn9qSJVsZtQqoT+HyWujkzxOdqXS37vWNE=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=cegB/QCsJ4dvUiPm3en5xjFDfxbAiivZczBVoVfqsFIRFw5UGTEUbYwHK8PxDNs9ImQqKnX7c9wkIZ2cSVTKWwZPWkRWZwVeqGvTq5ctJKPOd9shD/OmAapLt1qdVcR+RA3Gt9+Bh6o4SRruj4b1pgcsDMOqIeavbdEIANoaLs66Jz2NxHlMbAOFkQSkMwbS04E27vWMcLnwzK5i299Rp01gvgedrBuyhh/topSXhPzIQQS5MMFBoYLuTrGl7sAN1BOEkfONUmGrLg2/upK6hE7yVF96lZUgUrSO3J9mrc9FwiAFdKIbcH3bGr9ZGLRx1xMHSEippqEOXVg/DrDYvg==
mail-alias-created-date: 1752046281608
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: Limitations for Running Xen on KVM Arm64
From: Mohamed Mediouni <mohamed@unpredictable.fr>
In-Reply-To: <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
Date: Fri, 31 Oct 2025 12:54:37 +0100
Cc: haseeb.ashraf@siemens.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C76C261-783D-4503-B929-4B48CDEC8841@unpredictable.fr>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-ORIG-GUID: 3Vb3l3yG2fumEGFr-sH1zVP9cM3Pk_Zg
X-Proofpoint-GUID: 3Vb3l3yG2fumEGFr-sH1zVP9cM3Pk_Zg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNyBTYWx0ZWRfX5urlLJQ4nOLq
 +Ba9WTP5I484N4taXY+SFhxeqbbdRr1RfiYWf7lUiiyR7E2BysDamBCHXk2JXy1BtMXPCD789hi
 e84Nlozld3w9FBOiVr5Cex42z9RrW6rPM4LlDdueSwnLgsbr/Wvbjvaqankf7Owjtn1f1///yWG
 u6nTgEPvhachkCIWbaP0iFo/kPUYLhQu8ahEyiP90jku16DEDdyPAt4ZntpUpXCMEBx5adpDTjT
 O0g4ugA6rydGIAvMLu5nV0gadZicfejoBfDSGeUsWOwMamZBfzDNaXPuijqyjtYULti9KQCv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=968 malwarescore=0 adultscore=0
 phishscore=0 clxscore=1030 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510310107
X-JNJ: AAAAAAAB6DdOImB7aF4CcUyVYjT0dtC6UWm7wrUOpGULkjJeVhLUHatN/3RnKQl1v3UQZXutf/xOQvjaMUwcligpDHcFCV0sfi41sIQVdcJRMFYfYubH5AigJXzIqywCS+uKwFLF6rXq6KN3esoj3NVZz+1a+JRHZXPUPgpQs+nzOwJDkL7etfGT8IJpWZE6Dn4JLbuYn0WhO/WEEVtGVV8UhrLX+QRI2tfDGyHnK6QGW8HklcMdWxsRhZhklBBalicydBbQA5HFSjelct6TPo3fYiOiOm8qbnvTJSAIsvyFsJw1sd+RcZ438I3CLMB7bLhPxr6lN8xI1Hs6EI15L/CejvDcuba2wUbrgagqWmAJuxgEODOmiu7Wtic51T5LgMH/8lGx0VtLFv7UdgLLk0I1GjL+bQW+xoykpp9G6fC6tfEfqloFWlaogJejFYcZAqozp9lwfOB8qgtbbt+/CTLda44fG4V96j+5Gp8Bh2x7a54xmTCIuW171LTHXtKL38dScAHAYXzFxGPEXUlZilcu/viJGBgr6WQnPvNuMnp2xAUFW6/ezKNTD15Frvm2Na7jnICztTf/ppBZkvcTU6ksPaApyiDfFq9Mn2nhqETGNedxhO/RdkzY+UWUQWEaKfFj25S2MZVdojyqMnw2mTv8RnStszzsxEsSq4Exqg==



> On 31. Oct 2025, at 10:18, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 31/10/2025 00:20, Mohamed Mediouni wrote:
>>> On 31. Oct 2025, at 00:55, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Mohamed,
>>>=20
>>> On 30/10/2025 18:33, Mohamed Mediouni wrote:
>>>>> On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote:
>>>>>=20
>>>>> Adding @julien@xen.org and replying to his questions he asked over =
#XenDevel:matrix.org.
>>>>>=20
>>>>> can you add some details why the implementation cannot be =
optimized in KVM? Asking because I have never seen such issue when =
running Xen on QEMU (without nested virt enabled).
>>>>> AFAIK when Xen is run on QEMU without virtualization, then =
instructions are emulated in QEMU while with KVM, ideally the =
instruction should run directly on hardware except in some special cases =
(those trapped by FGT/CGT). Such as this one where KVM maintains shadow =
page tables for each VM. It traps these instructions and emulates them =
with callback such as handle_vmalls12e1is(). The way this callback is =
implemented, it has to iterate over the whole address space and clean-up =
the page tables which is a costly operation. Regardless of this, it =
should still be optimized in Xen as invalidating a selective range would =
be much better than invalidating a whole range of 48-bit address space.
>>>>> Some details about your platform and use case would be helpful. I =
am interested to know whether you are using all the features for nested =
virt.
>>>>> I am using AWS G4. My use case is to run Xen as guest hypervisor. =
Yes, most of the features are enabled except VHE or those which are =
disabled by KVM.
>>>> Hello,
>>>> You mean Graviton4 (for reference to others, from a bare metal =
instance)? Interesting to see people caring about nested virt there :) - =
and hopefully using it wasn=E2=80=99t too much of a pain for you to deal =
with.
>>>>>=20
>>>>> ; switch to current VMID
>>>>> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA =
for current VMID
>>>>> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA =
range for current VMID
>>>>> dsb ish
>>>>> isb
>>>>> ; switch back the VMID
>>>>>     =E2=80=A2 This is where I am not quite sure and I was hoping =
that if someone with Arm expertise could sign off on this so that I can =
work on its implementation in Xen. This will be an optimization not only =
for virtualized hardware but also in general for Xen on arm64 machines.
>>>>>=20
>>>> Note that the documentation says
>>>>> The invalidation is not required to apply to caching structures =
that combine stage 1 and stage 2 translation table entries.
>>>> for TLBIP RIPAS2E1
>>>>>     =E2=80=A2 The second place in Xen where this is problematic is =
when multiple vCPUs of the same domain juggle on single pCPU, TLBs are =
invalidated everytime a different vCPU runs on a pCPU. I do not know how =
this can be optimized. Any support on this is appreciated.
>>>> One way to handle this is every invalidate within the VM a =
broadcast TLB invalidate (HCR_EL2.FB is what you=E2=80=99re looking for) =
and then forego that TLB maintenance as it=E2=80=99s no longer =
necessary. This should not have a practical performance impact.
>>>=20
>>> To confirm my understanding, you are suggesting to rely on the L2 =
guest to send the TLB flush. Did I understanding correctly? If so, =
wouldn't this open a security hole because a misbehaving guest may never =
send the TLB flush?
>>>=20
>> Hello,
>> HCR_EL2.FB can be used to make every TLB invalidate the guest issues =
(which is a stage1 one) a broadcast TLB invalidate.
>=20
> Xen already sets HCR_EL2.FB. But I believe this is only solving the =
problem where the vCPU is moved to another pCPU. This doesn't solve the =
problem where two vCPUs from the same VM is sharing the same pCPU.
>=20
> Per the Arm Arm each CPU have their own private TLBs. So we have to =
flush between vCPU of the same domains to avoid translations from vCPU 1 =
to "leak" to the vCPU 2 (they may have confliected page-tables).
Hm=E2=80=A6 it varies on whether the VM uses CnP or not (and whether the =
HW supports it)=E2=80=A6 (Linux does=E2=80=A6)
> KVM has a similar logic see "last_vcpu_ran" and =
"__kvm_flush_cpu_context()". That said... they are using "vmalle1" =
whereas we are using "vmalls12e1". So maybe we can relax it. Not sure if =
this would make any difference for the performance though.
vmalle1 avoids the problem here (because it only invalidates stage-1 =
translations).=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20
>=20


