Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FAD3C3CC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208502.1520681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DC-0001eg-Hg; Tue, 20 Jan 2026 09:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208502.1520681; Tue, 20 Jan 2026 09:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DC-0001cT-9G; Tue, 20 Jan 2026 09:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1208502;
 Tue, 20 Jan 2026 09:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8DA-00018d-5y
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:39:44 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2aaf39e-f5e3-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:39:43 +0100 (CET)
Received: from SA9PR11CA0008.namprd11.prod.outlook.com (2603:10b6:806:6e::13)
 by IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:39:39 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:6e:cafe::ab) by SA9PR11CA0008.outlook.office365.com
 (2603:10b6:806:6e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Tue,
 20 Jan 2026 09:39:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:39:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:39:38 -0600
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
X-Inumbo-ID: f2aaf39e-f5e3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htC+sJj6Cmsp4Hp2NUbcaGay/tkGty6VehoB7XwVge+ojzdZqYiGUuoLTC4r9jwRxbkH6Oug7PlCXWXy2SQ4BvjmbKPQrFKqm1FSqXBDzk/oYkE5/PT3DptfGpySgyS7D3cRAy50uPQ0KePZC1LCcyBam+HiZdBL1whNBgd6KRQvlPA5QsTe1UvDP+my+oEoCqITPpA/Fv0ZvUgM3IFeSQoHbg5hfemtqDFEyLcAna7bjk07PvE2EZ2HgZI2AaEtKNVeVJ6kceRS+fCP1srKjMyXSvUxDD4AQW98tJZJtkIPkl3FtjsUgpKLh/2730mOetYKZclOA/MyERyKajuPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQefSA2WZMHjaT2qx78VZVCjljpc/SfUnwaK++kIFs8=;
 b=S8M0N4qTbkgwT4fhKBm6vsY9ztenbz7LUanotY+yophbb9Q33KUEW9tY13tXRetUQTAIaxv8zCTCUqc0j4ClXzx9g3Ea/OgPqeVqr3VetoFiiiOsQ3WD3yfggkqbKydBsGWJ4M8T4nR8meRyhc4YZBUrT58FckKRfRg+EqE5jQBvW0hci2+2saAbHkGT270qsIWYg5CTcmLmdzt4U6+OwzMoTU2OZTmfyoQK+eTiHNBYUMFzB/riIWE0Ak8MSehOR2pa/NkQJqzF51R28Ls7t9OFNBSNZv5Hn2qfaDkKIJNXYdRp9UgOjMOTcR24b4glsxyjdMbBCMpik7ooHsN1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQefSA2WZMHjaT2qx78VZVCjljpc/SfUnwaK++kIFs8=;
 b=KAzzK0SSEO9n1U3tw7CiTyODKTm6uGxN7/iAYclxNxuYjnvoftB4NTpy30QwOL91kcYTsHesljCNroMLsmsWYxreXOAWvM2B2JV8pUW0KDjAuvMHxWiWCUMdsWog7Vixq1uB9fsT3eWfmVpe3Bcz3sP/QEXMntRryQRm5K0zElM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 5/5] automation: Disable ucode loading on AMD's analysis run
