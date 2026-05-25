Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH9fBxsiFGpjKAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:19:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B515C9300
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319142.1586858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSOQ-0004FZ-O9; Mon, 25 May 2026 10:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319142.1586858; Mon, 25 May 2026 10:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSOQ-0004Ch-LC; Mon, 25 May 2026 10:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1319142;
 Mon, 25 May 2026 10:18:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wRSOO-0004Cb-TV
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 10:18:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRSOO-004BM4-7W
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:18:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1421c9-e002-0a2a0a5209dd-0a2a4505c0ba-46
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:18:39 +0200
Received: from [52.101.53.26]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1421fe-aaa8-0a2a45050019-3465351a901d-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:18:39 +0200
Received: from MN2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:23a::17)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 10:18:34 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::5) by MN2PR03CA0012.outlook.office365.com
 (2603:10b6:208:23a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 10:18:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 10:18:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 05:18:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 05:18:32 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 05:18:31 -0500
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
 b=iMWco5inqDgGGF7zgFQjIViUK5DdsaYU/acGa4LCzjxogZ5ib0DooiqK4xOR1wM7muZbAwrxSXP6EtAIRqK8FJNgoIdRW72cwSVC4/kGrlsBywpJXmeBiGfr/q7jXsn7hZF/6+Y7HjJIEvCH7iB9tMgWhgVPPSGwfy75HPV+VRzY13NyeMaNYNJ/D17VUYvxMQZV1O3V2yZTD+N+0yMjmvZmrWAMkVM6tNlZETOMnEpiUbVOormkjK9/n8E8GawPq5/UA3TRPbsqbHum4zZC9s998mQHzzuQFZrjtvlKvOgaRnKptpCPYZR4Huy5LC+VYoiC9/fZIqTQcoSm0g8aMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1c9lQ3wZ/NaJa5sV0AexiH1fCfTRpsF7NxGI19Zg14=;
 b=V+05kZtYeCY/jKSINUW7cx7mk23Rf5BoX5/wvEFK532Pfrb3JRN97F3ACEBNwZZG6VyAqXYJWROiB9MxNUqoTyuCVhicHN9BBILPJhvTm1PLeB60UYsOGtTR+YVWk2YhuFl3wOwY8W8D+jk5UIQ+qkVhswacZTi1QX9LrT/SCL05rOiMj4gcYuY559RT5wuRyM5MK4YksjppLNSU5cv3yHsy9A4hmBx5SFxTmY6inUarflcZnxKoLkpFpIABTwj7RZSOoTwDanXFmfda2bviGW9SN5IjmNKddG9BGMKggWkDcy8nF3U+QA1JmjKgSZLrmKPCTza3ycWVBU4CYbnfww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1c9lQ3wZ/NaJa5sV0AexiH1fCfTRpsF7NxGI19Zg14=;
 b=QmcPWBkkEhACiRkzt8gnpqxKCJf9nEe2hzsVpoW99EABCT6DEMOiAyE813nXcGl5smQjX6Eqb3DIbwPWjVnC+bdTo6SOxUApiB9xXy7fhLhkymwWrl0btvQh4ROJkK38h0QAmuTS2d6sh0q2kddItIp8cdWj4s7XMmxGbAuu7Cs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f784f8f5-e0b7-424e-82c1-c98cdf070cd3@amd.com>
Date: Mon, 25 May 2026 12:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Preserve ARE_NS when disabling the
 distributor
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Mykola Kvach
	<mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <0bc584018c025ee9fa5557276b9f3914ca9205d4.1779200467.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0bc584018c025ee9fa5557276b9f3914ca9205d4.1779200467.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 1497a9e7-6a61-498e-0f9c-08deba46fa8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	e3MiNPELZCd5klBOeJbuhv7ge3dB8nAQS4RInunSDGRNhTYG9ubqpRxks9a6ZwOgqg7+xrZkwJul3H0ozsPhcjDCOIR56dPPUXYTvBB8qz8waE2+TUg7wGU0wyEai6dV9KkJSPhK0bBiApWJI4bIU/a8NfUFStTIppj1ppLueNGfl3nIs4SDTlSTA55AL3g7M4/TK1lZOzzbIWi+hNKZ5SobnhAJRD91hcy7T7HxCFp0WiuuyYTZ/3Tu5EIgNsAwdfBNkFTuqrLYcDa4wxo73UZfY0yl5gKsW3eRF/TjIRhmJt0Tmemw/ebAyupAdTqv6q/GNDcVAaLwprG7Ktujai/nfT+3gx89Xg4Kk7OuiPsdVrHjuwcGuDjyEP00SRYSR+Gc3ugIAY2iAH9B2kOT+eTv3+nZeFqjvXRCgHvYaYJAZqe16sD5IDOdwNGbPNTxdWOzrO//HcZ0BwjFHG7PI4O0U2QrDpSDF35AXRCdZXByFRb//4rnkAW4U03UvWe4vyvRIwLX/WprPVI4L0VsItLts2cyoYTfQ24guQrpjpXrU6Vt2NuQMiBQsjBXrYxverT2gT4MN63EipRpX/gVL0zQ+/MTuhhAJZ50L6mbM07gJ299CMoqlhVa+KsZJ6Y0OObIHA4t1utQDfzvftQk4pqtmG+x3s0wSr79zxeFZWKBznskEMXwQnmLKUeUaEU1I7Qp1yCheywiLoSeKgWRrZIThZu8kcMTx7vB66OTx/0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hZ9ud70jx2H3AV4ODoNaC20FgJUBmXkAwe15C5JTuUxv1Hjhl5T5LDYuaBJYXVt6/5RLHkW0H9zLwIkzQaAHfacUqyskjAk7oPixElBy5/XxFhDEydozV4HbIYASjr7mNhaO4H/5QrcbsgvPVoNzTxYPHZGzOdbDzVOrQvSuA/l8wBryrGiYDKGhHxwK5aNAVKSlUqTq5QczrVBXH32ecxPRu9JvNAgBfQiljdP69IoratEUallf8g7FfKrSsSZHL69lbnTSWE3L+rMhCMK8ApdshEUJQsCQqKLIe+1KW6+lQFmH+rXqB02BDTVnThbdRa+McWee+XPdYfCatNbucocXfzOO1nen9HVOhgLanolskARVgonnSfInh49BFevKVupmvnjSy1Fl8UvjAfolHABFk3NgTT79ql3hJF+OC7j8LkuSx0OhDaIUsEIVUOYC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 10:18:34.6832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1497a9e7-6a61-498e-0f9c-08deba46fa8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
X-purgate-ID: tlsNG-c201ff/1779704319-E0660443-A860B16C/0/0
X-purgate-type: clean
X-purgate-size: 1036
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:luca.fancellu@arm.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[arm.com,epam.com,kernel.org,xen.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 86B515C9300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 19-May-26 16:31, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> gicv3_dist_init() disables the distributor before reprogramming the
> global interrupt state. It used to do this by writing 0 to GICD_CTLR.
> 
> On a system where firmware has already enabled Non-secure affinity
> routing, a zero write clears the Non-secure view's GICD_CTLR.ARE_NS bit.
> Arm IHI 0069H.b, section 2.3.3 ("Changing affinity routing enables"),
> states that changing GICD_CTLR.ARE_NS from 1 to 0 is UNPREDICTABLE. The
> GICD_CTLR register description in section 12.9.4 carries the same rule
> for the ARE_NS field.
> 
> Preserve ARE_NS while clearing the group enable bits. If firmware left
> ARE_NS clear, the value written is still 0, preserving the existing
> initialization flow.
> 
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

@Oleksii, can we ask for a release ack here?

~Michal


