Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C2AC8D58
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000782.1380999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZY-0005bP-5p; Fri, 30 May 2025 12:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000782.1380999; Fri, 30 May 2025 12:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZY-0005ZK-2E; Fri, 30 May 2025 12:10:52 +0000
Received: by outflank-mailman (input) for mailman id 1000782;
 Fri, 30 May 2025 12:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySl-00076q-48
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 255693a8-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:49 +0200 (CEST)
Received: from MW4P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::10)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Fri, 30 May
 2025 12:03:44 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::31) by MW4P222CA0005.outlook.office365.com
 (2603:10b6:303:114::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.23 via Frontend Transport; Fri,
 30 May 2025 12:03:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:43 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:39 -0500
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
X-Inumbo-ID: 255693a8-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP36aolhyGmqpJ4YuWFaqMUawDqSHTbmmlyVoB6H5kIGHTLzkH8plhbPeEkuyKvNFP+u+Kv1SK79VLyoah6OGGUttmBA1vysbCs/maEMOMtNXPbJN7MaFTjwTP9dc+ugrQB2grwXFT7or56G5p8xrB7e+33AKhkQ7ohmNocl28Xus8G1weYfZhXGnErZg0pOTAt5xoxHU4vFUXqt0Fj/Y/9nRjusL/nTQJ+IjW4a1XRoH9qWou4zm5mPsirGfN5akxgCE2ROFqVTYB0IxVmWr4/MINZ3oW3PI88lP+s0M9Lbr8pocKl7lWrH2YVdCBFMw/zCylbD/D6wPkXvf/jD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqZEAX0EcN1gu3oWhJz9QmC1AjJaiddoYvKcz3dxWGQ=;
 b=opbZwWBHmXUmJATIxaxTfQy6BdviHTRgAkloYD+tiX37Z7b9ZGr0ZeSTmUw4+LRb9BGm5GOCGInN6wdC4vvULrwRhGmKKxvaVcstgInPYWSgV+VBw1F89ZxT9O31ofxlXOVKvsrPj+/mZ+Bm4f+GKYup2+UJ7C31R439gNkVR+nLR7V5dEpKsZgdigphaqZ4rccxgsd5G6msVlaFVIN5ZUR1cimPnt7fNa3EG6k+KCmc1M4Jj+5lLHzl4C0zGHS+cz2WTKUs4lFkAUFh3xvOYmD/b4SDuOKqoFGq9X+NVdUL8f8Ba7MKt0Mt+f5f2nm2aQDCL+4LiTlbb83L9hCmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqZEAX0EcN1gu3oWhJz9QmC1AjJaiddoYvKcz3dxWGQ=;
 b=Gfse2k53SRuzeV2cRsJfaYgj6lF0NzhdIM98D+JpoAUHd+pSFrlsvJKMVMQ7LImx/zFvWnTMO9XTHI4tk4UQrpO/yep1lN85sZn9wTEciBMi+b5QRGscSLLYdlxrM3Efb01Bl+dhxFXPFOhT/3jqpVUOWR7lQxmd/AIzt+6xibE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 18/19] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include device-tree/
