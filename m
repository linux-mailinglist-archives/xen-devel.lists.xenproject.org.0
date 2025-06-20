Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB9AE2230
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021077.1397125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgUp-0005Mj-On; Fri, 20 Jun 2025 18:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021077.1397125; Fri, 20 Jun 2025 18:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgUp-0005Ky-M3; Fri, 20 Jun 2025 18:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1021077;
 Fri, 20 Jun 2025 18:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgUo-00057I-8r
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:29:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2413::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c076d95-4e04-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 20:29:49 +0200 (CEST)
Received: from BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::16)
 by SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 20 Jun
 2025 18:29:45 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::17) by BN9P220CA0011.outlook.office365.com
 (2603:10b6:408:13e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:29:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:29:43 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:29:37 -0500
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
X-Inumbo-ID: 8c076d95-4e04-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJUMJR8PPmBlmzzCRfdrCD4OMLk8cXTLh4X7Rcjib82138YQbfWGuHXw6JxISWFjA343rUOHTTVC5T1NDuppqF5moXrRf6VLHIRHWNoXYTPLUSzNHG4w/OhXFMic2JdHbdCYg4WCM584oQ3uBkdXf5mYDr40SEdOD/pQKqRaC3bBiElo6UkJrYDzE53RjIiCu8BTKCVm1C1XTZKp03Tv5D2zVlfXXKlxFYNLMbp8HJsQ+1Cfc0czQBZBYDLMyPnwvjPrhuCw6HBACA6wd2nHzqaaCWLS0evi2+M/7IqvL5rSRF21lY93s17jmrP5hRO/LiGo+oUbWoi+Onz8xckmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPIMmLTlV3KNkR+uQ9J8eRat1nufRPKVw3tSoa4EpJs=;
 b=hx3dmwh0B94GCsWUcB5awv8UJyrDZ7DaOX/S6iWn+bcRWSF8X7LQGBW3Dlg70pcGAoh0P+gdlxbjpYeof2nF6hBWTs6edujWKSLb/7FxcrdG7ISBT7WK4jXmobd2KLMdebAg9d1kev0fTn09Y6MO7ogF7QleyGcOhgHl0ujpXSrFOJL45REdfJZ7Qm2tYLSiUZXFRsAkWS5omscXD69XUz+ob1vXkau2kYVfao/II8RweGFgg6J94FdsYNBEfQTKsG8In77MQU6NPfU53dlGRg2uIRiCplEN7axHYPnzl7Vs5yUOYTkn1ddFAQFtG0SutctqlhP7Lr/usTRXprrXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPIMmLTlV3KNkR+uQ9J8eRat1nufRPKVw3tSoa4EpJs=;
 b=e7vwp0y0V10T+N2WciXi9jsiPyJxgoA5pVkVdlHMxflFt9871+JrzFcBXyHwlqUQATy0kgzOSSHM422JtFPVPThBPUOR6ifn0EFj0lhECMU6C93zg4mGb7wtXDm3vmlrq+KWeviyVy8wBHGQrszjylkf2UkikL7e8MKh0wEih3Q=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 01/12] CODING_STYLE: Custom type names must be snake-cased by word.
