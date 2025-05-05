Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5DAAA9216
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 13:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976043.1363293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBu4B-0002AI-1v; Mon, 05 May 2025 11:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976043.1363293; Mon, 05 May 2025 11:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBu4A-00028p-VK; Mon, 05 May 2025 11:32:58 +0000
Received: by outflank-mailman (input) for mailman id 976043;
 Mon, 05 May 2025 11:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fnx5=XV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uBu4A-00028e-2m
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 11:32:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2408::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af68c32a-29a4-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 13:32:55 +0200 (CEST)
Received: from SA0PR11CA0084.namprd11.prod.outlook.com (2603:10b6:806:d2::29)
 by SN7PR12MB7419.namprd12.prod.outlook.com (2603:10b6:806:2a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 11:32:51 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:d2:cafe::22) by SA0PR11CA0084.outlook.office365.com
 (2603:10b6:806:d2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Mon,
 5 May 2025 11:32:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 11:32:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 06:32:49 -0500
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
X-Inumbo-ID: af68c32a-29a4-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T//xABOGXvC0fEhwDWeUwgh/aKDLETJ2xTtn4CKIY7InKZE0/e+huu3koIJLA4CTLpvuguuzxTE8vsEk9N1FhdYzODxv2nyxDKH1V8H5fOoYqhGwMcyhvrCAYDIHDL5Ks5CQLiOUqLxqHjBZu3uqntG37snuNSdtMkKNboRmeTeZzv4O4upop5ovJ3VlaW3dBVhm9dKysHwuUc3y6LEKNRYDB4e4HlAYvRKiN2L5aKFBqtqppmV3g4Fo2hBZ6LigOObMLRfvJ1bqdR/Sz4GJubuKcGmKO+BTaoQ6TdaHKwsx17H9zTgdxDUjbuPRLg5oCYOx8iz09zIZLn6DJpl4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co2k8Dvcv0C0IMqeGm4Y4i8zTo2rRA74FE65agiEEbY=;
 b=Vdc6ls4WK86Gg1oaLRN0qfuvlZzAF0KChoyo/9vCISpcggM8IE1PLN77hXS81xung3ZhaTwxCuW99CwBtALqUbiENgeGyMjfUspruZojuUWdUo/ZlnL2rONlgXeNEZrCQxngm3iocwh77RgInopwXjC2Xh/i8uWLd/YfLBMMEIeGBbpBCoMpTl3+Aer6EH4VwmVV9u//hXORWvfNKV5ULTCOIyRFGlq9uHOaiIlOb04Xnrx8QPx7ZH2sp0g1PQTyMvUwH0anU+NHw75BRNsIONTQjIkeOpUXnHzXdDURgfZ2SX6LpyKOGelJfPnLlyNzhxYR/w9nHzEzEpFhe9Cjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co2k8Dvcv0C0IMqeGm4Y4i8zTo2rRA74FE65agiEEbY=;
 b=Jmc6VCmL6Ht5pt7sk7cJYEeWYI+LnfZmcdsAHlX6l6wk38qOmsSZg/u95CHL/NbxK0iRx21c5c1zl0NEZEwq3L6K8J6KzWd3X1w0Fw+cBcGj42blt7VttFdPCmCi/1NTbjS+4RQwzCyrXaPuD7J49uE7HuOsLyoL7gx42zsJFKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 5 May 2025 13:32:47 +0200
Message-ID: <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
Subject: Re: Mapping memory into a domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
In-Reply-To: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|SN7PR12MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: d79466fd-5cb9-46cc-b2bf-08dd8bc891b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dktLWlR1b1NSVXNHNUZHWWRzN282cytnVlV2alpqWHJZdFlzOUw3OVZTTUlw?=
 =?utf-8?B?TEs3RklxZUxIZmZFelE0c3ZmQ0VxRVArUkV6VU9lVnQ4bGpxcmMrcTNXZGxR?=
 =?utf-8?B?cUZrMXJhc3c2Vi9LaVJ3bW0xU0d0RUI4QlphVjJzcnJwNEZ4eG5yeVYzQmpU?=
 =?utf-8?B?bGlleGNXaDh1eEsrUGRQdWZRNVBUWUFhYlAvelNzaC9UZmRZTjhJaytUNHlX?=
 =?utf-8?B?WEpzNXZXSHR0UkJicDhXbjNsTVQ4ZkttV3QvWWN0MXRjdGVmUGtxa0dmY3pP?=
 =?utf-8?B?OTdFdHR6NjlUMW5QVnhQbUViYk5MTEsvNVF4K2I2MUhoVjR5TXBzVFJqWVA5?=
 =?utf-8?B?M3ZnRTUyUTZQNDBuNUJCUTk3Y3ZuT2htbm1CNU9ZZyszb0RHeHNkMmlTU0hD?=
 =?utf-8?B?UW9pTFZsRHpkbXU5MmVxd0pqbHBUd292c3V3V1JiaUpBT2o5WFdSTlV3cUdR?=
 =?utf-8?B?TE5QWlVacGdWK3pGT1huRm53elp2TFFKejd6MlNSZ1VUMGtLUXRvblI3T1dO?=
 =?utf-8?B?RnBwL0xYbzFFSDFGWk0xQ3lOYmtWb3g2QXpzN2JUM0NieHhla0Jkck04NFBV?=
 =?utf-8?B?ZjcwSkVJdmNwMzYxSHhyT3ZrczdXU1NabXFMWlR2NDRDLzdZcUZ5UmY4SU1Y?=
 =?utf-8?B?d0wzOE9nYVY3UUxsT1NhSXB1aWtmcnQrVVpiV2dIay9WT3dWa00wVjhoK2Rj?=
 =?utf-8?B?Wmc3SkFuT0V3dEJmTHorV0VXV0xYdVlNVmw1Q085UUg0R1RWQy9iRFVHSGUy?=
 =?utf-8?B?Rk5wSHl0ckhHUGc3OG5RT1dweGMyRFg0YmYxdnMxMW95M054QTFHa1pjVkxj?=
 =?utf-8?B?YU0vekhRbG95N0hVaVFkV1lwMVcxQ0gxN3dXRGs0V1ZrdzhxZEJOMHRjY3c3?=
 =?utf-8?B?YW1qMS8zc25CeUZXQjBYZzNzL1hMUFFqbFNvUXMyOTAwWHBsemsxaTVyT2JQ?=
 =?utf-8?B?MW1jai83RGE1Z01LZmVYYjl2eFRVYkUxZ2lhakhTZW10dlZtb211aURWWG5J?=
 =?utf-8?B?U0g2V21OWFRZOTl1aXJrZWsySnJiclc3ZDZwL2VEZnkxaTc1R041VWU4TTlZ?=
 =?utf-8?B?L1dGOS9LTER5dGRGL3dhemhmRUtqejA3UGY4cDIwbkJXTjRUbUZycUkrK3NL?=
 =?utf-8?B?U0dEeCtjSjVrYnNDaEJZazdNaHdzZlhSRHBQUWpQUVdiQTh5OG9Nc2hvQTNu?=
 =?utf-8?B?WnUwMEI2QlRGcHh0YlRuVWswSXpWMW1RV2p5NXpyMTFrcTYxWnozc0ZiZWRS?=
 =?utf-8?B?d0RzeGUrYllqUG1CUE5NeDVaclFFY0daUjVHUkFTbmFuMlFaQXVzNWlaaWN5?=
 =?utf-8?B?bjdKeUF2cDlJUWZNVlRyS1d4TTQ5V1VyR2xWSVdqTGU5WHo5TDRTSDhOYjBU?=
 =?utf-8?B?SDRCMUR4VXppZHIxS0VDYzVJL1p2WDYwbUwyWFFUUVJiUUpEQkpIYm42Qjcy?=
 =?utf-8?B?UWFyZTlJYi9GaDBlbDNzV0lHT1NGeGRrbUllNWx2MlpsQTJkTk8yZ01oNU1P?=
 =?utf-8?B?Q3d4c3dCVG9nNTZ1SXJkZVNpVlhEVmlRU2EyaXpMLzQ3d1Fqd2pPbFdUTnlv?=
 =?utf-8?B?SDBGTUdsS251Z0luV0RkU0VoUkI2cEg5eW9CWnZXOFFSZU1OaGl6SjBlS0Rr?=
 =?utf-8?B?bU10d25DQTlyTlhpUEJPbVhDeC94UWw1d3laaDdKZVJsbjlhVVhSR3NNSFVl?=
 =?utf-8?B?NHI1TjRWRGdncXV6cVpvU3hDeGp0bk42OUVvbENlZXArbURuRGMrdXhmVXp3?=
 =?utf-8?B?N1IzQWtGYWFBbTFVUTNYZ2p4VVNtSzlTaEN1US9KRlo1bWVHczB6djNzUmw4?=
 =?utf-8?B?Uk9tQTNTcHhLWjIwenZaQ2E3TGQ3Nm1hWmY4R0xOekdWRW16dmhKekhvYXpx?=
 =?utf-8?B?WStNWFVVRWVyT0VIVEI3RlJreWlNWWs4Z1J5SEVabUJVcDhlM3BzZEVRZDht?=
 =?utf-8?B?TWNieU9Qb3JHckFSSi9MbjJacmFMMmRsNkFRa3VSRkRWOVUvb05JdmMrWWpn?=
 =?utf-8?B?ZWxHL3lQdW1WdHZUS2RIbmRHbUh1SGVNT1g2RXlSdklNT2p5Qlg0eU5odUU2?=
 =?utf-8?Q?Ax7h2d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 11:32:50.9853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d79466fd-5cb9-46cc-b2bf-08dd8bc891b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7419

I suppose this is still about multiplexing the GPU driver the way we
last discussed at Xen Summit?

On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
> What are the appropriate Xen internal functions for:
>
> 1. Turning a PFN into an MFN?
> 2. Mapping an MFN into a guest?
> 3. Unmapping that MFN from a guest?

The p2m is the single source of truth about such mappings.

This is all racy business. You want to keep the p2m lock for the full
duration of whatever operation you wish do, or you risk another CPU
taking it and pulling the rug under your feet at the most inconvenient
time.

In general all this faff is hidden under way too many layers beneath
copy_{to,from}_guest(). Other p2m manipulation high-level constructs
that might do interesting things worth looking at may be {map,unmap}_mmio_r=
egion()

Note that not every pfn has an associated mfn. Not even every valid pfn
has necessarily an associated mfn (there's pod). And all of this is
volatile business in the presence of a baloon driver or vPCI placing
mmio windows over guest memory.

In general anything up this alley would need a cohesive pair for
map/unmap and a credible plan for concurrency and how it's all handled
in conjunction with other bits that touch the p2m.

>
> The first patch I am going to send with this information is a documentati=
on
> patch so that others do not need to figure this out for themselves.
> I remember being unsure even after looking through the source code, which
> is why I am asking here.

That's not surprising. There's per-arch stuff, per-p2mtype stuff,
per-guesttype stuff. Plus madness like on-demand memory. It's no wonder
such helpers don't exist and the general manipulations are hard to
explain.

Cheers,
Alejandro

