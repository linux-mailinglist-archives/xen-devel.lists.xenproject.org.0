Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL4LMEDYg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BCDED4EE
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221253.1529532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR6-0002Cj-CB; Wed, 04 Feb 2026 23:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221253.1529532; Wed, 04 Feb 2026 23:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR6-0002Ab-7E; Wed, 04 Feb 2026 23:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1221253;
 Wed, 04 Feb 2026 23:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gU/K=AI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnmR4-0001zb-FD
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:37:26 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7537a689-0222-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 00:37:24 +0100 (CET)
Received: from PH8PR07CA0033.namprd07.prod.outlook.com (2603:10b6:510:2cf::20)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 23:37:20 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::ac) by PH8PR07CA0033.outlook.office365.com
 (2603:10b6:510:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 23:37:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 23:37:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:19 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:19 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 17:37:18 -0600
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
X-Inumbo-ID: 7537a689-0222-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FliW+oRrlzbj5N4k8TI8NvCkYQvyXTYhokJtgDDR5kzCWfHKAdYMjOhf6aUGznN3yfslFcVIdFVKuIAv0EzGwc1a7JSa4Ki68rlfZSQqkYiKCRikkR5Oh5KU8Nq3Ve0B+4TGiCwAZmTn4gOUI51QZ1iZvQdxwur25aXiovx+HKup4I0kjRhYmrKS720n92d14KuwPPIERfHFp0ucqbRVerBLZ14UWn7vmLlN2P3fgjBS2+jAepD6Sqe22uxm6iTMe9qCuLwHCN1wbwRch0HVPW2udpnmpzu2FjS82kZED9MBtbadgWOTIZx5n5OPAHa7A1390KYe/m1TRSn151Xc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YQTbuJVfM0sef3zdqjvdf8PT/yiTIdcCgsVM88URmI=;
 b=psa3Xm6kzFK/dlH+RcXG6s18ZyO8Fu+Ql7IVcOhxXqZWhUA2N5PHufdsXVoGDSepSOcCxKn5Hy5gToB2XkBedoqVddlO7ViEPxa07tfzYPCXrYrpCaNkvhG7yLz2BxOCyz8vEOiAAf2PFWEKn5xiHNhG83C4xCjMZDmSHAa/PP9QW55pcHA/G6Dl+JKoziM3Fn8muSPmJslXonoRm+XQYziunVf6jGFuxQ3+5sbOBrg8AAPBq1xOKIEwH0dKl9zkSW7cqV3g5Ky6X/W1IOlYzPLMBuFGTwzpiIUfM+ZfHL/c9OeoyeM5WgFD8dBAJeNzUuuWuuwhmyfdggEBX0y0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YQTbuJVfM0sef3zdqjvdf8PT/yiTIdcCgsVM88URmI=;
 b=w0NDRwwhvfCXdxdnF983Yc4SDGnR6TCDK4JV75QciuNGa7QWJV24X/O2NGNX8ADJ+b7HjV858H8QHBCQn0rcrWs1l1ILrL2nfdADSbPnTK5a/y6kFloFaCO3OHTU4bJfj3W2lb2N9SV8vNMgx2ZofryNcaEr/UDeugS1l0OPGqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v10 5/5] xen: enable dom0less guests to use console_io hypercalls
