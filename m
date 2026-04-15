Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ErcIJt432nFTgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BC403E92
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 13:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282280.1564907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYe-0002dn-Mb; Wed, 15 Apr 2026 11:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282280.1564907; Wed, 15 Apr 2026 11:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCyYe-0002d9-Ht; Wed, 15 Apr 2026 11:37:24 +0000
Received: by outflank-mailman (input) for mailman id 1282280;
 Wed, 15 Apr 2026 11:37:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCyYd-0002Zz-9z
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:37:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyYb-00AKCb-4s
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:37:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df786b-bab6-0a2a0a5309dd-0a2a450ba234-30
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:22 +0200
Received: from [52.101.193.47]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69df7870-bca8-0a2a450b0019-3465c12f572e-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:37:22 +0200
Received: from BL1PR13CA0167.namprd13.prod.outlook.com (2603:10b6:208:2bd::22)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 11:37:17 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2bd:cafe::2c) by BL1PR13CA0167.outlook.office365.com
 (2603:10b6:208:2bd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 11:37:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 11:37:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 06:37:16 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 15 Apr 2026 06:37:14 -0500
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
 b=YujAX0BwNy/b/M33ko7MdpwKKg7RfYPFyALesCI+WGWFDXMSQ6h2wtpSCmuZMq+UClCqvT28aLYW0835zEH2CxZoXLfDYJHac0JveY7AYO7oSBR+uZWE6oFcviBIyByJYXN3Ofld6r++W3R+xddvrfsyIiWpmWTFl3mP+0cvUhuvmpakQuouVGpCUtuUVK5Su8SbFiN0fmfgOw/zucy7sNLT7+6hR4L/PKHOXuK9ov3mB6nQId2w0dMVyBU+C2X1h9zV/Bo5oA9maBDB+ZenkNJ0IFli+c9zwi8/PLFj8z4yMzG4JH6HrwoHDpK3yiK47U0NoHMnvHsN7sdIisc2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QvN1netQKCnwaqY6XX9r+J1KJJsy3StwsOiX7PZDs4=;
 b=h2scQRRc6ycB7EIUbOJVEhsiuhUPkyWmy5Ar5hqYD+BibRv5UH/+LIKwAs8XnWJyvH9q6pq6E9ZbSPk9m/6MMDjDXvt7hXzy0OPJ44rg4zkKZQpO9w9En4gxf8jOZjOB/YrGpQIjHvqlX08AjD4mKyacS4rswmZY2KjKulsoRhwwm9NBnBg9m9ISbTEoiMlqeYgUJopNroSyXiSPNntHtmYaFLhOaDnzztHc7bFn/IX9NcMJHYTjWaP8DOzl3BhVN+przPilphLJe887HnKODEUX5GGfkQl8+sk+yGaMrgVKZ2LnL3y8Q3YMHGGaou52M8DSvJB0f1ME6hAdSPZd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QvN1netQKCnwaqY6XX9r+J1KJJsy3StwsOiX7PZDs4=;
 b=b40bMIPFlziQ5yY7pjU0U/nhqNmHxj7p6P7gR+47mXmAhnGNGYTlp8SMgiv2W0dKwY5M0VejZY7U4PX0gwZRyhlz+4sq60Z4HlH6bmZJIeZoMUVzbXQXpxcZuZj0dHY8dY3hA5fwsKtGuo8rY5dpJyhST1aGs6K/zRAPjrmS75E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH 3/6] xen/dt-overlay: check overlay size before memcmp in tracker lookup
