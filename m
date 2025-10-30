Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F0BC21CAC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 19:34:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153912.1484145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEXSt-0005qr-Nj; Thu, 30 Oct 2025 18:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153912.1484145; Thu, 30 Oct 2025 18:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEXSt-0005pC-Ke; Thu, 30 Oct 2025 18:33:39 +0000
Received: by outflank-mailman (input) for mailman id 1153912;
 Thu, 30 Oct 2025 18:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us3E=5H=unpredictable.fr=mohamed@srs-se1.protection.inumbo.net>)
 id 1vEXSs-0005p6-Eu
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 18:33:38 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster1-host9-snip4-10.eps.apple.com [57.103.87.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb0d144b-b5be-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 19:33:24 +0100 (CET)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-7 (Postfix) with ESMTPS id
 93E5A1800215; Thu, 30 Oct 2025 18:33:21 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-7 (Postfix) with ESMTPSA id
 BC8CE1800244; Thu, 30 Oct 2025 18:33:16 +0000 (UTC)
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
X-Inumbo-ID: eb0d144b-b5be-11f0-9d16-b5c5bf9af7f9
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unpredictable.fr; s=sig1; bh=P4GlRS1Rnm2E407hmmpq3vBMV/UNrXgmFB3bhfYU8XY=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=NPFKCpptRTww7Y0f2A5/DW66xLABHlTZStDWO9FLQVNiIySpkuorI/UL2pAz75nVo54UGjj+kZAVjDh0qRwnUmHO4prMh0/SrKxfE7dSgM2prRivSpUeTVpX5cwUeiWDjuqTZ1+SU9XEla72IScIE0cF0hWe8XGavO3oNfgURqMhoUFTo4Dm5N7pk15F/1ozQ7vZju2IUBEtBVrYEax/MdSpROLbJF2NKXkzj0gbsTlxKuRqfBORLfIKqDM7rx109RECawJmRVxSCqHn0d/ijvYlsFLkKfPjcfsqTZ9GYrdXPfTHHarmlcK/C/LjEHtTgq6iJCt3UrGbK0zXv1hEaA==
mail-alias-created-date: 1752046281608
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: Limitations for Running Xen on KVM Arm64
From: Mohamed Mediouni <mohamed@unpredictable.fr>
In-Reply-To: <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Date: Thu, 30 Oct 2025 19:33:04 +0100
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
To: haseeb.ashraf@siemens.com
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-GUID: cJLmzDoEn0jP4NOWpC6hkNZAVJBMDjKO
X-Proofpoint-ORIG-GUID: cJLmzDoEn0jP4NOWpC6hkNZAVJBMDjKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1NSBTYWx0ZWRfX2nPkhAbRgmio
 N1CXuu+uJlLYTR+t3SjLxSXi/Nu1timyghngj+YUlFjwBHk918Dgtfx4wan2WG7lSh/S/P1INmp
 aCZNSbiFFt/G7av9R4TgTYfF03/hqy/R/+A6wIby5rFElwuqi8c70bmPmmRP8PAGYzOs7RzmS3r
 QrbuZyUpbgQqN07uipuaoqtlr7kUgcz0rGR6TBWdmdud1V5U6qqSQ6nuZICSgkBxex7CVJ4S/7H
 59IKDoOiqhzYz4dSFNnJ4sXncGjGWmN4Byz/n7V0Aeju0UTQPfXDcgV4wqWrcglkWaxq5QQhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=996
 bulkscore=0 clxscore=1030 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510300155
X-JNJ: AAAAAAAB35YTO1WDteZQ+P9mYkaLaCtnqHi3PDgevocWTD45rv3ZSLopx9DWZBSc624yb1qTfacBSN3zTaVJSQn1+3d1rl/HWljwMNleHgXud/3YsofvLvyYL48ThYu/ncQw70vMMhHGeVpvBIDxxmt5gcs2xvtyaM3cVMUF6pOBaFQhVl2jUHehLAletjv4QZBtEvY9EE9fCoQJGQZexsr+i8/NEnDvZiaVYcU9FjyWyqMXBIPRJiw88YLvDKuGzoznGd28V35myaw6awT8enZuitm2Q5Xlvt8QVgx4Iq565Mn7BMywX0t/uagzymMHAia5h4Hmy3GBOp192mwQIJrB5Lk1YxaMYSIsB/QhCw/hgICKuhkyI6t/azCEAtuirCwlwCyjLGxZnbsVTvh3QAk0yrb6ZrKnyqRL8XDlkUN8KI6tTTVZmH8wYdNGyjCXUarTR4QM6qLGcSvg751ntra4Fv9iSqkPA08lek0rduAWxD+SU+zVBSdiYyj5UWKO4B/o3G3gNU57fy27JHo5w2Z7zbPoppDTu2EyPv26MIL0tzJdDqtHMnbHcPcaestFQldnVCwT+tz9SaKXiZri1143qJnLcMbMGvbItPePSFvME8Hy6dDiSoUcu7UGuhuh4g==



> On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote:
>=20
> Adding @julien@xen.org and replying to his questions he asked over =
#XenDevel:matrix.org.
>=20
> can you add some details why the implementation cannot be optimized in =
KVM? Asking because I have never seen such issue when running Xen on =
QEMU (without nested virt enabled).
> AFAIK when Xen is run on QEMU without virtualization, then =
instructions are emulated in QEMU while with KVM, ideally the =
instruction should run directly on hardware except in some special cases =
(those trapped by FGT/CGT). Such as this one where KVM maintains shadow =
page tables for each VM. It traps these instructions and emulates them =
with callback such as handle_vmalls12e1is(). The way this callback is =
implemented, it has to iterate over the whole address space and clean-up =
the page tables which is a costly operation. Regardless of this, it =
should still be optimized in Xen as invalidating a selective range would =
be much better than invalidating a whole range of 48-bit address space.
> Some details about your platform and use case would be helpful. I am =
interested to know whether you are using all the features for nested =
virt.
> I am using AWS G4. My use case is to run Xen as guest hypervisor. Yes, =
most of the features are enabled except VHE or those which are disabled =
by KVM.


Hello,

You mean Graviton4 (for reference to others, from a bare metal =
instance)? Interesting to see people caring about nested virt there :) - =
and hopefully using it wasn=E2=80=99t too much of a pain for you to deal =
with.

