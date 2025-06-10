Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B44DAD413C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 19:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011165.1389515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP387-0002lb-4j; Tue, 10 Jun 2025 17:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011165.1389515; Tue, 10 Jun 2025 17:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP387-0002k9-0y; Tue, 10 Jun 2025 17:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1011165;
 Tue, 10 Jun 2025 17:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4ek=YZ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uP386-0002jz-0R
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 17:51:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2415::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8359e14b-4623-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 19:51:20 +0200 (CEST)
Received: from BL6PEPF00016411.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:9) by MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 17:51:16 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2a01:111:f403:c803::3) by BL6PEPF00016411.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 10 Jun 2025 17:51:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 17:51:16 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 12:51:14 -0500
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
X-Inumbo-ID: 8359e14b-4623-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWJIwvrKoAwiOlSi+8P8j5SCRB8szyq/qavL3zp5BBZf+cWE2oQk9rIqDyNaHv4digmB5fidl9iKCHrx6vqIgjXUF+I10ZeZDttCuBD8dfYqNmZ0B+ei+fPWrXloMAPqucT/uFVmIfvUPS5q4Q5fqdnHJP3YSQAs3/JuKqd0/zH9rdXT5hGpvGHVtkcsvKeIZUlEEUVjErcF/BJiB1g4WoQ36OU9epljkfi3ghYyeWrOjLQez+clS1/fW8GJef2PU1CmC2vgFXojJqPsUh0VckOf1+IU7j7gvSP5fkoOt0y7niC74fQwTnyuy5wS1mTK+HpFb/xKeRmq982d7FE0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOYKum3/hKwNueH2EaNEGHZqmp/D3OcBNiYX/3Aji/Q=;
 b=WT6cH7wFZ/W6MKQ200ooj9ZcbDX7yCQtcN59oTa2exUIFRoxvW0WYkRHGK4aipRhCThOyz7j8MK8Fup60L+0Gw3L6b4El7BiWtQxeQotz+e8ZTxjEnmAgt+Sh2+OzF0TK+EFC2TpWiRyQTKmN/NwDYmkEFMbDd1r2O9Evj+hfMdZxHQwiUBx2wIPT1kOXBXFGK9w8KWc+T1QBTO6oM3Aj3XPKP0ydIZJ0fKPHStc2DLy0tjk/rwoPQuKM7bYyZV2ZlMI+9skd5wX6luhisbDgmC5G7nfQuKq+KxSMLRGx5gbkSftNMPBJyOQsVmh0+gTOf54mPptgcx0ItNeo8veRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOYKum3/hKwNueH2EaNEGHZqmp/D3OcBNiYX/3Aji/Q=;
 b=bmk5zEbp/Peou/A3nh5B3SFzFd36Ot4A7R5d2LdCKxa7QEN6YB3RT3nUzpQksE0/yoIfEWtZYLHoMY9/RD99E9tpLwHYaaZq2MhWC3CoL2jAhzbr+v3Kn91wALMJm0D27dRxnB5jFipM/spE5A01K7vQjscj3F9wyyaCF+tQf2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Jun 2025 19:51:15 +0200
Message-ID: <DAJ1LG14CROI.VGN11XR1L5TS@amd.com>
CC: <xen-devel@lists.xenproject.org>, Bernhard Kaindl
	<bernhard.kaindl@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 02/11] xen/page_alloc: Remove `claim` from
 domain_set_outstanding_pages()
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.20.1
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-3-alejandro.vallejo@cloud.com>
 <aEHJEc5Pht5xcMfO@macbook.local>
 <89d4250e-20aa-4515-8199-7003afb0bcbf@suse.com>
