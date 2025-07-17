Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14296B093A9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047224.1417687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSsY-0004vG-QY; Thu, 17 Jul 2025 17:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047224.1417687; Thu, 17 Jul 2025 17:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSsY-0004sa-NI; Thu, 17 Jul 2025 17:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1047224;
 Thu, 17 Jul 2025 17:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucSsW-0004sP-Oe
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:58:44 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2009::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac6a0915-6337-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 19:58:42 +0200 (CEST)
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 17 Jul
 2025 17:58:37 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::65) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Thu,
 17 Jul 2025 17:58:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 17:58:37 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 12:58:36 -0500
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
X-Inumbo-ID: ac6a0915-6337-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCiarkpcreKldVgAfoaQNZ1ZpMC3mPtnwhD5ZZf9mE6+2sRmfolpZg+vOsl5gg7uctJjwkpf8hTiVI97DZPP5Qpfslmyysxq4Vhd386mBw5jahmjsl/GO+bdRepMefDZakzCSuNNZL6hW9EOCC6ZBneoCdbThVj6u6hvnmGbfH2ON17NVpd3hDO/aAw7t2sViAeIC2VU/ZEfqTOK3en56p2W+RyZGrUONTtz5vqICnCe1fbnojIFdUEfqHuoM0cBx/1ydu5D5ekzbwdxosi8It7eANvn0dXrnUMeiiWw2WvOugnZbjkGAE+mILwfyklCOK6pSDEHZ4u4d9Ud7T5wXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhfgqZFxhBQUxe6MEUp1EoFDlX8/aCZ1Wd8+wIymjJw=;
 b=yYsh2hMvO24eTrbFbSb1XskLVlhcTs4sOYvFvo3hL8g3w18+Sr+S5BUsotG6PJlSJVM69dACFt7ysyYMoTmalx0p8Y4G9rPjmc5YjwxIyjaozo1SuJdA4E2En2B7UkBJM9p+P4+0B3aZGVfFW38kqLqgTlwbVOK0USk+bXJP/JtJMxm3hVwufIebfjWzkcBOhQqLqg5VMNY5VEanVYGKqqY26JJMl52XoC5wk7Rwz/q27alory7UT5Mn9fN5BChjmoChxCahS1qCPkfyi9uK9XibZ8ZI3XnXvVXuJj3f1VXt2P8kW7I/76Q4KllK0GxUQlKDFdHlN54TgzuaUVXq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhfgqZFxhBQUxe6MEUp1EoFDlX8/aCZ1Wd8+wIymjJw=;
 b=pfBuw/3RvybNt/Yen+SQ3tzY5FmieVbiI5G21Dppj3ksfFNh1u2WHn+CWHNxZbFgE7pFCgBeWBeLpBX2fr/TN+v6/6txEiV96Y97n4qZPTPr3m7oakIjt4HwUbTIPUnE8bRMJfs+hz/onBZt5DIdiffHu7Vyh6So53sF49ceKHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
