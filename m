Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDBmM9Td1GnzyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:35:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356713ACEB2
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274858.1560834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3lj-0008JU-CS; Tue, 07 Apr 2026 10:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274858.1560834; Tue, 07 Apr 2026 10:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3lj-0008Hg-8x; Tue, 07 Apr 2026 10:34:51 +0000
Received: by outflank-mailman (input) for mailman id 1274858;
 Tue, 07 Apr 2026 10:34:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wA3lh-0008Ha-Eq
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:34:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3lf-001cke-5Z
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:34:48 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d4ddbd-e002-0a2a0a5209dd-0a2a4509a11c-18
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:34:47 +0200
Received: from [52.101.48.63]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d4ddc5-bf79-0a2a45090019-3465303ff9e0-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:34:47 +0200
Received: from MN0P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::26)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:34:42 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::6c) by MN0P222CA0024.outlook.office365.com
 (2603:10b6:208:531::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 10:34:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 10:34:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Apr
 2026 05:34:41 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 7 Apr 2026 05:34:40 -0500
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
 b=hofdSHwcauv3Cf7KTHvZivKAbLxsvGqsK/rXyTYbGnVzylaVH1BQgZwT4CMQ6hbtnWoM3ODhQxj0zKMD3wlMszv4TGDMnxo5ruUPKQSwtTZhzEKPNBZWmfwhhbd/sU34a8LS+/BrJnrMESIQC9ovbWmsVLMennNmaajKBctnlr98D5YZJYVMSB8lTtPvPff8t06cy+eUYokBDwU0mrpIEqtQiLumUMQ5gV/3YgsoeiZiuZZUc9+1yoE8/8T+a8fNzmkF/xNqVU7XZnRC0k93HetSEkcHJ4VGdwQG8zTnAfBMct1oU44EY0nT+evfg5oGcJJ+FkldiTjYWGZ5IRovfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jn/NYQTDmG2sUW7CaH4rHjy4giTNOf5urEynT7oWyQg=;
 b=g/oOYqXVvJmJXoaHGDm+kfoTXGidsQYUDzXwFyAmGS11c1WX2x285ZAySWa0g08hak8e1pCIR0AAIJ1Ue+s4ttjizd1PlEIcAaDP2rQ+/u/Fb8i773XREbPt9JPlAwFavQWK3Vvi17FDfgOBwUtgPQUkptY5Vgk0N3FXY2HhzPQ8oVbEYHH8NMFiW6G/BQEWQ/43HEqJSr9j5z3EQot0BJmTU2f5ZZq6Xj0Hxbmdsfj07RBTXNuoIw+Sy8y3j8+mH8HcIoT/3bT+iWLbqoocV8s7dNKx1sffFCLNz7+djYLv8UarimjgSb+i3+PQHMc5nNkiNkFf6dL5qPhHt4vCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn/NYQTDmG2sUW7CaH4rHjy4giTNOf5urEynT7oWyQg=;
 b=yZ2tFOP+TCdeDwJyo8/caiC6MlyOz3Y9IM8JZL7khZo01VN0FH+99oVpXO+CC8CqA7zDDVoKljqsm4hLRbIHA2PTkSSEr2wE4JWgA3FgHjOt86FsWqzyerTbl4O0JRMHj5wFc1YkWbTk3+dTawzmExAsVT2sdeoYJiXfqKHpPNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Rahul
 Singh" <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] Final series to make Arm MISRA allcode green
Date: Tue, 7 Apr 2026 12:34:31 +0200
Message-ID: <20260407103434.90838-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 9354d2c5-2aef-4520-51b8-08de94914754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3UVMJK7D7phlmZPR6yxBKqmHvLNzpmrtcpnmOyNdGbkICV3qumbqp/+n8CuNgpsM3+I+Q5hpgLU8xGgW1o4wZ4y8h12ndc3MT5EjO+1IXvVWizkPXxQ+D/4IfT84hfOwQxlac8lt+F5jMN/5x8LMdHfapEb1ARWXs6dPBScOBJXR7lG1VxXw3GBNzO4WDM741FJVyygUE32Hh5/nxR1jx1DHBf0peo5Jn1pp0jRloOPdU6Kj2rXf7SFh6RUOapzxi3n/q+Mc/QeeGESwMArfVm7rERKxtppA/id49+eIJ0SlMwr0R1rK0pnYFQEYU0i0dN/REulgOcn7n7RLgNIRTk11xhZSRos3WY22mHd5xmCdQPU3umaepZcoy5nbhMXnRmb6O/3/IqygH0kn8iz8glRCIy3o6UZt8C0tGb+bzMr06hY4u0GeakraHP/rokACY4vzhtV2KbL8SkbXQ3LufZRHMD8hudJVKLmV0/ImHWPzf1WUppMxKAVbJSPeRjdjygW2euLlCqat4TMr/3+LG7Iz9OfxKBjnwqgTemLyraConCBcOIp1KP7zPoXuv/DTkLpLi+kx5aFQqLfcVR1r++Rw3h/iPOOlrSkI+n4LxzzzJ6sxtME8Ow9ix4rQyVLdpgS2oArimuyDAdG0DqVN+Nsc0KoBnzwGE5pt/622FTfccG+Z4jcDtLBlBfntNAlQasuz4ErvZnl6IlweIoGl5DuqdyVMGpDEBrJeYqRYykI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cA+pluvGF2ujYmVSAntr2OEn3vRwcPx7R+6KTGzcifznC5SCIEyiMWC1/H/0SpjyQrx7bOtaUblwCbFjdKm6sZDURRQ2pu+DED0SfhpgowHIHjEnvHsTJHL4urYfPXC5W6g8iR6J1DjOUZh0XzXQM8RPn+EzKneJ3f3F0Cum8bS+xyNJkn6bsP0keETW8ljvWLHjf3IsGP0+cmqvaeorGBTNBOUZH9+l0nbSFPIVm44AOc7ZakxnZe5jaLzt0bAwM8lwdf9yp7FH5nQ4/ftEFqUFHD04k8sIwVNTPE/igswIQ3s1GdetHU/iOJSxtIFp8NHYq2VzmfolejTpc8B6+d5jbLmcGatc96wClDNpHnHAtGu567R1xVwNkmmSdE+XrR1sOIvyVAE/suWmGDe2feuXTJxhQMFCiTbE+ZUCnXgCJ95CselUX4bjqJ7quMCF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:34:42.0610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9354d2c5-2aef-4520-51b8-08de94914754
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129
X-purgate-ID: tlsNG-bad1c0/1775558087-5D5EB152-D325D88C/0/0
X-purgate-type: clean
X-purgate-size: 408
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 356713ACEB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No more regressions for clean guidelines:
https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072

Michal Orzel (2):
  iommu/arm: smmu: Fix variable shadowing
  iommu/arm: ipmmu-vmsa: Fix variable shadowing

 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
 xen/drivers/passthrough/arm/smmu.c       | 7 +++----
 2 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.43.0


