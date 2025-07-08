Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D290AFD615
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037024.1409684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjN-0005cj-5V; Tue, 08 Jul 2025 18:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037024.1409684; Tue, 08 Jul 2025 18:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjM-0005XU-W6; Tue, 08 Jul 2025 18:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1037024;
 Tue, 08 Jul 2025 18:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjM-0005Uq-58
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:07:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 726364d5-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:07:45 +0200 (CEST)
Received: from BYAPR06CA0026.namprd06.prod.outlook.com (2603:10b6:a03:d4::39)
 by DS2PR12MB9591.namprd12.prod.outlook.com (2603:10b6:8:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 18:07:41 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::47) by BYAPR06CA0026.outlook.office365.com
 (2603:10b6:a03:d4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:07:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:41 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:39 -0500
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
X-Inumbo-ID: 726364d5-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXdvDS96BA6aP+4nr6YFRIYeVczHrqZA3qCdv+8L/pJ188xaZq552I2oh+Rf3G9xR6GVaqIqv+z7lgiYjG9TJ54eWFHhqmaF5n7xZd3M3JHoEqyNlG5LEj/zhr/Oz/f/kN2CK6a+e+5wyoW4qtP9nYQifIRdAtOLPBfXbCOVBmYMYA3SEZk8WwJYv6PZWhgkXYhByOKjgWncSQbjMHF8/pcX8zAHTgCVwCFVJr0yO+tfDv4FoPUk3FyS21yfSVTxkgzraD/TDBQ48iUH9rfnspU1S3FGEp+DNCmrhpdhErbslsgGLtC90dQvktsnBZHmf/EE9UwaWdbTf1xbDgixQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPD/rKYLwoQh7EhPgtS74wicAf9RUsbK6gNUi7Q5AAI=;
 b=dRImN9qh8dYOsr8UveZhBhga66T3Y2k2nUj/USmtYzNerkEHN494StkNTb0OC/qi47Xr0yDAHC4qw1juPGpXIDGdx4luCswNMExEg104aRgVWUNFnKxa1ci0SJ/mgACAOb3ffvg8xOnFK6JDqTZwek3xY3Q5sR7uuFj8bnIwteBT4wcVzqDDM9QQ6OLZM1UaSzuhQYN7bRh8NmCbHu4Ha3pyG7ZFKqo1FtCiwnPH0iZnKP9oahQD0p9cbAI6eZRbDnNXLaoaRTWLRxID5l6o8pqo9WIN0oZiwRHLINmqxWQAvoNDHlVhAcr+DAv/OUwyS9lmKKtk9xHmIcpIuvWTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPD/rKYLwoQh7EhPgtS74wicAf9RUsbK6gNUi7Q5AAI=;
 b=2KJof+Ta4OERa86tEfyvoiucEJ9oUDJ/J0Jnc2NKsAbw7NKYqqmPN+J4lQl7Wds146Ud/7FTOAbaXceTHlt02DX7EkhvIs/sAElrt2VQaS6eTr2SDoJpP48nTRYbb++J+xX07SNtt6jvmoI0+GmzL+hxgGq7rdnRTST+YL0En40=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 01/11] xen: Conditionally compile out the boot_module.domU
