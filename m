Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WY5+NaX/wWk7YwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D4301765
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259993.1553315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5D-0004nr-OQ; Tue, 24 Mar 2026 03:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259993.1553315; Tue, 24 Mar 2026 03:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5D-0004mP-LW; Tue, 24 Mar 2026 03:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1259993;
 Tue, 24 Mar 2026 03:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdnX=BY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w4s5C-0004mJ-0j
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 03:05:30 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d4c730a-272e-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 04:05:24 +0100 (CET)
Received: from PH7PR13CA0012.namprd13.prod.outlook.com (2603:10b6:510:174::18)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:05:19 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:174:cafe::5e) by PH7PR13CA0012.outlook.office365.com
 (2603:10b6:510:174::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 03:05:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Tue, 24 Mar 2026 03:05:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 22:05:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 20:05:16 -0700
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Mar 2026 22:05:15 -0500
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
X-Inumbo-ID: 4d4c730a-272e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q73XTm3s1NyQ/qWRUoKrfzeUfyFCd23z7NjWDltvRPnOocdgfXvMaEmgEpeArHumDOigtSrOlL5gAnprauuYksEl8S40SugKWHdm+99FGlkAvGB514XEHT/oMNyaKYop181QdqinAxWT+D5GoWE9I0I1M7rZHLa20wqGPZbuflpuK/Cj5KzEDXdo0UBFrrRl7F23w3CJ8Cj3BdMs8+xUKQxf/zQaAeytJFO/+Im8SWcwoi5A+7zrPyz9hAL60ZWuR54T3Y8AgnJqqQoor6nYBer0uVv0BcpzFi6WEMB4V95suuEMUHiqLbBtsIW5AeQsJjsAKDHK7VWvHNPPiPXoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCPS1SVhJTxdoO7vExSmXHAYtVEIATcEae7Zxk/11k4=;
 b=XBB8b/2Eln7+NoTGAGBw4btBsM9J48tecTWWgWLwxMWaTIc92dggpVcbcTAW+YO3z7YzxyzpXSqYWDn2g7swoTjAT8vVJYPH/z98T7k1ADFB1yuonhOGPGtmqrbmKy/XyzGeiaTa4fPssZcYGpD3EUos9AtKVYVR5kGgP8/ThWHJxwi+fKrOcUNyf/5I+8bfwb09i+/Hjk7K8NY7VdtwKSqGAaliigL1BnNBhYVj3sUWWN6zdAYwqgQUzNwMUQjzOCETO2vwfoqWewlrjcVZuXecbJq3AnQqjNPUyckW8MZZghpJCHOfv2ngyaj1P3Gn+kYxwU8ShspQt6QAG2OdEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCPS1SVhJTxdoO7vExSmXHAYtVEIATcEae7Zxk/11k4=;
 b=m9KiMO41UXpFWxvyRsnwMwcdtpqihhKqkIKYLKgdNSiZqF4WNR9+mQx/xVAT+0wtPjM+poSjGdWG51FDlxZ4fQQglJwSP08mVNtsWvxYF2wWqEHSqH0HugSreXw1v9hiyVzAfw3Ks6AtDXsvF7fhtzL7yqMvLv0D7On/ilmghmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/4] vpci: allow 32-bit BAR writes with memory decoding enabled
