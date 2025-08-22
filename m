Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695FBB315D0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089856.1447362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOA-0000im-Ot; Fri, 22 Aug 2025 10:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089856.1447362; Fri, 22 Aug 2025 10:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOA-0000fh-Kj; Fri, 22 Aug 2025 10:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1089856;
 Fri, 22 Aug 2025 10:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPO8-0008I9-Lk
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d96aa6-7f46-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 12:52:52 +0200 (CEST)
Received: from BN0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:408:141::29)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 10:52:44 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::87) by BN0PR07CA0027.outlook.office365.com
 (2603:10b6:408:141::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 10:52:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:44 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:42 -0500
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
X-Inumbo-ID: 25d96aa6-7f46-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqdlgndB8GcEaVBOQb4lqxvmhxRmI1InBSbX3y0A27DYwgnCPVwz6TIqEia94i49TTevHHA8n6vhyb1hiZa0JbI4wk30o00/mvDmPfXcXCD245z0M9+TA44vezEIdWCEvRPBChq4E7WBeVmfU/kRq/fpjIvkiwNNd6wVU7Hn65Ylw4SrGZ2NwozxyAvHUTYV1h2LgM/ia7PBhCAX7Qm0M/6MskNnzs5lF3GmALwWYWn3Y/Z7fFWzPiFP3UKNwM7WetThr88B/P6dQYhpDMP9A5wRd6A4cyQXjye3zKiT+Sde4QdIlAdQg8IDBXvoe9CxHlnzGSmRjgUOfgDBNHqg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F93un5lAfvv0KNInBafr37fvQ4Y29SHKknyVE0PvlwA=;
 b=x71/hnKhv8jck8cSVMlI+a9wBmJyI+Igzas9oLTVBPXi4CrhmBeKWVZPhMgQgW3CLVDGJEWdeTIrjcvlOUHJol83UQPD0QgiKyl/yZ6Hm4lyN1jVOuAU06+Jnf0XSe8tXD4OTP8+65VjUv9uhn19Xr7sAK0T7gtgnaKkoqXI3SWT2kFqne1wJVI9O59f0rMxw8g5fLztOsvXPmgwkMYpAzaedA46Q5NSNCKAKTtSUAIsJ5cPmzhySU0bBRrseEZXlAPBuzAwl8mOKpWAZf8/oIXN9y3gF+3xDjruwhczTYSxm5/1pgXxFEjrfEMP4EN5xY9/XtB1Pfsd68slIYiILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F93un5lAfvv0KNInBafr37fvQ4Y29SHKknyVE0PvlwA=;
 b=NaeYPtGDAkWsMUIlLb+3JKfVQfKfRJIhuhXK0OC0aBw1abFyq3wpRYs7Z7mt3wG5THnZClcZkuk4S8oI60gqvo97WlmgQK7WMNUQdk8QT5fTeDOspPFyTVkZE0pkRN6jLYuGY1+DBn/LrNBNHXvNxlFzlrc0OjiI1SSj9o2lCvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 04/13] xen/cpufreq: add missing default: case for x86 vendor
