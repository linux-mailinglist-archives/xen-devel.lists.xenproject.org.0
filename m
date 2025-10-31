Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B347EC22C6D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 01:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153996.1484164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEctH-0008ID-Fm; Fri, 31 Oct 2025 00:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153996.1484164; Fri, 31 Oct 2025 00:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEctH-0008Gl-D5; Fri, 31 Oct 2025 00:21:15 +0000
Received: by outflank-mailman (input) for mailman id 1153996;
 Fri, 31 Oct 2025 00:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exqh=5I=unpredictable.fr=mohamed@srs-se1.protection.inumbo.net>)
 id 1vEctF-0008GZ-Dd
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 00:21:13 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster6-host12-snip4-1.eps.apple.com [57.103.85.242])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac5b050-b5ef-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 01:21:01 +0100 (CET)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-7 (Postfix) with ESMTPS id
 7E44618001BC; Fri, 31 Oct 2025 00:20:58 +0000 (UTC)
Received: from smtpclient.apple (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-7 (Postfix) with ESMTPSA id
 BFF0F180017B; Fri, 31 Oct 2025 00:20:56 +0000 (UTC)
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
X-Inumbo-ID: 7ac5b050-b5ef-11f0-980a-7dc792cee155
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unpredictable.fr; s=sig1; bh=r8j8q6yKjr1MccMvwPK5wOcLYZFBc25u/xDfHxh9aWE=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=TRjzdFqVpiZcfgwLXM29LYISp+KMQi0sSGk+TmHpFR41iOSY7ap91SUuFHvhLTWTHtKR3ZXQ8e5i4QXnOu15biBPLqW7piYC13isc/AmQ8nPOkLPZsoOPSXEdJ88i1vbmZ65UI571k3xcuSTXOYb3IKMDCAMAIuPhC368KkNJNLRym/WYTle5LjFA0Cxsi/vy3Jk840AgosxzfONeqXUIDx91Uxy/wL/5j/G2Z0uckhMsnHLMyvhWf82LyN0Vp4NXbl4qgKo+J6HpuqdlTlUASqov47AF6+vn0HWAGcShehvXiSLgVMpx/Abw9l3akqpk39KKxbq5m/IxNcq2zxMDg==
mail-alias-created-date: 1752046281608
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: Limitations for Running Xen on KVM Arm64
From: Mohamed Mediouni <mohamed@unpredictable.fr>
In-Reply-To: <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
Date: Fri, 31 Oct 2025 01:20:42 +0100
Cc: haseeb.ashraf@siemens.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-GUID: Trsk-Q7WTHduZxcpgxLolGdiQm0xmRCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAwMSBTYWx0ZWRfXyo88DJyc349g
 KkzRHzLRE89ySag7Z2bgqNMGR8x1KgDuqb7D6K5MYSS/foph9p3TdSUaPxTwN6EPP+Z95UbGKS4
 pPbW3K1SaoqNZPJuzPFSCF3v4Z1gWG7PJCdsxB1NYxNk2J6dKhlL4+xjNirn9WKAHg7MhyQz2/0
 Mit33V3mzyEtgsPqO8dg21htetnRExqx3h/mmj3pm9OKV8rBt8kJrib+LWABYiBRbMVqgFqZcPG
 uNl5j9325bMmRea1/606d/X1c7QmzKjcExnuu1qAbf0TjHfE9QyriGxZCcqWZmTqI266Ew3Nw=
X-Proofpoint-ORIG-GUID: Trsk-Q7WTHduZxcpgxLolGdiQm0xmRCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 spamscore=0 mlxlogscore=898 suspectscore=0 clxscore=1030
 bulkscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510310001
X-JNJ: AAAAAAABEGjoec/Hc7uc4U/rMzQ8SMuycB/T9ENZ3ZqgqxJCGd6LEq2FNezjtKpOpOtFFZMfo0ItdXD3jLaOZOKo+/wfNpdwlMHnr3JTbDm6KwYrW8ikXqPR9lxt/8NboLD7XCsSjQvxsNBigFOQ2yUHWhwZrRpjlj7NBngBsDLaD0boD828OtOQ8OBqSr1b89vaZfbdOKMvXKEOueX5mxpA1LgnRz27CrF8x8XCJ7RBXL1kAJLZYr91iLIcKGHiXNgmeVcIQIpnp9Jl2qcMXmad4UQ5Ou5yjrAAE43x+WTgKlDhwrG31L/80evGRVyty9SVhgdOa2rFKOClPbgD+xQ0c/TwT4yW6iCSIlwJ5Lg+ZzyVSCMegNhYcnlDKISz11nH8nZ/qvRcMk6OJ7OG5WigPy+OutLp/t19JVzlQIhOOiHmQpHhUEP6MFRf3EYTpSPCgQJq7FRGqZtwWJqAYMtTZMx121HDAXXghOo2r1OWXXdR1KVZkMsNzH6zybgdmqM5rIVY2pnf3TSj1Mv/uZPYjFqY9s97jpyHWgFiBwVuzrWVQ7Hqixh4EKaiJFW0my37jdpt1qENQIVSHqJXy4aZ/tbIBoNDksBP5pvc9K3s3+WOBZvtIU1KT1vLw9nhiL+o6icL



> On 31. Oct 2025, at 00:55, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Mohamed,
>=20
> On 30/10/2025 18:33, Mohamed Mediouni wrote:
>>> On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote:
>>>=20
>>> Adding @julien@xen.org and replying to his questions he asked over =
#XenDevel:matrix.org.
>>>=20
>>> can you add some details why the implementation cannot be optimized =
in KVM? Asking because I have never seen such issue when running Xen on =
QEMU (without nested virt enabled).
>>> AFAIK when Xen is run on QEMU without virtualization, then =
instructions are emulated in QEMU while with KVM, ideally the =
instruction should run directly on hardware except in some special cases =
(those trapped by FGT/CGT). Such as this one where KVM maintains shadow =
page tables for each VM. It traps these instructions and emulates them =
with callback such as handle_vmalls12e1is(). The way this callback is =
implemented, it has to iterate over the whole address space and clean-up =
the page tables which is a costly operation. Regardless of this, it =
should still be optimized in Xen as invalidating a selective range would =
be much better than invalidating a whole range of 48-bit address space.
>>> Some details about your platform and use case would be helpful. I am =
interested to know whether you are using all the features for nested =
virt.
>>> I am using AWS G4. My use case is to run Xen as guest hypervisor. =
Yes, most of the features are enabled except VHE or those which are =
disabled by KVM.
>> Hello,
>> You mean Graviton4 (for reference to others, from a bare metal =
instance)? Interesting to see people caring about nested virt there :) - =
and hopefully using it wasn=E2=80=99t too much of a pain for you to deal =
with.
>>>=20
>>> ; switch to current VMID
>>> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA =
for current VMID
>>> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA =
range for current VMID
>>> dsb ish
>>> isb
>>> ; switch back the VMID
>>>     =E2=80=A2 This is where I am not quite sure and I was hoping =
that if someone with Arm expertise could sign off on this so that I can =
work on its implementation in Xen. This will be an optimization not only =
for virtualized hardware but also in general for Xen on arm64 machines.
>>>=20
>> Note that the documentation says
>>> The invalidation is not required to apply to caching structures that =
combine stage 1 and stage 2 translation table entries.
>> for TLBIP RIPAS2E1
>>>     =E2=80=A2 The second place in Xen where this is problematic is =
when multiple vCPUs of the same domain juggle on single pCPU, TLBs are =
invalidated everytime a different vCPU runs on a pCPU. I do not know how =
this can be optimized. Any support on this is appreciated.
>> One way to handle this is every invalidate within the VM a broadcast =
TLB invalidate (HCR_EL2.FB is what you=E2=80=99re looking for) and then =
forego that TLB maintenance as it=E2=80=99s no longer necessary. This =
should not have a practical performance impact.
>=20
> To confirm my understanding, you are suggesting to rely on the L2 =
guest to send the TLB flush. Did I understanding correctly? If so, =
wouldn't this open a security hole because a misbehaving guest may never =
send the TLB flush?
>=20
Hello,

HCR_EL2.FB can be used to make every TLB invalidate the guest issues =
(which is a stage1 one) a broadcast TLB invalidate.

If a TLB invalidate wasn=E2=80=99t issued, then well the cached stage1 =
translations could have been out of date on the core the VM was running =
on in the first place.

If a core-local TLB invalidate was issued, this bit forces it to become =
a broadcast, so that you don=E2=80=99t have to worry about flushing TLBs =
when moving a vCPU between different pCPUs. KVM operates with this bit =
set.

As of the hypervisor, it=E2=80=99s responsible to issue the appropriate =
TLB invalidates as necessary if it changes stage2 mappings. This =
includes a stage-2 TLB invalidate and further necessary maintenance if =
the CPU core does do combined TLB entries. Whether a CPU core does that =
can be queried through FEAT_nTLBPA.

On processors without FEAT_nTLBPA, it should be assumed that there are =
non-coherent caching structures within the TLB. And as such also do the =
corresponding stage-1 maintenance when invalidating stage2 entries.

Thank you,
-Mohamed
> Cheers,
>=20
> --=20
> Julien Grall
>=20