Date: Tue, 20 Jan 2026 10:38:50 +0100
Message-ID: <20260120093852.2380-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0f563f-4085-42c6-19e0-08de5807d528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dZx7MDoNscdnszO0NZn6VnIQgQ3aySeoNY7AkNQeHcAVWXWVcyYchUgNSaf8?=
 =?us-ascii?Q?MjNxX8pg064EV4zeY335E74rULsaywKFc6agpfhAQcN1QyTlYpclvmmfTh/y?=
 =?us-ascii?Q?kltlm2rqgRHVoNnnGigiX9SAHkIsdmg4VUdV2gC13LekqPovQ7ITAtOcaNf2?=
 =?us-ascii?Q?0Sr9W+V3yIxOeLQWxgqdeQYF0TCWbuMg4GJIGtt6QEJEF6VibfaZk3FcN+y2?=
 =?us-ascii?Q?yHeo3EXtDRuxd0Pwhdnm6MFh9r7qvEcpZhz10jZFLn04W96ssnhWziCXNSAD?=
 =?us-ascii?Q?FTa46NNKfaHuuEI6D1E7MUWW2/TdQkl+8ulc+FY4ZblBGLcDkDUuoDoDHEIe?=
 =?us-ascii?Q?rnsu9aRDEIonpg4r7WOdXT9XXSXa1Hteo/W8IjYZLXLzbpZhMVnnAuuVaKcV?=
 =?us-ascii?Q?l4vE8Vll3/pUHT1ktEa3aD9h6GBcZ5+5hcQo8bZNlN0tKj+GTQd12tfykbwx?=
 =?us-ascii?Q?Dl0h0GvtXRAw4Jga/g4Cg4UgwtLNgTEN8R9O94rjm3Pkmf/6VKt1JAiRFc1c?=
 =?us-ascii?Q?jgxvGPOtrqgXO+1jTTZ4FwV7GAkoFdAnhlKELt/uz0DFslQoK2UK+1zoo1jA?=
 =?us-ascii?Q?CCHbJ5xUX8syb1/W0cyVquzP6aoFLOwFCka8LWkEv2lAgsinjwZ4yhGrelyQ?=
 =?us-ascii?Q?B2aE2ZUJw1vLfr+Javx0ZpzfNkSQYO++6ECX7OPcklEJEhErg9ed6/KbwYbY?=
 =?us-ascii?Q?O9tsRYqgW9jLm/93aFyQi63RE9JvgWKvNY7hXE9sJrY3hmHV/XtrQRmy9Crz?=
 =?us-ascii?Q?KWCVj22WABF1t4CFxOSBfVeSfFmFoQnVruSevrfYgz0EyY8TEkBm3ww0Kgf6?=
 =?us-ascii?Q?eGc9BcjvIR73s6Uxh4PwhdemVOtws+kawoQdiIuWUbGMdLQViMxFmkDs/JNT?=
 =?us-ascii?Q?KNHK1FfVCn983/GKLi1gVuH9vETP4kSYH2Ym44YB14dAiv+Rb16WAX6Ei3Y3?=
 =?us-ascii?Q?BiRRPv/ZABAVZrFFVvCjcAK8pwgfwbvJmvwz6dsj/Y413Zxmb6ToSeZpkucP?=
 =?us-ascii?Q?RrFSPiuSmpnMJg6fOK9HIh1YVndY5vw3rpXW9Xu/4HvtHLJc6/0zGq7ugvIb?=
 =?us-ascii?Q?MLRvHQtV14fMXVx2DBBuh03NEbjnJOCNkrrSagLP3Itlk8ZHvnwGpZhfkYGi?=
 =?us-ascii?Q?mqiEuD/9qBTz1/xOC8/8rHJ3fSw5sGFmcYbyEwi9vn9gEvcCKEs6DdkzI6xk?=
 =?us-ascii?Q?9fTVEqwIXf0E1P2fE/ARn0XerWi8Rb2ebOW16JKOOD7yFsoRiOeaaSn+wCEn?=
 =?us-ascii?Q?z1RwanBfjcAdTL2E5qPl6/OQGT49jF69ljpVV40rl/1IkgrGJAk/8RsxgxqO?=
 =?us-ascii?Q?cQsykEdMuVtc3+zl1VACOusq4kSYrhHeT+rJV9HSso+e6KvlVhdbJnKPkUgm?=
 =?us-ascii?Q?XW6X3Y8lJhQWqlElO2gx2fTV+Sy1hby1DMxzP7s68lN1YbasPmmdv4gIuqUT?=
 =?us-ascii?Q?QZU8DYxT3U+aluHFWY3kNdwvoeA4CPvr+WedHIS5I6/ZXhCzWle2lhTl344Q?=
 =?us-ascii?Q?S2g/0jKro+CU5J7vEWkLDZNs5wz3HAC4a/oxCXfWu+vxgShSlfE/GtianJ8F?=
 =?us-ascii?Q?fbT4Eh1NEjCbuVEnERNySbn7JCeErhCRgoOk8OltXIGhihe65FsiRxmiTOay?=
 =?us-ascii?Q?H2PDVyHbFr9gGIwe0Z1h4jjuzmuv6NLAhtbPewW3U4FovUVO0iSbeLgBmJfU?=
 =?us-ascii?Q?GEzgKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:39:39.6648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0f563f-4085-42c6-19e0-08de5807d528
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Explicitly set CONFIG_MICROCODE_LOADING=n

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 automation/gitlab-ci/analyze.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index a472692fcb..b3395e2da7 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -93,6 +93,7 @@ eclair-x86_64-amd:
       CONFIG_DEBUG_LOCKS=n
       CONFIG_SCRUB_DEBUG=n
       CONFIG_XMEM_POOL_POISON=n
+      CONFIG_MICROCODE_LOADING=n
   rules:
     - if: $ECLAIR_SAFETY
       when: always
-- 
2.43.0


