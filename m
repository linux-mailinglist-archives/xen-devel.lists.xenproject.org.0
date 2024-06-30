Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F7991D19A
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751114.1159009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlD-0008MJ-Q1; Sun, 30 Jun 2024 12:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751114.1159009; Sun, 30 Jun 2024 12:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlD-0008JW-MR; Sun, 30 Jun 2024 12:34:27 +0000
Received: by outflank-mailman (input) for mailman id 751114;
 Sun, 30 Jun 2024 12:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtlC-0007C0-Ei
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:26 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20618.outbound.protection.outlook.com
 [2a01:111:f403:240a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14b0a67c-36dd-11ef-b4bb-af5377834399;
 Sun, 30 Jun 2024 14:34:24 +0200 (CEST)
Received: from CH0PR03CA0182.namprd03.prod.outlook.com (2603:10b6:610:e4::7)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:34:13 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::b3) by CH0PR03CA0182.outlook.office365.com
 (2603:10b6:610:e4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:12 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:08 -0500
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
X-Inumbo-ID: 14b0a67c-36dd-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee1WY73v7qOEB8D4aUuIF0qMYn/Qw4dnvK1XczAO4Os1TTZdyph8ukVikRAdao9NGGC/esZfdC/t1rVelclF7+grplqXKKGXEMsXuXhQ51/RF/x3v7QvZnWRmvAEyIAORvKnAhvy3/ytEDcou8i/Zrm5YYhq+67Pt2A+CWIbjnGevOaekl0me31z5Hyu4UjZpgYNWZLXJdvgzCb2oVbQUrH8GQmQnzFl4iMQ1+e2XHpaWVBMmsbgyhOBGYWZa8nEdTzggt3TLdxXGHo5xUtaprz1mhqQl6yUE3CAEmT5uRvchEqAgNpV5+99QwBD0knpLsHyCDn0JNNt6i8LHoZUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvNzp09rHGoY9zYCVKlErNT4ho6RlTIpvWIBG8mH1Lo=;
 b=j1mhCxGrT3XyNuUEW7A8JdSG+V8WsG5R/Kpd2SELqZt9sjf7ev9nXMsYM7njEm5cxQCCl3Y90aXw/7DZRmsweqEJDdbBs4bZ5YKvik7RJ1K4w8nU4Jk/C3eOUsXgc4qH1tOwIIu+Fsjnh/BSTx/JRjJZo5HuqOhdbb8QLdPFLAdfjI2HmokwJ884dbltWMmC211IOq5Vw3+zc30a0GDKKlyRWF4L6jdYnnsO00nKaTWI8DSvU79qLoSEyOmjOPyQg6VikTWop1m5caun5h5YTG+IdjjbtU+FJm8FXVX+HebZM3ArPHB0yD254Faf+0pmTwnVkNcVEVRzp4hnPa6h0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvNzp09rHGoY9zYCVKlErNT4ho6RlTIpvWIBG8mH1Lo=;
 b=CG8Ilg/LgDS4F1K8BysueEdDUL61tvMV5/phlOH/WycrDt8CjsMg2s3MJ/+qs88Y5BgEl9JFKSGd38KFET5f18pueKzZaFFa5Du3WTTVO9A6oJkOnP6Zxw8iujc3NsFYpL/LMXPAb9cUQgyaaCsEqEtUpArHNkmvDG7P4gehza8=
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
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v11 3/8] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Sun, 30 Jun 2024 20:33:39 +0800
Message-ID: <20240630123344.20623-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630123344.20623-1-Jiqian.Chen@amd.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bcd5ed-0694-4ca5-5822-08dc9900f2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OmiCRUz9ca07Pr5U8tEwiGFU7SKER4srVsMwffpiipFz57QAGCWzFVaOwBzV?=
 =?us-ascii?Q?Cel8VPXOdbdH7XrCZKCVY2F8AhgbbeJxxfnx2PdUQ/auwhiSkdKSVtsWIMXB?=
 =?us-ascii?Q?lgxzSH+Myq/R+GXX20+1fHnpsAcONLEa/B8sA7gXNnSB93gUWr0pefjWBF0t?=
 =?us-ascii?Q?J5HxdsD4bId8ti/HL+bIjLj5SWqb3FCLOTHpj74x+4oOf7/G6D4taeZy9c2T?=
 =?us-ascii?Q?/WOYNZi/2wGC+EwDTwipOqry29raAKGRuPzFbDBLm/4525TiDqvH50awn1lv?=
 =?us-ascii?Q?Oqt0zsoJ9HNifPCuUppEYh0Qz6y9344RZdn7RoQcGJdUi6/PvJKsIULe/KSB?=
 =?us-ascii?Q?j12kybGV2BYmdqXwCkixuRQB/Tn6vyafrz8cfuC8ApGfX7vqSjFB1vQIf8Wq?=
 =?us-ascii?Q?hUC18TQ/b7WubYCAmq+VWcI3dvpJBA+1xj6QnyTRWasl0SzWWtk0bfmogRPK?=
 =?us-ascii?Q?WIi+Zyy8NNOmfjhzKGfGkizTHh+jgab9VoxCLHMFqSj47NbG3FZaaxQAZuMA?=
 =?us-ascii?Q?sGFmCTY2wVT4kMIlKDVMdWDOkYC6+O0dvxlLWqWvADiiiPWcS6sZ7AzMijZ5?=
 =?us-ascii?Q?KNWuduR+0gLTxh3kIXA4coVf3pyQnyLZ7/wPS4T+7SzEZjphVXVl80VVPGB/?=
 =?us-ascii?Q?Y/rm3XZc18NUSNV2XhnGZ8TumZ8kznPGwIcAPA2x3ilTdHTl5cP2bG4QU/lJ?=
 =?us-ascii?Q?r0ate2ik0QUr1MCGwe2CU4XjHK5AbEQ4xMEWprN4u2GfIeFmpOoyyLOHqpJa?=
 =?us-ascii?Q?PmXJN6JThr4Sff7DrFuDP9yCqu7jIQDbBeuxcT2nHVMcmTav6NO2CBRxZlbt?=
 =?us-ascii?Q?FiuBeo2i37A890aeol0eRgETBqItcnvhHJykqm1qpWu+yjl01X1PN4gUnrv6?=
 =?us-ascii?Q?L8+W7EsL7wUTNCPeiEtavVkuDUGy1HNv9fehhO9JTyog+5B4a71Exel3Nhe/?=
 =?us-ascii?Q?pFDWslKdiFYEkez3tv8Gy2iQ67r0MSVmu7siDQBdZDqy6iPr75HHovB38ta3?=
 =?us-ascii?Q?nBBJKRL0DN42TQzuLFm4gE2U2sTVAYiyHS4VekSEhWo/L4za8yzLDjqLtSd8?=
 =?us-ascii?Q?rE7OyJPMqoSQ7Clv7dnwK0tMl50e3BXOyUYYEMNaz087W5xoZGoEu0lj9aiO?=
 =?us-ascii?Q?16tSqz964vs5CQUgTiTAvTVpBqiFXSoYNKHzY3Z2UVPJEO7kj57eWCP0FS+S?=
 =?us-ascii?Q?3tdjDQ1GYUfV3HRGwr92a7XzwVTwNyG9o/SGWlmfnqlWwmqHFL0rsFERp7wi?=
 =?us-ascii?Q?A20WRI4WkUoZ8Sv3OKofHbXjgNfn6f6YowPiiaWgFre8VYd6t4y1E62gZb3q?=
 =?us-ascii?Q?FgWM/3FSOeryYCyYWQADMKUQ9i6RgjZjZpZCbJvL5blnx93LqmZ0/FEy6mMu?=
 =?us-ascii?Q?mdUxmJ2uVAMhNf0lbwa767QVrL3ii+Cq6TOWpyAYYeFMqK3/YhfNVejTYgbX?=
 =?us-ascii?Q?I9qz2+FEztE1LMLNoSug5Ky/ljOrMrJy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:12.8933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bcd5ed-0694-4ca5-5822-08dc9900f2a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601

