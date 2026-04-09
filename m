Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC8iDA2Q12kaPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:39:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EA3C9BAC
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277087.1562371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnjh-0008Ra-Id; Thu, 09 Apr 2026 11:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277087.1562371; Thu, 09 Apr 2026 11:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnjh-0008Oz-F6; Thu, 09 Apr 2026 11:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1277087;
 Thu, 09 Apr 2026 11:39:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAnjg-0008Aj-08
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:39:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnjf-00C2vv-CO
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:39:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d79003-2eae-0a2a0a5409dd-0a2a450288cc-0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:39:47 +0200
Received: from [52.101.193.6]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d79001-42fa-0a2a45020019-3465c1062599-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:39:46 +0200
Received: from SJ0PR03CA0228.namprd03.prod.outlook.com (2603:10b6:a03:39f::23)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:39:42 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::8a) by SJ0PR03CA0228.outlook.office365.com
 (2603:10b6:a03:39f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:39:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:39:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 06:39:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 06:39:41 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 9 Apr 2026 06:39:39 -0500
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
 b=rO8Zp3Yx6LD7KLoE0hVzsL4ZuqKwN8wn7o+etaU3zFlqsk45Y0XiNouG0SytFqqmmHp01/u46HgnabwcU+sxoxKrDTS3a/LmuQQCfFSP/1m5eyFTrUwWuIS07ZBzegtG/BMEyR7sYSBjmQVULSDevj/w0JX16u6TAtOPW6+K4Arg0H7/GDRa/DygxhaAuJEcybx8xu0ymBlB2yGyZYGy8HGLUd9hgrHISwdtoXII643KFndn98E84J/Ga5DT2rMZCqnHsalivlFUs0QjNGh6/FQARghqLYirx5INEb08eYNSDFXEqaKRApc/UBeZsndqqrS/OXtADJuL/X2PtsPnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAopumW9tXcTDkz+Pn6jm6L9ZBc2XUfcfTkK3WsQW18=;
 b=WWtBAXE1fHUSnTo7viFA0kSHiaU4HKL4g7EiYEuAfsDKm0AeAxwk+Qo4B7YZnZNT/0GL6QBsMCk6AUyak8NbV3kEQh4T3ssd/X8KmDtR0vZl6ql8MgVgpYGT/+50sm7mfA4shp3vJbJzEE6iNeli8uasl+2JpxB7u85+AJigtTzhnnP0/FD02p7+gMYsAZpWlcEZAzWtma5eSWpzNugEDqbllZRlXd/M828ON3muRQp2t/uxGPZGxz/VWUAGO53EJTHK7pFSVh+elrTqdjoRO7jRJxf4oij5PB2xEWvDIPEz+8nRxZsX/1ZI8aKCNcGbFaILBsNF30DD3xLv+8qMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAopumW9tXcTDkz+Pn6jm6L9ZBc2XUfcfTkK3WsQW18=;
 b=3xZSEggRpmPx5oewCDuTTNlnGZY0BAh4oW7IoV1BqIPKL5pQOM0VnVx5C5Oc+CkChCWqziW57jLBbZunug8wBPwFCQBBgvcxNbxsnk01dt6mNlIDwQ04SmCwm+I0F54wvTgDcywYu2CUqyVAJ/YFtEnm05tzOj663+cwlvzj/GI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in parse_color_config()
Date: Thu, 9 Apr 2026 13:39:33 +0200
Message-ID: <20260409113934.197619-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409113934.197619-1-michal.orzel@amd.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b22715-b2c0-485f-dfa5-08de962cb0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	apyWwzUUUiRAXj8a8GZoQf584U4AYZEOZ2D6vpAOgQ9e/as075hipKPqTYIIsl/R9lnFNwQnMOOSapkeqMdAl/xnJtL9MdrX+AZXkNVmmEtJCSCzhZdHo56unBOyh5vK886PDnKgwUVG46Kp0JbAbC1y27Atizsv5H29X4dxvQkuPZn/nl/b3J/VwPGkzgcZBW8YzLOWokuFKUe9dCmD3ieW9ivefbKrxieRzMvZYFhWeOGVqQbupGT3M7Lj+gpo0Lrr4NF/Lj9uz2rXYpJjC0fyUardpC/dqx2e7Qg07odlYM691aihjV+IwC+rqNkWJbUO89CltEFU+c5S9zg+TTyB/eMMyMysezNrWlR0pHXahIhS5csidCmpNBkX3cLwbchWWxrB9ZXJmi4bldc+BJLK4yHa7NkQ1TrQNlCkmf1XQZUk/PbJDl0V/Pl4FJ+7dTX3DrfRDBj/aGxusE6c++87zzxKC2sbAFFp35+OwJA3PbOE3JttmIUdH68EuGgnEiouOV9HduL5xRvtw/7VlVyK+3a24C7D+64C/hZZciSKVfoy5RwBwh0o2030jdwoxda2lqZ17Y8kboWgQO+y2rEyvN2wcGou9aN8Ejy3KkDuW3fdsasYulCgvoiG4me1JuMIWtMQC4mlhzHRD4Omrxm4qs/bTOoZNlxWKIDHUwRozgog/pb0k3IaomIEojQbqLpfEf7Ftn4nmjR1KYsVn2z7ZjsVBpcxfkbLH6CVc+Uen/ovhU6+I+43GjhBgKVi5QL6pjVCnURdFJv8bgGSJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u9lstO0b1NBY+1MmFW473LJuwpjMo0vSq1yrEFiBPn84DfjWx65IBLMdoE/98PiggCN390jEIMPbcXxnXYn07zrmg7FHl+InqxfZ8wCiPSFeE/m2Z3Ml5bQOb3+dh7a9ccUGh/lNrFApo9DbqBe0u+6kakLuSznXvVVwNHkGxfJdP/Ojqd3ceFuOe0lkmF8NzKyZf41PaNDwfvrEOo9Aky7taygi3I/cRfDS0EwiDRrtE7Ymy4ihv1sfakVDoEvNz0HEvKf/GFVfR7YymLITv8ONA+DnC58FzX54GNI2VD58cNfNFb9RN7MzhBYUMWFaTHTq4n5YtLrEhS4M2+DwegrB5pK2fFi0N6t9GMbrpQ5ggkQySR2QBt/NvvqIsJ+5p8aNAPMtoxR62EImY9I1wjy6zBtQ3Mn0SXJiMtRQ5tsm/LQPHs9/nWyuWF3v/zcg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:39:42.1428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b22715-b2c0-485f-dfa5-08de962cb0d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
X-purgate-ID: tlsNG-720697/1775734787-46B27CD1-FDD1E078/0/0
X-purgate-type: clean
X-purgate-size: 1193
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: BF2EA3C9BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The check uses >= to compare the total number of colors against
max_num_colors (which is ARRAY_SIZE of the colors array).  This
incorrectly rejects input that would exactly fill the array.

For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
for dom0 would fail.

Change >= to > so that exactly filling the array is permitted.

Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/llc-coloring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index eb7c72b24023..30c1594dac9f 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -78,7 +78,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
 
         if ( end >= NR_LLC_COLORS || start > end ||
              (end - start) >= (UINT_MAX - *num_colors) ||
-             (*num_colors + (end - start + 1)) >= max_num_colors )
+             (*num_colors + (end - start + 1)) > max_num_colors )
             return -EINVAL;
 
         /* Colors are range checked in check_colors() */
-- 
2.43.0


