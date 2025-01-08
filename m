Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B8A04FE7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 02:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866845.1278206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLDJ-00046H-LV; Wed, 08 Jan 2025 01:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866845.1278206; Wed, 08 Jan 2025 01:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVLDJ-00043A-Hr; Wed, 08 Jan 2025 01:50:29 +0000
Received: by outflank-mailman (input) for mailman id 866845;
 Wed, 08 Jan 2025 01:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=id0C=UA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tVLDH-0003ez-Nc
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 01:50:28 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edde0964-cd62-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 02:50:25 +0100 (CET)
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
X-Inumbo-ID: edde0964-cd62-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736301024; x=1736560224;
	bh=xyf1iTcubPh7z/QvMQm2In92t48eU46Maoh3GoepQ+k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WYZEtdEtivqo6tb4YtDm40KUFqj9FoWG2W7I1QGRoQfN02K8bnxsKBCsKSiTBrOgO
	 /SXPmqKi8tnG2zH1q+IVe6Pshs+D7n8rDP4upjrFpN8pTM9PcwQEWMQOri3gCIMI4Z
	 wXX8LmBQP7p8+AoDMuSIZIa0mIyG3I+blplySl8sUr2pGwc3mLyYACg1q4GhbexTXP
	 TXkrZWClRms67VfQcOgUFgLqHaR1uqCsiuvncwKeqzHZ3vPL0mD3g09P375pHZFp1/
	 ivRJLvIK5NTXRpM78PA5wwpqLsrw2kt7yvLYhHsMJnUjaP/6IkNgrvvnfAriVJxS1N
	 qRnzntCEeaiDA==
Date: Wed, 08 Jan 2025 01:50:16 +0000
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, kelly.choi@cloud.com, committers@xenproject.org, Denis Mukhin <dmukhin@ford.com>
Subject: Re: Xen 4.20 Development Update [December]
Message-ID: <l-i2X3sIZcusZX5bDJSb2KhxOQvqVE5V6Igl7FnlCVndzUmgX8ZfceC6w1kc9xpSIO8unl92qJdnZWNl5sA5PhXfv6OWpvcEmKY-qX2-pK0=@proton.me>
In-Reply-To: <77f11aeb-40a2-47b0-accf-782941d26f81@gmail.com>
References: <20250107173117.79047-1-oleksii.kurochko@gmail.com> <77f11aeb-40a2-47b0-accf-782941d26f81@gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6f6ab55428d3deca3e11efa9dffa75c0250ae2a6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 7th, 2025 at 9:37 AM, Oleksii Kurochko <oleksii.kurochk=
o@gmail.com> wrote:

