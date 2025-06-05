Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47EACF628
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 20:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007352.1386671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEw1-000218-Hc; Thu, 05 Jun 2025 18:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007352.1386671; Thu, 05 Jun 2025 18:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEw1-0001yU-EN; Thu, 05 Jun 2025 18:03:25 +0000
Received: by outflank-mailman (input) for mailman id 1007352;
 Thu, 05 Jun 2025 18:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNEvz-0001yO-RQ
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 18:03:23 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:2408::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b7a97cb-4237-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 20:03:18 +0200 (CEST)
Received: from SA9PR13CA0030.namprd13.prod.outlook.com (2603:10b6:806:21::35)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 18:03:15 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::cb) by SA9PR13CA0030.outlook.office365.com
 (2603:10b6:806:21::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 5 Jun 2025 18:03:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 18:03:13 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 13:03:11 -0500
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
X-Inumbo-ID: 5b7a97cb-4237-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdYdMgr++/P9ntTJ7gqyngj3T0QT3fC5a3dqpyF5VzxSjaPypChMS8+v/1VurHN1Wj7qAwUgq78psjwLYH4i4xfPlsE8y7Ni58JvLKDHOorUwHq6+LFJG2C50JFdVSH7OhSBeYfET/iK/F6njvyrWnUdRfipKhYTPnutNlgLH7yeMxAmySK96Js8Me/xqx+Yh6ImJXJtiI6V7a55rKv9owoS3iRdDfUFa7WfMmLp2wWt7i+YiXnIWTly0WmdkYjQenHPk5W+5PKC2PGoukqMVNhEhTKGnrhJ+L4EGuqibZx0p1kCW5Duz8ML0yMEmK66SVjWAZ1vPHD6wPRxJHBO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQaIIJRniKD+GuB6JGARqRaiARUWmfX5G84pNUynaSI=;
 b=HTByM6F+Rxx9WM2ruGkk/L8L0Lj8gMwXVFF2lNWIuwErLBUpLIdp0uxiilmw9CNvWDgT2SNchznl8it7oMVaTHFvxrWd7O24RS5bm6VRXbR4kVY/DHwIq7OkyMldFt6U58M8xBDQJJz/8GN3JO4JdLFmjRZ33XvYDRpL4N75CifJqoTLbRUHBtNIS4k3xUGuTVfbQQ41WufuDytnPhK5hLBMMHBeex5ttfjZxEWgMhl0vOzlPIP7jlsNc2Xya78IIagglt3YvDaB8fS3eYocH/v32C3xF67JTpOFBmkb8O4xrf+3gKyAo24xeyFL6e2yNY4IjiE7X36QxCv5gyR7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQaIIJRniKD+GuB6JGARqRaiARUWmfX5G84pNUynaSI=;
 b=Dz//smGXtMLWn13XU7F4sEJMbfUMtyYtzWEIlYMt8C5ym5yRTeIjBhQodDa+1SCgWkfQikJc0pfGgE1j/OzLl6tuDQ3PKSl+iI0BCdkq7SB7KMKK0YrDVXW4zo3fv7U+lcfxL4O37ICQMs3vhn4dFZw8P/CXXg45e/Csm46QRww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 20:03:10 +0200
Message-ID: <DAESPUKPILGY.3MLDXU7XG65X1@amd.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-13-agarciav@amd.com>
 <a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com>
In-Reply-To: <a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|DS4PR12MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 06be062c-6fa7-443c-c35e-08dda45b3d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmUxUWVjWTN0MDhyYys0MlA1aW1NOGJSdkgyTENvbHVKMjI2ako4d0xEelZt?=
 =?utf-8?B?R05LVWFqK2FiMUZWaWdYOTN5M3dWUWxKbHN5cU9tZ0YyellDMWJZb1NmeEx6?=
 =?utf-8?B?MFo4UmM5Mll5bEJYUXdvTzBNWW0wMFRla3ZhUVJNNE1FOU8yNWt5Wk42eC9L?=
 =?utf-8?B?dUYvM2tNd3QyREFGYXBtckM2WnE1bHk2eGdzNXh4TVZrNVEyaEdiTk43Z1Rv?=
 =?utf-8?B?UjR5R0RnZUVSM3RFL3IwTkUzYUVvSWJmYTRLK1R6QmRrWWk3QkNHT0YydzIv?=
 =?utf-8?B?UFNGdkdDaEhxdGhhYmxKRDFXMndUYUxLYWkxWGNBdDUvdmwyc1BJWVZ0dmlC?=
 =?utf-8?B?alh4ZHROMFNpYitKeHRHM0t4Nm1USFQyTll5OTY1R01zbUtMVWllZmVEODhy?=
 =?utf-8?B?SHh4WnFJT1JQQVhLUWZJNDladjd6UTd0aXFkcGl5eEc4bFd2MGVQYVU4YWs1?=
 =?utf-8?B?eWU3YWo1TDFlRWpwdTZjQlZJZjU5elBCci9TdkVTSDQwb2NZdlpkaGIzYTZU?=
 =?utf-8?B?MFJTbHRUTFJwWmRqeFRkNWNLL3JDTlVIOHFEWHYyd1VoNXlZVFdxVkRBdkx0?=
 =?utf-8?B?Mi81aFdBdi81cFhnM3I3QWFuQ3ZhTkp2ZDY4WUxneDJKWUM5bDlzZ3lZQWh2?=
 =?utf-8?B?WnRLelNJNzIwZTJKLzNnSEJ1MzVabnozMzhtNUZKaE5IZkxCZTdNUXUrRjVy?=
 =?utf-8?B?bHdta0Q3M0daWTQrTzVFTEFFZ25KdzU1Z3ZySXJqS0JldnZoK2lCYlBGM2pD?=
 =?utf-8?B?b0NoUFZUT0RYZXVJNjRFZmp5WXA0OVhjTzNTY1J4S2NIcEhIVHJOcXExbjk3?=
 =?utf-8?B?SzBPanBydmg1UkR3Nk9yTjcxRXdZZmh0aDNLREx3a3ZQODdHNTZyYkF2ejFu?=
 =?utf-8?B?UllQaVo5YUJTYnNVTnNSc01Fb2lwcER2N2pWNktpb2diMis1bkNHckhOelVV?=
 =?utf-8?B?MCsrWnNLNk5nU3J3djJERU1lcHJNU1M2cDlVL0ZiRmNmcDVUZERjcUQzV0FG?=
 =?utf-8?B?dXVsSlhuLzRIcEdlZ3JtNndLaWdjd0hraEJYOG9aODhIaEhuUnNWcFFSTlQv?=
 =?utf-8?B?MUtDTVlGcGgzWkJLZHFqeGExSjlpRDcrQUx3OHQ3anh3REp1OXRtYVpnT0dW?=
 =?utf-8?B?ZUpEeGZDOWdtdUpzVDdMcnF2U1UrempUVkdnMzVVTHdHMkdtN0h0ZkFZa2kr?=
 =?utf-8?B?Qjd0Wm1iNWkrVUhzWGh0cjV0aW1iWGRHb2JhT1A5RTgraHlVTTBSVWJxNlFy?=
 =?utf-8?B?VzFUL1VLNGt3TTM4YW5YR1ZMRUk2U0NpNzVPelkyZVpMMWtoZW5qQmN2WVRK?=
 =?utf-8?B?MU1pbnUvcVlZTkNITjR0MU9tT1QwL0QvNllCT2F3d3VjaWs4anIyN0c5L2w2?=
 =?utf-8?B?MEhKMzN2U3BGTllQU2hQMjYyVnRGaStrbGRWQXVBZGhTZVoybXNFMWY0WHFx?=
 =?utf-8?B?bUhhZFpKbzNpUk4zZDlhOXhXVm9GYW4xd2NPUWhjQlF6Wk5GeUlrNUYybnpY?=
 =?utf-8?B?RG5DbzcrUjhycE1zQWYyd3VJcnJrTUszcm0zSjJaL1pRdVNpOGZ0SWszZllO?=
 =?utf-8?B?QU05M0lWZEdEYUxibEM5MFBmM2svNXR3eVM2KzNTYW54Z3VEWjZ6aExhVWFx?=
 =?utf-8?B?VXhiQTRQWnFkY0hNWEZ5Y1FUdTlIcXZkUmFqY29BWER4a0FLbWhKU0YvUGJW?=
 =?utf-8?B?WDFlWlFWMFhWMGpOVDUxaTJOTndRY0VCalNYaFM4b3JMR3FYbks3RHAwb201?=
 =?utf-8?B?QWszeU1FR0l1NVVPRXh2Ky9ZNXI1TDcySnpYUCszOURVc1hmN2xJaHhsQWs2?=
 =?utf-8?B?Vmd3NFdVekdnNVNKZTVZYTJBU296ajhGVTRSSWpIZjdxMWRkWHp6WWJacnpE?=
 =?utf-8?B?SGQwWjBnTjV4c3RReTRWMXhtN3Q5Tis2WFhOTDVWYzB3WkpGa2ZzQzlLZE9k?=
 =?utf-8?B?MWREcDVYUVorMlBtYlJPUUdWOW5vamhpcm96ZkQvRVUyRWs4blJmNkpBbDNE?=
 =?utf-8?B?dFd5M2hvOEMyeHpnTWQwQmJoZWdlN0QvbTgybGpSU0lDQU9rcDh4VlF2N0Zh?=
 =?utf-8?Q?oayNkM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:03:13.5590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06be062c-6fa7-443c-c35e-08dda45b3d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682

On Mon Jun 2, 2025 at 10:25 PM CEST, Daniel P. Smith wrote:
>> +/* Helper to read a big number; size is in cells (not bytes) */
>> +static inline u64 dt_read_number(const __be32 *cell, int size)
>> +{
>> +    u64 r =3D 0;
>> +
>> +    while ( size-- )
>> +        r =3D (r << 32) | be32_to_cpu(*(cell++));
>> +    return r;
>> +}
>
> I know you are trying to keep code changes to a minimal but let's not=20
> allow poorly constructed logic like this to continue to persist. This is=
=20
> an unbounded, arbitrary read function that is feed parameters via=20
> externally input. The DT spec declares only two number types for a=20
> property, u32 and u64, see Table 2.3 in Section 2.2.4. There is no=20
> reason to have an unbounded, arbitrary read function lying around=20
> waiting to be leveraged in exploitation.

Seeing how it's a big lump of code motion, I really don't want to play game=
s
or I will myself lose track of what I changed and what I didn't.

While I agree it should probably be a switch statement (or factored away
altogether), this isn't the place for it.

Cheers,
Alejandro

