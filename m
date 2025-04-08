Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D8A81193
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942786.1341900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BX2-0006eZ-Ts; Tue, 08 Apr 2025 16:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942786.1341900; Tue, 08 Apr 2025 16:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BX2-0006ZA-Pr; Tue, 08 Apr 2025 16:10:36 +0000
Received: by outflank-mailman (input) for mailman id 942786;
 Tue, 08 Apr 2025 16:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVu-0000a6-Oh
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2405::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e62563-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:25 +0200 (CEST)
Received: from BN9PR03CA0510.namprd03.prod.outlook.com (2603:10b6:408:130::35)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 8 Apr
 2025 16:09:20 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::48) by BN9PR03CA0510.outlook.office365.com
 (2603:10b6:408:130::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Tue,
 8 Apr 2025 16:09:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:19 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:18 -0500
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
X-Inumbo-ID: d6e62563-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6Rzp27zm8TH/hdxXoB5AbyMZLsU/atAprbomog0ckPL72ogew3cbqwFcsVnwPw9yKLD0LDPFhmzhfuTj+zNqSRlYG/GFQpEcgpNOXXPZ77IDK8TXN6Ez4YmLXquBafN6XHzb9SRubI9eAhaxt/GBHtik6rPhXMSQbYzLd4E0Dn28yk8vmfLRkvN6c8nWMq0YSKq7mysz//inMHrJOC8OamAC1eQRP6X2TVpb1J+USs8xaL4TRAC7wus4PczWgsv9qEjXsSk4iF1exsNTsby8wcMVzMqvs9rkntRrgARteppkEpw/z4RB/0VsjZCJFuQzmYcMdPGAXYV8Fc+Lrqy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2WAAf2kiNnaQf/e9i4d409O0E4TYYx6jvhe7n69gtg=;
 b=dZPb+H09vWs1AAhAECvBM9lO+ciAv/gHbtsgnjgEXuTsUnQseJGgsf2M9C1a/dq/RABnbpCP9L/+c2b+zIs0S9kXB7tsU4hXoAxx8TjCwedOqfwB/UIO/nU+LE7dMWsYcK+hRQvV0dFqab3AUzsZbGQeixGwQpk8zMmc3yn3A3OAtqBJRsgUkU70xpKN9ournZCHkGspiCo174hICwAOhAgj1I/QW3/KLmlMr5Yqk6TqnvDqRBOeFLbP6wUEEUDiBdr0befGZYSmnfaj8F/PrrRWAdYYtvSht6jyn6RH3l60bQkUhaP1246M68bzmbh1kaFUEqvCk3i2kA08hKtgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2WAAf2kiNnaQf/e9i4d409O0E4TYYx6jvhe7n69gtg=;
 b=i2hbGrF1CDOPX+36KE8VUAQ8/GG2ZJ8TaiwrnkhCOXPzCwHz3nKiBBShDnD09EI3DbxhGSEaCKsSUUm6mICqT4MRflne17smdUSqlYsEXFlSqXr0BLKLE156qAsVGNcsAUYUFKCWUO88uaeyjLmKUztVhF8dkPkznK5B4/jtlg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Date: Tue, 8 Apr 2025 17:07:37 +0100
Message-ID: <20250408160802.49870-16-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e75752e-cb38-46f7-4ba6-08dd76b7b83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eSmrjKGXkNeppS5kka0jrKiBJyN4m8LUkjDHu0wWV4831Rq2R2SHSi5M8Eo0?=
 =?us-ascii?Q?5M5TIvdOu82M0ww6F3uBY7d5Mnr71Krsx8J+OZ5/UwzpYQ3X5fpLBN+7fT9P?=
 =?us-ascii?Q?Kgja/ksGdMhQy6tzp5ghrSbkzoVfVUctmHV3Mbi0g3kCWiPxF6oeUI/T5Npq?=
 =?us-ascii?Q?OxwySPKTIbylitGg1Ylr2mYVMk3+ODAWUslsE0xgzHqWxzMQjuLqxfDUA/uR?=
 =?us-ascii?Q?6vXwa6zNE8EBpOdpYfbHcKEpOmKSsNAoVziM3HuvfnyQh9nq8WGxYCYLW5gY?=
 =?us-ascii?Q?5Z+ROXwjuhpxrSZIKnU0bp1cRpTmqx7acmH+8c/5WAkeUk2L7PMLH/hcmrfM?=
 =?us-ascii?Q?Gr/l184DcXYyPT31KgsB8cLRBePLeVaQ3OsKsKpHsw2AQDW289ObnnaUiCOV?=
 =?us-ascii?Q?yZQqk5DyiYqkJTCCcVk/IQJjxFcz9ARKHR0RmSiM9MIs13KtqpC0LWfZdkOP?=
 =?us-ascii?Q?mjriSWAP0eQWvX16VjpaOZSZ/OKRzG65PVO9uH40t7ZgNQZtde5lLAjtIOnk?=
 =?us-ascii?Q?CL6Q+2OlOMhlCYY2o4dv85o/OXdb7NXz1B0hpllhPVN+vhQlITdUwMqRPrDp?=
 =?us-ascii?Q?pthqhODrRyk8c5KCl74PcNRruvhchwqUf/B0TiELgDczgWic5Su9JEJFwoM3?=
 =?us-ascii?Q?ej+HbuUytvR74/akr60EqVqyx8HkRX8EgieVPVv5O3M4GniQdM9ZWEWxeV3H?=
 =?us-ascii?Q?kaWYLKIeTQVh6HCnxIvLzPFkY2W9seabsN2jXIEpE1XzVGQO3z3jT+4dUHGt?=
 =?us-ascii?Q?rXArNvDSzRtsasub9Aax3dTO3hbiTd2zOFrrrkYFpFlAI2hmHETmExuG45mN?=
 =?us-ascii?Q?D2I82PgY5Uwgani4Tq6CkktGH4PB/x7AdsoizAD6ijmEEhwolv8dlEghl8nn?=
 =?us-ascii?Q?0fM1f5lCVzq+S4UgGulucezozSCCSQ3592/s4EQOjY/h2mXi3OkIwZDrbkYt?=
 =?us-ascii?Q?4AHdm5HUQhyJ019ZVOZ2pKh5vEDNlNRcsNz+UPLwofmRu8F1CCPfopamLQKY?=
 =?us-ascii?Q?7Xy9YgocbkeiEey20PFxqkiapIiRScYVZE49LeFQLORrtpWby/YSEIyaY5Di?=
 =?us-ascii?Q?bi3kvNFDrABh/v29Wpb9Q6wY0Tr81aI9l3T3vUub00TKPGGX8o14a/RQUO7I?=
 =?us-ascii?Q?EGK+WRuPTl/kscCsNZG/SRkJwMNEqRmyzDOTZDIvNfQpsyaDmvMCevVdQGjr?=
 =?us-ascii?Q?oQcqeOweZfxwMM/CD8dg3LvhU7cwpCJDb9igc3/B24o6SSMGQmhnbeCkH3DH?=
 =?us-ascii?Q?XHX70kGD0OrySxKdw8J5efToI8N/JArgcPhSAOpi2zPlwyH68/oZtWaDmm2O?=
 =?us-ascii?Q?wH9GrgI6WBW8v/lsD4lG6w5wc5ADJOn2aTXpgTeYy7D5C/lIVXTntimTdODg?=
 =?us-ascii?Q?530bycEnjt0/xn25WdZUcMZHLkQ0seediM7nIiTwyaI7uNPeUN8Fmmg7zbjL?=
 =?us-ascii?Q?+krnCHMhs6hoCyqdVN2hofI2QU2SoukR5OkiVEgGopeZdb85e0mxuwyvcRAL?=
 =?us-ascii?Q?OQXpt1KTPRqJd9NzNogRVyYXVDSBC72QIwEH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:19.8127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e75752e-cb38-46f7-4ba6-08dd76b7b83d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the `cpus` property, named as such for dom0less compatibility, that
represents the maximum number of vpcus to allocate for a domain. In the device
tree, it will be encoded as a u32 value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/dom0_build.c              |  3 +++
 xen/arch/x86/domain-builder/fdt.c      | 11 +++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 36fb090643..7b3e31a08f 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -635,6 +635,9 @@ int __init construct_dom0(const struct boot_domain *bd)
     if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
         dom0_size.nr_pages = bd->max_pages;
 
+    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
+        opt_dom0_max_vcpus_max = bd->max_vcpus;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 338b4838c2..5fcb767bdd 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -246,6 +246,17 @@ static int __init process_domain_node(
             bd->max_pages = PFN_DOWN(kb * SZ_1K);
             printk("  max memory: %ld kb\n", kb);
         }
+        else if ( strncmp(prop_name, "cpus", name_len) == 0 )
+        {
+            uint32_t val = UINT_MAX;
+            if ( fdt_prop_as_u32(prop, &val) != 0 )
+            {
+                printk("  failed processing max_vcpus for domain %s\n", name);
+                return -EINVAL;
+            }
+            bd->max_vcpus = val;
+            printk("  max vcpus: %d\n", bd->max_vcpus);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index fa8ea1cc66..969c02a6ea 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -22,6 +22,8 @@ struct boot_domain {
     unsigned long min_pages;
     unsigned long max_pages;
 
+    unsigned int max_vcpus;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
-- 
2.43.0