In-Reply-To: <89d4250e-20aa-4515-8199-7003afb0bcbf@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|MW3PR12MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f97acb-b4e4-40fd-c902-08dda8476622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlJDSExRL2src1Ywbm0wbkMwbi9RbTRyWWJjb1Zaalc2Q2VLcW1zWStkT29G?=
 =?utf-8?B?T2VCdEFjaVVTTGJ2SlpCRG9tQ3A1NnkyNHM2Z0kvK2NIRkx4UENteHYrOVV6?=
 =?utf-8?B?WThaK1FzdkxHNk1iaFJ0MU1uMVkrQ1FQTjF3ZGhEUUhMSHp2SUtyQzRtK0ZU?=
 =?utf-8?B?K1JLSmw1K1RmT09ScFdQS1ZPcjQ5MDRaNkdMTnJaMXhSSmJNNTZSMHZROW1x?=
 =?utf-8?B?QkhESHR2UWU2RTRqdEt2OHM5RXZPcUFJU2tYT21GMlY0UmtGZldEb3dZQ3pG?=
 =?utf-8?B?Z1NDRjA1NzJtdDNibzUzS2JHZGRmOEd0REpoK1NFcWpRdW5iRDRtVTNXU3h0?=
 =?utf-8?B?akdmV01Pcndoc2NNdTRqVGdrWTRuNTZ4MEdsZ2hXOTdkczdmY2o1VHdHUGg2?=
 =?utf-8?B?c0lXdHZzUEZac3dFeFdPSVNwRnRoRlJhMjE2OEpWN1J2b2VUQll5eUJOSWFX?=
 =?utf-8?B?SXd3T25MSUVUVE5PRGJzd1dpeHE5eE96NHV3ei8xZTZIM3NyRG5DZzhpNUJI?=
 =?utf-8?B?UVVQR1BOTHFiV3ZPTXlDUm14azJOU0NnTkNWcEhWYnNzZG55UlZoeUI4NmdG?=
 =?utf-8?B?aXpwZ3lwVnIvcUpCVUdPUEp4TWczdm9icDZ5L2NZanNtOXRyOGRFMytPWU11?=
 =?utf-8?B?aG1ZdXpoR2VMbTJHQnY3MHVSTHFJbmVkRDk2YTFkRkR3WVc5TlZPQmFhVEdp?=
 =?utf-8?B?YlBWcDRZT3ZvOFdER0duai9UTDlHeEdLZ255Z28xdmt2NGJPLzFnSFI1bVFL?=
 =?utf-8?B?QTRYSktiaHVZaWlUbmNYSXpVdE9aSlR2Z0JaQnFiOHI4Q21oWFlqS3NuOUho?=
 =?utf-8?B?M0hQSFFJVmh4TGFoSS9aNnp2ZWRic1FrY2g0QzBWN0Uzb3g5Tm54SFJsdHJL?=
 =?utf-8?B?RXhBWG9BZkRFLzRWMEpORFV1NlU2TWM2RGdjMi9pZTZockFXVkNyUnd1Sk1k?=
 =?utf-8?B?dklSNCtnT1pPRTNJZTA2eFl0VDVQS1dMMCtVaGRMRWFuK3hRcmg3Uy9kNUdH?=
 =?utf-8?B?UUowV3gza0VXNTBOUjRIZ05OUXpQb0dPMDJ3MlkrWDF3VWZQOC9Ra2hBSzBK?=
 =?utf-8?B?NE9WVWZ2SHVVMFcyRjh1SjNRdlYxOFFqODdYblQyYjZjSGkwTVlJNlZBRVRo?=
 =?utf-8?B?UWxKazdOd3lFTjkyVjN4bVgyQTZBTHNuSGR6NERhalo4TndtWlp1aXFacTRu?=
 =?utf-8?B?QU9zNjhMYmFJL2ZFZmd1YUVERDdTT0M2c3kzZ1RpV0NEY050TGo5Z044Zkkw?=
 =?utf-8?B?cThIUXNWSUEwbFpMcGdNdVcvdEtXbXd0eEZUUTVDL2d2dnE4QnNqNmRmcmdM?=
 =?utf-8?B?MXJ6M3pobkZPSEx0KzhvRUFlTXRKSEtqUWpPUzdUR1lTeTZKK2E4WEFjQzh6?=
 =?utf-8?B?cm9FY2J4b28zNEM2b2U3bk5GdFVnenUrVmdlalVuNWR6YXpZNVFPRXpLcVhV?=
 =?utf-8?B?ZWJ3QVJtc2tUR3RhZGZsUUZUcXdMYWcxbTVsQ2VsUGowYXUyVWk3U3NCRjEz?=
 =?utf-8?B?VkZMV0Vsc3RHdEh2VlVHWmtTYW4wQnF6U1BrcHFaYllHZzZiZHUvbUtwS0Uy?=
 =?utf-8?B?aytpMmJ2YjBSaHRFVkhaOFFEVzM0S3pkVDBzRCt5dEtGd21JZmtQYWFkaHpz?=
 =?utf-8?B?ZjlIMmNqam1tSmthS1owR2tJdkpQQmFvaXl3NFRrNXVlT2Z3czQyQklvZ0xz?=
 =?utf-8?B?SStnV0lqWnA0QnplZlhmbmtKQjdzRkk1ME9HL0g0Rmx4TzZoSG5zVzdlTzIw?=
 =?utf-8?B?U2lXOXFya0k2ZjRYU3RUb1hyaEp1b2gvTjhBYjlHcG5TRFJreGJNZmZmZGx4?=
 =?utf-8?B?RHhvcnVzKzNmOEhncUJKMzEwZ0E0Z1lpZkxTREJJNTV4K1pmc2JDVzF4NUNH?=
 =?utf-8?B?eXdUdXJ5MThUeHVNS1ArOEswQTJKQTV3TTMxbVM5bWhlQ3VTOUZQVW1pOFhr?=
 =?utf-8?B?QkpIcWVEbFlYNXNPc0l4bUhwcTQvWG5vOWhIWXl6SlFqS3dzUW1KWnJjNjRy?=
 =?utf-8?B?RXk2WjhhMEQ3cGoxRG52UzM0QTNUUW9DK1g3QnVSMFFzQ1V5TFVaTzNrTDFR?=
 =?utf-8?Q?naZwCK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 17:51:16.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f97acb-b4e4-40fd-c902-08dda8476622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409

