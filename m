Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBECB7D9F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185128.1507414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuf0-00062c-BM; Fri, 12 Dec 2025 04:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185128.1507414; Fri, 12 Dec 2025 04:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuf0-00060h-7y; Fri, 12 Dec 2025 04:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1185128;
 Fri, 12 Dec 2025 04:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuR4-0007Dl-Hl
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:18 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b4ef203-d710-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:07:16 +0100 (CET)
Received: from MN2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:23a::28)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:07:10 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::4b) by MN2PR03CA0023.outlook.office365.com
 (2603:10b6:208:23a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:07:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:08 -0600
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
X-Inumbo-ID: 0b4ef203-d710-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y22ncfmGuzHS5u8OlZfjFOS6MDtHiCpYOJWA5h/xwYeF7WiNNOTcZksDZqhy65fpUSTBYynpauHJpGUVWnCbugZxyzIo8n8P6E/wTMDrN9ledKND7M2KRTwSNWDBaJ2W3WNB+KNfznK91ILsB8EjOpp+MMo+trqH0iFQsiCRE9jMf+o6Ux5luUJCl4wGhHS88E1UE1P4v28PuI8i+m3uG1sCVI/AZR9SMZbQB9XxKN+vuYJ+s7SGHYIZHiKdmzmr4+nCiodKDGzEyj/WG8u6losT/DJxy6Nz48A6wf6DzepQ1gS6NivxeJjBoBzxHwr6HiIERXVc56OI+jzdAp2b/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGbm9eEkFpZ2F/oXAGCX6J/TUQbFlJ+O3rJBuFWng2A=;
 b=yxmA6svWd6gpND2dDB8PdEZtJLjk5tTOrXHme7u30jzfRp7BV11LzLdUGpqCp4iJ16ripO/0NJUfE3MMjt2JUpKeuAz6r5Az5haki0Ixmim0riPAVRUoyIoCncQ9rHdFm+YaN6t/5CF56Yr2ijYTXTryocWfLYBYllPbcViY2dJITidQtj/KyZ3sLErVUQ4aInhLPNLHdKvjQoXgN5t2c7lEpGl/WSzucF+gH1yrPOnWBlchCIIOJAUNCnD2LXx8oPEniifJ3P0U0Rol+2J5gXwTkF98ZJ//pFPAGkjR+tMJXKBLvj+0tKjfFBlrjeOpk7GOEQ/NG1F80qDa5YjvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGbm9eEkFpZ2F/oXAGCX6J/TUQbFlJ+O3rJBuFWng2A=;
 b=TfDnfCqzL2tSC6LO+uExolq1IFKjKrZNpiZIYlW8qXOith/5J2SqEyx0LA1Iq5/yR2Dn2hi11CzzAllWu0PH8gMFQtbKSuFT2Wi1FdH5h/y3T/OyzxZRJIBG69GYjJTJnsFJ8YrcrfsauaOnWEMK+Jffybh4mid+x+VqIzgN+C8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 17/24] xen/domctl: wrap iommu-related domctl op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:02 +0800
