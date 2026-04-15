Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f6KpEpZ432nFTgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:37:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E32403E77
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282279.1564893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYc-0002IL-En; Wed, 15 Apr 2026 11:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282279.1564893; Wed, 15 Apr 2026 11:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYc-0002FB-Bt; Wed, 15 Apr 2026 11:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1282279;
 Wed, 15 Apr 2026 11:37:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYa-0002Cp-C8
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYY-00AKCO-77
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786c-2eae-0a2a0a5409dd-0a2a4502cab0-16
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:19 +0200
Received: from [52.101.52.4]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786d-42fa-0a2a45020019-346534042a1c-4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:19 +0200
Received: from BYAPR02CA0068.namprd02.prod.outlook.com (2603:10b6:a03:54::45)
 by CH3PR12MB9729.namprd12.prod.outlook.com (2603:10b6:610:253::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 11:37:14 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::42) by BYAPR02CA0068.outlook.office365.com
 (2603:10b6:a03:54::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 11:37:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:12 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:11 -0500
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
 b=kfYRO1QDCIAK590ECS1om9S1rrzkEjLTM8KKSsIzns9qKslHklP8Sb2QI0yJa2d99a5IHhIooB7OudHmRKyH5JOMa3j4SBNHpzERziuvb2Cdq4ayLT6akMXowpjhFZAs+/X9UD5BEq9+kz/8EyP+ZHCNz0sNyZo/3/XXyaZNRWWddZd7TwjGFNP3L5KdMNWTNq0hPs/kSox6K05RdVWGIHXjwW3OTFEUMcR+I0vzi6ozlhfcdo1CyqLksHknl4YGSDiIFJXahEqxe7Eiqfef8iIuRpduk2XnxbjtvznM6CzH7FgWVYqsYPacvfh5ekG2dEVqmJUoEfTQzPTQgdt5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcZupUjCihrhH4fumGKyczgJktfm1ndcrphTiFO0/vw=;
 b=TN1btHVWbTXJ1+HDdQAds2PAafw5JW+MCYc/ACQpFx7Ga8W+3/QX3tBYzPTO8vPX5IZSrMOcMo2Y6y8RD49haW6ImrYj9VwKZP58qVNtCB9yfamHlNCEU4BdIN+AupzfEBl3Z+hbw6fbMkfoRSiMdKHRCPaM5JIVkWm0Rp8kyr8k422C9VsXqruJQ7ZD3B9qzphTsT0OLnStIr2XAyZwqYohYRxgyX0IxXXUbb+F++i1eqXYFphtRquBFUHPD/rHzTg0K/BJzdiYp4y0z/m5eJoNfGRpvtbZb1XvWhGqzzw9sOo1e0WzrlLzVZYiPcgx2nrMcs96h2JQkb66kREnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcZupUjCihrhH4fumGKyczgJktfm1ndcrphTiFO0/vw=;
 b=uyGGa5fOADXzEn8OZWcudjuuIBd3hc72vx5piG7laL4bkxiUIJQSciwRe9U+hPRxe3L1xczBYPqiKYq0ETJ93y7n4N2nGJeGNNOPcJOwMLg/aUer4AXiGAhpBFo5F7m4FfhIVvmgJJbQh/76X7OLIO2r2tj67z4sCHIJrjdyhkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Gyujeong Jin <wlsrbwjd7232@gmail.com>
Subject: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on attach failure
Date: Wed, 15 Apr 2026 13:36:55 +0200
Message-ID: <20260415113700.107915-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415113700.107915-1-michal.orzel@amd.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|CH3PR12MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: d43d5f58-3a0a-4e4d-6356-08de9ae35720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e0Qmfy7XBtb55aK1MYyjv28/DhSrp7BdXWuiQLsgObXzRVhieKaooicCfWCH6b02gZoHzdoJa5p8BizCf5sIgiGHiq6RmyRsLfcRvn7V5SoBu/6TIXPXDUpun5SZ89Qs6lVr3eYy95P+Ci5GqdoBV3E71oU0bILLbs9YPrdSBKiokdn+/8o/s6S5mHlWoH4mgi7XFBmhRhQYrSoYODXbjWdawtk7oA0culZIpOOb6ifoG2PjU1jhYamUvJ+y7nWL8hE/vjqXUHzjertf+MVQi4pbJeQj9mbnIQytQG2XuY4a1dpOZ+8N1P31kK2H9i251i3pmvuVciPokaA619E6cw1s+FKXtTnnKY0YOxJYponsKb3EzDkb1fCPs2Xpv5tmP7YliV8bKglezxuOfDRgdeIReq0zEB9u10c3YPFwKoVKjztKm5FezJxhpRTGVScLwtcV/O9eZNxUtA6Nyky8gijB0X4QAwmnM9iGSb9BFohvHrBl8hVuJtQJ2VoMrjLfi2VriuqFkMymbIL5UlARPkA2baLw/ebUesUkr1DadamK/JmR8Tyw3f9KnQRj/oWS4eYVek+KNrmBOzojEe3vyGiPO4LjgIa5qgOJFkOEzGdMpjrUNlrw4tjij4xWcKXxYmtJO+pEJvph1zS8ObA8GiDlvj0kUzDr2pPlH1vCt3HF12pgN3ywCmsLb7+7HSBozMPSlPmCCIxXvRQNaAoyNPexVqKXRgMG2g8BvlpU+rC1AB625i/9xI3gfnrvqYttV3r3OpnNpdgk+2ewWdnHaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j4s5c15RwMLaov4Zih+EK8Tk4j9X7FaD0DvzjhBHNil6PtDDet+4On0iaDeWIBO5InI44jVzBByASb6u6cpQImoW7lAjy6HrmW+d6ICcLSy9FMJCE1LeOvPPCce6bUNK5DlcSIb16GFbEAZzOZIrjsmHcmOzBKIlEXDqfsVN4dNHGdm5cx0IMrRYWNiB5Ir0HBnqBbciOisuIIHfVQqpBcyDfdGe9ku+B4fQgD6JGjpDIeLN8FBcX0NMohu6E1GSuQklJH7sfODkOacjwawnAnxQwNcTCKF4rSINPhMjoZFtl+eMWue7Pn+G5+09UttVU2cUgFOLKw2RIgMZxosqfbVjxmsb8pgiJGPZWmYZ5ghdSLeSIxmiYI3EtF/oMofZjXElrXONQ1gJ37FaqFJP/1et9Fe7hRjD1t52Ucud30hyJ2bQhU4EeFgwlL5S0pH9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:14.2084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43d5f58-3a0a-4e4d-6356-08de9ae35720
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9729
X-purgate-ID: tlsNG-720697/1776253039-AD93ECD1-EE44A305/0/0
X-purgate-type: clean
X-purgate-size: 1287
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xen.org,arm.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:wlsrbwjd7232@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 90E32403E77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

handle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on
failure but leaves the pointers dangling in the tracker entry. A
subsequent handle_remove_overlay_nodes() for the same overlay will call
rangeset_consume_ranges() on freed memory followed by a second
rangeset_destroy(), resulting in use-after-free and double-free.

NULL the pointers after rangeset_destroy() so that remove_nodes() and
handle_remove_overlay_nodes() skip the stale entries.

Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/dt-overlay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index d184186c015e..6fa07dbf42a5 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -910,7 +910,9 @@ static long handle_attach_overlay_nodes(struct domain *d,
     if ( entry )
     {
         rangeset_destroy(entry->irq_ranges);
+        entry->irq_ranges = NULL;
         rangeset_destroy(entry->iomem_ranges);
+        entry->iomem_ranges = NULL;
     }
 
     return rc;
-- 
2.43.0


