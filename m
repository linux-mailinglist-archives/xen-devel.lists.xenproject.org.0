Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF85A7103D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927004.1329809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhn-0008KM-Oc; Wed, 26 Mar 2025 05:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927004.1329809; Wed, 26 Mar 2025 05:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhn-0008Hg-KX; Wed, 26 Mar 2025 05:53:35 +0000
Received: by outflank-mailman (input) for mailman id 927004;
 Wed, 26 Mar 2025 05:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJhm-00083W-FR
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2417::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a66a2e85-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:53:33 +0100 (CET)
Received: from MW3PR05CA0023.namprd05.prod.outlook.com (2603:10b6:303:2b::28)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:28 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::2c) by MW3PR05CA0023.outlook.office365.com
 (2603:10b6:303:2b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 05:53:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:23 -0500
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
X-Inumbo-ID: a66a2e85-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq93IW0Js2GP/v6SUI8wPS2HIB8M7cztcXCzEV8IK5FpPcwLz6xkkXn7XAiimjyGTCMNIrkIiICTLv2WtOa2vt26JUF+OAegYKda74w4MHNQ6n89OXwqY0NCDj3PuAxbaG/Z0kX1ul22UTJnVlS4Vqs8QhgxqouqG1Fn6CYnD3E2NlmZyk3KK7aJDq99HjPEZEJgZiKdyjRff3psIWwZ1Ae2PJmJiA3b1n323O9oi7cNquQ9lFTUxrolg5LngXTjRKNUc8i0qXzWvc1u3jysvXmySwIR3yiH5+fg4dL7d7q61Gxz47PaFJ9IFL6AlN6ELl95pw6MPPwhBFJLa9qMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLLDFRNRP5cAISFRe2RAx0VsIhORNHj/mf9/RMCIKEw=;
 b=MjCIWurIxQpqeVYRiMEYoCm9VA8jx76dth4BpXSgSVsGzykeUjXpVCvsXjLN9iJ6TwweRgfPyMQ2iUo3ytF1DdxvNVbGiVuYOz9q/F+HeGSy4Ak4IUZMmL16wNO2msJEFoHZ0oLMzEJ8HJGcV7z3A8y6qd16Wm0oGw7xKaY3Y507FHG8q9mK3TiccyAPw+1wwzJanEpgmRy4YxyRdm/ZvFqPsxmObntn9iUddBd7pSigvnOACD+P8611pDKSAbM6Y0LUWtTQQZ+7ckzAXFtyOXt2twK/veoT7eLd8kWUgNNm4VN19o9PXmi3mjg6vSU+CF5CXXM3z2ghHdzDX79yhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLLDFRNRP5cAISFRe2RAx0VsIhORNHj/mf9/RMCIKEw=;
 b=E3eIacsa9PntR0O/dNDmC7+cit5xt+a/zEgiLFOfY82wMBtFz4i5VyRiAd6qvV79l7YigIoccdCE0fNEz43jUdJaJA90AmNWIjPzRJaGy42IRJrsgFX9eVZmZvU/9wNCpNCGFq3smC4aHjVatqjEM1DCXoIWjQnyVnb5MFjni+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v2 02/19] xen: introduce CONFIG_SYSCTL
