Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D1B11853
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057164.1425083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBis-000811-2j; Fri, 25 Jul 2025 06:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057164.1425083; Fri, 25 Jul 2025 06:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBir-0007y9-W3; Fri, 25 Jul 2025 06:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1057164;
 Fri, 25 Jul 2025 06:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBir-0007mf-4f
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:200a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4edfbbd-691e-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 08:16:00 +0200 (CEST)
Received: from BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:15:55 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:180:cafe::e6) by BY5PR13CA0004.outlook.office365.com
 (2603:10b6:a03:180::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 06:15:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:15:54 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:15:51 -0500
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
X-Inumbo-ID: d4edfbbd-691e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/s/dENbygRoCJ50UsX16MuUrf47Avk1DPYNf/uyonq+3VqRBzxrw++voQ8ObNXCpWL02Fl3TtRVM04SFZr919f1TyOKwtJiEC0TL1RcfxOQdX0UFlvl9gU7OqzAYLFDcvGUvJoCDosmNidDnYdLcaZyiCIA4Nt3o/ZVaW4Oodgq4bjrag1yXSgRUtRz57Co4RHvaAWL39Ji2Wuw4R9v2cfWWvfli3JPktMOxwYXvQmun6aJ4BmNjWajfRX/8Eot+/obowvjun5aPgrEOItxLbawDs97bXcf5hvMYc7uBLyhDoy14QsrF/QjIzqs+bhWtss4MGnCl/KS5tPnFDfXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0AjIMnOVefHOShfTDC829Zw1nWVMk0NTfRb12uPa94=;
 b=X5CyXGCU6sGd6G2LtzWtHEcKbg4wGXGnupPuOACIbn2dWmYI4wtDk2Js3fV4lk/rCpcWubjNzYOdjF+njVmELE6C0kFmHsguqLDqbuqIITaFj3ctUtDI+O4EenfC1n97Gm0IjsszFBruJtyC3CWZtcjUADxs0Lj7TSh60PWqItS4lqOwtNvcibP8zlYhvTJcS9HHpMLzyoHLYZ1erb2Taaem6O//Tt4ngKpoEw/jF6TNkC7fiXsjHX/hOV2BSpZ0AVVv+7xfQH8FeJYVvh5njgjibWOLbRaGmthbCOkVZohZ/3R6QkNC/Swgvq0ck4Pd1jFSvsEqPgEJsPy3p7HO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0AjIMnOVefHOShfTDC829Zw1nWVMk0NTfRb12uPa94=;
 b=IV1DpoHhkNEYrT5f6TbMd+HgrhSNm8ZMHUKNUOHwhS/NI4G63VAXB+uRBUg6ku9cGwXGcs7/kPJDfV4if9sIl6306sQOPJso5SQL8gLphH/YGf00m/OGG2ZZ2nINgXAcSSqme/cdQPVatvNHKXhI2ETsE6cKc7magivD9fuYa90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 01/11] xen: Introduce CONFIG_PLATFORM_OP
