Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6B9E07A6
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 16:55:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846747.1261895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI8ks-0007aS-R9; Mon, 02 Dec 2024 15:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846747.1261895; Mon, 02 Dec 2024 15:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI8ks-0007XJ-N6; Mon, 02 Dec 2024 15:54:34 +0000
Received: by outflank-mailman (input) for mailman id 846747;
 Mon, 02 Dec 2024 15:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sBX=S3=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1tI8kq-0007XD-6f
 for xen-devel@lists.xen.org; Mon, 02 Dec 2024 15:54:33 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b296e102-b0c5-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 16:54:23 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1tI8ke-004lbS-8Z;
 Mon, 02 Dec 2024 15:54:21 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 60DE8B84841;
 Mon,  2 Dec 2024 15:54:24 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id tR1zea69a3op; Mon,  2 Dec 2024 15:54:24 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id E12F4B8483A;
 Mon,  2 Dec 2024 15:54:23 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id AED5134C; Mon,  2 Dec 2024 15:54:23 +0000 (GMT)
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
X-Inumbo-ID: b296e102-b0c5-11ef-99a3-01e77a169b0f
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Mon, 2 Dec 2024 15:54:23 +0000
From: James Dingwall <james@dingwall.me.uk>
To: xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"security@xenproject.org" <security@xenproject.org>
Subject: Re: stable-4.18: reliably crash network driver domain by squeezing
 free_memory
Message-ID: <Z03YL1KHwE1fO98g@dingwall.me.uk>
References: <Z0iMxP2gah9Ky4Pl@dingwall.me.uk>
 <6614df33-e383-44dd-aebc-a238ad82f398@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mynTevqUIMXVj7cQ"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6614df33-e383-44dd-aebc-a238ad82f398@citrix.com>
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--mynTevqUIMXVj7cQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2024 at 03:39:07PM +0000, Andrew Cooper wrote:
> On 28/11/2024 3:31 pm, James Dingwall wrote:
> > Hi,
> >
> > We have reproducible issue with the current HEAD of the stable-4.18 branch
> > which crashes a network driver domain and on some hardware subsequently
> > results in a dom0 crash.
> >
> > `xl info` reports: free_memory : 39961, configuring a guest with
> > memory = 39800 and starting it gives the log as below.  This is intel
> > hardware so if I've followed the code correctly I think this leads through
> > to intel_iommu_map_page() from drivers/passthrough/vtd/iommu.c.
> >
> > The expectation is that we can safely allocate up to free_memory for a
> > guest without any issue.  Is there any extra logging we could enable to
> > gain more information?
> 
> For this, you really should CC the x86 maintainers, or it stands a
> chance of getting missed.
> 
> Do you have the complete serial log including boot and eventual crash ?
> 
> -12 is -ENOMEM so something is wonky, and while dom2 is definitely dead
> at this point, Xen ought to be able to unwind cleanly and not take down
> dom0 too.
> 
> ~Andrew

<snipped the original crash report since it is also in the attached logs>

I've attached complete serial console logs from an Intel and an AMD dom0
which show similar behaviour.  The dom0 crash originally mentioned was
resolved by updating a patch for OpenZFS issue #15140 and no longer
occurs.

During the capture of the serial console logs I noted that:

1. If the order that the domains start is different then there is no crash.
   Restarting the domain later will lead to the driver domain crash even
   without a configuration change.
2. If the domU memory is closer to free_memory but still less than the
   domain fails to start with libxl reporting not enough memory.

So there is some undefined range for (free_memory - m) to (free_memory - n)
where it is possible to crash the driver domain depending on the guest
startup ordering.  My (perhaps naive) reasoning would be that
free_memory is the resource available to safely assign without having to
allow for some unknown overhead and if I do ask for too much then I
get a 'safe' failure.

Thanks,
James

--mynTevqUIMXVj7cQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="amd-enomem.txt"
Content-Transfer-Encoding: quoted-printable

(XEN) Xen version 4.18.3 (@) (gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0) de=
bug=3Dy Fri Nov 15 14:08:14 UTC 2024
(XEN) Latest ChangeSet: Fri Nov 15 14:07:55 2024 +0000 git:8d7c71efb0
(XEN) build-id: c241bf4ecc9a93bbcc74e7f758c4f55a6759216f
(XEN) Bootloader: GRUB 2.06-2ubuntu14.4
(XEN) Command line: placeholder console=3Dvga,com2 dom0_max_vcpus=3D4-8 dom=
0_mem=3Dmin:6144,max:65536m iommu=3Don,required,intpost,verbose,debug x2api=
c=3Doff sched=3Dcredit2 flask=3Denforcing gnttab_max_frames=3D128 xpti=3Dof=
f smt=3Don cpufreq=3Dxen:performance spec-ctrl=3Dgds-mit=3D0 com2=3Dirq=3D3=
,io-base=3D0xfedc9000,reg-shift=3D2
(XEN) Xen image load base address: 0x8e000000
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) CPU Vendor: AMD, Family 25 (0x19), Model 117 (0x75), Stepping 2 (raw =
00a70f52)
(XEN) Enabling Supervisor Shadow Stacks
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 0000000009a7efff] (usable)
(XEN)  [0000000009a7f000, 0000000009ffffff] (reserved)
(XEN)  [000000000a000000, 000000000a1fffff] (usable)
(XEN)  [000000000a200000, 000000000a23bfff] (ACPI NVS)
(XEN)  [000000000a23c000, 0000000093c7dfff] (usable)
(XEN)  [0000000093c7e000, 0000000096683fff] (reserved)
(XEN)  [0000000096684000, 00000000966f2fff] (ACPI data)
(XEN)  [00000000966f3000, 000000009716dfff] (ACPI NVS)
(XEN)  [000000009716e000, 000000009affefff] (reserved)
(XEN)  [000000009afff000, 000000009bff8fff] (usable)
(XEN)  [000000009bff9000, 000000009bffcfff] (reserved)
(XEN)  [000000009bffd000, 000000009bffefff] (usable)
(XEN)  [000000009bfff000, 000000009cffffff] (reserved)
(XEN)  [000000009d790000, 000000009d7effff] (reserved)
(XEN)  [000000009d7f5000, 000000009fffffff] (reserved)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000fd000000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 0000000fde2fffff] (usable)
(XEN)  [0000000fdf340000, 00000010801fffff] (reserved)
(XEN) BSP microcode revision: 0x0a705205
(XEN) ACPI: RSDP 97154014, 0024 (r2 ALASKA)
(XEN) ACPI: XSDT 97153728, 013C (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: FACP 966E8000, 0114 (r6 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: DSDT 966E0000, 78B7 (r2 ALASKA   A M I   1072009 INTL 20200717)
(XEN) ACPI: FACS 9690D000, 0040
(XEN) ACPI: SSDT 966EA000, 8416 (r2    AMD AmdTable        2 MSFT  2000002)
(XEN) ACPI: SSDT 966E9000, 0221 (r2 ALASKA  CPUSSDT  1072009 AMI   1072009)
(XEN) ACPI: FIDT 966DF000, 009C (r1 ALASKA    A M I  1072009 AMI     10013)
(XEN) ACPI: MCFG 966DE000, 003C (r1 ALASKA    A M I  1072009 MSFT    10013)
(XEN) ACPI: HPET 966DD000, 0038 (r1 ALASKA    A M I  1072009 AMI         5)
(XEN) ACPI: UEFI 9690C000, 0048 (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: FPDT 966DC000, 0044 (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: VFCT 966D7000, 4284 (r1 ALASKA   A M I         1 AMD  33504F47)
(XEN) ACPI: TPM2 966D6000, 0044 (r5 ALASKA   A M I         1 AMI         0)
(XEN) ACPI: SSDT 966D0000, 547E (r2    AMD AmdTable        1 AMD         1)
(XEN) ACPI: CRAT 966CF000, 0EE8 (r1    AMD AmdTable        1 AMD         1)
(XEN) ACPI: CDIT 966CE000, 0029 (r1    AMD AmdTable        1 AMD         1)
(XEN) ACPI: SDEV 966CD000, 0144 (r1    AMD SdevTble        1 ACPI        2)
(XEN) ACPI: SSDT 966CB000, 15C8 (r2    AMD CPMDFIG2        1 INTL 20200717)
(XEN) ACPI: SSDT 966C8000, 2A9E (r2    AMD CDFAAIG2        1 INTL 20200717)
(XEN) ACPI: SSDT 966C6000, 1E78 (r2    AMD   CPMPMF        1 INTL 20200717)
(XEN) ACPI: SSDT 966C4000, 12AE (r2    AMD   OEMACP        1 INTL 20200717)
(XEN) ACPI: SSDT 966C3000, 08BA (r2    AMD   OEMPMF        1 INTL 20200717)
(XEN) ACPI: SSDT 966B9000, 98F6 (r2    AMD   CPMCMN        1 INTL 20200717)
(XEN) ACPI: WSMT 966B8000, 0028 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: APIC 966B7000, 00E8 (r5 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: MHSP 966B6000, 00C8 (r4 AMD    AGESA    20505348    =01        =
1)
(XEN) ACPI: SSDT 966B5000, 00E5 (r2 MSFT       MHSP        4 INTL 20200717)
(XEN) ACPI: SSDT 966B2000, 233C (r2    AMD AOD             1 INTL 20200717)
(XEN) ACPI: SSDT 966B1000, 0051 (r2    AMD     DRTM        1 INTL 20200717)
(XEN) ACPI: IVRS 966B0000, 0198 (r2  AMD   AmdTable        1 AMD         1)
(XEN) ACPI: SSDT 966AF000, 0968 (r2    AMD CPMMSOSC        1 INTL 20200717)
(XEN) ACPI: SSDT 966AE000, 0FF5 (r2    AMD CPMACPV5        1 INTL 20200717)
(XEN) ACPI: SSDT 966AD000, 0FF7 (r2    AMD GPP_PME_        1 INTL 20200717)
(XEN) ACPI: SSDT 966A3000, 98BD (r2    AMD INTGPP03        1 INTL 20200717)
(XEN) ACPI: SSDT 9669E000, 4FEB (r2    AMD INTGPP01        1 INTL 20200717)
(XEN) ACPI: SSDT 9669D000, 0DA2 (r2    AMD CPMGPIO0        1 INTL 20200717)
(XEN) ACPI: SSDT 9669C000, 008D (r2    AMD CPMMSLPI        1 INTL 20200717)
(XEN) ACPI: SSDT 9669B000, 0501 (r2    AMD CPMSFAML        1 INTL 20200717)
(XEN) System RAM: 63273MB (64791924kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000fde300000
(XEN) Domain heap initialised
(XEN) SMBIOS 3.5 present.
(XEN) XSM Framework v1.0.1 initialized
(XEN) Policy len 0x3467, start at ffff830fde1fc000.
(XEN) Flask: 128 avtab hash slots, 458 rules.
(XEN) Flask: 128 avtab hash slots, 458 rules.
(XEN) Flask:  4 users, 3 roles, 46 types, 2 bools
(XEN) Flask:  13 classes, 458 rules
(XEN) Flask:  Starting in enforcing mode.
(XEN) AMD-Vi: IVRS Block: Found type 0x10 flags 0xb0 len 0x44 id 0x2
(XEN) AMD-Vi: IVRS Block: Found type 0x11 flags 0x30 len 0x54 id 0x2
(XEN) AMD-Vi: Using IVHD type 0x11
(XEN) AMD-Vi: Found MSI capability block at 0x64
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 9690d000/000000000000000=
0, using 32
(XEN) ACPI:             wakeup_vec[9690d00c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x21] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x22] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 24-55
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ1 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: HPET id: 0x10228201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 16 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 56 GSI, 3272 MSI/MSI-X
(XEN) Not enabling x2APIC: disabled by cmdline.
(XEN) CPU0: 1600 ... 3300 MHz
(XEN) xstate: size: 0x988 and states: 0x2e7
(XEN) CPU0: AMD Fam19h machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints: STIBP_ALWAYS IBRS_FAST IBRS_SAME_MODE
(XEN)   Hardware features: IBPB IBRS STIBP SSBD PSFD L1D_FLUSH
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING HARDEN_ARRAY HARD=
EN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD- PSFD-, =
Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB IBPB-entry
(XEN)   Support for PV VMs: IBPB-entry
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 3293.813 MHz processor.
(XEN) Freed 1016kB unused BSS memory
(XEN) EFI memory map:
(XEN)  0000000000000-0000000007fff type=3D2 attr=3D000000000000000f
(XEN)  0000000008000-000000008efff type=3D7 attr=3D000000000000000f
(XEN)  000000008f000-000000009efff type=3D2 attr=3D000000000000000f
(XEN)  000000009f000-000000009ffff type=3D4 attr=3D000000000000000f
(XEN)  0000000100000-0000000ffffff type=3D7 attr=3D000000000000000f
(XEN)  0000001000000-000000107ffff type=3D4 attr=3D000000000000000f
(XEN)  0000001080000-0000002104fff type=3D2 attr=3D000000000000000f
(XEN)  0000002105000-0000009a7efff type=3D7 attr=3D000000000000000f
(XEN)  0000009a7f000-0000009ffffff type=3D0 attr=3D000000000000000f
(XEN)  000000a000000-000000a1fffff type=3D7 attr=3D000000000000000f
(XEN)  000000a200000-000000a23bfff type=3D10 attr=3D000000000000000f
(XEN)  000000a23c000-0000012d96fff type=3D2 attr=3D000000000000000f
(XEN)  0000012d97000-000007441efff type=3D7 attr=3D000000000000000f
(XEN)  000007441f000-000007fffefff type=3D1 attr=3D000000000000000f
(XEN)  000007ffff000-000008e1fffff type=3D7 attr=3D000000000000000f
(XEN)  000008e200000-000008e62afff type=3D2 attr=3D000000000000000f
(XEN)  000008e62b000-000008e7aafff type=3D7 attr=3D000000000000000f
(XEN)  000008e7ab000-000008ea25fff type=3D1 attr=3D000000000000000f
(XEN)  000008ea26000-000008eca2fff type=3D2 attr=3D000000000000000f
(XEN)  000008eca3000-000008eca4fff type=3D7 attr=3D000000000000000f
(XEN)  000008eca5000-000008eca5fff type=3D2 attr=3D000000000000000f
(XEN)  000008eca6000-000008ed7cfff type=3D1 attr=3D000000000000000f
(XEN)  000008ed7d000-000008f67efff type=3D4 attr=3D000000000000000f
(XEN)  000008f67f000-000008f807fff type=3D7 attr=3D000000000000000f
(XEN)  000008f808000-000008f809fff type=3D4 attr=3D000000000000000f
(XEN)  000008f80a000-000008f8eafff type=3D7 attr=3D000000000000000f
(XEN)  000008f8eb000-000009347efff type=3D4 attr=3D000000000000000f
(XEN)  000009347f000-0000093617fff type=3D7 attr=3D000000000000000f
(XEN)  0000093618000-0000093c7dfff type=3D3 attr=3D000000000000000f
(XEN)  0000093c7e000-0000096683fff type=3D0 attr=3D000000000000000f
(XEN)  0000096684000-00000966f2fff type=3D9 attr=3D000000000000000f
(XEN)  00000966f3000-000009716dfff type=3D10 attr=3D000000000000000f
(XEN)  000009716e000-000009af7afff type=3D6 attr=3D800000000000000f
(XEN)  000009af7b000-000009affefff type=3D5 attr=3D800000000000000f
(XEN)  000009afff000-000009b5fffff type=3D4 attr=3D000000000000000f
(XEN)  000009b600000-000009b697fff type=3D7 attr=3D000000000000000f
(XEN)  000009b698000-000009b797fff type=3D4 attr=3D000000000000000f
(XEN)  000009b798000-000009b7bafff type=3D3 attr=3D000000000000000f
(XEN)  000009b7bb000-000009be40fff type=3D4 attr=3D000000000000000f
(XEN)  000009be41000-000009be5dfff type=3D3 attr=3D000000000000000f
(XEN)  000009be5e000-000009be78fff type=3D4 attr=3D000000000000000f
(XEN)  000009be79000-000009be88fff type=3D3 attr=3D000000000000000f
(XEN)  000009be89000-000009be9afff type=3D4 attr=3D000000000000000f
(XEN)  000009be9b000-000009bea2fff type=3D3 attr=3D000000000000000f
(XEN)  000009bea3000-000009bebafff type=3D4 attr=3D000000000000000f
(XEN)  000009bebb000-000009bebefff type=3D3 attr=3D000000000000000f
(XEN)  000009bebf000-000009bed2fff type=3D4 attr=3D000000000000000f
(XEN)  000009bed3000-000009bee5fff type=3D3 attr=3D000000000000000f
(XEN)  000009bee6000-000009bfeffff type=3D4 attr=3D000000000000000f
(XEN)  000009bff0000-000009bff6fff type=3D3 attr=3D000000000000000f
(XEN)  000009bff7000-000009bff8fff type=3D4 attr=3D000000000000000f
(XEN)  000009bff9000-000009bffcfff type=3D6 attr=3D800000000000000f
(XEN)  000009bffd000-000009bffefff type=3D4 attr=3D000000000000000f
(XEN)  000009bfff000-000009bffffff type=3D6 attr=3D800000000000000f
(XEN)  0000100000000-0000fde2fffff type=3D7 attr=3D000000000000000f
(XEN)  00000000a0000-00000000fffff type=3D0 attr=3D000000000000000f
(XEN)  000009c000000-000009cffffff type=3D0 attr=3D000000000000000f
(XEN)  000009d790000-000009d7effff type=3D0 attr=3D000000000000000f
(XEN)  000009d7f5000-000009fffffff type=3D0 attr=3D000000000000000f
(XEN)  00000e0000000-00000efffffff type=3D11 attr=3D800000000000100d
(XEN)  00000fd000000-00000fedfffff type=3D11 attr=3D800000000000100d
(XEN)  00000fee00000-00000fee00fff type=3D11 attr=3D8000000000000001
(XEN)  00000fee01000-00000ffffffff type=3D11 attr=3D800000000000100d
(XEN)  0000fdf340000-000105fffffff type=3D0 attr=3D000000000000000f
(XEN)  0001060000000-00010801fffff type=3D11 attr=3D800000000000100d
(XEN) alt table ffff82d040489b58 -> ffff82d04049c5c6
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN) - Peripheral Page Service Request
(XEN) - NX bit
(XEN) - Invalidate All Command
(XEN) - Guest APIC
(XEN) - Performance Counters
(XEN) - Host Address Translation Size: 0x2
(XEN) - Guest Address Translation Size: 0
(XEN) - Guest CR3 Root Table Level: 0x1
(XEN) - Maximum PASID: 0xf
(XEN) - SMI Filter Register: 0x1
(XEN) - SMI Filter Register Count: 0x1
(XEN) - Guest Virtual APIC Modes: 0
(XEN) - Dual PPR Log: 0x2
(XEN) - Dual Event Log: 0x2
(XEN) - Secure ATS
(XEN) - User / Supervisor Page Protection
(XEN) - Device Table Segmentation: 0x3
(XEN) - PPR Log Overflow Early Warning
(XEN) - PPR Automatic Response
(XEN) - Memory Access Routing and Control: 0x1
(XEN) - Block StopMark Message
(XEN) - Performance Optimization
(XEN) - MSI Capability MMIO Access
(XEN) - Guest I/O Protection
(XEN) - Enhanced PPR Handling
(XEN) - Invalidate IOTLB Type
(XEN) - VM Table Size: 0x2
(XEN) - Guest Access Bit Update Disable
(XEN) AMD-Vi: ACPI Table:
(XEN) AMD-Vi:  Signature IVRS
(XEN) AMD-Vi:  Length 0x198
(XEN) AMD-Vi:  Revision 0x2
(XEN) AMD-Vi:  CheckSum 0xc0
(XEN) AMD-Vi:  OEM_Id AMD =20
(XEN) AMD-Vi:  OEM_Table_Id AmdTable
(XEN) AMD-Vi:  OEM_Revision 0x1
(XEN) AMD-Vi:  Creator_Id AMD=20
(XEN) AMD-Vi:  Creator_Revision 0x1
(XEN) AMD-Vi: IVRS Block: type 0x10 flags 0xb0 len 0x44 id 0x2
(XEN) AMD-Vi: IVRS Block: type 0x11 flags 0x30 len 0x54 id 0x2
(XEN) AMD-Vi: IVHD Device Entry: type 0x3 id 0x3 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0x3 -> 0xfffe
(XEN) AMD-Vi: IVHD Device Entry: type 0x43 id 0xff00 flags 0
(XEN) AMD-Vi:  Dev_Id Range: 0xff00 -> 0xffff alias 0xa5
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x1 handle 0x21
(XEN) AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x22
(XEN) AMD-Vi: IVRS Block: type 0x40 flags 0x30 len 0xd0 id 0x2
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: using 256-entry cmd ring(s)
(XEN) AMD-Vi: PPR Log Enabled.
(XEN) AMD-Vi: Guest Translation Enabled.
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode.  Using 2 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
(XEN) Allocated console ring of 128 KiB.
(XEN) mwait-idle: does not run on family 25 model 117
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN)  - VMCB Clean Bits
(XEN)  - DecodeAssists
(XEN)  - Virtual VMLOAD/VMSAVE
(XEN)  - Virtual GIF
(XEN)  - Pause-Intercept Filter
(XEN)  - Pause-Intercept Filter Threshold
(XEN)  - TSC Rate MSR
(XEN)  - NPT Supervisor Shadow Stack
(XEN)  - MSR_SPEC_CTRL virtualisation
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d040489b58 -> ffff82d04049c5c6
(XEN) cpu10: spurious 8259A interrupt: IRQ7
(XEN) Brought up 16 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) Adding cpu 8 to runqueue 0
(XEN) Adding cpu 9 to runqueue 0
(XEN) Adding cpu 10 to runqueue 0
(XEN) Adding cpu 11 to runqueue 0
(XEN) Adding cpu 12 to runqueue 0
(XEN) Adding cpu 13 to runqueue 0
(XEN) Adding cpu 14 to runqueue 0
(XEN) Adding cpu 15 to runqueue 0
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Running stub recovery selftests...
(XEN) Fixup #UD[0000]: ffff82d07fffe044 [ffff82d07fffe044] -> ffff82d04038a=
141
(XEN) Fixup #GP[0000]: ffff82d07fffe045 [ffff82d07fffe045] -> ffff82d04038a=
141
(XEN) Fixup #SS[0000]: ffff82d07fffe044 [ffff82d07fffe044] -> ffff82d04038a=
141
(XEN) Fixup #BP[0000]: ffff82d07fffe045 [ffff82d07fffe045] -> ffff82d04038a=
141
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 1096 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb
(XEN)  Dom0 kernel: 64-bit, lsb, paddr 0x1000000 -> 0x4800000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000fa0000000->0000000fa8000000 (15902088 pages to=
 be allocated)
(XEN)  Init. ramdisk: 0000000fd56a1000->0000000fde1fb724
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff84800000
(XEN)  Phys-Mach map: 0000008000000000->00000080079d8718
(XEN)  Start info:    ffffffff84800000->ffffffff848004b8
(XEN)  Page tables:   ffffffff84801000->ffffffff8482a000
(XEN)  Boot stack:    ffffffff8482a000->ffffffff8482b000
(XEN)  TOTAL:         ffffffff80000000->ffffffff84c00000
(XEN)  ENTRY ADDRESS: ffffffff838c48c0
(XEN) Dom0 has maximum 8 VCPUs
(XEN) AMD-Vi: Skipping host bridge 0000:00:00.0
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x8, type =3D 0x6, root t=
able =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x9, type =3D 0x2, root t=
able =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xb, type =3D 0x2, root t=
able =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x10, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x11, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x12, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x13, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x14, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x18, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x20, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x40, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x41, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x42, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x43, type =3D 0x2, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xa0, type =3D 0x7, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xa3, type =3D 0x7, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc0, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc1, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc2, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc3, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc4, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc5, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc6, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0xc7, type =3D 0x6, root =
table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x100, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x200, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x300, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x400, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x500, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x600, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x700, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x701, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x702, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x703, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x704, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x705, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x706, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x707, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x800, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x801, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x900, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x903, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x904, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Re-running stub recovery selftests...
(XEN) Fixup #UD[0000]: ffff82d07fffe044 [ffff82d07fffe044] -> ffff82d04038a=
141
(XEN) Fixup #GP[0000]: ffff82d07fffe045 [ffff82d07fffe045] -> ffff82d04038a=
141
(XEN) Fixup #SS[0000]: ffff82d07fffe044 [ffff82d07fffe044] -> ffff82d04038a=
141
(XEN) Fixup #BP[0000]: ffff82d07fffe045 [ffff82d07fffe045] -> ffff82d04038a=
141
(XEN) Freed 700kB init memory
mapping kernel into physical memory
about to get started...
[    0.000000] Linux version 6.8.0-48-generic (root@a5570d9c6ad5) (x86_64-l=
inux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0, GNU ld (GNU Binutils=
 for Ubuntu) 2.38) #48~22.04.1 SMP PREEMPT_DYNAMIC Tue Nov 26 23:18:34 UTC =
 (Ubuntu 6.8.0-48.48~22.04.1-generic 6.8.12)
[    0.000000] Command line: console=3Dhvc0 console=3Dtty1 earlyprintk=3Dxe=
n xen-pciback.passthrough=3D1 oops=3Dpanic panic=3D15 root=3D/dev/loop0 ro =
rootfstype=3Dext4 zyimage=3Dzvol:xvda1@ref5030000 zyoverlay pstore.backend=
=3Defi libata.fua=3D1 audit=3D1 nohz=3Doff consoleblank=3D0 modprobe.blackl=
ist=3D8250_dw
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai =20
[    0.000000] [Firmware Bug]: TSC doesn't count with P0 frequency!
[    0.000000] initrd moved from [mem 0x08000000-0x10b5a724] to [mem 0x1853=
7000-0x21091724]
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] usable
[    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000009a7efff] usable
[    0.000000] Xen: [mem 0x0000000009a7f000-0x0000000009ffffff] reserved
[    0.000000] Xen: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] Xen: [mem 0x000000000a200000-0x000000000a23bfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000000a23c000-0x0000000093c7dfff] usable
[    0.000000] Xen: [mem 0x0000000093c7e000-0x0000000096683fff] reserved
[    0.000000] Xen: [mem 0x0000000096684000-0x00000000966f2fff] ACPI data
[    0.000000] Xen: [mem 0x00000000966f3000-0x000000009716dfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000009716e000-0x000000009affefff] reserved
[    0.000000] Xen: [mem 0x000000009afff000-0x000000009bff8fff] usable
[    0.000000] Xen: [mem 0x000000009bff9000-0x000000009bffcfff] reserved
[    0.000000] Xen: [mem 0x000000009bffd000-0x000000009bffefff] usable
[    0.000000] Xen: [mem 0x000000009bfff000-0x000000009cffffff] reserved
[    0.000000] Xen: [mem 0x000000009d790000-0x000000009d7effff] reserved
[    0.000000] Xen: [mem 0x000000009d7f5000-0x000000009fffffff] reserved
[    0.000000] Xen: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] Xen: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x0000000fde2fffff] usable
[    0.000000] Xen: [mem 0x0000000fdf340000-0x00000010801fffff] reserved
[    0.000000] printk: legacy bootconsole [xenboot0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.8 by American Megatrends
[    0.000000] efi: ACPI=3D0x97154000 ACPI 2.0=3D0x97154014 TPMFinalLog=3D0=
x97120000 SMBIOS=3D0x9ad65000 SMBIOS 3.0=3D0x9ad64000 (MEMATTR=3D0x8f8eb098=
 unusable) ESRT=3D0x9669a018 MOKvar=3D0x9adc2000=20
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.5.0 present.
[    0.000000] DMI: Simply NUC EES24E32r8/EES24E32r8B, BIOS 0ACTF_SR_000_33=
 05/31/2024
[    0.000000] Hypervisor detected: Xen PV
[    0.026632] tsc: Fast TSC calibration using PIT
[    0.026634] tsc: Detected 3293.815 MHz processor
[    0.026635] tsc: Detected 3293.812 MHz TSC
[    0.026716] last_pfn =3D 0xfde300 max_arch_pfn =3D 0x400000000
[    0.026719] MTRR map: 1 entries (0 fixed + 1 variable; max 16), built fr=
om 8 variable MTRRs
[    0.026720] MTRRs set to read-only
[    0.026723] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC=
 =20
[    0.026725] last_pfn =3D 0x9bfff max_arch_pfn =3D 0x400000000
[    0.026744] esrt: Reserving ESRT space from 0x000000009669a018 to 0x0000=
00009669a050.
[    0.966402] secureboot: Secure boot disabled
[    0.966423] RAMDISK: [mem 0x18537000-0x21091fff]
[    0.966430] ACPI: Early table checksum verification disabled
[    0.966437] ACPI: RSDP 0x0000000097154014 000024 (v02 ALASKA)
[    0.966444] ACPI: XSDT 0x0000000097153728 00013C (v01 ALASKA A M I    01=
072009 AMI  01000013)
[    0.966486] ACPI: FACP 0x00000000966E8000 000114 (v06 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966527] ACPI: DSDT 0x00000000966E0000 0078B7 (v02 ALASKA A M I    01=
072009 INTL 20200717)
[    0.966532] ACPI: FACS 0x000000009690D000 000040
[    0.966537] ACPI: SSDT 0x00000000966EA000 008416 (v02 AMD    AmdTable 00=
000002 MSFT 02000002)
[    0.966564] ACPI: SSDT 0x00000000966E9000 000221 (v02 ALASKA CPUSSDT  01=
072009 AMI  01072009)
[    0.966569] ACPI: FIDT 0x00000000966DF000 00009C (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966574] ACPI: MCFG 0x00000000966DE000 00003C (v01 ALASKA A M I    01=
072009 MSFT 00010013)
[    0.966579] ACPI: HPET 0x00000000966DD000 000038 (v01 ALASKA A M I    01=
072009 AMI  00000005)
[    0.966584] ACPI: UEFI 0x000000009690C000 000048 (v01 ALASKA A M I    01=
072009 AMI  01000013)
[    0.966589] ACPI: FPDT 0x00000000966DC000 000044 (v01 ALASKA A M I    01=
072009 AMI  01000013)
[    0.966594] ACPI: VFCT 0x00000000966D7000 004284 (v01 ALASKA A M I    00=
000001 AMD  33504F47)
[    0.966599] ACPI: TPM2 0x00000000966D6000 000044 (v05 ALASKA A M I    00=
000001 AMI  00000000)
[    0.966604] ACPI: SSDT 0x00000000966D0000 00547E (v02 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966609] ACPI: CRAT 0x00000000966CF000 000EE8 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966614] ACPI: CDIT 0x00000000966CE000 000029 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966619] ACPI: SDEV 0x00000000966CD000 000144 (v01 AMD    SdevTble 00=
000001 ACPI 00000002)
[    0.966624] ACPI: SSDT 0x00000000966CB000 0015C8 (v02 AMD    CPMDFIG2 00=
000001 INTL 20200717)
[    0.966629] ACPI: SSDT 0x00000000966C8000 002A9E (v02 AMD    CDFAAIG2 00=
000001 INTL 20200717)
[    0.966634] ACPI: SSDT 0x00000000966C6000 001E78 (v02 AMD    CPMPMF   00=
000001 INTL 20200717)
[    0.966639] ACPI: SSDT 0x00000000966C4000 0012AE (v02 AMD    OEMACP   00=
000001 INTL 20200717)
[    0.966644] ACPI: SSDT 0x00000000966C3000 0008BA (v02 AMD    OEMPMF   00=
000001 INTL 20200717)
[    0.966649] ACPI: SSDT 0x00000000966B9000 0098F6 (v02 AMD    CPMCMN   00=
000001 INTL 20200717)
[    0.966654] ACPI: WSMT 0x00000000966B8000 000028 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966658] ACPI: APIC 0x00000000966B7000 0000E8 (v05 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966664] ACPI: MHSP 0x00000000966B6000 0000C8 (v04 AMD    AGESA    20=
505348 ?    00000001)
[    0.966669] ACPI: SSDT 0x00000000966B5000 0000E5 (v02 MSFT   MHSP     00=
000004 INTL 20200717)
[    0.966674] ACPI: SSDT 0x00000000966B2000 00233C (v02 AMD    AOD      00=
000001 INTL 20200717)
[    0.966678] ACPI: SSDT 0x00000000966B1000 000051 (v02 AMD    DRTM     00=
000001 INTL 20200717)
[    0.966683] ACPI: IVRS 0x00000000966B0000 000198 (v02 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966688] ACPI: SSDT 0x00000000966AF000 000968 (v02 AMD    CPMMSOSC 00=
000001 INTL 20200717)
[    0.966693] ACPI: SSDT 0x00000000966AE000 000FF5 (v02 AMD    CPMACPV5 00=
000001 INTL 20200717)
[    0.966698] ACPI: SSDT 0x00000000966AD000 000FF7 (v02 AMD    GPP_PME_ 00=
000001 INTL 20200717)
[    0.966703] ACPI: SSDT 0x00000000966A3000 0098BD (v02 AMD    INTGPP03 00=
000001 INTL 20200717)
[    0.966708] ACPI: SSDT 0x000000009669E000 004FEB (v02 AMD    INTGPP01 00=
000001 INTL 20200717)
[    0.966713] ACPI: SSDT 0x000000009669D000 000DA2 (v02 AMD    CPMGPIO0 00=
000001 INTL 20200717)
[    0.966718] ACPI: SSDT 0x000000009669C000 00008D (v02 AMD    CPMMSLPI 00=
000001 INTL 20200717)
[    0.966723] ACPI: SSDT 0x000000009669B000 000501 (v02 AMD    CPMSFAML 00=
000001 INTL 20200717)
[    0.966726] ACPI: Reserving FACP table memory at [mem 0x966e8000-0x966e8=
113]
[    0.966728] ACPI: Reserving DSDT table memory at [mem 0x966e0000-0x966e7=
8b6]
[    0.966729] ACPI: Reserving FACS table memory at [mem 0x9690d000-0x9690d=
03f]
[    0.966730] ACPI: Reserving SSDT table memory at [mem 0x966ea000-0x966f2=
415]
[    0.966731] ACPI: Reserving SSDT table memory at [mem 0x966e9000-0x966e9=
220]
[    0.966732] ACPI: Reserving FIDT table memory at [mem 0x966df000-0x966df=
09b]
[    0.966733] ACPI: Reserving MCFG table memory at [mem 0x966de000-0x966de=
03b]
[    0.966734] ACPI: Reserving HPET table memory at [mem 0x966dd000-0x966dd=
037]
[    0.966735] ACPI: Reserving UEFI table memory at [mem 0x9690c000-0x9690c=
047]
[    0.966737] ACPI: Reserving FPDT table memory at [mem 0x966dc000-0x966dc=
043]
[    0.966738] ACPI: Reserving VFCT table memory at [mem 0x966d7000-0x966db=
283]
[    0.966739] ACPI: Reserving TPM2 table memory at [mem 0x966d6000-0x966d6=
043]
[    0.966740] ACPI: Reserving SSDT table memory at [mem 0x966d0000-0x966d5=
47d]
[    0.966741] ACPI: Reserving CRAT table memory at [mem 0x966cf000-0x966cf=
ee7]
[    0.966742] ACPI: Reserving CDIT table memory at [mem 0x966ce000-0x966ce=
028]
[    0.966743] ACPI: Reserving SDEV table memory at [mem 0x966cd000-0x966cd=
143]
[    0.966744] ACPI: Reserving SSDT table memory at [mem 0x966cb000-0x966cc=
5c7]
[    0.966745] ACPI: Reserving SSDT table memory at [mem 0x966c8000-0x966ca=
a9d]
[    0.966746] ACPI: Reserving SSDT table memory at [mem 0x966c6000-0x966c7=
e77]
[    0.966747] ACPI: Reserving SSDT table memory at [mem 0x966c4000-0x966c5=
2ad]
[    0.966749] ACPI: Reserving SSDT table memory at [mem 0x966c3000-0x966c3=
8b9]
[    0.966750] ACPI: Reserving SSDT table memory at [mem 0x966b9000-0x966c2=
8f5]
[    0.966751] ACPI: Reserving WSMT table memory at [mem 0x966b8000-0x966b8=
027]
[    0.966752] ACPI: Reserving APIC table memory at [mem 0x966b7000-0x966b7=
0e7]
[    0.966753] ACPI: Reserving MHSP table memory at [mem 0x966b6000-0x966b6=
0c7]
[    0.966754] ACPI: Reserving SSDT table memory at [mem 0x966b5000-0x966b5=
0e4]
[    0.966755] ACPI: Reserving SSDT table memory at [mem 0x966b2000-0x966b4=
33b]
[    0.966756] ACPI: Reserving SSDT table memory at [mem 0x966b1000-0x966b1=
050]
[    0.966757] ACPI: Reserving IVRS table memory at [mem 0x966b0000-0x966b0=
197]
[    0.966759] ACPI: Reserving SSDT table memory at [mem 0x966af000-0x966af=
967]
[    0.966760] ACPI: Reserving SSDT table memory at [mem 0x966ae000-0x966ae=
ff4]
[    0.966761] ACPI: Reserving SSDT table memory at [mem 0x966ad000-0x966ad=
ff6]
[    0.966762] ACPI: Reserving SSDT table memory at [mem 0x966a3000-0x966ac=
8bc]
[    0.966763] ACPI: Reserving SSDT table memory at [mem 0x9669e000-0x966a2=
fea]
[    0.966764] ACPI: Reserving SSDT table memory at [mem 0x9669d000-0x9669d=
da1]
[    0.966765] ACPI: Reserving SSDT table memory at [mem 0x9669c000-0x9669c=
08c]
[    0.966766] ACPI: Reserving SSDT table memory at [mem 0x9669b000-0x9669b=
500]
[    0.966827] APIC: Switched APIC routing to: Xen PV
[    0.966863] NUMA turned off
[    0.966864] Faking a node at [mem 0x0000000000000000-0x0000000fde2fffff]
[    0.966870] NODE_DATA(0) allocated [mem 0xf3b0b8000-0xf3b0e2fff]
[    1.052384] Zone ranges:
[    1.052388]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    1.052390]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    1.052392]   Normal   [mem 0x0000000100000000-0x0000000fde2fffff]
[    1.052393]   Device   empty
[    1.052395] Movable zone start for each node
[    1.052396] Early memory node ranges
[    1.052397]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
[    1.052399]   node   0: [mem 0x0000000000100000-0x0000000009a7efff]
[    1.052400]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    1.052401]   node   0: [mem 0x000000000a23c000-0x0000000093c7dfff]
[    1.052403]   node   0: [mem 0x000000009afff000-0x000000009bff8fff]
[    1.052404]   node   0: [mem 0x000000009bffd000-0x000000009bffefff]
[    1.052405]   node   0: [mem 0x0000000100000000-0x0000000fde2fffff]
[    1.052410] Initmem setup node 0 [mem 0x0000000000001000-0x0000000fde2ff=
fff]
[    1.052416] On node 0, zone DMA: 1 pages in unavailable ranges
[    1.052429] On node 0, zone DMA: 128 pages in unavailable ranges
[    1.052539] On node 0, zone DMA32: 1409 pages in unavailable ranges
[    1.054214] On node 0, zone DMA32: 60 pages in unavailable ranges
[    1.054384] On node 0, zone DMA32: 29569 pages in unavailable ranges
[    1.054401] On node 0, zone DMA32: 4 pages in unavailable ranges
[    1.090715] On node 0, zone Normal: 16385 pages in unavailable ranges
[    1.090770] On node 0, zone Normal: 7424 pages in unavailable ranges
[    1.090773] p2m virtual area at (____ptrval____), size is 40000000
[    1.337431] Remapped 440771 page(s)
[    1.338130] ACPI: PM-Timer IO Port: 0x808
[    1.338186] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    1.338208] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0=
-23
[    1.338215] IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 2=
4-55
[    1.338223] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    1.338226] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    1.338229] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    1.338243] ACPI: Using ACPI (MADT) for SMP configuration information
[    1.338245] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    1.338675] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    1.338689] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    1.338691] PM: hibernation: Registered nosave memory: [mem 0x00080000-0=
x000fffff]
[    1.338693] PM: hibernation: Registered nosave memory: [mem 0x09a7f000-0=
x09ffffff]
[    1.338694] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a23bfff]
[    1.338696] PM: hibernation: Registered nosave memory: [mem 0x93c7e000-0=
x96683fff]
[    1.338697] PM: hibernation: Registered nosave memory: [mem 0x96684000-0=
x966f2fff]
[    1.338698] PM: hibernation: Registered nosave memory: [mem 0x966f3000-0=
x9716dfff]
[    1.338699] PM: hibernation: Registered nosave memory: [mem 0x9716e000-0=
x9affefff]
[    1.338701] PM: hibernation: Registered nosave memory: [mem 0x9bff9000-0=
x9bffcfff]
[    1.338703] PM: hibernation: Registered nosave memory: [mem 0x9bfff000-0=
x9cffffff]
[    1.338704] PM: hibernation: Registered nosave memory: [mem 0x9d000000-0=
x9d78ffff]
[    1.338705] PM: hibernation: Registered nosave memory: [mem 0x9d790000-0=
x9d7effff]
[    1.338706] PM: hibernation: Registered nosave memory: [mem 0x9d7f0000-0=
x9d7f4fff]
[    1.338707] PM: hibernation: Registered nosave memory: [mem 0x9d7f5000-0=
x9fffffff]
[    1.338708] PM: hibernation: Registered nosave memory: [mem 0xa0000000-0=
xdfffffff]
[    1.338709] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0=
xefffffff]
[    1.338710] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0=
xfcffffff]
[    1.338711] PM: hibernation: Registered nosave memory: [mem 0xfd000000-0=
xffffffff]
[    1.338713] [mem 0xa0000000-0xdfffffff] available for PCI devices
[    1.338720] Booting kernel on Xen
[    1.338721] Xen version: 4.18.3 (preserve-AD)
[    1.338724] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    1.338732] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    1.338982] percpu: Embedded 86 pages/cpu s229376 r8192 d114688 u524288
[    1.339028] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, =
linear)
[    1.339031] Kernel command line: console=3Dhvc0 console=3Dtty1 earlyprin=
tk=3Dxen xen-pciback.passthrough=3D1 oops=3Dpanic panic=3D15 root=3D/dev/lo=
op0 ro rootfstype=3Dext4 zyimage=3Dzvol:xvda1@ref5030000 zyoverlay pstore.b=
ackend=3Defi libata.fua=3D1 audit=3D1 nohz=3Doff consoleblank=3D0 modprobe.=
blacklist=3D8250_dw
[    1.339108] audit: enabled (after initialization)
[    1.339124] Unknown kernel command line parameters "zyoverlay zyimage=3D=
zvol:xvda1@ref5030000", will be passed to user space.
[    1.339316] random: crng init done
[    1.342318] Dentry cache hash table entries: 8388608 (order: 14, 6710886=
4 bytes, linear)
[    1.343852] Inode-cache hash table entries: 4194304 (order: 13, 33554432=
 bytes, linear)
