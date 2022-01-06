Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476DE486683
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 16:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254095.435618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5UNE-0007T8-Pz; Thu, 06 Jan 2022 15:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254095.435618; Thu, 06 Jan 2022 15:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5UNE-0007QP-Ml; Thu, 06 Jan 2022 15:08:16 +0000
Received: by outflank-mailman (input) for mailman id 254095;
 Thu, 06 Jan 2022 15:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ie2=RW=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1n5UND-0007QJ-Vq
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 15:08:16 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76a957be-6f02-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 16:08:12 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1n5UN8-0000am-9g; Thu, 06 Jan 2022 15:08:10 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id D7B05259396;
 Thu,  6 Jan 2022 15:08:09 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ww7j1znSggsh; Thu,  6 Jan 2022 15:08:09 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id AE7AA259391;
 Thu,  6 Jan 2022 15:08:09 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 9DC1B726; Thu,  6 Jan 2022 15:08:09 +0000 (GMT)
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
X-Inumbo-ID: 76a957be-6f02-11ec-81c0-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Thu, 6 Jan 2022 15:08:09 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: alexander.rossa@ncr.com, Jan Beulich <jbeulich@suse.com>
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Message-ID: <20220106150809.GA856484@dingwall.me.uk>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211105152501.GA485838@dingwall.me.uk>
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

> > On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:                                                                            
> >> On 21.07.2021 11:29, James Dingwall wrote:                                                                                             
> >>> We have a system which intermittently starts up and reports an incorrect cpu frequency:                                               
...
> > I'm sorry to ask, but have you got around to actually doing that? Or
> > else is resolving this no longer of interest?

We have experienced an occurence of this issue on 4.14.3 with 'loglvl=all'
present on the xen command line.  I have attached the 'xl dmesg' output for
the fast MHz boot, the diff from the normal case is small so I've not added
that log separately:

--- normal-mhz/xl-dmesg.txt     2022-01-06 14:13:47.231465234 +0000
+++ funny-mhz/xl-dmesg.txt      2022-01-06 13:45:43.825148510 +0000
@@ -211,7 +211,7 @@
 (XEN)  cap enforcement granularity: 10ms
 (XEN) load tracking window length 1073741824 ns
 (XEN) Platform timer is 24.000MHz HPET