Date: Fri, 22 Aug 2025 18:52:09 +0800
Message-ID: <20250822105218.3601273-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: a53edcfd-c854-4e60-925b-08dde16a063d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JRTnxfHxibu4pP22JqfoY2WxV+g7GHL74fuq5yTVHzKV31sfR6Ligu8Ssvuk?=
 =?us-ascii?Q?OIBiu0wSx9iSgq5dPk6uZKaNfulteeZmqfGDJlouBGBNT5XbCIxI3b77G9qA?=
 =?us-ascii?Q?lmxB/df6MXfQ8/t9Y5Po4saOIPX9DdmKx+2eMWaAtbC7W5O1uCN2WXErit4A?=
 =?us-ascii?Q?pvtac02mT0YqBxn0dr38ASwEU2K+9YvDIoy8mFceOqUCJYGUhcTKk9bd65pC?=
 =?us-ascii?Q?2KapTcd8RfOhs7ilDo+Ul7Sd91x6hfq1C3YWct+ggd8fW8jyYYiWLPPySkp1?=
 =?us-ascii?Q?7SdINda2pl88onP+PQPWOtouaokSJlLTlJv8zyDceUKHRTMmeOj3OWVequhf?=
 =?us-ascii?Q?AoRIgqNrrRkdv23Nvi88tmXEHqpXepHwu23OmIG8CyIB21S6oB5t6yfTr2Vg?=
 =?us-ascii?Q?sAAmy5LmbgTEUJ7gC6yxsSpOMVdH9SEQrrEgnp9pocT/XnPNENc7S5H5Qgnc?=
 =?us-ascii?Q?1vUW0qRWC89KbGsrWDFiAn6nNZqQXb5cIRkjDg1HH+2iMdjp4ieY0LpOuz6y?=
 =?us-ascii?Q?mh7w2iraVUyPUJeFQDdEk/PCDFvsvhKlU0gbaBzcwcPAlOczh326XetfmwP0?=
 =?us-ascii?Q?U+1qjs7fM0oEam6cz4cW1e8XZTbNbGbh+3K1fvwNkbM9gcPGyN9PMMh61psm?=
 =?us-ascii?Q?JbFISUufAUhsQsmUCZWoLXmNT2x+ofDOkvS1neoBs/upJE2T68lHpJ8wh5Rk?=
 =?us-ascii?Q?WKNzYfdKBhAP5aQgOn671lVgsE2XfvkMf/5zqmPvf9Ghsjoy1afMV8F58Wce?=
 =?us-ascii?Q?2r/DwWBkqE3qJfH+OiUGaVW/aMIlfL4NhOVEVKmZNuszaWqh9mB4+jYhQ5Cl?=
 =?us-ascii?Q?H0U+5B0J/EA6CL9gRrUIsYyxuYG82IAAMSYQkYj5MPaeiAK5FUD/AkxIbONn?=
 =?us-ascii?Q?hxthgsS+UwGDBJECOBWPo9FGix7mQdb/XXhVcLlKfOo0ggFfYTgXD32WGmmC?=
 =?us-ascii?Q?9siTkeNCoFiTSrQNlq83XxTuPwOF7NWZBN+QqP5lEQQapc5g/AVqmenjCEMu?=
 =?us-ascii?Q?gAKeP7CvbREqKibfqs5xqqlRhb+JuHajC/0fei/kvYldY6lCFsbDoWbtbN+v?=
 =?us-ascii?Q?lEf1U1hfN5ASg4UfjNJgOyKycmML+HMHii1U1glaG6Viem65R2SgT4L3xYQ2?=
 =?us-ascii?Q?dVkGCxrT3Xt9piWNs2r8MhIF3xgm/3q/Wc/yqp3BKV2sXJBgqSI4Z6Gzv577?=
 =?us-ascii?Q?ULVjAa0pJN2uzZFRdxbiO6/tugRQ/ZO/epb1H7LW9R4g8ceN65EFFRai52Fz?=
 =?us-ascii?Q?rDqpZ3izMf5uHCtS3itp8sLYejRmC5ond0WlUSk+mjqtWfkmXRLT2mdKDOrb?=
 =?us-ascii?Q?u5Xqrc4KKtSdp8rhOOeZVMHITtmLddQr5Z74hUrPg2QIyyNyvsFgUv4k3PGr?=
 =?us-ascii?Q?bLMb5BvWLNoywDIqc07QDecQ5j1rgYTyvP9JQCcEhQAtAwzQ0yNlTLh4kLex?=
 =?us-ascii?Q?+D1vYPhzHG50H6JptefpqnVDITkaXTJIsGYAT8DCzv5TrINHSb+M8yE2FO8c?=
 =?us-ascii?Q?LKIyXOWstovdPhE/sviV9iSD6aopr/C3aLs2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:44.3520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a53edcfd-c854-4e60-925b-08dde16a063d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739

Since we are missing default case for x86 vendor, there is possibility (i.e.
new vendor introduced) that we will return successfully while missing the
whole cpufreq driver initialization process.
Move "ret = -ENOENTRY" forward to cover default case for x86 vendor, and
add error log

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v6 -> v7:
- new commit
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index d18735c7ae..e227376bab 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -131,11 +131,11 @@ static int __init cf_check cpufreq_driver_init(void)
 
     if ( cpufreq_controller == FREQCTL_xen )
     {
+        ret = -ENOENT;
+
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            ret = -ENOENT;
-
             for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
@@ -162,6 +162,10 @@ static int __init cf_check cpufreq_driver_init(void)
         case X86_VENDOR_HYGON:
             ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
             break;
+
+        default:
+            printk(XENLOG_ERR "Cpufreq: unsupported x86 vendor\n");
+            break;
         }
     }
 
-- 
2.34.1


