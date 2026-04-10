Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB3TNUqy2Gk8hAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 10:18:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8B3D3E50
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 10:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278460.1563287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB744-0003ML-4f; Fri, 10 Apr 2026 08:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278460.1563287; Fri, 10 Apr 2026 08:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB744-0003JO-1k; Fri, 10 Apr 2026 08:18:08 +0000
Received: by outflank-mailman (input) for mailman id 1278460;
 Fri, 10 Apr 2026 08:18:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wB742-0003JE-FW
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:18:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB741-00Dg9G-NN
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:18:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8b232-e002-0a2a0a5209dd-0a2a4501ca4a-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:18:05 +0200
Received: from [40.93.195.58]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8b23b-6fc9-0a2a45010019-285dc33a4f97-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:18:04 +0200
Received: from DM6PR02CA0130.namprd02.prod.outlook.com (2603:10b6:5:1b4::32)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Fri, 10 Apr
 2026 08:17:59 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::4f) by DM6PR02CA0130.outlook.office365.com
 (2603:10b6:5:1b4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 08:17:48 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 08:17:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 03:17:57 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 03:17:56 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 10 Apr 2026 03:17:55 -0500
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
 b=UZyBagpZ8thPVtwgfCdsAiLuMqdNpIDpI/Yd+xTykjpfPPPrr4FQObDRdxW41CUoeQvidsp3C8FajlacCJiqP4mDZL/Vq08y6rRDJvHCZru42+Yb2H6dvUirmIDKvjtDL08Kqm28j9HPNnTUV8Gi3orQoNimeaULPYgNfPDppUQ1aBs2vI59ZszXo0ePKy9a4UKQsH7I0bNkX63/KGpQFpT3fpvIyK/kvC4aqP9Q7ppE3nIttAx8dRdGnmDiGqE3LM7mAGb506CwhyKzD5oIHk0AYdL006bbbFL7goB7n4Lu6UogQu72t5B6t4x05cyEgSU1RwjX3hU1WGDXsnyZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ4vFQGsTijPQ8o9EfLIPm34Z4sNLTGNEjmBxusjr9c=;
 b=Hw2XlIsZm4kQteR/IPs3UMnDGF1xGi+LH2XNVFTkBGDRrQUZqFLe0cPSTB9y1wEiEOX/pDcCIsJZFp03ON4OEdQAMGdaRcaNKAGJcU9rEWutjIpUQx1Xr6+13lS4TNxHNrXsX3Jcn6SkKGemUV1QUz93JWYxJRRTPwSctDjRTksIy2Zz3k+iyoAHcOla6UDZMxQnIX0DBiGAQlW4uN0SzAx5i7nP7jNINCu9M+4N/ssDq1R1iAlzibsLExzxDlQvZoRPlfZQwVTCNKSFbIQRvomNnmDOU9DmW3lCKgH3gdsnm6+SKWtQXdwNQgY4dd4xl+3RVbgu/LJPeUrzw5V/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ4vFQGsTijPQ8o9EfLIPm34Z4sNLTGNEjmBxusjr9c=;
 b=i9xFcTE0tZQs62a6iR1oOs/5KqGjQpRExgWOOVqmq753txLeJKCdwJ1NhN5Uh8l2sbTIi9ZuUgJrJYLFkSkAG5ahBwNihCdbTNHnpXccIcvG2zV9xE7wVd18YfxVbNujyFQu2dGACg5mTemfmvjVcFAwKqJk+SF73Gt92dArJIk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <feb0d309-2165-44d3-9241-d7d5b0ba8113@amd.com>
Date: Fri, 10 Apr 2026 10:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: disable Group 1 before CPU power-down
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1952e52fd60fdd762862e74dbd522fcd7c65284a.1775804338.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1952e52fd60fdd762862e74dbd522fcd7c65284a.1775804338.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: edc9df11-769d-4aa3-2b1d-08de96d9ad27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aWElD4cq2XQxH+zUXy+U3Sw2i2Ori+L49VqgUmWtmEtbhUmLWi+q7lbhLTSuPnMITzPxR6N25TnGKyuUjUmnGBExQGNftDBWPeBk8paogoOwEzgQkv8LVZ2HQetCLzskLhaWbTkHrb1EWnl9KEnFN4uljaiqmkwDObfevAS7srA+Q5lcn9w0tEWMd2tgYk3waDM3nmw3achfvVEVtEpGj8BBRDtZKfd+XB6SqGxEjZ8XZfMg7ya5+03nzqi99yeDVY5ISsSSOYOdiIM+jS1q6zOwdxkswgnve84CsXDhjRXLrbe0S3khLkwnNrReSZz3mpkIdIVD6+JSb3pCiwYnZHkzr4N4wY8CwxsAKoRFAk9xjRSBPUWxlQUaew1zCadZ0bi8oav7l4GIX+tI9p1wwPTprGt1iI79tw924r7aUIWI7PyyVHjhir1XKBhmS65SNXpPRi9sIPpjFu9aM5gx1G6A0KShZmLh0rP0Zo12yDnVZuZnt8Gj+wFWabNktGj983Zz5JF2D03ML7kjfy7Orl69FGLCHL6fUAR9wobWmq/IWOZLivschYK5993ALzkXkxPZThicclAE0HtuYNZs+QIf1qBjOcsjB1tmMpYWynTBV9q91CK8mWmJFLUSZKbcN7XgCk17b27qom70E2r9N555wMde7rP96HMkf6pvvzTvHzZ/w6PFt4NxDwNMZFwTFVRUj9RK0S4qQWLDeblfpcgglSa4+b7ORBBYUvkEUbJsrPL5D7gkv2OptVLcfS4DZegMLJEV/9k9kdPwBSozRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Qwx20M8ygfOcDYwjFHKa1ggYIAzl8+5Rn5Tu4dltT8fWt5HgaE/W88UniatfP86TMoSerSShY8m4IIPmfTijZ8K4aEACzQjiJQpm54qCeekudDf1GTDCUW/9Q89YJvpgyJXx214uyIXadM06dNiz5ZVYIoncmmGVbGSPYV6fTjkyMKpfMhDylT3qA+O8XM2/pbr5a+F6FcoKOkRtD2SCF1kogDhugPk2lvabAHdOwiUsro3RWi5fbSJEXw+2iJufjyC1uImtbrbalMhuAxgc3m/z5xJmB1ua7q/29+wgJHOwMa8WQ/9p4PFNwurU/Lg3aQnGXsSW2WKzO4z6OxeI8V1BV4Si5NHUNGgdBJOmmfIU6FHWSYeTOz8zssFgg77v/8lrSPajsBqJqHSTW94EXifGjke05gcNYRK6ssz3BMTqxt4u5/n0CbTUXScaeJt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:17:58.9544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc9df11-769d-4aa3-2b1d-08de96d9ad27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
X-purgate-ID: tlsNG-d62444/1775809085-174FE185-BE0D1C58/0/0
X-purgate-type: clean
X-purgate-size: 1035
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid,epam.com:email]
X-Rspamd-Queue-Id: 48C8B3D3E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 10/04/2026 09:47, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> gicv3_cpu_disable() currently writes 0 to ICC_CTLR_EL1. Unlike
> GICC_CTLR in the GICv2 path, ICC_CTLR_EL1 does not enable or disable
> physical Group 1 interrupt signalling, so this write only clears
> EOImode.
> 
> The GICv3 power management rules require the physical group enables in
> the CPU interface to be cleared before the redistributor is driven into
> ProcessorSleep, otherwise behaviour is UNPREDICTABLE. Xen only enables
> Group 1 interrupts on this path, so disable the interface by clearing
> ICC_IGRPEN1_EL1 instead.
> 
> This appears to be a copy of the GICv2 pattern where the enable control
> lives in CTLR, but for GICv3 the enable moved to ICC_IGRPEN1_EL1.
Yes, GICv2 GICC_CTLR combines enable+EOImode in one register.

> 
> Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


