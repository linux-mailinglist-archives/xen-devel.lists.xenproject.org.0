Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257DAC65A2
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999159.1379918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyK-0001Q3-Im; Wed, 28 May 2025 09:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999159.1379918; Wed, 28 May 2025 09:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyK-0001Mu-EV; Wed, 28 May 2025 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 999159;
 Wed, 28 May 2025 09:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvi-0001jE-3Z
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2418::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9464088-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:32 +0200 (CEST)
Received: from SN7PR04CA0171.namprd04.prod.outlook.com (2603:10b6:806:125::26)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 09:18:28 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::b2) by SN7PR04CA0171.outlook.office365.com
 (2603:10b6:806:125::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Wed,
 28 May 2025 09:18:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:27 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:24 -0500
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
X-Inumbo-ID: b9464088-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLtur3S3WV0wcqKvk+on1WNcVJcJulyyexWi9HxSpm25idw/bLwpg2gyResbvTw1s6QFf+cO2Sq+BfaZ019LyDI7ooxKYul1Qza08VLWPYJVctRcumPpvJJXgmSVuviGtJnredF1ibIk5UhmCZGtQEoYpFzQMLpA9FvtVEBVZjRuA4Z5QvdID/1/HKU32fzaiIim6Y1IFnk/w4ewOyaFx29bHLPSjN2nEefRwMod98iN79PqlhpAXLWodqjDG146nnlctHc/+PIL1dAbCZc/qxY0wkBG+vgPsUzGx2DxVePUMekbxqkvl/GmVOw9HQFTzRKeASXs3tUxD018cTLXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b2CWzsDEAqRVTo0xhsHOqqreygQWWop6mCIRDuco4A=;
 b=NISe/asblfRxa9zlYK1+Sh1lsqldnM6u7MYZC7LzXTABWLcFoR3g6Vp/7VDlbbTimkw1vt7hZfyKE4N4KbM70f8uN6Hn4OQ8t7APCe5BWHCXK51HZE5BaiZoMUY2Kl3bkPznKtP6HDbp0qIiA0nLDeG2fpTX3z0YJUkYdTWaEzif3dMMh88ewYf49hBm92ZTrra3lmSDIt73zZ/03etpAntul5dLg6kKML7knGEIRJ/s+PV1NgIl7lJTdmkYKmBcuS52Wr6hXNgRpjmE0VA8uq6Va5fmqrUWMvXyATJQ6EZhf4n5mGVz24JFwTlu5uS65nlDuKPkVz3QqZSX4C5T/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b2CWzsDEAqRVTo0xhsHOqqreygQWWop6mCIRDuco4A=;
 b=W6IdlsFOUAtA6zoA70Pa9U5GJywONShbMXHvGeFso/b0QKSz/6pttoNwDH8O58JKjq/bRCVkQRcl7CkFIdNEoGRdl8xyDLsLaTBW+2+bzjO6UcRhlvX6h0SAIqXE9y78y5ipf1XTIj/9ME9y5B1C2SjlP3PghvsBONpVhV6UCXc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 17/20] xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
