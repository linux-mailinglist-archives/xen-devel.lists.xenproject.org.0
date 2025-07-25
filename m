Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C8B11857
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057169.1425125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj0-0000gt-AJ; Fri, 25 Jul 2025 06:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057169.1425125; Fri, 25 Jul 2025 06:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBj0-0000cu-41; Fri, 25 Jul 2025 06:16:10 +0000
Received: by outflank-mailman (input) for mailman id 1057169;
 Fri, 25 Jul 2025 06:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ufBiy-0007jJ-0q
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:16:08 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2413::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a426ee-691e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 08:16:06 +0200 (CEST)
Received: from MW3PR05CA0020.namprd05.prod.outlook.com (2603:10b6:303:2b::25)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 06:16:02 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:2b:cafe::51) by MW3PR05CA0020.outlook.office365.com
 (2603:10b6:303:2b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 06:16:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 06:16:02 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 01:15:59 -0500
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
X-Inumbo-ID: d8a426ee-691e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkW1rwJhfynHEUlF1QleInnT+lfAKsP9jcCHYoMY72hFfpTM3k4NIAuYRSkR2wEv1/cqFUP3Q6wbrZhRo5x0es/TxEebw294HjnFhm5Dc92MX7P9ZF/UnVjOI/GcbWdfD3pUnC5c4DtWtlBHO0mvlsiLRRgSU9e6xx4fOgE/SphxTT8kgoog6FeyS0K4cd9j2zdEXs/m4KdhhDDC2P4qGARFFtqwKQQ6CKWZFUFu9f6LZEAP6h/sPWWuuUx70adhIFTunioLKJH2p7OpID/eOwaBuhJj717fRn/8xXN+ACgmqbYhCnAM6+s3rRBBAvDij7Zix/a9m2ziFTE25S0t8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEinsSMwxWCPj+3nce9Z/57gNqQWJIZ0utVIOsKX6CY=;
 b=oFMdHLxqAHpRF5UYjp2HJZQhghBXXscYhRQNZRWy6JKRVvURI78NC+UiYPAsS73xNax3A2q9OdI6t4AN6wCqhg/u0NFyvna+dNNVWYZQirkh871OpdCMYYpw0GDWy5G6U0RzMLwCDth2jWxxUGlBI3IQ8EQmhjZf5+xbpMm8TeWiY1GChmaIhBtChj3RxNaIA/imNJtT67sf3MP4u+NxhIlrktsrmUyF7tiS/h492ecomD9eh2efJ0S7QRVoVDW0xhWIu4mwM+vwQklNEWiKdcM3rJjJUUXMSBTCjDAp1kq8x4NesZQqTeHBnlfWUeu3tKFhWV6dTBoLKG2AT46i7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEinsSMwxWCPj+3nce9Z/57gNqQWJIZ0utVIOsKX6CY=;
 b=Sd5iF0CJ57IFfCwxtwfp0G7512Q3nZe9HdGWfq7L3Bo+p5godejUL9cLxrC/n55VexLqt7omi/sUYiJScNf1LZg98j5w3BgBbTV1trimUDtPH2SO4H6rhOeCKP6U7RQfE0EXRYqmGe1cQ/9q+83dj7+vpGyut8dHKJVMc6WEt54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 05/11] xen/platform_op: Wrap around XENPF_efi_runtime_call
