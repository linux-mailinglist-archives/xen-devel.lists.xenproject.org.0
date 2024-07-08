Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C429592A15D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755303.1163632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkq-0004a5-FQ; Mon, 08 Jul 2024 11:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755303.1163632; Mon, 08 Jul 2024 11:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQmkq-0004Xp-Ci; Mon, 08 Jul 2024 11:42:00 +0000
Received: by outflank-mailman (input) for mailman id 755303;
 Mon, 08 Jul 2024 11:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQmkp-00042h-9Q
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:41:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:200a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14d4aa0d-3d1f-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 13:41:58 +0200 (CEST)
Received: from BN7PR02CA0030.namprd02.prod.outlook.com (2603:10b6:408:20::43)
 by MW4PR12MB7432.namprd12.prod.outlook.com (2603:10b6:303:22d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:41:55 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:20:cafe::4b) by BN7PR02CA0030.outlook.office365.com
 (2603:10b6:408:20::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 11:41:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:41:54 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:41:50 -0500
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
X-Inumbo-ID: 14d4aa0d-3d1f-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9j5/RNdK47rKocWPaGOn8sv/FDf72RssvHOc3ml7s6K7NdQAAmheVx/1TGJJ94yXGL2EknWPxxYiCBFZsbRg/DB05mCHxcxU2QWdrD5nh8NzMtHnzi+8DX5eiR+lqCkSae84oMzMLoYQb1lglZUgaKvYMCHN+0i00mUcZXgemYjr3tVvDh915iEYFLF6UnZmoFC/4nRC7aS0R5m7hPZOmkF2IVhfxkHi62dx/ZsWP/uQCgtJdiyxk+9aWl56EYQLgRB9RgHMoRNkvJAuOOW1YS9E411x4tEPqDQfjeN081JrcOAMpxH41So1RoWF7Ij1VNahW6T/ypeW1sUXi3udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szi3iqQfbMQzivoN8ExWAziYbJZhc5SH7BnahLl6nJA=;
 b=cs5odoNzjBzWYiIaIN8at8IYZY2ts+rc5rim7fB4D6wzmnie6WfnxyAbYDOgSCtE8/kcNJGq3jxatPX41Y7nzCX2qlVCZv+ZcITYgmmt3W9klyuJaf7rfsNzTnZYdZ0AcBGVWnReiCjkL2LwnSAUI9gAVNT+o4Te+rNvxdWzDvL9hJDc6eWaDcLI5CuKJdZtlb8NiWYcWvikJ1gBSHCgz8cCw/c6nP0nsh9JqdXckcY1qyDzRSboFepHOZKGJpQqznItyyqY60Wc7wNlfd5Jd+p+VyHq/lNoT/gXBxyilyqqtYvaNJiiZ/F7TH1Cv/xrENGiTBlyrHdtvzhUHi6KIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szi3iqQfbMQzivoN8ExWAziYbJZhc5SH7BnahLl6nJA=;
 b=0jK59+CuSyL0UyagxDFSafhqK/7yLnL/mo5KU8z8ogKLI83URIimMUhx9Vpo8qqjgem15Sg5KaQ0mAiKMs5cV1B0bCaPG6HlperOQdXkT2O5OkUOQnl5rKFGuvbUPOk9AY7C2kmoAowuHdsfSi5FagnEw2+nMrI5zkC01TTx3Xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v12 3/7] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Mon, 8 Jul 2024 19:41:20 +0800
