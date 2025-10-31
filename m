Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87ABC22CE2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 01:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154006.1484175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEdA0-0001vg-T3; Fri, 31 Oct 2025 00:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154006.1484175; Fri, 31 Oct 2025 00:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEdA0-0001t5-Pk; Fri, 31 Oct 2025 00:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1154006;
 Fri, 31 Oct 2025 00:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exqh=5I=unpredictable.fr=mohamed@srs-se1.protection.inumbo.net>)
 id 1vEd9z-0001sz-Gj
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 00:38:31 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster6-host10-snip4-10.eps.apple.com [57.103.85.231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7591452-b5f1-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 01:38:27 +0100 (CET)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-2 (Postfix) with ESMTPS id
 EE4761800169; Fri, 31 Oct 2025 00:38:18 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-2 (Postfix) with ESMTPSA id
 E97C61800173; Fri, 31 Oct 2025 00:38:15 +0000 (UTC)
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
X-Inumbo-ID: e7591452-b5f1-11f0-980a-7dc792cee155
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unpredictable.fr; s=sig1; bh=eaa+B41zE8TEqHzTlmtWtV+61s1gr/tYfFLi2hE2hf0=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=Kxyff8dQ+ZlZKeZijNgsdOrNM8dAhtYyK/XMxsuJBfsftLQk7vMWkk8WUEGVlSguQEbFFs2TeEdghyydrJYIkyHx0BRiN5NbztQn9LRdYzv2jBJGblva3WlMypuQMTEa1w0Mj2GugZu3QMLZmU/8gnj6DmjkVuc+R+MyUy7kWSrk5f9xXXjUDDczfDcrQgMBe7Bj4NmQQRB1glYpepQbhTLjsoHdt0xoEV43btslgCTDKmPjv/7M7pRPtmVeN4oDmaG4LJSSzVaXY4HSh2ySydljN9RuWqCvZQqb+akLDeU6R0XLKv2bhfvbHeyaXeqOT4RmoQtefzviFhIhcqp6NA==
mail-alias-created-date: 1752046281608
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: Limitations for Running Xen on KVM Arm64
From: Mohamed Mediouni <mohamed@unpredictable.fr>
In-Reply-To: <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
Date: Fri, 31 Oct 2025 01:38:03 +0100
Cc: haseeb.ashraf@siemens.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED3B7E1C-A0DA-4BA6-B1FD-CCA517D05971@unpredictable.fr>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-GUID: qndifCGLjwUF7-VNXB0mDV6PvztcmzbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAwMiBTYWx0ZWRfXyKzkYRqG1W76
 9Og/MLXbmFXdDjo9ASRypvIJffm7EL9cDAjT8b5sfkEA7rqOcpneqV1o0NHbE9aAuxlkWpxh/jO
 yI5At60gHJMIrYicSAUOxyw9xtJJxsBomtrNQNB2jKtRpuYSxvhuAGOmGAUxdrwxyaa59rvuCFy
 /YopzkSaiIzfJjU6OxU4cqgWodHV8f0KbsYtpkI8ZPytasEstv6xJN4T9oKnm4PuCWXIUpZOYhw
 S9O8xc2nI+f6cdajfHYbKcQzoGBPObBbWKhSfxFQ0QPCiDSgV73GmmnlnCc22koNbIImjU6CI=
X-Proofpoint-ORIG-GUID: qndifCGLjwUF7-VNXB0mDV6PvztcmzbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 mlxlogscore=723 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510310002
X-JNJ: AAAAAAABUnkx8CnzAAaWYV7GnHye1CBE0tSnNveSHoTWdyD6qVAydsSn0hqyYvbLRLUSNKnrOtweLjycJpZ5TAvjvtVHfaFSiiFz8tMEc9KbXK38NyL68Kc3Inx4QfMVWa40pM+HGRGMEPngtUf06cgn7jtpmZnjm47o4FCIiNeoNKiaaGLt1SBdLfIIxoPwJOJhP8LWPZUYvpMqwdPxvm6/JTh+nsXH/Sa766/B8Ky9xljCJyEkkUjsOKpCxccx1wX/irpDCOMKsp01rrQofk8aFXAVUWdNan8F5nF5TFGxDgVUtYIwceSX/669lbizf91KcZtDiXb0vKjWLLfCyy+isHyi7gGGaLOYMUT7efOmVBLyi6Vht5NzS1Z/BXx/fEN1LV7En+g0tX+SGlLDCjjIPnlTC8UTR1IC8dTWnh+rno/crzqsFJhrNTBi5bTaO79Xu1K2p0dKP4XuXMUg7GBaRCEgrsfxeIt2El7RL2QEygboYezyMS38SJk1YLn3z+AXLi+doVutYsGBxnpacIAEJvhIc1r2ai43NzjvErqKxfATxtFayzqTCyxMAPVpE78S6RTDo6bKGQ+BiFhYc1TEDR9PqL65JK4rpKokhZyRv72xKOCNonwDVhf+AME0ru30jRmFmP9fLDi2mLnubV4g7wlpanm62gEYEabllgXUrg==



> On 31. Oct 2025, at 01:20, Mohamed Mediouni <mohamed@unpredictable.fr> =
wrote:
>=20
>=20
>=20
>> On 31. Oct 2025, at 00:55, Julien Grall <julien@xen.org> wrote:
>>=20
>> Hi Mohamed,
>>=20
>> On 30/10/2025 18:33, Mohamed Mediouni wrote:
>>>> On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote:
>>>>=20
>>>> Adding @julien@xen.org and replying to his questions he asked over =
#XenDevel:matrix.org.
>>>>=20
>>>> can you add some details why the implementation cannot be optimized =
in KVM? Asking because I have never seen such issue when running Xen on =
QEMU (without nested virt enabled).
>>>> AFAIK when Xen is run on QEMU without virtualization, then =
instructions are emulated in QEMU while with KVM, ideally the =
instruction should run directly on hardware except in some special cases =
(those trapped by FGT/CGT). Such as this one where KVM maintains shadow =
page tables for each VM. It traps these instructions and emulates them =
with callback such as handle_vmalls12e1is(). The way this callback is =
implemented, it has to iterate over the whole address space and clean-up =
the page tables which is a costly operation. Regardless of this, it =
should still be optimized in Xen as invalidating a selective range would =
be much better than invalidating a whole range of 48-bit address space.
>>>> Some details about your platform and use case would be helpful. I =
am interested to know whether you are using all the features for nested =
virt.
>>>> I am using AWS G4. My use case is to run Xen as guest hypervisor. =
Yes, most of the features are enabled except VHE or those which are =
disabled by KVM.
>>> Hello,
>>> You mean Graviton4 (for reference to others, from a bare metal =
instance)? Interesting to see people caring about nested virt there :) - =
and hopefully using it wasn=E2=80=99t too much of a pain for you to deal =
with.
>>>>=20
>>>> ; switch to current VMID
>>>> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA =
for current VMID
>>>> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA =
range for current VMID
>>>> dsb ish
>>>> isb
>>>> ; switch back the VMID
>>>>    =E2=80=A2 This is where I am not quite sure and I was hoping =
that if someone with Arm expertise could sign off on this so that I can =
work on its implementation in Xen. This will be an optimization not only =
for virtualized hardware but also in general for Xen on arm64 machines.
>>>>=20
>>> Note that the documentation says
>>>> The invalidation is not required to apply to caching structures =
that combine stage 1 and stage 2 translation table entries.
>>> for TLBIP RIPAS2E1
>>>>    =E2=80=A2 The second place in Xen where this is problematic is =
when multiple vCPUs of the same domain juggle on single pCPU, TLBs are =
invalidated everytime a different vCPU runs on a pCPU. I do not know how =
this can be optimized. Any support on this is appreciated.
>>> One way to handle this is every invalidate within the VM a broadcast =
TLB invalidate (HCR_EL2.FB is what you=E2=80=99re looking for) and then =
forego that TLB maintenance as it=E2=80=99s no longer necessary. This =
should not have a practical performance impact.
>>=20
>> To confirm my understanding, you are suggesting to rely on the L2 =
guest to send the TLB flush. Did I understanding correctly? If so, =
wouldn't this open a security hole because a misbehaving guest may never =
send the TLB flush?
>>=20
> Hello,
>=20
> HCR_EL2.FB can be used to make every TLB invalidate the guest issues =
(which is a stage1 one) a broadcast TLB invalidate.
>=20
> If a TLB invalidate wasn=E2=80=99t issued, then well the cached stage1 =
translations could have been out of date on the core the VM was running =
on in the first place.
>=20
> If a core-local TLB invalidate was issued, this bit forces it to =
become a broadcast, so that you don=E2=80=99t have to worry about =
flushing TLBs when moving a vCPU between different pCPUs. KVM operates =
with this bit set.
>=20
> As of the hypervisor, it=E2=80=99s responsible to issue the =
appropriate TLB invalidates as necessary if it changes stage2 mappings. =
This includes a stage-2 TLB invalidate and further necessary maintenance =
if the CPU core does do combined TLB entries. Whether a CPU core does =
that can be queried through FEAT_nTLBPA.
>=20
> On processors without FEAT_nTLBPA, it should be assumed that there are =
non-coherent caching structures within the TLB. And as such also do the =
corresponding stage-1 maintenance when invalidating stage2 entries.
>=20
> Thank you,
> -Mohamed

On the Neoverse V3 core for example, there=E2=80=99s this note in the =
TRM:

=
https://developer.arm.com/documentation/107734/0002/AArch64-registers/AArc=
h64-Identification-registers-summary/ID-AA64MMFR1-EL1--AArch64-Memory-Mode=
l-Feature-Register-1?lang=3Den

> nTLBPA: The intermediate caching of translation table walks does not =
include non-coherent physical translation caches.

Which means that this heavyweight Stage-2 flush is no longer necessary =
on that core.

On Neoverse V2, this bit is defined as RES0 instead. And as such =
invalidating the whole of Stage1 is necessary on Neoverse V2 when doing =
Stage-2 invalidates for an HV in practice=E2=80=A6 (or more heavyweight =
tracking=E2=80=A6)

What KVM currently does in arch/arm64/kvm/hyp/nvhe/tlb.c ( ~line 158) =
(__kvm_tlb_flush_vmid_ipa) today: It just always flushes Stage-1 when =
doing a Stage-2 flush.=20

Thank you,
-Mohamed