Date: Fri, 25 Jul 2025 14:15:24 +0800
Message-ID: <20250725061530.309953-6-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725061530.309953-1-Jiqian.Chen@amd.com>
References: <20250725061530.309953-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 5992d1fe-c9d9-425f-123b-08ddcb42bb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVJLNk1GOGlQWUc5VUVOUEEvaFlkempmWTlheXlFWmdzS1F6N2twS1hyWUEy?=
 =?utf-8?B?ekNrTDJlMWNhZENuVXRaMmtIYUVRd2g3YzZEeVZlN2NnN1pGTWRmQ0RmUDlo?=
 =?utf-8?B?bUpQV1d1ekh5VW9WZFpHc0dJTFJLWjBnK1BGQ1c4WGVUcEVoTldTbFdtYW5n?=
 =?utf-8?B?bHZRdEpxWXRaSGlIanNpZzYvMXV3aDB5dmlhNDRWM29yc00yNU1sbHRIajI1?=
 =?utf-8?B?cDdrdlZkdTlFeGRLQW1iZlZpOElDZTNqUnBDZjlZQ05TSXpLdUlXcUlDWDZF?=
 =?utf-8?B?WHhnc25iZVJ6Q095V2xXbHI1WDlrTm9FcE5uTDEwOUJsbWdXZFJpMnB5cEwy?=
 =?utf-8?B?cUJwWVFrR3cvTXNubFpBaDNxM0FpRWRtODJOQmdick45Q0tDVG1ObkwrRStm?=
 =?utf-8?B?ZnhRcVF5Y3gyK3Jld1JhSEpNV0t0RHVYdGNObFRmanpacFhFbU5seDl1Z3lX?=
 =?utf-8?B?Rmt0YjFqSjFoTGJQaWdyanovNHd3dE1OaGxiRnlIZWcvY2ZMR0gveUtZeVhw?=
 =?utf-8?B?V1hOUHpUdFAxRldFbWxvTXNBUjkrbmN4alBoSmZPUEVBS2hJTGpuYnUyUXU1?=
 =?utf-8?B?cGZFVDZyQy8vY2tlSWcvSThHYzFWNXhBK0Y1c3BTeVNlNHgvZ0RQTWpMakl3?=
 =?utf-8?B?TGxRKzdzL1ZRdUVRVUZPSUs1TzZaTnNlaUc3R3lUdzhkWjJCb29mS0hyRnRh?=
 =?utf-8?B?cmRwWnNmaWlUaUpuWnhYTzhVRzhuekFnVkV3ZC9tWmg4d3ZrSU5QSDN3N1hs?=
 =?utf-8?B?QTByR1NQNTEremczQStNSE14aXl5ZGtpU0xyMWRWN1lPbVpyQUZNc1J5SW0v?=
 =?utf-8?B?TFkwQTNWYnBseHVTNmxvU05vcHQ1aWpJcGhhcXFkWDEzVlMwekRxajhaVUFW?=
 =?utf-8?B?K0hLcE1LSTZrTWYwM3ZVMU5FMm5ZNFhKMDcwdW1uc3R5YTFDa1dmVkpMVy8w?=
 =?utf-8?B?WGJLTHd6TS9YZkRDWDhMQW12RzBwaElRMFNPdldJajF6c0tRTll2aFp3KzVV?=
 =?utf-8?B?cVY5M2RsY3l0TUQ4T25YWTZZNFJCOW4xMWdxbjZ5VjBsZnNaanQ1NFhqRzZy?=
 =?utf-8?B?Z25lS0V1K2VtOUFidXR5Ynd5TXlmZmh4ZTVQZVVRMWF3dGpVaU9WeFdkMmVH?=
 =?utf-8?B?cVZlWWs3TWJPNURqQm9OMFZoaUxteWM4a3ZnQmZKZE0rWitheXF4Zm5UcmRQ?=
 =?utf-8?B?NDNyUW1NUEJwZGZqM2daczVnd04rU1NGMkhsTFMralljb1YxNjhEV0U1a3Nr?=
 =?utf-8?B?RThNMDFBMlc5V1pHRU9NeVQwVGNNNEsxSVRWeHNHZC9LQS9WUGp5cmkxZnNI?=
 =?utf-8?B?TENzZEE3cm8wMElhMk05NDhSWlZXU1ZObk9sc3UvSi9rS2FLNEhaNDRVQlMx?=
 =?utf-8?B?ZzNxdUZHUkJJRTFmLzV5UjVMYUpmelVFZkVvZVRQK3hiZnJYMW1xTDB4Y0Fz?=
 =?utf-8?B?TTVJc1ZoemxuNENuOEFwMlI4RjRPclVpamFlR09mVjdpSysyWGhuT1d5YmRU?=
 =?utf-8?B?ejFMVTRiQ0llY1dTaVdrUmtzNEs4ekQ1c0k5RlpheWZ2ejFyR1YwVUZpS0dH?=
 =?utf-8?B?bW8zaVV6UjY0aTlDajgyL2kxMEI4S2tST0VMRHNqRStlMVZZdFRYZE5sYW1U?=
 =?utf-8?B?Q1NKRVpjWVQ4UHZ5YWRxR2VhWVJmOEl3ZlNnUXNGbjB3TFZkYUlhSlI5RTJE?=
 =?utf-8?B?Q01KY3lwdVZGM3NhZFFseUlkdHZEN0lQQ0NYNnhnS0g5VGRpQjNwVTFPUHp4?=
 =?utf-8?B?VW5tMWFQOWNZaWVRMEpMc0s2TDVxS1BuNHhrOXpwU2QyZFBuV0Z6Q1I4QnFj?=
 =?utf-8?B?bWJUdHNmN0RqeDM1dUpQTGNwbnY5c0UrODBJa2wxY2VqRWFmQlVDWi92ZXUv?=
 =?utf-8?B?dmQ4UDRmQTJwdHFVaG16aTd2amQ0MGtEanljVndSVW5SdE1yUlU3Wlk1UWxj?=
 =?utf-8?B?YXdCK0gyRnVKTUduZFQwSlQ1dGVqdEQ5eHUzMVFhTnFJWG5oYXJNUHZTNXFL?=
 =?utf-8?B?NXQxbDNYeEo5ZVVaY3lwbS9odkh6VmpaUXMxQThpWHdnT2YxcTJSRmoxamti?=
 =?utf-8?Q?UdWzRr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 06:16:02.2312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5992d1fe-c9d9-425f-123b-08ddcb42bb18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385

