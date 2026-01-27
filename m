Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PGrAoWgeGn4rQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:24:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD689390E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214274.1524644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhAm-0008NA-GM; Tue, 27 Jan 2026 11:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214274.1524644; Tue, 27 Jan 2026 11:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhAm-0008Kp-DZ; Tue, 27 Jan 2026 11:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1214274;
 Tue, 27 Jan 2026 11:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zJkd=AA=bounce.vates.tech=bounce-md_30504962.6978a043.v1-1500cc45b4a045e6b3cdf24bf6141ac0@srs-se1.protection.inumbo.net>)
 id 1vkhAl-0008Kj-9b
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 11:23:51 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6613dc9-fb72-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 12:23:49 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4f0jhg4k57z705g77
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 11:23:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1500cc45b4a045e6b3cdf24bf6141ac0; Tue, 27 Jan 2026 11:23:47 +0000
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
X-Inumbo-ID: a6613dc9-fb72-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769513027; x=1769783027;
	bh=97vk7AvTfAXGbYHG1iUiB3T8K0vZMfEIat8TRC59kbE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PBb2ZjRryBnTtjti84AaTomCex+pDN14mAoeetTQgPAxb5HAs5QPcX30+6EIQFBES
	 xd6IncQfo3VmIYHKiWzSY6PA+wuHMcGMWCN/2WhIpGdHYMnjg2E9ETQl9NsmWYf9d7
	 G1hELwEvlg1dhnrp8KPuokdZn068Gm4+NfMq30zJjttSW0WT9DyEyR32Sj+qk0XXx5
	 Vzu9fc4+OPY1CLwqjTbDx8i7/5VBkUkhj7b8hsA7UpASAc2Bu1A/R7+Og8V9+401bM
	 ubkaPnd57u+3DwJ2g7bKI1iSVx8doNoZCbkE6+A4g8CWu+3oKDWQWMbyQaXPL7CA5n
	 onmY3gPhKtQLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769513027; x=1769773527; i=teddy.astie@vates.tech;
	bh=97vk7AvTfAXGbYHG1iUiB3T8K0vZMfEIat8TRC59kbE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aP+QmXG33b2g1PhmGgl8r65/PZgbCHeRBVhlfMoLjo3sMYPoiPAn8kKe9USD8W31O
	 pDUYvH//7k8A2/eGd/iZovDrnqL5MewDxPx8yw/JSyjGns4qUDGHeeZrjty+QOufo3
	 zkcGRDgRmJZnu4+bmCqK9J69UN4uXDb/wYqNagEfro7m2EE89aRoqVQXRDt2WG89hC
	 5o8uxTkv0c5oz+gHw6HY+DrlKYKN2BiuhjZVy0vGBrQJyVih4GxnR3PGvZBPkgtGAu
	 I475gqKXe2BCJHftvpMoFtgiLGvOKOvO8sfRFNkeLPWPtxE4ytcsAIQjnfG7J1CWxC
	 LHFWnLaNqW6VA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2000/16]=20x86/cpu:=20Cleanup=20for=20NX=20adjustments?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769513026490
Message-Id: <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Julian Vetter" <julian.vetter@vates.tech>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1500cc45b4a045e6b3cdf24bf6141ac0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260127:md
Date: Tue, 27 Jan 2026 11:23:47 +0000
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4CD689390E
X-Rspamd-Action: no action

Le 26/01/2026 =C3=A0 18:56, Andrew Cooper a =C3=A9crit=C2=A0:
> I was hoping this to be a patch or two, but it got out of hand...
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/228707889=
1
> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
> 
> The branch has one extra patch to fake up the firmware settings being set=
 to
> Gitlab CI, not included in this series.
> 
> Julien: This ought to suitable to rebase your cleanup on to.  In the end,=
 I
> did the AMD adjustment mostly because I needed it to test the correctness=
 of