[    1.343993] Fallback order for Node 0: 0=20
[    1.343997] Built 1 zonelists, mobility grouping on.  Total pages: 15944=
838
[    1.344000] Policy zone: Normal
[    1.344009] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    1.344012] software IO TLB: area num 8.
[    1.454324] Memory: 62248564K/64791792K available (22528K kernel code, 4=
438K rwdata, 13964K rodata, 4972K init, 4740K bss, 2542976K reserved, 0K cm=
a-reserved)
[    1.455150] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
Poking KASLR using RDRAND RDTSC...
[    1.455490] ftrace: allocating 57923 entries in 227 pages
[    1.463031] ftrace: allocated 227 pages with 5 groups
[    1.463604] Dynamic Preempt: voluntary
[    1.463679] rcu: Preemptible hierarchical RCU implementation.
[    1.463681] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D8.
[    1.463682] 	Trampoline variant of Tasks RCU enabled.
[    1.463683] 	Rude variant of Tasks RCU enabled.
[    1.463684] 	Tracing variant of Tasks RCU enabled.
[    1.463685] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    1.463686] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    1.466431] NR_IRQS: 524544, nr_irqs: 1032, preallocated irqs: 16
[    1.466497] xen:events: Using FIFO-based ABI
[    1.466544] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    1.466822] Console: colour dummy device 80x25
[    1.466825] printk: legacy console [tty1] enabled
[    1.466828] printk: legacy bootconsole [xenboot0] disabled
[    0.000000] Linux version 6.8.0-48-generic (root@a5570d9c6ad5) (x86_64-l=
inux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0, GNU ld (GNU Binutils=
 for Ubuntu) 2.38) #48~22.04.1 SMP PREEMPT_DYNAMIC Tue Nov 26 23:18:34 UTC =
 (Ubuntu 6.8.0-48.48~22.04.1-generic 6.8.12)
[    0.000000] Command line: console=3Dhvc0 console=3Dtty1 earlyprintk=3Dxe=
n xen-pciback.passthrough=3D1 oops=3Dpanic panic=3D15 root=3D/dev/loop0 ro =
rootfstype=3Dext4 zyimage=3Dzvol:xvda1@ref5030000 zyoverlay pstore.backend=
=3Defi libata.fua=3D1 audit=3D1 nohz=3Doff consoleblank=3D0 modprobe.blackl=
ist=3D8250_dw
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai =20
[    0.000000] [Firmware Bug]: TSC doesn't count with P0 frequency!
[    0.000000] initrd moved from [mem 0x08000000-0x10b5a724] to [mem 0x1853=
7000-0x21091724]
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] usable
[    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000009a7efff] usable
[    0.000000] Xen: [mem 0x0000000009a7f000-0x0000000009ffffff] reserved
[    0.000000] Xen: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] Xen: [mem 0x000000000a200000-0x000000000a23bfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000000a23c000-0x0000000093c7dfff] usable
[    0.000000] Xen: [mem 0x0000000093c7e000-0x0000000096683fff] reserved
[    0.000000] Xen: [mem 0x0000000096684000-0x00000000966f2fff] ACPI data
[    0.000000] Xen: [mem 0x00000000966f3000-0x000000009716dfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000009716e000-0x000000009affefff] reserved
[    0.000000] Xen: [mem 0x000000009afff000-0x000000009bff8fff] usable
[    0.000000] Xen: [mem 0x000000009bff9000-0x000000009bffcfff] reserved
[    0.000000] Xen: [mem 0x000000009bffd000-0x000000009bffefff] usable
[    0.000000] Xen: [mem 0x000000009bfff000-0x000000009cffffff] reserved
[    0.000000] Xen: [mem 0x000000009d790000-0x000000009d7effff] reserved
[    0.000000] Xen: [mem 0x000000009d7f5000-0x000000009fffffff] reserved
[    0.000000] Xen: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] Xen: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x0000000fde2fffff] usable
[    0.000000] Xen: [mem 0x0000000fdf340000-0x00000010801fffff] reserved
[    0.000000] printk: legacy bootconsole [xenboot0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.8 by American Megatrends
[    0.000000] efi: ACPI=3D0x97154000 ACPI 2.0=3D0x97154014 TPMFinalLog=3D0=
x97120000 SMBIOS=3D0x9ad65000 SMBIOS 3.0=3D0x9ad64000 (MEMATTR=3D0x8f8eb098=
 unusable) ESRT=3D0x9669a018 MOKvar=3D0x9adc2000=20
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.5.0 present.
[    0.000000] DMI: Simply NUC EES24E32r8/EES24E32r8B, BIOS 0ACTF_SR_000_33=
 05/31/2024
[    0.000000] Hypervisor detected: Xen PV
[    0.026632] tsc: Fast TSC calibration using PIT
[    0.026634] tsc: Detected 3293.815 MHz processor
[    0.026635] tsc: Detected 3293.812 MHz TSC
[    0.026716] last_pfn =3D 0xfde300 max_arch_pfn =3D 0x400000000
[    0.026719] MTRR map: 1 entries (0 fixed + 1 variable; max 16), built fr=
om 8 variable MTRRs
[    0.026720] MTRRs set to read-only
[    0.026723] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC=
 =20
[    0.026725] last_pfn =3D 0x9bfff max_arch_pfn =3D 0x400000000
[    0.026744] esrt: Reserving ESRT space from 0x000000009669a018 to 0x0000=
00009669a050.
[    0.966402] secureboot: Secure boot disabled
[    0.966423] RAMDISK: [mem 0x18537000-0x21091fff]
[    0.966430] ACPI: Early table checksum verification disabled
[    0.966437] ACPI: RSDP 0x0000000097154014 000024 (v02 ALASKA)
[    0.966444] ACPI: XSDT 0x0000000097153728 00013C (v01 ALASKA A M I    01=
072009 AMI  01000013)
[    0.966486] ACPI: FACP 0x00000000966E8000 000114 (v06 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966527] ACPI: DSDT 0x00000000966E0000 0078B7 (v02 ALASKA A M I    01=
072009 INTL 20200717)
[    0.966532] ACPI: FACS 0x000000009690D000 000040
[    0.966537] ACPI: SSDT 0x00000000966EA000 008416 (v02 AMD    AmdTable 00=
000002 MSFT 02000002)
[    0.966564] ACPI: SSDT 0x00000000966E9000 000221 (v02 ALASKA CPUSSDT  01=
072009 AMI  01072009)
[    0.966569] ACPI: FIDT 0x00000000966DF000 00009C (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966574] ACPI: MCFG 0x00000000966DE000 00003C (v01 ALASKA A M I    01=
072009 MSFT 00010013)
[    0.966579] ACPI: HPET 0x00000000966DD000 000038 (v01 ALASKA A M I    01=
072009 AMI  00000005)
[    0.966584] ACPI: UEFI 0x000000009690C000 000048 (v01 ALASKA A M I    01=
072009 AMI  01000013)
[    0.966589] ACPI: FPDT 0x00000000966DC000 000044 (v01 ALASKA A M I    01=
072009 AMI  01000013)
[    0.966594] ACPI: VFCT 0x00000000966D7000 004284 (v01 ALASKA A M I    00=
000001 AMD  33504F47)
[    0.966599] ACPI: TPM2 0x00000000966D6000 000044 (v05 ALASKA A M I    00=
000001 AMI  00000000)
[    0.966604] ACPI: SSDT 0x00000000966D0000 00547E (v02 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966609] ACPI: CRAT 0x00000000966CF000 000EE8 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966614] ACPI: CDIT 0x00000000966CE000 000029 (v01 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966619] ACPI: SDEV 0x00000000966CD000 000144 (v01 AMD    SdevTble 00=
000001 ACPI 00000002)
[    0.966624] ACPI: SSDT 0x00000000966CB000 0015C8 (v02 AMD    CPMDFIG2 00=
000001 INTL 20200717)
[    0.966629] ACPI: SSDT 0x00000000966C8000 002A9E (v02 AMD    CDFAAIG2 00=
000001 INTL 20200717)
[    0.966634] ACPI: SSDT 0x00000000966C6000 001E78 (v02 AMD    CPMPMF   00=
000001 INTL 20200717)
[    0.966639] ACPI: SSDT 0x00000000966C4000 0012AE (v02 AMD    OEMACP   00=
000001 INTL 20200717)
[    0.966644] ACPI: SSDT 0x00000000966C3000 0008BA (v02 AMD    OEMPMF   00=
000001 INTL 20200717)
[    0.966649] ACPI: SSDT 0x00000000966B9000 0098F6 (v02 AMD    CPMCMN   00=
000001 INTL 20200717)
[    0.966654] ACPI: WSMT 0x00000000966B8000 000028 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966658] ACPI: APIC 0x00000000966B7000 0000E8 (v05 ALASKA A M I    01=
072009 AMI  00010013)
[    0.966664] ACPI: MHSP 0x00000000966B6000 0000C8 (v04 AMD    AGESA    20=
505348 ?    00000001)
[    0.966669] ACPI: SSDT 0x00000000966B5000 0000E5 (v02 MSFT   MHSP     00=
000004 INTL 20200717)
[    0.966674] ACPI: SSDT 0x00000000966B2000 00233C (v02 AMD    AOD      00=
000001 INTL 20200717)
[    0.966678] ACPI: SSDT 0x00000000966B1000 000051 (v02 AMD    DRTM     00=
000001 INTL 20200717)
[    0.966683] ACPI: IVRS 0x00000000966B0000 000198 (v02 AMD    AmdTable 00=
000001 AMD  00000001)
[    0.966688] ACPI: SSDT 0x00000000966AF000 000968 (v02 AMD    CPMMSOSC 00=
000001 INTL 20200717)
[    0.966693] ACPI: SSDT 0x00000000966AE000 000FF5 (v02 AMD    CPMACPV5 00=
000001 INTL 20200717)
[    0.966698] ACPI: SSDT 0x00000000966AD000 000FF7 (v02 AMD    GPP_PME_ 00=
000001 INTL 20200717)
[    0.966703] ACPI: SSDT 0x00000000966A3000 0098BD (v02 AMD    INTGPP03 00=
000001 INTL 20200717)
[    0.966708] ACPI: SSDT 0x000000009669E000 004FEB (v02 AMD    INTGPP01 00=
000001 INTL 20200717)
[    0.966713] ACPI: SSDT 0x000000009669D000 000DA2 (v02 AMD    CPMGPIO0 00=
000001 INTL 20200717)
[    0.966718] ACPI: SSDT 0x000000009669C000 00008D (v02 AMD    CPMMSLPI 00=
000001 INTL 20200717)
[    0.966723] ACPI: SSDT 0x000000009669B000 000501 (v02 AMD    CPMSFAML 00=
000001 INTL 20200717)
[    0.966726] ACPI: Reserving FACP table memory at [mem 0x966e8000-0x966e8=
113]
[    0.966728] ACPI: Reserving DSDT table memory at [mem 0x966e0000-0x966e7=
8b6]
[    0.966729] ACPI: Reserving FACS table memory at [mem 0x9690d000-0x9690d=
03f]
[    0.966730] ACPI: Reserving SSDT table memory at [mem 0x966ea000-0x966f2=
415]
[    0.966731] ACPI: Reserving SSDT table memory at [mem 0x966e9000-0x966e9=
220]
[    0.966732] ACPI: Reserving FIDT table memory at [mem 0x966df000-0x966df=
09b]
[    0.966733] ACPI: Reserving MCFG table memory at [mem 0x966de000-0x966de=
03b]
[    0.966734] ACPI: Reserving HPET table memory at [mem 0x966dd000-0x966dd=
037]
[    0.966735] ACPI: Reserving UEFI table memory at [mem 0x9690c000-0x9690c=
047]
[    0.966737] ACPI: Reserving FPDT table memory at [mem 0x966dc000-0x966dc=
043]
[    0.966738] ACPI: Reserving VFCT table memory at [mem 0x966d7000-0x966db=
283]
[    0.966739] ACPI: Reserving TPM2 table memory at [mem 0x966d6000-0x966d6=
043]
[    0.966740] ACPI: Reserving SSDT table memory at [mem 0x966d0000-0x966d5=
47d]
[    0.966741] ACPI: Reserving CRAT table memory at [mem 0x966cf000-0x966cf=
ee7]
[    0.966742] ACPI: Reserving CDIT table memory at [mem 0x966ce000-0x966ce=
028]
[    0.966743] ACPI: Reserving SDEV table memory at [mem 0x966cd000-0x966cd=
143]
[    0.966744] ACPI: Reserving SSDT table memory at [mem 0x966cb000-0x966cc=
5c7]
[    0.966745] ACPI: Reserving SSDT table memory at [mem 0x966c8000-0x966ca=
a9d]
[    0.966746] ACPI: Reserving SSDT table memory at [mem 0x966c6000-0x966c7=
e77]
[    0.966747] ACPI: Reserving SSDT table memory at [mem 0x966c4000-0x966c5=
2ad]
[    0.966749] ACPI: Reserving SSDT table memory at [mem 0x966c3000-0x966c3=
8b9]
[    0.966750] ACPI: Reserving SSDT table memory at [mem 0x966b9000-0x966c2=
8f5]
[    0.966751] ACPI: Reserving WSMT table memory at [mem 0x966b8000-0x966b8=
027]
[    0.966752] ACPI: Reserving APIC table memory at [mem 0x966b7000-0x966b7=
0e7]
[    0.966753] ACPI: Reserving MHSP table memory at [mem 0x966b6000-0x966b6=
0c7]
[    0.966754] ACPI: Reserving SSDT table memory at [mem 0x966b5000-0x966b5=
0e4]
[    0.966755] ACPI: Reserving SSDT table memory at [mem 0x966b2000-0x966b4=
33b]
[    0.966756] ACPI: Reserving SSDT table memory at [mem 0x966b1000-0x966b1=
050]
[    0.966757] ACPI: Reserving IVRS table memory at [mem 0x966b0000-0x966b0=
197]
[    0.966759] ACPI: Reserving SSDT table memory at [mem 0x966af000-0x966af=
967]
[    0.966760] ACPI: Reserving SSDT table memory at [mem 0x966ae000-0x966ae=
ff4]
[    0.966761] ACPI: Reserving SSDT table memory at [mem 0x966ad000-0x966ad=
ff6]
[    0.966762] ACPI: Reserving SSDT table memory at [mem 0x966a3000-0x966ac=
8bc]
[    0.966763] ACPI: Reserving SSDT table memory at [mem 0x9669e000-0x966a2=
fea]
[    0.966764] ACPI: Reserving SSDT table memory at [mem 0x9669d000-0x9669d=
da1]
[    0.966765] ACPI: Reserving SSDT table memory at [mem 0x9669c000-0x9669c=
08c]
[    0.966766] ACPI: Reserving SSDT table memory at [mem 0x9669b000-0x9669b=
500]
[    0.966827] APIC: Switched APIC routing to: Xen PV
[    0.966863] NUMA turned off
[    0.966864] Faking a node at [mem 0x0000000000000000-0x0000000fde2fffff]
[    0.966870] NODE_DATA(0) allocated [mem 0xf3b0b8000-0xf3b0e2fff]
[    1.052384] Zone ranges:
[    1.052388]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    1.052390]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    1.052392]   Normal   [mem 0x0000000100000000-0x0000000fde2fffff]
[    1.052393]   Device   empty
[    1.052395] Movable zone start for each node
[    1.052396] Early memory node ranges
[    1.052397]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
[    1.052399]   node   0: [mem 0x0000000000100000-0x0000000009a7efff]
[    1.052400]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    1.052401]   node   0: [mem 0x000000000a23c000-0x0000000093c7dfff]
[    1.052403]   node   0: [mem 0x000000009afff000-0x000000009bff8fff]
[    1.052404]   node   0: [mem 0x000000009bffd000-0x000000009bffefff]
[    1.052405]   node   0: [mem 0x0000000100000000-0x0000000fde2fffff]
[    1.052410] Initmem setup node 0 [mem 0x0000000000001000-0x0000000fde2ff=
fff]
[    1.052416] On node 0, zone DMA: 1 pages in unavailable ranges
[    1.052429] On node 0, zone DMA: 128 pages in unavailable ranges
[    1.052539] On node 0, zone DMA32: 1409 pages in unavailable ranges
[    1.054214] On node 0, zone DMA32: 60 pages in unavailable ranges
[    1.054384] On node 0, zone DMA32: 29569 pages in unavailable ranges
[    1.054401] On node 0, zone DMA32: 4 pages in unavailable ranges
[    1.090715] On node 0, zone Normal: 16385 pages in unavailable ranges
[    1.090770] On node 0, zone Normal: 7424 pages in unavailable ranges
[    1.090773] p2m virtual area at (____ptrval____), size is 40000000
[    1.337431] Remapped 440771 page(s)
[    1.338130] ACPI: PM-Timer IO Port: 0x808
[    1.338186] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    1.338208] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0=
-23
[    1.338215] IOAPIC[1]: apic_id 34, version 33, address 0xfec01000, GSI 2=
4-55
[    1.338223] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    1.338226] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    1.338229] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    1.338243] ACPI: Using ACPI (MADT) for SMP configuration information
[    1.338245] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    1.338675] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    1.338689] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    1.338691] PM: hibernation: Registered nosave memory: [mem 0x00080000-0=
x000fffff]
[    1.338693] PM: hibernation: Registered nosave memory: [mem 0x09a7f000-0=
x09ffffff]
[    1.338694] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a23bfff]
[    1.338696] PM: hibernation: Registered nosave memory: [mem 0x93c7e000-0=
x96683fff]
[    1.338697] PM: hibernation: Registered nosave memory: [mem 0x96684000-0=
x966f2fff]
[    1.338698] PM: hibernation: Registered nosave memory: [mem 0x966f3000-0=
x9716dfff]
[    1.338699] PM: hibernation: Registered nosave memory: [mem 0x9716e000-0=
x9affefff]
[    1.338701] PM: hibernation: Registered nosave memory: [mem 0x9bff9000-0=
x9bffcfff]
[    1.338703] PM: hibernation: Registered nosave memory: [mem 0x9bfff000-0=
x9cffffff]
[    1.338704] PM: hibernation: Registered nosave memory: [mem 0x9d000000-0=
x9d78ffff]
[    1.338705] PM: hibernation: Registered nosave memory: [mem 0x9d790000-0=
x9d7effff]
[    1.338706] PM: hibernation: Registered nosave memory: [mem 0x9d7f0000-0=
x9d7f4fff]
[    1.338707] PM: hibernation: Registered nosave memory: [mem 0x9d7f5000-0=
x9fffffff]
[    1.338708] PM: hibernation: Registered nosave memory: [mem 0xa0000000-0=
xdfffffff]
[    1.338709] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0=
xefffffff]
[    1.338710] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0=
xfcffffff]
[    1.338711] PM: hibernation: Registered nosave memory: [mem 0xfd000000-0=
xffffffff]
[    1.338713] [mem 0xa0000000-0xdfffffff] available for PCI devices
[    1.338720] Booting kernel on Xen
[    1.338721] Xen version: 4.18.3 (preserve-AD)
[    1.338724] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    1.338732] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    1.338982] percpu: Embedded 86 pages/cpu s229376 r8192 d114688 u524288
[    1.339028] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, =
linear)
[    1.339031] Kernel command line: console=3Dhvc0 console=3Dtty1 earlyprin=
tk=3Dxen xen-pciback.passthrough=3D1 oops=3Dpanic panic=3D15 root=3D/dev/lo=
op0 ro rootfstype=3Dext4 zyimage=3Dzvol:xvda1@ref5030000 zyoverlay pstore.b=
ackend=3Defi libata.fua=3D1 audit=3D1 nohz=3Doff consoleblank=3D0 modprobe.=
blacklist=3D8250_dw
[    1.339108] audit: enabled (after initialization)
[    1.339124] Unknown kernel command line parameters "zyoverlay zyimage=3D=
zvol:xvda1@ref5030000", will be passed to user space.
[    1.339316] random: crng init done
[    1.342318] Dentry cache hash table entries: 8388608 (order: 14, 6710886=
4 bytes, linear)
[    1.343852] Inode-cache hash table entries: 4194304 (order: 13, 33554432=
 bytes, linear)
[    1.343993] Fallback order for Node 0: 0=20
[    1.343997] Built 1 zonelists, mobility grouping on.  Total pages: 15944=
838
[    1.344000] Policy zone: Normal
[    1.344009] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    1.344012] software IO TLB: area num 8.
[    1.454324] Memory: 62248564K/64791792K available (22528K kernel code, 4=
438K rwdata, 13964K rodata, 4972K init, 4740K bss, 2542976K reserved, 0K cm=
a-reserved)
[    1.455150] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    1.455490] ftrace: allocating 57923 entries in 227 pages
[    1.463031] ftrace: allocated 227 pages with 5 groups
[    1.463604] Dynamic Preempt: voluntary
[    1.463679] rcu: Preemptible hierarchical RCU implementation.
[    1.463681] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D8.
[    1.463682] 	Trampoline variant of Tasks RCU enabled.
[    1.463683] 	Rude variant of Tasks RCU enabled.
[    1.463684] 	Tracing variant of Tasks RCU enabled.
[    1.463685] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    1.463686] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    1.466431] NR_IRQS: 524544, nr_irqs: 1032, preallocated irqs: 16
[    1.466497] xen:events: Using FIFO-based ABI
[    1.466544] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    1.466822] Console: colour dummy device 80x25
[    1.466825] printk: legacy console [tty1] enabled
[    1.466828] printk: legacy bootconsole [xenboot0] disabled
[    1.466832] printk: legacy console [hvc0] enabled
[    1.467132] ACPI: Core revision 20230628
[    1.495547] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
[    1.495555] installing Xen timer for CPU 0
[    1.495622] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2f7a76a4ebd, max_idle_ns: 440795230158 ns
[    1.495628] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 6587.62 BogoMIPS (lpj=3D3293812)
[    1.495663] Last level iTLB entries: 4KB 512, 2MB 512, 4MB 256
[    1.495666] Last level dTLB entries: 4KB 3072, 2MB 3072, 4MB 1536, 1GB 0
[    1.495669] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    1.495674] Spectre V2 : Mitigation: Retpolines
[    1.495676] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    1.495679] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    1.495682] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    1.495686] Speculative Store Bypass: Vulnerable
[    1.495688] Speculative Return Stack Overflow: Mitigation: Safe RET
[    1.495698] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    1.495701] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    1.495704] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    1.495706] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    1.495708] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    1.495711] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    1.495713] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    1.495716] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    1.495718] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    1.495721] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    1.495723] x86/fpu: Enabled xstate features 0xe7, context size is 2432 =
bytes, using 'compacted' format.
[    1.511484] Freeing SMP alternatives memory: 48K
[    1.511493] pid_max: default: 32768 minimum: 301
[    1.511544] LSM: initializing lsm=3Dlockdown,capability,landlock,yama,ap=
parmor,integrity
[    1.511567] landlock: Up and running.
[    1.511571] Yama: becoming mindful.
[    1.511605] AppArmor: AppArmor initialized
[    1.511678] Mount-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    1.511721] Mountpoint-cache hash table entries: 131072 (order: 8, 10485=
76 bytes, linear)
[    1.512178] cpu 0 spinlock event irq 57
[    1.512187] VPMU disabled by hypervisor.
[    1.512388] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    1.512428] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_=
adjust=3D1.
[    1.512450] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    1.512474] Performance Events: PMU not available due to virtualization,=
 using software events only.
[    1.512485] signal: max sigframe size: 3376
[    1.512520] rcu: Hierarchical SRCU implementation.
[    1.512525] rcu: 	Max phase no-delay instances is 400.
[    1.520689] NMI watchdog: Perf NMI watchdog permanently disabled
[    1.520793] smp: Bringing up secondary CPUs ...
[    1.520926] installing Xen timer for CPU 1
[    1.521145] installing Xen timer for CPU 2
[    1.521331] installing Xen timer for CPU 3
[    1.521527] installing Xen timer for CPU 4
[    1.521716] installing Xen timer for CPU 5
[    1.521897] installing Xen timer for CPU 6
[    1.522072] installing Xen timer for CPU 7
[    1.522144] cpu 1 spinlock event irq 97
[    1.522144] cpu 2 spinlock event irq 98
[    1.522144] cpu 3 spinlock event irq 99
[    1.522635] cpu 4 spinlock event irq 100
[    1.522744] cpu 5 spinlock event irq 101
[    1.522763] cpu 6 spinlock event irq 102
[    1.522763] cpu 7 spinlock event irq 103
[    1.522765] smp: Brought up 1 node, 8 CPUs
[    1.522771] smpboot: Max logical packages: 1
[    1.524439] devtmpfs: initialized
[    1.524439] x86/mm: Memory block size: 128MB
[    1.530666] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a23=
bfff] (245760 bytes)
[    1.530678] ACPI: PM: Registering ACPI NVS region [mem 0x966f3000-0x9716=
dfff] (10989568 bytes)
[    1.530844] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    1.530858] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    1.530927] pinctrl core: initialized pinctrl subsystem
[    1.531034] PM: RTC time: 13:39:38, date: 2024-12-02
[    1.532061] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    1.532086] xen:grant_table: Grant tables using version 1 layout
[    1.532106] Grant table initialized
[    1.532577] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    1.532786] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    1.532980] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    1.533000] audit: initializing netlink subsys (enabled)
[    1.533015] audit: type=3D2000 audit(1733146778.033:1): state=3Dinitiali=
zed audit_enabled=3D1 res=3D1
[    1.533015] thermal_sys: Registered thermal governor 'fair_share'
[    1.533015] thermal_sys: Registered thermal governor 'bang_bang'
[    1.533015] thermal_sys: Registered thermal governor 'step_wise'
[    1.533015] thermal_sys: Registered thermal governor 'user_space'
[    1.533015] thermal_sys: Registered thermal governor 'power_allocator'
[    1.533015] EISA bus registered
[    1.533690] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    1.533948] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for =
domain 0000 [bus 00-ff]
(XEN) d0: Forcing write emulation on MFNs e0000-effff
[    1.566930] PCI: Using configuration type 1 for base access
[    1.567239] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    1.567717] fbcon: Taking over console
[    1.567742] ACPI: Added _OSI(Module Device)
[    1.567747] ACPI: Added _OSI(Processor Device)
[    1.567751] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.567756] ACPI: Added _OSI(Processor Aggregator Device)
[    1.600527] ACPI: 21 ACPI AML tables successfully acquired and loaded
[    1.622838] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    1.624340] ACPI: Interpreter enabled
[    1.624359] ACPI: PM: (supports S0 S3 S4 S5)
[    1.624364] ACPI: Using IOAPIC for interrupt routing
[    1.626467] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    1.626475] PCI: Ignoring E820 reservations for host bridge windows
[    1.627418] ACPI: Enabled 4 GPEs in block 00 to 1F
[    1.630913] ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
[    1.632031] ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
[    1.633056] ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
[    1.634148] ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
[    1.634586] ACPI: \_SB_.PCI0.GP17.PWRS: New power resource
[    1.635033] ACPI: \_SB_.PCI0.GP17.VGA_.PWRS: New power resource
[    1.635567] ACPI: \_SB_.PCI0.GP17.HDAU.PWRS: New power resource
[    1.636027] ACPI: \_SB_.PCI0.GP17.ACP_.PWRS: New power resource
[    1.637100] ACPI: \_SB_.PCI0.GP17.AZAL.PWRS: New power resource
[    1.638165] ACPI: \_SB_.PCI0.GP17.XHC0.PWRS: New power resource
[    1.642929] ACPI: \_SB_.PCI0.GP17.XHC1.PWRS: New power resource
[    1.646471] ACPI: \_SB_.PCI0.GP19.XHC2.PWRS: New power resource
[    1.648936] ACPI: \_SB_.PCI0.GP19.XHC3.PWRS: New power resource
[    1.651469] ACPI: \_SB_.PCI0.GP19.XHC4.PWRS: New power resource
[    1.653968] ACPI: \_SB_.PCI0.GP19.NHI0.PWRS: New power resource
[    1.655031] ACPI: \_SB_.PCI0.GP19.NHI1.PWRS: New power resource
[    1.670026] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    1.670036] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    1.670299] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotp=
lug PME AER PCIeCapability LTR DPC]
[    1.671252] PCI host bridge to bus 0000:00
[    1.671257] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    1.671263] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    1.671268] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    1.671274] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    1.671280] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dfff=
f window]
[    1.671286] pci_bus 0000:00: root bus resource [mem 0xfa000000-0xfcfffff=
f window]
[    1.671292] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xf9fffff=
f window]
[    1.671298] pci_bus 0000:00: root bus resource [mem 0xa0000000-0xdffffff=
f window]
[    1.671304] pci_bus 0000:00: root bus resource [mem[    4.024813] x86/mm=
: Checked W+X mappings: passed, no W+X pages found.
[    4.024870] Run /init as init process
[    4.025387] audit: type=3D1334 audit(1733146780.694:8): prog-id=3D1 op=
=3DUNLOAD
[    4.188822] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  p=
ost: no)
[    4.189248] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:22/LNXVIDEO:00/input/input1
[    4.196462] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    4.196476] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    4.196762] hid: raw HID events driver (C) Jiri Kosina
[    4.196963] pstore: backend 'efi' already in use: ignoring 'efi_pstore'
[    4.197068] Already setup the GSI :37
[    4.197406] xhci_hcd 0000:07:00.3: xHCI Host Controller
[    4.197660] xhci_hcd 0000:07:00.3: new USB bus registered, assigned bus =
number 1
[    4.197774] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[    4.198147] xhci_hcd 0000:07:00.3: hcc params 0x0128ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    4.198425] pcie_mp2_amd 0000:07:00.7: enabling device (0000 -> 0002)
[    4.198783] xhci_hcd 0000:07:00.3: xHCI Host Controller
[    4.198796] xhci_hcd 0000:07:00.3: new USB bus registered, assigned bus =
number 2
[    4.198808] xhci_hcd 0000:07:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    4.198897] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.08
[    4.198908] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.198917] usb usb1: Product: xHCI Host Controller
[    4.198924] usb usb1: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.198932] usb usb1: SerialNumber: 0000:07:00.3
[    4.199192] Already setup the GSI :37
[    4.199727] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    4.199745] nvme 0000:06:00.0: platform quirk: setting simple suspend
[    4.199885] hub 1-0:1.0: USB hub found
[    4.199893] nvme nvme1: pci function 0000:06:00.0
[    4.199900] nvme nvme0: pci function 0000:01:00.0
[    4.199923] hub 1-0:1.0: 5 ports detected
[    4.206498] nvme nvme0: missing or invalid SUBNQN field.
[    4.206509] nvme nvme1: missing or invalid SUBNQN field.
[    4.206656] nvme nvme0: Shutdown timeout set to 8 seconds
[    4.207094] nvme nvme1: Shutdown timeout set to 8 seconds
[    4.211216] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    4.211304] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.08
[    4.211323] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.211338] usb usb2: Product: xHCI Host Controller
[    4.211349] usb usb2: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.211362] usb usb2: SerialNumber: 0000:07:00.3
[    4.211635] hub 2-0:1.0: USB hub found
[    4.211649] hub 2-0:1.0: 2 ports detected
[    4.215753] Already setup the GSI :38
[    4.215953] xhci_hcd 0000:07:00.4: xHCI Host Controller
[    4.215963] xhci_hcd 0000:07:00.4: new USB bus registered, assigned bus =
number 3
[    4.216398] xhci_hcd 0000:07:00.4: hcc params 0x0110ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    4.216699] xhci_hcd 0000:07:00.4: xHCI Host Controller
[    4.216707] xhci_hcd 0000:07:00.4: new USB bus registered, assigned bus =
number 4
[    4.216716] xhci_hcd 0000:07:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    4.216798] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.08
[    4.216806] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.216814] usb usb3: Product: xHCI Host Controller
[    4.216820] usb usb3: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.216826] usb usb3: SerialNumber: 0000:07:00.4
[    4.216978] hub 3-0:1.0: USB hub found
[    4.217006] hub 3-0:1.0: 1 port detected
[    4.218183] nvme nvme0: 8/0/0 default/read/poll queues
[    4.218615] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    4.218660] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.08
[    4.218669] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.218676] usb usb4: Product: xHCI Host Controller
[    4.218682] usb usb4: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.218688] usb usb4: SerialNumber: 0000:07:00.4
[    4.218814] hub 4-0:1.0: USB hub found
[    4.218840] hub 4-0:1.0: 1 port detected
[    4.219576] nvme nvme1: 8/0/0 default/read/poll queues
[    4.220568] Already setup the GSI :46
[    4.220763] xhci_hcd 0000:09:00.3: xHCI Host Controller
[    4.220772] xhci_hcd 0000:09:00.3: new USB bus registered, assigned bus =
number 5
[    4.221139] xhci_hcd 0000:09:00.3: hcc params 0x0110ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    4.221447]  nvme0n1: p1 p2 p3 p4 p5 p6
[    4.221727] xhci_hcd 0000:09:00.3: xHCI Host Controller
[    4.221737] xhci_hcd 0000:09:00.3: new USB bus registered, assigned bus =
number 6
[    4.221746] xhci_hcd 0000:09:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    4.221806] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.08
[    4.221814] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.221823] usb usb5: Product: xHCI Host Controller
[    4.221827] usb usb5: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.221834] usb usb5: SerialNumber: 0000:09:00.3
[    4.221986] hub 5-0:1.0: USB hub found
[    4.222013] hub 5-0:1.0: 1 port detected
[    4.223158]  nvme1n1: p1 p2 p3 p4 p5 p6
[    4.223642] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    4.223691] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.08
[    4.223700] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.223707] usb usb6: Product: xHCI Host Controller
[    4.223713] usb usb6: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.223723] usb usb6: SerialNumber: 0000:09:00.3
[    4.224169] hub 6-0:1.0: USB hub found
[    4.224196] hub 6-0:1.0: 1 port detected
[    4.231228] Already setup the GSI :47
[    4.231481] xhci_hcd 0000:09:00.4: xHCI Host Controller
[    4.231494] xhci_hcd 0000:09:00.4: new USB bus registered, assigned bus =
number 7
[    4.231831] xhci_hcd 0000:09:00.4: hcc params 0x0110ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    4.232615] xhci_hcd 0000:09:00.4: xHCI Host Controller
[    4.232629] xhci_hcd 0000:09:00.4: new USB bus registered, assigned bus =
number 8
[    4.232643] xhci_hcd 0000:09:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    4.232756] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.08
[    4.232771] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.232782] usb usb7: Product: xHCI Host Controller
[    4.232791] usb usb7: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.232800] usb usb7: SerialNumber: 0000:09:00.4
[    4.233143] hub 7-0:1.0: USB hub found
[    4.233202] hub 7-0:1.0: 1 port detected
[    4.235576] usb usb8: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    4.235736] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.08
[    4.235751] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.235763] usb usb8: Product: xHCI Host Controller
[    4.235773] usb usb8: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[    4.235782] usb usb8: SerialNumber: 0000:09:00.4
[    4.244377] hub 8-0:1.0: USB hub found
[    4.244429] hub 8-0:1.0: 1 port detected
[    4.474166] usb 7-1: new high-speed USB device number 2 using xhci_hcd
[    4.604005] usb 7-1: New USB device found, idVendor=3D04b4, idProduct=3D=
6502, bcdDevice=3D50.10
[    4.604016] usb 7-1: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    4.649541] hub 7-1:1.0: USB hub found
[    4.649900] hub 7-1:1.0: 4 ports detected
[    4.718189] usb 8-1: new SuperSpeed USB device number 2 using xhci_hcd
[    4.730589] usb 8-1: New USB device found, idVendor=3D04b4, idProduct=3D=
6500, bcdDevice=3D50.10
[    4.730613] usb 8-1: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    4.762374] hub 8-1:1.0: USB hub found
[    4.762452] hub 8-1:1.0: 4 ports detected
[    5.347496] [drm] amdgpu kernel modesetting enabled.
[    5.355084] raid6: avx512x4 gen() 41154 MB/s
[    5.364461] amdgpu: Virtual CRAT table created for CPU
[    5.364481] amdgpu: Topology: Add CPU node
[    5.364751] amdgpu 0000:07:00.0: enabling device (0006 -> 0007)
[    5.364831] Already setup the GSI :38
[    5.364853] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0=
x1900 0x1002:0x0124 0xD0).
[    5.364935] [drm] register mmio base: 0xFBC00000
[    5.364941] [drm] register mmio size: 524288
[    5.368987] [drm] add ip block number 0 <soc21_common>
[    5.368995] [drm] add ip block number 1 <gmc_v11_0>
[    5.369000] [drm] add ip block number 2 <ih_v6_0>
[    5.369006] [drm] add ip block number 3 <psp>
[    5.369012] [drm] add ip block number 4 <smu>
[    5.369017] [drm] add ip block number 5 <dm>
[    5.369023] [drm] add ip block number 6 <gfx_v11_0>
[    5.369029] [drm] add ip block number 7 <sdma_v6_0>
[    5.369035] [drm] add ip block number 8 <vcn_v4_0>
[    5.369040] [drm] add ip block number 9 <jpeg_v4_0>
[    5.369046] [drm] add ip block number 10 <mes_v11_0>
[    5.372084] raid6: avx512x2 gen() 41444 MB/s
[    5.373486] amdgpu 0000:07:00.0: amdgpu: Fetched VBIOS from VFCT
[    5.373493] amdgpu: ATOM BIOS: 113-PHXGENERIC-001
[    5.378345] [drm] VCN(0) encode/decode are enabled in VM mode
[    5.379507] amdgpu 0000:07:00.0: [drm:jpeg_v4_0_early_init [amdgpu]] JPE=
G decode is enabled in VM mode
[    5.381242] amdgpu 0000:07:00.0: vgaarb: deactivate vga console
[    5.381253] amdgpu 0000:07:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re enabled
[    5.381320] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[    5.381350] amdgpu 0000:07:00.0: amdgpu: VRAM: 2048M 0x0000008000000000 =
- 0x000000807FFFFFFF (2048M used)
[    5.381358] amdgpu 0000:07:00.0: amdgpu: GART: 512M 0x00007FFF00000000 -=
 0x00007FFF1FFFFFFF