Date: Mon, 23 Mar 2026 23:04:57 -0400
Message-ID: <20260324030513.700217-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 33acd248-dcee-4e2e-0a24-08de89522d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZYN01qytmmrLtx6F6fizdxYRmbiN0WJnUV63bTmI8qnN3y1feEYxlWSOzBVMFtPEE7r/4J/lCbUGe3vzyxT8dVHoM0MvHq5VHvYW8lc2lvML1ecIdI4ul4VY/ucycfjXafdV2pTf9KaK/HptSCtKfaMNzB3FWYiw14+GWdL22Ou1Yt3WROLT9icni8GbmpceDPDGxi8C7J1aIQYp/u7JzNsAEnAifXWZERGdlZMOkCCjzEAhyFx+CnYEG5g8/MUVX/ALsd6xQgrvmpk1C94TfuMPa6fO6uWj/RuGI71a78bc0Wt75VGXf+hxahIVyK6RycllR0nEIGcOY3j1TsC1Dd9k4IQchTyffxFkg9W4M3eh2GpUIyLSEsyt23wayeREbvacE+gGTcU0cQNREr8dRMK52yVESKlx6EHJgxMcCZ3iys7JuXxzJ/jqMlIg2Gx0Bcj9qY+CUgSqf9N0wxjvEQYix6oZeBr4kYCL0kAZmGge9FKAxxgfKkLyR+Mjze+x8gKhsRGJGH2U+guIC3jigU1OckUadWByN2XtjwyKC6amfA9E4QBrCFScQtspNgXZwT/fAWzDDUvlzxiIqVvugHoZNiFpspCioigQdu5Cz326qei8DBMMHOuNDFThrRQo1JTAWm364Qk/RIYKCXgbJWoB5J8k4Lx/+5p0yEGv2C1tFT1+2Uq44FSjTrY/l1JoaB6KFvaaTKybgi3qMJyO/B869PHQnfNcPxqtgHgqEM+thjjfRfv9Hd32Oz6/POO1oeEPU/jjNq7hm054AhKoOimOsCHd1YjVb57uuuKYkBE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	62d05PAmJ6dwL+o0o0og8J8dWN7r9B0toM4AnqzI+wRKfXwMZT9gMhbT2diUYOiNnhjNJSe5qUGyOog6CdDX7Moqddd70gQkW0yQvAXV6WW/YBYbSmiSH48qbYqNOoLj+LsyF7/XUwKt2g3jiswS35Ob7iDB8WoFQRdkNsJ6AnPXGQqGxvmTQ+OMpaZ4lm0I9HWTC4AM3EudE7p6W9YGI/lSc3XWH5UnRZsOS5dO30WWMVhfBT9Ec2oKR/xYg+YbfK1HWz6OoZ5cjkFf2XQ00fQD4n3pKiSo6IVFerbpVAmyb5wl6WB1k+KfTn5BzZsfDhxZOxDwobCuOmsbCVcjbCICN+4w7X3I5p516EVdqHu9U4hXVUhlPov0FwhX+5ORNJaV0N71AsS9zM/XSOBjA+TAZagrDcelWTV4tfXJIO9v+Z1u/u5b1M2sDXAUViLA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:05:17.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33acd248-dcee-4e2e-0a24-08de89522d57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 317D4301765
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2404206419

v2->v3:
* add ("vpci: Use pervcpu ranges for BAR mapping")
* rework with fixed array of map/unmap slots

v2: https://lore.kernel.org/xen-devel/20250723163744.13095-1-stewart.hildebrand@amd.com/T/#t

v1->v2:
* new approach with queued p2m operations

RFC->v1:
* rework BAR mapping machinery to support unmap-then-map operation

Mykyta Poturai (1):
  vpci: Use pervcpu ranges for BAR mapping

Stewart Hildebrand (3):
  vpci: allow queueing of mapping operations
  vpci: allow BAR map/unmap without affecting memory decoding bit
  vpci: allow 32-bit BAR writes with memory decoding enabled

 xen/common/domain.c        |   5 +
 xen/drivers/vpci/header.c  | 258 +++++++++++++++++++++----------------
 xen/drivers/vpci/vpci.c    |  43 ++++++-
 xen/include/xen/rangeset.h |   7 +
 xen/include/xen/vpci.h     |  24 +++-
 5 files changed, 214 insertions(+), 123 deletions(-)


base-commit: efacf86685912a9249e5cd7f2ef748f0d02b9e23
-- 
2.53.0