The gsi of a passthrough device must be configured for it to be
able to be mapped into a hvm domU.
But When dom0 is PVH, the gsis don't get registered, it causes
the info of apic, pin and irq not be added into irq_2_pin list,
and the handler of irq_desc is not set, then when passthrough a
device, setting ioapic affinity and vector will fail.

To fix above problem, on Linux kernel side, a new code will
need to call PHYSDEVOP_setup_gsi for passthrough devices to
register gsi when dom0 is PVH.

So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
purpose.

Clarify two questions:
First, why the gsi of devices belong to PVH dom0 can work?
Because when probe a driver to a normal device, it calls(on linux
kernel side) pci_device_probe-> request_threaded_irq->
irq_startup-> __unmask_ioapic-> io_apic_write, then trap into xen
side hvmemul_do_io-> hvm_io_intercept-> hvm_process_io_intercept->
vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi.
So that the gsi can be registered.

Second, why the gsi of passthrough device can't work when dom0
is PVH?
Because when assign a device to passthrough, it uses pciback to
probe the device, and it calls pcistub_probe->pcistub_seize->
pcistub_init_device-> xen_pcibk_reset_device->
xen_pcibk_control_isr->isr_on, but isr_on is not set, so that the
fake IRQ handler is not installed, then the gsi isn't unmasked.
What's more, we can see on Xen side, the function
vioapic_hwdom_map_gsi-> mp_register_gsi will be called only when
the gsi is unmasked, so that the gsi can't work for passthrough
device.

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