> the prior cleanup.
> 
> The final 4 patches are tangential cleanup which I've kept out of the pri=
or
> work in case we wish to backport it.  Everything prior is relevant to
> untangling, and mostly for the benefit of the AMD side.
> 
> The early patches are hopefully non-controvertial.  Later patches are a l=
ittle
> more RFC, and in need of further testing.
> 
> Andrew Cooper (16):
>    x86/cpu: Fix boot time cache flushing
>    x86/cpu: Drop cpuid_level adjustment from generic_identify()
>    x86/intel: Drop the paddr_bits workaround for P4 Nocona/Prescott CPUs
>    x86/cpu: Fold generic_identify() into its single caller
>    x86/cpu: Move per-CPU actions out of the vendor early_init() hook
>    x86/cpu: Rework the vendor early_init() hooks to be __init
>    x86/cpu: Call the vendor early_init() hook in early_cpu_init()
>    xen/sysctl: Drop XEN_SYSCTL_get_cpu_levelling_caps
>    x86/intel: Always check MSR_MISC_ENABLE on all CPUs
>    x86/amd: Always probe and configure the masking MSRs
>    x86/amd: Fix re-activation of TopoExt on Fam15h CPUs
>    x86/amd: Probe for NX support and re-activate if possible
>    x86/cpu: Drop NOISY_CAPS
>    x86/cpu: Drop default_init() and default_cpu
>    x86/cpu: Clean up use of LCAP_* constants
>    x86/cpuid: Drop the include of public/sysctl.h
> 
>   CHANGELOG.md                          |   2 +
>   tools/flask/policy/modules/dom0.te    |   1 -
>   tools/include/xenguest.h              |   1 -
>   tools/libs/guest/xg_cpuid_x86.c       |  14 ---
>   xen/arch/x86/boot/head.S              |   1 -
>   xen/arch/x86/boot/trampoline.S        |  29 +++---
>   xen/arch/x86/boot/wakeup.S            |  27 +++---
>   xen/arch/x86/cpu/amd.c                | 107 ++++++++++++++------
>   xen/arch/x86/cpu/common.c             | 135 +++++++++++++-------------
>   xen/arch/x86/cpu/cpu.h                |   7 +-
>   xen/arch/x86/cpu/hygon.c              |   2 +
>   xen/arch/x86/cpu/intel.c              |  74 ++++----------
>   xen/arch/x86/domain.c                 |  10 +-
>   xen/arch/x86/flushtlb.c               |  19 ++--
>   xen/arch/x86/include/asm/cpuid.h      |  17 ++--
>   xen/arch/x86/include/asm/hvm/hvm.h    |   2 +
>   xen/arch/x86/include/asm/hvm/vlapic.h |   2 +
>   xen/arch/x86/include/asm/hvm/vpt.h    |   2 +
>   xen/arch/x86/include/asm/trampoline.h |   7 +-
>   xen/arch/x86/sysctl.c                 |   6 --
>   xen/include/public/sysctl.h           |  22 +----
>   xen/xsm/flask/hooks.c                 |   4 -
>   xen/xsm/flask/policy/access_vectors   |   2 -
>   23 files changed, 238 insertions(+), 255 deletions(-)
> 

Tested on a Intel machine with "DEP" disabled, and "Require NX support" 
disabled, I get a pagefault in hpet code

> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) 15=
.2.0) debug=3Dy Tue Jan 27 12:06:46 CET 2026
> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
> (XEN) re-enabled NX (Execute Disable) protection
> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (raw=
 000306c3)
