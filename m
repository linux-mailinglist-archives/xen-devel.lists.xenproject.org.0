Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297AABD160
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 10:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990499.1374437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHHxQ-0003Cl-5r; Tue, 20 May 2025 08:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990499.1374437; Tue, 20 May 2025 08:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHHxQ-0003A5-3G; Tue, 20 May 2025 08:04:16 +0000
Received: by outflank-mailman (input) for mailman id 990499;
 Tue, 20 May 2025 08:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fBQm=YE=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1uHHxO-00039z-LQ
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 08:04:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2009::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 035fa9c4-3551-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 10:04:12 +0200 (CEST)
Received: from BN0PR04CA0014.namprd04.prod.outlook.com (2603:10b6:408:ee::19)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Tue, 20 May
 2025 08:04:07 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::10) by BN0PR04CA0014.outlook.office365.com
 (2603:10b6:408:ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 08:04:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 08:04:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 03:04:06 -0500
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
X-Inumbo-ID: 035fa9c4-3551-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIypA6XZO+C78W9rk/mkCjTKo6zWtGxdy4+YGVqGhj7BtV61E3aW8ui8FAP9fFgzMCyXy5jzAKwDxVE3crvArseuKgy5UXebgLsK3RlbTuIaH9do7TfFql+1cXE65pRDfPVgXP/jZZmOIn8Gu/ErYNRpyMygaLg7c2Wu5KVTOancWzXsMVyiVj2EmoNGEXppndv246qbRhX4zdHVhvcNyn00ut4aizzqdFHj9RFHlD4am1hRsxkTc6WpF0ZTPtu2WLs3CghSr7giZagq5c+MpD5hRF4n9hvugy2IGf5YJgfy/kIid1i6aKlkvAMtuiuv+RFc3LjgwlMaRo/OWPoYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX6goDAVlJoNdyg2xOdb685OsB6OXZAfj6LzRDkuLh4=;
 b=VCJ6BwDHt+ALCEgjKxpx/4XSJ5UijMTO/FWlSJiR2VDRWI8tZUrivPcX517edy25HUIvEFu+A6Ynnf9MkMrHqNQulfyc7odV9khMQNOWm/OY8+ui6lXEk/GebON/ODPypp2j/5KwDM9tGo6mEbkBj85NP3gHqcWoRnusZhPUog4bPad3dEgx+JsiKLlWmRkUPMUdQEsAGDEdm0o0M8ww8IeLqCFeBoH9sM7QixP3X5adLOgE0W2tth7s9WdFP/H1nRZ+yBUh3KgFy8JHVFOCAtKiDKd13LXGHyNMLtgx9+DxYO6ohBYopYU8Mp0zMJPS9x+pseA+iCrwPLTngBGgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX6goDAVlJoNdyg2xOdb685OsB6OXZAfj6LzRDkuLh4=;
 b=mZcC1Ws9umQ0UInWtDecz89Spb1whu+/W3CicY78jPLuY0LWpKFmIeEoBjcFIbYwD+QlhSVWfJHPdwsUFW7u0fHZM4TfngE4w3EQV3D8ieQ1q46Nwl0QSkUWJmIWnjy7Tj6e2Emi6d23PMei3j8h/AUvp7zLgWhjmtT9AVFfaPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 20 May 2025 10:04:05 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
CC: <xen-devel@lists.xenproject.org>
Subject: xen/arm: Virtio-PCI for dom0less on ARM
Message-ID: <aCw3ddB2CZUeEtyF@zapote>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6281d51a-797b-4db1-3967-08dd9774e550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVFUR25Ia0g4NkVFMzdGYXpVVkhNdUpEVzdZVkZmZWhDYjg2dnBHRG0yUVhK?=
 =?utf-8?B?Q1JlSXc0OHN0REJReUVmTTNQQTg1MFl3QzZ4QmpXdkxJc0RSdHBsRmI2YVUw?=
 =?utf-8?B?MFRuejBMZ1dlZUlISktmbXhjSTlYNWluSUdmZGZZbkYxZUxJcCtUdGZuTVoz?=
 =?utf-8?B?c2JaL0xJY3FGMUtIM1E1aDNTSmYySGVoL2RPdUhrOGpzd3NMeTJKZnY5SWJo?=
 =?utf-8?B?czBiT1JRUHNsbVN1UzBodml6RU1Ea2locnFRdGdORjRwL09SVEt6dmJueHZ1?=
 =?utf-8?B?MnJKZHh6MmJmSmR4dTZWdy90SG1tc1JBekVjZlJ2aVg1cEtPM1FiNUhPdjRn?=
 =?utf-8?B?UHZmWFI2bGc2STg4dDlxb3lhTy94cmUvOTdvbmFiZGNHY1NNRXlJTlo4VDdM?=
 =?utf-8?B?cE4zMkRrNHpaZm41bmN5cnIvZW4vUWlxZnJLQ09pRGs2WUM2ZkkwS1M5MGpB?=
 =?utf-8?B?clBiKytFVnpqczFoMUVyRUtnOGZJczhsMlkvNndva3VZRk84STZJS29ia3dy?=
 =?utf-8?B?cUwvQ0JzaDJOTkVDR0ZuempicTMzVlRlNVk1V3ZHc2l6QzNldmxpelIrL0Nr?=
 =?utf-8?B?VkxRWkE2VlJjaHVPc2ZJOWhZSFNqaXlXV013U0l3Q3IreVN4OGhDcG9YbGY4?=
 =?utf-8?B?VDdjSjJoczNxeVRmMVo4TWJ5c3M3enNTd2M4eFM1dXlsRG90NjdVT3F6eDNP?=
 =?utf-8?B?UEwxbVRKWjRFMzZsQkRhdSt3WDhmbHh3enVldzR2RXZQampSalBGUGlFVzJ1?=
 =?utf-8?B?UHJwNk1pR3RaQWFxTml0UVduTHZLcmVMOXpqRzhwbWdRWlBxTkhyZnZkTGM1?=
 =?utf-8?B?dlNtdzdwbnBDYng2VFQ4ckVnajJWVzE1QXg4S0NCZW4rN0lWdEVVZ3A1S2VJ?=
 =?utf-8?B?bmg5K0hOdE1uYm9TODF5Vzk5UkFhSjA3cExBOFJqQ09DYWxjcnluWmJ6S1lz?=
 =?utf-8?B?Q3JDdXdFUUQ1RG1Pak0wZlNYa1lBdTJqMUIxWm9iS083akY5SnlSUlNGQnFU?=
 =?utf-8?B?ZmRQYlhicmNOR2RQc0FLYkk1YllTWEhOenZWQUZuVWZuZ2pNcFZMaDEyYURD?=
 =?utf-8?B?blNCRGFqOXhJM1A4cFRZeWkrcDRRWU1ud2NOZ3RBMjMyWEtuUmpNR0lVQVZY?=
 =?utf-8?B?Ly9neDIvMUhEU0graDR0WkJCdWExamxmeER4SjVSZzNkRDRCcC90RGxobk95?=
 =?utf-8?B?V0NJZFV1bllOd2dkc0lhY2Y1UHNQMjVkRndYU21RcHZCZ3VYT2hEaW5hL0tk?=
 =?utf-8?B?ZTl2Zlo1RDVpUUMyOVNVeGlaTllBUU9PQnRkSHpyU1hZb0gxVzA5ZVdvbDQ1?=
 =?utf-8?B?VTBjSm9lRGVKS2tHYWZ4UWJUamo0OVV2RUMyYmJJejR5MDBTTmsvL3Rnc1Vo?=
 =?utf-8?B?K01ud3V6a2srMjJUcVpKcVdweXlycFg3bkRqcnNKdk9uODRnT05EekxXeU5x?=
 =?utf-8?B?RnozdHFYNE1SZmdUb28zSnZrempYT3VxdkNyaWRWTmNPTjB4dC95eWVzc3NV?=
 =?utf-8?B?NE9GRkhDU1BkTXQ1b3VPS01Uek4rVElnZUFWVHJ0dUpBSGI2RlpPeUMyd3h1?=
 =?utf-8?B?V29BMUluS3VCbFBDRUdkYnRzU3lXMUt2UDFmajJEZDN0ME5Cb2p0VUJ1cHFO?=
 =?utf-8?B?cDB1SFp5U3k1NkJEaXlLWHBTVzFRNCswbng2UklsbmVpUVNkT0VldUJOMDlr?=
 =?utf-8?B?YUdDR0Vkek16cU9zeWt4RXdUZ3UzcGlRMWV1Ymhwdng3OWhMSDRsUGNacTRQ?=
 =?utf-8?B?NUd5TTRFbVJDeDZINnVYK05TYTFGZ2hUeityMmI2Qy8rb0xzck1IcTJQRzVi?=
 =?utf-8?B?VStGb202d2lQRk9jb1ZnaWFqaE5PQjkzczl1bE9zdzlUSjEvbDJOQlo5c2Zo?=
 =?utf-8?B?blp1UitYTTJWM0FEajl6RmNIR3NVMVFLUWxqQzJQa3ZiN0tVeTNwUEtKdkpL?=
 =?utf-8?B?NzZwV0txdEpsTWxoNytxMUozRTJhR1RkbHpMWUxWaS9qaWJKcTI1eDRWUlJv?=
 =?utf-8?B?S05RTHk0a3NKNVRmaUFGSTlFS1Jidno2aEdnQ2hWODdlenpMcEVQcU1TS2gr?=
 =?utf-8?B?WThuQllhRTdLWm1jU3pRc3Nsdjc2ZExmZUNMUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:04:07.5290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6281d51a-797b-4db1-3967-08dd9774e550
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541

Hi all,

Following up on the ARM virtio-pci series I posted a while back ago.

There have been some concerns around the delayed and silent apperance of
devices on the ECAM area. The spec is not super clear wether this is OK or
not but I'm providing some references to the PCI specs and to some real cases
where this is used for FPGAs.

There are two options how to implement virtio-pci that we've discussed:
1. VPCI + IOREQ
2. IOREQ only

There are pros and cons with both. For example with #1, has the benefit that
we would only have a single PCIe RC (in Xen) and we could emulate a hotplug
capable expansion port with a standard way to notify when PCI devices plug in.
Approach #2 has the benefit that there is (almost) no additional complexity
or code added to Xen, almost everything lives outside.
IMO, both options have merit and both could co-exist.

For dynamic xl flows, options #2 already works without modifications to Xen.
Users need to pass the correct command-line options to QEMU and a device-tree
fragment with the pci-generic-ecam-host device.

For static dom0less flows, we can do the same as for xl flows but we have the
additional problem of domU's PCI bus enumeration racing with QEMU.
On x86, when domU's access a memory range that has not yet got IOREQ's
connected to it, the accesses succeeds with reads returning 0xFFFFFFFF and
writes ignored. This makes it easy for guests to wait for IOREQ devices to
pop up since guests will find an empty bus and can initiate a rescan later
when QEMU attaches. On ARM, we trap on these accesses.

If we on ARM add support for MMIO background regions with a default read value,
i.e mmio handlers that have lower priority than IOREQs and that are
read-const + writes-ignored, we could support the same flow on ARM.
This may be generally useful for other devices as well (e.g virtio-mmio or
something else). We could also use this to defer PCI enumeration.

So the next versions of this series I was thinking to remove the PCI specifics
and instead add FDT bindings to ARM dom0less enabling setup of user
configurable (by address-range and read-value) background mmio regions.
Xen would then support option #2 without any PCI specifics added.

Thoughts?

Cheers,
Edgar

# References to spec

PCI express base specification:
7.5.1.1.1 Vendor ID Register (Offset 00h)
The Vendor ID register is HwInit and the value in this register identifies the manufacturer of the Function. In keeping with
PCI-SIG procedures, valid vendor identifiers must be allocated by the PCI-SIG to ensure uniqueness. Each vendor must
have at least one Vendor ID. It is recommended that software read the Vendor ID register to determine if a Function is
present, where a value of FFFFh indicates that no Function is present.

PCI Firmware Specification:
3.5 Device State at Firmware/Operating System Handoff
Page 34:
The operating system is required to configure PCI subsystems:
 During hotplug
 For devices that take too long to come out of reset
 PCI-to-PCI bridges that are at levels below what firmware is designed to configure

Page 36:
Note: The operating system does not have to walk all buses during boot. The kernel can
automatically configure devices on request; i.e., an event can cause a scan of I/O on demand.

FPGA's can be programmed at runtime and appear on the ECAM bus silently.
An PCI rescan needs to be triggered for the OS to discover the device:
Intel FPGAs:
https://www.intel.com/content/www/us/en/docs/programmable/683190/1-3-1/how-to-rescan-bus-and-re-enable-aer.html


