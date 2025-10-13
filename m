Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BBBD2825
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141934.1476157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fc0-0007Mu-OY; Mon, 13 Oct 2025 10:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141934.1476157; Mon, 13 Oct 2025 10:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fc0-0007KS-JD; Mon, 13 Oct 2025 10:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1141934;
 Mon, 13 Oct 2025 10:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fby-0004Rd-QU
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:02 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1f7ea93-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:01 +0200 (CEST)
Received: from MW2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:907::16) by
 DS5PPF8B1E59479.namprd12.prod.outlook.com (2603:10b6:f:fc00::659)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:16:56 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::58) by MW2PR16CA0003.outlook.office365.com
 (2603:10b6:907::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:17:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:56 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:53 -0700
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
X-Inumbo-ID: c1f7ea93-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syhtezhz+MYqPc2zP9UHOyIKLY3GvUzEhUjGgTzmXroKHGXrQPOqhJWPzFEw5sjt5h/dy639CArpTfB8tAKvJh3DQD2u7dtUIJv2vRCWK3i5Dy5xrsLt+kGZf/5Paxt/0TtGpvgJ1dYMHwCTQAzHAEvzy4a7RHo6kZ9rjG8gPFzuZgpfZOfEo6H9aNHmrnYoBkNfpSz/ILFLyHnwGKGvqgfzJ020r+/C4AsjjggBVFl6bZfTx68HkPBOu15ItuE4Xx7vaHx+ETDD7hwF2oj6y8YRwb6UTiLCWILqUN8nhg/aAdevSdN3bD2zFwr8H4mws+OdtswCTQh5IZ89BGzMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA17gzSkL2SavAaY06dZyoHocmEV+HABYkCyHwDzWdQ=;
 b=lcuXQ5zz+/uwlHKSLW03/ALZkPQjpAZTGdfWnCD1mGxtd1oVLHuPM+0mRi4K74aufcx3qF0DUMpfUk792w1OwrDAjzpgzy7yanDfbGZqVtkOvZCBco4ESqnvqxNwPcggS34Hk0vneroKs0ahQnZFLspfPeqv+9w5aq9LV3DKWdOFNI+XScEEap/Pn9M98Azp73qXsLijQJ58kJfBfa1FMxBS0oWYuAgR20amCUqq8TdsvpajjNLOYtIvbCwYhs4pOjwPIs6dCi40EdEVhV5gXZQl6H8QzEqucfBoz0tLj4yKvEOASM/wgcDl3bQ+cx0x8UXNhUmuQRP9GjJg5O/RQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA17gzSkL2SavAaY06dZyoHocmEV+HABYkCyHwDzWdQ=;
 b=BaePd1BPifPkq3LsNOiZ8gF1/jeUVmyCnCrWcBultUebglHlerv4Tv3cR4RJ93c174D6iKe3V98YU+oFEcQR8eo8Izxe0NOl3MKpTX6Sq9zzPeKOg+PtVZHSbeKMOmMBLhpG7ruX69FgZylifsK0uvbsQToE2hLvO0ew6eaxhwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 10/28] xen/vm_event: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:22 +0800