[    5.381380] [drm] Detected VRAM RAM=3D2048M, BAR=3D2048M
[    5.381385] [drm] RAM width 128bits DDR5
[    5.389085] raid6: avx512x1 gen() 28187 MB/s
[    5.406084] raid6: avx2x4   gen() 44277 MB/s
[    5.423084] raid6: avx2x2   gen() 50236 MB/s
[    5.440084] raid6: avx2x1   gen() 37095 MB/s
[    5.440090] raid6: using algorithm avx2x2 gen() 50236 MB/s
[    5.457084] raid6: .... xor() 40859 MB/s, rmw enabled
[    5.457090] raid6: using avx512x2 recovery algorithm
[    5.457824] xor: automatically using best checksumming function   avx   =
   =20
[    5.458421] async_tx: api initialized (async)
[    5.526556] md/raid1:mdX: active with 2 out of 2 mirrors
[    5.526573] md/raid1:mdX: active with 2 out of 2 mirrors
[    5.662909] [drm] amdgpu: 2048M of VRAM memory ready
[    5.662947] [drm] amdgpu: 30468M of GTT memory ready.
[    5.662972] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    5.663477] [drm] PCIE GART of 512M enabled (table at 0x000000807FD00000=
).
[    5.664899] [drm] Loading DMUB firmware via PSP: version=3D0x08003700
[    5.665329] [drm] Found VCN firmware Version ENC: 1.19 DEC: 7 VEP: 0 Rev=
ision: 13
[    5.665341] amdgpu 0000:07:00.0: amdgpu: Will use PSP to load VCN firmwa=
re
[    5.691359] [drm] reserve 0x4000000 from 0x8078000000 for PSP TMR
[    6.237764] amdgpu 0000:07:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot available
[    6.245936] amdgpu 0000:07:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot available
[    6.245970] amdgpu 0000:07:00.0: amdgpu: SECUREDISPLAY: securedisplay ta=
 ucode is not available
[    6.279536] amdgpu 0000:07:00.0: amdgpu: SMU is initialized successfully!
[    6.279561] [drm] Seamless boot condition check passed
[    6.280713] [drm] Display Core v3.2.266 initialized on DCN 3.1.4
[    6.280721] [drm] DP-HDMI FRL PCON supported
[    6.282465] [drm] DMUB hardware initialized: version=3D0x08003700
[    6.287786] [drm] kiq ring mec 3 pipe 1 q 0
[    6.290333] [drm] VCN decode and encode initialized successfully(under D=
PG Mode).
[    6.290409] amdgpu 0000:07:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]] JPEG d=
ecode initialized successfully.
[    6.295084] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    6.295113] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    6.295247] amdgpu: Virtual CRAT table created for GPU
[    6.296073] amdgpu: Topology: Add dGPU node [0x1900:0x1002]
[    6.296084] kfd kfd: amdgpu: added device 1002:1900
[    6.296102] amdgpu 0000:07:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 6,=
 active_cu_number 12
[    6.296114] amdgpu 0000:07:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on hub 0
[    6.296122] amdgpu 0000:07:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1 on hub 0
[    6.296129] amdgpu 0000:07:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4 on hub 0
[    6.296136] amdgpu 0000:07:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 6 on hub 0
[    6.296143] amdgpu 0000:07:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 7 on hub 0
[    6.296150] amdgpu 0000:07:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 8 on hub 0
[    6.296157] amdgpu 0000:07:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 9 on hub 0
[    6.296164] amdgpu 0000:07:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 10 on hub 0
[    6.296171] amdgpu 0000:07:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 11 on hub 0
[    6.296178] amdgpu 0000:07:00.0: amdgpu: ring sdma0 uses VM inv eng 12 o=
n hub 0
[    6.296185] amdgpu 0000:07:00.0: amdgpu: ring vcn_unified_0 uses VM inv =
eng 0 on hub 8
[    6.296192] amdgpu 0000:07:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1=
 on hub 8
[    6.296199] amdgpu 0000:07:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv =
eng 13 on hub 0
[    6.297709] [drm] ring gfx_32768.1.1 was added
[    6.298368] [drm] ring compute_32768.2.2 was added
[    6.299030] [drm] ring sdma_32768.3.3 was added
[    6.299106] [drm] ring gfx_32768.1.1 ib test pass
[    6.299162] [drm] ring compute_32768.2.2 ib test pass
[    6.299233] [drm] ring sdma_32768.3.3 ib test pass
[    6.303753] [drm] Initialized amdgpu 3.57.0 20150101 for 0000:07:00.0 on=
 minor 0
[    6.305636] amdgpu 0000:07:00.0: [drm] Cannot find any crtc or sizes
[    6.305655] [drm] DSC precompute is not needed.
[    7.428443] aufs 6.8-20241118
[    7.447735] spl: loading out-of-tree module taints kernel.
[    7.447774] spl: module verification failed: signature and/or required k=
ey missing - tainting kernel
[    7.473708] zfs: module license 'CDDL' taints kernel.
[    7.473749] Disabling lock debugging due to kernel taint
[    7.473768] zfs: module license taints kernel.
[    8.445274] ZFS: Loaded module v2.2.6-8_g4d7c8a4831, ZFS pool version 50=
00, ZFS filesystem version 5
[    8.451525] zram: Added device: zram0
[    8.459967] usbcore: registered new interface driver usbhid
[    8.460001] usbhid: USB HID core driver
[    9.396507]  zd0: p1 p2
[    9.401182]  zd16: p1 p2
[    9.403714]  zd32: p1 p2
[    9.438841]  zd144: p1 p2
[    9.446862]  zd160: p1 p2
[    9.449952]  zd176: p1 p2
[    9.462561]  zd192: p1 p2 p3
[    9.479210]  zd208: p1
[    9.497995]  zd224: p1
[    9.502332]  zd240: p1
[    9.513842]  zd256: p1
[    9.519121]  zd272: p1
[    9.531274]  zd288: p1
[    9.544013]  zd304: p1 p2 p3
[    9.556444]  zd320: p1
[    9.561798]  zd336: p1
[    9.564952]  zd352: p1
[    9.576968]  zd368: p1
[    9.581743]  zd384: p1
[    9.586965]  zd400: p1
[    9.600764]  zd416: p1
[    9.615404]  zd432: p1 p2 p3
[    9.627818]  zd448: p1
[    9.640320]  zd464: p1
[    9.644034]  zd480: p1
[    9.657310] pcie_mp2_amd 0000:07:00.7: sfh1_1_init failed err -95
[    9.657834]  zd496: p1 p2 p3
[    9.660678]  zd512: p1 p2 p3
[    9.674613]  zd528: p1
[    9.677809]  zd544: p1
[    9.691380]  zd560: p1
[    9.695991]  zd576: p1
[    9.710232]  zd592: p1
[    9.724310]  zd608: p1
[    9.728514]  zd624: p1
[    9.741590]  zd640: p1
[    9.753245]  zd656: p1
[    9.756131]  zd672: p1
[    9.767304]  zd688: p1
[    9.773466]  zd704: p1
[    9.776668]  zd720: p1
[    9.790611]  zd736: p1 p2 p3
[    9.803857]  zd752: p1 p2 p3
[    9.807237]  zd768: p1 p2 p3
[    9.819582]  zd784: p1
[    9.830972]  zd800: p1
[    9.835318]  zd816: p1
[    9.851177]  zd832: p1 p2
[    9.862476]  zd848: p1 p2
[    9.874208]  zd864: p1 p2
[    9.888243]  zd880: p1 p2 p3
[    9.900926]  zd896: p1 p2
[    9.905365]  zd912: p1 p2
[    9.908283]  zd928: p1 p2
[    9.921880] GPT:Primary header thinks Alt. header is not at the end of t=
he disk.
[    9.921916] GPT:2092307 !=3D 2121223
[    9.921923] GPT:Alternate GPT header not at the end of the disk.
[    9.921930] GPT:2092307 !=3D 2121223
[    9.921936] GPT: Use GNU Parted to correct GPT errors.
[    9.921956]  zd944: p1 p2 p3
[    9.926837] GPT:Primary header thinks Alt. header is not at the end of t=
he disk.
[    9.926856] GPT:2092307 !=3D 2121223
[    9.926863] GPT:Alternate GPT header not at the end of the disk.
[    9.926871] GPT:2092307 !=3D 2121223
[    9.926876] GPT: Use GNU Parted to correct GPT errors.
[    9.926888]  zd960: p1 p2 p3
[    9.940779]  zd976: p1 p2
[    9.947284]  zd992: p1 p2
[    9.961786]  zd1008: p1 p2
[    9.964797]  zd1024: p1 p2
[    9.973156] GPT:Primary header thinks Alt. header is not at the end of t=
he disk.
[    9.973176] GPT:136314879 !=3D 150994943
[    9.973183] GPT:Alternate GPT header not at the end of the disk.
[    9.973190] GPT:136314879 !=3D 150994943
[    9.973196] GPT: Use GNU Parted to correct GPT errors.
[    9.973208]  zd1040: p1 p2 p3 p4
[    9.978939] GPT:Primary header thinks Alt. header is not at the end of t=
he disk.
[    9.978956] GPT:136314879 !=3D 150994943
[    9.978963] GPT:Alternate GPT header not at the end of the disk.
[    9.978970] GPT:136314879 !=3D 150994943
[    9.978976] GPT: Use GNU Parted to correct GPT errors.
[    9.978987]  zd1056: p1 p2 p3 p4
[    9.997241]  zd1104: p1 p2 p3
[   10.015204]  zd1120: p1 p2
[   10.039813]  zd1136: p1 p2
[   10.053519]  zd1152: p1 p2
[   10.057397]  zd1168: p1 p2
[   10.059243]  zd1184: p1 p2
[   10.073804]  zd1200: p1
[   10.091854]  zd1216: p1
[   10.096485]  zd1232: p1
[   10.109361]  zd1248: p1
[   10.120892]  zd1264: p1
[   10.124926]  zd1280: p1
[   10.138443]  zd1296: p1 p2 p3 p4
[   10.151472]  zd1312: p1 p2 p3 p4
[   10.154671]  zd1328: p1 p2 p3 p4
[   10.165337]  zd1344: p1
[   10.170596]  zd1360: p1
[   10.175486]  zd1376: p1
[   10.193476]  zd1392: p1
[   10.211117]  zd1408: p1
[   10.215308]  zd1424: p1
[   10.229505]  zd1440: p1
[   10.240423]  zd1456: p1
[   10.244656]  zd1472: p1
[   10.254972]  zd1488: p1
[   10.260188]  zd1504: p1
[   10.262725]  zd1520: p1
[   10.273501]  zd1536: p1 p2 p3 p4 p5
[   10.288048]  zd1552: p1 p2 p3 p4 p5
[   10.291370]  zd1568: p1 p2 p3 p4 p5
[   10.357418]  zd1712: p1 p2 p3
[   10.369822]  zd1728: p1 p2 p3
[   10.373371]  zd1744: p1 p2 p3
[   10.385383]  zd1760: p1
[   10.389904]  zd1776: p1
[   10.392520]  zd1792: p1
[   10.408595]  zd1808: p1
[   10.424685]  zd1824: p1
[   10.428784]  zd1840: p1
[   10.441381]  zd1856: p1
[   10.455092]  zd1872: p1
[   10.458960]  zd1888: p1
[   10.462251]  zd1904: p1
[   10.467292]  zd1920: p1
[   10.471515]  zd1936: p1
[   10.482930]  zd1952: p1 p2 p3
[   10.497493]  zd1968: p1 p2 p3
[   10.500866]  zd1984: p1 p2 p3
[   10.513614]  zd2000: p1
[   10.528958]  zd2016: p1
[   10.533789]  zd2032: p1
[   10.548673]  zd2048: p1
[   10.559739]  zd2064: p1
[   10.564121]  zd2080: p1
[   10.577550]  zd2096: p1
[   10.588429]  zd2112: p1
[   10.592466]  zd2128: p1
[   10.605433]  zd2144: p1
[   10.616125]  zd2160: p1
[   10.619785]  zd2176: p1
[   10.630272]  zd2192: p1 p2 p3
[   10.643644]  zd2208: p1 p2 p3
[   10.647987]  zd2224: p1 p2 p3
[   10.659162]  zd2240: p1
[   10.663553]  zd2256: p1
[   10.666556]  zd2272: p1
[   10.685401]  zd2288: p1
[   10.690621]  zd2304: p1
[   10.705112]  zd2320: p1
[   10.708159]  zd2336: p1
[   10.718401]  zd2352: p1
[   10.721129]  zd2368: p1
[   10.732581]  zd2384: p1 p2 p3
[   10.737364]  zd2400: p1 p2 p3
[   10.748981]  zd2416: p1
[   10.751487]  zd2432: p1
[   10.765338]  zd2448: p1
[   10.769094]  zd2464: p1
[   10.787553]  zd2480: p1
[   10.790660]  zd2496: p1
[   10.800120]  zd2512: p1
[   10.802556]  zd2528: p1
[   10.813603]  zd2544: p1 p2 p3
[   10.817336]  zd2560: p1 p2 p3
[   10.829861]  zd2576: p1
[   10.846220]  zd2592: p1
[   10.849689]  zd2608: p1
[   10.861449]  zd2624: p1
[   10.874833]  zd2640: p1
[   10.878814]  zd2656: p1
[   10.893092]  zd2672: p1 p2 p3
[   10.903658]  zd2688: p1 p2 p3
[   10.906908]  zd2704: p1 p2 p3
[   10.916403]  zd2720: p1
[   10.921545]  zd2736: p1
[   10.924611]  zd2752: p1
[   10.929644]  zd2768: p1
[   10.935525]  zd2784: p1
[   10.954379]  zd2800: p1 p2 p3
[   10.958026]  zd2816: p1 p2 p3
[   10.971677]  zd2832: p1
[   10.975041]  zd2848: p1
[   10.985655]  zd2864: p1
[   10.989718]  zd2880: p1
[   11.007745]  zd2896: p1
[   11.010784]  zd2912: p1
[   11.013296]  zd2928: p1
[   11.015352]  zd2944: p1
[   11.020160]  zd2960: p1 p2
[   11.025573]  zd2976: p1 p2
[   11.041262]  zd3040: p1 p2
[   11.049825]  zd3056: p1 p2
[   11.055432]  zd3072: p1 p2
[   11.061875]  zd3088: p1 p2
[   11.079360]  zd3152: p1
[   11.099048]  zd3184: p1 p2
[   11.101894]  zd3200: p1 p2
[   11.117340]  zd3264: p1
[   11.133901]  zd3296: p1
[   11.137994]  zd3312: p1
[   11.140895]  zd3328: p1
[   11.148472]  zd3344: p1 p2
[   11.153157]  zd3360: p1 p2
[   46.369382] loop0: detected capacity change from 0 to 9598976
[   47.145668] EXT4-fs: Warning: mounting with data=3Djournal disables dela=
yed allocation, dioread_nolock, O_DIRECT and fast_commit support!
[   47.145703] EXT4-fs (dm-7): mounting ext3 file system using the ext4 sub=
system
[   47.151293] EXT4-fs (dm-7): mounted filesystem 3b55de21-2328-4c37-8970-f=
425c189995e r/w with journalled data mode. Quota mode: none.
[   47.153643] EXT4-fs (dm-7): unmounting filesystem 3b55de21-2328-4c37-897=
0-f425c189995e.
[   92.580568] EXT4-fs (loop0): mounted filesystem 3d024585-a02c-4717-94fb-=
de350993d29e ro with ordered data mode. Quota mode: none.
[   92.599669] aufs test_add:291:mount[4141]: uid/gid/perm /root.ro 0/0/075=
5, 0/0/01777
[   92.846126] EXT4-fs (loop0): re-mounted 3d024585-a02c-4717-94fb-de350993=
d29e ro. Quota mode: none.
[   92.851742] EXT4-fs (loop0): re-mounted 3d024585-a02c-4717-94fb-de350993=
d29e ro. Quota mode: none.
[   92.877108] EXT4-fs (loop0): re-mounted 3d024585-a02c-4717-94fb-de350993=
d29e ro. Quota mode: none.
[   92.913093] EXT4-fs (loop0): re-mounted 3d024585-a02c-4717-94fb-de350993=
d29e ro. Quota mode: none.
[   93.293601] systemd[1]: Inserted module 'autofs4'
[   93.326879] systemd[1]: systemd 249.11-0ubuntu3.12 running in system mod=
e (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPE=
NSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSET=
UP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZST=
D -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
[   93.327043] systemd[1]: Detected architecture x86-64.
[   93.327755] systemd[1]: Hostname set to <amd-xen-dom0>.
[   93.345484] audit: type=3D1334 audit(1733146870.014:9): prog-id=3D3 op=
=3DLOAD
[   93.345504] audit: type=3D1300 audit(1733146870.014:9): arch=3Dc000003e =
syscall=3D321 success=3Dyes exit=3D8 a0=3D5 a1=3D7ffc322f1390 a2=3D78 a3=3D=
7ffc322f1390 items=3D0 ppid=3D0 pid=3D1 auid=3D4294967295 uid=3D0 gid=3D0 e=
uid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4=
294967295 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" subj=3Dunconfin=
ed key=3D(null)
[   93.345544] audit: type=3D1327 audit(1733146870.014:9): proctitle=3D2F73=
62696E2F696E6974007A796F7665726C6179
[   93.345561] audit: type=3D1334 audit(1733146870.014:10): prog-id=3D3 op=
=3DUNLOAD
[   93.345575] audit: type=3D1300 audit(1733146870.014:10): arch=3Dc000003e=
 syscall=3D3 success=3Dyes exit=3D0 a0=3D8 a1=3D7ffc322f1450 a2=3D78 a3=3D2=
00000008 items=3D0 ppid=3D0 pid=3D1 auid=3D4294967295 uid=3D0 gid=3D0 euid=
=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294=
967295 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" subj=3Dunconfined =
key=3D(null)
[   93.345612] audit: type=3D1327 audit(1733146870.014:10): proctitle=3D2F7=
362696E2F696E6974007A796F7665726C6179
[   93.345629] audit: type=3D1334 audit(1733146870.014:11): prog-id=3D4 op=
=3DLOAD
[   93.345642] audit: type=3D1300 audit(1733146870.014:11): arch=3Dc000003e=
 syscall=3D321 success=3Dyes exit=3D8 a0=3D5 a1=3D7ffc322f1460 a2=3D78 a3=
=3D7ffc322f1460 items=3D0 ppid=3D0 pid=3D1 auid=3D4294967295 uid=3D0 gid=3D=
0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=
=3D4294967295 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" subj=3Dunco=
nfined key=3D(null)
[   93.345684] audit: type=3D1327 audit(1733146870.014:11): proctitle=3D2F7=
362696E2F696E6974007A796F7665726C6179
[   93.345701] audit: type=3D1334 audit(1733146870.014:12): prog-id=3D4 op=
=3DUNLOAD
[   93.688188] systemd[1]: Configuration file /run/systemd/system/netplan-o=
vs-cleanup.service is marked world-inaccessible. This has no effect as conf=
iguration data is accessible via APIs without restrictions. Proceeding anyw=
ay.
[   93.753703] systemd[1]: Queued start job for default target Graphical In=
terface.
[   93.766962] systemd[1]: Created slice Slice /system/modprobe.
[   93.767496] systemd[1]: Created slice Slice /system/serial-getty.
[   93.767899] systemd[1]: Created slice Slice /system/ourcorp-proxhub.
[   93.768215] systemd[1]: Created slice User and Session Slice.
[   93.768330] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[   93.768435] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[   93.768637] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[   93.768697] systemd[1]: Reached target Local Encrypted Volumes.
[   93.768754] systemd[1]: Reached target Remote File Systems.
[   93.768789] systemd[1]: Reached target Slice Units.
[   93.768830] systemd[1]: Reached target TLS tunnels for network services =
- per-config-file target.
[   93.768874] systemd[1]: Reached target Swaps.
[   93.768912] systemd[1]: Reached target Local Verity Protected Volumes.
[   93.769021] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   93.769225] systemd[1]: Listening on LVM2 poll daemon socket.
[   93.769374] systemd[1]: Listening on Syslog Socket.
[   93.769514] systemd[1]: Listening on fsck to fsckd communication Socket.
[   93.769613] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   93.769763] systemd[1]: Listening on Journal Socket (/dev/log).
[   93.769965] systemd[1]: Listening on Network Service Netlink Socket.
[   93.770179] systemd[1]: Listening on udev Control Socket.
[   93.770323] systemd[1]: Listening on udev Kernel Socket.
[   93.771126] systemd[1]: Created slice Slice /system/ourcorp-diskmanager-=
disk-added.
[   93.771316] systemd[1]: Listening on Journal Socket.
[   93.771556] systemd[1]: Condition check resulted in Huge Pages File Syst=
em being skipped.
[   93.773339] systemd[1]: Mounting POSIX Message Queue File System...
[   93.774840] systemd[1]: Mounting Mount /proc/xen files...
[   93.776415] systemd[1]: Mounting Kernel Debug File System...
[   93.777978] systemd[1]: Mounting Kernel Trace File System...
[   93.780685] systemd[1]: Starting Journal Service...
[   93.780961] systemd[1]: Finished Availability of block devices.
[   93.783096] systemd[1]: Starting Set the console keyboard layout...
[   93.785089] systemd[1]: Starting Create List of Static Device Nodes...
[   93.787089] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[   93.789213] systemd[1]: Starting Load Kernel Module configfs...
[   93.791228] systemd[1]: Starting Load Kernel Module drm...
[   93.793464] systemd[1]: Starting Load Kernel Module efi_pstore...
[   93.795709] systemd[1]: Starting Load Kernel Module fuse...
[   93.796986] systemd[1]: Condition check resulted in OpenVSwitch configur=
ation for cleanup being skipped.
[   93.797299] systemd[1]: Condition check resulted in File System Check on=
 Root Device being skipped.
[   93.800080] systemd[1]: Starting Load Kernel Modules...
[   93.802553] systemd[1]: Starting Remount Root and Kernel File Systems...
[   93.805217] systemd[1]: Starting Coldplug All udev Devices...
[   93.810431] systemd[1]: Mounted POSIX Message Queue File System.
[   93.810600] systemd[1]: Mounted Mount /proc/xen files.
[   93.810745] systemd[1]: Mounted Kernel Debug File System.
[   93.810998] systemd[1]: Mounted Kernel Trace File System.
[   93.811662] systemd[1]: Finished Create List of Static Device Nodes.
[   93.812099] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[   93.812510] systemd[1]: Finished Load Kernel Module configfs.
[   93.812925] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   93.813332] systemd[1]: Finished Load Kernel Module drm.
[   93.813737] systemd[1]: modprobe@efi_pstore.service: Deactivated success=
fully.
[   93.814138] systemd[1]: Finished Load Kernel Module efi_pstore.
[   93.814608] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[   93.815026] systemd[1]: Finished Load Kernel Module fuse.
[   93.818346] systemd[1]: Finished Remount Root and Kernel File Systems.
[   93.819394] xen:xen_evtchn: Event-channel device installed
[   93.820956] systemd[1]: Mounting FUSE Control File System...
[   93.823378] systemd[1]: Mounting Kernel Configuration File System...
[   93.823650] systemd[1]: Condition check resulted in Platform Persistent =
Storage Archival being skipped.
[   93.825893] systemd[1]: Starting Load/Save Random Seed...
[   93.828303] systemd[1]: Starting Create System Users...
[   93.835870] systemd[1]: Mounted FUSE Control File System.
[   93.836037] systemd[1]: Mounted Kernel Configuration File System.
[   93.841314] systemd[1]: Finished Load/Save Random Seed.
[   93.841589] systemd[1]: Condition check resulted in First Boot Complete =
being skipped.
[   93.873169] systemd[1]: Finished Create System Users.
[   93.875559] systemd[1]: Starting Create Static Device Nodes in /dev...
[   93.884225] systemd[1]: Finished Set the console keyboard layout.
[   93.884763] systemd[1]: Started Journal Service.
[   93.890345] xen_pciback: backend is passthrough
[   93.895359] systemd-journald[4245]: Received client request to flush run=
time journal.
(d1) Bootstrapping...
(d1) Xen Minimal OS (pv)!
(d1)   start_info: 0x10a000(VA)
(d1)     nr_pages: 0x4000
(d1)   shared_inf: 0x8e49c000(MA)
(d1)      pt_base: 0x10d000(VA)
(d1) nr_pt_frames: 0x5
(d1)     mfn_list: 0xea000(VA)
(d1)    mod_start: 0x0(VA)
(d1)      mod_len: 0
(d1)        flags: 0x10
(d1)     cmd_line: --event 91 --watch-nb 512 --entry-nb 8000 --entry-size 4=
000
(d1)        stack: 0xc8c40-0xe8c40
(d1) MM: Init
(d1)       _text: 0x0(VA)
(d1)      _etext: 0x7120f(VA)
(d1)    _erodata: 0x87000(VA)
(d1)      _edata: 0x89064(VA)
(d1) stack start: 0xc8c40(VA)
(d1)        _end: 0xe9884(VA)
(d1)   start_pfn: 112
(d1)     max_pfn: 4000
(d1) Mapping memory range 0x112000 - 0x4000000
(d1) setting 0x0-0x87000 readonly
(d1) skipped 1000
(d1) Maximum memory size: 32776 pages
(d1) MM: Initialise page allocator for 130000(130000)-4000000(4000000)
(d1)     Adding memory range 131000-4000000
(d1) MM: done
(d1) remapped p2m list to 0x8000002000
(d1) Demand map pfns at 100000000000-108000000000.
(d1) Heap resides at 200000000000-208000000000.
(XEN) common/grant_table.c:1909:d1v0 Expanding d1 grant table from 1 to 4 f=
rames
[   94.430994] ccp 0000:07:00.2: tee: ring init command failed (0x00000006)
[   94.431027] ccp 0000:07:00.2: tee: failed to init ring buffer
[   94.485150] amd-tee driver: tee not present
[   94.864322] snd_hda_intel 0000:07:00.6: no codecs found!
(XEN) AMD-Vi: Disable: device id =3D 0x300, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:03:00.0 from d0 to d[IO]
(XEN) AMD-Vi: Disable: device id =3D 0x200, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:02:00.0 from d0 to d[IO]
(XEN) AMD-Vi: Disable: device id =3D 0x400, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:04:00.0 from d0 to d[IO]
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x300, type =3D 0x1, root=
 table =3D 0xd51d23000, domain =3D 2, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:03:00.0 from d[IO] to d2
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x200, type =3D 0x1, root=
 table =3D 0xd51d23000, domain =3D 2, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:02:00.0 from d[IO] to d2
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x400, type =3D 0x1, root=
 table =3D 0xd51d23000, domain =3D 2, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:04:00.0 from d[IO] to d2
