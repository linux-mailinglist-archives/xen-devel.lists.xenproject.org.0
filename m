Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM9XIrQ8Dmqr9AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 00:59:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF90A59C738
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 00:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314612.1584596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPps3-0005u1-MK; Wed, 20 May 2026 22:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314612.1584596; Wed, 20 May 2026 22:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPps3-0005r7-Io; Wed, 20 May 2026 22:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1314612;
 Wed, 20 May 2026 22:58:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <VictorM.Lira@amd.com>) id 1wPps2-0005r1-Lg
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 22:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPps1-005R7M-QR
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 00:58:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <VictorM.Lira@amd.com>)
 id 6a0e3c72-5cb7-0a2a0a5109dd-0a2a450493aa-20
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 00:58:33 +0200
Received: from [40.93.198.24]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <VictorM.Lira@amd.com>)
 id 6a0e3c97-1dec-0a2a45040019-285dc618487b-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 00:58:33 +0200
Received: from PH8P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::9)
 by MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 22:58:27 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:510:345:cafe::f5) by PH8P220CA0001.outlook.office365.com
 (2603:10b6:510:345::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 22:58:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 22:58:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 20 May
 2026 17:58:26 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 May
 2026 17:58:26 -0500
Received: from xsjvictlira01-ubuntu-0.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41 via Frontend Transport; Wed, 20 May 2026 17:58:26 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlzwQeRL5Ce3DmW4e7pFnX7b0TAtRIASWdfsA8Q46bKbNVayemtmXthwFT3bNc1C+WAMtdY++OPEpF01CJe+a8hwLxTZWZCK2YklJT03xYyayLUxq1JcbT6Pa3tVAkvwUMIsRXRLP2ak7soX2tvJu67/idaq8giU9PDmjkyavAnqHAXxSLWBMt0faN79HSYXQLVApjYU+K/oVcoJ82jBUtMzhZrg5twuvf9Uaal4eBzvuFZmH6393LfYRlb3t9ck1dljsyMcLTIUdLRU+ABYN/qxep9t4h7lRbQRIRwQzhgBDjeecaFG9bep38hCTuU3gVp3rbXEU+cBHouScGNIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiyW2ai+Q1Srlz+/1YbnLpsnAw5fJtpOfsPhS6Mo7Sc=;
 b=YyJeL3lupJK/MiE9Jrmvafp9FKxwtS/psS4FhdszmiDsGloBBcwXOiRA9P5GLrIqLKmmf4mH8uusPH9SFsQaioiQnB25TxxxJcKNpRPPg6WU4/HAiAn2IYnHjKZZ4giD3lbyC7k+oHtGa0vIXJfnSCBQ/mcVTuy5IZJHBm3sfN9l7lPvpmWHxGbAPSyasx24h3aHdFkw2EiE6QUAyDGgFR4QJcwWTaQY3Ctv+dgxUHxdV6wQ8hhJL8EZcrW9NmnYomOiTWjskyu4xwxrmBD3rof+XdUEcJFqs2+c95ON9r5Jbr+4zcH365V7qmQKwYzc+tjy0HUnzqnR+r7HAsZzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiyW2ai+Q1Srlz+/1YbnLpsnAw5fJtpOfsPhS6Mo7Sc=;
 b=ntv5RhAb9MsYuE+b9DHI8kOkBQonAyzPcEXUJF0HRPei7C+psNdA3UTVfhhfJNnICpzjClk+PDXXvA7lHfm4EERoK98DkSmBPNKMoG2LAjApbpGEYHecVoXmtWfyuYLn4b+7RUqiRnRPmL2vUj31IxQNMgRNnzFri6Ac6htuLTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1] automation: edit rules for analyze jobs