Date: Wed, 28 May 2025 17:17:05 +0800
Message-ID: <20250528091708.390767-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4e859a-66eb-4e93-5f21-08dd9dc89b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Me2XFMA6aVSso6CoXpMa+edIQWr/OzPM7b2Qe5ywoDXC1ssFTynUpqkYcip1?=
 =?us-ascii?Q?dnb8uer+vZyo99Pjr9sUfkqXUxzqzMJoT7rS9R/8lN5BmBe62ota6eka9uTy?=
 =?us-ascii?Q?/HYrgJE4uzeKAqcwvOniL9XS1yRCakiYKB1rhO/W0zHuILxybZeRX+IZjGJc?=
 =?us-ascii?Q?xB2lhFqh1w46ZOFvpYS11hUiofTVz/zOhxylwCnuj/VVjNG4S82xDIPGNuJG?=
 =?us-ascii?Q?j2IUKzBZffKtVaJadKhO3xOa8VGMRoTRjvM/dlnOX0DQtTbW7CxcO9wCdINN?=
 =?us-ascii?Q?NTKsMoVD/j/UWXAQ90dZQb/lHTqH7hOlRNITYny+U3/1qMXOqZ90WqYdIbbN?=
 =?us-ascii?Q?gVNK5Cku3RHOZVloU877v0Cw563/xd7r3IsnpgtkOw/sbdYZXCCKr/8/+o6z?=
 =?us-ascii?Q?3ZE1+4StmePXcPeWzBUNsbbhrYrtf9BhxmWPnluMjWzAjgajH9NM9IyyroXT?=
 =?us-ascii?Q?5YT3orB0SfydaDCPlegYWtsS2JZ+jBA1QX0TztTO6XjDQZbiuEsBSl8x6Vy6?=
 =?us-ascii?Q?RY7nwO04JdZq/NP+vGh7uGyFehq4UyNfkDEjF6GqTSkU6ykfFGpfUeBYCygw?=
 =?us-ascii?Q?RvXRmbIzwaol2THqysWmCYyQQKJZsB7LQ6jGhgmm2z38QnrTSymi7nx2WvB6?=
 =?us-ascii?Q?KP0/it+C87ocF8U0slyJuYDsgV/rzaccTQ5A1yW5nmu9KUXXW6Ip+WDElsvq?=
 =?us-ascii?Q?GQYXyYgSAJsy/VSGgNYj2lzdV8Ad3/USQPEXptHKNhxnT5NLT/OyXsd3+vBy?=
 =?us-ascii?Q?eRSiqSiEbKUIik1Y8C+cDiIO8k7WbexWnGYvXVOucYR4NKSkEaQZk8pr2y8s?=
 =?us-ascii?Q?rJxGL05aFOL9sa9IWvajScaojSDETfrQziNK/BAJKlTBe42zaCF0pfdHsgo+?=
 =?us-ascii?Q?a8LHMqTS281hyGSJXkyaNafYOxy8k3mSf+4HVd+cHO11YxWvinEmdsYhgpsv?=
 =?us-ascii?Q?UmPORGqm7EsrVS119bgjJK1iS6d1PEq8MuWjrRRwe1oU89hnI8X7ZXBS3Ycz?=
 =?us-ascii?Q?QxAeYN6L6Tc7th7W9uCZzHaY1U64Hoqxh7hlVaBdUf4wdulBjSLFf+XVkpxD?=
 =?us-ascii?Q?tvrAqEpW2sV3pGKZcBWi2oLed94TCeURkHDbRyyUdK93c88yTo4fX0Hgero+?=
 =?us-ascii?Q?xyLYdEw8r36fW9ZrXbN94VjLFxf78E1PxFNoBPWEBNwoZOm0bIMC1W4FaS04?=
 =?us-ascii?Q?GXrceRR/hVfhKNjFqw4/xe2YVb1UIw/8AYZU7RY88SEXZxd7Erb03TnWGpE7?=
 =?us-ascii?Q?25vWzxEYzLyqJLCUHiTeUHAK+aJv8w5/mt2QdaH6rOhgJ/h32aJNLSV+Vnc1?=
 =?us-ascii?Q?T/IPlGY+qpFN7qy6DSKTxlANB7RLCTHmAIvGeMexKRqL6fmtwFNYKubsQT2v?=
 =?us-ascii?Q?jaUKBvOEUDPorYEUsHr+kVqlWLSTK3gT+wAD5V0nqhr+1t4X27KydL3WSOCk?=
 =?us-ascii?Q?vbqvbekUouclxmEfSCCxcGACyU21oox7Y24wdN+Zd8rSnMn1432Qeyp568kh?=
 =?us-ascii?Q?EF9vWwVYYAyfBKIHfGrXQvBQkM+/6iwOhFcJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:27.7183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4e859a-66eb-4e93-5f21-08dd9dc89b1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715

All coverage-related op shall be wrapped around with CONFIG_SYSCTL,
so we shall make CONFIG_COVERAGE depend on CONFIG_SYSCTL.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
v3 -> v4:
- commit message refactor
---
 xen/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d14093017e..c4198f0ac8 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -37,7 +37,7 @@ config SELF_TESTS
 
 config COVERAGE
 	bool "Code coverage support"
-	depends on !LIVEPATCH
+	depends on !LIVEPATCH && SYSCTL
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
 	help
 	  Enable code coverage support.
-- 
2.34.1