Message-ID: <20240708114124.407797-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708114124.407797-1-Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 7091c7f4-b1fa-430b-79d2-08dc9f42f75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SPucu6IMkVwJuyqLy+kkNrIm8wEv+5Q2BvhGUlMZxTH5Ndq7AnPbBI3UWVfp?=
 =?us-ascii?Q?rAD/Iq4yJplyn9CNL5kg8haVFdl7WitxItdsiOXAxgWLx+Em8dYXLr18haYf?=
 =?us-ascii?Q?Tf4fi8MM7/Y5ZkU4CoMwe1bQyqhmHl47cD9wkDsx8tTixh8c0cB622scGoaB?=
 =?us-ascii?Q?4fCgvoJwseNXTAoKRGkX6LPJ0pYlZ1TmE60NQxhwfAY5CAxXtt9oF0NY2VZr?=
 =?us-ascii?Q?dpTtqbuTjvodz8cQa2Xp2TUrMjM69z8AMusALKoi8hqbsEQHwj7R1WVeWPxQ?=
 =?us-ascii?Q?nebrwlz1uvZsRfin254Z8zfZ0nvOERoRvNN0ecS9LLic0c3jvQTLdLEhbWs0?=
 =?us-ascii?Q?TWP+UWK1aMv6x9Vh2Uyfg7877GMI+48Yqt7CrJO6YNpwjQ9C+W9vRMhumxeJ?=
 =?us-ascii?Q?5mn3J9Ox2QKDVaN3De0eJx5Qex6064/w1blCo2m0tvsbr+aDkMeImKli4baJ?=
 =?us-ascii?Q?Rgu2I1qzihwER+/86WT3u54meFIklSqmaehkQQT3EgzpEc6IIT5V0ksw5Q5B?=
 =?us-ascii?Q?vnNO7MN1UL/ntafEK52KnGtbDj09yNPfADgBJwkh0jmbUqs5hQCbtkp6jKRQ?=
 =?us-ascii?Q?3ZAAPdKMIOLTW90oYLLDVqFffBZL2ZDGFEeGxpYVsvHz9LUtXyrVrEXrsKij?=
 =?us-ascii?Q?Uv9PQL/43suhsSrY15Ogvu3T2bMaXWOMSlhpiYzczGCBJkbRHmUaqwEPr3Q7?=
 =?us-ascii?Q?4Nu2hiErg0NvkXpZ24nxvidls4kf4IoPH8v1u+BA4KwLnPpx7xQ0QaET2XE7?=
 =?us-ascii?Q?BOSwFzeE/FAPe3poPs6lmqoFWkeceQbDi77wzazxCHuUYaPr9GOqCEpuQPLl?=
 =?us-ascii?Q?JtYuorOPBL50N4C9N/OsX+Ryoe1PQkw3bIX/NYGi9oS18TniK2jAi+jmy9rL?=
 =?us-ascii?Q?ufTDyd6U7l5H6ZG+1YoqkGNmGOSlmYI/FVl5NThEA/0/EZlryh0kzWx5cFR3?=
 =?us-ascii?Q?wlYAA+3DBcZcutt5F3++mSSD1uIXkosmlxteUW3lm8JUw8fUnE+kIRazIsG3?=
 =?us-ascii?Q?EsEChfGf4pSFz/2fAj87VIciUN7B1L1AQV7Nz34j9gbv8IOBmVeyN4HYgPsv?=
 =?us-ascii?Q?SIMF5fGtwPUNK2A+u4Yumutoa7PxQNKTkRGhi/3avf1oG/8qYfpZLj/pCPdu?=
 =?us-ascii?Q?mIL4MDCJSK2yKJk+Mqhz2if+E3Pv7MJUh7UpnWPP1IWt0+XMaoVPFQZBxJek?=
 =?us-ascii?Q?wc/wsJL0M06bsy2YmluFs/wbePAYslRMqWmNo0oaurlFzvxNDR0x0dWXmbAM?=
 =?us-ascii?Q?iVaWEOltGr2dNmc102ZtvRXAWCBHddQZElVzbIdI9Eu+3F78yJji9A7F8+6R?=
 =?us-ascii?Q?skfIKb2qqnznaIc+ZsJNOj4v67z70Il30h5IaeGp0aVpT0+MZyI4xNx6RhqI?=
 =?us-ascii?Q?f9qYX8x04o0K/tUNfhDD+9bXppCas0BbOXK8Pt3/hhJ4gju5rTUeSXioh9jZ?=
 =?us-ascii?Q?nc/Lg3THufc+tixPT8FnQaGvzw0BqdP+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:41:54.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7091c7f4-b1fa-430b-79d2-08dc9f42f75d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432

The gsi of a passthrough device must be configured for it to be
able to be mapped into a hvm domU.
But When dom0 is PVH, the gsis may not get registered(see below
clarification), it causes the info of apic, pin and irq not be
added into irq_2_pin list, and the handler of irq_desc is not set,
then when passthrough a device, setting ioapic affinity and vector
will fail.

To fix above problem, on Linux kernel side, a new code will
need to call PHYSDEVOP_setup_gsi for passthrough devices to
register gsi when dom0 is PVH.

So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
purpose.

Clarify two questions:
First, why the gsi of devices belong to PVH dom0 can work?
Because when probe a driver to a normal device, it uses the normal
probe function of pci device, in its callstack, it requests irq
and unmask corresponding ioapic of gsi, then trap into xen and
register gsi finally.
Callstack is(on linux kernel side) pci_device_probe->
request_threaded_irq-> irq_startup-> __unmask_ioapic->
io_apic_write, then trap into xen hvmemul_do_io->
hvm_io_intercept-> hvm_process_io_intercept->
vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
So that the gsi can be registered.

Second, why the gsi of passthrough device can't work when dom0
is PVH?
Because when assign a device to passthrough, it uses the specific
probe function of pciback, in its callstack, it doesn't install a
fake irq handler due to the ISR is not running. So that
mp_register_gsi on Xen side is never called, then the gsi is not
registered.
Callstack is(on linux kernel side) pcistub_probe->pcistub_seize->
pcistub_init_device-> xen_pcibk_reset_device->
xen_pcibk_control_isr->isr_on==0.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 03ada3c880bd..cfe82d0f96ed 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -86,6 +86,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ENOSYS;
         break;
 
+    case PHYSDEVOP_setup_gsi:
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
-- 
2.34.1