Date: Wed, 26 Mar 2025 13:50:36 +0800
Message-ID: <20250326055053.3313146-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 432979c0-2d08-4c4d-1123-08dd6c2a874d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bCsVJLPOePDl6sN/K7WOfYbW1j1lWISNnBSoA4TjtIjPveiYyXwMuHKwJlf8?=
 =?us-ascii?Q?jdc9uWfg6jAMu1bCbVWNreKQv3sDeV74rX+EBrXvRPMl/pwiDOF2zjQ4Rv/s?=
 =?us-ascii?Q?UhI0bVuYNCNZopj2SVeA7UxP0cBJusBHyjE80xcf+BM31FT7hGqGODZWYEQU?=
 =?us-ascii?Q?pNLJADX2+NtE/8FMu1uQTXRbnd0sXGKmEXQz0CgsUbFcqV5/er1dEm2PNMn6?=
 =?us-ascii?Q?fsZMGFkgbWTy2DhrFYxinmm7fKwKST3MtCIJ4R1Mn6wtqeDFJMQgDgT3Bq4D?=
 =?us-ascii?Q?4N4zNtN6qtqtytYp5tvYTKm/vTQwR1qyMA7d7w2cDBuym6239+YyKf/w/O2Y?=
 =?us-ascii?Q?PBC7hGfu460EXUTuL1azu/HTAHZuVLm3FgjRsp05oy83RlcYcDnEk3+/CDXV?=
 =?us-ascii?Q?p0P926nx+8NsgHsffNxwW6ocGP8TP3iLlMlDboRpNVZBL14+4I0w5LGmGIre?=
 =?us-ascii?Q?Ypw05uMFPoQaKiQsu8Pug6K7rrR23/L36Ef2G40g88ghG0dtmueEv7MiO4sl?=
 =?us-ascii?Q?r/SQeEe/tTBa1kPCw0uABlXT+s20xP8kdjyCfoNRdUg7GqwcEAJjPkj80vSA?=
 =?us-ascii?Q?MznE2PeD4qq4VPzXdu2aKpEV/6/2M63PGVTohEuWTXuEHw60U/opN4Htf0fR?=
 =?us-ascii?Q?e3BQh2aAU9G+HkIknQFNlvS/OD2Tm6HziX2UIVDKn/D/0q4Yblzp11Gg5JzW?=
 =?us-ascii?Q?QQgDbiZnH/z9UwqYOyrImMFv6p8sfgdEdyrfFrenGxaUYtoSnvsnL1ysxNwc?=
 =?us-ascii?Q?AqZdNkrTUCL1BsGnqn11wQ8Y12hYLbhAbgSvyEbbKO7FQFwN9Iouu6D8WjD+?=
 =?us-ascii?Q?5D4k2B/ZOHB8yWC67zl5ua6BQX2Ib0xPKxd/q032a0bwqGPpcDvXLuN9HdsK?=
 =?us-ascii?Q?Lsl+dw6zCe2LbE4eKfVEjLb0AY42/A2WEMxZD0+xLJRYbDvzmyzQUjepyUZ4?=
 =?us-ascii?Q?wQioE+857hbyDXos02e/BYkuzNKWDK6zZJgQ7myv0znoUds1y+lquJ3yEdU9?=
 =?us-ascii?Q?jSBYtkHAc3QwQmlr4SxbOZkW6by6yWRqqVvQURkYz/4NgJMjxsRMCfZsGrTs?=
 =?us-ascii?Q?BiGF5a55M0u1ui+H8ErlQEXjGr/aVknJxEO4fi0ME1KOjBIPpgFnmcYUN4FE?=
 =?us-ascii?Q?LvkukW+ZF/LQ54WRimYk/AEJIwuDCv2aj6rUtiN7YFZBrl5awYY9OiG+ieWO?=
 =?us-ascii?Q?YmGjqXusrFmS2MEGCOv/ywN8AYAXOuzZt7YANrL+g2tTHjwETa1oqhQeHMV4?=
 =?us-ascii?Q?3MfY4pRWVPUBwCb9i2WebRgZyzE2YGPuU/M+TEw7EywWnTSoRta3u2uSy3kA?=
 =?us-ascii?Q?Z21/noUGR67aN1vmXbbW6jNyXqN9v8gySCtuDSFTf0SKqb4OA6Yy6dQsurcq?=
 =?us-ascii?Q?R0OQEvUZfUzC+dvBCaTgHkd5NsCYBxa9agP7iTUuQ8osiTvj/3Z2tcK8nyBm?=
 =?us-ascii?Q?3C2MeFGjheMpMyLNTo0/TXEAUySzsXN1MZTeVmBtci4gnQFofGTOICNRgJP9?=
 =?us-ascii?Q?L6+10Q/xeyDx7NrEmcopAqeR/o0pkODhd14V?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:26.9629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 432979c0-2d08-4c4d-1123-08dd6c2a874d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405

From: Stefano Stabellini <stefano.stabellini@amd.com>

We intend to introduces a new Kconfig CONFIG_SYSCTL, which shall only
be disabled on some dom0less systems, to reduce Xen footprint.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- complement missing commit message
- re-placing the kconfig at the file end
- complement a "help" statement
---
 xen/common/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6aa2c5c14..fe9303c7c1 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -545,4 +545,15 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+menu "Supported hypercall interfaces"
+	visible if EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	default y
+	help
+	  This option shall only be disabled on some dom0less systems,
+	  to reduce Xen footprint.
+endmenu
+
 endmenu
-- 
2.34.1


