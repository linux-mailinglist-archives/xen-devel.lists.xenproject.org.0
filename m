Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B30AB0E38
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979888.1366456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgV-0006pV-Qq; Fri, 09 May 2025 09:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979888.1366456; Fri, 09 May 2025 09:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgV-0006fO-Ab; Fri, 09 May 2025 09:06:23 +0000
Received: by outflank-mailman (input) for mailman id 979888;
 Fri, 09 May 2025 09:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgS-0005aH-Sv
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2414::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deaa7858-2cb4-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 11:06:19 +0200 (CEST)
Received: from BYAPR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:c0::35)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 09:06:15 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::10) by BYAPR05CA0022.outlook.office365.com
 (2603:10b6:a03:c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 09:06:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:14 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:12 -0500
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
X-Inumbo-ID: deaa7858-2cb4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh9ZlZWDKHfC9LpTCSW+OPzOb2Q11dOXwdRBlLM+jPI0JLibYy7Su0snmS5BfKUNKPt+eMquqrd+OJaNUYTpHTPJwu7krrLJQO7aX+zGEUQekfJA0Rnem+KwXdY9n+0X6PPyFcxDoDttrgnRdxMiAAL36UwTO7197D97+YRNNmT8STxVi1/xHJQIB4aRRllg63ivRNmRvK+6uXNCu4XAznY+ISnl0lnp2EMk0rHZHsvvIoASCd13aXZlGQf1HCn76Nv+77kR8dNlYA064Pm6UcpRdm0PzaFtN1JUhQcRsUxRRoES5OZ+0RWGOPSNfhP6AFpdi6FAnoMM1U0jQRdZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q/P05OCr3LuuJ/sC5ThFqMV3Dv4cNcqJlZkmAW4d8w=;
 b=CBTvCPuYXStqtB5Vmok/lI0xKSL3OtMwcb5v5CNXxM18Q7VD8qbBXhNl+Fwdl9IDC6wNNKaq0e41g7Otd1qyOyyiT1J4irrNq8q6hlP4EI6wKDoFf3NDGR1WH2WLIDbIJ1Ffzqv/Qyl6PhW5vapU+cSmBKZIsoM41NzAfKVcVfn05+A7Yi+qVUee8IquYQRFyX3sPtpwtuEYhktZhCmQHyhRLfgYPbPS+FSB8/cP21NIxx3DRQ87ixhmEqSYCXIohcIkUrWnIckUg9zsZaY7OFqNjy9Terh0mUpvoo/TyB6KLXwcSh7zNfub0Px7cjiRxoEfMqt34dTRIm6ttHyoJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q/P05OCr3LuuJ/sC5ThFqMV3Dv4cNcqJlZkmAW4d8w=;
 b=fBTa/e2ksRxctYAXnnBbt1v9IlzzPuABgVROkpQwpPxJSR0/KcoUpgyI2Hf6LLp6pU4PEPatlS21uBHzG8hrLgy+0yufdP+Lay4f3u2Br3b/d0jNQRbynguOnjCdRh1SY5fiStpqo8cOMxHBV2ajnIVhCDytVTwSCjxUbFmrB74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi() fails
Date: Fri, 9 May 2025 17:05:41 +0800
Message-ID: <20250509090542.2199676-10-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfc291c-ed67-4f51-54fc-08dd8ed8c06b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnJuV0d2eFQ1U0hUbmNUdUtONHp0QTUzWmRSeWRTUFJESWtVTU96NDVxVGhs?=
 =?utf-8?B?UGJKUVZOVVE1VUhqL0Z0SnJiS2JIVnh2UGxsTTBGTjVvSDZ5eVpGU1kvOUJh?=
 =?utf-8?B?NytPWGxFTVVjU3IzOVVKNnRnQjdWNmZCd1BZcXNLZFRBZUtCQmlyVDMyZEll?=
 =?utf-8?B?RWFrNTY2ZnRnMHdoNUFLQ2dhNW91SmswcGQyakh2SUtZQTFIZHRYMVMrN2o3?=
 =?utf-8?B?Q1JodncyUmVOZ042cmdRNkxwczlvZEZFcEQ5NDlJRkE0WWsvcURLOUE3NHNO?=
 =?utf-8?B?VFJRbDRDbWZYWlhTTmovcGNKNGhncitPSUU4NXVOWkJzZjY1K0xOWGpDclY0?=
 =?utf-8?B?anhFYXBJZU9udnBYdlY1RkJvTHJSSzRwMHVlalQvdTFRcHJsdlVub3NzRngv?=
 =?utf-8?B?U0RnM0NoSGlaNUkvdWQrd2d4cjh4S1N0RTlicHF3OTZEVVd6OUEyaHlTdHJp?=
 =?utf-8?B?TEpQSEpHeTAxc3ZyZUIzczEwMVJEandNNW5rMC9iM2NtV2FGUHhEbDZxV2JT?=
 =?utf-8?B?S1RmYjE4VDBIOGJiUXFxOWVLOXhWRDJjTHZaU1QxSkdWQ0NaRHZFd0lUNVZK?=
 =?utf-8?B?WEd0QlBYc1d0ZXhyeVBJSUF0R1lGRzB3STJJYmxVSkt1OVFTS09jZW9QaXpQ?=
 =?utf-8?B?YWN6MC9RWU13M0ZmT2RxUmMzYWtqUlBNUUhZWmtkUXRnREhpdm1rQ2lzeEgx?=
 =?utf-8?B?R0MrM1NSb2pyT0RkZWh0SkVpNVBnSnlLTFVrSmRYbDBvQnl2NEVBNCtXVitL?=
 =?utf-8?B?ZjZ2bnQ2cW9mV3NOM0pxZlp5YlprRkZ6WGh0UnFXOWo3SkdPNzlHb3VyWExX?=
 =?utf-8?B?Z05GQzNqbDc4cXlkZU9uY1dvUiswZkJBQWdhZXlzUDZORzB4bjJVQ1I3QmZ3?=
 =?utf-8?B?SFMzeE5ZRFdQWE12YXJEbDNscHBNOGh1NjR0QWJGZHh6cTFlS3hobUJCdS85?=
 =?utf-8?B?WFNoc2JlN2ZvVHM0R1Q0NUtzWGU5ZTdJV1FtZVhzZkRER25BSlVtMCt1eitL?=
 =?utf-8?B?WE9tV0s4YVlXMEhtblpVeFdqcWhmNG5UdW1Ca0dxL3dVU1BIbDNmd3pONGFt?=
 =?utf-8?B?U25CRmVRbGcxRXhEemY2UXUzTlRzM1ZuZVNnV0lIS2h4dGI0R3ZKSVBYdzhG?=
 =?utf-8?B?K3pTaXFlY2NnVTJVdkJIVzZGZEEyMEZ5VjhQQlVHZVdwMHhVcUVXUngyU1hK?=
 =?utf-8?B?RmtKZm9HZm9KSDF0VzFvNVY5YW9wNDhNMWgvMlZ3eEw0dWc4WDBPWFhYWW54?=
 =?utf-8?B?bGNJVXBNQmN3UHFJb0t4MFFDcWhBRjdreTVGQzAva2ZWb2w5aCtIaGl0dGJn?=
 =?utf-8?B?TE9XU0JoMTRtUmxHKzVJMzBvVzAyWWgrYzhHL3Ftc01WeCsvVTFFekp2SGpD?=
 =?utf-8?B?Nm4yc2pibW9iWXBtZEl4MjdvMHZTTkRpVzN1aXdQSEtHcU5yZVJkSlhPRHcx?=
 =?utf-8?B?NmxvTzloenk1Yks1M0lvN0UvOUVNSXVJTXg1VExZRVJVTnVmN2ovdzNVY21Q?=
 =?utf-8?B?V29DZlI0dXUxN2M3dGlXMGpUd3RtaUIyYUFaZGdFK25MWVJuazhObmJ4dTlP?=
 =?utf-8?B?ZHpYcUREWHAzZzRGaWhBd1BPYUVZRmVURWZ0WGNJUXAxaWk2cThGQTMwK0ts?=
 =?utf-8?B?WDhzNVdYVURTeE1FNTBSa3l2NDNLcFNVSGJGazhCSGpBa0tSSHhQR1puMHpX?=
 =?utf-8?B?Q0lyYXNCVXJjSzN3ODdvQVg4UWJVZlRGZWwwSGJFaUdZQkVoekFNWUVDanBW?=
 =?utf-8?B?RW9yOVlVcFBUZDJsVkR5OVU3NXNFSlZKMmVSTnpsQ1prdjd4MDRrVEdibXdz?=
 =?utf-8?B?bnR1YkRVTGc2VzVsVUtYamZWMHZ5cElnVFZwVWNrWURycFNFMEN5MmdRMDNp?=
 =?utf-8?B?ZlNwWWVWVGpBb0RabnUvOFBZRUhKMkZDLzhBSUFwRVgvaC9qOTNSZWc4bE56?=
 =?utf-8?B?SzRLSHY2VnBiNnVTL2tnREliaTFsd1diOHJBbUZDS29zbEF2a3ZqUVVjVlNC?=
 =?utf-8?B?WU95VHkrb1NqbjdVcUhDSThLWFg1V2ZxSFVvZWEweFNTa28wclVmZGt2dzFE?=
 =?utf-8?Q?6vk3cb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:14.7440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfc291c-ed67-4f51-54fc-08dd8ed8c06b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527

When init_msi() fails, the previous new changes will hide MSI
capability, it can't rely on vpci_deassign_device() to remove
all MSI related resources anymore, those resources must be
removed in cleanup function of MSI.

To do that, add a new function to free MSI resources.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v3->v4 changes:
* Change function name from fini_msi() to cleanup_msi().
* Remove unnecessary comment.
* Change to use XFREE to free vpci->msi.

v2->v3 changes:
* Remove all fail path, and use fini_msi() hook instead.
* Change the method to calculating the size of msi registers.

v1->v2 changes:
* Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msi.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index ea7dc0c060ea..306da49bd3ec 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -193,6 +193,26 @@ static void cf_check mask_write(
     msi->mask = val;
 }
 
+static void cleanup_msi(struct pci_dev *pdev)
+{
+    unsigned int end, size;
+    struct vpci *vpci = pdev->vpci;
+    const unsigned int msi_pos = pdev->msi_pos;
+
+    if ( !msi_pos || !vpci->msi )
+        return;
+
+    if ( vpci->msi->masking )
+        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
+    else
+        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
+
+    size = end - msi_control_reg(msi_pos);
+
+    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
+    XFREE(vpci->msi);
+}
+
 static int cf_check init_msi(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msi_pos;
@@ -270,7 +290,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
 
     return 0;
 }
-REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, NULL);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, cleanup_msi);
 
 void vpci_dump_msi(void)
 {
-- 
2.34.1