Message-ID: <20251013101540.3502842-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS5PPF8B1E59479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0bd761-9ccb-46df-7530-08de0a41a35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t2MgLyke/KRNd+E5gObZgSiQo0a1rOklgIVfcCnzpXF2INNQW/B+HetOD/ne?=
 =?us-ascii?Q?Mm+MyfglwAbkqAIeQEAvDswRJ2b4XGXP6E/hkMNrseWZKUirsKmUmTbqR+70?=
 =?us-ascii?Q?WBjE53cRnpS1mAG6HdAiRuhF4mBpSgMRUMnHcO0zHDBQRlTsCopsSryfj+QE?=
 =?us-ascii?Q?wo7KRPyae9OJY4tnbk15Yuf6Yq28Gii3mWjTtftlIHDx5VD6oeU31KOsYcQ5?=
 =?us-ascii?Q?ooT6xvOLL9NvqXBo8ujGNUw3otXdF5NO7Z5qR1AYSJWm9CTi1c0nabdkLxll?=
 =?us-ascii?Q?sYomIfb7tI5HHfw2UDJHpt6rxl1/JwbzVyqUcmj6fcw/w05uxoYgCWj/Q2e/?=
 =?us-ascii?Q?oY2JJh2rK6SDZy7yG27+Suthr+DHjnUVd+e9Ks/56z+fzbFj73ALlsuxbxHT?=
 =?us-ascii?Q?dR+Br0arX6mdCnMYHz8zGnDXXtlfjWm8vtYXDSObUeHid9K/Lb+PwIhLqO+g?=
 =?us-ascii?Q?GjFsQCM78ipUSP1rI88seDUc/No1l5Zg7dZV7JsmsCMlY/qrGFdj13XD4kv5?=
 =?us-ascii?Q?OBF+F90qusQ0jwhB8Rdg1ak8h2qxWW43RxeSp74MyXENmxfjNWmZq7ePSONV?=
 =?us-ascii?Q?AUVtdOYEw1KILgyNWS4JErHpBdJ5QmNG3yZ0SXWdlq5ELY3pTQBuEEgwbvtF?=
 =?us-ascii?Q?KQ1wGEbgw7+1NFMTIVDdVWaFLackIyB+/SGNgb05FAMKXxuh/C6QdI0KHBOV?=
 =?us-ascii?Q?i3cGPQfc/mSw8lqAhRSE1u3cVLdSiB5HvwRTRWEohr6/1XrVK00B66uKsuqH?=
 =?us-ascii?Q?R8yhIl+74vYN8JW7CN22Ec9V7VMExePdZQQPv2gmnzEmi2YcrLdnPWDbJQNW?=
 =?us-ascii?Q?sti5ri8bqkbKemaDQbUauX3opVi2jIPFATNeSzJOwbFG8WJ8Oym08BidHUcX?=
 =?us-ascii?Q?07r9G+Ogcng60t1vvtt2isxdGCU9nAh1GEch1+TfKOdR90FXZmxAQC2xSkBC?=
 =?us-ascii?Q?l2UNm8SIJP3cyBajjlkeiLslgFECPppbsGRKu8kQvv8FVFVz1iq8eGBmxu47?=
 =?us-ascii?Q?NtMtzcIjJJyatm2mbft/ftPup8DQlJoH8a1x3m3FEDe/Dsuby2PXtUnBYVEL?=
 =?us-ascii?Q?rr/gDwXksZOHP/ksy1QjmEeq8CqqSKYA+y8zKG0x9ME5O/hh/sHhc9ppjWlB?=
 =?us-ascii?Q?oekA6GmrpheA1PEghLLJj8E+4ojUa2OvYOflv3A5MjUrKcz/TZd5Zvov/bHX?=
 =?us-ascii?Q?AGytG6dR5A6AtMH3ONOLcCKVLSp0G0cnoQntujc1cSMCCU183PKqd+NRc8kT?=
 =?us-ascii?Q?aR4Je+iegqoDSZVc2/A6Ugb4yotZIdF7MwAU0LiQb4uSGZL3NS82wyJVZQlY?=
 =?us-ascii?Q?cDn9bji1dHxwvbd3YtjpzG8zY27N0xCfng05oFYuPW/lsIryS4XTVEnSieic?=
 =?us-ascii?Q?vcrreysmZ3bD5pH7NJkTtjg837/CuUe77ByOBmldxHrhblZ+j229BI+4IFNz?=
 =?us-ascii?Q?3C8IS1B9OkzXH2VvgHlYpF7/lBEckiXjRoaOYnw6j0CFLwIvMXlnR+BLi7fR?=
 =?us-ascii?Q?ClQ8dYPcLgEhLTpfx1dgQq5URAfh0XVsV2NF1tnep1c4wKQqvp8V/yMfw1d7?=
 =?us-ascii?Q?eyBAPc/J9XmlBfZ+sd0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:56.1614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0bd761-9ccb-46df-7530-08de0a41a35a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8B1E59479

VM event could only be enabled/disabled via vm_event domctl-op, so
CONFIG_VM_EVENT shall depend on CONFIG_MGMT_HYPERCALLS

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 95cbb451bf..309d262386 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -172,7 +172,7 @@ config LIBFDT
 
 config VM_EVENT
 	bool "Memory Access and VM events"
-	depends on HVM
+	depends on HVM && MGMT_HYPERCALLS
 	default X86
 	help
 
-- 
2.34.1