> Missed to add one item to x86 about "x86/efi: Fix booting when NX is disa=
bled".
>=20
> Please find some details below.
>=20
>=20
>=20
> On 1/7/25 6:31 PM, Oleksii Kurochko wrote:
>=20
> > Hello everyone,
> >=20
> > This email only tracks big items for xen.git tree. Please reply for ite=
ms you
> > would like to see in 4.20 so that people have an idea what is going on =
and
> > prioritise accordingly.
> >=20
> > You're welcome to provide description and use cases of the feature you'=
re
> > working on.
> >=20
> > =3D Timeline =3D
> >=20
> > * Last posting date: Nov 29, 2024
> > * Feature freeze date: Dec 20, 2024
> > ---> We are here
> > * RC1: Jan 10, 2025
> > * Hard code freeze: Jan 17, 2025
> > * Release: Feb 21, 2025
> > ( current release schedule: https://wiki.xenproject.org/wiki/Xen_Projec=
t_X.YY_Release_Notes )
> >=20
> > This will likely be the last Xen 4.20 Development Update email, as we h=
ave
> > passed the feature freeze date, so no significant updates are expected =
until
> > the Xen 4.20 release.
> >=20
> > The next email with development updates will cover Xen 4.21.
> >=20
> > Below, you can find a summary of the tasks completed by the end of
> > December 2024, followed by a list of tasks still in progress ( it is
> > up-to-date also ), which will be moved to the Xen 4.21 task list.
> >=20
> > The following items ( the links for them could be found int the list be=
low )
> > were moved to completed:
> >=20
> > [Dec]:
> > - x86:
> >   * x86/mm: miscellaneous fixes.
> >   * Remove "APX support" task as Jan B. told:
> >       I think you want to remove this from the list. While I have compl=
eted
> >       work there, I'm not fancying re-basing ahead of the AVX10 work, a=
nd hence
> >       that needs to go in first anyway. Which seems unlikely enough at =
this
> >       point, for 4.20.
> >   * Support device passthrough when dom0 is PVH on Xen.
> > - Arm:
> >   * Prerequisite patches for R82 upstreaming
> >   * Add support for S32CC platforms and LINFlexD UART.
> >   * Arm cache coloring.
> >   * ffa: Improvements and fixes.
> >   * Enable early bootup of AArch64 MPU systems.
> >   * Enable early bootup of AArch64 MPU systems (Part 2)
> > - RISC-V:
> >   * Unflattening and relocation of host device tree
> >=20
> > [Nov]:
> > - Hypervisor:
> >   * drivers/char: rename arm-uart.c to uart-init.c
> >   * Move gic_preinit() to common code
> >   * stubdom: reduce xenstore library dependencies
> >   * xen/trace: Treewide API cleanup
> > - x86:
> >   * x86/HVM: drop stdvga caching mode
> >   * Fix module-handling use-after-free's
> >   * Reuse 32 bit C code more safely
> >   * xen: address violations of MISRA C Rule 13.6
> >   * x86/ucode: Simplify/fix loading paths further
> >   * x86: address violations of MISRA C Rule 16.3
> >   * iommu/x86: fixes/improvements for unity range checks
> >   * x86/pvh: Support relocating dom0 kernel
> > - Arm:
> >   * xen/arm: Add emulation of Debug Data Transfer Registers
> > - RISC-V:
> >   * Setup memory management
> >=20
> >=20
> > * Full list of items : *
> >=20
> > =3D Projects =3D
> >=20
> > =3D=3D Hypervisor =3D=3D
> >=20
> > *  Remove the directmap (v4)
> >   -  Elias El Yandouzi
> >   -  https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e=
1dfc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8
> >=20
> > *  remove libxenctrl usage from xenstored (v1 -> v6)
> >   -  Juergen Gross
> >   -  https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@sus=
e.com/T/#me3a5e025aef6a3431c21e81c670bf09744f2fe35
> >=20
> > *  automation: Refresh the remaining Debian containers (v2)
> >   -  Javi Merino
> >   -  https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino=
@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
> >=20
> > *  GRUB: Supporting Secure Boot of xen.gz (v1)
> >   -  Ross Lagerwall
> >   -  https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@cit=
rix.com/
> >=20
> > *  MSI-X support with qemu in stubdomain, and other related changes (v8=
)
> >   -  Marek Marczykowski-G=C3=B3recki
> >   -  https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9=
e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/
> >   -  Only automation patch left to be reviewed/merged.
> >=20
> > *  [RFC] Introduce xenbindgen to autogen hypercall structs (v1)
> >   -  Alejandro Vallejo
> >   -  https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cl=
oud.com/
> >=20
> > *  Introduce NS8250 UART emulator (v1 -> v2)
> >   -  Denis Mukhin
> >   -  https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@fo=
rd.com/

I have posted v3 recently:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d=
66c@ford.com/