Date: Wed, 20 May 2026 22:58:20 +0000
Message-ID: <20260520225820.31550-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d00ae99-9de0-4c1c-388d-08deb6c34dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003|11063799006|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	U7YDSG6hiSlwyKCXIF4NnI4718o88Mzw0+zJsbdlcWzb2viV0lUNgB8pOy0ueHArpT3azWJsTF3Ydv/hsVxkunIFlq/dSC+RMlhZ4CsVIfKi/SSt9rfIyxImyhgLquEllzd7dJ6xMd2KnJxupa2lkBS0r7myVmvreMa9mekOe+NRJeeW3duF6INWnDKRXdxh8W8uiaQ1LUqhgWAqgDkq2qR3jrKbUM2UMjBfZn+P8AYj8GEUJZpiAsY8h0fMSx438dBad6yWfleBsh8As4kD9Q8U5dYTwmc7Q6tcko6Y6NbMMcSyTG5EwjC5dMF3jGWrQ8WA3IlxMlVNJCcgnW6+84dkDO3x89onf2k/blpKnDFSD5GfB+f0CPvZdMb5AGTElvzVKwwjBaRvquRdD/3qU7LjGZvjrRE0MldpoDA5cO+I5QHWzQmarih7wd8JhDI6rHQxzR3+LbwJSBwr1fgFATkaIZtigCUaKmeetnzLf/U603Wo/R6+JKDL+yghChkykmpDAcqpk01mBzprSJ2iUOSu6vF4HweM+tpA7PsaH085HMJ08AqS+A06PtTT5soeUIRrLkkKBkbiaWrvwA3Vd6J8RTXG41n82vEM/aphuwMgTInWwh+Y2/hGBl+QuZT0rN3Lp4vguGHurIbTD5oSdak3aUCUNUlvc2fFcdBNvo2P1QMgUEW/X+wfTsWeEMxd22nnZo7DOn26XjLUQaja5lnw9duZTtMzLL8xjhm8P40=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(11063799006)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t1hQuDtFC7v3VmtAuqidXR5JqqTd+RvpiBTb4vmGWkyKjoSoeN/X4eXZDxo6Vlen4FjnHjvcXa1VDfTlLtRCPX4LDpMhflJzFVhYCmfqHlO328gBJ8+WFov4C2DBlPO7oVlC5OgUo9vIJfs9L5OV5qjlxcu3zMRXUf2or0OxmFnqxzIemsQ0Jo/UDuJkWWjem29uuNAnixDZI+NIuYMYCSQW9ZmHJ6ozHIMCo5x/+QVrrdRd622SaLsMQLgfx8INBLdzE9R+dpCiITBLBNaj2OmIOEzStNl+SBLLyKyUhhdRYdRiI8HWr/sm4DDIaai/T6uhOkXacp0w4h7lAeBi6JOREZqS/zrzIZDWaAVt8haOGf0z0PRaQdbxzZg+fKaE1VyLWtjA9iP/4sGT5L/yhreas0kkRkwrXX+Z6nKQvizrH2kDYwHmr62fEksxq3ja
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 22:58:27.2051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d00ae99-9de0-4c1c-388d-08deb6c34dc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125
X-purgate-ID: tlsNG-ebf023/1779317913-42D643FF-F11ED8BE/0/0
X-purgate-type: clean
X-purgate-size: 3286
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[victorm.lira@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[victorm.lira@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url]
X-Rspamd-Queue-Id: EF90A59C738
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rewrite analyze jobs rules to simplify the conditions under which the
jobs appear and run

after these changes:
 - to appear, all jobs must be selected (SELECTED_JOBS_ONLY), have token
   (WTOKEN), and be in an allowed path (CI_PROJECT_PATH), this is specified in
   .eclair-analysis
 - the subcategories have their own exceptions, keeping current behavior:
   - ECLAIR_SAFETY/ECLAIR_TESTING can force enable some
   - eclair-testing jobs will not appear outside xen-project/people

This assumes we don't use pipeline sources other than push/api/schedule.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
this preseves the current behavior of the -testing jobs running anywhere on
xen-project/people but maybe we want to limit it to whoever is doing the
testing, or in some other way

tested on my own repo xen-project/people/victormlira/xen

push https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541858231
push /eclair-x86_64-amd$|alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541859057
push /alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541859605
schedule https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541871689
schedule /eclair-x86_64-amd$|alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541875599
schudule /alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541876512
---
 automation/gitlab-ci/analyze.yaml | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index b3f99f472d..687af4d452 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -19,25 +19,25 @@
       - '*.log'
       - '*.json'
     reports:
       codequality: gl-code-quality-report.json
   rules:
-    - if: $WTOKEN == null
-      when: never
-    - when: always
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $WTOKEN
+          && $CI_PROJECT_PATH =~ /^xen-project\/hardware\/.*$/
+      when: on_success
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $WTOKEN
+          && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
+      when: manual
+      allow_failure: true
+
   needs: []

 .eclair-analysis:triggered:
   extends: .eclair-analysis
   rules:
-    - if: $CI_PIPELINE_SOURCE == "schedule"
+    - if: $CI_PIPELINE_SOURCE != "push" && $CI_PIPELINE_SOURCE != "api"
       when: never
-    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
-      when: never
-    - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
-      when: manual
-      allow_failure: true
     - !reference [.eclair-analysis, rules]

 eclair-x86_64-allcode:
   extends: .eclair-analysis:triggered
   variables:
@@ -218,12 +218,10 @@ eclair-ARM64-amd:
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
   rules:
     - if: $CI_PIPELINE_SOURCE != "schedule"
       when: never
-    - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
-      when: never
     - !reference [.eclair-analysis, rules]

 eclair-x86_64-allrules:on-schedule:
   extends: .eclair-analysis:on-schedule
   variables:
--
2.54.0

