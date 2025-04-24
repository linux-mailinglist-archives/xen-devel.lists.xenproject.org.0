Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA7A9AFA1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 15:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966367.1356588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wvo-0005xu-4t; Thu, 24 Apr 2025 13:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966367.1356588; Thu, 24 Apr 2025 13:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wvo-0005vT-2C; Thu, 24 Apr 2025 13:48:00 +0000
Received: by outflank-mailman (input) for mailman id 966367;
 Thu, 24 Apr 2025 13:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7wvn-0005vJ-0e
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 13:47:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2417::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8c33dc1-2112-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 15:47:55 +0200 (CEST)
Received: from SJ0PR13CA0212.namprd13.prod.outlook.com (2603:10b6:a03:2c1::7)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 13:47:50 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::ec) by SJ0PR13CA0212.outlook.office365.com
 (2603:10b6:a03:2c1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Thu,
 24 Apr 2025 13:47:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 13:47:49 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:47:47 -0500
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
X-Inumbo-ID: b8c33dc1-2112-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jux8II3mVEX4pMN3qSWCYZIefs3dVKQKz9XxXlF5YI+p35H3qc/Fh9Ns15l2clOa4pPh3mYo0raIIYsUsnULRWsRzjSeTh+1WAQEBc7ZpwJNCU3sv8GUtzTLUh79javNFWXU936DprtcSWipXI6XNeChZhLpB2plyVEkYaKs+F9wAao3SIGS41hlAr8h9AWHerAIagF0/2VrdYAMEZJuebEbhC1t8LC2zEADkgqMmVeH59rfSReNd200bI/mP1nDO5jrUuY0IiNabGM759bUn8I5BEw62iZ1Da5Ti6/ixHJmkrvDEME2PiR+DeNrFX13H+nMpT3eCd35SD43/vAbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjELUaRyGnu65+y6Em3aUiAYggDmeOzHUcwOuoPQDvU=;
 b=UXIyMT2/UwKNwdc5+hzcqi4b6yiQKMJXHIUDyZkR2IM6QQBad5rkIZWu5jYE9+khQypQCkAMm13mHQM1KSzBXHqDJ/384FOvLXrRo9YLqFT0OEfhqt/gMs3x50L4ngdaJ/6xW9ZELoDGa4pbdwB5BIuuw7NjG3AA4OCjxqdA2h1i3h/n19XCPNP2X9REZS4UwaBSszebGqRzStlbbZfHk8kVbVWl1ZHhHtT0/EOGO5wjZZasj08G3rtlIhR3I50zM7H7WL9P7sHyj5kd1FljEM2PI6R4/18a8+2gYG7ABYEg5FzHdvBG9N6WXrknad+WqK2f4m6CNf1KjBGCLimF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjELUaRyGnu65+y6Em3aUiAYggDmeOzHUcwOuoPQDvU=;
 b=mSKVmifI6GdIzkVUkXpx7tfDluVh/1iimlnBouTdtPPh2YbQP8H//kO8CxhrN/oxjX0uQE+2NuQIhY+CnWQI9PC02M6h0LciEtwvwUYQ50DenQNmBPWtAN2lEeUTsJbI0SmocQ3q28YeQ8LLjB55OJs9vyD/5i8J05hRTeB89H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Apr 2025 14:47:46 +0100
Message-ID: <D9EWZF0G7QUZ.2IDV470T7SYD0@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/hyperv: Adjust hypercall page placement
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250424124505.42156-1-agarciav@amd.com>
In-Reply-To: <20250424124505.42156-1-agarciav@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 143d3988-9ea5-4609-b71f-08dd83369a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1FQOFRXL2xGR2k2V3MvSEtpcVU4VVVUVWJaYlRHOEE3TE1ERzd0MjMyVzhI?=
 =?utf-8?B?WXBSM2hocDhBN095WjFnOExHZzhJWTVJM1N4cVpnSkE5SXJFd3NtT2YwTWNl?=
 =?utf-8?B?L0RrUmFmKzV0MGRPSjV1QTRQNGdDYytzTk1MRHppVDdGV0k3SzdDejFOdmQz?=
 =?utf-8?B?Q2pSQkg0TFlvbXNGZUVKd2YvRXhjWWxFT3VtMGh2VnRLdUlCL3ZHNEliTzJi?=
 =?utf-8?B?R1BqRWw0QnhQcGhXY0lOUkpBci85WjQzNXJidE14VWQzU3VZSzdvNWZtV0dU?=
 =?utf-8?B?Rko3MEN1bkFkTnlyYWhEQUg5NCtocU5HSi9ZTmpmazU0SzlUZkJRWnB5T0VY?=
 =?utf-8?B?MG5UOGJKWDJjcGxEdXJNdmUzdDA3bmdGTlR2alVTUmZBNGg5VExLZ2MyV09P?=
 =?utf-8?B?YVFQY1NXeW5ZaFNMVWw4N1ZweHgwaXRsdytKK2MvV2pYRUlUUzIrNGNjMGdm?=
 =?utf-8?B?OUNCR2xSaEN3YVdPN3hIMFJMUU1HczV2RFg0S1ZwUitnWFFCUlgwWmphbnVv?=
 =?utf-8?B?ZWFDamhPUjJiN2J1azlZSUk0NVZmdUVVVnZtM2EzUGt1VjVLT0FWaUUxeGJU?=
 =?utf-8?B?ZHJYVk14QVhhdENWMzVxSzJTV051MUlvQzd1UncrMCtaS0FTaWh4b3VQTGpH?=
 =?utf-8?B?WXFNVHpxTENrZVNvYW9qbHZhQVFRZnhYR0JaSDZzUEl6UDNtUjJSaUFFNlhZ?=
 =?utf-8?B?SG8vVHN1ak03T3UvR1FJT2lYd0ZvYlJtSVVjQU9tcVdGZFYxLzJLK0lxVnBJ?=
 =?utf-8?B?UEF6MXNIWjkrS2FmdkZDajZqZUNLc2tvQXRCRmNSbGRLb0VOMko1aWxhMFNN?=
 =?utf-8?B?TlhpL1RsTjJoMXFDenB5MzFKSzZZVDh0VkxXdlZuR0g0Ykx3KzNiTGx3NlhU?=
 =?utf-8?B?V2FaQzB4MUR5UzNLL2NhemVUeml5WkdFSVFJSjVCemNVL1pWNlVZd3YzK1hY?=
 =?utf-8?B?TG4xMFBDMjBCd2pQV0tRdlU5YnA3allQTTl2bUtDUVdGMCtyMXJBbEN4Y0h2?=
 =?utf-8?B?MEFqcTg3VnBuNVZxZzhBZkVBa25RaHRQUTNlMUpObEY1MnFBZWZJd1ZkN0lq?=
 =?utf-8?B?V3RQSitNWUtiZ1FSSXdrampHQjBjODF4MHJRSUpOcW8rdE1rS2I4NHNIT20x?=
 =?utf-8?B?M1hLVGtKY2Z0SW1sM1BiL2dnQXJTWWYwRGFQemFvWEdXNHpxUzVSVEFKTXFq?=
 =?utf-8?B?S3VoMTNVamdRRUhBT1BzSDZpYU1iK3hHcFBNWEpZY3h4dlBheXFuSlkzMnpm?=
 =?utf-8?B?RE5IQ2k4TSt1aUdrNHNvblpCRjlPZWJhdWVMbjhiK01VSnU2eWN2WlBMT3VI?=
 =?utf-8?B?ang3dWZTN3pjOU1DVUZCNHNwOXRmU1ZsZWtXWlpaUkI0L3JXeG5uTDMycEpx?=
 =?utf-8?B?Ym56TEo0TEZwRmxxWVllMzkzSzFEdGwwaTBzRzlCYkQ0Tkd5WXhYTDlHL05q?=
 =?utf-8?B?SzZLai9pbWQwS1dkcWxUSGtReUdZQkRZNGZPUURuN0k3b0dzRTJZd29EK2N6?=
 =?utf-8?B?TTN4S2lGeEtMUGNYUVM0VzhTU0hkSTcvWitLSGNuK1FWWURaVHhEdWxlY3JU?=
 =?utf-8?B?UFM3alZhT3ZsajV2TTVKVVBsS2pGeVdyUnJCV2hOWDhpWXNJc0QybUN1OStF?=
 =?utf-8?B?ZjRvQUlZZlFFa201c200YXllYStEZnlud0tQSVhhZFZNTFdUejlEdkpSdzY1?=
 =?utf-8?B?VGc4VUM0cWdvSURNNmhFNC9PQXRqQ29qSjFIencwSlk3ZlRvbVlvck45QXhC?=
 =?utf-8?B?YWdJSVJTOHhFYnpQSm9lbDl0UlVGdFc4bEEvN0NCcHdDZEFBNjVEY0U5NVNX?=
 =?utf-8?B?TzQ0S1NrdHJwSVRyWC8zeXJYZkJEUFdCTVMxczVZanZiS0plYTQ3V2hObFh6?=
 =?utf-8?B?Nlk5MlRUYUQrMm84cjVKNkt2eS9WbGZBTGk3dE8reTB1QzBDVy85eHNzM3p2?=
 =?utf-8?B?TWhuUURIVmZlb2dKSFU1WmFXOVFEZWlGN2J3bjdCTUhRa0svSTBXKzhsanND?=
 =?utf-8?B?bmczN3RIODd6ZWY2TEZHRFhlTm1NTzY5UFlBMnZEVEhLV1hDSWFURG8zQ3cy?=
 =?utf-8?Q?9nUPel?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 13:47:49.3383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143d3988-9ea5-4609-b71f-08dd83369a21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053

On Thu Apr 24, 2025 at 1:45 PM BST, Alejandro Vallejo wrote:
> Xen nowadays crashes under some Hyper-V configurations when
> paddr_bits>36. At the 44bit boundary we reach an edge case in which the
> end of the guest physical address space is not representable using 32bit
> MFNs. Furthermore, it's an act of faith that the tail of the physical
> address space has no reserved regions already.
>
> This commit uses the first unused MFN rather than the last, thus
> ensuring the hypercall page placement is more resilient against such
> corner cases.
>
> While at this, add an extra BUG_ON() to explicitly test for the
> hypercall page being correctly set, and mark hcall_page_ready as
> __ro_after_init.
>
> Fixes: 620fc734f854("x86/hyperv: setup hypercall page")
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

After a side discussion, this seems on the unsafe side of things due to
potential collision with MMIO. I'll resend (though not today) with the
page overlapping a RAM page instead. Possibly the last page of actual
RAM.

Cheers,
Alejandro