On Tue Jun 10, 2025 at 2:23 PM CEST, Jan Beulich wrote:
> On 05.06.2025 18:42, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Mar 14, 2025 at 05:24:53PM +0000, Alejandro Vallejo wrote:
>>> With a single global count for the claims it's easy to substract
>>> domain_tot_pages() from the claim so the number given in the hypercall
>>> is the real reservation of the domain. This is the current behaviour.
>>>
>>> However, a later patch introduces exact-node claims and those interact
>>> very poorly with such a scheme. Since accounting domain_tot_pages() in
>>> one case but not the other seems strictly worse than not accounting the=
m
>>> at all (which is at least consistent), this patch stops substracting
>>> tot_pages from the claim and instead checks that claimed memory +
>>> allocated memory don't exceed max_mem.
>>=20
>> Hm, while I don't have any specific interest in keeping the current
>> behavior, XENMEM_claim_pages is part of the stable ABI (it's not a
>> domctl), and hence should be stable.
>
> Is that true? It sits inside a
>
> #if defined(__XEN__) || defined(__XEN_TOOLS__)
>
> which generally de-marks unstable (tools-only) interfaces.
>
>>  Note also the comment above the
>> definition of XENMEM_claim_pages how it states the specific behavior
>> that you are trying to change (and which should have been adjusted as
>> part of this change).
>
> This is the more important part, imo.

Ugh. I missed that. Regardless, the current scheme is highly counterintuiti=
ve
and works only because toolstack colaborates in removing the claim after do=
m
creation.

>
>> I have no idea why this was made a xenmem rather than a domctl
>> hypercall, but if you want to change the semantics I think the only
>> option is introducing a new hypercall.
>
> It _is_ a memory operation, and it re-uses one of the interface structs
> there. (Yes, none of these would technically have prevented it from
> being a domctl.)
>
> Jan

As Jan mentions, my understanding was that __XEN_TOOLS__ effectively meant
unstable. It is quite hard to keep the previous semantics for one hypercall
while introducing a new one that behaves slightly differently.

Cheers,
Alejandro