>=20
> ; switch to current VMID
> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for =
current VMID
> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range =
for current VMID
> dsb ish
> isb
> ; switch back the VMID
>     =E2=80=A2 This is where I am not quite sure and I was hoping that =
if someone with Arm expertise could sign off on this so that I can work =
on its implementation in Xen. This will be an optimization not only for =
virtualized hardware but also in general for Xen on arm64 machines.
>=20

Note that the documentation says

> The invalidation is not required to apply to caching structures that =
combine stage 1 and stage 2 translation table entries.

for TLBIP RIPAS2E1
>     =E2=80=A2 The second place in Xen where this is problematic is =
when multiple vCPUs of the same domain juggle on single pCPU, TLBs are =
invalidated everytime a different vCPU runs on a pCPU. I do not know how =
this can be optimized. Any support on this is appreciated.


One way to handle this is every invalidate within the VM a broadcast TLB =
invalidate (HCR_EL2.FB is what you=E2=80=99re looking for) and then =
forego that TLB maintenance as it=E2=80=99s no longer necessary. This =
should not have a practical performance impact.

Thank you,
-Mohamed
>=20
>=20
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 7642dbc7c5..e96ff92314 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -247,7 +247,7 @@ void p2m_restore_state(struct vcpu *n)
>       * when running multiple vCPU of the same domain on a single =
pCPU.
>       */
>      if ( *last_vcpu_ran !=3D INVALID_VCPU_ID && *last_vcpu_ran !=3D =
n->vcpu_id )
> -        flush_guest_tlb_local();
> +        ; // flush_guest_tlb_local();
>       *last_vcpu_ran =3D n->vcpu_id;
>  }=20
>=20
> Thanks & Regards,
> Haseeb Ashraf