Date: Tue, 8 Jul 2025 20:07:10 +0200
Message-ID: <20250708180721.2338036-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DS2PR12MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9b0f94-3f6c-46a4-3143-08ddbe4a54da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DTc3vLllhDhx+7AM++Vap+kYqQCXvCw/+q4TlIKtJYmmqNIX0zygFmC8Bz2B?=
 =?us-ascii?Q?w1QmHOSumy3keX+tCyo7ZHvTfx5DKyPjyQsrkj7n66vtFxYJ9J0Kid2qXlvO?=
 =?us-ascii?Q?rB++YLkmao74ShNCT1TID63+lsarpJjj6/kKW5jgYJZjg/cUWaW19QMldx3R?=
 =?us-ascii?Q?cCM9u+Bfl1sWryGfwWqcTngQAcmD6CPWudBLwOxn+nLQZTyB4tcoDdhH2MSu?=
 =?us-ascii?Q?9OAxw+HrW6xlfAd7WK5SiBtA68fO0NCbfBDxmlZhXAxZgA79FyS3SD663tdj?=
 =?us-ascii?Q?evq42ZpG22roy+LI3RT4/iqPdEcBW5yuoOwPxo5fU8VdqQlc7FljGil7x39z?=
 =?us-ascii?Q?k1nB7lnAiwswA+sy8sj9gKU4unUpDUHEfB11YHdLcfeOLjbseEa4c88g9ynx?=
 =?us-ascii?Q?2gC12LViLnBqFhUB541PpwXhJY3acjg/XfGOx/AJOV9e/iqaX87h+Y83VZqg?=
 =?us-ascii?Q?UT1DvCNznhdECbtO5Yp96Pz5LqhKpAy0DvJxjHEEnhEY3gTtWU/1iMpDmZ5n?=
 =?us-ascii?Q?UnlLFX+/ieKlqmD91a5Ytt4WqtgZnXF98kCU4RCpEv0svkSfxC/xiMAKjTwu?=
 =?us-ascii?Q?aRi0khEyol0Ixw6Ya0c4RIEsw3ijeihtArw405i5OQU8c4hBJsXG4xmy43FK?=
 =?us-ascii?Q?Om0wR3k2I8kvCazRlNPwODArSPmEPKoWxqSaNkyqWcvQuLG3LNIMUCFNZ8Rg?=
 =?us-ascii?Q?ype/+tebhRE9SS5jAsfKUldHd+IL/NzHhz7zkt6Dh78xcXf4e0JxG3D2IeWW?=
 =?us-ascii?Q?FAl/BbMSh7Grnqfs/OoXS/EGcgc7Fi8KGoM7k6ZM+Zbwz2ct/L7yV//TgwHC?=
 =?us-ascii?Q?Qe2bPqN5gPR1YEAMTpmuFg74XFHdRv8C+OxiTa9aCAIe9ZrvZVRDT4s1yZzt?=
 =?us-ascii?Q?y/ysNezZSHeXA06DhrtaiLu/vgbxJXpV3rjUR9r8P+J8hEnmfkIGRxqQM68f?=
 =?us-ascii?Q?npcj7mITwqflHO0lA0lLyfIdvDD5wJc3w+dAbk0bQDds9qbtCc8eZIRerrCY?=
 =?us-ascii?Q?7aFMs4ARPI1TbI0v8dY7k/97jSBntjnIEif5s42FRZfxcrK8DlBYQPEGGP+F?=
 =?us-ascii?Q?nS3L8x3Lqq11a8aQDdIGefzg4QlLZfRnJXSbNQD1/DvFtdgZuZaCfriAZd4G?=
 =?us-ascii?Q?xJNYQr1LMZXrq/yY7kjQZ3ILTeMWZ8KRWwPBdhxiDlPjCQRRsC1OhYAemkt0?=
 =?us-ascii?Q?nug4PPOEZ4jnCz+EiGxKXfS8a3u2PWKT6RcqCuDih8GRWFyRMxmGeoEr3fa/?=
 =?us-ascii?Q?UIP0SP9Nt40RROZgVQLHnRJM9e5+w4QeguNvnYrJuv5/WJbB679upGHQSqYy?=
 =?us-ascii?Q?JaNAvyNqDV5aGybbLqLVGJkpAWDCEcylgONmIp4z2k82w8joNWxkJNzXzXI1?=
 =?us-ascii?Q?ngudhmZ31/cowTSd4H0wmFUCOUGRQZSkNswvJRO3jOpL+gmpoN5Zlvm+EBdr?=
 =?us-ascii?Q?yCrPmF2ohOfE+8oMsuUcpUNyuNx9qH3GWLo+sWnVmmMO9kLvNwn4xtLj4DSq?=
 =?us-ascii?Q?KF1g5bNbGRepvXbVzdzENuLNyUWUb5QCaCSU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:41.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9b0f94-3f6c-46a4-3143-08ddbe4a54da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9591

... based on CONFIG_X86. x86 won't depend on it, and it'll only be used
by the domain builder in common/device-tree/

Moving it to an arch-specific subfield (as introduced in a later patch)
is unwieldy, because all other arches depend on it.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
My expectation is to remove the field altogether after we reach full
integration in common code, by deducing this boolean from the domain
capabilities given in the "capabilities" prop.

That's not something I'm working at the moment though.
---
 xen/include/xen/bootfdt.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 236b456dd2..7f49d0ccdd 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -96,16 +96,18 @@ struct shared_meminfo {
     struct shmem_membank_extra extra[NR_SHMEM_BANKS];
 };
 
-/*
- * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
- * The purpose of the domU flag is to avoid getting confused in
- * kernel_probe, where we try to guess which is the dom0 kernel and
- * initrd to be compatible with all versions of the multiboot spec.
- */
 #define BOOTMOD_MAX_CMDLINE 1024
 struct boot_module {
     boot_module_kind kind;
+#ifndef CONFIG_X86
+    /*
+     * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
+     * The purpose of the domU flag is to avoid getting confused in
+     * kernel_probe, where we try to guess which is the dom0 kernel and
+     * initrd to be compatible with all versions of the multiboot spec.
+     */
     bool domU;
+#endif
     paddr_t start;
     paddr_t size;
 };
-- 
2.43.0