Date: Fri, 25 Jul 2025 14:15:20 +0800
Message-ID: <20250725061530.309953-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SA0PR12MB4368:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ecf2e51-a2e5-48de-5049-08ddcb42b637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UW9aZVA3VE91emdGRWk4MWtiMyt2YnlLYllpZklnd0o4S0Rsdi9KOG51UERz?=
 =?utf-8?B?cmlPQzlNVFFhdG54RVRMUDAybGppTHRaL0hqWEZacDJTZkZJajJDSXl2QmJj?=
 =?utf-8?B?YjFCa3hQU3drRiswNDcrVWhQT0NCY0ZRZGFYVE16anU4YVpleFlNcHFvbFJw?=
 =?utf-8?B?Zk9ROExMemcwRkVzQmhPWVdER3NET0xGb2N4Vnk0SGV3Q202M2ZTTXlRUlJP?=
 =?utf-8?B?MkMxa0VFMlM1OHNPK0Vmd2lJcjNhOGFDRnRvY2lGUDZaTk1HZ01iQXdSbzV3?=
 =?utf-8?B?RGVRS3U5WURSM3VldGI4QkkyeURjTDg1d2hwTEtMb3NaRjNEbWxQQXo1WmlX?=
 =?utf-8?B?QUMrb3pPaWZnZTJOTy94RW1pQnVaMmdwR1Jja3Y2NEcxNmdkQ215eTRsMlF5?=
 =?utf-8?B?OU1ScFlidHlVSGVQWEh1QWZhSnRJRzNlV1ZxYzJWSSsxQ2R4VG5UOVV5cTda?=
 =?utf-8?B?U3VtaGM5bmJQTFBJS3U3bkhzWG5nZUh5aG04UXpIWGpzN1Uxc0twUHNNNDhK?=
 =?utf-8?B?d29oMlhOSEFDMXRlaXk2VGQ0VFZTSGpmWXh2L2lhOWxQdnVmL1JiOEVjdkV1?=
 =?utf-8?B?UHc4UzRwMnNSdTZzQ21kUEh1dkt5YnV5WjBneElYRDNRbDVLT3p5bmZPRm5m?=
 =?utf-8?B?Nm85amY4ODVUSFpCNThWWXBPMTBFWXV1WFY0SFJJUzN6azd2R0ovMUVpNDlh?=
 =?utf-8?B?SzduSVNCQ3JFTVBYSjdoQ3VpRXYxMFY3WDBSMFhwbmhMQi9qK0MvcUk4QTBJ?=
 =?utf-8?B?amtEeExUV1lEYWs3WXFyUUVJUjNWNWVORXJrOEpKS0J5WDFqMHN4U0RzdU5x?=
 =?utf-8?B?S2ZVOGVsV3hpbytJcmMrWDA3b0hTbC9iaHJTM2NRY1VkL1NiUjRUQ08vN1lX?=
 =?utf-8?B?cUpjbEQ1R2IvaFowYTFoZnUwT2UwMGVMVFU3blUvazBSVVhWWUljeUxhaWo4?=
 =?utf-8?B?VGlvQmp5SEZib25WUXpvazMwWVlmVko1U2grWHdRUFFZaVlUWlhjZ3hqMjdZ?=
 =?utf-8?B?YkxFZnkzNEg4a0dnQ1RkRDhCUnVZZE1zWkVycnloanU1WGMzK2p5aTh5c1lo?=
 =?utf-8?B?eldtV3hoejE4U0tkVWNmSjA0WXN1U2V1eHpvTGR2T3E3N0twTTl5M0pFWTNz?=
 =?utf-8?B?TUgzUFJZcmJNd1JnS3JyNHhyN2FGNjBhaGZJMStiVGNaZWF1aStUTzkxeTM3?=
 =?utf-8?B?OTRiY0krMFExL0xoUXk3aS94dDU3N0tuUWtMUUd1c2d5bS9zVUk4OE5KTmQz?=
 =?utf-8?B?b0RRTE00R2I5NGZQMkl1L0hGUUpFZVFCMVpVQmpHZGdJL0JpdjFjRUY5S1Ft?=
 =?utf-8?B?dUR6NHhscE5wbm1iSjBpSVpsYTlvODM0MldDaW9VYWM1bFZ1MzFzdGdrQTJP?=
 =?utf-8?B?aEZ6Qkp0RlQ0d0swRjhhc09QYlJOcjJSaGwxOTRGSUp2VE54c1VsU1lNd0Fz?=
 =?utf-8?B?U0YzN3FTc2x5WGVwdDdXM0hjektiUGhGOTVJaEx4OE1yMXVHcHErVjdKZG1l?=
 =?utf-8?B?QWV6OXpSSFFzZnc5K2ZEWWgvdk1MdjlkNDVSV3p3WUpYUjRvY0U3ZDFRTWxs?=
 =?utf-8?B?NFNRTnRQbTVNd21ocjcyUDBHMHoyNVA3bFREdVVra1Yram1UTlRlUCtNNjRw?=
 =?utf-8?B?blI3WmdGVG02ZGpPbG1weGJXNHNMdWhha2g3VUd2bGNDWWxNekQ1MjUydzhZ?=
 =?utf-8?B?RnNGdWpzaXAzaExMMWRTWFMwbnN6b0xIUlFGOHFjcVhRMzNqUXduWFNwU1pU?=
 =?utf-8?B?L1pUZUtYc2ZucGoxckhVY0VXTVIyVjB3N212T0VKLzJiN0JYLzkwRVBNVVUx?=
 =?utf-8?B?VmJWQzdLVFdUTk5Dc21nai8vMkRuK1FCVTM4TS93YmRidUovcGtpWkZVQXRP?=
 =?utf-8?B?dkcyekRMWGczd3llc1BWdXliMXNQcnJxdGJLVVV2RXp1ZlNQTUdveGVRZTJV?=
 =?utf-8?B?T0FBdFoyWDNZZ2xPNElGd1ovd2lqdGxMS3ZxZi8yODhiWEl5SFFpN1NOcWhH?=
 =?utf-8?B?cWZYZzMvaVZPU0RjaVhyWE1vTGZNMjh5Y2VBazlEKzg1c3JtWUYwVXNIdXJt?=
 =?utf-8?Q?41q7LS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:15:54.0482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecf2e51-a2e5-48de-5049-08ddcb42b637
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368

Introduce a new Kconfig CONFIG_PLATFORM_OP, which shall only be disabled
on some dom0less systems or PV shim on x86, to reduce Xen footprint.

The consequence of introducing "CONFIG_PLATFORM_OP=y" in .config file
generated from pvshim_defconfig is transient, which will be adjusted in
the final patch.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2539a635f111..1a8f5ec93364 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -627,6 +627,10 @@ config SYSCTL
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint.
 
+config PLATFORM_OP
+	bool "Enable Platform Operation hypercall"
+	default y
+
 endmenu
 
 config PM_OP
-- 
2.34.1