-(XEN) Detected 2294.639 MHz processor.
+(XEN) Detected 7623.412 MHz processor.
 (XEN) EFI memory map:
 (XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
 (XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
@@ -616,6 +616,7 @@
 (XEN) PCI add device 0000:b7:00.1
 (XEN) PCI add device 0000:b7:00.2
 (XEN) PCI add device 0000:b7:00.3
+(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
 (XEN) [VT-D]d0:PCIe: unmap 0000:65:00.2
 (XEN) [VT-D]d32753:PCIe: map 0000:65:00.2
 (XEN) [VT-D]d0:PCIe: unmap 0000:65:00.1

I also have the dom0 kernel dmesg available if that would be useful but I've
left it off initially because the log is quite large.  I don't see much in
the diff between boots except where speed/times are reported and where things
are initialised in a slightly different order.

Thanks,
James

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="xl-dmesg.txt"
Content-Transfer-Encoding: 8bit

(XEN) parameter "basevideo" unknown!
 Xen 4.14.3
(XEN) Xen version 4.14.3 (@) (gcc (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0) debug=n  Fri Dec 10 16:11:21 UTC 2021
(XEN) Latest ChangeSet: Fri Dec 10 16:10:15 2021 +0000 git:a598336409-dirty
(XEN) build-id: 7b441504c9977229a3c6779041ea6493
(XEN) Bootloader: EFI
(XEN) Command line: console=vga,com2 com2=115200,8n1 basevideo dom0_max_vcpus=4 dom0_mem=min:6144,max:65536m iommu=on,required,intpost,verbose,debug sched=credit2 flask=enforcing gnttab_max_frames=128 xpti=off smt=on loglvl=all
(XEN) Xen image load base address: 0x5d400000
(XEN) Video information:
(XEN)  VGA is graphics mode 1024x768, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 85 (0x55), Stepping 4 (raw 00050654)
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 000000006965efff] (usable)
(XEN)  [000000006965f000, 000000006bee5fff] (reserved)
(XEN)  [000000006bee6000, 000000006c0a6fff] (usable)
(XEN)  [000000006c0a7000, 000000006ca43fff] (ACPI NVS)
(XEN)  [000000006ca44000, 000000006ed16fff] (reserved)
(XEN)  [000000006ed17000, 000000006fffffff] (usable)
(XEN)  [0000000070000000, 000000008fffffff] (reserved)
(XEN)  [00000000fd000000, 00000000fe7fffff] (reserved)
(XEN)  [00000000fed20000, 00000000fed44fff] (reserved)
(XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000207fffffff] (usable)
(XEN) ACPI: RSDP 6C0A7000, 0024 (r2 SUPERM)
(XEN) ACPI: XSDT 6C0A70C8, 0114 (r1 SUPERM   SUPERM  1072009 AMI     10013)
(XEN) ACPI: FACP 6C0E9D78, 0114 (r6 SUPERM SMCI--MB  1072009 INTL 20091013)
(XEN) ACPI: DSDT 6C0A7278, 42AFC (r2 SUPERM SMCI--MB  1072009 INTL 20091013)
(XEN) ACPI: FACS 6CA42080, 0040
(XEN) ACPI: FPDT 6C0E9E90, 0044 (r1                  1072009 AMI     10013)
(XEN) ACPI: FIDT 6C0E9ED8, 009C (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: SPMI 6C0E9F78, 0041 (r5 SUPERM SMCI--MB        0 AMI.        0)
(XEN) ACPI: UEFI 6C0E9FC0, 0048 (r1 SUPERM SMCI--MB  1072009       1000013)
(XEN) ACPI: UEFI 6C0EA008, 005C (r1  INTEL RstUefiV        0             0)
(XEN) ACPI: MCFG 6C0EA068, 003C (r1 SUPERM SMCI--MB  1072009 MSFT       97)
(XEN) ACPI: HPET 6C0EA0A8, 0038 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: APIC 6C0EA0E0, 071E (r3 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: MIGT 6C0EA800, 0040 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: MSCT 6C0EA840, 004E (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: PCAT 6C0EA890, 0068 (r2 SUPERM SMCI--MB        2 INTL 20091013)
(XEN) ACPI: PCCT 6C0EA8F8, 006E (r1 SUPERM SMCI--MB        2 INTL 20091013)
(XEN) ACPI: RASF 6C0EA968, 0030 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: SLIT 6C0EA998, 002D (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: SRAT 6C0EA9C8, 0A30 (r3 SUPERM SMCI--MB        2 INTL 20091013)
(XEN) ACPI: SVOS 6C0EB3F8, 0032 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: WDDT 6C0EB430, 0040 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: OEM4 6C0EB470, 28A0C (r2  INTEL CPU  CST     3000 INTL 20140828)
(XEN) ACPI: OEM1 6C113E80, A8CC (r2  INTEL CPU EIST     3000 INTL 20140828)
(XEN) ACPI: SSDT 6C11E750, CEB8 (r2  INTEL SSDT  PM     4000 INTL 20140828)
(XEN) ACPI: SSDT 6C12B608, 065B (r2 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: BGRT 6C12BC68, 0038 (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: SSDT 6C12BCA0, 1368 (r2  INTEL SpsNm           2 INTL 20140828)
(XEN) ACPI: DMAR 6C12D008, 0138 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: HEST 6C12D140, 00A8 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: BERT 6C12D1E8, 0030 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: ERST 6C12D218, 0230 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: EINJ 6C12D448, 0150 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: WSMT 6C12D598, 0028 (r1     ën           1072009 AMI     10013)
(XEN) System RAM: 130730MB (133868196kB)
(XEN) SRAT: PXM 0 -> APIC 00000000 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000002 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000004 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000006 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000008 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0000000a -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0000000c -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0000000e -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000001 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000003 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000005 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000007 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 00000009 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0000000b -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0000000d -> Node 0
(XEN) SRAT: PXM 0 -> APIC 0000000f -> Node 0
(XEN) SRAT: Node 0 PXM 0 0-80000000
(XEN) SRAT: Node 0 PXM 0 100000000-2080000000
(XEN) NUMA: Using 20 for the hash shift.
(XEN) Domain heap initialised
(XEN) vesafb: framebuffer at 0x00000000a9000000, mapped to 0xffff82c000201000, using 3072k, total 3072k
(XEN) vesafb: mode is 1024x768x32, linelength=4096, font 8x14
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
(XEN) SMBIOS 3.1 present.
(XEN) x2APIC mode is already enabled by BIOS.
(XEN) Using APIC driver x2apic_cluster
(XEN) XSM Framework v1.0.0 initialized
(XEN) Policy len 0x33a8, start at ffff83207fffc000.
(XEN) Flask: 128 avtab hash slots, 454 rules.
(XEN) Flask: 128 avtab hash slots, 454 rules.
(XEN) Flask:  4 users, 3 roles, 45 types, 2 bools
(XEN) Flask:  13 classes, 454 rules
(XEN) Flask:  Starting in enforcing mode.
(XEN) ACPI: PM-Timer IO Port: 0x508 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:504,1:0], pm1x_evt[1:500,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 6ca42080/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[6ca4208c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: X2APIC (apic_id[0x00] uid[0x00] enabled)
(XEN) ACPI: X2APIC (apic_id[0x02] uid[0x02] enabled)
(XEN) ACPI: X2APIC (apic_id[0x04] uid[0x04] enabled)
(XEN) ACPI: X2APIC (apic_id[0x06] uid[0x06] enabled)
(XEN) ACPI: X2APIC (apic_id[0x08] uid[0x08] enabled)
(XEN) ACPI: X2APIC (apic_id[0x0a] uid[0x0a] enabled)
(XEN) ACPI: X2APIC (apic_id[0x0c] uid[0x0c] enabled)
(XEN) ACPI: X2APIC (apic_id[0x0e] uid[0x0e] enabled)
(XEN) ACPI: X2APIC (apic_id[0x01] uid[0x01] enabled)
(XEN) ACPI: X2APIC (apic_id[0x03] uid[0x03] enabled)
(XEN) ACPI: X2APIC (apic_id[0x05] uid[0x05] enabled)
(XEN) ACPI: X2APIC (apic_id[0x07] uid[0x07] enabled)
(XEN) ACPI: X2APIC (apic_id[0x09] uid[0x09] enabled)
(XEN) ACPI: X2APIC (apic_id[0x0b] uid[0x0b] enabled)
(XEN) ACPI: X2APIC (apic_id[0x0d] uid[0x0d] enabled)
(XEN) ACPI: X2APIC (apic_id[0x0f] uid[0x0f] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
(XEN) ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
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
(XEN) [VT-D]Host address width 46
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = c5ffc000
(XEN) [VT-D]drhd->address = c5ffc000 iommu->reg = ffff82c00051e000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:16:05.4
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = e0ffc000
(XEN) [VT-D]drhd->address = e0ffc000 iommu->reg = ffff82c000520000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:64:05.4
(XEN) [VT-D] bridge: 0000:64:03.0 start=64 sec=65 sub=65
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = fbffc000
(XEN) [VT-D]drhd->address = fbffc000 iommu->reg = ffff82c000522000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:b2:05.4
(XEN) [VT-D] bridge: 0000:b2:00.0 start=b2 sec=b3 sub=b7
(XEN) [VT-D]found ACPI_DMAR_DRHD:
(XEN) [VT-D]  dmaru->address = aaffc000
(XEN) [VT-D]drhd->address = aaffc000 iommu->reg = ffff82c000524000
(XEN) [VT-D]cap = 8d2078c106f0466 ecap = f020df
(XEN) [VT-D] IOAPIC: 0000:f0:1f.0
(XEN) [VT-D] IOAPIC: 0000:00:05.4
(XEN) [VT-D] MSI HPET: 0000:00:1f.0
(XEN) [VT-D]  flags: INCLUDE_ALL
(XEN) [VT-D]found ACPI_DMAR_RMRR:
(XEN) [VT-D] endpoint: 0000:00:14.0
(XEN) [VT-D]found ACPI_DMAR_ATSR:
(XEN) [VT-D]  atsru->all_ports: 0
(XEN) [VT-D] bridge: 0000:64:03.0 start=64 sec=65 sub=65
(XEN) [VT-D] bridge: 0000:b2:00.0 start=b2 sec=b3 sub=b7
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: aaffc000 rhsau->proximity_domain: 0
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: c5ffc000 rhsau->proximity_domain: 0
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: e0ffc000 rhsau->proximity_domain: 0
(XEN) [VT-D]found ACPI_DMAR_RHSA:
(XEN) [VT-D]  rhsau->address: fbffc000 rhsau->proximity_domain: 0
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) ACPI: BGRT: invalidating v1 image at 0x6401e018
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 72 CPUs (56 hotplug CPUs)
(XEN) IRQ limits: 56 GSI, 3272 MSI/MSI-X
(XEN) CPU0: TSC: ratio: 184 / 2
(XEN) CPU0: bus: 100 MHz base: 2300 MHz max: 3000 MHz
(XEN) CPU0: 1000 ... 2300 MHz
(XEN) xstate: size: 0xa88 and states: 0x2ff
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 11, using 0x1
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features: IBRS/IBPB STIBP L1D_FLUSH SSBD MD_CLEAR
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk JMP, SPEC_CTRL: IBRS+ SSBD-, Other: IBPB L1D_FLUSH VERW BRANCH_HARDEN
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 46, Safe address 300000000000
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
(XEN)   Support for PV VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
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
(XEN) Detected 7623.412 MHz processor.
(XEN) EFI memory map:
(XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
(XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
(XEN)  000000003d000-000000003efff type=2 attr=000000000000000f
(XEN)  000000003f000-000000003ffff type=4 attr=000000000000000f
(XEN)  0000000040000-000000009ffff type=3 attr=000000000000000f
(XEN)  0000000100000-00000574f5fff type=7 attr=000000000000000f
(XEN)  00000574f6000-000005b1cffff type=2 attr=000000000000000f
(XEN)  000005b1d0000-000005b2cffff type=4 attr=000000000000000f
(XEN)  000005b2d0000-000005c8e2fff type=7 attr=000000000000000f
(XEN)  000005c8e3000-000005d20afff type=2 attr=000000000000000f
(XEN)  000005d20b000-000005d20bfff type=7 attr=000000000000000f
(XEN)  000005d20c000-000005d20cfff type=2 attr=000000000000000f
(XEN)  000005d20d000-000005e40cfff type=1 attr=000000000000000f
(XEN)  000005e40d000-000006899bfff type=4 attr=000000000000000f
(XEN)  000006899c000-0000068c28fff type=7 attr=000000000000000f
(XEN)  0000068c29000-000006965efff type=3 attr=000000000000000f
(XEN)  000006965f000-000006bee5fff type=0 attr=000000000000000f
(XEN)  000006bee6000-000006c0a6fff type=7 attr=000000000000000f
(XEN)  000006c0a7000-000006ca43fff type=10 attr=000000000000000f
(XEN)  000006ca44000-000006eb6bfff type=6 attr=800000000000000f
(XEN)  000006eb6c000-000006ed16fff type=5 attr=800000000000000f
(XEN)  000006ed17000-000006ee98fff type=4 attr=000000000000000f
(XEN)  000006ee99000-000006eeb7fff type=3 attr=000000000000000f
(XEN)  000006eeb8000-000006eee7fff type=4 attr=000000000000000f
(XEN)  000006eee8000-000006eeedfff type=3 attr=000000000000000f
(XEN)  000006eeee000-000006f0f5fff type=4 attr=000000000000000f
(XEN)  000006f0f6000-000006f108fff type=3 attr=000000000000000f
(XEN)  000006f109000-000006f12cfff type=4 attr=000000000000000f
(XEN)  000006f12d000-000006f143fff type=3 attr=000000000000000f
(XEN)  000006f144000-000006f16bfff type=4 attr=000000000000000f
(XEN)  000006f16c000-000006f1a3fff type=3 attr=000000000000000f
(XEN)  000006f1a4000-000006f1cbfff type=4 attr=000000000000000f
(XEN)  000006f1cc000-000006fffffff type=7 attr=000000000000000f
(XEN)  0000100000000-000207fffffff type=7 attr=000000000000000f
(XEN)  00000000a0000-00000000fffff type=0 attr=0000000000000000
(XEN)  0000070000000-000007fffffff type=0 attr=0000000000000000
(XEN)  0000080000000-000008fffffff type=11 attr=8000000000000001
(XEN)  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
(XEN)  00000fed20000-00000fed44fff type=11 attr=800000000000100d
(XEN)  00000ff000000-00000ffffffff type=11 attr=800000000000100d
(XEN) alt table ffff82d0406822b0 -> ffff82d04068d30e
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
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 5
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 128 KiB.
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
(XEN) alt table ffff82d0406822b0 -> ffff82d04068d30e
(XEN) Brought up 16 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
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
(XEN) NX (Execute Disable) protection active
(XEN) Dom0 has maximum 888 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x3600000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   000000201c000000->0000002020000000 (16745254 pages to be allocated)
(XEN)  Init. ramdisk: 000000207c322000->000000207fffba7a
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff83600000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008008000000
(XEN)  Start info:    ffffffff83600000->ffffffff836004b8
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff83601000->ffffffff83620000
(XEN)  Boot stack:    ffffffff83620000->ffffffff83621000
(XEN)  TOTAL:         ffffffff80000000->ffffffff83800000
(XEN)  ENTRY ADDRESS: ffffffff8289f180
(XEN) Dom0 has maximum 4 VCPUs
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
(XEN) [VT-D]d0:PCI: map 0000:00:11.1
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
(XEN) [VT-D]d0:PCIe: map 0000:b6:00.0
(XEN) [VT-D]d0:PCIe: map 0000:b7:00.0
(XEN) [VT-D]d0:PCIe: map 0000:b7:00.1
(XEN) [VT-D]d0:PCIe: map 0000:b7:00.2
(XEN) [VT-D]d0:PCIe: map 0000:b7:00.3
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c000522000
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c000520000
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c00051e000
(XEN) [VT-D]iommu_enable_translation: iommu->reg = ffff82c000524000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 2048kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:04.1
(XEN) PCI add device 0000:00:04.2
(XEN) PCI add device 0000:00:04.3
(XEN) PCI add device 0000:00:04.4
(XEN) PCI add device 0000:00:04.5
(XEN) PCI add device 0000:00:04.6
(XEN) PCI add device 0000:00:04.7
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:05.2
(XEN) PCI add device 0000:00:05.4
(XEN) PCI add device 0000:00:08.0
(XEN) PCI add device 0000:00:08.1
(XEN) PCI add device 0000:00:08.2
(XEN) PCI add device 0000:00:11.0
(XEN) PCI add device 0000:00:11.1
(XEN) PCI add device 0000:00:11.5
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.2
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.1
(XEN) PCI add device 0000:00:16.4
(XEN) PCI add device 0000:00:17.0
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.4
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.4
(XEN) PCI add device 0000:00:1f.5
(XEN) PCI add device 0000:02:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:16:05.0
(XEN) PCI add device 0000:16:05.2
(XEN) PCI add device 0000:16:05.4
(XEN) PCI add device 0000:16:08.0
(XEN) PCI add device 0000:16:08.1
(XEN) PCI add device 0000:16:08.2
(XEN) PCI add device 0000:16:08.3
(XEN) PCI add device 0000:16:08.4
(XEN) PCI add device 0000:16:08.5
(XEN) PCI add device 0000:16:08.6
(XEN) PCI add device 0000:16:08.7
(XEN) PCI add device 0000:16:09.0
(XEN) PCI add device 0000:16:09.1
(XEN) PCI add device 0000:16:09.2
(XEN) PCI add device 0000:16:09.3
(XEN) PCI add device 0000:16:09.4
(XEN) PCI add device 0000:16:09.5
(XEN) PCI add device 0000:16:09.6
(XEN) PCI add device 0000:16:09.7
(XEN) PCI add device 0000:16:0a.0
(XEN) PCI add device 0000:16:0a.1
(XEN) PCI add device 0000:16:0e.0
(XEN) PCI add device 0000:16:0e.1
(XEN) PCI add device 0000:16:0e.2
(XEN) PCI add device 0000:16:0e.3
(XEN) PCI add device 0000:16:0e.4
(XEN) PCI add device 0000:16:0e.5
(XEN) PCI add device 0000:16:0e.6
(XEN) PCI add device 0000:16:0e.7
(XEN) PCI add device 0000:16:0f.0
(XEN) PCI add device 0000:16:0f.1
(XEN) PCI add device 0000:16:0f.2
(XEN) PCI add device 0000:16:0f.3
(XEN) PCI add device 0000:16:0f.4
(XEN) PCI add device 0000:16:0f.5
(XEN) PCI add device 0000:16:0f.6
(XEN) PCI add device 0000:16:0f.7
(XEN) PCI add device 0000:16:10.0
(XEN) PCI add device 0000:16:10.1
(XEN) PCI add device 0000:16:1d.0
(XEN) PCI add device 0000:16:1d.1
(XEN) PCI add device 0000:16:1d.2
(XEN) PCI add device 0000:16:1d.3
(XEN) PCI add device 0000:16:1e.0
(XEN) PCI add device 0000:16:1e.1
(XEN) PCI add device 0000:16:1e.2
(XEN) PCI add device 0000:16:1e.3
(XEN) PCI add device 0000:16:1e.4
(XEN) PCI add device 0000:16:1e.5
(XEN) PCI add device 0000:16:1e.6
(XEN) PCI add device 0000:64:03.0
(XEN) PCI add device 0000:64:05.0
(XEN) PCI add device 0000:64:05.2
(XEN) PCI add device 0000:64:05.4
(XEN) PCI add device 0000:64:08.0
(XEN) PCI add device 0000:64:09.0
(XEN) PCI add device 0000:64:0a.0
(XEN) PCI add device 0000:64:0a.1
(XEN) PCI add device 0000:64:0a.2
(XEN) PCI add device 0000:64:0a.3
(XEN) PCI add device 0000:64:0a.4
(XEN) PCI add device 0000:64:0a.5
(XEN) PCI add device 0000:64:0a.6
(XEN) PCI add device 0000:64:0a.7
(XEN) PCI add device 0000:64:0b.0
(XEN) PCI add device 0000:64:0b.1
(XEN) PCI add device 0000:64:0b.2
(XEN) PCI add device 0000:64:0b.3
(XEN) PCI add device 0000:64:0c.0
(XEN) PCI add device 0000:64:0c.1
(XEN) PCI add device 0000:64:0c.2
(XEN) PCI add device 0000:64:0c.3
(XEN) PCI add device 0000:64:0c.4
(XEN) PCI add device 0000:64:0c.5
(XEN) PCI add device 0000:64:0c.6
(XEN) PCI add device 0000:64:0c.7
(XEN) PCI add device 0000:64:0d.0
(XEN) PCI add device 0000:64:0d.1
(XEN) PCI add device 0000:64:0d.2
(XEN) PCI add device 0000:64:0d.3
(XEN) PCI add device 0000:65:00.0
(XEN) PCI add device 0000:65:00.1
(XEN) PCI add device 0000:65:00.2
(XEN) PCI add device 0000:65:00.3
(XEN) PCI add device 0000:b2:00.0
(XEN) PCI add device 0000:b2:05.0
(XEN) PCI add device 0000:b2:05.2
(XEN) PCI add device 0000:b2:05.4
(XEN) PCI add device 0000:b2:12.0
(XEN) PCI add device 0000:b2:12.1
(XEN) PCI add device 0000:b2:12.2
(XEN) PCI add device 0000:b2:15.0
(XEN) PCI add device 0000:b2:16.0
(XEN) PCI add device 0000:b2:16.4
(XEN) PCI add device 0000:b2:17.0
(XEN) PCI add device 0000:b3:00.0
(XEN) PCI add device 0000:b4:00.0
(XEN) PCI add device 0000:b4:02.0
(XEN) PCI add device 0000:b4:03.0
(XEN) PCI add device 0000:b5:00.0
(XEN) PCI add device 0000:b6:00.0
(XEN) PCI add device 0000:b7:00.0
(XEN) PCI add device 0000:b7:00.1
(XEN) PCI add device 0000:b7:00.2
(XEN) PCI add device 0000:b7:00.3
(XEN) Platform timer appears to have unexpectedly wrapped 10 or more times.
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.2
(XEN) [VT-D]d32753:PCIe: map 0000:65:00.2
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.1
(XEN) [VT-D]d32753:PCIe: map 0000:65:00.1
(XEN) [VT-D]d0:PCIe: unmap 0000:65:00.0
(XEN) [VT-D]d32753:PCIe: map 0000:65:00.0
(XEN) [VT-D]d32753:PCIe: unmap 0000:65:00.2
(XEN) [VT-D]d2:PCIe: map 0000:65:00.2
(XEN) [VT-D]d32753:PCIe: unmap 0000:65:00.1
(XEN) [VT-D]d2:PCIe: map 0000:65:00.1
(XEN) [VT-D]d32753:PCIe: unmap 0000:65:00.0
(XEN) [VT-D]d2:PCIe: map 0000:65:00.0

--T4sUOijqQbZv57TR--