> (XEN) BSP microcode revision: 0x0000001a
> (XEN) microcode: Bad data in container
> (XEN) Microcode: Parse error -22
> (XEN) Bootloader: EFI
> (XEN) Command line: dom0_mem=3D2G iommu=3Dverbose,debug console=3Dcom1 co=
m1=3D115200,8n1 guest_loglvl=3Dall loglvl=3Dall
> (XEN) Xen image load base address: 0xc3a00000
> (XEN) Video information:
> (XEN)  VGA is graphics mode 1920x1080, 32 bpp
> (XEN)  VBE/DDC methods: none; EDID transfer time: 0 seconds
> (XEN) Disc information:
> (XEN)  Found 0 MBR signatures
> (XEN)  Found 1 EDD information structures
> (XEN) EFI RAM map:
> (XEN)  [0000000000000000, 000000000004efff] (usable)
> (XEN)  [000000000004f000, 000000000004ffff] (reserved)
> (XEN)  [0000000000050000, 000000000009dfff] (usable)
> (XEN)  [000000000009e000, 000000000009ffff] (reserved)
> (XEN)  [0000000000100000, 00000000c60c3fff] (usable)
> (XEN)  [00000000c60c4000, 00000000c60cafff] (ACPI NVS)
> (XEN)  [00000000c60cb000, 00000000c650ffff] (usable)
> (XEN)  [00000000c6510000, 00000000c68c6fff] (reserved)
> (XEN)  [00000000c68c7000, 00000000d9867fff] (usable)
> (XEN)  [00000000d9868000, 00000000d98f1fff] (reserved)
> (XEN)  [00000000d98f2000, 00000000d991bfff] (ACPI data)
> (XEN)  [00000000d991c000, 00000000d9a06fff] (ACPI NVS)
> (XEN)  [00000000d9a07000, 00000000d9ffefff] (reserved)
> (XEN)  [00000000d9fff000, 00000000d9ffffff] (usable)
> (XEN)  [00000000dc000000, 00000000de1fffff] (reserved)
> (XEN)  [00000000f8000000, 00000000fbffffff] (reserved)
> (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
> (XEN)  [00000000fed00000, 00000000fed03fff] (reserved)
> (XEN)  [00000000fed1c000, 00000000fed1ffff] (reserved)
> (XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
> (XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
> (XEN)  [0000000100000000, 000000041fdfffff] (usable)
> (XEN) ACPI: RSDP D9901298, 0024 (r2 HPQOEM)
> (XEN) ACPI: XSDT D99012BC, 00B4 (r1 HPQOEM SLIC-BPC 20170509 AMI     1001=
3)
> (XEN) ACPI: FACP D9910018, 010C (r5 HPQOEM SLIC-BPC 20170509 AMI     1001=
3)
> (XEN) ACPI: DSDT D99021D0, DE46 (r2 HPQOEM SLIC-BPC        1 INTL 2009111=
2)
> (XEN) ACPI: FACS D9A05080, 0040
> (XEN) ACPI: APIC D9910128, 0072 (r3 HPQOEM SLIC-BPC 20170509 AMI     1001=
3)
> (XEN) ACPI: FPDT D99101A0, 0044 (r1 HPQOEM SLIC-BPC 20170509 AMI     1001=
3)
> (XEN) ACPI: SSDT D99101E8, 0539 (r1  PmRef  Cpu0Ist     3000 INTL 2012071=
1)
> (XEN) ACPI: SSDT D9910728, 0AD8 (r1  PmRef    CpuPm     3000 INTL 2012071=
1)
> (XEN) ACPI: SSDT D9911200, 01C7 (r1  PmRef LakeTiny     3000 INTL 2012071=
1)
> (XEN) ACPI: MCFG D99113C8, 003C (r1 HPQOEM SLIC-BPC 20170509 MSFT       9=
7)
> (XEN) ACPI: HPET D9911408, 0038 (r1 HPQOEM SLIC-BPC 20170509 AMI.        =
5)
> (XEN) ACPI: SSDT D9911440, 036D (r1 SataRe SataTabl     1000 INTL 2012071=
1)
> (XEN) ACPI: SSDT D99117B0, 348C (r1 SaSsdt  SaSsdt      3000 INTL 2009111=
2)
> (XEN) ACPI: SSDT D9914C40, 668F (r1 COMPAQ      WMI        1 MSFT  300000=
1)
> (XEN) ACPI: SLIC D991B2D0, 0176 (r1 HPQOEM SLIC-BPC        1             =
0)
> (XEN) ACPI: MSDM D991B448, 0055 (r3 HPQOEM SLIC-BPC 20170509 HPQ     1001=
3)
> (XEN) ACPI: ASF! D991B4A0, 00A5 (r32 INTEL       HCG        1 TFSM    F42=
40)
> (XEN) ACPI: TCPA D991B548, 0032 (r2 APTIO4  NAPAASF        1 MSFT  100001=
3)
> (XEN) ACPI: BGRT D991B580, 0038 (r0 HPQOEM SLIC-BPC 20170509 AMI     1001=
3)
> (XEN) ACPI: DMAR D991B5B8, 00B8 (r1 INTEL      HSW         1 INTL        =
1)
> (XEN) ACPI: WPBT D9901370, 0034 (r1 ABT-NT ABT-WPBT        1 ABTW 2012040=
2)
> (XEN) System RAM: 16274MB (16664864kB)
> (XEN) No NUMA configuration found
> (XEN) Faking a node at 0000000000000000-000000041fe00000
> (XEN) Domain heap initialised
> (XEN) SMBIOS 2.7 present.
> (XEN) DMI 2.7 present.
> (XEN) PCI: MCFG configuration 0: base f8000000 segment 0000 buses 00 - 3f
> (XEN) PCI: MCFG area at f8000000 reserved in E820
> (XEN) PCI: Using MCFG for segment 0000 bus 00-3f
> (XEN) [VT-D]Host address width 39
> (XEN) [VT-D]found ACPI_DMAR_DRHD:
> (XEN) [VT-D]  dmaru->address =3D fed90000
> (XEN) [VT-D]drhd->address =3D fed90000 iommu->reg =3D ffff82c000209000
> (XEN) [VT-D]cap =3D c0000020660462 ecap =3D f0101a
> (XEN) [VT-D] endpoint: 0000:00:02.0
> (XEN) [VT-D]found ACPI_DMAR_DRHD:
> (XEN) [VT-D]  dmaru->address =3D fed91000
> (XEN) [VT-D]drhd->address =3D fed91000 iommu->reg =3D ffff82c00020b000
> (XEN) [VT-D]cap =3D d2008020660462 ecap =3D f010da
> (XEN) [VT-D] IOAPIC: 0000:f0:1f.0
> (XEN) [VT-D] MSI HPET: 0000:f0:0f.0
> (XEN) [VT-D]  flags: INCLUDE_ALL
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:00:1d.0
> (XEN) [VT-D] endpoint: 0000:00:1a.0
> (XEN) [VT-D] endpoint: 0000:00:14.0
> (XEN) [VT-D]drivers/passthrough/vtd/dmar.c:610:  RMRR: [d9888000,d9894fff=
]
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:00:02.0
> (XEN) [VT-D]drivers/passthrough/vtd/dmar.c:610:  RMRR: [dc000000,de1fffff=
]
> (XEN) Using APIC driver default
> (XEN) ACPI: PM-Timer IO Port: 0x408 (24 bits)
> (XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
> (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]
> (XEN) ACPI: 32/64X FACS address mismatch in FADT - d9a05080/0000000000000=
000, using 32
> (XEN) ACPI:             wakeup_vec[d9a0508c], vec_size[20]
> (XEN) ACPI: Local APIC address 0xfee00000
> (XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
> (XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
> (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> (XEN) ACPI: IRQ0 used by override.
> (XEN) ACPI: IRQ2 used by override.
> (XEN) ACPI: IRQ9 used by override.
> (XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
> (XEN) ACPI: BGRT: invalidating v1 image at 0xcbc74018
> (XEN) Using ACPI (MADT) for SMP configuration information
> (XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
> (XEN) IRQ limits: 24 GSI, 808 MSI/MSI-X
> (XEN) [VT-D]drivers/passthrough/vtd/qinval.c:520: QI: using 256-entry rin=
g(s)
> (XEN) Switched to APIC driver x2apic_mixed
> (XEN) arch/x86/i8259.c:384: PIC aliasing mask: 1c
> (XEN) CPU0: 800 ... 3400 MHz
> (XEN) xstate: size: 0x340 and states: 0x7
> (XEN) arch/x86/cpu/mcheck/mce_intel.c:773: MCA Capability: firstbank 0, e=
xtended MCE MSR 0, BCAST, CMCI
> (XEN) CPU0: Intel machine check reporting enabled
> (XEN) Speculative mitigation facilities:
> (XEN)   Hardware hints:
> (XEN)   Hardware features:
> (XEN)   Compiled-in support: INDIRECT_THUNK RETURN_THUNK SHADOW_PAGING HA=
RDEN_ARRAY HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
> (XEN)   Xen settings: BTI-Thunk: RETPOLINE, SPEC_CTRL: No, Other: BRANCH_=
HARDEN
> (XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe add=
ress 8000000000
> (XEN)   Support for HVM VMs: RSB EAGER_FPU
> (XEN)   Support for PV VMs: EAGER_FPU
> (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
> (XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Initializing Credit2 scheduler
> (XEN)  load_precision_shift: 18
> (XEN)  load_window_shift: 30
> (XEN)  underload_balance_tolerance: 0
> (XEN)  overload_balance_tolerance: -3
> (XEN)  runqueues arrangement: socket
> (XEN)  cap enforcement granularity: 10ms
> (XEN) load tracking window length 1073741824 ns
> (XEN) Using IDT event delivery
> (XEN) arch/x86/time.c:495: PIT aliasing mask: 10
> (XEN) ----[ Xen-4.22-unstable  x86_64  debug=3Dy  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d04064a6f8>] hpet_setup+0x6b/0x120
> (XEN) RFLAGS: 0000000000010082   CONTEXT: hypervisor
> (XEN) rax: ffff82cffff3a000   rbx: 0000000000000000   rcx: 00000000000000=
0c
> (XEN) rdx: ffff82fffffffffe   rsi: 8000000000000000   rdi: ffff8300c421ff=
f8
> (XEN) rbp: ffff82d04065fd28   rsp: ffff82d04065fd18   r8:  00000000000000=
46
> (XEN) r9:  ffff82d04092e180   r10: ffff82d04092e188   r11: 00000000000000=
10
> (XEN) r12: ffff82d04069c0c0   r13: ffff82d040666530   r14: ffff82d04092f0=
a8
> (XEN) r15: ffff82d04069c0d8   cr0: 000000008005003b   cr4: 00000000001506=
e0
> (XEN) cr3: 00000000c4222000   cr2: ffff82cffff3a000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d04064a6f8> (hpet_setup+0x6b/0x120):
> (XEN)  00 a0 f3 ff cf 82 ff ff <8b> 10 84 d2 0f 84 80 00 00 00 a1 04 a0 f=
3 ff cf
> (XEN) Xen stack trace from rsp=3Dffff82d04065fd18:
> (XEN)    ffff82d040666530 ffff82d04092f0a8 ffff82d04065fd48 ffff82d040649=
63a
> (XEN)    ffff82d040666530 ffff82d04092f0a8 ffff82d04065fd78 ffff82d040649=
7c9
> (XEN)    0000000000000010 ffff82d04069c0c0 ffff82d040666530 ffff82d04092f=
0a8
> (XEN)    ffff82d04065fdb8 ffff82d040649fef 0000000000000000 ffff82d04092f=
1a0
> (XEN)    ffff82d04092f1a0 ffff82d040808208 0000000000000002 ffff83041a9b8=
000
> (XEN)    ffff82d04065ff00 ffff82d0406449d2 ffff82d04069b020 000000041a9c8=
000
> (XEN)    ffff82d04069b050 0000000100000000 ffff82d04093ff08 0000000001102=
000
> (XEN)    ffff82d040696014 ffff82d04069aff0 000000041dfe5400 0000000000100=
000
> (XEN)    0000000000000000 0000050000000000 ffffffff00000163 000000000041f=
e00
> (XEN)    0000000000000019 0000000601000000 00000001ffffffff ffff82d04065f=
f08
> (XEN)    ffff82d04069b020 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000800000000 0000000100000=
06e
> (XEN)    0000000000000003 00000000000002f8 ffff82d040927000 ffff82d040927=
000
> (XEN)    ffffffffffffffff 0000000000000000 00000000cbcffe58 0000000000000=
000
> (XEN)    00000000c4068acb 00000000c29e2620 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04064a6f8>] R hpet_setup+0x6b/0x120
> (XEN)    [<ffff82d04064963a>] F arch/x86/time.#init_hpet+0x30/0x119
> (XEN)    [<ffff82d0406497c9>] F arch/x86/time.#try_platform_timer+0x17/0x=
12b
> (XEN)    [<ffff82d040649fef>] F early_time_init+0x1e7/0x2ec
> (XEN)    [<ffff82d0406449d2>] F __start_xen+0x1f2e/0x25b1
> (XEN) 
> (XEN) Pagetable walk from ffff82cffff3a000:
> (XEN)  L4[0x105] =3D 00000000c4221063 ffffffffffffffff
> (XEN)  L3[0x13f] =3D 00000000c421f063 ffffffffffffffff
> (XEN)  L2[0x1ff] =3D 00000000c432b063 ffffffffffffffff
> (XEN)  L1[0x13a] =3D 80000000fed00173 ffffffffffffffff
> (XEN) 
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0009]
> (XEN) Faulting linear address: ffff82cffff3a000
> (XEN) ****************************************
> (XEN) 
> (XEN) Reboot in five seconds...
> (XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

With "require NX", I don't get anything on the serial console, and VGA 
gives a black screen after loading Xen. I'm not sure what's going on in 
this case.

If "DEP" is enabled in firmware, there are no issues so far.

Teddy


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