Date: Fri, 20 Jun 2025 20:28:47 +0200
Message-ID: <20250620182859.23378-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SA1PR12MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b4271b-7e38-4012-db89-08ddb0286d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wS+9PJyOWceFqQHOVQ7Ztf5t7khxF02zCSQHr0Bg7e+Patz31e/FNvKNBbR6?=
 =?us-ascii?Q?OcI8n/GVEvlRsBwsu4y9KnBgc6yGT0NeEn6lIKdJh5d1DWMD+axCmYNNY6r1?=
 =?us-ascii?Q?ErI4yPjaMDAE3oIrYPTiaE1eSgB4+E/7lvdWvb24QbZM1btdw6Gr7mPNqFSr?=
 =?us-ascii?Q?hgc16VsGjHgiIut0n3/IJcxvFWxkDUf6E5xoOFxw+fDi+fnqRuUbALQbMFf0?=
 =?us-ascii?Q?C5gbef6+qwhYxuZh7qr2T/p3OlWwjLEB7/y7AsO1f390TmoTaki5nyfsEUno?=
 =?us-ascii?Q?kV4NP1bZ3Mydy8+gagWpC4/fIx6V1hOw2bpgKgy2hnAbUdJ8J+pIdpR7RnQQ?=
 =?us-ascii?Q?TQf4k58z2dWXbAlAmkfkP5BQyH7BNt5HRpVk3Hq4xFesqFUuzTynP9RM08li?=
 =?us-ascii?Q?CqzLOTnphmz+QidCkCSJkMjhw1nA3acWCYWXJAhUZHVolB06jwHFKNUSje2L?=
 =?us-ascii?Q?fBdSubw+SyHc7OdYYFCAd+YIMNe1w3tCI8kHOigKPo4bZSEhrE7re74F4sz2?=
 =?us-ascii?Q?L92SUNGug6SL//PyohzOxA3ue4x9oAYIwwpf0MTfxKEG8TFLrwNa76IWeL+9?=
 =?us-ascii?Q?/zVQGqI/oH7cG9hobs3/KtjnYChxOaO635JDCki1w4RUqzuDgpuVs/bMR6LI?=
 =?us-ascii?Q?4zDCY5cgtirTUCIwn0I7lzDkMTiA3N8NNxiRI2uQ5cwsVuwvSygJwh/JE//2?=
 =?us-ascii?Q?wUM1fN46m47o6SuxZxXLJPi/WsjH8xRJMq7AhfXyMeST52vPI2n7lvrjbxnC?=
 =?us-ascii?Q?rSkDyJnvmRbDbrGTZih+9EPtbSKThFIyHyUwY/VoOYvH9rfZzNX0h3T+tGpx?=
 =?us-ascii?Q?H8W7GW4mcrWNQZnLvhv78BdMMvhJLrU51oZYUbnpm34RzrK9W6xKSUPFL2dz?=
 =?us-ascii?Q?tTuGiD2jZdvGTpd187j+ZEM541ampuNthQ4BtJvs6SkdcQUquU8ZjDFM3s68?=
 =?us-ascii?Q?qZ3ahf2+v/1ogfAm0Wsih9GjqR1f83ZPD1iO7Eh+2KiU5ztzZGmgI1m95vk1?=
 =?us-ascii?Q?gXrFcLnIccQzuR/9uN/MoQcEDDQdxAtypJxipWAKNYNAkGbCC9U76/ZFkywr?=
 =?us-ascii?Q?21Fq9vYTE3/C0LL+3Kw4IE2cdgrhkdHY0tDJJ6Zci9pESpUwhMCTOi2PByQJ?=
 =?us-ascii?Q?WIMS7VvisOOc1HoCG10V/uq9c8n2JBq2vySrhFCfcXtaBsXkw+d6XGAwNwfA?=
 =?us-ascii?Q?1NDR2gyxZAYSuZkMDJJpRIcBIOI6GVQcEArZAHuz4xGNniM9vZFxGHZ7AlHO?=
 =?us-ascii?Q?zjkgbVs18h8E0EwlYva1MgYy9q8/41vIpgY8/5VjAarqGzTi2YsnNB5H0lub?=
 =?us-ascii?Q?rgC5uVkSVLTDoVpEU+CzZRWLalJZFif+QtLMYeCUhzayT06a/VXNFQtA59Rf?=
 =?us-ascii?Q?PPDVMFkzPRbkOun1SCNjW+mlyEK5N5vFtiNM4iT/d1GJIDqWMqjRPyf0cY5C?=
 =?us-ascii?Q?GJjvkt2HJ3IHe+7P/eHWAlSyY5lvVWMeaUBTBHjnzUeIKUf9mrOmg12m2k59?=
 =?us-ascii?Q?7idJxy/wu1SnrlvBU1HIXPFyIOlM1vmM/maT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:29:43.9512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b4271b-7e38-4012-db89-08ddb0286d91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703

There's the unwritten convention in x86 of splitting type names using
underscores. Add such convention to the CODINNG_STYLE to make it
common and less unwritten.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Move new paragraph into a new "Identifiers" section
---
 CODING_STYLE | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 5644f1697f..7bf3848444 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -113,6 +113,12 @@ Braces should be omitted for blocks with a single statement. e.g.,
 if ( condition )
     single_statement();
 
+Identifiers
+-----------
+
+When giving names to identifiers (variables, functions, constants...), separate
+words using underscores (for example, use "my_foo" instead of "myfoo").
+
 Types
 -----
 
-- 
2.43.0