Date: Fri, 30 May 2025 14:02:26 +0200
Message-ID: <20250530120242.39398-19-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: f504fd1b-27da-498c-f6e9-08dd9f720606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vuoeizq3qIVm6h0+s2fVwC7CZ7hrvIbZMQEIBU8OfKMKQyQ8DyN8WGFYRGMV?=
 =?us-ascii?Q?haCeZ+feA/zCinmELFoXKtY763ghJPjYIZJjGruQpNrAhpLoHYN4TRHRtHnD?=
 =?us-ascii?Q?6rl++SnFkyTedeYyyrC85+pR40pdjeO/XfxK42u9UoR0JmWJvfHtA+mRX9jm?=
 =?us-ascii?Q?GmP0tMeUIhyv4D3VPOJU7rkzV+cAe8JMwHxtl52CA1IY7UQwAIzG/ndbetjk?=
 =?us-ascii?Q?8+JuOn/PCMoEBM3utEG9oRCubek4U+Woj7aCYRYScUTWX0IKGGGUKEChy2LY?=
 =?us-ascii?Q?8GfaYE2VgGhiTQL27PjvdTRui/hxXUI+3lKKdO6OyVeyrdScP1FkbXh33N6B?=
 =?us-ascii?Q?RXTHfV/jNjHMJm8EOSpfl+tUUxoPrGXOZXGF8CBcPJ3rNbN9AtPwBsBCyFmq?=
 =?us-ascii?Q?0zsIrljQ1H0qRQvS9OaoPLFJpUxS4rh8t29HozaFpfwdEMXlTE3XjRGv6SJa?=
 =?us-ascii?Q?Ci6LqqWifI0zJzA1GPwPwTVEDhyhyB41xKtTQZGold9TxaELRPWXgxYUw2ua?=
 =?us-ascii?Q?CRr0B+hvZoH+3pfIEdl0X2FygzJEkt2ZKRB/eoEIYUilM7c1gJoM9EGFUs74?=
 =?us-ascii?Q?oWyIFBmfyYk/2PpQpQP+eFzElKifdPM+EEgXMuP85NUyAWY0kUcc0p8D2wu3?=
 =?us-ascii?Q?GC8+YZAIkwtT1eEv57efsD83tcgxfvaR56rrymF5VkipcHQqjJMGkamvg339?=
 =?us-ascii?Q?UeC45jXr2nd+bjYH9ZBUKus4FoTO90uQzZABe5WBVSXpEbZQ1qoJPi0+MiY5?=
 =?us-ascii?Q?aJ2i+H1/q2UJi8OtOugKjNqgqg0VZP6td/k2piHCL9N1iMP98b/KKIIpOMQp?=
 =?us-ascii?Q?13BWj+Su/NgU7pM3lL3IVOTcV1AHcwxDx7lSkZC1sfXCeOz5bLMNaOKDcPjs?=
 =?us-ascii?Q?cl87EIb0tiwJbV2ovnlkc3DxNYAyCeqtIAmtcBtuUtpvjN8Wfz4MrB62dxDI?=
 =?us-ascii?Q?tejne+sAm0hf4O7gGNERDZdaWW4v2Q1m+aAg4jpmmEuDozgM23XWIbQ234Uq?=
 =?us-ascii?Q?DOrYdqzkeBPdRAbf71uZJKGVzr5b4DXeRbhOsq41TzMhP4C6LhaxF6I13+V8?=
 =?us-ascii?Q?W1m2HJNqfRt9sluMODj9QI7u2ZiPwXE1T13f7Q72l5HBKaGfZhxOrnTj7LxY?=
 =?us-ascii?Q?2C0LPFnRBuYbp559DVPO8GN0YhxD0vK7QeHrJ8HqxQMiT75jDGEKkvG854Mb?=
 =?us-ascii?Q?FMvXZU3dDqFgLpkE/gs8vgyEYT4nOOOKTG7yC7JNUQWTaF+G8ACj7Q3EW5HT?=
 =?us-ascii?Q?nh5n3RVF5YQn4RhN7THwPixBeODWv1HK28JJ8becumWhj4xhWZr+M1ZInhJ9?=
 =?us-ascii?Q?3Dx/pkJ/ZTjfOyJyGSiE4zZn/BAX0uS2tRKq1WygJqTKzRWmZvNN2mIMx6rV?=
 =?us-ascii?Q?bWHrSFqTNuc/5VSTVg3o/enRLbmtuPhPZkZ4RgWvNZidXuE/MX5rhQEylat6?=
 =?us-ascii?Q?gIzjQ1NqkRFPczVSOLzPnOeV2cpMeweqbXHpsgX1lcYg10VSbOFaVckjjUx7?=
 =?us-ascii?Q?MksQvFyPefLey8hVnsdu5cq3SamvXPn+IzW5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:43.2146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f504fd1b-27da-498c-f6e9-08dd9f720606
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

... without CONFIG_HAS_DEVICE_TREE

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/Kconfig              | 1 +
 xen/common/Makefile             | 2 +-
 xen/common/device-tree/Makefile | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0951d4c2f2..353ccbd06f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,6 +14,7 @@ config CORE_PARKING
 
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
+	select LIBFDT
 	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
 	default y
 	help
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..2717c81f9c 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -8,7 +8,7 @@ obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
+obj-$(firstword $(CONFIG_HAS_DEVICE_TREE) $(CONFIG_DOM0LESS_BOOT)) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 922c5bba9b..4c09e3fb2d 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,10 +1,10 @@
 obj-y += bootfdt.init.o
-obj-y += bootinfo-fdt.init.o
-obj-y += bootinfo.init.o
-obj-y += device-tree.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo-fdt.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
-obj-y += intc.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
-- 
2.43.0