> >=20
> > =3D=3D=3D x86 =3D=3D=3D
>=20
> * x86/efi: Fix booting when NX is disabled (v1)
>   - Andrew Cooper
>   - https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citri=
x.com/
>=20
> ~ Oleksii
>=20
> > *  Expose consistent topology to guests (v7)
> >   -  Alejandro Vallejo
> >   -  https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@c=
loud.com/
> >=20
> > *  Boot modules for Hyperlaunch (v8 -> v9)
> >   -  Daniel P. Smith
> >   -  https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolu=
tions.com/
> >=20
> > *  Address Space Isolation FPU preparations (v2)
> >   -  Alejandro Vallejo
> >   -  https://patchew.org/Xen/20241105143310.28301-1-alejandro.vallejo@c=
loud.com/
> >=20
> > *  x86/alternatives: Adjust all insn-relative fields (v2)
> >   -  Andrew Cooper
> >   -  https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.=
cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
> >=20
> > *  x86emul: misc additions (v5 -> v7)
> >   -  Jan Beulich
> >   -  https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.=
com/
> >=20
> > *  x86/HVM: emulation (MMIO) improvements (v2)
> >   -  Jan Beulich
> >   -  https://patchew.org/Xen/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.=
com/
> >=20
> > *  x86: support AVX10 (v2 -> v3)
> >   -  Jan Beulich
> >   -  https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.=
com/
> >=20
> > *  VT-d: SATC handling; ATS: tidying (v2)
> >   -  Jan Beulich
> >   -  https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.=
com/
> >=20
> > *  x86: parallelize AP bring-up during boot (v1)
> >   -  Krystian Hebel
> >   -  https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.he=
bel@3mdeb.com/
> >=20
> > *  x86/spec-ctrl: IBPB improvements (v4)
> >   -  Jan Beulich
> >   -  https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.=
com/
> >=20
> > *  Move some boot code from assembly to C (v2)
> >   -  Frediano Ziglio
> >   -  https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cl=
oud.com/
> >=20
> > *  Hyperlaunch device tree for dom0 (v1 -> v2)
> >   -  Daniel P. Smith
> >   -  https://patchew.org/Xen/20241226165740.29812-1-dpsmith@apertussolu=
tions.com/
> >=20
> > *  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v3)
> >   -  Jan Beulich
> >   -  https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.=
com/
> >=20
> > *  amd-pstate CPU Performance Scaling Driver (v1)
> >   -  Penny Zheng
> >   -  https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.co=
m/
> >=20
> > =3D=3D=3D ARM =3D=3D=3D
> >=20
> > *  Add Virtio-PCI for dom0less on ARM (v1)
> >   -  Edgar E. Iglesias
> >   -  https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.i=
glesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
> >=20
> > *  PCI devices passthrough on Arm, part 3 (v16)
> >   -  Stewart Hildebrand
> >   -  https://patchew.org/Xen/20240522225927.77398-1-stewart.hildebrand@=
amd.com/
> >   -  Patches are Acked but for some reason last two patches aren't merg=
ed.
> >=20
> > *  DOMCTL-based guest magic region allocation for 11 domUs (v4)
> >   -  Henry Wang
> >   -  https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/
> >=20
> > =3D=3D=3D RISCV =3D=3D=3D
> >=20
> > =3D=3D=3D PPC =3D=3D=3D
> >=20
> > *  Early Boot Allocation on Power (v5)
> >   -  Shawn Anastasio
> >   -  https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@=
raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
> >=20
> > =3D=3D Completed =3D=3D
> >=20
> > =3D=3D=3D Hypervisor =3D=3D=3D
> >=20
> > *  libxl: Implement QEMU command line probe (v1)
> >   -  Anthony PERARD
> >   -  https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.p=
erard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb
> >=20
> > *  xen/bitops: hweight() cleanup/improvements (v3)
> >   -  Andrew Cooper
> >   -  https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.=
cooper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4
> >=20
> > *  Move percpu code to common (v2)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kur=
ochko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f
> >=20
> > *  xen/livepatch: improvements to loading (v3)
> >   -  Roger Pau Monne
> >   -  https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau=
@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7
> >=20
> > *  Move {acpi_}device_init() and device_get_class() to common code (v5)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5c=
eca0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829
> >=20
> > *  blkif: reconcile protocol specification with in-use implementations =
(v1)
> >   -  Roger Pau Monne
> >   -  https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau=
@citrix.com/
> >=20
> > *  Move gic_preinit() to common code (v5)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/151ac176ff02d2ff9b7f87e3c02b9ce0=
472720fa.1732288620.git.oleksii.kurochko@gmail.com/
> >=20
> > *  stubdom: reduce xenstore library dependencies (v1)
> >   -  Juergen Gross
> >   -  https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@su=
se.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83
> >=20
> > *  xen/trace: Treewide API cleanup (v7)
> >   -  Andrew Cooper
> >   -  https://patchew.org/Xen/20240318163552.3808695-1-andrew.cooper3@ci=
trix.com/
> >=20
> > =3D=3D=3D x86 =3D=3D=3D
> >=20
> > *  x86/mm: miscellaneous fixes (v2 -> v3)
> >   -  Roger Pau Monne
> >   -  https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.co=
m/
> >=20
> > *  Support device passthrough when dom0 is PVH on Xen (v16)
> >   -  Jiqian Chen
> >   -  https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.=
Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
> >=20
> > *  Drop Xeon Phi support (v1)
> >   -  Jan Beulich
> >   -  https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53=
ffd0@suse.com/
> >=20
> > *  Utilize ucode_force and remove opt_ucode_allow_same (v7)
> >   -  Fouad Hilly
> >   -  https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hi=
lly@cloud.com/
> >=20
> > *  Switch flat driver to use phys dst for ext ints (v2)
> >   -  Matthew Barnes
> >   -  https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e7906=
8d26bb5f.1728311378.git.matthew.barnes@cloud.com/
> >=20
> > *  x86/shutdown: change default reboot method preference (v1)
> >   -  Roger Pau Monne
> >   -  https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau=
@citrix.com/
> >=20
> > *  x86/HVM: drop stdvga caching mode (v2)
> >   -  Jan Beulich
> >   -  https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1=
e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
> >=20
> > *  Fix module-handling use-after-free's (v2)
> >   -  Andrew Cooper
> >   -  https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.=
cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
> >=20
> > *  Reuse 32 bit C code more safely (v4)
> >   -  Frediano Ziglio
> >   -  https://lore.kernel.org/xen-devel/20241014085332.3254546-1-fredian=
o.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
> >=20
> > *  xen: address violations of MISRA C Rule 13.6 (v2)
> >   -  Federico Serafini
> >   -  https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.se=
rafini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29
> >=20
> > *  x86/ucode: Simplify/fix loading paths further (v2)
> >   -  Andrew Cooper
> >   -  https://lore.kernel.org/xen-devel/20241112211915.1473121-1-andrew.=
cooper3@citrix.com/
> >=20
> > *  x86: address violations of MISRA C Rule 16.3 (v2)
> >   -  Federico Serafini
> >   -  https://patchew.org/Xen/cover.1731485149.git.federico.serafini@bug=
seng.com/
> >=20
> > *  iommu/x86: fixes/improvements for unity range checks (v4 ( [PATCH 4/=
4] iommu/x86: make unity range checking more strict? ))
> >   -  Roger Pau Monne
> >   -  https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau=
@citrix.com/
> >=20
> > *  x86/pvh: Support relocating dom0 kernel (v7)
> >   -  Jason Andryuk
> >   -  https://patchew.org/Xen/20240404212519.16401-1-jason.andryuk@amd.c=
om/
> >=20
> > =3D=3D=3D ARM =3D=3D=3D
> >=20
> > *  Prerequisite patches for R82 upstreaming (v4)
> >   -  Luca Fancellu
> >   -  https://patchew.org/Xen/20241203094811.427076-1-luca.fancellu@arm.=
com/
> >=20
> > *  Enable early bootup of AArch64 MPU systems (Part 2) (v3)
> >   -  Ayan Kumar Halder
> >   -  https://patchew.org/Xen/20241204172243.1229942-1-ayan.kumar.halder=
@amd.com/
> >=20
> > *  Enable early bootup of AArch64 MPU systems (v6)
> >   -  Ayan Kumar Halder
> >   -  https://patchew.org/Xen/20241118121250.4027441-1-ayan.kumar.halder=
@amd.com/
> >=20
> > *  Add support for S32CC platforms and LINFlexD UART (v6)
> >   -  Andrei Cherechesu
> >   -  https://patchew.org/Xen/20241219112315.2461048-1-andrei.cherechesu=
@oss.nxp.com/
> >=20
> > *  Arm cache coloring (v9 -> v11)
> >   -  Carlo Nonato
> >   -  https://lore.kernel.org/xen-devel/20241202165921.249585-1-carlo.no=
nato@minervasys.tech/
> >=20
> > *  ffa: Improvements and fixes (v2 -> v3)
> >   -  Bertrand Marquis
> >   -  https://lore.kernel.org/xen-devel/cover.1732702210.git.bertrand.ma=
rquis@arm.com/
> >=20
> > *  iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
> >   -  Grygorii Strashko
> >   -  https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492f=
d549@xen.org/T/#t
> >=20
> > *  xen/arm: dt overlay fixes (v2)
> >   -  Michal Orzel
> >   -  https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.o=
rzel@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078
> >=20
> > *  xen/arm: Add emulation of Debug Data Transfer Registers (v6)
> >   -  Ayan Kumar Halder
> >   -  https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder=
@amd.com/
> >=20
> > =3D=3D=3D RISC-V =3D=3D=3D
> >=20
> > *  Unflattening and relocation of host device tree (v1)
> >   -  Oleksii Kurochko
> >   -  https://patchew.org/Xen/cover.1732709650.git.oleksii.kurochko@gmai=
l.com/
> >=20
> > *  initialize bootinfo from dtb (v2)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kur=
ochko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316
> >=20
> > *  Register Xen's load address as a boot module (v3)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kur=
ochko@gmail.com/T/#t
> >=20
> > *  device tree mapping (v9)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kur=
ochko@gmail.com/T/#t
> >=20
> > *  Setup memory management (v5)
> >   -  Oleksii Kurochko
> >   -  https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kur=
ochko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28
> >=20
> > Have a good week!
> >=20
> > Best regards,
> >  Oleksii