Date: Thu, 17 Jul 2025 19:58:24 +0200
Message-ID: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b8fea2-d781-4980-6ced-08ddc55b8e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QqtQSCXpHyt51wPVPO8LYkdYzKL9WIPt8ctMqZTSd1GJOuQtUssM068R8BSj?=
 =?us-ascii?Q?zatF09XTd7CirqBGzi0B3EC4WuZV1zd0h5lWv1/9rirBMe0vdOucbgmBMWbq?=
 =?us-ascii?Q?It3ZqfxWLqe38TFWYNm6wkaMheDxkJFqnpz3QOp7Bsf04ELYxnI7qDcRzYPd?=
 =?us-ascii?Q?Se4X34OiL7i+9z/112PRQfJ1UQ6PakMDQ9g4rZPjsPxeNbDx0VGHEv+/3xFp?=
 =?us-ascii?Q?wwX7u4kV05rYP7roeAC/c1FuHEGq6KxiybRM45+tKhvT+VWvKNVg5mxu+SDO?=
 =?us-ascii?Q?OaASmNIMriIFRRPLjctPScf5MlkkhYf0Agh9U5XTAnrzpNvDz8KSMa5+MPiG?=
 =?us-ascii?Q?zEOHM31SJOeRsaaUVTQpzgp/TwZzXKEkRivhV6A/KZstFmK6guygUFAlE7DV?=
 =?us-ascii?Q?9myzG57o/8/NhPRm4LZjRYArJVBc7rinMK0UyoJYTaI0OLzdWmHifZ5MAarA?=
 =?us-ascii?Q?eM9y2HmBd1KpTncNYEl5ALx5z6IQXwqIxBvS2lLRTAaMZ6/lZM7hpowyaMcR?=
 =?us-ascii?Q?2BgthW0aaUdD57koT/3OVmAvli8CtIjZCD8po2vB5EHlujWm9CHSLi1uwomW?=
 =?us-ascii?Q?A6+xPvcgJsdoxZrcNcgJITx4Fw/q5Wxkyn8bvMxK/G3oB5vA75PZqFtpNzjI?=
 =?us-ascii?Q?YZrC4ZYIrBkTOXyMtSXyxFLkVlq8L8eBUftRGJMqKJkrgUD5kvN5qZNr0ILL?=
 =?us-ascii?Q?LAVq42/e41BUNLAku86X9kx8ioltlNgJiSKUTfIO9An5j1zKxopS63JT39PR?=
 =?us-ascii?Q?gd3q3Z/qkKmzB6+m8pNMZBq89cQN/O9VIZb0eTU8A6wp6KK6uLdx9wr9LPAW?=
 =?us-ascii?Q?gXprQ78S3XO98PDSRvko/ZAgBsc5E3LjeRRFmZe1Li+//V42VVwTF9/65vtZ?=
 =?us-ascii?Q?IUjBWTFI4Vp3bUkNAky96/rb0DSWrqWTGmNAdTmJRMt4zAeLHamWJ01cPPHb?=
 =?us-ascii?Q?6X7ClBlIwimYFQSnWQDiCu7gWhmIrhXDxWXNmIaEeQLR9j+By+quv3Nys/Ad?=
 =?us-ascii?Q?+hBQ8TE1w7Saf+PH6ID47hqoXTsqziEbFB3gIJsPeqBx3eDG/XsmpNWJ0EHN?=
 =?us-ascii?Q?J5o+I4ShqzovwFbeqiwAP3J3fUvzUsvGYZcaS+Gp/0mgpwrpJEi1/z2BCmmV?=
 =?us-ascii?Q?kFx5QUP2257wlT38/uUkwDaNJakvj1ddeBf0MOTk4tyiL/Y72nrv0q1Lay6I?=
 =?us-ascii?Q?EGp1+QWmUmxQkw8THSP+/D9lQn4VecnwInRVG/hIADh4HgaNIubUyU6aG2WI?=
 =?us-ascii?Q?/j3xLTVaNnYazm9D3YI6/sHqyClIkbErxdE4/wlQL0gScx23LKgipgWnxyww?=
 =?us-ascii?Q?ZwAquzhc5Y2qJmwFnm9orBCOI+dXVezJbxp4gIKfDmkyKTAz07clJGj44NuK?=
 =?us-ascii?Q?vB4jzJapvkQttlztuPXfBkE4ZTFX8FAk/St3C8Z3/7L4D+veV8+KlSue4A7+?=
 =?us-ascii?Q?bOC/rZ7iCjpy7XzEI8BIoviRAtqxOoI7F0KsbQSdlYDTLc+88/UmXCY6BTZ1?=
 =?us-ascii?Q?BVPQpDD7EDF7jY7XS7A45hF7P2Nrm/jUdnDk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 17:58:37.6111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b8fea2-d781-4980-6ced-08ddc55b8e4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595

Later patches will keep refactoring create_dom0()
until it can create arbitrary domains. This is one
small step in that direction.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c6890669b9..6943ffba79 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
-    init_dom0_cpuid_policy(d);
+    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
+        init_dom0_cpuid_policy(d);
 
     if ( alloc_dom0_vcpu0(d) == NULL )
         panic("Error creating %pdv0\n", d);

base-commit: 55719030b0bb0069fc8b57cd808dc98dc9d39add
-- 
2.43.0