(d2) mapping kernel into physical memory
(d2) about to get started...
(XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 1 to 2 f=
rames
(XEN) arch/x86/pv/emul-priv-op.c:1015:d2v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d2v0 RDMSR 0xc001029a unimplemented
(XEN) d2: Forcing read-only access to MFN fc600
(XEN) d0: Forcing read-only access to MFN fc600
(XEN) d2: Forcing read-only access to MFN fc900
(XEN) d0: Forcing read-only access to MFN fc900
(XEN) d2: Forcing read-only access to MFN fc300
(XEN) d0: Forcing read-only access to MFN fc300
(XEN) common/grant_table.c:1909:d0v3 Expanding d0 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d0v3 Expanding d0 grant table from 2 to 3 f=
rames
(d4) mapping kernel into physical memory
(d4) about to get started...
(d3) mapping kernel into physical memory
(d3) about to get started...
(d7) mapping kernel into physical memory
(d7) about to get started...
(d11) mapping kernel into physical memory
(d11) about to get started...
(XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d4v0 Expanding d4 grant table from 1 to 2 f=
rames
(d6) mapping kernel into physical memory
(d6) about to get started...
(XEN) common/grant_table.c:1909:d7v0 Expanding d7 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d7v0 Expanding d7 grant table from 2 to 3 f=
rames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 1 to 2=
 frames
(d9) mapping kernel into physical memory
(d9) about to get started...
(d8) mapping kernel into physical memory
(d8) about to get started...
(d10) mapping kernel into physical memory
(d10) about to get started...
(XEN) common/grant_table.c:1909:d6v0 Expanding d6 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d9v0 Expanding d9 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d9v0 Expanding d9 grant table from 2 to 3 f=
rames
(XEN) common/grant_table.c:1909:d10v1 Expanding d10 grant table from 1 to 2=
 frames
(XEN) common/grant_table.c:1909:d10v1 Expanding d10 grant table from 2 to 3=
 frames
(XEN) common/grant_table.c:1909:d8v0 Expanding d8 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d9v1 Expanding d9 grant table from 3 to 4 f=
rames
(XEN) arch/x86/pv/emul-priv-op.c:1015:d7v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d7v0 RDMSR 0xc001029a unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d4v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d4v0 RDMSR 0xc001029a unimplemented
(XEN) common/grant_table.c:1909:d10v1 Expanding d10 grant table from 3 to 4=
 frames
(XEN) arch/x86/pv/emul-priv-op.c:1015:d3v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d3v0 RDMSR 0xc001029a unimplemented
(d5) mapping kernel into physical memory
(d5) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1015:d5v0 RDMSR 0xc0010112 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d10v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d10v0 RDMSR 0xc001029a unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d9v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d9v0 RDMSR 0xc001029a unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d11v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d11v0 RDMSR 0xc001029a unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d6v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d6v0 RDMSR 0xc001029a unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d8v0 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d8v0 RDMSR 0xc001029a unimplemented
(XEN) common/grant_table.c:1909:d7v0 Expanding d7 grant table from 3 to 4 f=
rames
(XEN) arch/x86/pv/emul-priv-op.c:1015:d5v1 RDMSR 0xc001029b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1015:d5v1 RDMSR 0xc0010299 unimplemented
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 1 to 2 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 2 to 3 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 3 to 4 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 4 to 5 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 5 to 6 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 6 to 7 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 7 to 8 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 8 to 9 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 9 to 10 =
frames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 10 to 11=
 frames
(XEN) common/grant_table.c:1909:d5v0 Expanding d5 grant table from 11 to 12=
 frames
(XEN) common/grant_table.c:1909:d9v1 Expanding d9 grant table from 4 to 5 f=
rames
(XEN) common/grant_table.c:1909:d6v0 Expanding d6 grant table from 2 to 3 f=
rames
(XEN) common/grant_table.c:1909:d6v0 Expanding d6 grant table from 3 to 4 f=
rames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 2 to 3=
 frames
(XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 2 to 3 f=
rames
(XEN) common/grant_table.c:1909:d10v0 Expanding d10 grant table from 4 to 5=
 frames
(XEN) common/grant_table.c:1909:d8v0 Expanding d8 grant table from 2 to 3 f=
rames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 12 to 13=
 frames
(XEN) common/grant_table.c:1909:d9v0 Expanding d9 grant table from 5 to 6 f=
rames

##### -> network driver domain (d2) has been started along with a few other=
 vms

root@amd-xen-dom0:~# xl info
host                   : amd-xen-dom0
release                : 6.8.0-48-generic
version                : #48~22.04.1 SMP PREEMPT_DYNAMIC Tue Nov 26 23:18:3=
4 UTC=20
machine                : x86_64
nr_cpus                : 16
max_cpu_id             : 15
nr_nodes               : 1
cores_per_socket       : 8
threads_per_core       : 2
cpu_mhz                : 3293.813
hw_caps                : 178bf3ff:76f8320b:2e500800:244037ff:0000000f:f1bf9=
7a9:00405fce:00000780
virt_caps              : pv hvm hvm_directio pv_directio hap shadow gnttab-=
v1 gnttab-v2
total_memory           : 63273
free_memory            : 39149
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 18
xen_extra              : .3
xen_version            : 4.18.3
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-=
3.0-x86_64=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x0
xen_changeset          : Fri Nov 15 14:07:55 2024 +0000 git:8d7c71efb0
xen_commandline        : placeholder console=3Dvga,com2 dom0_max_vcpus=3D4-=
8 dom0_mem=3Dmin:6144,max:65536m iommu=3Don,required,intpost,verbose,debug =
x2apic=3Doff sched=3Dcredit2 flask=3Denforcing gnttab_max_frames=3D128 xpti=
=3Doff smt=3Don cpufreq=3Dxen:performance spec-ctrl=3Dgds-mit=3D0 com2=3Dir=
q=3D3,io-base=3D0xfedc9000,reg-shift=3D2
cc_compiler            : gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
cc_compile_by          :=20
cc_compile_domain      :=20
cc_compile_date        : Fri Nov 15 14:08:14 UTC 2024
build_id               : c241bf4ecc9a93bbcc74e7f758c4f55a6759216f
xend_config_format     : 4

##### -> domU is started with memory =3D 3900

(XEN) HVM d12v0 save: CPU
(XEN) HVM d12v1 save: CPU
(XEN) HVM d12 save: PIC
(XEN) HVM d12 save: IOAPIC
(XEN) HVM d12v0 save: LAPIC
(XEN) HVM d12v1 save: LAPIC
(XEN) HVM d12v0 save: LAPIC_REGS
(XEN) HVM d12v1 save: LAPIC_REGS
(XEN) HVM d12 save: PCI_IRQ
(XEN) HVM d12 save: ISA_IRQ
(XEN) HVM d12 save: PCI_LINK
(XEN) HVM d12 save: PIT
(XEN) HVM d12 save: RTC
(XEN) HVM d12 save: HPET
(XEN) HVM d12 save: PMTIMER
(XEN) HVM d12v0 save: MTRR
(XEN) HVM d12v1 save: MTRR
(XEN) HVM d12 save: VIRIDIAN_DOMAIN
(XEN) HVM d12v0 save: CPU_XSAVE
(XEN) HVM d12v1 save: CPU_XSAVE
(XEN) HVM d12v0 save: VIRIDIAN_VCPU
(XEN) HVM d12v1 save: VIRIDIAN_VCPU
(XEN) HVM d12v0 save: VMCE_VCPU
(XEN) HVM d12v1 save: VMCE_VCPU
(XEN) HVM d12v0 save: TSC_ADJUST
(XEN) HVM d12v1 save: TSC_ADJUST
(XEN) HVM d12v0 save: CPU_MSR
(XEN) HVM d12v1 save: CPU_MSR
(XEN) HVM12 restore: CPU 0
(d12) HVM Loader
(d12) Detected Xen v4.18.3
(d12) Xenbus rings @0xfeffc000, event channel 1
(d12) System requested SeaBIOS
(d12) CPU speed is 3294 MHz
(d12) Relocating guest memory for lowmem MMIO space disabled
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 0 changed 0 -> 5
(d12) PCI-ISA link 0 routed to IRQ5
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 1 changed 0 -> 10
(d12) PCI-ISA link 1 routed to IRQ10
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 2 changed 0 -> 11
(d12) PCI-ISA link 2 routed to IRQ11
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 3 changed 0 -> 5
(d12) PCI-ISA link 3 routed to IRQ5
(d12) pci dev 01:2 INTD->IRQ5
(d12) pci dev 01:3 INTA->IRQ10
(d12) pci dev 02:0 INTA->IRQ11
(d12) pci dev 03:0 INTA->IRQ5
(d12) pci dev 05:0 INTA->IRQ10
(d12) RAM in high memory; setting high_mem resource base to 102c00000
(d12) pci dev 02:0 bar 14 size 001000000: 0f0000008
(d12) pci dev 04:0 bar 10 size 001000000: 0f1000008
(d12) pci dev 05:0 bar 30 size 000040000: 0f2000000
(d12) pci dev 04:0 bar 30 size 000010000: 0f2040000
(d12) pci dev 03:0 bar 10 size 000004000: 0f2050000
(d12) pci dev 04:0 bar 18 size 000001000: 0f2054000
(d12) pci dev 02:0 bar 10 size 000000100: 00000c001
(d12) pci dev 05:0 bar 10 size 000000100: 00000c101
(d12) pci dev 05:0 bar 14 size 000000100: 0f2055000
(d12) pci dev 01:2 bar 20 size 000000020: 00000c201
(d12) pci dev 01:1 bar 20 size 000000010: 00000c221
(d12) Multiprocessor initialisation:
(d12)  - CPU0 ... 48-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d12)  - CPU1 ... 48-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d12) Writing SMBIOS tables ...
(d12) Loading SeaBIOS ...
(d12) Creating MP tables ...
(d12) Loading ACPI ...
(d12) vm86 TSS at fc100280
(d12) BIOS map:
(d12)  10000-100e3: Scratch space
(d12)  c0000-fffff: Main BIOS
(d12) E820 table:
(d12)  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d12)  HOLE: 00000000:000a0000 - 00000000:000c0000
(d12)  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d12)  [02]: 00000000:00100000 - 00000000:f0000000: RAM
(d12)  HOLE: 00000000:f0000000 - 00000000:fc000000
(d12)  [03]: 00000000:fc000000 - 00000000:fc00b000: NVS
(d12)  [04]: 00000000:fc00b000 - 00000001:00000000: RESERVED
(d12)  [05]: 00000001:00000000 - 00000001:02c00000: RAM
(d12) Invoking SeaBIOS ...
(d12) SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen)
(d12) BUILD: gcc: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0 binutils: (GNU Binu=
tils for Ubuntu) 2.38
(d12)=20
(d12) Found Xen hypervisor signature at 40000100
(d12) Running on QEMU (i440fx)
(d12) xen: copy e820...
(d12) Relocating init from 0x000d4760 to 0xeefeb2c0 (size 85152)
(d12) Found 9 PCI devices (max PCI bus is 00)
(d12) Allocated Xen hypercall page at effff000
(d12) Detected Xen v4.18.3
(d12) xen: copy BIOS tables...
(d12) Copying SMBIOS from 0x00010020 to 0x000f5aa0
(d12) Copying MPTABLE from 0xfc100180/fc100190 to 0x000f59a0
(d12) Copying PIR from 0x00010040 to 0x000f5920
(d12) Copying ACPI RSDP from 0x000100c0 to 0x000f58f0
(d12) table(50434146)=3D0xfc00a370 (via xsdt)
(d12) Using pmtimer, ioport 0xb008
(d12) table(50434146)=3D0xfc00a370 (via xsdt)
(d12) ACPI: parse DSDT at 0xfc001040 (len 37539)
(d12) parse_termlist: parse error, skip from 16/27641
(d12) parse_termlist: parse error, skip from 87/6041
(d12) Scan for VGA option rom
(d12) Running option rom at c000:0003
(XEN) arch/x86/hvm/stdvga.c:172:d12v0 entering stdvga mode
(d12) pmm call arg1=3D0
(d12) Turning on vga text mode console
(d12) SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen)
(d12) Machine UUID 61d12f94-5b6f-442f-895e-a6fac7de64c3
(d12) UHCI init on dev 00:01.2 (io=3Dc200)
(d12) ATA controller 1 at 1f0/3f4/c220 (irq 14 dev 9)
(d12) ATA controller 2 at 170/374/c228 (irq 15 dev 9)
(d12) Searching bootorder for: HALT
(d12) Found 0 lpt ports
(d12) Found 0 serial ports
(d12) ata0-0: QEMU HARDDISK ATA-7 Hard-Disk (52000 MiBytes)
(d12) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d12) Searching bios-geometry for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d12) ata0-1: QEMU HARDDISK ATA-7 Hard-Disk (20480 MiBytes)
(d12) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@1
(d12) Searching bios-geometry for: /pci@i0cf8/*@1,1/drive@0/disk@1
(d12) PS2 keyboard initialized
(d12) All threads complete.
(d12) Scan for option roms
(d12) Running option rom at ca00:0003
(d12) pmm call arg1=3D1
(d12) pmm call arg1=3D0
(d12) pmm call arg1=3D1
(d12) pmm call arg1=3D0
(d12) Searching bootorder for: /pci@i0cf8/*@5
(d12)=20
(d12) Press ESC for boot menu.
(d12)=20
(d12) Searching bootorder for: HALT
(d12) drive 0x000f5870: PCHS=3D16383/16/63 translation=3Dlba LCHS=3D1024/25=
5/63 s=3D106496000
(d12) drive 0x000f5830: PCHS=3D16383/16/63 translation=3Dlba LCHS=3D1024/25=
5/63 s=3D41943040
(d12) Space available for UMB: cb000-e8800, f52c0-f5830
(d12) Returned 16773120 bytes of ZoneHigh
(d12) e820 map has 8 items:
(d12)   0: 0000000000000000 - 000000000009fc00 =3D 1 RAM
(d12)   1: 000000000009fc00 - 00000000000a0000 =3D 2 RESERVED
(d12)   2: 00000000000f0000 - 0000000000100000 =3D 2 RESERVED
(d12)   3: 0000000000100000 - 00000000effff000 =3D 1 RAM
(d12)   4: 00000000effff000 - 00000000f0000000 =3D 2 RESERVED
(d12)   5: 00000000fc000000 - 00000000fc00b000 =3D 4 NVS
(d12)   6: 00000000fc00b000 - 0000000100000000 =3D 2 RESERVED
(d12)   7: 0000000100000000 - 0000000102c00000 =3D 1 RAM
(d12) enter handle_19:
(d12)   NULL
(d12) Booting from Hard Disk...
(d12) Booting from 0000:7c00
(XEN) d12: VIRIDIAN GUEST_OS_ID: vendor: 1 os: 4 major: 6 minor: 3 sp: 0 bu=
ild: 2580
(XEN) d12: VIRIDIAN HYPERCALL: enabled: 1 pfn: 4
(XEN) d12v0: VIRIDIAN VP_ASSIST: pfn: 7
(XEN) d12: VIRIDIAN HVCALL_NOTIFY_LONG_SPIN_WAIT
(XEN) d12: VIRIDIAN MSR_TIME_REF_COUNT: accessed
(XEN) d12v1: VIRIDIAN VP_ASSIST: pfn: 3ffff
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 0 changed 5 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 1 changed 10 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 2 changed 11 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom12 PCI link 3 changed 5 -> 0
(XEN) d12v0: upcall vector b1
(XEN) d12v1: upcall vector b1
(XEN) Dom12 callback via changed to GSI 24
(XEN) common/grant_table.c:1909:d12v1 Expanding d12 grant table from 1 to 2=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 2 to 3=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 3 to 4=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 4 to 5=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 5 to 6=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 6 to 7=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 7 to 8=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 8 to 9=
 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 9 to 1=
0 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 10 to =
11 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 11 to =
12 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 12 to =
13 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 13 to =
14 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 14 to =
15 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 15 to =
16 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 16 to =
17 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 17 to =
18 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 18 to =
19 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 19 to =
20 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 20 to =
21 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 21 to =
22 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 22 to =
23 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 23 to =
24 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 24 to =
25 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 25 to =
26 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 26 to =
27 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 27 to =
28 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 28 to =
29 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 29 to =
30 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 30 to =
31 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 31 to =
32 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 32 to =
33 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 33 to =
34 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 34 to =
35 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 35 to =
36 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 36 to =
37 frames
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 37 to =
38 frames

##### -> memory for domU is changed to 39000 and the domain is restarted:

(XEN) common/memory.c:278:d0v3 Could not allocate order=3D18 extent: id=3D1=
3 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D18 extent: id=3D1=
3 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D18 extent: id=3D1=
3 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D18 extent: id=3D1=
3 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D18 extent: id=3D1=
3 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D9 extent: id=3D13=
 memflags=3D0xc0 (2 of 4)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D9 extent: id=3D13=
 memflags=3D0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D9 extent: id=3D13=
 memflags=3D0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v3 Could not allocate order=3D9 extent: id=3D13=
 memflags=3D0xc0 (0 of 4)
(XEN) HVM d13v0 save: CPU
(XEN) HVM d13v1 save: CPU
(XEN) HVM d13 save: PIC
(XEN) HVM d13 save: IOAPIC
(XEN) HVM d13v0 save: LAPIC
(XEN) HVM d13v1 save: LAPIC
(XEN) HVM d13v0 save: LAPIC_REGS
(XEN) HVM d13v1 save: LAPIC_REGS
(XEN) HVM d13 save: PCI_IRQ
(XEN) HVM d13 save: ISA_IRQ
(XEN) HVM d13 save: PCI_LINK
(XEN) HVM d13 save: PIT
(XEN) HVM d13 save: RTC
(XEN) HVM d13 save: HPET
(XEN) HVM d13 save: PMTIMER
(XEN) HVM d13v0 save: MTRR
(XEN) HVM d13v1 save: MTRR
(XEN) HVM d13 save: VIRIDIAN_DOMAIN
(XEN) HVM d13v0 save: CPU_XSAVE
(XEN) HVM d13v1 save: CPU_XSAVE
(XEN) HVM d13v0 save: VIRIDIAN_VCPU
(XEN) HVM d13v1 save: VIRIDIAN_VCPU
(XEN) HVM d13v0 save: VMCE_VCPU
(XEN) HVM d13v1 save: VMCE_VCPU
(XEN) HVM d13v0 save: TSC_ADJUST
(XEN) HVM d13v1 save: TSC_ADJUST
(XEN) HVM d13v0 save: CPU_MSR
(XEN) HVM d13v1 save: CPU_MSR
(XEN) HVM13 restore: CPU 0
(XEN) common/memory.c:278:d0v0 Could not allocate order=3D0 extent: id=3D13=
 memflags=3D0xc0 (2799 of 4096)
(XEN) AMD-Vi: Error: cannot allocate I/O page table
(XEN) AMD-Vi: Error: invalid IO pagetable entry dfn =3D b1ad3c
(XEN) domain_crash called from drivers/passthrough/amd/iommu_map.c:457
(XEN) Domain 2 (vcpu#0) crashed on cpu#6:
(XEN) ----[ Xen-4.18.3  x86_64  debug=3Dy  Not tainted ]----
(XEN) CPU:    6
(XEN) RIP:    e033:[<ffffffff8220128c>]
(XEN) RFLAGS: 0000000000000282   EM: 0   CONTEXT: pv guest (d2v0)
(XEN) rax: 0000000000000014   rbx: ffffc900421ca000   rcx: ffffffff8220128c
(XEN) rdx: 0000000000000001   rsi: ffffc900421d4018   rdi: 0000000000000000
(XEN) rbp: ffffc90040003e18   rsp: ffffc90040003dc8   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000282
(XEN) r12: 0000000000000001   r13: ffffc900421d4018   r14: ffffc900421ca000
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000b506e0
(XEN) cr3: 0000000b3472f000   cr2: 0000758a2803e4b0
(XEN) fsb: 0000000000000000   gsb: ffff88811a200000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=3Dffffc90040003dc8:
(XEN)    0000000000000000 0000000000000001 ffffffff81a942a0 0000000000000000
(XEN)    ffffc900421d7818 ffffc900421ca000 0000000000000000 0000000000000001
(XEN)    ffffc900421ca000 0000000000000000 ffffc90040003e58 ffffffffc050ff35
(XEN)    0000000100000001 24d9cc65bcebac00 ffffc900421ca030 0000000000000000
(XEN)    0000000000000040 ffffc900421ca000 ffffc90040003e88 ffffffffc05134ae
(XEN)    ffffc900421ca030 0000000000000000 ffffc90040003eef 0000000000000040
(XEN)    ffffc90040003ec0 ffffffff81edede3 ffff88811a235e40 000000000000012c
(XEN)    ffffc90040003ef8 ffffc900421ca030 0000000000000000 ffffc90040003f48
(XEN)    ffffffff81edf3c1 ffffffff811b5c7f ffff88811a236100 000000010001cc97
(XEN)    0000000000000007 ffff88811a231b60 ffffc90040003ef8 ffffc90040003ef8
(XEN)    ffffc90040003f08 ffffc90040003f08 24d9cc65bcebac00 0000000080000101
(XEN)    0000000000000003 0000000000000008 0000000000000004 ffffffff834060d8
(XEN)    ffffc90040003fb8 ffffffff8110a19b ffff88811a234200 0420000200000000
(XEN)    ffffffff8340fcc0 000000010001cc97 000000000000000a ffffffff00000003
(XEN)    ffffffff81a9f6fe ffffffff83403cc8 0000000000000001 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffffc90040003fd8 ffffffff8110a4e9
(XEN)    ffffffff83403cc8 0000000000000001 ffffc90040003fe8 ffffffff8110a84e
(XEN)    ffffffff83403cb8 ffffffff821ffd0a ffffffff83403ca0
(XEN)     Fault while accessing guest memory.
(XEN) domain_crash called from drivers/passthrough/iommu.c:366
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D18 extent: id=3D1=
4 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D18 extent: id=3D1=
4 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D18 extent: id=3D1=
4 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D18 extent: id=3D1=
4 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D18 extent: id=3D1=
4 memflags=3D0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D9 extent: id=3D14=
 memflags=3D0xc0 (2 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D9 extent: id=3D14=
 memflags=3D0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D9 extent: id=3D14=
 memflags=3D0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=3D9 extent: id=3D14=
 memflags=3D0xc0 (0 of 4)
(XEN) HVM d14v0 save: CPU
(XEN) HVM d14v1 save: CPU
(XEN) HVM d14 save: PIC
(XEN) HVM d14 save: IOAPIC
(XEN) HVM d14v0 save: LAPIC
(XEN) HVM d14v1 save: LAPIC
(XEN) HVM d14v0 save: LAPIC_REGS
(XEN) HVM d14v1 save: LAPIC_REGS
(XEN) HVM d14 save: PCI_IRQ
(XEN) HVM d14 save: ISA_IRQ
(XEN) HVM d14 save: PCI_LINK
(XEN) HVM d14 save: PIT
(XEN) HVM d14 save: RTC
(XEN) HVM d14 save: HPET
(XEN) HVM d14 save: PMTIMER
(XEN) HVM d14v0 save: MTRR
(XEN) HVM d14v1 save: MTRR
(XEN) HVM d14 save: VIRIDIAN_DOMAIN
(XEN) HVM d14v0 save: CPU_XSAVE
(XEN) HVM d14v1 save: CPU_XSAVE
(XEN) HVM d14v0 save: VIRIDIAN_VCPU
(XEN) HVM d14v1 save: VIRIDIAN_VCPU
(XEN) HVM d14v0 save: VMCE_VCPU
(XEN) HVM d14v1 save: VMCE_VCPU
(XEN) HVM d14v0 save: TSC_ADJUST
(XEN) HVM d14v1 save: TSC_ADJUST
(XEN) HVM d14v0 save: CPU_MSR
(XEN) HVM d14v1 save: CPU_MSR
(XEN) HVM14 restore: CPU 0
(XEN) common/memory.c:278:d0v1 Could not allocate order=3D0 extent: id=3D14=
 memflags=3D0xc0 (2798 of 4096)
(XEN) AMD-Vi: Disable: device id =3D 0x300, domain =3D 2, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:03:00.0 from d2 to d[IO]
(XEN) AMD-Vi: Disable: device id =3D 0x200, domain =3D 2, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:02:00.0 from d2 to d[IO]
(XEN) AMD-Vi: Disable: device id =3D 0x400, domain =3D 2, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:04:00.0 from d2 to d[IO]
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x135 ref 0x1ca flags 0x=
12 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x134 ref 0x1c9 flags 0x=
12 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x133 ref 0x1c0 flags 0x=
12 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x132 ref 0x1bf flags 0x=
12 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x131 ref 0x1bc flags 0x=
12 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x130 ref 0x1bb flags 0x=
12 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x12f ref 0x20d flags 0x=
12 d8
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x12e ref 0x20c flags 0x=
12 d8
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x12d ref 0x417 flags 0x=
12 d10
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x12c ref 0x416 flags 0x=
12 d10
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x12b ref 0x413 flags 0x=
12 d9
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x12a ref 0x412 flags 0x=
12 d9
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x129 ref 0x413 flags 0x=
12 d7
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x128 ref 0x412 flags 0x=
12 d7
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x127 ref 0x210 flags 0x=
12 d4
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x126 ref 0x20f flags 0x=
12 d4
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x5c ref 0x1ce flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x5b ref 0x1cd flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x5a ref 0x1cc flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x59 ref 0x1cb flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x58 ref 0x1c8 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x57 ref 0x1c7 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x56 ref 0x1c6 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x55 ref 0x1c5 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x54 ref 0x1c4 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x53 ref 0x1c3 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x52 ref 0x1c2 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x51 ref 0x1c1 flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x50 ref 0x1be flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x4f ref 0x1bd flags 0x1=
2 d5
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x3b ref 0x415 flags 0x1=
2 d10
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x3a ref 0x414 flags 0x1=
2 d10
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x39 ref 0x411 flags 0x1=
2 d9
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x38 ref 0x410 flags 0x1=
2 d9
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x37 ref 0x20e flags 0x1=
2 d6
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x36 ref 0x20d flags 0x1=
2 d6
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x35 ref 0x20e flags 0x1=
2 d11
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x34 ref 0x20d flags 0x1=
2 d11
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x33 ref 0x411 flags 0x1=
2 d7
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x32 ref 0x410 flags 0x1=
2 d7
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x31 ref 0x20e flags 0x1=
2 d3
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x30 ref 0x20d flags 0x1=
2 d3
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x3 ref 0x40b flags 0x12=
 d0
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x2 ref 0x40a flags 0x12=
 d0
(XEN) common/grant_table.c:3861:d0v3 Grant release 0x1 ref 0x409 flags 0x12=
 d0
(XEN) common/grant_table.c:3861:d0v3 Grant release 0 ref 0x408 flags 0x12 d0
(XEN) cannot mask IRQ 95: masking MSI-X on Dom32753's 0000:03:00.0
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x400, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:04:00.0 from d[IO] to d0
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x200, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:02:00.0 from d[IO] to d0
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x300, type =3D 0x1, root=
 table =3D 0xfd5613000, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:03:00.0 from d[IO] to d0

##### -> our domain orchestration tool has cleaned up and is starting the d=
river domain again

(XEN) AMD-Vi: Disable: device id =3D 0x300, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:03:00.0 from d0 to d[IO]
(XEN) AMD-Vi: Disable: device id =3D 0x200, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:02:00.0 from d0 to d[IO]
(XEN) AMD-Vi: Disable: device id =3D 0x400, domain =3D 0, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:04:00.0 from d0 to d[IO]
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x300, type =3D 0x1, root=
 table =3D 0x98330b000, domain =3D 15, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:03:00.0 from d[IO] to d15
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x200, type =3D 0x1, root=
 table =3D 0x98330b000, domain =3D 15, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:02:00.0 from d[IO] to d15
(XEN) AMD-Vi: Setup I/O page table: device id =3D 0x400, type =3D 0x1, root=
 table =3D 0x98330b000, domain =3D 15, paging mode =3D 3
(XEN) AMD-Vi: Re-assign 0000:04:00.0 from d[IO] to d15

--mynTevqUIMXVj7cQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="intel-enomem.txt"
Content-Transfer-Encoding: 8bit

(XEN) Xen version 4.18.4-pre (@) (gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0) debug=y Wed Nov 27 17:18:46 UTC 2024
(XEN) Latest ChangeSet: Fri Nov 15 14:07:55 2024 +0000 git:05ee7d9083-dirty
(XEN) build-id: 0adefb2a5aa28a52782a7c8481ebd48539af86d0
(XEN) Bootloader: GRUB 2.06-2ubuntu14.4
(XEN) Command line: placeholder console=vga,com2 dom0_max_vcpus=4-8 dom0_mem=min:6144,max:65536m iommu=on,required,intpost,verbose,debug x2apic=off sched=credit2 flask=enforcing gnttab_max_frames=128 xpti=off smt=on cpufreq=xen:performance spec-ctrl=gds-mit=0 com2=115200,8n1
(XEN) Xen image load base address: 0x6f800000
(XEN) Video information:
(XEN)  VGA is graphics mode 1024x768, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 85 (0x55), Stepping 4 (raw 00050654)
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 00000000695bdfff] (usable)
(XEN)  [00000000695be000, 000000006be46fff] (reserved)
(XEN)  [000000006be47000, 000000006bf01fff] (ACPI data)
(XEN)  [000000006bf02000, 000000006ca0bfff] (ACPI NVS)
(XEN)  [000000006ca0c000, 000000006ed10fff] (reserved)
(XEN)  [000000006ed11000, 000000006fffffff] (usable)
(XEN)  [0000000070000000, 000000008fffffff] (reserved)
(XEN)  [00000000fd000000, 00000000fe7fffff] (reserved)
(XEN)  [00000000fed20000, 00000000fed44fff] (reserved)
(XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000107fffffff] (usable)
(XEN) BSP microcode revision: 0x02007006
(XEN) ACPI: RSDP 6C663000, 0024 (r2 SUPERM)
(XEN) ACPI: XSDT 6C6630C8, 0114 (r1 SUPERM   SUPERM  1072009 AMI     10013)
(XEN) ACPI: FACP 6C6A5D70, 0114 (r6 SUPERM SMCI--MB  1072009 INTL 20091013)
(XEN) ACPI: DSDT 6C663278, 42AF5 (r2 SUPERM SMCI--MB  1072009 INTL 20091013)
(XEN) ACPI: FACS 6CA0A080, 0040
(XEN) ACPI: FPDT 6C6A5E88, 0044 (r1                  1072009 AMI     10013)
(XEN) ACPI: FIDT 6C6A5ED0, 009C (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: SPMI 6C6A5F70, 0041 (r5 SUPERM SMCI--MB        0 AMI.        0)
(XEN) ACPI: UEFI 6C6A5FB8, 0048 (r1 SUPERM SMCI--MB  1072009       1000013)
(XEN) ACPI: UEFI 6C6A6000, 005C (r1  INTEL RstUefiV        0             0)
(XEN) ACPI: MCFG 6C6A6060, 003C (r1 SUPERM SMCI--MB  1072009 MSFT       97)
(XEN) ACPI: HPET 6C6A60A0, 0038 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: APIC 6C6A60D8, 071E (r3 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: MIGT 6C6A67F8, 0040 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: MSCT 6C6A6838, 004E (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: PCAT 6C6A6888, 0068 (r2 SUPERM SMCI--MB        2 INTL 20091013)
(XEN) ACPI: PCCT 6C6A68F0, 006E (r1 SUPERM SMCI--MB        2 INTL 20091013)
(XEN) ACPI: RASF 6C6A6960, 0030 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: SLIT 6C6A6990, 002D (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: SRAT 6C6A69C0, 0A30 (r3 SUPERM SMCI--MB        2 INTL 20091013)
(XEN) ACPI: SVOS 6C6A73F0, 0032 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: WDDT 6C6A7428, 0040 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: OEM4 6C6A7468, 28A0C (r2  INTEL CPU  CST     3000 INTL 20140828)
(XEN) ACPI: OEM1 6C6CFE78, A8CC (r2  INTEL CPU EIST     3000 INTL 20140828)
(XEN) ACPI: SSDT 6C6DA748, CEB8 (r2  INTEL SSDT  PM     4000 INTL 20140828)
(XEN) ACPI: SSDT 6C6E7600, 065B (r2 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: BGRT 6C6E7C60, 0038 (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: SSDT 6C6E7C98, 1368 (r2  INTEL SpsNm           2 INTL 20140828)
(XEN) ACPI: DMAR 6C6E9000, 0138 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: HEST 6C6E9138, 00A8 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: BERT 6C6E91E0, 0030 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: ERST 6C6E9210, 0230 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: EINJ 6C6E9440, 0150 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: WSMT 6C6E9590, 0028 (r1     ên           1072009 AMI     10013)
(XEN) System RAM: 65192MB (66756916kB)
(XEN) NUMA: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
(XEN) NUMA: Node 0 PXM 0 [0000000100000000, 000000107fffffff]
(XEN) NUMA: Using 52 for the hash shift
(XEN) Domain heap initialised
(XEN) vesafb: framebuffer at 0x00000000a9000000, mapped to 0xffff82c000201000, using 3072k, total 3072k
(XEN) vesafb: mode is 1024x768x32, linelength=4096, font 8x14
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
(XEN) SMBIOS 3.1 present.
(XEN) XSM Framework v1.0.1 initialized
(XEN) Policy len 0x3467, start at ffff83107fffc000.
(XEN) Flask: 128 avtab hash slots, 458 rules.
(XEN) Flask: 128 avtab hash slots, 458 rules.
(XEN) Flask:  4 users, 3 roles, 46 types, 2 bools
(XEN) Flask:  13 classes, 458 rules
(XEN) Flask:  Starting in enforcing mode.
(XEN) [VT-D]Host address width 46
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = c5ffc000
(XEN) [VT-D]drhd->address = c5ffc000 iommu->reg = ffff82c000506000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:16:05.4
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = e0ffc000
(XEN) [VT-D]drhd->address = e0ffc000 iommu->reg = ffff82c000508000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:64:05.4
(XEN) [VT-D] bridge: 0000:64:03.0 start=64 sec=65 sub=65
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = fbffc000
(XEN) [VT-D]drhd->address = fbffc000 iommu->reg = ffff82c00050a000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:b2:05.4
(XEN) [VT-D] bridge: 0000:b2:00.0 start=b2 sec=b3 sub=b5
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = aaffc000
(XEN) [VT-D]drhd->address = aaffc000 iommu->reg = ffff82c00050c000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:f0:1f.0
(XEN) [VT-D] IOAPIC: 0000:00:05.4
(XEN) [VT-D] MSI HPET: 0000:00:1f.0
(XEN) [VT-D]  flags: INCLUDE_ALL
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D] endpoint: 0000:00:14.0
(XEN) [VT-D]drivers/passthrough/vtd/dmar.c:614:  RMRR: [6e7f3000,6e815fff]
(XEN) [VT-D]found ACPI_DMAR_ATSR:
(XEN) [VT-D]  atsru->all_ports: 0
(XEN) [VT-D] bridge: 0000:64:03.0 start=64 sec=65 sub=65
(XEN) [VT-D] bridge: 0000:b2:00.0 start=b2 sec=b3 sub=b5
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: aaffc000 rhsau->proximity_domain: 0
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: c5ffc000 rhsau->proximity_domain: 0
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: e0ffc000 rhsau->proximity_domain: 0
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: fbffc000 rhsau->proximity_domain: 0
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x508 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:504,1:0], pm1x_evt[1:500,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 6ca0a080/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[6ca0a08c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x09] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
(XEN) ACPI: IOAPIC (id[0x0a] address[0xfec08000] gsi_base[32])
(XEN) IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 32-39
(XEN) ACPI: IOAPIC (id[0x0b] address[0xfec10000] gsi_base[40])
(XEN) IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 40-47
(XEN) ACPI: IOAPIC (id[0x0c] address[0xfec18000] gsi_base[48])
(XEN) IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 48-55
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base 80000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at 80000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) ACPI: BGRT: invalidating v1 image at 0x62875018
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 56 GSI, 1608 MSI/MSI-X
(XEN) Not enabling x2APIC: disabled by cmdline.
(XEN) CPU0: TSC: ratio: 176 / 2
(XEN) CPU0: bus: 100 MHz base: 2200 MHz max: 3000 MHz
(XEN) CPU0: 1000 ... 2200 MHz
(XEN) xstate: size: 0xa88 and states: 0x2ff
(XEN) arch/x86/cpu/mcheck/mce_intel.c:776: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, SER, CMCI, LMCE
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 11, using 0x1
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints: RSBA
(XEN)   Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR GDS_CTRL
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING HARDEN_ARRAY HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, Other: IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 46, Safe address 300000000000
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB EAGER_FPU
(XEN)   Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU VERW
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (with PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 24.000MHz HPET
(XEN) Detected 2194.844 MHz processor.
(XEN) Freed 1020kB unused BSS memory
(XEN) EFI memory map:
(XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
(XEN)  0000000008000-000000000ffff type=2 attr=000000000000000f
(XEN)  0000000010000-000000002efff type=7 attr=000000000000000f
(XEN)  000000002f000-000000003efff type=2 attr=000000000000000f
(XEN)  000000003f000-000000003ffff type=4 attr=000000000000000f
(XEN)  0000000040000-000000009ffff type=3 attr=000000000000000f
(XEN)  0000000100000-0000009ce1fff type=2 attr=000000000000000f
(XEN)  0000009ce2000-000004ededfff type=7 attr=000000000000000f
(XEN)  000004edee000-000005b1cffff type=1 attr=000000000000000f
(XEN)  000005b1d0000-000005b2cffff type=4 attr=000000000000000f
(XEN)  000005b2d0000-000005b5adfff type=7 attr=000000000000000f
(XEN)  000005b5ae000-000005b828fff type=1 attr=000000000000000f
(XEN)  000005b829000-000005baa5fff type=2 attr=000000000000000f
(XEN)  000005baa6000-000005baa7fff type=7 attr=000000000000000f
(XEN)  000005baa8000-000005baa8fff type=2 attr=000000000000000f
(XEN)  000005baa9000-000005bb7ffff type=1 attr=000000000000000f
(XEN)  000005bb80000-0000067c43fff type=4 attr=000000000000000f
(XEN)  0000067c44000-000006815bfff type=7 attr=000000000000000f
(XEN)  000006815c000-00000695bdfff type=3 attr=000000000000000f
(XEN)  00000695be000-000006be46fff type=0 attr=000000000000000f
(XEN)  000006be47000-000006bf01fff type=9 attr=000000000000000f
(XEN)  000006bf02000-000006ca0bfff type=10 attr=000000000000000f
(XEN)  000006ca0c000-000006eb5dfff type=6 attr=800000000000000f
(XEN)  000006eb5e000-000006ed10fff type=5 attr=800000000000000f
(XEN)  000006ed11000-000006ee92fff type=4 attr=000000000000000f
(XEN)  000006ee93000-000006eeb1fff type=3 attr=000000000000000f
(XEN)  000006eeb2000-000006eee1fff type=4 attr=000000000000000f
(XEN)  000006eee2000-000006eee7fff type=3 attr=000000000000000f
(XEN)  000006eee8000-000006f0effff type=4 attr=000000000000000f
(XEN)  000006f0f0000-000006f103fff type=3 attr=000000000000000f
(XEN)  000006f104000-000006f128fff type=4 attr=000000000000000f
(XEN)  000006f129000-000006f13ffff type=3 attr=000000000000000f
(XEN)  000006f140000-000006f167fff type=4 attr=000000000000000f
(XEN)  000006f168000-000006f19ffff type=3 attr=000000000000000f
(XEN)  000006f1a0000-000006f1cbfff type=4 attr=000000000000000f
(XEN)  000006f1cc000-000006f9fffff type=7 attr=000000000000000f
(XEN)  000006fa00000-000006fe2afff type=2 attr=000000000000000f
(XEN)  000006fe2b000-000006fffffff type=7 attr=000000000000000f
(XEN)  0000100000000-000107fffffff type=7 attr=000000000000000f
(XEN)  00000000a0000-00000000fffff type=0 attr=0000000000000000
(XEN)  0000070000000-000007fffffff type=0 attr=0000000000000000
(XEN)  0000080000000-000008fffffff type=11 attr=8000000000000001
(XEN)  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
(XEN)  00000fed20000-00000fed44fff type=11 attr=800000000000100d
(XEN)  00000ff000000-00000ffffffff type=11 attr=800000000000100d
(XEN) alt table ffff82d040489b58 -> ffff82d04049c58e
(XEN) Intel VT-d iommu 2 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 3 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) [VT-D]drivers/passthrough/vtd/qinval.c:422: QI: using 256-entry ring(s)
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode.  Using 5 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 64 KiB.
(XEN) mwait-idle: MWAIT substates: 0x2020
(XEN) mwait-idle: v0.4.1 model 0x55
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - APIC Register Virtualization
(XEN)  - Virtual Interrupt Delivery
(XEN)  - Posted Interrupt Processing
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN)  - TSC Scaling
(XEN) HVM: ASIDs enabled.
(XEN) VMX: Disabling executable EPT superpages due to CVE-2018-12207
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d040489b58 -> ffff82d04049c58e
(XEN) Brought up 8 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Running stub recovery selftests...
(XEN) Fixup #UD[0000]: ffff82d07fffe044 [ffff82d07fffe044] -> ffff82d040389c71
(XEN) Fixup #GP[0000]: ffff82d07fffe045 [ffff82d07fffe045] -> ffff82d040389c71
(XEN) Fixup #SS[0000]: ffff82d07fffe044 [ffff82d07fffe044] -> ffff82d040389c71
(XEN) Fixup #BP[0000]: ffff82d07fffe045 [ffff82d07fffe045] -> ffff82d040389c71
(XEN) arch/x86/time.c:1290: CMOS aliased at 74, index r/w
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 1664 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb
(XEN)  Dom0 kernel: 64-bit, lsb, paddr 0x1000000 -> 0x4800000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000001040000000->0000001048000000 (16387284 pages to be allocated)
(XEN)  Init. ramdisk: 000000107749f000->000000107fffba06
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff84800000
(XEN)  Phys-Mach map: 0000008000000000->0000008007d8c188
(XEN)  Start info:    ffffffff84800000->ffffffff848004b8
(XEN)  Page tables:   ffffffff84801000->ffffffff8482a000
(XEN)  Boot stack:    ffffffff8482a000->ffffffff8482b000
(XEN)  TOTAL:         ffffffff80000000->ffffffff84c00000
(XEN)  ENTRY ADDRESS: ffffffff838c48c0
(XEN) Dom0 has maximum 8 VCPUs
(XEN) [VT-D]d0:Hostbridge: skip 0000:00:00.0 map
(XEN) [VT-D]d0:PCIe: map 0000:00:04.0
(XEN) [VT-D]d0:PCIe: map 0000:00:04.1
(XEN) [VT-D]d0:PCIe: map 0000:00:04.2
(XEN) [VT-D]d0:PCIe: map 0000:00:04.3
(XEN) [VT-D]d0:PCIe: map 0000:00:04.4
(XEN) [VT-D]d0:PCIe: map 0000:00:04.5
(XEN) [VT-D]d0:PCIe: map 0000:00:04.6
(XEN) [VT-D]d0:PCIe: map 0000:00:04.7
(XEN) [VT-D]d0:PCIe: map 0000:00:05.0
(XEN) [VT-D]d0:PCIe: map 0000:00:05.2
(XEN) [VT-D]d0:PCIe: map 0000:00:05.4
(XEN) [VT-D]d0:PCIe: map 0000:00:08.0
(XEN) [VT-D]d0:PCI: map 0000:00:08.1
(XEN) [VT-D]d0:PCIe: map 0000:00:08.2
(XEN) [VT-D]d0:PCI: map 0000:00:11.0
(XEN) [VT-D]d0:PCI: map 0000:00:11.5
(XEN) [VT-D]d0:PCI: map 0000:00:14.0
(XEN) [VT-D]d0:PCI: map 0000:00:14.2
(XEN) [VT-D]d0:PCI: map 0000:00:16.0
(XEN) [VT-D]d0:PCI: map 0000:00:16.1
(XEN) [VT-D]d0:PCI: map 0000:00:16.4
(XEN) [VT-D]d0:PCI: map 0000:00:17.0
(XEN) [VT-D]d0:PCI: map 0000:00:1f.0
(XEN) [VT-D]d0:PCI: map 0000:00:1f.2
(XEN) [VT-D]d0:PCI: map 0000:00:1f.4
(XEN) [VT-D]d0:PCI: map 0000:00:1f.5
(XEN) [VT-D]d0:PCI: map 0000:03:00.0
(XEN) [VT-D]d0:PCIe: map 0000:16:05.0
(XEN) [VT-D]d0:PCIe: map 0000:16:05.2
(XEN) [VT-D]d0:PCIe: map 0000:16:05.4
(XEN) [VT-D]d0:PCI: map 0000:16:08.0
(XEN) [VT-D]d0:PCI: map 0000:16:08.1
(XEN) [VT-D]d0:PCI: map 0000:16:08.2
(XEN) [VT-D]d0:PCI: map 0000:16:08.3
(XEN) [VT-D]d0:PCI: map 0000:16:08.4
(XEN) [VT-D]d0:PCI: map 0000:16:08.5
(XEN) [VT-D]d0:PCI: map 0000:16:08.6
(XEN) [VT-D]d0:PCI: map 0000:16:08.7
(XEN) [VT-D]d0:PCI: map 0000:16:09.0
(XEN) [VT-D]d0:PCI: map 0000:16:09.1
(XEN) [VT-D]d0:PCI: map 0000:16:09.2
(XEN) [VT-D]d0:PCI: map 0000:16:09.3
(XEN) [VT-D]d0:PCI: map 0000:16:09.4
(XEN) [VT-D]d0:PCI: map 0000:16:09.5
(XEN) [VT-D]d0:PCI: map 0000:16:09.6
(XEN) [VT-D]d0:PCI: map 0000:16:09.7
(XEN) [VT-D]d0:PCI: map 0000:16:0a.0
(XEN) [VT-D]d0:PCI: map 0000:16:0a.1
(XEN) [VT-D]d0:PCI: map 0000:16:0e.0
(XEN) [VT-D]d0:PCI: map 0000:16:0e.1
(XEN) [VT-D]d0:PCI: map 0000:16:0e.2
(XEN) [VT-D]d0:PCI: map 0000:16:0e.3
(XEN) [VT-D]d0:PCI: map 0000:16:0e.4
(XEN) [VT-D]d0:PCI: map 0000:16:0e.5
(XEN) [VT-D]d0:PCI: map 0000:16:0e.6
(XEN) [VT-D]d0:PCI: map 0000:16:0e.7
(XEN) [VT-D]d0:PCI: map 0000:16:0f.0
(XEN) [VT-D]d0:PCI: map 0000:16:0f.1
(XEN) [VT-D]d0:PCI: map 0000:16:0f.2
(XEN) [VT-D]d0:PCI: map 0000:16:0f.3
(XEN) [VT-D]d0:PCI: map 0000:16:0f.4
(XEN) [VT-D]d0:PCI: map 0000:16:0f.5
(XEN) [VT-D]d0:PCI: map 0000:16:0f.6
(XEN) [VT-D]d0:PCI: map 0000:16:0f.7
(XEN) [VT-D]d0:PCI: map 0000:16:10.0
(XEN) [VT-D]d0:PCI: map 0000:16:10.1
(XEN) [VT-D]d0:PCI: map 0000:16:1d.0
(XEN) [VT-D]d0:PCI: map 0000:16:1d.1
(XEN) [VT-D]d0:PCI: map 0000:16:1d.2
(XEN) [VT-D]d0:PCI: map 0000:16:1d.3
(XEN) [VT-D]d0:PCI: map 0000:16:1e.0
(XEN) [VT-D]d0:PCI: map 0000:16:1e.1
(XEN) [VT-D]d0:PCI: map 0000:16:1e.2
(XEN) [VT-D]d0:PCI: map 0000:16:1e.3
(XEN) [VT-D]d0:PCI: map 0000:16:1e.4
(XEN) [VT-D]d0:PCI: map 0000:16:1e.5
(XEN) [VT-D]d0:PCI: map 0000:16:1e.6
(XEN) [VT-D]d0:PCIe: map 0000:64:05.0
(XEN) [VT-D]d0:PCIe: map 0000:64:05.2
(XEN) [VT-D]d0:PCIe: map 0000:64:05.4
(XEN) [VT-D]d0:PCIe: map 0000:64:08.0
(XEN) [VT-D]d0:PCIe: map 0000:64:09.0
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.0
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.1
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.2
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.3
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.4
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.5
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.6
(XEN) [VT-D]d0:PCIe: map 0000:64:0a.7
(XEN) [VT-D]d0:PCIe: map 0000:64:0b.0
(XEN) [VT-D]d0:PCIe: map 0000:64:0b.1
(XEN) [VT-D]d0:PCIe: map 0000:64:0b.2
(XEN) [VT-D]d0:PCIe: map 0000:64:0b.3
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.0
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.1
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.2
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.3
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.4
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.5
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.6
(XEN) [VT-D]d0:PCIe: map 0000:64:0c.7
(XEN) [VT-D]d0:PCIe: map 0000:64:0d.0
(XEN) [VT-D]d0:PCIe: map 0000:64:0d.1
(XEN) [VT-D]d0:PCIe: map 0000:64:0d.2
(XEN) [VT-D]d0:PCIe: map 0000:64:0d.3
(XEN) [VT-D]d0:PCIe: map 0000:65:00.0
(XEN) [VT-D]d0:PCIe: map 0000:65:00.1
(XEN) [VT-D]d0:PCIe: map 0000:65:00.2
(XEN) [VT-D]d0:PCIe: map 0000:65:00.3
(XEN) [VT-D]d0:PCIe: map 0000:b2:05.0
(XEN) [VT-D]d0:PCIe: map 0000:b2:05.2
(XEN) [VT-D]d0:PCIe: map 0000:b2:05.4
(XEN) [VT-D]d0:PCIe: map 0000:b2:12.0
(XEN) [VT-D]d0:PCI: map 0000:b2:12.1
(XEN) [VT-D]d0:PCI: map 0000:b2:12.2
(XEN) [VT-D]d0:PCI: map 0000:b2:15.0
(XEN) [VT-D]d0:PCI: map 0000:b2:16.0
(XEN) [VT-D]d0:PCI: map 0000:b2:16.4
(XEN) [VT-D]d0:PCI: map 0000:b2:17.0
(XEN) [VT-D]d0:PCIe: map 0000:b5:00.0
(XEN) [VT-D]d0:PCIe: map 0000:b5:00.1
(XEN) [VT-D]d0:PCIe: map 0000:b5:00.2
(XEN) [VT-D]d0:PCIe: map 0000:b5:00.3
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c00050a000
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c000508000
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c000506000
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c00050c000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 704kB init memory
mapping kernel into physical memory
about to get started...
[    0.000000] Linux version 6.8.0-48-generic (root@d834ac22c75d) (x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #48~22.04.1 SMP PREEMPT_DYNAMIC Thu Oct 24 08:09:57 UTC  (Ubuntu 6.8.0-48.48~22.04.1-generic 6.8.12)
[    0.000000] Command line: console=hvc0 console=tty1 earlyprintk=xen xen-pciback.passthrough=1 oops=panic panic=15 root=/dev/loop0 ro rootfstype=ext4 zyimage=zvol:xvda1@ref9000000 zyoverlay pstore.backend=efi libata.fua=1 audit=1 nohz=off consoleblank=0
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai  
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] usable
[    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x00000000695bdfff] usable
[    0.000000] Xen: [mem 0x00000000695be000-0x000000006be46fff] reserved
[    0.000000] Xen: [mem 0x000000006be47000-0x000000006bf01fff] ACPI data
[    0.000000] Xen: [mem 0x000000006bf02000-0x000000006ca0bfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000006ca0c000-0x000000006ed10fff] reserved
[    0.000000] Xen: [mem 0x000000006ed11000-0x000000006fffffff] usable
[    0.000000] Xen: [mem 0x0000000070000000-0x000000008fffffff] reserved
[    0.000000] Xen: [mem 0x00000000aaffc000-0x00000000aaffcfff] reserved
[    0.000000] Xen: [mem 0x00000000c5ffc000-0x00000000c5ffcfff] reserved
[    0.000000] Xen: [mem 0x00000000e0ffc000-0x00000000e0ffcfff] reserved
[    0.000000] Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
[    0.000000] Xen: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec01fff] reserved
[    0.000000] Xen: [mem 0x00000000fec08000-0x00000000fec08fff] reserved
[    0.000000] Xen: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] Xen: [mem 0x00000000fec18000-0x00000000fec18fff] reserved
[    0.000000] Xen: [mem 0x00000000fed20000-0x00000000fed44fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x000000107fffffff] usable
[    0.000000] printk: legacy bootconsole [xenboot0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.6 by American Megatrends
[    0.000000] efi: ACPI 2.0=0x6c663000 ACPI=0x6c663000 SMBIOS=0x6e7bb000 SMBIOS 3.0=0x6e7ba000 (MEMATTR=0x65964018 unusable) ESRT=0x6bf01018 MOKvar=0x6e7f2000 
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: Supermicro SYS-5019D-FN8TP-5-NC041/X11SDV-4C-TP8F, BIOS 2.1 01/18/2024
[    0.000000] Hypervisor detected: Xen PV
[    0.000490] tsc: Detected 2194.844 MHz processor
[    0.000891] last_pfn = 0x1080000 max_arch_pfn = 0x400000000
[    0.000897] MTRR map: 5 entries (0 fixed + 5 variable; max 20), built from 10 variable MTRRs
[    0.000903] MTRRs set to read-only
[    0.000909] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC  
[    0.000913] last_pfn = 0x70000 max_arch_pfn = 0x400000000
[    0.000968] esrt: Reserving ESRT space from 0x000000006bf01018 to 0x000000006bf01050.
[    0.000975] Kernel/User page tables isolation: disabled on XEN PV.
[    2.971016] secureboot: Secure boot disabled
[    2.971090] RAMDISK: [mem 0x08000000-0x10b5cfff]
[    2.971102] ACPI: Early table checksum verification disabled
[    2.971115] ACPI: RSDP 0x000000006C663000 000024 (v02 SUPERM)
[    2.971129] ACPI: XSDT 0x000000006C6630C8 000114 (v01 SUPERM SUPERM   01072009 AMI  00010013)
[    2.971184] ACPI: FACP 0x000000006C6A5D70 000114 (v06 SUPERM SMCI--MB 01072009 INTL 20091013)
[    2.971253] ACPI: DSDT 0x000000006C663278 042AF5 (v02 SUPERM SMCI--MB 01072009 INTL 20091013)
[    2.971270] ACPI: FACS 0x000000006CA0A080 000040
[    2.971286] ACPI: FPDT 0x000000006C6A5E88 000044 (v01                 01072009 AMI  00010013)
[    2.971304] ACPI: FIDT 0x000000006C6A5ED0 00009C (v01 SUPERM SMCI--MB 01072009 AMI  00010013)
[    2.971321] ACPI: SPMI 0x000000006C6A5F70 000041 (v05 SUPERM SMCI--MB 00000000 AMI. 00000000)
[    2.971338] ACPI: UEFI 0x000000006C6A5FB8 000048 (v01 SUPERM SMCI--MB 01072009      01000013)
[    2.971355] ACPI: UEFI 0x000000006C6A6000 00005C (v01 INTEL  RstUefiV 00000000      00000000)
[    2.971373] ACPI: MCFG 0x000000006C6A6060 00003C (v01 SUPERM SMCI--MB 01072009 MSFT 00000097)
[    2.971390] ACPI: HPET 0x000000006C6A60A0 000038 (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971407] ACPI: APIC 0x000000006C6A60D8 00071E (v03 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971424] ACPI: MIGT 0x000000006C6A67F8 000040 (v01 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971441] ACPI: MSCT 0x000000006C6A6838 00004E (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971459] ACPI: PCAT 0x000000006C6A6888 000068 (v02 SUPERM SMCI--MB 00000002 INTL 20091013)
[    2.971476] ACPI: PCCT 0x000000006C6A68F0 00006E (v01 SUPERM SMCI--MB 00000002 INTL 20091013)
[    2.971493] ACPI: RASF 0x000000006C6A6960 000030 (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971510] ACPI: SLIT 0x000000006C6A6990 00002D (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971527] ACPI: SRAT 0x000000006C6A69C0 000A30 (v03 SUPERM SMCI--MB 00000002 INTL 20091013)
[    2.971544] ACPI: SVOS 0x000000006C6A73F0 000032 (v01 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971561] ACPI: WDDT 0x000000006C6A7428 000040 (v01 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971578] ACPI: OEM4 0x000000006C6A7468 028A0C (v02 INTEL  CPU  CST 00003000 INTL 20140828)
[    2.971596] ACPI: OEM1 0x000000006C6CFE78 00A8CC (v02 INTEL  CPU EIST 00003000 INTL 20140828)
[    2.971613] ACPI: SSDT 0x000000006C6DA748 00CEB8 (v02 INTEL  SSDT  PM 00004000 INTL 20140828)
[    2.971630] ACPI: SSDT 0x000000006C6E7600 00065B (v02 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971647] ACPI: BGRT 0x000000006C6E7C60 000038 (v01 SUPERM SMCI--MB 01072009 AMI  00010013)
[    2.971664] ACPI: SSDT 0x000000006C6E7C98 001368 (v02 INTEL  SpsNm    00000002 INTL 20140828)
[    2.971682] ACPI: RMAD 0x000000006C6E9000 000138 (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971699] ACPI: HEST 0x000000006C6E9138 0000A8 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971716] ACPI: BERT 0x000000006C6E91E0 000030 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971733] ACPI: ERST 0x000000006C6E9210 000230 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971750] ACPI: EINJ 0x000000006C6E9440 000150 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971767] ACPI: WSMT 0x000000006C6E9590 000028 (v01 ên              01072009 AMI  00010013)
[    2.971778] ACPI: Reserving FACP table memory at [mem 0x6c6a5d70-0x6c6a5e83]
[    2.971784] ACPI: Reserving DSDT table memory at [mem 0x6c663278-0x6c6a5d6c]
[    2.971787] ACPI: Reserving FACS table memory at [mem 0x6ca0a080-0x6ca0a0bf]
[    2.971791] ACPI: Reserving FPDT table memory at [mem 0x6c6a5e88-0x6c6a5ecb]
[    2.971795] ACPI: Reserving FIDT table memory at [mem 0x6c6a5ed0-0x6c6a5f6b]
[    2.971799] ACPI: Reserving SPMI table memory at [mem 0x6c6a5f70-0x6c6a5fb0]
[    2.971803] ACPI: Reserving UEFI table memory at [mem 0x6c6a5fb8-0x6c6a5fff]
[    2.971806] ACPI: Reserving UEFI table memory at [mem 0x6c6a6000-0x6c6a605b]
[    2.971810] ACPI: Reserving MCFG table memory at [mem 0x6c6a6060-0x6c6a609b]
[    2.971814] ACPI: Reserving HPET table memory at [mem 0x6c6a60a0-0x6c6a60d7]
[    2.971818] ACPI: Reserving APIC table memory at [mem 0x6c6a60d8-0x6c6a67f5]
[    2.971822] ACPI: Reserving MIGT table memory at [mem 0x6c6a67f8-0x6c6a6837]
[    2.971825] ACPI: Reserving MSCT table memory at [mem 0x6c6a6838-0x6c6a6885]
[    2.971829] ACPI: Reserving PCAT table memory at [mem 0x6c6a6888-0x6c6a68ef]
[    2.971833] ACPI: Reserving PCCT table memory at [mem 0x6c6a68f0-0x6c6a695d]
[    2.971837] ACPI: Reserving RASF table memory at [mem 0x6c6a6960-0x6c6a698f]
[    2.971841] ACPI: Reserving SLIT table memory at [mem 0x6c6a6990-0x6c6a69bc]
[    2.971844] ACPI: Reserving SRAT table memory at [mem 0x6c6a69c0-0x6c6a73ef]
[    2.971848] ACPI: Reserving SVOS table memory at [mem 0x6c6a73f0-0x6c6a7421]
[    2.971852] ACPI: Reserving WDDT table memory at [mem 0x6c6a7428-0x6c6a7467]
[    2.971856] ACPI: Reserving OEM4 table memory at [mem 0x6c6a7468-0x6c6cfe73]
[    2.971859] ACPI: Reserving OEM1 table memory at [mem 0x6c6cfe78-0x6c6da743]
[    2.971863] ACPI: Reserving SSDT table memory at [mem 0x6c6da748-0x6c6e75ff]
[    2.971867] ACPI: Reserving SSDT table memory at [mem 0x6c6e7600-0x6c6e7c5a]
[    2.971871] ACPI: Reserving BGRT table memory at [mem 0x6c6e7c60-0x6c6e7c97]
[    2.971875] ACPI: Reserving SSDT table memory at [mem 0x6c6e7c98-0x6c6e8fff]
[    2.971878] ACPI: Reserving RMAD table memory at [mem 0x6c6e9000-0x6c6e9137]
[    2.971882] ACPI: Reserving HEST table memory at [mem 0x6c6e9138-0x6c6e91df]
[    2.971886] ACPI: Reserving BERT table memory at [mem 0x6c6e91e0-0x6c6e920f]
[    2.971890] ACPI: Reserving ERST table memory at [mem 0x6c6e9210-0x6c6e943f]
[    2.971894] ACPI: Reserving EINJ table memory at [mem 0x6c6e9440-0x6c6e958f]
[    2.971897] ACPI: Reserving WSMT table memory at [mem 0x6c6e9590-0x6c6e95b7]
[    2.972011] APIC: Switched APIC routing to: Xen PV
[    2.972099] NUMA turned off
[    2.972102] Faking a node at [mem 0x0000000000000000-0x000000107fffffff]
[    2.972117] NODE_DATA(0) allocated [mem 0xfb1806000-0xfb1830fff]
[    2.973084] Section 501 and 502 (node 0) have a circular dependency on usemap and pgdat allocations
[    3.328882] Zone ranges:
[    3.328889]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    3.328895]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    3.328957]   Normal   [mem 0x0000000100000000-0x000000107fffffff]
[    3.328965]   Device   empty
[    3.328969] Movable zone start for each node
[    3.328974] Early memory node ranges
[    3.328977]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
[    3.328982]   node   0: [mem 0x0000000000100000-0x00000000695bdfff]
[    3.328987]   node   0: [mem 0x000000006ed11000-0x000000006fffffff]
[    3.328990]   node   0: [mem 0x0000000100000000-0x000000107fffffff]
[    3.329003] Initmem setup node 0 [mem 0x0000000000001000-0x000000107fffffff]
[    3.329013] On node 0, zone DMA: 1 pages in unavailable ranges
[    3.329042] On node 0, zone DMA: 128 pages in unavailable ranges
[    3.332019] On node 0, zone DMA32: 22355 pages in unavailable ranges
[    3.431745] p2m virtual area at (____ptrval____), size is 40000000
[    4.989453] Remapped 612307 page(s)
[    4.990215] ACPI: PM-Timer IO Port: 0x508
[    4.990413] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    4.990442] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    4.990498] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    4.990512] IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
[    4.990529] IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 32-39
[    4.990543] IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 40-47
[    4.990557] IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 48-55
[    4.990603] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    4.990609] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    4.990699] ACPI: Using ACPI (MADT) for SMP configuration information
[    4.990706] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    4.996414] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    4.996446] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    4.996452] PM: hibernation: Registered nosave memory: [mem 0x00080000-0x000fffff]
[    4.996457] PM: hibernation: Registered nosave memory: [mem 0x695be000-0x6be46fff]
[    4.996461] PM: hibernation: Registered nosave memory: [mem 0x6be47000-0x6bf01fff]
[    4.996465] PM: hibernation: Registered nosave memory: [mem 0x6bf02000-0x6ca0bfff]
[    4.996469] PM: hibernation: Registered nosave memory: [mem 0x6ca0c000-0x6ed10fff]
[    4.996474] PM: hibernation: Registered nosave memory: [mem 0x70000000-0x8fffffff]
[    4.996477] PM: hibernation: Registered nosave memory: [mem 0x90000000-0xaaffbfff]
[    4.996481] PM: hibernation: Registered nosave memory: [mem 0xaaffc000-0xaaffcfff]
[    4.996485] PM: hibernation: Registered nosave memory: [mem 0xaaffd000-0xc5ffbfff]
[    4.996489] PM: hibernation: Registered nosave memory: [mem 0xc5ffc000-0xc5ffcfff]
[    4.996492] PM: hibernation: Registered nosave memory: [mem 0xc5ffd000-0xe0ffbfff]
[    4.996496] PM: hibernation: Registered nosave memory: [mem 0xe0ffc000-0xe0ffcfff]
[    4.996500] PM: hibernation: Registered nosave memory: [mem 0xe0ffd000-0xfbffbfff]
[    4.996503] PM: hibernation: Registered nosave memory: [mem 0xfbffc000-0xfbffcfff]
[    4.996507] PM: hibernation: Registered nosave memory: [mem 0xfbffd000-0xfcffffff]
[    4.996511] PM: hibernation: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
[    4.996515] PM: hibernation: Registered nosave memory: [mem 0xfe800000-0xfebfffff]
[    4.996518] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec01fff]
[    4.996522] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec07fff]
[    4.996526] PM: hibernation: Registered nosave memory: [mem 0xfec08000-0xfec08fff]
[    4.996530] PM: hibernation: Registered nosave memory: [mem 0xfec09000-0xfec0ffff]
[    4.996533] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    4.996537] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec17fff]
[    4.996595] PM: hibernation: Registered nosave memory: [mem 0xfec18000-0xfec18fff]
[    4.996602] PM: hibernation: Registered nosave memory: [mem 0xfec19000-0xfed1ffff]
[    4.996605] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed44fff]
[    4.996609] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfedfffff]
[    4.996613] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    4.996617] PM: hibernation: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    4.996620] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    4.996625] [mem 0xaaffd000-0xc5ffbfff] available for PCI devices
[    4.996636] Booting kernel on Xen
[    4.996639] Xen version: 4.18.4-pre (preserve-AD)
[    4.996645] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    4.996661] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    4.997254] percpu: Embedded 86 pages/cpu s229376 r8192 d114688 u524288
[    4.997354] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
[    4.997360] Kernel command line: console=hvc0 console=tty1 earlyprintk=xen xen-pciback.passthrough=1 oops=panic panic=15 root=/dev/loop0 ro rootfstype=ext4 zyimage=zvol:xvda1@ref9000000 zyoverlay pstore.backend=efi libata.fua=1 audit=1 nohz=off consoleblank=0
[    4.997562] audit: enabled (after initialization)
[    4.997588] Unknown kernel command line parameters "zyoverlay zyimage=zvol:xvda1@ref9000000", will be passed to user space.
[    4.997605] random: crng init done
[    5.003861] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
[    5.007013] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    5.007992] Fallback order for Node 0: 0 
[    5.007998] Built 1 zonelists, mobility grouping on.  Total pages: 16428410
[    5.008006] Policy zone: Normal
[    5.008017] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    5.008023] software IO TLB: area num 8.
[    5.286869] Memory: 64152948K/66756784K available (22528K kernel code, 4438K rwdata, 13984K rodata, 4972K init, 4740K bss, 2603584K reserved, 0K cma-reserved)
[    5.289202] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
Poking KASLR using RDRAND RDTSC...
[    5.290452] ftrace: allocating 57924 entries in 227 pages
[    5.304210] ftrace: allocated 227 pages with 5 groups
[    5.305587] Dynamic Preempt: voluntary
[    5.305900] rcu: Preemptible hierarchical RCU implementation.
[    5.305904] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    5.305909] 	Trampoline variant of Tasks RCU enabled.
[    5.305912] 	Rude variant of Tasks RCU enabled.
[    5.305915] 	Tracing variant of Tasks RCU enabled.
[    5.305918] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    5.305922] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    5.317939] NR_IRQS: 524544, nr_irqs: 1032, preallocated irqs: 16
[    5.318172] xen:events: Using FIFO-based ABI
[    5.318321] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    5.318444] Console: colour dummy device 80x25
[    5.318451] printk: legacy console [tty1] enabled
[    5.318458] printk: legacy bootconsole [xenboot0] disabled
[    0.000000] Linux version 6.8.0-48-generic (root@d834ac22c75d) (x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #48~22.04.1 SMP PREEMPT_DYNAMIC Thu Oct 24 08:09:57 UTC  (Ubuntu 6.8.0-48.48~22.04.1-generic 6.8.12)
[    0.000000] Command line: console=hvc0 console=tty1 earlyprintk=xen xen-pciback.passthrough=1 oops=panic panic=15 root=/dev/loop0 ro rootfstype=ext4 zyimage=zvol:xvda1@ref9000000 zyoverlay pstore.backend=efi libata.fua=1 audit=1 nohz=off consoleblank=0
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai  
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] usable
[    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x00000000695bdfff] usable
[    0.000000] Xen: [mem 0x00000000695be000-0x000000006be46fff] reserved
[    0.000000] Xen: [mem 0x000000006be47000-0x000000006bf01fff] ACPI data
[    0.000000] Xen: [mem 0x000000006bf02000-0x000000006ca0bfff] ACPI NVS
[    0.000000] Xen: [mem 0x000000006ca0c000-0x000000006ed10fff] reserved
[    0.000000] Xen: [mem 0x000000006ed11000-0x000000006fffffff] usable
[    0.000000] Xen: [mem 0x0000000070000000-0x000000008fffffff] reserved
[    0.000000] Xen: [mem 0x00000000aaffc000-0x00000000aaffcfff] reserved
[    0.000000] Xen: [mem 0x00000000c5ffc000-0x00000000c5ffcfff] reserved
[    0.000000] Xen: [mem 0x00000000e0ffc000-0x00000000e0ffcfff] reserved
[    0.000000] Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
[    0.000000] Xen: [mem 0x00000000fd000000-0x00000000fe7fffff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec01fff] reserved
[    0.000000] Xen: [mem 0x00000000fec08000-0x00000000fec08fff] reserved
[    0.000000] Xen: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] Xen: [mem 0x00000000fec18000-0x00000000fec18fff] reserved
[    0.000000] Xen: [mem 0x00000000fed20000-0x00000000fed44fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x0000000100000000-0x000000107fffffff] usable
[    0.000000] printk: legacy bootconsole [xenboot0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.6 by American Megatrends
[    0.000000] efi: ACPI 2.0=0x6c663000 ACPI=0x6c663000 SMBIOS=0x6e7bb000 SMBIOS 3.0=0x6e7ba000 (MEMATTR=0x65964018 unusable) ESRT=0x6bf01018 MOKvar=0x6e7f2000 
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: Supermicro SYS-5019D-FN8TP-5-NC041/X11SDV-4C-TP8F, BIOS 2.1 01/18/2024
[    0.000000] Hypervisor detected: Xen PV
[    0.000490] tsc: Detected 2194.844 MHz processor
[    0.000891] last_pfn = 0x1080000 max_arch_pfn = 0x400000000
[    0.000897] MTRR map: 5 entries (0 fixed + 5 variable; max 20), built from 10 variable MTRRs
[    0.000903] MTRRs set to read-only
[    0.000909] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC  
[    0.000913] last_pfn = 0x70000 max_arch_pfn = 0x400000000
[    0.000968] esrt: Reserving ESRT space from 0x000000006bf01018 to 0x000000006bf01050.
[    0.000975] Kernel/User page tables isolation: disabled on XEN PV.
[    2.971016] secureboot: Secure boot disabled
[    2.971090] RAMDISK: [mem 0x08000000-0x10b5cfff]
[    2.971102] ACPI: Early table checksum verification disabled
[    2.971115] ACPI: RSDP 0x000000006C663000 000024 (v02 SUPERM)
[    2.971129] ACPI: XSDT 0x000000006C6630C8 000114 (v01 SUPERM SUPERM   01072009 AMI  00010013)
[    2.971184] ACPI: FACP 0x000000006C6A5D70 000114 (v06 SUPERM SMCI--MB 01072009 INTL 20091013)
[    2.971253] ACPI: DSDT 0x000000006C663278 042AF5 (v02 SUPERM SMCI--MB 01072009 INTL 20091013)
[    2.971270] ACPI: FACS 0x000000006CA0A080 000040
[    2.971286] ACPI: FPDT 0x000000006C6A5E88 000044 (v01                 01072009 AMI  00010013)
[    2.971304] ACPI: FIDT 0x000000006C6A5ED0 00009C (v01 SUPERM SMCI--MB 01072009 AMI  00010013)
[    2.971321] ACPI: SPMI 0x000000006C6A5F70 000041 (v05 SUPERM SMCI--MB 00000000 AMI. 00000000)
[    2.971338] ACPI: UEFI 0x000000006C6A5FB8 000048 (v01 SUPERM SMCI--MB 01072009      01000013)
[    2.971355] ACPI: UEFI 0x000000006C6A6000 00005C (v01 INTEL  RstUefiV 00000000      00000000)
[    2.971373] ACPI: MCFG 0x000000006C6A6060 00003C (v01 SUPERM SMCI--MB 01072009 MSFT 00000097)
[    2.971390] ACPI: HPET 0x000000006C6A60A0 000038 (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971407] ACPI: APIC 0x000000006C6A60D8 00071E (v03 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971424] ACPI: MIGT 0x000000006C6A67F8 000040 (v01 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971441] ACPI: MSCT 0x000000006C6A6838 00004E (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971459] ACPI: PCAT 0x000000006C6A6888 000068 (v02 SUPERM SMCI--MB 00000002 INTL 20091013)
[    2.971476] ACPI: PCCT 0x000000006C6A68F0 00006E (v01 SUPERM SMCI--MB 00000002 INTL 20091013)
[    2.971493] ACPI: RASF 0x000000006C6A6960 000030 (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971510] ACPI: SLIT 0x000000006C6A6990 00002D (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971527] ACPI: SRAT 0x000000006C6A69C0 000A30 (v03 SUPERM SMCI--MB 00000002 INTL 20091013)
[    2.971544] ACPI: SVOS 0x000000006C6A73F0 000032 (v01 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971561] ACPI: WDDT 0x000000006C6A7428 000040 (v01 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971578] ACPI: OEM4 0x000000006C6A7468 028A0C (v02 INTEL  CPU  CST 00003000 INTL 20140828)
[    2.971596] ACPI: OEM1 0x000000006C6CFE78 00A8CC (v02 INTEL  CPU EIST 00003000 INTL 20140828)
[    2.971613] ACPI: SSDT 0x000000006C6DA748 00CEB8 (v02 INTEL  SSDT  PM 00004000 INTL 20140828)
[    2.971630] ACPI: SSDT 0x000000006C6E7600 00065B (v02 SUPERM SMCI--MB 00000000 INTL 20091013)
[    2.971647] ACPI: BGRT 0x000000006C6E7C60 000038 (v01 SUPERM SMCI--MB 01072009 AMI  00010013)
[    2.971664] ACPI: SSDT 0x000000006C6E7C98 001368 (v02 INTEL  SpsNm    00000002 INTL 20140828)
[    2.971682] ACPI: RMAD 0x000000006C6E9000 000138 (v01 SUPERM SMCI--MB 00000001 INTL 20091013)
[    2.971699] ACPI: HEST 0x000000006C6E9138 0000A8 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971716] ACPI: BERT 0x000000006C6E91E0 000030 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971733] ACPI: ERST 0x000000006C6E9210 000230 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971750] ACPI: EINJ 0x000000006C6E9440 000150 (v01 SUPERM SMCI--MB 00000001 INTL 00000001)
[    2.971767] ACPI: WSMT 0x000000006C6E9590 000028 (v01 ên              01072009 AMI  00010013)
[    2.971778] ACPI: Reserving FACP table memory at [mem 0x6c6a5d70-0x6c6a5e83]
[    2.971784] ACPI: Reserving DSDT table memory at [mem 0x6c663278-0x6c6a5d6c]
[    2.971787] ACPI: Reserving FACS table memory at [mem 0x6ca0a080-0x6ca0a0bf]
[    2.971791] ACPI: Reserving FPDT table memory at [mem 0x6c6a5e88-0x6c6a5ecb]
[    2.971795] ACPI: Reserving FIDT table memory at [mem 0x6c6a5ed0-0x6c6a5f6b]
[    2.971799] ACPI: Reserving SPMI table memory at [mem 0x6c6a5f70-0x6c6a5fb0]
[    2.971803] ACPI: Reserving UEFI table memory at [mem 0x6c6a5fb8-0x6c6a5fff]
[    2.971806] ACPI: Reserving UEFI table memory at [mem 0x6c6a6000-0x6c6a605b]
[    2.971810] ACPI: Reserving MCFG table memory at [mem 0x6c6a6060-0x6c6a609b]
[    2.971814] ACPI: Reserving HPET table memory at [mem 0x6c6a60a0-0x6c6a60d7]
[    2.971818] ACPI: Reserving APIC table memory at [mem 0x6c6a60d8-0x6c6a67f5]
[    2.971822] ACPI: Reserving MIGT table memory at [mem 0x6c6a67f8-0x6c6a6837]
[    2.971825] ACPI: Reserving MSCT table memory at [mem 0x6c6a6838-0x6c6a6885]
[    2.971829] ACPI: Reserving PCAT table memory at [mem 0x6c6a6888-0x6c6a68ef]
[    2.971833] ACPI: Reserving PCCT table memory at [mem 0x6c6a68f0-0x6c6a695d]
[    2.971837] ACPI: Reserving RASF table memory at [mem 0x6c6a6960-0x6c6a698f]
[    2.971841] ACPI: Reserving SLIT table memory at [mem 0x6c6a6990-0x6c6a69bc]
[    2.971844] ACPI: Reserving SRAT table memory at [mem 0x6c6a69c0-0x6c6a73ef]
[    2.971848] ACPI: Reserving SVOS table memory at [mem 0x6c6a73f0-0x6c6a7421]
[    2.971852] ACPI: Reserving WDDT table memory at [mem 0x6c6a7428-0x6c6a7467]
[    2.971856] ACPI: Reserving OEM4 table memory at [mem 0x6c6a7468-0x6c6cfe73]
[    2.971859] ACPI: Reserving OEM1 table memory at [mem 0x6c6cfe78-0x6c6da743]
[    2.971863] ACPI: Reserving SSDT table memory at [mem 0x6c6da748-0x6c6e75ff]
[    2.971867] ACPI: Reserving SSDT table memory at [mem 0x6c6e7600-0x6c6e7c5a]
[    2.971871] ACPI: Reserving BGRT table memory at [mem 0x6c6e7c60-0x6c6e7c97]
[    2.971875] ACPI: Reserving SSDT table memory at [mem 0x6c6e7c98-0x6c6e8fff]
[    2.971878] ACPI: Reserving RMAD table memory at [mem 0x6c6e9000-0x6c6e9137]
[    2.971882] ACPI: Reserving HEST table memory at [mem 0x6c6e9138-0x6c6e91df]
[    2.971886] ACPI: Reserving BERT table memory at [mem 0x6c6e91e0-0x6c6e920f]
[    2.971890] ACPI: Reserving ERST table memory at [mem 0x6c6e9210-0x6c6e943f]
[    2.971894] ACPI: Reserving EINJ table memory at [mem 0x6c6e9440-0x6c6e958f]
[    2.971897] ACPI: Reserving WSMT table memory at [mem 0x6c6e9590-0x6c6e95b7]
[    2.972011] APIC: Switched APIC routing to: Xen PV
[    2.972099] NUMA turned off
[    2.972102] Faking a node at [mem 0x0000000000000000-0x000000107fffffff]
[    2.972117] NODE_DATA(0) allocated [mem 0xfb1806000-0xfb1830fff]
[    2.973084] Section 501 and 502 (node 0) have a circular dependency on usemap and pgdat allocations
[    3.328882] Zone ranges:
[    3.328889]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    3.328895]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    3.328957]   Normal   [mem 0x0000000100000000-0x000000107fffffff]
[    3.328965]   Device   empty
[    3.328969] Movable zone start for each node
[    3.328974] Early memory node ranges
[    3.328977]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
[    3.328982]   node   0: [mem 0x0000000000100000-0x00000000695bdfff]
[    3.328987]   node   0: [mem 0x000000006ed11000-0x000000006fffffff]
[    3.328990]   node   0: [mem 0x0000000100000000-0x000000107fffffff]
[    3.329003] Initmem setup node 0 [mem 0x0000000000001000-0x000000107fffffff]
[    3.329013] On node 0, zone DMA: 1 pages in unavailable ranges
[    3.329042] On node 0, zone DMA: 128 pages in unavailable ranges
[    3.332019] On node 0, zone DMA32: 22355 pages in unavailable ranges
[    3.431745] p2m virtual area at (____ptrval____), size is 40000000
[    4.989453] Remapped 612307 page(s)
[    4.990215] ACPI: PM-Timer IO Port: 0x508
[    4.990413] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    4.990442] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    4.990498] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    4.990512] IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
[    4.990529] IOAPIC[2]: apic_id 10, version 32, address 0xfec08000, GSI 32-39
[    4.990543] IOAPIC[3]: apic_id 11, version 32, address 0xfec10000, GSI 40-47
[    4.990557] IOAPIC[4]: apic_id 12, version 32, address 0xfec18000, GSI 48-55
[    4.990603] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    4.990609] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    4.990699] ACPI: Using ACPI (MADT) for SMP configuration information
[    4.990706] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    4.996414] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    4.996446] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    4.996452] PM: hibernation: Registered nosave memory: [mem 0x00080000-0x000fffff]
[    4.996457] PM: hibernation: Registered nosave memory: [mem 0x695be000-0x6be46fff]
[    4.996461] PM: hibernation: Registered nosave memory: [mem 0x6be47000-0x6bf01fff]
[    4.996465] PM: hibernation: Registered nosave memory: [mem 0x6bf02000-0x6ca0bfff]
[    4.996469] PM: hibernation: Registered nosave memory: [mem 0x6ca0c000-0x6ed10fff]
[    4.996474] PM: hibernation: Registered nosave memory: [mem 0x70000000-0x8fffffff]
[    4.996477] PM: hibernation: Registered nosave memory: [mem 0x90000000-0xaaffbfff]
[    4.996481] PM: hibernation: Registered nosave memory: [mem 0xaaffc000-0xaaffcfff]
[    4.996485] PM: hibernation: Registered nosave memory: [mem 0xaaffd000-0xc5ffbfff]
[    4.996489] PM: hibernation: Registered nosave memory: [mem 0xc5ffc000-0xc5ffcfff]
[    4.996492] PM: hibernation: Registered nosave memory: [mem 0xc5ffd000-0xe0ffbfff]
[    4.996496] PM: hibernation: Registered nosave memory: [mem 0xe0ffc000-0xe0ffcfff]
[    4.996500] PM: hibernation: Registered nosave memory: [mem 0xe0ffd000-0xfbffbfff]
[    4.996503] PM: hibernation: Registered nosave memory: [mem 0xfbffc000-0xfbffcfff]
[    4.996507] PM: hibernation: Registered nosave memory: [mem 0xfbffd000-0xfcffffff]
[    4.996511] PM: hibernation: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
[    4.996515] PM: hibernation: Registered nosave memory: [mem 0xfe800000-0xfebfffff]
[    4.996518] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec01fff]
[    4.996522] PM: hibernation: Registered nosave memory: [mem 0xfec02000-0xfec07fff]
[    4.996526] PM: hibernation: Registered nosave memory: [mem 0xfec08000-0xfec08fff]
[    4.996530] PM: hibernation: Registered nosave memory: [mem 0xfec09000-0xfec0ffff]
[    4.996533] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    4.996537] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0xfec17fff]
[    4.996595] PM: hibernation: Registered nosave memory: [mem 0xfec18000-0xfec18fff]
[    4.996602] PM: hibernation: Registered nosave memory: [mem 0xfec19000-0xfed1ffff]
[    4.996605] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed44fff]
[    4.996609] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0xfedfffff]
[    4.996613] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    4.996617] PM: hibernation: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    4.996620] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    4.996625] [mem 0xaaffd000-0xc5ffbfff] available for PCI devices
[    4.996636] Booting kernel on Xen
[    4.996639] Xen version: 4.18.4-pre (preserve-AD)
[    4.996645] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    4.996661] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    4.997254] percpu: Embedded 86 pages/cpu s229376 r8192 d114688 u524288
[    4.997354] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
[    4.997360] Kernel command line: console=hvc0 console=tty1 earlyprintk=xen xen-pciback.passthrough=1 oops=panic panic=15 root=/dev/loop0 ro rootfstype=ext4 zyimage=zvol:xvda1@ref9000000 zyoverlay pstore.backend=efi libata.fua=1 audit=1 nohz=off consoleblank=0
[    4.997562] audit: enabled (after initialization)
[    4.997588] Unknown kernel command line parameters "zyoverlay zyimage=zvol:xvda1@ref9000000", will be passed to user space.
[    4.997605] random: crng init done
[    5.003861] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
[    5.007013] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    5.007992] Fallback order for Node 0: 0 
[    5.007998] Built 1 zonelists, mobility grouping on.  Total pages: 16428410
[    5.008006] Policy zone: Normal
[    5.008017] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    5.008023] software IO TLB: area num 8.
[    5.286869] Memory: 64152948K/66756784K available (22528K kernel code, 4438K rwdata, 13984K rodata, 4972K init, 4740K bss, 2603584K reserved, 0K cma-reserved)
[    5.289202] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    5.290452] ftrace: allocating 57924 entries in 227 pages
[    5.304210] ftrace: allocated 227 pages with 5 groups
[    5.305587] Dynamic Preempt: voluntary
[    5.305900] rcu: Preemptible hierarchical RCU implementation.
[    5.305904] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    5.305909] 	Trampoline variant of Tasks RCU enabled.
[    5.305912] 	Rude variant of Tasks RCU enabled.
[    5.305915] 	Tracing variant of Tasks RCU enabled.
[    5.305918] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    5.305922] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    5.317939] NR_IRQS: 524544, nr_irqs: 1032, preallocated irqs: 16
[    5.318172] xen:events: Using FIFO-based ABI
[    5.318321] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    5.318444] Console: colour dummy device 80x25
[    5.318451] printk: legacy console [tty1] enabled
[    5.318458] printk: legacy bootconsole [xenboot0] disabled
[    5.318467] printk: legacy console [hvc0] enabled
[    5.320045] ACPI: Core revision 20230628
[    5.372962] ACPI BIOS Warning (bug): Incorrect checksum in table [BGRT] - 0x18, should be 0xFFFFFFAE (20230628/utcksum-58)
[    5.373735] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    5.373759] installing Xen timer for CPU 0
[    5.373807] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fa32c1de86, max_idle_ns: 440795251159 ns
[    5.373826] Calibrating delay loop (skipped), value calculated using timer frequency.. 4389.68 BogoMIPS (lpj=2194844)
[    5.373997] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    5.374007] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    5.374024] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    5.374041] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on vm exit
[    5.374053] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall
[    5.374065] Spectre V2 : Mitigation: IBRS
[    5.374074] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    5.374088] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    5.374100] RETBleed: Mitigation: IBRS
[    5.374110] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    5.374126] Spectre V2 : User space: Mitigation: STIBP via prctl
[    5.374140] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    5.374164] MDS: Mitigation: Clear CPU buffers
[    5.374174] TAA: Mitigation: Clear CPU buffers
[    5.374184] MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
[    5.374198] GDS: Unknown: Dependent on hypervisor status
[    5.374235] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    5.374250] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    5.374262] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    5.374275] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    5.374287] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    5.374299] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    5.374312] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    5.374325] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    5.374337] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    5.374350] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    5.374362] x86/fpu: Enabled xstate features 0xe7, context size is 2432 bytes, using 'compacted' format.
[    5.427064] Freeing SMP alternatives memory: 48K
[    5.427082] pid_max: default: 32768 minimum: 301
[    5.427193] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,integrity
[    5.427239] landlock: Up and running.
[    5.427247] Yama: becoming mindful.
[    5.427315] AppArmor: AppArmor initialized
[    5.427468] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    5.427574] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    5.428316] cpu 0 spinlock event irq 57
[    5.428335] VPMU disabled by hypervisor.
[    5.428835] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1.
[    5.428891] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1.
[    5.428946] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1.
[    5.429047] Performance Events: unsupported p6 CPU model 85 no PMU driver, software events only.
[    5.429067] signal: max sigframe size: 3632
[    5.429156] rcu: Hierarchical SRCU implementation.
[    5.429167] rcu: 	Max phase no-delay instances is 400.
[    5.436375] NMI watchdog: Perf NMI watchdog permanently disabled
[    5.436603] smp: Bringing up secondary CPUs ...
[    5.436939] installing Xen timer for CPU 1
[    5.437365] installing Xen timer for CPU 2
[    5.437764] installing Xen timer for CPU 3
[    5.438160] installing Xen timer for CPU 4
[    5.438536] installing Xen timer for CPU 5
[    5.438937] installing Xen timer for CPU 6
[    5.439360] installing Xen timer for CPU 7
[    5.439480] cpu 1 spinlock event irq 97
[    5.439983] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    5.440009] TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
[    5.440034] MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
[    5.440919] cpu 2 spinlock event irq 98
[    5.440937] cpu 3 spinlock event irq 99
[    5.441897] cpu 4 spinlock event irq 100
[    5.441913] cpu 5 spinlock event irq 101
[    5.441913] cpu 6 spinlock event irq 102
[    5.441915] cpu 7 spinlock event irq 103
[    5.443007] smp: Brought up 1 node, 8 CPUs
[    5.443021] smpboot: Max logical packages: 1
[    5.446832] devtmpfs: initialized
[    5.446902] x86/mm: Memory block size: 2048MB
[    5.448277] ACPI: PM: Registering ACPI NVS region [mem 0x6bf02000-0x6ca0bfff] (11575296 bytes)
[    5.448277] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    5.448300] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    5.448920] pinctrl core: initialized pinctrl subsystem
[    5.449127] PM: RTC time: 14:28:18, date: 2024-12-02
[    5.451890] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    5.451938] xen:grant_table: Grant tables using version 1 layout
[    5.451979] Grant table initialized
[    5.452797] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    5.453506] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    5.453869] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    5.453912] audit: initializing netlink subsys (enabled)
[    5.453949] audit: type=2000 audit(1733149697.639:1): state=initialized audit_enabled=1 res=1
[    5.453973] thermal_sys: Registered thermal governor 'fair_share'
[    5.453973] thermal_sys: Registered thermal governor 'bang_bang'
[    5.453981] thermal_sys: Registered thermal governor 'step_wise'
[    5.453993] thermal_sys: Registered thermal governor 'user_space'
[    5.454004] thermal_sys: Registered thermal governor 'power_allocator'
[    5.454024] EISA bus registered
[    5.454079] Detected 1 PCC Subspaces
[    5.454087] Registering PCC driver as Mailbox controller
[    5.454263] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    5.454278] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    5.455114] PCI: ECAM [mem 0x80000000-0x8fffffff] (base 0x80000000) for domain 0000 [bus 00-ff]
(XEN) d0: Forcing write emulation on MFNs 80000-8ffff
[    5.556707] PCI: Using configuration type 1 for base access
[    5.557360] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    5.558845] fbcon: Taking over console
[    5.558934] ACPI: Added _OSI(Module Device)
[    5.558944] ACPI: Added _OSI(Processor Device)
[    5.558954] ACPI: Added _OSI(3.0 _SCP Extensions)
[    5.558964] ACPI: Added _OSI(Processor Aggregator Device)
[    5.691303] ACPI: 4 ACPI AML tables successfully acquired and loaded
[    5.698536] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    5.711068] ACPI: Dynamic OEM Table Load:
[    5.733243] ACPI: Dynamic OEM Table Load:
[    5.814951] ACPI: _OSC evaluated successfully for all CPUs
[    5.816015] ACPI: Interpreter enabled
[    5.816054] ACPI: PM: (supports S0 S4 S5)
[    5.816064] ACPI: Using IOAPIC for interrupt routing
[    5.824611] HEST: Table parsing has been initialized.
[    5.824863] GHES: APEI firmware first mode is enabled by APEI bit and WHEA _OSC.
[    5.824894] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    5.824916] PCI: Ignoring E820 reservations for host bridge windows
[    5.826371] ACPI: Enabled 6 GPEs in block 00 to 7F
[    5.899650] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-15])
[    5.899675] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    5.899844] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR DPC]
[    5.900123] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    5.900139] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    5.902195] PCI host bridge to bus 0000:00
[    5.902206] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    5.902220] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    5.902233] pci_bus 0000:00: root bus resource [io  0x03b0-0x03bb window]
[    5.902245] pci_bus 0000:00: root bus resource [io  0x03c0-0x03df window]
[    5.902258] pci_bus 0000:00: root bus resource [io  0x1000-0x3fff window]
[    5.902270] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    5.902284] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[    5.902298] pci_bus 0000:00: root bus resource [mem 0xfe010000-0xfe010fff window]
[    5.902312] pci_bus 0000:00: root bus resource [mem 0x90000000-0xaaffffff window]
[    5.902326] pci_bus 0000:00: root bus resource [mem 0x380000000000-0x383fffffffff window]
[    5.902341] pci_bus 0000:00: root bus resource [bus 00-15]
[    5.902426] pci 0000:00:00.0: [8086:2020] type 00 class 0x060000 PCIe Root Port
(XEN) PCI add device 0000:00:00.0
[    5.903895] pci 0000:00:04.0: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.903984] pci 0000:00:04.0: BAR 0 [mem 0x383ffff1c000-0x383ffff1ffff 64bit]
(XEN) PCI add device 0000:00:04.0
[    5.904452] pci 0000:00:04.1: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.904539] pci 0000:00:04.1: BAR 0 [mem 0x383ffff18000-0x383ffff1bfff 64bit]
(XEN) PCI add device 0000:00:04.1
[    5.905046] pci 0000:00:04.2: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.905133] pci 0000:00:04.2: BAR 0 [mem 0x383ffff14000-0x383ffff17fff 64bit]
(XEN) PCI add device 0000:00:04.2
[    5.905593] pci 0000:00:04.3: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.905679] pci 0000:00:04.3: BAR 0 [mem 0x383ffff10000-0x383ffff13fff 64bit]
(XEN) PCI add device 0000:00:04.3
[    5.906160] pci 0000:00:04.4: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.906272] pci 0000:00:04.4: BAR 0 [mem 0x383ffff0c000-0x383ffff0ffff 64bit]
(XEN) PCI add device 0000:00:04.4
[    5.906731] pci 0000:00:04.5: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.906817] pci 0000:00:04.5: BAR 0 [mem 0x383ffff08000-0x383ffff0bfff 64bit]
(XEN) PCI add device 0000:00:04.5
[    5.907281] pci 0000:00:04.6: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.907368] pci 0000:00:04.6: BAR 0 [mem 0x383ffff04000-0x383ffff07fff 64bit]
(XEN) PCI add device 0000:00:04.6
[    5.907884] pci 0000:00:04.7: [8086:2021] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
[    5.907970] pci 0000:00:04.7: BAR 0 [mem 0x383ffff00000-0x383ffff03fff 64bit]
(XEN) PCI add device 0000:00:04.7
[    5.908421] pci 0000:00:05.0: [8086:2024] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
(XEN) PCI add device 0000:00:05.0
[    5.908849] pci 0000:00:05.2: [8086:2025] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
(XEN) PCI add device 0000:00:05.2
[    5.909329] pci 0000:00:05.4: [8086:2026] type 00 class 0x080020 PCIe Root Complex Integrated Endpoint
[    5.909405] pci 0000:00:05.4: BAR 0 [mem 0xaa21a000-0xaa21afff]
(XEN) PCI add device 0000:00:05.4
[    5.910522] pci 0000:00:08.0: [8086:2014] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
(XEN) PCI add device 0000:00:08.0
[    5.910952] pci 0000:00:08.1: [8086:2015] type 00 class 0x110100 conventional PCI endpoint
(XEN) PCI add device 0000:00:08.1
[    5.911272] pci 0000:00:08.2: [8086:2016] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
(XEN) PCI add device 0000:00:08.2
[    5.914094] pci 0000:00:11.0: [8086:a1ec] type 00 class 0xff0000 conventional PCI endpoint
(XEN) PCI add device 0000:00:11.0
[    5.914514] pci 0000:00:11.5: [8086:a1d2] type 00 class 0x010601 conventional PCI endpoint
[    5.914598] pci 0000:00:11.5: BAR 0 [mem 0xaa216000-0xaa217fff]
[    5.914648] pci 0000:00:11.5: BAR 1 [mem 0xaa219000-0xaa2190ff]
[    5.914698] pci 0000:00:11.5: BAR 2 [io  0x3070-0x3077]
[    5.914746] pci 0000:00:11.5: BAR 3 [io  0x3060-0x3063]
[    5.914795] pci 0000:00:11.5: BAR 4 [io  0x3020-0x303f]
[    5.914846] pci 0000:00:11.5: BAR 5 [mem 0xaa180000-0xaa1fffff]
[    5.915048] pci 0000:00:11.5: PME# supported from D3hot
(XEN) PCI add device 0000:00:11.5
[    5.916341] pci 0000:00:14.0: [8086:a1af] type 00 class 0x0c0330 conventional PCI endpoint
[    5.916447] pci 0000:00:14.0: BAR 0 [mem 0xaa200000-0xaa20ffff 64bit]
[    5.916771] pci 0000:00:14.0: PME# supported from D3hot D3cold
(XEN) PCI add device 0000:00:14.0
[    5.917480] pci 0000:00:14.2: [8086:a1b1] type 00 class 0x118000 conventional PCI endpoint
[    5.917587] pci 0000:00:14.2: BAR 0 [mem 0x383ffff23000-0x383ffff23fff 64bit]
(XEN) PCI add device 0000:00:14.2
[    5.918408] pci 0000:00:16.0: [8086:a1ba] type 00 class 0x078000 conventional PCI endpoint
[    5.918525] pci 0000:00:16.0: BAR 0 [mem 0x383ffff22000-0x383ffff22fff 64bit]
[    5.918925] pci 0000:00:16.0: PME# supported from D3hot
(XEN) PCI add device 0000:00:16.0
[    5.919149] pci 0000:00:16.1: [8086:a1bb] type 00 class 0x078000 conventional PCI endpoint
[    5.919259] pci 0000:00:16.1: BAR 0 [mem 0x383ffff21000-0x383ffff21fff 64bit]
[    5.919603] pci 0000:00:16.1: PME# supported from D3hot
(XEN) PCI add device 0000:00:16.1
[    5.919834] pci 0000:00:16.4: [8086:a1be] type 00 class 0x078000 conventional PCI endpoint
[    5.920002] pci 0000:00:16.4: BAR 0 [mem 0x383ffff20000-0x383ffff20fff 64bit]
[    5.920346] pci 0000:00:16.4: PME# supported from D3hot
(XEN) PCI add device 0000:00:16.4
[    5.920590] pci 0000:00:17.0: [8086:a182] type 00 class 0x010601 conventional PCI endpoint
[    5.920673] pci 0000:00:17.0: BAR 0 [mem 0xaa214000-0xaa215fff]
[    5.920723] pci 0000:00:17.0: BAR 1 [mem 0xaa218000-0xaa2180ff]
[    5.920773] pci 0000:00:17.0: BAR 2 [io  0x3050-0x3057]
[    5.920821] pci 0000:00:17.0: BAR 3 [io  0x3040-0x3043]
[    5.920872] pci 0000:00:17.0: BAR 4 [io  0x3000-0x301f]
[    5.920920] pci 0000:00:17.0: BAR 5 [mem 0xaa100000-0xaa17ffff]
[    5.921122] pci 0000:00:17.0: PME# supported from D3hot
(XEN) PCI add device 0000:00:17.0
[    5.922991] pci 0000:00:1c.0: [8086:a190] type 01 class 0x060400 PCIe Root Port
[    5.923150] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    5.923439] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
(XEN) PCI add device 0000:00:1c.0
[    5.924884] pci 0000:00:1c.4: [8086:a194] type 01 class 0x060400 PCIe Root Port
[    5.925043] pci 0000:00:1c.4: PCI bridge to [bus 02-03]
[    5.925066] pci 0000:00:1c.4:   bridge window [io  0x2000-0x2fff]
[    5.925087] pci 0000:00:1c.4:   bridge window [mem 0xa9000000-0xaa0fffff]
[    5.925351] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
(XEN) PCI add device 0000:00:1c.4
[    5.926839] pci 0000:00:1d.0: [8086:a198] type 01 class 0x060400 PCIe Root Port
[    5.927003] pci 0000:00:1d.0: PCI bridge to [bus 04]
[    5.927292] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
(XEN) PCI add device 0000:00:1d.0
[    5.928997] pci 0000:00:1f.0: [8086:a1c8] type 00 class 0x060100 conventional PCI endpoint
(XEN) PCI add device 0000:00:1f.0
[    5.929858] pci 0000:00:1f.2: [8086:a1a1] type 00 class 0x058000 conventional PCI endpoint
[    5.929928] pci 0000:00:1f.2: BAR 0 [mem 0xaa210000-0xaa213fff]
(XEN) PCI add device 0000:00:1f.2
[    5.930589] pci 0000:00:1f.4: [8086:a1a3] type 00 class 0x0c0500 conventional PCI endpoint
[    5.930699] pci 0000:00:1f.4: BAR 0 [mem 0xaafff000-0xaafff0ff 64bit]
[    5.930824] pci 0000:00:1f.4: BAR 4 [io  0x3fe0-0x3fff]
(XEN) PCI add device 0000:00:1f.4
[    5.931153] pci 0000:00:1f.5: [8086:a1a4] type 00 class 0x0c8000 conventional PCI endpoint
[    5.931236] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
(XEN) PCI add device 0000:00:1f.5
[    5.932051] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    5.932359] pci 0000:02:00.0: [1a03:1150] type 01 class 0x060400 PCIe to PCI/PCI-X bridge
[    5.932530] pci 0000:02:00.0: PCI bridge to [bus 03]
[    5.932563] pci 0000:02:00.0:   bridge window [io  0x2000-0x2fff]
[    5.932584] pci 0000:02:00.0:   bridge window [mem 0xa9000000-0xaa0fffff]
[    5.932694] pci 0000:02:00.0: enabling Extended Tags
[    5.932902] pci 0000:02:00.0: supports D1 D2
[    5.932912] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
(XEN) PCI add device 0000:02:00.0
[    5.933200] pci 0000:00:1c.4: PCI bridge to [bus 02-03]
[    5.933376] pci_bus 0000:03: extended config space not accessible
[    5.933460] pci 0000:03:00.0: [1a03:2000] type 00 class 0x030000 conventional PCI endpoint
[    5.933551] pci 0000:03:00.0: BAR 0 [mem 0xa9000000-0xa9ffffff]
[    5.933605] pci 0000:03:00.0: BAR 1 [mem 0xaa000000-0xaa01ffff]
[    5.933660] pci 0000:03:00.0: BAR 2 [io  0x2000-0x207f]
[    5.933946] pci 0000:03:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    5.934083] pci 0000:03:00.0: supports D1 D2
[    5.934094] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
(XEN) PCI add device 0000:03:00.0
[    5.943505] pci 0000:02:00.0: PCI bridge to [bus 03]
[    5.944016] pci 0000:00:1d.0: PCI bridge to [bus 04]
[    5.945980] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 16-63])
[    5.945999] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    5.946919] acpi PNP0A08:01: _OSC: platform does not support [SHPCHotplug AER LTR DPC]
[    5.947743] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    5.947758] acpi PNP0A08:01: FADT indicates ASPM is unsupported, using BIOS configuration
[    5.948321] PCI host bridge to bus 0000:16
[    5.948332] pci_bus 0000:16: root bus resource [io  0x4000-0x7fff window]
[    5.948345] pci_bus 0000:16: root bus resource [mem 0xab000000-0xc5ffffff window]
[    5.948360] pci_bus 0000:16: root bus resource [mem 0x384000000000-0x387fffffffff window]
[    5.948375] pci_bus 0000:16: root bus resource [bus 16-63]
[    5.949909] pci 0000:16:05.0: [8086:2034] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
(XEN) PCI add device 0000:16:05.0
[    5.950395] pci 0000:16:05.2: [8086:2035] type 00 class 0x088000 PCIe Root Complex Integrated Endpoint
(XEN) PCI add device 0000:16:05.2
[    5.950818] pci 0000:16:05.4: [8086:2036] type 00 class 0x080020 PCIe Root Complex Integrated Endpoint
[    5.950896] pci 0000:16:05.4: BAR 0 [mem 0xc5f00000-0xc5f00fff]
(XEN) PCI add device 0000:16:05.4
[    5.951991] pci 0000:16:08.0: [8086:208d] type 00 class 0x088000 conventional PCI endpoint
(XEN) PCI add device 0000:16:08.0
[    5.952334] pci 0000:16:08.1: [8086:208d] type 00 class 0x088000 conventional PCI endpoint
(XEN) PCI ad[    8.192912] Freeing initrd memory: 142708K
[    8.216252] Segment Routing with IPv6
[    8.216279] In-situ OAM (IOAM) with IPv6
[    8.216326] NET: Registered PF_PACKET protocol family
[    8.216446] Key type dns_resolver registered
[    8.217127] mce: Unable to init device /dev/mcelog, already registered
[    8.217270] No MBM correction factor available
[    8.217308] IPI shorthand broadcast: enabled
[    8.219651] sched_clock: Marking stable (8164005079, 55497260)->(8269941226, -50438887)
[    8.220122] registered taskstats version 1
[    8.220813] Loading compiled-in X.509 certificates
[    8.221521] Loaded X.509 cert 'Build time autogenerated kernel key: 92155ebfc585c501e81f1546047dc047a265b1ca'
[    8.222096] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
[    8.222669] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
[    8.222685] blacklist: Loading compiled-in revocation X.509 certificates
[    8.222718] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    8.222748] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
[    8.222778] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
[    8.222809] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
[    8.222839] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
[    8.222869] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
[    8.222902] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
[    8.222934] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
[    8.227860] Key type .fscrypt registered
[    8.227871] Key type fscrypt-provisioning registered
[    8.283930] Key type encrypted registered
[    8.283958] AppArmor: AppArmor sha256 policy hashing enabled
[    8.283972] audit: type=1400 audit(1733149701.476:5): apparmor="STATUS" info="AppArmor sha256 policy hashing enabled" pid=1 comm="swapper/0"
[    8.284774] ima: No TPM chip found, activating TPM-bypass!
[    8.284790] Loading compiled-in module X.509 certificates
[    8.285375] Loaded X.509 cert 'Build time autogenerated kernel key: 92155ebfc585c501e81f1546047dc047a265b1ca'
[    8.285391] ima: Allocated hash algorithm: sha256
[    8.285409] ima: No architecture policies found
[    8.285429] evm: Initialising EVM extended attributes:
[    8.285437] evm: security.selinux
[    8.285444] evm: security.SMACK64
[    8.285450] evm: security.SMACK64EXEC
[    8.285457] evm: security.SMACK64TRANSMUTE
[    8.285463] evm: security.SMACK64MMAP
[    8.285470] evm: security.apparmor
[    8.285476] evm: security.ima
[    8.285482] evm: security.capability
[    8.285488] evm: HMAC attrs: 0x1
[    8.286126] PM:   Magic number: 4:597:484
[    8.286423] BIOS EDD facility v0.16 2004-Jun-25, 2 devices found
[    8.286819] audit: type=1334 audit(1733149701.479:6): prog-id=1 op=LOAD
[    8.287838] audit: type=1334 audit(1733149701.480:7): prog-id=2 op=LOAD
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v2 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v3 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v4 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v5 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v6 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d0v7 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
[    8.293414] RAS: Correctable Errors collector initialized.
[    8.293550] clk: Disabling unused clocks
[    8.295821] Freeing unused decrypted memory: 2028K
[    8.298655] Freeing unused kernel image (initmem) memory: 4972K
[    8.298669] Write protecting the kernel read-only data: 36864k
[    8.321247] Freeing unused kernel image (rodata/data gap) memory: 352K
[   10.189159] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[   10.189265] Run /init as init process
[   10.189694] audit: type=1334 audit(1733149703.382:8): prog-id=1 op=UNLOAD
[   10.756089] Already setup the GSI :16
[   10.756386] xhci_hcd 0000:00:14.0: xHCI Host Controller
[   10.756536] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[   10.757196] Already setup the GSI :16
[   10.757724] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000009810
[   10.758323] xhci_hcd 0000:00:14.0: xHCI Host Controller
[   10.758341] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[   10.758359] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[   10.758548] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[   10.758574] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   10.758589] usb usb1: Product: xHCI Host Controller
[   10.758600] usb usb1: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[   10.758613] usb usb1: SerialNumber: 0000:00:14.0
[   10.758913] hub 1-0:1.0: USB hub found
[   10.758953] hub 1-0:1.0: 16 ports detected
[   10.761546] ast 0000:03:00.0: vgaarb: deactivate vga console
[   10.761860] Already setup the GSI :16
[   10.762165] Already setup the GSI :16
[   10.762280] ast 0000:03:00.0: Using default configuration
[   10.762292] ast 0000:03:00.0: AST 2500 detected
[   10.762381] ast 0000:03:00.0: [drm] Using analog VGA
[   10.762394] ast 0000:03:00.0: [drm] dram MCLK=800 Mhz type=1 bus_width=16
[   10.763044] Already setup the GSI :16
[   10.763379] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   10.763477] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   10.767898] ahci 0000:00:11.5: AHCI 0001.0301 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
[   10.767922] ahci 0000:00:11.5: flags: 64bit ncq sntf led clo only pio slum part ems deso sadm sds apst 
[   10.769610] [drm] Initialized ast 0.1.0 20120228 for 0000:03:00.0 on minor 0
[   10.774453] fbcon: astdrmfb (fb0) is primary device
[   10.779016] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.08
[   10.779024] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   10.779027] usb usb2: Product: xHCI Host Controller
[   10.779031] usb usb2: Manufacturer: Linux 6.8.0-48-generic xhci-hcd
[   10.779034] usb usb2: SerialNumber: 0000:00:14.0
[   10.779414] hub 2-0:1.0: USB hub found
[   10.779475] hub 2-0:1.0: 10 ports detected
[   10.787044] scsi host0: ahci
[   10.787383] scsi host1: ahci
[   10.787686] scsi host2: ahci
[   10.787955] scsi host3: ahci
[   10.788232] scsi host4: ahci
[   10.788589] scsi host5: ahci
[   10.788650] ata1: SATA max UDMA/133 abar m524288@0xaa180000 port 0xaa180100 irq 113 lpm-pol 0
[   10.788654] ata2: SATA max UDMA/133 abar m524288@0xaa180000 port 0xaa180180 irq 113 lpm-pol 0
[   10.788658] ata3: SATA max UDMA/133 abar m524288@0xaa180000 port 0xaa180200 irq 113 lpm-pol 0
[   10.788662] ata4: SATA max UDMA/133 abar m524288@0xaa180000 port 0xaa180280 irq 113 lpm-pol 0
[   10.788664] ata5: SATA max UDMA/133 abar m524288@0xaa180000 port 0xaa180300 irq 113 lpm-pol 0
[   10.788666] ata6: SATA max UDMA/133 abar m524288@0xaa180000 port 0xaa180380 irq 113 lpm-pol 0
[   10.789254] Already setup the GSI :16
[   10.789799] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   10.789804] ahci 0000:00:17.0: flags: 64bit ncq sntf led clo only pio slum part ems deso sadm sds apst 
[   10.789961] Console: switching to colour frame buffer device 128x48
[   10.804624] pstore: backend 'efi' already in use: ignoring 'efi_pstore'
[   10.814834] scsi host6: ahci
[   10.815192] scsi host7: ahci
[   10.815533] scsi host8: ahci
[   10.815542] ast 0000:03:00.0: [drm] fb0: astdrmfb frame buffer device
[   10.816436] scsi host9: ahci
[   10.817897] scsi host10: ahci
[   10.818559] scsi host11: ahci
[   10.819184] scsi host12: ahci
[   10.819861] scsi host13: ahci
[   10.820335] ata7: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100100 irq 115 lpm-pol 0
[   10.820690] ata8: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100180 irq 115 lpm-pol 0
[   10.821003] ata9: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100200 irq 115 lpm-pol 0
[   10.821310] ata10: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100280 irq 115 lpm-pol 0
[   10.821644] ata11: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100300 irq 115 lpm-pol 0
[   10.821954] ata12: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100380 irq 115 lpm-pol 0
[   10.822284] ata13: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100400 irq 115 lpm-pol 0
[   10.822630] ata14: SATA max UDMA/133 abar m524288@0xaa100000 port 0xaa100480 irq 115 lpm-pol 0
[   10.835551] i2c i2c-0: 2/4 memory slots populated (from DMI)
[   11.016590] usb 1-3: new high-speed USB device number 2 using xhci_hcd
[   11.100205] ata4: SATA link down (SStatus 0 SControl 300)
[   11.100709] ata3: SATA link down (SStatus 0 SControl 300)
[   11.101259] ata5: SATA link down (SStatus 0 SControl 300)
[   11.101869] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[   11.102389] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[   11.102860] ata6: SATA link down (SStatus 0 SControl 300)
[   11.103359] ata2.00: supports DRM functions and may not be fully accessible
[   11.103651] ata2.00: ATA-11: SAMSUNG MZ7L31T9HBLT-00A07, JXTC304Q, max UDMA/133
[   11.103914] ata1.00: supports DRM functions and may not be fully accessible
[   11.104179] ata1.00: ATA-11: SAMSUNG MZ7L31T9HBLT-00A07, JXTC304Q, max UDMA/133
[   11.105368] ata2.00: 3750748848 sectors, multi 16: LBA48 NCQ (depth 32), AA
[   11.105683] ata1.00: 3750748848 sectors, multi 16: LBA48 NCQ (depth 32), AA
[   11.109414] ata2.00: Features: FUA Trust NCQ-sndrcv
[   11.109723] ata1.00: Features: FUA Trust NCQ-sndrcv
[   11.110370] ata2.00: supports DRM functions and may not be fully accessible
[   11.110676] ata1.00: supports DRM functions and may not be fully accessible
[   11.115835] ata2.00: configured for UDMA/133
[   11.116137] ata1.00: configured for UDMA/133
[   11.116634] scsi 0:0:0:0: Direct-Access     ATA      SAMSUNG MZ7L31T9 304Q PQ: 0 ANSI: 5
[   11.117489] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   11.117623] sd 0:0:0:0: [sda] 3750748848 512-byte logical blocks: (1.92 TB/1.75 TiB)
[   11.118111] scsi 1:0:0:0: Direct-Access     ATA      SAMSUNG MZ7L31T9 304Q PQ: 0 ANSI: 5
[   11.118133] sd 0:0:0:0: [sda] 4096-byte physical blocks
[   11.118836] sd 0:0:0:0: [sda] Write Protect is off
[   11.118917] sd 1:0:0:0: Attached scsi generic sg1 type 0
[   11.118990] sd 1:0:0:0: [sdb] 3750748848 512-byte logical blocks: (1.92 TB/1.75 TiB)
[   11.118994] sd 1:0:0:0: [sdb] 4096-byte physical blocks
[   11.119007] sd 1:0:0:0: [sdb] Write Protect is off
[   11.119032] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
[   11.119086] sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
[   11.121269] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
[   11.121796] sd 0:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[   11.122123]  sdb: sdb1 sdb2 sdb3 sdb4 sdb5 sdb6
[   11.124617]  sda: sda1 sda2 sda3 sda4 sda5 sda6
[   11.126455] sd 0:0:0:0: [sda] supports TCG Opal
[   11.126491] sd 1:0:0:0: [sdb] supports TCG Opal
[   11.126788] sd 0:0:0:0: [sda] Attached SCSI disk
[   11.127089] sd 1:0:0:0: [sdb] Attached SCS0)
[   11.133737] ata11: SATA link down (SStatus 0 SControl 300)
[   11.134313] ata9: SATA link down (SStatus 0 SControl 300)
[   11.134831] ata7: SATA link down (SStatus 0 SControl 300)
[   11.135394] ata13: SATA link down (SStatus 0 SControl 300)
[   11.135852] ata12: SATA link down (SStatus 0 SControl 300)
[   11.136674] ata8: SATA link down (SStatus 0 SControl 300)
[   11.153304] usb 1-3: New USB device found, idVendor=0557, idProduct=7000, bcdDevice= 0.00
[   11.153664] usb 1-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   11.157055] hub 1-3:1.0: USB hub found
[   11.157630] hub 1-3:1.0: 4 ports detected
[   11.272538] usb 1-4: new high-speed USB device number 3 using xhci_hcd
[   11.407524] raid6:.409419] usb 1-4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[   11.409786] usb 1-4: Product: USB2.0 Hub
[   11.411340] hub 1-4:1.0: USB hub found
[   11.411997] hub 1-4:1.0: 4 ports detected
[   11.424519] raid6: avx512x2 gen() 40218 MB/s
[   11.441518] raid6: avx512x1 gen() 36952 MB/s
[   11.458522] raid6: avx2x4   gen() 28067 MB/s
[   11.475527] raid6: avx2x2   gen() 27585 MB/s
[   11.483539] usb 1-3.1: new low-speed USB device number 4 using xhci_hcd
[   11.492517] raid6: avx2x1   gen() 22404 MB/s
[   11.492863] raid6: using algorithm avx512x4 gen() 40300 MB/s
[   11.509533] raid6: .... xor() 7374 MB/s, rmw enabled
[   11.509870] raid6: using avx512x2 recovery algorithm
[   11.511775] xor: automatically using best checksumming function   avx       
[   11.513806] async_tx: api initialized (async)
[   11.562577] md/raid1:mdX: active with 2 out of 2 mirrors
[   11.570641] md/raid1:mdX: active with 2 out of 2 mirrors
[   11.577003] usb 1-3.1: New USB device found, idVendor=0557, idProduct=2419, bcdDevice= 1.00
[   11.577485] usb 1-3.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   11.609086] hid: raw HID events driver (C) Jiri Kosina
[   11.619807] usbcore: registered new interface driver usbhid
[   11.620239] usbhid: USB HID core driver
[   11.624477] input: HID 0557:2419 as /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.1/1-3.1:1.0/0003:0557:2419.0001/input/input1
[   11.677710] hid-generic 0003:0557:2419.0001: input,hidraw0: USB HID v1.00 Keyboard [HID 0557:2419] on usb-0000:00:14.0-3.1/input0
[   11.678738] input: HID 0557:2419 as /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.1/1-3.1:1.1/0003:0557:2419.0002/input/input2
[   11.679678] hid-generic 0003:0557:2419.0002: input,hidraw1: USB HID v1.00 Mouse [HID 0557:2419] on usb-0000:00:14.0-3.1/input1
[   11.687543] usb 1-4.2: new high-speed USB device number 5 using xhci_hcd
[   11.767695] usb 1-4.2: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=32.98
[   11.768254] usb 1-4.2: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[   11.768699] usb 1-4.2: Product: USB2.0 Hub
[   11.771520] hub 1-4.2:1.0: USB hub found
[   11.772354] hub 1-4.2:1.0: 4 ports detected
[   11.911564] aufs 6.8-20240923
[   11.947637] spl: loading out-of-tree module taints kernel.
[   11.948478] spl: module verification failed: signature and/or required key missing - tainting kernel
[   12.008615] zfs: module license 'CDDL' taints kernel.
[   12.009116] Disabling lock debugging due to kernel taint
[   12.009571] zfs: module license taints kernel.
[   14.051380] ZFS: Loaded module v2.2.6-8_gb67a69748a, ZFS pool version 5000, ZFS filesystem version 5
[   14.062528] zram: Added device: zram0
[   15.684459]  zd128: p1 p2
[   15.692278]  zd144: p1 p2
[   15.696637]  zd160: p1 p2
[   15.700455]  zd176: p1 p2
[   15.705816]  zd192: p1 p2
[   15.713339]  zd208: p1 p2
[   15.718571]  zd224: p1 p2
[   15.723368]  zd240: p1 p2
[   15.759231]  zd256: p1
[   15.773105]  zd272: p1
[   15.783937]  zd288: p1
[   15.825543]  zd304: p1
[   15.861385]  zd320: p1 p2 p3
[   15.895048]  zd336: p1 p2
[   15.902184]  zd352: p1 p2
[   15.907204]  zd368: p1 p2
[   15.911359]  zd384: p1 p2
[   15.916588]  zd400: p1 p2
[   15.921910]  zd416: p1 p2
[   15.928607]  zd432: p1 p2
[   15.933049]  zd448: p1 p2
[   16.078365]  zd592: p1 p2
[   16.092093]  zd608: p1 p2
[   16.102939]  zd624: p1 p2
[   16.112428]  zd640: p1 p2
[   16.123649]  zd656: p1 p2
[   16.129564]  zd672: p1 p2
[   16.136278]  zd688: p1 p2
[   16.144290]  zd704: p1 p2
[   16.152803]  zd720: p1
[   16.160470]  zd736: p1
[   16.208637]  zd752: p1
[   16.253539]  zd768: p1 p2 p3 p4 p5
[   16.294429]  zd784: p1
[   16.326336]  zd816: p1
[   16.360686]  zd832: p1 p2 p3
[   16.384436]  zd848: p1
[   16.403634]  zd864: p1
[   16.415751]  zd880: p1
[   16.423026]  zd896: p1
[   16.501256]  zd1040: p1 p2
[   16.517194]  zd1056: p1 p2
[   16.521339]  zd1072: p1 p2
[   16.525051]  zd1088: p1 p2
[   16.529343]  zd1104: p1 p2
[   16.532932]  zd1120: p1 p2
[   16.536891]  zd1136: p1 p2
[   16.542303]  zd1152: p1 p2
[   16.564081]  zd1168: p1
[   16.594718]  zd1184: p1
[   16.634805]  zd1200: p1
[   16.657414]  zd1216: p1
[   16.690011]  zd1232: p1
[   16.719542]  zd1248: p1 p2 p3
[   16.730399]  zd1264: p1
[   16.737806]  zd1280: p1
[   16.761727]  zd1296: p1
[   16.787239]  zd1312: p1 p2 p3
[   16.812539]  zd1328: p1
[   16.832342]  zd1344: p1 p2
[   16.837232]  zd1360: p1 p2
[   16.840666]  zd1376: p1 p2
[   16.844548]  zd1392: p1 p2
[   16.849084]  zd1408: p1 p2
[   16.855368]  zd1424: p1 p2
[   16.861518]  zd1440: p1 p2
[   16.866762]  zd1456: p1 p2
[   16.967086]  zd1600: p1
[   16.987140]  zd1616: p1
[   17.014874]  zd1632: p1
[   17.050362]  zd1648: p1
[   17.084595]  zd1664: p1 p2 p3
[   17.155633]  zd1824: p1 p2
[   17.166382]  zd1840: p1 p2
[   17.171784]  zd1856: p1 p2
[   17.182691]  zd1872: p1 p2
[   17.186294]  zd1888: p1 p2
[   17.195674]  zd1904: p1 p2
[   17.199847]  zd1920: p1 p2
[   17.204896]  zd1936: p1 p2
[   17.241423]  zd1952: p1
[   17.274255]  zd1968: p1 p2 p3
[   17.318660]  zd1984: p1
[   17.330549]  zd2000: p1
[   17.335910]  zd2016: p1
[   17.373388]  zd2032: p1
[   17.398070]  zd2048: p1 p2 p3 p4
[   17.427189]  zd2064: p1
[   17.438083]  zd2080: p1
[   17.448370]  zd2096: p1
[   17.479164]  zd2112: p1
[   17.494733]  zd2128: p1
[   17.518908]  zd2144: p1
[   17.525477]  zd2160: p1
[   17.549330]  zd2176: p1
[   17.554033]  zd2192: p1
[   17.581309]  zd2208: p1 p2 p3
[   17.587389]  zd2224: p1 p2 p3
[   17.615081]  zd2240: p1
[   17.621542]  zd2256: p1
[   17.648805]  zd2272: p1 p2 p3
[   17.658974]  zd2288: p1 p2 p3
[   17.694089]  zd2304: p1
[   17.698898]  zd2320: p1
[   17.726037]  zd2336: p1
[   17.734483]  zd2352: p1
[   17.767767]  zd2368: p1
[   17.776913]  zd2384: p1
[   17.799631]  zd2400: p1
[   17.807928]  zd2416: p1
[   17.812870]  zd2432: p1
[   17.845471]  zd2448: p1
[   17.867694]  zd2464: p1
[   17.874419]  zd2480: p1
[   17.899589]  zd2496: p1 p2 p3
[   17.921126]  zd2512: p1 p2 p3
[   17.929597]  zd2528: p1 p2 p3
[   17.964911]  zd2544: p1
[   17.992050]  zd2560: p1
[   18.004137]  zd2576: p1
[   18.030769]  zd2592: p1
[   18.050453]  zd2608: p1
[   18.054705]  zd2624: p1
[   18.067196] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   18.067818] GPT:136314879 != 150994943
[   18.068048] GPT:Alternate GPT header not at the end of the disk.
[   18.068238] GPT:136314879 != 150994943
[   18.068479] GPT: Use GNU Parted to correct GPT errors.
[   18.068720]  zd2640: p1 p2 p3 p4
[   18.080667] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   18.081018] GPT:136314879 != 150994943
[   18.081297] GPT:Alternate GPT header not at the end of the disk.
[   18.081574] GPT:136314879 != 150994943
[   18.081930] GPT: Use GNU Parted to correct GPT errors.
[   18.082259]  zd2656: p1 p2 p3 p4
[   18.115938]  zd2672: p1 p2 p3
[   18.122614]  zd2688: p1 p2 p3
[   18.148071]  zd2704: p1 p2
[   18.179919]  zd2720: p1 p2
[   18.195428]  zd2736: p1 p2
[   18.204913]  zd2752: p1 p2
[   18.244854]  zd2768: p1 p2
[   18.255308]  zd2784: p1 p2
[   18.282608]  zd2800: p1 p2
[   18.290207]  zd2816: p1 p2
[   18.325104] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   18.325606] GPT:2092307 != 2121223
[   18.326007] GPT:Alternate GPT header not at the end of the disk.
[   18.326490] GPT:2092307 != 2121223
[   18.326935] GPT: Use GNU Parted to correct GPT errors.
[   18.327393]  zd2832: p1 p2 p3
[   18.340263] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   18.340809] GPT:2092307 != 2121223
[   18.341331] GPT:Alternate GPT header not at the end of the disk.
[   18.341907] GPT:2092307 != 2121223
[   18.342461] GPT: Use GNU Parted to correct GPT errors.
[   18.342947]  zd2848: p1 p2 p3
[   18.399652]  zd2896: p1 p2
[   18.415217]  zd2912: p1 p2
[   18.421340]  zd2928: p1 p2
[   18.456891]  zd2944: p1
[   18.466279]  zd2960: p1
[   18.489809]  zd2976: p1
[   18.506030]  zd2992: p1
[   18.537008]  zd3008: p1 p2 p3
[   18.547133]  zd3024: p1 p2 p3
[   18.570563]  zd3040: p1
[   18.574941]  zd3056: p1
[   18.600456]  zd3072: p1
[   18.609046]  zd3088: p1
[   18.666176]  zd3184: p1
[   18.676845]  zd3200: p1
[   18.706743]  zd3216: p1
[   18.712601]  zd3232: p1
[   18.718571]  zd3248: p1
[   18.724193]  zd3264: p1
[   18.754431]  zd3280: p1 p2 p3 p4 p5
[   18.766859]  zd3296: p1 p2 p3 p4 p5
[   18.798088]  zd3312: p1 p2 p3
[   18.807046]  zd3328: p1 p2 p3
[   18.838557]  zd3344: p1
[   18.843617]  zd3360: p1
[   18.881195]  zd3376: p1
[   18.889567]  zd3392: p1
[   18.924214]  zd3408: p1
[   18.935948]  zd3424: p1
[   18.969589]  zd3440: p1
[   18.992038]  zd3456: p1
[   18.999794]  zd3472: p1
[   19.027024]  zd3488: p1
[   19.047805]  zd3504: p1
[   19.052763]  zd3520: p1
[   19.072900]  zd3536: p1 p2 p3
[   19.101067]  zd3552: p1 p2 p3
[   19.107390]  zd3568: p1 p2 p3
[   19.132793]  zd3584: p1
[   19.142550]  zd3600: p1
[   19.146552]  zd3616: p1
[   19.177062]  zd3632: p1
[   19.192527]  zd3648: p1
[   19.224152]  zd3664: p1
[   19.229546]  zd3680: p1
[   19.263296]  zd3696: p1 p2 p3
[   19.272347]  zd3712: p1 p2 p3
[   19.296989]  zd3728: p1
[   19.301284]  zd3744: p1
[   19.330373]  zd3760: p1 p2 p3
[   19.341000]  zd3776: p1 p2 p3
[   19.367749]  zd3792: p1
[   19.373321]  zd3808: p1
[   19.407366]  zd3824: p1
[   19.415588]  zd3840: p1
[   19.445767]  zd3856: p1
[   19.457104]  zd3872: p1
[   19.489562]  zd3888: p1
[   19.495989]  zd3904: p1
[   19.523679]  zd3920: p1
[   19.527982]  zd3936: p1
[   19.554042]  zd3952: p1 p2 p3 p4
[   19.564070]  zd3968: p1 p2 p3 p4
[   19.579553]  zd3984: p1
[   19.583749]  zd4000: p1
[   19.625580]  zd4048: p1
[   19.642508]  zd4064: p1
[   19.677044]  zd4080: p1
[   19.686594]  zd4096: p1
[   19.719236]  zd4112: p1 p2 p3
[   19.727177]  zd4128: p1 p2 p3
[   19.749077]  zd4144: p1
[   19.754024]  zd4160: p1
[   19.757955]  zd4176: p1
[   19.765297]  zd4192: p1 p2
[   19.770450]  zd4208: p1 p2
[   19.777095]  zd4224: p1 p2
[   19.782802]  zd4240: p1 p2
[   19.790737]  zd4256: p1 p2
[   19.795937]  zd4272: p1 p2
[   19.815594]  zd4288: p1 p2
[   19.912123]  zd4448: p1
[   61.282137] loop0: detected capacity change from 0 to 9533440
[   63.948708] EXT4-fs: Warning: mounting with data=journal disables delayed allocation, dioread_nolock, O_DIRECT and fast_commit support!
[   63.949721] EXT4-fs (dm-8): mounting ext3 file system using the ext4 subsystem
[   63.954167] EXT4-fs (dm-8): mounted filesystem 1483d293-407b-4a2b-b4c1-a86729d91b3d r/w with journalled data mode. Quota mode: none.
[   63.957927] EXT4-fs (dm-8): unmounting filesystem 1483d293-407b-4a2b-b4c1-a86729d91b3d.
[  110.140100] EXT4-fs (loop0): mounted filesystem 19a5e477-b452-4d76-82fa-c6f6e1a3a706 ro with ordered data mode. Quota mode: none.
[  110.176194] aufs test_add:291:mount[5100]: uid/gid/perm /root.ro 0/0/0755, 0/0/01777
[  110.461627] EXT4-fs (loop0): re-mounted 19a5e477-b452-4d76-82fa-c6f6e1a3a706 ro. Quota mode: none.
[  110.470631] EXT4-fs (loop0): re-mounted 19a5e477-b452-4d76-82fa-c6f6e1a3a706 ro. Quota mode: none.
[  110.479405] EXT4-fs (loop0): re-mounted 19a5e477-b452-4d76-82fa-c6f6e1a3a706 ro. Quota mode: none.
[  110.545537] EXT4-fs (loop0): re-mounted 19a5e477-b452-4d76-82fa-c6f6e1a3a706 ro. Quota mode: none.
[  111.062634] systemd[1]: Inserted module 'autofs4'
[  111.123552] systemd[1]: systemd 249.11-0ubuntu3.12 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[  111.125552] systemd[1]: Detected architecture x86-64.
[  111.135665] systemd[1]: Hostname set to <intel-xen-host>.
[  111.180278] audit: type=1334 audit(1733149804.372:9): prog-id=3 op=LOAD
[  111.180840] audit: type=1300 audit(1733149804.372:9): arch=c000003e syscall=321 success=yes exit=8 a0=5 a1=7ffdac0860c0 a2=78 a3=7ffdac0860c0 items=0 ppid=0 pid=1 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd" exe="/usr/lib/systemd/systemd" subj=unconfined key=(null)
[  111.182351] audit: type=1327 audit(1733149804.372:9): proctitle=2F7362696E2F696E6974007A796F7665726C6179
[  111.182854] audit: type=1334 audit(1733149804.372:10): prog-id=3 op=UNLOAD
[  111.183317] audit: type=1300 audit(1733149804.372:10): arch=c000003e syscall=3 success=yes exit=0 a0=8 a1=7ffdac086180 a2=78 a3=200000008 items=0 ppid=0 pid=1 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd" exe="/usr/lib/systemd/systemd" subj=unconfined key=(null)
[  111.184768] audit: type=1327 audit(1733149804.372:10): proctitle=2F7362696E2F696E6974007A796F7665726C6179
[  111.185245] audit: type=1334 audit(1733149804.372:11): prog-id=4 op=LOAD
[  111.185728] audit: type=1300 audit(1733149804.372:11): arch=c000003e syscall=321 success=yes exit=8 a0=5 a1=7ffdac086190 a2=78 a3=7ffdac086190 items=0 ppid=0 pid=1 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd" exe="/usr/lib/systemd/systemd" subj=unconfined key=(null)
[  111.187154] audit: type=1327 audit(1733149804.372:11): proctitle=2F7362696E2F696E6974007A796F7665726C6179
[  111.187664] audit: type=1334 audit(1733149804.372:12): prog-id=4 op=UNLOAD
[  111.658866] systemd[1]: Configuration file /run/systemd/system/netplan-ovs-cleanup.service is marked world-inaccessible. This has no effect as configuration data is accessible via APIs without restrictions. Proceeding anyway.
[  111.753056] systemd[1]: Queued start job for default target Graphical Interface.
[  111.767784] systemd[1]: Created slice Slice /system/modprobe.
[  111.770376] systemd[1]: Created slice Slice /system/serial-getty.
[  111.772524] systemd[1]: Created slice Slice /system/ourcorp-proxhub.
[  111.774436] systemd[1]: Created slice User and Session Slice.
[  111.775882] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[  111.777281] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[  111.778923] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[  111.780155] systemd[1]: Reached target Local Encrypted Volumes.
[  111.781381] systemd[1]: Reached target Remote File Systems.
[  111.782594] systemd[1]: Reached target Slice Units.
[  111.783766] systemd[1]: Reached target TLS tunnels for network services - per-config-file target.
[  111.784949] systemd[1]: Reached target Swaps.
[  111.786107] systemd[1]: Reached target Local Verity Protected Volumes.
[  111.787559] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[  111.789094] systemd[1]: Listening on LVM2 poll daemon socket.
[  111.790605] systemd[1]: Listening on Syslog Socket.
[  111.792031] systemd[1]: Listening on fsck to fsckd communication Socket.
[  111.793312] systemd[1]: Listening on initctl Compatibility Named Pipe.
[  111.794818] systemd[1]: Listening on Journal Socket (/dev/log).
[  111.796507] systemd[1]: Listening on Network Service Netlink Socket.
[  111.798061] systemd[1]: Listening on udev Control Socket.
[  111.799503] systemd[1]: Listening on udev Kernel Socket.
[  111.801993] systemd[1]: Created slice Slice /system/ourcorp-diskmanager-disk-added.
[  111.804062] systemd[1]: Created slice Slice /system/ourcorp-wce.
[  111.805759] systemd[1]: Listening on Journal Socket.
[  111.807353] systemd[1]: Condition check resulted in Huge Pages File System being skipped.
[  111.812350] systemd[1]: Mounting POSIX Message Queue File System...
[  111.818148] systemd[1]: Mounting Mount /proc/xen files...
[  111.826311] systemd[1]: Mounting Kernel Debug File System...
[  111.832157] systemd[1]: Mounting Kernel Trace File System...
[  111.840831] systemd[1]: Starting Journal Service...
[  111.842745] systemd[1]: Finished Availability of block devices.
[  111.848401] systemd[1]: Starting Set the console keyboard layout...
[  111.855113] systemd[1]: Starting Create List of Static Device Nodes...
[  111.861770] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[  111.868286] systemd[1]: Starting Load Kernel Module configfs...
[  111.875663] systemd[1]: Starting Load Kernel Module drm...
[  111.883574] systemd[1]: Starting Load Kernel Module efi_pstore...
[  111.893692] systemd[1]: Starting Load Kernel Module fuse...
[  111.896557] systemd[1]: Condition check resulted in OpenVSwitch configuration for cleanup being skipped.
[  111.898110] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[  111.908147] systemd[1]: Starting Load Kernel Modules...
[  111.916780] systemd[1]: Starting Remount Root and Kernel File Systems...
[  111.925265] systemd[1]: Starting Coldplug All udev Devices...
[  111.939529] xen:xen_evtchn: Event-channel device installed
[  111.939833] systemd[1]: Mounted POSIX Message Queue File System.
[  111.942638] systemd[1]: Mounted Mount /proc/xen files.
[  111.944906] systemd[1]: Mounted Kernel Debug File System.
[  111.955413] systemd[1]: Mounted Kernel Trace File System.
[  111.958920] systemd[1]: Finished Create List of Static Device Nodes.
[  111.961539] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[  111.963226] systemd[1]: Finished Load Kernel Module configfs.
[  111.966439] systemd[1]: modprobe@drm.service: Deactivated successfully.
[  111.968493] systemd[1]: Finished Load Kernel Module drm.
[  111.971638] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
[  111.973663] systemd[1]: Finished Load Kernel Module efi_pstore.
[  111.976781] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[  111.978747] systemd[1]: Finished Load Kernel Module fuse.
[  111.982336] systemd[1]: Finished Remount Root and Kernel File Systems.
[  111.991596] systemd[1]: Mounting FUSE Control File System...
[  111.999783] systemd[1]: Mounting Kernel Configuration File System...
[  112.002194] systemd[1]: Condition check resulted in Platform Persistent Storage Archival being skipped.
[  112.009329] systemd[1]: Starting Load/Save Random Seed...
[  112.017925] systemd[1]: Starting Create System Users...
[  112.034770] xen_pciback: backend is passthrough
[  112.051685] systemd[1]: Finished Load Kernel Modules.
[  112.056212] systemd[1]: Mounted FUSE Control File System.
[  112.059151] systemd[1]: Mounted Kernel Configuration File System.
[  112.071019] systemd[1]: Finished Load/Save Random Seed.
[  112.074388] systemd[1]: Condition check resulted in First Boot Complete being skipped.
[  112.079728] systemd[1]: Starting Apply Kernel Variables...
[  112.087157] systemd[1]: Starting The Xen xenstore...
(d1) Bootstrapping...
(d1) Xen Minimal OS (pv)!
(d1)   start_info: 0x10a000(VA)
(d1)     nr_pages: 0x4000
(d1)   shared_inf: 0x6fc9c000(MA)
(d1)      pt_base: 0x10d000(VA)
(d1) nr_pt_frames: 0x5
(d1)     mfn_list: 0xea000(VA)
(d1)    mod_start: 0x0(VA)
(d1)      mod_len: 0
(d1)        flags: 0x10
(d1)     cmd_line: --event 64 --watch-nb 512 --entry-nb 8000 --entry-size 4000
(d1)        stack: 0xc8c40-0xe8c40
(d1) MM: Init
(d1)       _text: 0x0(VA)
(d1)      _etext: 0x7120f(VA)
(d1)    _erodata: 0x87000(VA)
(d1)      _edata: 0x89064(VA)
(d1) stack start: 0xc8c40(VA)
(d1)        _end: 0xe9884(VA)
(d1)   start_pfn: 112
(d1)     max_pfn: 4000
(d1) Mapping memory range 0x112000 - 0x4000000
(d1) setting 0x0-0x87000 readonly
(d1) skipped 1000
(d1) Maximum memory size: 32776 pages
(d1) MM: Initialise page allocator for 130000(130000)-4000000(4000000)
(d1)     Adding memory range 131000-4000000
(d1) MM: done
(d1) remapped p2m list to 0x8000002000
(d1) Demand map pfns at 100000000000-108000000000.
(d1) Heap resides at 200000000000-208000000000.
(XEN) common/grant_table.c:1909:d1v0 Expanding d1 grant table from 1 to 4 frames
(XEN) arch/x86/irq.c:3017: dom0: can't create irq for msi!
(XEN) arch/x86/irq.c:3017: dom0: can't create irq for msi!
(XEN) arch/x86/irq.c:3017: dom0: can't create irq for msi!
(XEN) arch/x86/irq.c:3017: dom0: can't create irq for msi!
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.0
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.1
(XEN) [VT-D]d2:PCIe: map 0000:65:00.0
(XEN) [VT-D]d2:PCIe: map 0000:65:00.1
(d2) mapping kernel into physical memory
(d2) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d2v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d2v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x000000b0 unimplemented
(XEN) d2: Forcing read-only access to MFN e0e8c
(XEN) d0: Forcing read-only access to MFN e0e8c
(XEN) d2: Forcing read-only access to MFN e0e8c
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x0000064d unimplemented
(XEN) d2: Forcing read-only access to MFN e0e88
(XEN) d0: Forcing read-only access to MFN e0e88
(XEN) d2: Forcing read-only access to MFN e0e88
(XEN) common/grant_table.c:1909:d2v1 Expanding d2 grant table from 1 to 2 frames
(XEN) d2 L1TF-vulnerable L1e c7ffe7ffff987e02 - Shadowing
(XEN) d2 L1TF-vulnerable L1e c7ffe7ffff987e02 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d2v0 RDMSR 0x000000b0 unimplemented
(XEN) common/grant_table.c:1909:d0v4 Expanding d0 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d0v4 Expanding d0 grant table from 2 to 3 frames
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v0 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v0 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v0 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v0 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v0 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v0 Could not allocate order=18 extent: id=6 memflags=0xc0 (0 of 1)
(XEN) HVM d6v0 save: CPU
(XEN) HVM d6v1 save: CPU
(XEN) HVM d6v2 save: CPU
(XEN) HVM d6v3 save: CPU
(XEN) HVM d6 save: PIC
(XEN) HVM d6 save: IOAPIC
(XEN) HVM d6v0 save: LAPIC
(XEN) HVM d6v1 save: LAPIC
(XEN) HVM d6v2 save: LAPIC
(XEN) HVM d6v3 save: LAPIC
(XEN) HVM d6v0 save: LAPIC_REGS
(XEN) HVM d6v1 save: LAPIC_REGS
(XEN) HVM d6v2 save: LAPIC_REGS
(XEN) HVM d6v3 save: LAPIC_REGS
(XEN) HVM d6 save: PCI_IRQ
(XEN) HVM d6 save: ISA_IRQ
(XEN) HVM d6 save: PCI_LINK
(XEN) HVM d6 save: PIT
(XEN) HVM d6 save: RTC
(XEN) HVM d6 save: HPET
(XEN) HVM d6 save: PMTIMER
(XEN) HVM d6v0 save: MTRR
(XEN) HVM d6v1 save: MTRR
(XEN) HVM d6v2 save: MTRR
(XEN) HVM d6v3 save: MTRR
(XEN) HVM d6 save: VIRIDIAN_DOMAIN
(XEN) HVM d6v0 save: CPU_XSAVE
(XEN) HVM d6v1 save: CPU_XSAVE
(XEN) HVM d6v2 save: CPU_XSAVE
(XEN) HVM d6v3 save: CPU_XSAVE
(XEN) HVM d6v0 save: VIRIDIAN_VCPU
(XEN) HVM d6v1 save: VIRIDIAN_VCPU
(XEN) HVM d6v2 save: VIRIDIAN_VCPU
(XEN) HVM d6v3 save: VIRIDIAN_VCPU
(XEN) HVM d6v0 save: VMCE_VCPU
(XEN) HVM d6v1 save: VMCE_VCPU
(XEN) HVM d6v2 save: VMCE_VCPU
(XEN) HVM d6v3 save: VMCE_VCPU
(XEN) HVM d6v0 save: TSC_ADJUST
(XEN) HVM d6v1 save: TSC_ADJUST
(XEN) HVM d6v2 save: TSC_ADJUST
(XEN) HVM d6v3 save: TSC_ADJUST
(XEN) HVM d6v0 save: CPU_MSR
(XEN) HVM d6v1 save: CPU_MSR
(XEN) HVM d6v2 save: CPU_MSR
(XEN) HVM d6v3 save: CPU_MSR
(XEN) HVM6 restore: CPU 0
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=12 memflags=0xc0 (203 of 230)
(d6) HVM Loader
(d6) Detected Xen v4.18.4-pre
(d6) Xenbus rings @0xfeffc000, event channel 1
(d6) System requested SeaBIOS
(d6) CPU speed is 2195 MHz
(d6) Relocating guest memory for lowmem MMIO space disabled
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 0 changed 0 -> 5
(d6) PCI-ISA link 0 routed to IRQ5
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 1 changed 0 -> 10
(d6) PCI-ISA link 1 routed to IRQ10
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 2 changed 0 -> 11
(d6) PCI-ISA link 2 routed to IRQ11
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 3 changed 0 -> 5
(d6) PCI-ISA link 3 routed to IRQ5
(d6) pci dev 01:2 INTD->IRQ5
(d6) pci dev 01:3 INTA->IRQ10
(d6) pci dev 02:0 INTA->IRQ11
(d6) pci dev 03:0 INTA->IRQ5
(d6) pci dev 04:0 INTA->IRQ5
(d6) pci dev 06:0 INTA->IRQ11
(d6) pci dev 07:0 INTD->IRQ11
(d6) pci dev 08:0 INTA->IRQ5
(d6) pci dev 09:0 INTB->IRQ11
(d6) pci dev 0a:0 INTC->IRQ5
(d6) pci dev 0b:0 INTA->IRQ5
(d6) pci dev 0c:0 INTA->IRQ5
(d6) pci dev 0d:0 INTA->IRQ10
(d6) pci dev 0e:0 INTA->IRQ11
(d6) pci dev 0f:0 INTA->IRQ5
(d6) pci dev 10:0 INTA->IRQ5
(d6) pci dev 11:0 INTA->IRQ10
(d6) RAM in high memory; setting high_mem resource base to 9d3000000
(d6) pci dev 02:0 bar 14 size 001000000: 0f0000008
(d6) pci dev 05:0 bar 10 size 001000000: 0f1000008
(d6) pci dev 06:0 bar 30 size 000040000: 0f2000000
(d6) pci dev 05:0 bar 30 size 000010000: 0f2040000
(d6) pci dev 03:0 bar 10 size 000004000: 0f2050000
(d6) pci dev 04:0 bar 20 size 000004000: 0f205400c
(d6) pci dev 04:0 bar 14 size 000001000: 0f2058000
(d6) pci dev 05:0 bar 18 size 000001000: 0f2059000
(d6) pci dev 07:0 bar 10 size 000001000: 0f205a000
(d6) pci dev 02:0 bar 10 size 000000100: 00000c001
(d6) pci dev 06:0 bar 10 size 000000100: 00000c101
(d6) pci dev 06:0 bar 14 size 000000100: 0f205b000
(d6) pci dev 04:0 bar 10 size 000000040: 00000c201
(d6) pci dev 01:2 bar 20 size 000000020: 00000c241
(d6) pci dev 08:0 bar 20 size 000000020: 00000c261
(d6) pci dev 09:0 bar 20 size 000000020: 00000c281
(d6) pci dev 0a:0 bar 20 size 000000020: 00000c2a1
(d6) pci dev 01:1 bar 20 size 000000010: 00000c2c1
(d6) pci dev 0b:0 bar 10 size 000000008: 00000c2d1
(d6) pci dev 0c:0 bar 10 size 000000008: 00000c2d9
(d6) pci dev 0d:0 bar 10 size 000000008: 00000c2e1
(d6) pci dev 0e:0 bar 10 size 000000008: 00000c2e9
(d6) pci dev 0f:0 bar 10 size 000000008: 00000c2f1
(d6) pci dev 10:0 bar 10 size 000000008: 00000c2f9
(d6) pci dev 11:0 bar 10 size 000000008: 00000c301
(d6) Multiprocessor initialisation:
(d6)  - CPU0 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d6)  - CPU1 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d6)  - CPU2 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d6)  - CPU3 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d6) Writing SMBIOS tables ...
(d6) Loading SeaBIOS ...
(d6) Creating MP tables ...
(d6) Loading ACPI ...
(d6) vm86 TSS at fc100400
(d6) BIOS map:
(d6)  10000-100e3: Scratch space
(d6)  c0000-fffff: Main BIOS
(d6) E820 table:
(d6)  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d6)  HOLE: 00000000:000a0000 - 00000000:000c0000
(d6)  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d6)  [02]: 00000000:00100000 - 00000000:f0000000: RAM
(d6)  HOLE: 00000000:f0000000 - 00000000:fc000000
(d6)  [03]: 00000000:fc000000 - 00000000:fc00b000: NVS
(d6)  [04]: 00000000:fc00b000 - 00000001:00000000: RESERVED
(d6)  [05]: 00000001:00000000 - 00000009:d3000000: RAM
(d6) Invoking SeaBIOS ...
(d6) SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen)
(d6) BUILD: gcc: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0 binutils: (GNU Binutils for Ubuntu) 2.38
(d6) 
(d6) Found Xen hypervisor signature at 40000100
(d6) Running on QEMU (i440fx)
(d6) xen: copy e820...
(d6) Relocating init from 0x000d4760 to 0xeefeb2c0 (size 85152)
(d6) Found 21 PCI devices (max PCI bus is 00)
(d6) Allocated Xen hypercall page at effff000
(d6) Detected Xen v4.18.4-pre
(d6) xen: copy BIOS tables...
(d6) Copying SMBIOS from 0x00010020 to 0x000f5aa0
(d6) Copying MPTABLE from 0xfc100270/fc100280 to 0x000f5980
(d6) Copying PIR from 0x00010040 to 0x000f5900
(d6) Copying ACPI RSDP from 0x000100c0 to 0x000f58d0
(d6) table(50434146)=0xfc00a370 (via xsdt)
(d6) Using pmtimer, ioport 0xb008
(d6) table(50434146)=0xfc00a370 (via xsdt)
(d6) ACPI: parse DSDT at 0xfc001040 (len 37539)
(d6) parse_termlist: parse error, skip from 16/27641
(d6) parse_termlist: parse error, skip from 87/6041
(d6) Scan for VGA option rom
(d6) Running option rom at c000:0003
(d6) pmm call arg1=0
(d6) Turning on vga text mode console
(d6) SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen)
(d6) Machine UUID 1919b33b-e382-4473-b798-222d525f2309
(d6) EHCI init on dev 00:07.0 (regs=0xf205a020)
(d6) UHCI init on dev 00:01.2 (io=c240)
(d6) UHCI init on dev 00:08.0 (io=c260)
(d6) UHCI init on dev 00:09.0 (io=c280)
(d6) UHCI init on dev 00:0a.0 (io=c2a0)
(d6) ATA controller 1 at 1f0/3f4/c2c0 (irq 14 dev 9)
(d6) ATA controller 2 at 170/374/c2c8 (irq 15 dev 9)
(d6) ata0-0: QEMU HARDDISK ATA-7 Hard-Disk (52000 MiBytes)
(d6) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d6) Searching bios-geometry for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d6) Searching bootorder for: HALT
(d6) Found 0 lpt ports
(d6) Found 2 serial ports
(d6) PS2 keyboard initialized
(d6) All threads complete.
(d6) Scan for option roms
(d6) Running option rom at ca00:0003
(d6) pmm call arg1=1
(d6) pmm call arg1=0
(d6) pmm call arg1=1
(d6) pmm call arg1=0
(d6) Searching bootorder for: /pci@i0cf8/*@6
(d6) 
(d6) Press ESC for boot menu.
(d6) 
(d6) Searching bootorder for: HALT
(d6) drive 0x000f5850: PCHS=16383/16/63 translation=lba LCHS=1024/255/63 s=106496000
(d6) Space available for UMB: cb000-e8800, f52c0-f5850
(d6) Returned 16773120 bytes of ZoneHigh
(d6) e820 map has 8 items:
(d6)   0: 0000000000000000 - 000000000009fc00 = 1 RAM
(d6)   1: 000000000009fc00 - 00000000000a0000 = 2 RESERVED
(d6)   2: 00000000000f0000 - 0000000000100000 = 2 RESERVED
(d6)   3: 0000000000100000 - 00000000effff000 = 1 RAM
(d6)   4: 00000000effff000 - 00000000f0000000 = 2 RESERVED
(d6)   5: 00000000fc000000 - 00000000fc00b000 = 4 NVS
(d6)   6: 00000000fc00b000 - 0000000100000000 = 2 RESERVED
(d6)   7: 0000000100000000 - 00000009d3000000 = 1 RAM
(d6) enter handle_19:
(d6)   NULL
(d6) Booting from Hard Disk...
(d6) Booting from 0000:7c00
(d5) mapping kernel into physical memory
(d5) about to get started...
(d3) mapping kernel into physical memory
(d3) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d5v1 Expanding d5 grant table from 2 to 3 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d5v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d5v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(d7) mapping kernel into physical memory
(d7) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d3v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(d8) mapping kernel into physical memory
(d8) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d7v1 Expanding d7 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d7v1 Expanding d7 grant table from 2 to 3 frames
(d9) mapping kernel into physical memory
(d9) about to get started...
(d4) mapping kernel into physical memory
(d4) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d7v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d7v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) common/grant_table.c:1909:d8v0 Expanding d8 grant table from 1 to 2 frames
(d12) mapping kernel into physical memory
(d12) about to get started...
(d10) mapping kernel into physical memory
(d10) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1175:d8v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d9v0 Expanding d9 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d4v0 Expanding d4 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d4v0 Expanding d4 grant table from 2 to 3 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d9v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000606 unimplemented
(XEN) common/grant_table.c:1909:d5v0 Expanding d5 grant table from 3 to 4 frames
(XEN) common/grant_table.c:1909:d10v0 Expanding d10 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d4v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d4v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d12v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d10v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v0 RDMSR 0x0000064d unimplemented
(XEN) d6: VIRIDIAN GUEST_OS_ID: vendor: 0x1 os: 0x4 major: 0xa minor: 0 sp: 0 build: 0x271b
(XEN) d6: VIRIDIAN HYPERCALL: enabled: 1 pfn: 0x215
(XEN) d6v0: VIRIDIAN VP_ASSIST: pfn: 0xc
(XEN) d6: VIRIDIAN HVCALL_NOTIFY_LONG_SPIN_WAIT
(XEN) d6: VIRIDIAN MSR_TIME_REF_COUNT: accessed
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v1 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x0000064d unimplemented
(XEN) common/grant_table.c:1909:d7v1 Expanding d7 grant table from 3 to 4 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x000000b0 unimplemented
(d11) mapping kernel into physical memory
(d11) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000606 unimplemented
(XEN) common/grant_table.c:1909:d4v1 Expanding d4 grant table from 3 to 4 frames
(XEN) d6v1: VIRIDIAN VP_ASSIST: pfn: 0x3ffff
(XEN) d6v2: VIRIDIAN VP_ASSIST: pfn: 0x3fffe
(XEN) d6v3: VIRIDIAN VP_ASSIST: pfn: 0x3ffef
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 0 changed 5 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 1 changed 10 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 2 changed 11 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom6 PCI link 3 changed 5 -> 0
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v1 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v1 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d11v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d11v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x0000064d unimplemented
(XEN) d6v0: upcall vector a1
(XEN) d6v1: upcall vector a1
(XEN) d6v2: upcall vector a1
(XEN) d6v3: upcall vector a1
(XEN) Dom6 callback via changed to GSI 24
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x0000064d unimplemented
(XEN) common/grant_table.c:1909:d11v1 Expanding d11 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v1 RDMSR 0x00000606 unimplemented
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 2 to 3 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 3 to 4 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 4 to 5 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 5 to 6 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 6 to 7 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 7 to 8 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 8 to 9 frames
(XEN) common/grant_table.c:1909:d11v0 Expanding d11 grant table from 9 to 10 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d11v0 RDMSR 0x0000064d unimplemented
(XEN) common/grant_table.c:1909:d6v2 Expanding d6 grant table from 1 to 2 frames
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d6v2 RDMSR 0x0000019a unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d6v2 RDMSR 0x0000019b unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d6v1 RDMSR 0x0000019a unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d6v1 RDMSR 0x0000019b unimplemented
(XEN) common/grant_table.c:1909:d6v1 Expanding d6 grant table from 2 to 3 frames
(XEN) d4 L1TF-vulnerable L1e d7ffe7fffffbc002 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d5v1 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d7v0 RDMSR 0x000000b0 unimplemented
(XEN) d8 L1TF-vulnerable L1e c7ffe7ffff988a02 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d4v0 RDMSR 0x000000b0 unimplemented
(XEN) d10 L1TF-vulnerable L1e c7ffe7ffff987402 - Shadowing
(XEN) d12 L1TF-vulnerable L1e c7ffe7ffff98a602 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d9v0 RDMSR 0x000000b0 unimplemented
(XEN) d3 L1TF-vulnerable L1e d7ffe7fffff9c202 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d3v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d12v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d8v0 RDMSR 0x000000b0 unimplemented
(XEN) common/grant_table.c:1909:d12v0 Expanding d12 grant table from 2 to 3 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d10v0 RDMSR 0x000000b0 unimplemented
(XEN) d5 L1TF-vulnerable L1e c7ffe7ffff987602 - Shadowing

##### -> network driver domain (d2) has been started along with a few other vms

root@intel-xen-host:~# xl info
host                   : intel-xen-host
release                : 6.8.0-48-generic
version                : #48~22.04.1 SMP PREEMPT_DYNAMIC Thu Oct 24 08:09:57 UTC 
machine                : x86_64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 2
cpu_mhz                : 2194.844
hw_caps                : bfebfbff:77fef3ff:2c100800:00000121:0000000f:d29ffffb:00000008:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap shadow iommu_hap_pt_share vmtrace gnttab-v1 gnttab-v2
total_memory           : 65192
free_memory            : 40549
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 18
xen_extra              : .4-pre
xen_version            : 4.18.4-pre
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0x0
xen_changeset          : Fri Nov 15 14:07:55 2024 +0000 git:05ee7d9083-dirty
xen_commandline        : placeholder console=vga,com2 dom0_max_vcpus=4-8 dom0_mem=min:6144,max:65536m iommu=on,required,intpost,verbose,debug x2apic=off sched=credit2 flask=enforcing gnttab_max_frames=128 xpti=off smt=on cpufreq=xen:performance spec-ctrl=gds-mit=0 com2=115200,8n1
cc_compiler            : gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
cc_compile_by          : 
cc_compile_domain      : 
cc_compile_date        : Wed Nov 27 17:18:46 UTC 2024
build_id               : 0adefb2a5aa28a52782a7c8481ebd48539af86d0
xend_config_format     : 4

(XEN) d7 L1TF-vulnerable L1e c7ffe7ffff980c02 - Shadowing
(XEN) d9 L1TF-vulnerable L1e c7ffe7ffff98b002 - Shadowing

##### -> memory for domU is changed to 40200 and the domain is restarted

(XEN) d2: IOMMU mapping dfn f78b20 to mfn f78b20 failed: -12
(XEN) domain_crash called from drivers/passthrough/iommu.c:366
(XEN) Domain 2 (vcpu#0) crashed on cpu#3:
(XEN) ----[ Xen-4.18.4-pre  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    3
(XEN) RIP:    e033:[<ffffffff8220128c>]
(XEN) RFLAGS: 0000000000000282   EM: 0   CONTEXT: pv guest (d2v0)
(XEN) rax: 0000000000000014   rbx: ffffc900414b1000   rcx: ffffffff8220128c
(XEN) rdx: 0000000000000001   rsi: ffffc900414bb018   rdi: 0000000000000000
(XEN) rbp: ffffc90040003e18   rsp: ffffc90040003dc8   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000282
(XEN) r12: 0000000000000001   r13: ffffc900414bb018   r14: ffffc900414b1000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 000000088ab0b000   cr2: 000079b3655f2fd8
(XEN) fsb: 0000000000000000   gsb: ffff888023000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=ffffc90040003dc8:
(XEN)    0000000000000000 0000000000000001 ffffffff81a94320 0000000000000000
(XEN)    ffffc900414be818 ffffc900414b1000 0000000000000000 0000000000000001
(XEN)    ffffc900414b1000 0000000000000000 ffffc90040003e58 ffffffffc0542f35
(XEN)    0000000200000001 dbe37fd809e08800 ffffc900414b1030 0000000000000000
(XEN)    0000000000000040 ffffc900414b1000 ffffc90040003e88 ffffffffc05464ae
(XEN)    ffffc900414b1030 0000000000000000 ffffc90040003eef 0000000000000040
(XEN)    ffffc90040003ec0 ffffffff81edef70 ffff888023035e40 000000000000012c
(XEN)    ffffc90040003ef8 ffffc900414b1030 0000000000000000 ffffc90040003f48
(XEN)    ffffffff81edf551 ffffffff811b5c7f ffff888023036100 0000000100001212
(XEN)    0000000000000007 ffff888023031b60 ffffc90040003ef8 ffffc90040003ef8
(XEN)    ffffc90040003f08 ffffc90040003f08 dbe37fd809e08800 0000000080000101
(XEN)    0000000000000003 0000000000000088 0000000000000004 ffffffff834060d8
(XEN)    ffffc90040003fb8 ffffffff8110a198 ffff888023034200 0420000200000000
(XEN)    ffffffff8340fcc0 0000000100001212 000000000000000a ffffc90000000003
(XEN)    ffffffff81a9f77e ffffffff83403cc8 0000000000000001 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffffc90040003fd8 ffffffff8110a4e9
(XEN)    ffffffff83403cc8 0000000000000001 ffffc90040003fe8 ffffffff8110a84e
(XEN)    ffffffff83403cb8 ffffffff821ffd0a ffffffff83403ca0
(XEN)     Fault while accessing guest memory.
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=20 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=20 memflags=0xc0 (0 of 4)
(XEN) HVM d20v0 save: CPU
(XEN) HVM d20v1 save: CPU
(XEN) HVM d20v2 save: CPU
(XEN) HVM d20v3 save: CPU
(XEN) HVM d20 save: PIC
(XEN) HVM d20 save: IOAPIC
(XEN) HVM d20v0 save: LAPIC
(XEN) HVM d20v1 save: LAPIC
(XEN) HVM d20v2 save: LAPIC
(XEN) HVM d20v3 save: LAPIC
(XEN) HVM d20v0 save: LAPIC_REGS
(XEN) HVM d20v1 save: LAPIC_REGS
(XEN) HVM d20v2 save: LAPIC_REGS
(XEN) HVM d20v3 save: LAPIC_REGS
(XEN) HVM d20 save: PCI_IRQ
(XEN) HVM d20 save: ISA_IRQ
(XEN) HVM d20 save: PCI_LINK
(XEN) HVM d20 save: PIT
(XEN) HVM d20 save: RTC
(XEN) HVM d20 save: HPET
(XEN) HVM d20 save: PMTIMER
(XEN) HVM d20v0 save: MTRR
(XEN) HVM d20v1 save: MTRR
(XEN) HVM d20v2 save: MTRR
(XEN) HVM d20v3 save: MTRR
(XEN) HVM d20 save: VIRIDIAN_DOMAIN
(XEN) HVM d20v0 save: CPU_XSAVE
(XEN) HVM d20v1 save: CPU_XSAVE
(XEN) HVM d20v2 save: CPU_XSAVE
(XEN) HVM d20v3 save: CPU_XSAVE
(XEN) HVM d20v0 save: VIRIDIAN_VCPU
(XEN) HVM d20v1 save: VIRIDIAN_VCPU
(XEN) HVM d20v2 save: VIRIDIAN_VCPU
(XEN) HVM d20v3 save: VIRIDIAN_VCPU
(XEN) HVM d20v0 save: VMCE_VCPU
(XEN) HVM d20v1 save: VMCE_VCPU
(XEN) HVM d20v2 save: VMCE_VCPU
(XEN) HVM d20v3 save: VMCE_VCPU
(XEN) HVM d20v0 save: TSC_ADJUST
(XEN) HVM d20v1 save: TSC_ADJUST
(XEN) HVM d20v2 save: TSC_ADJUST
(XEN) HVM d20v3 save: TSC_ADJUST
(XEN) HVM d20v0 save: CPU_MSR
(XEN) HVM d20v1 save: CPU_MSR
(XEN) HVM d20v2 save: CPU_MSR
(XEN) HVM d20v3 save: CPU_MSR
(XEN) HVM20 restore: CPU 0
(XEN) [VT-D]d2:PCIe: unmap 0000:65:00.0
(XEN) [VT-D]d2:PCIe: unmap 0000:65:00.1
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x172 ref 0xf03 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x171 ref 0xf02 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x170 ref 0xf01 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x16f ref 0xf00 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x16e ref 0xb03 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x16d ref 0xb02 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x16c ref 0xb01 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x16b ref 0xb00 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x155 ref 0x20f flags 0x12 d12
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x154 ref 0x20e flags 0x12 d12
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x153 ref 0x413 flags 0x12 d7
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x152 ref 0x412 flags 0x12 d7
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x151 ref 0x411 flags 0x12 d7
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x150 ref 0x410 flags 0x12 d7
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x13c ref 0x413 flags 0x12 d5
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x13b ref 0x412 flags 0x12 d5
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x13a ref 0x411 flags 0x12 d5
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x139 ref 0x410 flags 0x12 d5
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x50 ref 0x1303 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x4f ref 0x1302 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x4e ref 0x1301 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x4d ref 0x1300 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x4c ref 0x703 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x4b ref 0x702 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x4a ref 0x701 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x49 ref 0x700 flags 0x12 d11
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x35 ref 0x20e flags 0x12 d10
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x34 ref 0x20d flags 0x12 d10
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x33 ref 0x417 flags 0x12 d4
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x32 ref 0x416 flags 0x12 d4
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x31 ref 0x415 flags 0x12 d4
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x30 ref 0x414 flags 0x12 d4
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2f ref 0x20e flags 0x12 d9
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2e ref 0x20d flags 0x12 d9
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2d ref 0x20d flags 0x12 d8
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2c ref 0x20c flags 0x12 d8
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2b ref 0x20e flags 0x12 d3
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2a ref 0x20d flags 0x12 d3
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x3 ref 0x40b flags 0x12 d0
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x2 ref 0x40a flags 0x12 d0
(XEN) common/grant_table.c:3861:d0v4 Grant release 0x1 ref 0x409 flags 0x12 d0
(XEN) common/grant_table.c:3861:d0v4 Grant release 0 ref 0x408 flags 0x12 d0
(XEN) [VT-D]d0:PCIe: map 0000:65:00.1
(XEN) [VT-D]d0:PCIe: map 0000:65:00.0
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.0
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.1
(XEN) [VT-D]d21:PCIe: map 0000:65:00.0
(XEN) [VT-D]d21:PCIe: map 0000:65:00.1
(d21) mapping kernel into physical memory
(d21) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d21v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d21v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000606 unimplemented
(XEN) common/grant_table.c:1909:d21v0 Expanding d21 grant table from 1 to 2 frames
(XEN) d21: Forcing read-only access to MFN e0e8c
(XEN) d0: Forcing read-only access to MFN e0e8c
(XEN) d21: Forcing read-only access to MFN e0e8c
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x000000b0 unimplemented
(XEN) d21: Forcing read-only access to MFN e0e88
(XEN) d0: Forcing read-only access to MFN e0e88
(XEN) d21: Forcing read-only access to MFN e0e88
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v0 RDMSR 0x0000064d unimplemented
(XEN) d21 L1TF-vulnerable L1e c7ffefffff987e02 - Shadowing
(XEN) d21 L1TF-vulnerable L1e c7ffefffff987e02 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d21v1 RDMSR 0x000000b0 unimplemented
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v4 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v4 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v1 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v5 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (1 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v3 Could not allocate order=9 extent: id=30 memflags=0xc0 (0 of 178)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
(XEN) HVM d24v0 save: CPU
(XEN) HVM d24v1 save: CPU
(XEN) HVM d24v2 save: CPU
(XEN) HVM d24v3 save: CPU
(XEN) HVM d24 save: PIC
(XEN) HVM d24 save: IOAPIC
(XEN) HVM d24v0 save: LAPIC
(XEN) HVM d24v1 save: LAPIC
(XEN) HVM d24v2 save: LAPIC
(XEN) HVM d24v3 save: LAPIC
(XEN) HVM d24v0 save: LAPIC_REGS
(XEN) HVM d24v1 save: LAPIC_REGS
(XEN) HVM d24v2 save: LAPIC_REGS
(XEN) HVM d24v3 save: LAPIC_REGS
(XEN) HVM d24 save: PCI_IRQ
(XEN) HVM d24 save: ISA_IRQ
(XEN) HVM d24 save: PCI_LINK
(XEN) HVM d24 save: PIT
(XEN) HVM d24 save: RTC
(XEN) HVM d24 save: HPET
(XEN) HVM d24 save: PMTIMER
(XEN) HVM d24v0 save: MTRR
(XEN) HVM d24v1 save: MTRR
(XEN) HVM d24v2 save: MTRR
(XEN) HVM d24v3 save: MTRR
(XEN) HVM d24 save: VIRIDIAN_DOMAIN
(XEN) HVM d24v0 save: CPU_XSAVE
(XEN) HVM d24v1 save: CPU_XSAVE
(XEN) HVM d24v2 save: CPU_XSAVE
(XEN) HVM d24v3 save: CPU_XSAVE
(XEN) HVM d24v0 save: VIRIDIAN_VCPU
(XEN) HVM d24v1 save: VIRIDIAN_VCPU
(XEN) HVM d24v2 save: VIRIDIAN_VCPU
(XEN) HVM d24v3 save: VIRIDIAN_VCPU
(XEN) HVM d24v0 save: VMCE_VCPU
(XEN) HVM d24v1 save: VMCE_VCPU
(XEN) HVM d24v2 save: VMCE_VCPU
(XEN) HVM d24v3 save: VMCE_VCPU
(XEN) HVM d24v0 save: TSC_ADJUST
(XEN) HVM d24v1 save: TSC_ADJUST
(XEN) HVM d24v2 save: TSC_ADJUST
(XEN) HVM d24v3 save: TSC_ADJUST
(XEN) HVM d24v0 save: CPU_MSR
(XEN) HVM d24v1 save: CPU_MSR
(XEN) HVM d24v2 save: CPU_MSR
(XEN) HVM d24v3 save: CPU_MSR
(XEN) HVM24 restore: CPU 0
(XEN) common/memory.c:278:d0v0 Could not allocate order=9 extent: id=31 memflags=0xc0 (0 of 230)
(d24) HVM Loader
(d24) Detected Xen v4.18.4-pre
(d24) Xenbus rings @0xfeffc000, event channel 1
(d24) System requested SeaBIOS
(d24) CPU speed is 2195 MHz
(d24) Relocating guest memory for lowmem MMIO space disabled
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 0 changed 0 -> 5
(d24) PCI-ISA link 0 routed to IRQ5
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 1 changed 0 -> 10
(d24) PCI-ISA link 1 routed to IRQ10
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 2 changed 0 -> 11
(d24) PCI-ISA link 2 routed to IRQ11
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 3 changed 0 -> 5
(d24) PCI-ISA link 3 routed to IRQ5
(d24) pci dev 01:2 INTD->IRQ5
(d24) pci dev 01:3 INTA->IRQ10
(d24) pci dev 02:0 INTA->IRQ11
(d24) pci dev 03:0 INTA->IRQ5
(d24) pci dev 04:0 INTA->IRQ5
(d24) pci dev 06:0 INTA->IRQ11
(d24) pci dev 07:0 INTD->IRQ11
(d24) pci dev 08:0 INTA->IRQ5
(d24) pci dev 09:0 INTB->IRQ11
(d24) pci dev 0a:0 INTC->IRQ5
(d24) pci dev 0b:0 INTA->IRQ5
(d24) pci dev 0c:0 INTA->IRQ5
(d24) pci dev 0d:0 INTA->IRQ10
(d24) pci dev 0e:0 INTA->IRQ11
(d24) pci dev 0f:0 INTA->IRQ5
(d24) pci dev 10:0 INTA->IRQ5
(d24) pci dev 11:0 INTA->IRQ10
(d24) RAM in high memory; setting high_mem resource base to 9df800000
(d24) pci dev 02:0 bar 14 size 001000000: 0f0000008
(d24) pci dev 05:0 bar 10 size 001000000: 0f1000008
(d24) pci dev 06:0 bar 30 size 000040000: 0f2000000
(d24) pci dev 05:0 bar 30 size 000010000: 0f2040000
(d24) pci dev 03:0 bar 10 size 000004000: 0f2050000
(d24) pci dev 04:0 bar 20 size 000004000: 0f205400c
(d24) pci dev 04:0 bar 14 size 000001000: 0f2058000
(d24) pci dev 05:0 bar 18 size 000001000: 0f2059000
(d24) pci dev 07:0 bar 10 size 000001000: 0f205a000
(d24) pci dev 02:0 bar 10 size 000000100: 00000c001
(d24) pci dev 06:0 bar 10 size 000000100: 00000c101
(d24) pci dev 06:0 bar 14 size 000000100: 0f205b000
(d24) pci dev 04:0 bar 10 size 000000040: 00000c201
(d24) pci dev 01:2 bar 20 size 000000020: 00000c241
(d24) pci dev 08:0 bar 20 size 000000020: 00000c261
(d24) pci dev 09:0 bar 20 size 000000020: 00000c281
(d24) pci dev 0a:0 bar 20 size 000000020: 00000c2a1
(d24) pci dev 01:1 bar 20 size 000000010: 00000c2c1
(d24) pci dev 0b:0 bar 10 size 000000008: 00000c2d1
(d24) pci dev 0c:0 bar 10 size 000000008: 00000c2d9
(d24) pci dev 0d:0 bar 10 size 000000008: 00000c2e1
(d24) pci dev 0e:0 bar 10 size 000000008: 00000c2e9
(d24) pci dev 0f:0 bar 10 size 000000008: 00000c2f1
(d24) pci dev 10:0 bar 10 size 000000008: 00000c2f9
(d24) pci dev 11:0 bar 10 size 000000008: 00000c301
(d24) Multiprocessor initialisation:
(d24)  - CPU0 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d24)  - CPU1 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d24)  - CPU2 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d24)  - CPU3 ... 46-bit phys ... fixed MTRRs ... var MTRRs [2/8] ... done.
(d24) Writing SMBIOS tables ...
(d24) Loading SeaBIOS ...
(d24) Creating MP tables ...
(d24) Loading ACPI ...
(d24) vm86 TSS at fc100400
(d24) BIOS map:
(d24)  10000-100e3: Scratch space
(d24)  c0000-fffff: Main BIOS
(d24) E820 table:
(d24)  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d24)  HOLE: 00000000:000a0000 - 00000000:000c0000
(d24)  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d24)  [02]: 00000000:00100000 - 00000000:f0000000: RAM
(d24)  HOLE: 00000000:f0000000 - 00000000:fc000000
(d24)  [03]: 00000000:fc000000 - 00000000:fc00b000: NVS
(d24)  [04]: 00000000:fc00b000 - 00000001:00000000: RESERVED
(d24)  [05]: 00000001:00000000 - 00000009:df800000: RAM
(d24) Invoking SeaBIOS ...
(d24) SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen)
(d24) BUILD: gcc: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0 binutils: (GNU Binutils for Ubuntu) 2.38
(d24) 
(d24) Found Xen hypervisor signature at 40000100
(d24) Running on QEMU (i440fx)
(d24) xen: copy e820...
(d24) Relocating init from 0x000d4760 to 0xeefeb2c0 (size 85152)
(d24) Found 21 PCI devices (max PCI bus is 00)
(d24) Allocated Xen hypercall page at effff000
(d24) Detected Xen v4.18.4-pre
(d24) xen: copy BIOS tables...
(d24) Copying SMBIOS from 0x00010020 to 0x000f5aa0
(d24) Copying MPTABLE from 0xfc100270/fc100280 to 0x000f5980
(d24) Copying PIR from 0x00010040 to 0x000f5900
(d24) Copying ACPI RSDP from 0x000100c0 to 0x000f58d0
(d24) table(50434146)=0xfc00a370 (via xsdt)
(d24) Using pmtimer, ioport 0xb008
(d24) table(50434146)=0xfc00a370 (via xsdt)
(d24) ACPI: parse DSDT at 0xfc001040 (len 37539)
(d24) parse_termlist: parse error, skip from 16/27641
(d24) parse_termlist: parse error, skip from 87/6041
(d24) Scan for VGA option rom
(d24) Running option rom at c000:0003
(d24) pmm call arg1=0
(d24) Turning on vga text mode console
(d24) SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen)
(d24) Machine UUID 1919b33b-e382-4473-b798-222d525f2309
(d24) EHCI init on dev 00:07.0 (regs=0xf205a020)
(d24) UHCI init on dev 00:01.2 (io=c240)
(d24) UHCI init on dev 00:08.0 (io=c260)
(d24) UHCI init on dev 00:09.0 (io=c280)
(d24) UHCI init on dev 00:0a.0 (io=c2a0)
(d24) ATA controller 1 at 1f0/3f4/c2c0 (irq 14 dev 9)
(d24) ATA controller 2 at 170/374/c2c8 (irq 15 dev 9)
(d24) ata0-0: QEMU HARDDISK ATA-7 Hard-Disk (52000 MiBytes)
(d24) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d24) Searching bios-geometry for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d24) Searching bootorder for: HALT
(d24) Found 0 lpt ports
(d24) Found 2 serial ports
(d24) PS2 keyboard initialized
(d24) All threads complete.
(d24) Scan for option roms
(d24) Running option rom at ca00:0003
(d24) pmm call arg1=1
(d24) pmm call arg1=0
(d24) pmm call arg1=1
(d24) pmm call arg1=0
(d24) Searching bootorder for: /pci@i0cf8/*@6
(d24) 
(d24) Press ESC for boot menu.
(d24) 
(d24) Searching bootorder for: HALT
(d24) drive 0x000f5850: PCHS=16383/16/63 translation=lba LCHS=1024/255/63 s=106496000
(d24) Space available for UMB: cb000-e8800, f52c0-f5850
(d24) Returned 16773120 bytes of ZoneHigh
(d24) e820 map has 8 items:
(d24)   0: 0000000000000000 - 000000000009fc00 = 1 RAM
(d24)   1: 000000000009fc00 - 00000000000a0000 = 2 RESERVED
(d24)   2: 00000000000f0000 - 0000000000100000 = 2 RESERVED
(d24)   3: 0000000000100000 - 00000000effff000 = 1 RAM
(d24)   4: 00000000effff000 - 00000000f0000000 = 2 RESERVED
(d24)   5: 00000000fc000000 - 00000000fc00b000 = 4 NVS
(d24)   6: 00000000fc00b000 - 0000000100000000 = 2 RESERVED
(d24)   7: 0000000100000000 - 00000009df800000 = 1 RAM
(d24) enter handle_19:
(d24)   NULL
(d24) Booting from Hard Disk...
(d24) Booting from 0000:7c00
(d22) mapping kernel into physical memory
(d22) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d22v0 Expanding d22 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d22v0 Expanding d22 grant table from 2 to 3 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d22v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d22v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) common/grant_table.c:1909:d22v0 Expanding d22 grant table from 3 to 4 frames
(d23) mapping kernel into physical memory
(d23) about to get started...
(d26) mapping kernel into physical memory
(d26) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d23v0 Expanding d23 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d23v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(d27) mapping kernel into physical memory
(d27) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x0000064d unimplemented
(XEN) common/grant_table.c:1909:d26v1 Expanding d26 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d26v1 Expanding d26 grant table from 2 to 3 frames
(d25) mapping kernel into physical memory
(d25) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1175:d26v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d26v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d27v0 Expanding d27 grant table from 1 to 2 frames
(d30) mapping kernel into physical memory
(d30) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1175:d27v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) d24: VIRIDIAN GUEST_OS_ID: vendor: 0x1 os: 0x4 major: 0xa minor: 0 sp: 0 build: 0x271b
(XEN) d24: VIRIDIAN HYPERCALL: enabled: 1 pfn: 0x215
(XEN) d24v0: VIRIDIAN VP_ASSIST: pfn: 0xc
(XEN) d24: VIRIDIAN HVCALL_NOTIFY_LONG_SPIN_WAIT
(XEN) d24: VIRIDIAN MSR_TIME_REF_COUNT: accessed
(d29) mapping kernel into physical memory
(d29) about to get started...
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000034 unimplemented
(d31) mapping kernel into physical memory
(d31) about to get started...
(XEN) common/grant_table.c:1909:d25v0 Expanding d25 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d30v0 Expanding d30 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d25v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d30v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000034 unimplemented
(XEN) common/grant_table.c:1909:d29v1 Expanding d29 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d29v1 Expanding d29 grant table from 2 to 3 frames
(XEN) common/grant_table.c:1909:d31v0 Expanding d31 grant table from 1 to 2 frames
(XEN) arch/x86/pv/emul-priv-op.c:1175:d29v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d29v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d31v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000606 unimplemented
(XEN) d24v1: VIRIDIAN VP_ASSIST: pfn: 0x3ffff
(XEN) d24v2: VIRIDIAN VP_ASSIST: pfn: 0x3fffe
(XEN) d24v3: VIRIDIAN VP_ASSIST: pfn: 0x3ffef
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v1 RDMSR 0x000000b0 unimplemented
(XEN) common/grant_table.c:1909:d29v0 Expanding d29 grant table from 3 to 4 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x0000064d unimplemented
(XEN) common/grant_table.c:1909:d26v1 Expanding d26 grant table from 3 to 4 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x000000b0 unimplemented
(d28) mapping kernel into physical memory
(d28) about to get started...
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 0 changed 5 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 1 changed 10 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 2 changed 11 -> 0
(XEN) arch/x86/hvm/irq.c:367: Dom24 PCI link 3 changed 5 -> 0
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v1 RDMSR 0x000000b0 unimplemented
(XEN) d24v0: upcall vector a1
(XEN) d24v1: upcall vector a1
(XEN) d24v2: upcall vector a1
(XEN) d24v3: upcall vector a1
(XEN) Dom24 callback via changed to GSI 24
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x0000064e unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x00000034 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d28v0 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1175:d28v1 WRMSR 0x00000150 val 0x8000001c00000000 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v1 RDMSR 0x00000606 unimplemented
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 2 to 3 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 3 to 4 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 4 to 5 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 5 to 6 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 6 to 7 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 7 to 8 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 8 to 9 frames
(XEN) common/grant_table.c:1909:d24v1 Expanding d24 grant table from 1 to 2 frames
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 9 to 10 frames
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d24v0 RDMSR 0x0000019a unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d24v0 RDMSR 0x0000019b unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x00000641 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d28v0 RDMSR 0x0000064d unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d24v1 RDMSR 0x0000019a unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3446:d24v1 RDMSR 0x0000019b unimplemented
(XEN) common/grant_table.c:1909:d24v1 Expanding d24 grant table from 2 to 3 frames
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v1 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d22v0 RDMSR 0x000000b0 unimplemented
(XEN) d29 L1TF-vulnerable L1e c7ffe7ffff981202 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d26v1 RDMSR 0x000000b0 unimplemented
(XEN) d30 L1TF-vulnerable L1e c7ffe7ffff987c02 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d29v1 RDMSR 0x000000b0 unimplemented
(XEN) d25 L1TF-vulnerable L1e c7ffe7ffff987402 - Shadowing
(XEN) d27 L1TF-vulnerable L1e c7ffe7ffff987602 - Shadowing
(XEN) common/grant_table.c:1909:d28v0 Expanding d28 grant table from 10 to 11 frames
(XEN) d31 L1TF-vulnerable L1e c7ffe7ffff98a002 - Shadowing
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d23v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d31v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d27v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d30v0 RDMSR 0x000000b0 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000639 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000611 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000619 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x00000606 unimplemented
(XEN) arch/x86/pv/emul-priv-op.c:1017:d25v0 RDMSR 0x000000b0 unimplemented
(XEN) d26 L1TF-vulnerable L1e c7ffe7ffff8ee802 - Shadowing
(XEN) d22 L1TF-vulnerable L1e c7ffe7ffff988402 - Shadowing 

##### -> our domain orchestration tool has cleaned up and is starting the driver domain again
##### -> after recovery the 'big' guest has started ok suggesting the ordering is significant

root@intel-xen-host:~# xl list
Name                                        ID   Mem VCPUs  State   Time(s)
Domain-0                                     0 16298     6     r-----    1586.0
Xenstore                                     1    64     1     -b----      10.5
netdd                                       21   576     2     -b----      69.1
infra01                                     22   800     2     ------      50.7
infra02                                     23   750     1     r-----      27.6
payload01                                   24 40200     4     ------      23.7
infra03                                     25   384     1     r-----      25.2
infra04                                     26  1400     2     r-----      41.3
infra05                                     27   384     1     ------      26.0
infra06                                     28  2048     2     r-----      33.0
infra07                                     29   448     2     ------      36.6
infra08                                     30   356     1     r-----      24.8
infra09                                     31   460     1     ------      23.9

root@intel-xen-host:~# xl info
host                   : intel-xen-host
release                : 6.8.0-48-generic
version                : #48~22.04.1 SMP PREEMPT_DYNAMIC Thu Oct 24 08:09:57 UTC 
machine                : x86_64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 2
cpu_mhz                : 2194.844
hw_caps                : bfebfbff:77fef3ff:2c100800:00000121:0000000f:d29ffffb:00000008:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap shadow iommu_hap_pt_share vmtrace gnttab-v1 gnttab-v2
total_memory           : 65192
free_memory            : 183
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 18
xen_extra              : .4-pre
xen_version            : 4.18.4-pre
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0x0
xen_changeset          : Fri Nov 15 14:07:55 2024 +0000 git:05ee7d9083-dirty
xen_commandline        : placeholder console=vga,com2 dom0_max_vcpus=4-8 dom0_mem=min:6144,max:65536m iommu=on,required,intpost,verbose,debug x2apic=off sched=credit2 flask=enforcing gnttab_max_frames=128 xpti=off smt=on cpufreq=xen:performance spec-ctrl=gds-mit=0 com2=115200,8n1
cc_compiler            : gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
cc_compile_by          : 
cc_compile_domain      : 
cc_compile_date        : Wed Nov 27 17:18:46 UTC 2024
build_id               : 0adefb2a5aa28a52782a7c8481ebd48539af86d0
xend_config_format     : 4

##### -> if the big guest memory is set to 40500 xl reports:

xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't allocate low memory for domain: Out of memory
libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init failed: Cannot allocate memory
libxl: error: libxl_create.c:1662:domcreate_rebuild_done: Domain 32:cannot (re-)build domain: -3
libxl: error: libxl_domain.c:354:libxl_domain_info: Domain 32:Getting domain info: No such process
libxl: error: libxl_domain.c:1245:libxl__destroy_domid: Domain 32:Non-existant domain
libxl: error: libxl_domain.c:1199:domain_destroy_callback: Domain 32:Unable to destroy guest
libxl: error: libxl_domain.c:1126:domain_destroy_cb: Domain 32:Destruction of domain failed


--mynTevqUIMXVj7cQ--