efi_runtime_call() is only used for XENPF_efi_runtime_call, wrap
it and its compat function and its calling functions:
efi_compat_runtime_call()
gwstrlen()
cast_time()
cast_guid()

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: "Marek Marczykowski-Górecki" <marmarek@invisiblethingslab.com>
cc: Jan Beulich <jbeulich@suse.com>
---
 xen/common/efi/common-stub.c | 4 ++--
 xen/common/efi/compat.c      | 2 +-
 xen/common/efi/runtime.c     | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
index 05a84c60fb70..f3fb9b77d426 100644
--- a/xen/common/efi/common-stub.c
+++ b/xen/common/efi/common-stub.c
@@ -26,21 +26,21 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 {
     return -ENOSYS;
 }
-#endif /* CONFIG_PLATFORM_OP */
 
 int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 {
     return -ENOSYS;
 }
+#endif /* CONFIG_PLATFORM_OP */
 
 #ifdef CONFIG_COMPAT
 
 #ifdef CONFIG_PLATFORM_OP
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
     __attribute__((__alias__("efi_get_info")));
-#endif /* CONFIG_PLATFORM_OP */
 
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
     __attribute__((__alias__("efi_runtime_call")));
+#endif /* CONFIG_PLATFORM_OP */
 
 #endif
diff --git a/xen/common/efi/compat.c b/xen/common/efi/compat.c
index 4f5f59fcac2e..f350958c96b3 100644
--- a/xen/common/efi/compat.c
+++ b/xen/common/efi/compat.c
@@ -4,10 +4,10 @@
 #ifdef CONFIG_PLATFORM_OP
 #define efi_get_info efi_compat_get_info
 #define xenpf_efi_info compat_pf_efi_info
-#endif
 
 #define efi_runtime_call efi_compat_runtime_call
 #define xenpf_efi_runtime_call compat_pf_efi_runtime_call
+#endif
 
 #define xenpf_efi_guid compat_pf_efi_guid
 #define xenpf_efi_time compat_pf_efi_time
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index ab63785397e2..b1f1d677d2cb 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -329,6 +329,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
 }
 #endif /* CONFIG_PLATFORM_OP */
 
+#ifdef CONFIG_PLATFORM_OP
 static long gwstrlen(XEN_GUEST_HANDLE_PARAM(CHAR16) str)
 {
     unsigned long len;
@@ -715,4 +716,5 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 
     return rc;
 }
+#endif /* CONFIG_PLATFORM_OP */
 #endif
-- 
2.34.1