Date: Wed, 4 Feb 2026 15:37:12 -0800
Message-ID: <20260204233712.3396752-5-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 667219e7-6117-4efd-f2a6-08de644656d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6p1lYikMgf5hL9z7dgBMfC+myq5P4Sot3oLo6ykKNe+wYL5YB66Dc2X5WA0a?=
 =?us-ascii?Q?BSFOF58WVI4jTMWdfcztc2GeTqLfy7dt5DrbH7ZzzzNzBRqBN7dPEp/NFAUT?=
 =?us-ascii?Q?JrVOyUKBgvWb9D9i1ZjvH3XRRyYf7T7u9m8BgHpVwK9S0//1Y2dVlgtbhgP6?=
 =?us-ascii?Q?/2WOZX+lawy7rckBCaookGNv8nKAnfoJlZswAnipaU/mhdEZNgTuONThsP1d?=
 =?us-ascii?Q?Q9Um40g5S2uXiCqNlqrt3H2dUebopt2zbAnVUktUU6+JZgQFjvNuFh+3g+gy?=
 =?us-ascii?Q?qZDKaxAwZ98ilDcPbaFPV1JWfGtHrb/M6OyawCFIzTAHF6ArqtGIaQ2qZgk5?=
 =?us-ascii?Q?rV8B1YuKfLexJjWJi9axLtWdnx3WfKt2hUH+e5Vk17iKnNd2ftDMUNyY14a5?=
 =?us-ascii?Q?zdzth3cgVk+++HuadaAVZXPtMEQIzupAe++iznMoI0a73VkqCbiAb5PDsBqV?=
 =?us-ascii?Q?+86v83V2Kb1XSkestyW6uWz4VbxFJP4y4LVIn4dQzp8HSzME8HQuIFcMZurd?=
 =?us-ascii?Q?7yKH2hccFDx4bAs+ZIgvSBMmgaS8gH2yqEZDqWUDkVYRPttj/+Ew117W/EM9?=
 =?us-ascii?Q?R5+nv9ttJV9U0MMQ3cX0k1AtaoluaFowcg9cwMoQhlcRMFrj5rYipuxYacGQ?=
 =?us-ascii?Q?GGHsMFM1S+nem4PEwAA9I4WNlmL6gK2GvWrqe3HeUt502lIHAoHMbHu3REiX?=
 =?us-ascii?Q?nYCrWL1QxzFCoZOZpRYwWC21plXMGrzsK+JeWYyB+EHE9PkdzyFtYfmFjGcN?=
 =?us-ascii?Q?uS0Fgi3gDlD5QlxiWDm969RO0YHiNYd1wXynbUOAMrfxKnBZietafSYnuQyE?=
 =?us-ascii?Q?cLwMwgQWnRR3axGbRJU4shdLmiyJk8jnuD6x6icsuT+QEZKu+hSxBJgjQ94c?=
 =?us-ascii?Q?2li29e7ablxpL3jYRfuMwMUOymdabEQYusAEHXEK8SIIKENpiXJOjhdkBZ7z?=
 =?us-ascii?Q?IGNeTQtbNygSRnX/g22GQteXu0Q2VObJIV/FlbmoRZp7DFPlZkyQd7solmuO?=
 =?us-ascii?Q?/V5lIuuKlfZ2VDnd7r/9NHOD3Xz8RrP8/k0X6YOk6oC3uQLG+S/TXWSxPI+H?=
 =?us-ascii?Q?rFYVJSufDEmH9y9N7ZagX8UApc+6vRWpQg+qbP2jIik1nRFKvYeuWUdUdx9A?=
 =?us-ascii?Q?9MUvfQjGisdKsJUd9f7VyqWv9LAEwDKqAKyJUe8Z8XLjZLOMcmixYcK8tUWt?=
 =?us-ascii?Q?7NlI/wf+WE4eB4nxglPWA3eFMbC/KiRCB7bn/7XsHsdap7pyrPo+rUfvGSIF?=
 =?us-ascii?Q?4S4DmZ9emiwZMboQr3aXzx2zXLVLyyYWe1rC4tpNrO8xgKluftzJUi5cdlpd?=
 =?us-ascii?Q?Yc1Q3vVBncVk5VvUzvy88Jcs/AdDNr/HhyVoddGaYScG4y3mXrOn+giPVNNe?=
 =?us-ascii?Q?ZWpAd12jj8yZmtUQPOn7D57b3Mwrsm5yeFElbG7tc+WEJGZkHrbRaYyapVz/?=
 =?us-ascii?Q?7MhkJiOmp8vjnsKBTqoKtdZ5K/VWeRKrZdpLl69Y2CnpVNgQCcHtgkN3Q5bT?=
 =?us-ascii?Q?bvYRYWgiV06i3o/JUQiELWGoolAw09ppCL0oN8p+MSy1vzlN7UmbYyncrSFA?=
 =?us-ascii?Q?Hcld6riFhuLUaKnmsirTsDe9NEc/UjdpS4nqr1L52ytPTyOHXc3g7/ubdVBd?=
 =?us-ascii?Q?+v0ABE0EtqznOV0d7pPHsjg+JlU5qzWA29CiyjswKdvyqcDtjs5eX1ykrwqt?=
 =?us-ascii?Q?IGwiAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2+9wX8DY0f821lFtAN/xmgdaGhpypnAMB3xYzY6ymyNll4kod+/6hdlsGkKLt5mYj0tcH6PWP6U0boxa8oi5ktHcjiq0v+b4ggk/xbfSM4WNBMAQZU+eioBFQIkAZrpJ/Y682DT/lg9Yx+d0Bj6xsXu1PC/SLjCI/8EYlpop8ZuLWCzXoMKjCbCYr/rmagKj/RD3w4iI0YUAmbvbCkAMTXl4XbJrGztpvyC9HLvqvQQBuFYBltFou5HLXpi1uI0RbfrPuCV/axbRxs9T7TzRKrS633r/cVTG9mhIDsBJ0+qsri/OMHMn4gJ1kcqYCl+uO/IB6v7LZCagsJFfc8Cu2HoLWrlp6uS3YGfjeOSpq8MknszIQoZXzM45P+CZSUruAEAmOuW44WyjJ7okiy9QwZJDeiDvPiuhrgy3fA43UidDyYI/lJIOrppMUSPC3Qrw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:37:19.9609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667219e7-6117-4efd-f2a6-08de644656d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 74BCDED4EE
X-Rspamd-Action: no action

Enable dom0less guests on ARM to use console_io hypercalls:
- set input_allow = true for dom0less domains
- update the in-code comment in console.c
- prioritize the VUART check to retain the same behavior as today

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/device-tree/dom0less-build.c |  2 ++
 xen/drivers/char/console.c              | 16 ++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419d..cb7026fa7e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
 
     rangeset_destroy(kinfo->xen_reg_assigned);
 
+    d->console->input_allowed = true;
+
     return rc;
 }
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d3ce925131..7f0c3d8376 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -610,11 +610,20 @@ static void __serial_rx(char c)
     if ( ACCESS_ONCE(console_rx) == 0 )
         return handle_keypress(c, false);
 
+    /* Includes an is_focus_domain() check. */
     d = console_get_domain();
     if ( !d )
         return;
 
-    if ( is_hardware_domain(d) )
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+    /* Prioritize vpl011 if enabled for this domain */
+    if ( d->arch.vpl011.base_addr )
+    {
+        /* Deliver input to the emulated UART. */
+        rc = vpl011_rx_char_xen(d, c);
+    }
+    else
+#endif
     {
         unsigned long flags;
 
@@ -633,11 +642,6 @@ static void __serial_rx(char c)
          */
         send_guest_domain_virq(d, VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    else
-        /* Deliver input to the emulated UART. */
-        rc = vpl011_rx_char_xen(d, c);
-#endif
 
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
-- 
2.25.1