Date: Wed, 15 Apr 2026 13:36:57 +0200
Message-ID: <20260415113700.107915-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415113700.107915-1-michal.orzel@amd.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e08bb71-4749-40c6-8bf5-08de9ae35888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5J1FTqiYgIe85Uz/iM5sFxRhAngSZcnXPmnfB8VaZZkClCuWrMTY2Ti6GmZZ9/3PwO8k4ngYoogv2hhnZHt55+ikWo41nwwN0lKssrIwDEHjfV9pc0fnYs5xCVM6DTYV1O7ZczrQDJm5KLpfERb9I0/MQDGwCkWow2yV0X9sewYOFlAKIzKf6+rxRRaS+od1FsJr6lFpTEahlI4ssmBBmOSIW43tJQ3JX+gwB2XQ/yTLhgZWgCSteqJr2TvZaDgzLWpn4ub6I/X+tblvhW79Udkq3RQUZw3LvSc9cV0x3ROUdo2Zx5riP4wQNxmWkS29FSneXs92ioCadA7gUsqBJg0sWZgEe34Nys8BGWpWOh9z16yVemgZj4yIyvlxJckFHmWJb4dkatVWKGntPgO0Qqs1wwa9S+n20UUoGsGjCUsHkoRyZN4rpd0A0AnoMRa04NluIMG3pcVqA2ScdKdrX0zn/nimDZeulY+PZH2N2PGhciq2mmf6PH8ZONu0TtDhaZZZ0ZJ4qC6iG31Lhqy/9IW6Me/naiWE2AJVcSj6Ptf3sMT3ESokkENTh10zNXfaC1NVGC0/mYC9ebqt6bj2fJchYnxHhmsiJIeln7l6Bs1BQe2DxUHkr+K1zTMsNL69bVntcR87HKsLk0j7DWQ63IrePYRgPaQdcAm9iaSXvOYYy5ahVsn7qWTFXHp/vnS56lUxmGd6GrovacjYeL+AH5QQXehqndDtV+/CzzTugE2JYqPAxQi9Ko9qhSR46sAyrutyc5XHN81zXyDbpkcyrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3NFScCTnfYFbtInc0Xoq+d2u9i0CcUEh84lJKepY1OMh143NiKsehrpy4A2pkvLesKFVH2MRFehBe31sXfRoPBZhZrivy66xexfw7Y1MJdc+o/Y3csqiNcPeVEdh9KfWRNTAOar7T5OYgjtVTqdEAWp1LCJOwWhDNugMnfmt6gIbL1Y5eWatrSAMZaU2qJaXEv/DMafOg8063v1Hau0UI31ZkjVcpicj1oIp3QleZa1AjPo331hiRA00IpFkaS+oCGCK+wksCYSIi4uj6abMFicxuKqHBRtELyXcuRLLu1jlji+3l1X8Vug/KL2ZW2LUbyOEJe9IacnvCD+EyAABUopq6dzMXy1tu+eoFGnO61EUOAAW7NR4SuQWPBX052YoWuArPSjCBsRksKXzg+actuJl8Q4ybUO+VqT1LHqjUVG7QVJoiaDETKZZY3WoYo/F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 11:37:16.6342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e08bb71-4749-40c6-8bf5-08de9ae35888
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306
X-purgate-ID: tlsNG-42698a/1776253042-EF34C2A1-5705A061/0/0
X-purgate-type: clean
X-purgate-size: 1441
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 236BC403E92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

find_track_entry_from_tracker() compares overlay_fdt_size bytes of the
stored overlay against the input without verifying that the stored
overlay is at least that large. If the input is larger, memcmp reads
past the stored allocation. If smaller, a prefix match could falsely
succeed.

Compare fdt_totalsize() of the stored overlay against overlay_fdt_size
first. Both values are validated by check_overlay_fdt() at their
respective entry points, so no additional field in overlay_track is
needed.

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/dt-overlay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 3853e6e347fe..0eed1532a10d 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -379,7 +379,8 @@ find_track_entry_from_tracker(const void *overlay_fdt,
      */
     list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
     {
-        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
+        if ( (fdt_totalsize(entry->overlay_fdt) == overlay_fdt_size) &&
+             !memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) )
         {
             found_entry = true;
             break;
-- 
2.43.0


