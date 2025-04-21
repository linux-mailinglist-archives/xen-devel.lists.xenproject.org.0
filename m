Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B965A94D5D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961049.1352695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6llh-0004zG-9g; Mon, 21 Apr 2025 07:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961049.1352695; Mon, 21 Apr 2025 07:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6llh-0004wi-6s; Mon, 21 Apr 2025 07:40:41 +0000
Received: by outflank-mailman (input) for mailman id 961049;
 Mon, 21 Apr 2025 07:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljm-0007m8-8j
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a59d6dc4-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:41 +0200 (CEST)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by LV3PR12MB9439.namprd12.prod.outlook.com (2603:10b6:408:20e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:38:37 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::7c) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:34 -0500
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
X-Inumbo-ID: a59d6dc4-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyKDBHzWy8MB0c20xndSM3xCJH5E7qQ2+CeZngqztqoVSBQ/+M563bMrMrxyBW4xtl9YI0ZwdurCaIxl9zpcsyzez8fIlOV1JI5LTS866LFrL6JoYpWGAVr/7DEuFOqnvCMmbciOMPDy+Nlg2qESnUvDe5Bo74j4YNt+9j1Ehmx5mqsdQbSJyiSjyfg4lY2gPG3PHKxg9Yb1HU5hTUVuNWnSRlcaENKDteFwU67ftxLrxPn5hHtuL6YCakfH2s3yZ7H113hbEVGzgSLqEmi2N6fhr4Otl+aznHtWfJku3qja9FAsKs4BRRSud3Z0ndC+V0sJvWzhZPhyL4cgiseihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnyIrDi9rVXKU6MVkCtl80IgBbsG0KVm/Y0El01Npxg=;
 b=NYa3yZe0KKb235aiWXNFQ/QdoMrvw1BycufEs2Ep1M9mnMt2x4soEGEbUywRs45/8ecUcpYUXbO4V72dGVIGPwNde0HkV0eA/tB65E1WDXVFrQOOmYqm9d7NgYZiyo93HgyoqO302zOCBU9M+8eKe4vmUp+aDLWsXDpuuvqKeW5tnwKG8qXWeHSZiyuzAJRFIWiydmewkMobgAxb2zQA9Oe3y6ETFNzjayvCwCg1+pkr/5+1WlmFqeC5laKObDZHNznPlX+v2TSqOWlyKzR58dteIAeIyqo/6YtuES50wJ73pcm9oObTyygHYL1UfqTKQtMTqcIH2VND5dl6Wp0rSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnyIrDi9rVXKU6MVkCtl80IgBbsG0KVm/Y0El01Npxg=;
 b=DcYNoMntcUzXH2b0DawcdSFUEynYfoY+5P2lmVdVvNRGIKTbfUjdWim/CH/oKXjQd46JmU7NS1lCKQ78Alxy+AoswEljlGymO+JuP3cu3xv69pay9vJaU5b15moyMg+eo7nAivsMHJ1KpXOaarx0ILCXArep2jUaLceaIi9LZt4=
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
Subject: [PATCH v3 18/20] xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
Date: Mon, 21 Apr 2025 15:37:21 +0800
Message-ID: <20250421073723.3863060-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|LV3PR12MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: 0965916b-6389-4f72-b70c-08dd80a78773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LwTsTGrTIP/PSy/LwHMF14DIaA6nrb7UdGRTt9Mbl4Gpg6LLUbPZxC53HGRb?=
 =?us-ascii?Q?LOBHBvdRE45inMhPQjuKCI6Vt9VGO1y0F+m5rz1WiJFLYDdOeGA5C5ErIISs?=
 =?us-ascii?Q?BKcamHTKb9KscO7rebpedtdlv6JVLbY26NInQ1Q9yH8C3sCR+vHEsOZCWqRF?=
 =?us-ascii?Q?GccgpPUOzuLMEl1uI99awUz7lBSZ8dMfuhSgOgi6yP7hT3uwR591bxnfDKLy?=
 =?us-ascii?Q?NqE6WfGsiQgCMfQtXu2Pm6hEDGZTxXQy6cdWx3h1McZz/wOB9az2PVEO6GOs?=
 =?us-ascii?Q?9gwF5LnSdDVZqifOtijbIPJar/ORRQOZayk8EVnJ0u18IzfX2o6+MuUk0m6D?=
 =?us-ascii?Q?4xL//9DOcimvgytpx7CjoPHQ4uOnB1O6gsdLOFql03fgWH5WGzSv8actCMih?=
 =?us-ascii?Q?oj1psqIx42FRLRUsJu2tRjPLnZkB6Kx6y8pkc4qt37qouChtTf8DqG1nIbtQ?=
 =?us-ascii?Q?XNOuWxkPlZaw21/1zYhOgMNDVuU1i5i33Edqyw1VWtnNt2bleBdsUD3Z+7Ym?=
 =?us-ascii?Q?hiBzOkKdGrw5mXVrQh3QiY0gc090F9iRehXM/OO/fgMI8CXU1IrZZFuRo9lK?=
 =?us-ascii?Q?xEXUUgmRHVggclJeOr4PlWhtBvxizr9wNoXy5NxGSxlw3+6KwgZNbScWmM4B?=
 =?us-ascii?Q?ETkvhVt8+oLlY7QdtsedukRykmMg3xJ+qaMDJarMlCi+A+HKezaT0ocGQ8Bg?=
 =?us-ascii?Q?N+FJALpZIlilvGBwfcAfCStBNrZ51x1h0eKQbetbgk8+9FwI/BPnAsd8jQ3r?=
 =?us-ascii?Q?xskfNGAZZCuXF0A6dMuQ1M5NYcZvM/5FXot32nAAbBE12D24UsoflC5145pL?=
 =?us-ascii?Q?UK41r1VbKTqROS3WkxsdAZ0VVxK3y6ZT9is7PHqamJXIbZmV7RtVk2rCXSov?=
 =?us-ascii?Q?9tAxDYfX2kG9Z6JNRCXlVUzlJuMsYsLyy1KFmrpxTjZ1MDovC+sSAc32Kfxl?=
 =?us-ascii?Q?epKxx7G4AJMFZfhdsWPp4cJ6jx8ovmeh4goIJTYEOQlzsRUF4IjykCppIbLP?=
 =?us-ascii?Q?7y20LwVQQXxjXaGyot4CB2MpYSw84Vz6oDw5DmTt1iw1lAkoDqSDXoQOqvPv?=
 =?us-ascii?Q?9L0FZEQiiOoSC7cdFwxNapmPAdvPqagX8yDKz7kQPKpgNIdxChjwdjsfZ45l?=
 =?us-ascii?Q?uJOA0+F9BNfZj5S6kppg/4MXwOwDzCpyIchXLfOfBcGMlFD/HC0dcIyznVSP?=
 =?us-ascii?Q?JfdEmmVEG4L7uuoazQqj82aixhhq9I9MQfBG56SVpXTIhjk5XMYBMyKYSN47?=
 =?us-ascii?Q?+afymMSDFxC747OpKhKLiTX22yBJegqIxxG3/P2XWzhstxneG8iedlQ0Xcku?=
 =?us-ascii?Q?xfwj67DsCg1DXuyx2cAqZj8HC3NfByWRF9EeamUhX97btcaF9XgxHSs0/+1P?=
 =?us-ascii?Q?mTcqx/LiXZivrPyP433fPcjszuct0WihuS1YCRGxww6XjAEdtdUM3bAfuNv6?=
 =?us-ascii?Q?Wjn7901aTub9AtKamLQFOo2/dRavr7BQEarXkB1U7iN8fgHEVosyIV7bSoRv?=
 =?us-ascii?Q?qgzicJW1OafPBrbIJLNnh8oMkEBc1Vdp0n6k?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:37.6441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0965916b-6389-4f72-b70c-08dd80a78773
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9439

LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d8e242eebc..db6f75fae5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -457,7 +457,7 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
 	select CC_SPLIT_SECTIONS
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
-- 
2.34.1