Message-ID: <20251212040209.1970553-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa4527f-c77d-42f8-ee1a-08de3933ec1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oLX0rDCLn7HgUiE8PVrwL+tHuKGUtebiKCfYJZdxH6ilD4jnk73DcSwiPb0Y?=
 =?us-ascii?Q?1jaetEhji6NWGwuygttMHNF60aJZOm/aEHPX0ti5E5DxXCD5d+4e9kF0D5zQ?=
 =?us-ascii?Q?7jYKrMwnKYeLpKmRn1S+Sa+L9yaGXECf0wHxEXd35FLuBZKJhq2ewq2tIVn0?=
 =?us-ascii?Q?mes2EuHibC//5gRVchXyovyOUgwMhpzM/tDYy7Ia7ExnZqsco9UWHbwkxwXf?=
 =?us-ascii?Q?GVBaRRm2bYVCFsw76Wnqk17wb0IqWCrLT+BbfsoakjDCF9Sf8D/sJjenNmkI?=
 =?us-ascii?Q?lW3g0UO56aLWO9A8GYO3SUP9CYdRZ0En51zhbRXKP/QVAkdbxLIyySXdkmm7?=
 =?us-ascii?Q?SskaKwK8izoJImeXfPls/IyEvmpcDF9ud4nmPI6XWskf5Ckz6KHx40BQqDtY?=
 =?us-ascii?Q?jzNVpfIMR32Xvu3iSFQBZ/2ScMub+gbfz0fDtjyTBw+qBkHkrxB6J0hvx/lM?=
 =?us-ascii?Q?+nxSXapJJJaaf4u3RMiuJT3TKhIzKTwZYmiW91PM/IO+H3H8KuhDHHv/VylM?=
 =?us-ascii?Q?WHunNKyk/fHinwUm/9cQiFmSGJ07u7qg0WqVK43ZOsTZCBAAz/DwRQtXh4Gb?=
 =?us-ascii?Q?uLvHlnxqcv/xf6YDNdGg3CmEkYYimHxT57gN9D/3nACYbXvXqsXnEVGm10fM?=
 =?us-ascii?Q?G3TcNEZD7kIm2dfQWPDbTAXAbxoMBBaHZ69nX8c127lwSqHdf9sg2qIR1vSl?=
 =?us-ascii?Q?KS914j3H+dKdlchyO8Uu8SL/K8lFauFOuetZhwFpUE8y8uG86Pjz/Riw16be?=
 =?us-ascii?Q?yKxSpfCQzlSZomRNF45IpQZqu490RrXYP16ngSm9bp926df/TPLhbxhve3Zw?=
 =?us-ascii?Q?uAi/oGSBacoLVQuhMz5Z0DLP3MzQY65f/dvhiEFTUMUEFcR/8+z/6gvQFfC0?=
 =?us-ascii?Q?hz9aTVCH4HDKfvB8KzeY7T9VvRuk1Nddi/N9A4DcIaJQR2Q/xQjnOqT7NFEE?=
 =?us-ascii?Q?ARqhJ4/vnd/Fm+ulupbbxkpkOoiMDDuEucIWbpOB+msy05LGNYLjf3mUoXY0?=
 =?us-ascii?Q?Z+/+qdUTVsHgldBzIf0O5lN5UsIsR/lSdrcftwvpKq+XamimOY4Euj8NArAz?=
 =?us-ascii?Q?sNOI8r/4QiH+y5JnYDnhqlmQ8jKf7dH1I4ay3cwppp9xU/EeEcm6J9XP9Ep1?=
 =?us-ascii?Q?TrEdaxGefePRz2S/PrZqDVraZszyNZhhoUYuCFc4VueKfchAkMD+7VGBDdqc?=
 =?us-ascii?Q?7GQL/RW58mF2g7gRIVYC4h2AZ5diPvEAJqSYcJLHdSZ6fjahM7/VIjcM0tb2?=
 =?us-ascii?Q?e6xZN5SaWCso/+tP+DVAmL80r4b7AfD5N+8g6fUm7+dIVM19FfAQ5G/oYsbx?=
 =?us-ascii?Q?9W8W8YPkZGcZOFuvDKnJCru4/rpDt2iax5nhyyM1uM3pbyIYT+PcWePgwAb/?=
 =?us-ascii?Q?AiR+VLh36zygqwsyu3Mu1gjhzcPA0giaj+oboM5PLAdAwhrrVXTJOA7DSMDi?=
 =?us-ascii?Q?07m4CwWqfNLN5mKLlc5s1T0ER1SA31R0JRk+bMzQXyFYcmp2Hnfzlc+TcLQy?=
 =?us-ascii?Q?l6Q+RNjYAxNih081WpJeJPQnXNZ+e1q2ygqbxweyfaQph423b1w7jKoWQGlL?=
 =?us-ascii?Q?iuaNOwN1FdMkpYeOiJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:10.0262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa4527f-c77d-42f8-ee1a-08de3933ec1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961

Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
Otherwise it will become unreachable when MGMT_HYPERCALLS=n, and hence
violating Misra rule 2.1

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- fix typo
---
 xen/drivers/passthrough/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index c9425d6971..8812e38174 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -625,6 +625,7 @@ void iommu_resume(void)
         iommu_vcall(iommu_get_ops(), resume);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -645,6 +646,7 @@ int iommu_do_domctl(
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void iommu_crash_shutdown(void)
 {
-- 
2.34.1


