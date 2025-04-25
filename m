Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5CA9C90A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967889.1357616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IIe-0004Zq-GI; Fri, 25 Apr 2025 12:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967889.1357616; Fri, 25 Apr 2025 12:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IIe-0004XO-DN; Fri, 25 Apr 2025 12:37:00 +0000
Received: by outflank-mailman (input) for mailman id 967889;
 Fri, 25 Apr 2025 12:36:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8IId-0004XD-0M
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:36:59 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2409::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7f35537-21d1-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:36:55 +0200 (CEST)
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Fri, 25 Apr 2025 12:36:51 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::15) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 25 Apr 2025 12:36:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 12:36:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:36:48 -0500
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
X-Inumbo-ID: f7f35537-21d1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auQvVieM7TO0xqGgdzLWTIDTrNAyWme3Q4dd34cOelogbLMy3W0zQ9sF8GAg2WuZc6IZ55bxTC3H1SiR97BA84BjbdX2qmsocTRGViZYQsLR0Y3Otuk8eFuaBG0S6LfM8HvHCVduQYmQeY0r/LJurK2BhONJBdEAtXZ0NMBrdSQ55GJrHjxGqfrGpMaQ/2thVs0YWJmNcJk3+PIbBiiGtx4hvRTqiqmR4mtao91NwbpTp444Yqfml91o3/bK1aZ3IifM6NRS29YXr0Id0+BffxV4rABirf5543eF3cERqsaM4oV5XUiBrYcQTxewts+v65Fo+AJY/XNmsOkaSQW4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi6HiV/v4lFN9EQLKuYbULt3tlbLUebiB7R37k61iU4=;
 b=n424bEoOgIhPflGRI5P6FCVLcyp0wdU5sSta1fpT+5Fu+Z0IjtgHoQeRIvs65mrMF93npIP6dSHJRn7Hy0gbhdFVmzsxfyDjndHLbDj8JDfKR52eJAGLhfl4YseV8Remh1xWyb7FOO06gZLidjf2RKz+dvUfVEV2fPYXcv6cVeqgYI2ORacJeDBhXTE+6KDdDSSrWZfVFz6Ghz1prtfyNgCwlctT33/jvjZC4ADzHvDnPRkVhc/DhbdRr3vF8y6WHAZp80409XHzn0H1QIfrLJHoBbEShPePJTYXh5USjEBOkUkmT/7mhmO0s2HKFuvMc7js3HOnriyY5swR0ehhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi6HiV/v4lFN9EQLKuYbULt3tlbLUebiB7R37k61iU4=;
 b=KMsVCWPljqQguc0bxpnfBzQjJEu4X499yQVCMjcVgzkztKeO1Cj5q8ONPzVoQ4S5QwYCYB4uzCyCutDiGKJ5xuSKSm9GwN2GF5vqiTDIhkJlte3j0CDfo3eWCKgcL3kKqwm/vNdkvIpDoUqQ3MX8DJYtbGcp7H2IA0ewgoM5U9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 13:36:42 +0100
Message-ID: <D9FQ3JVWGOSR.1F6NIIEDCUP16@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/intel: workaround several MONITOR/MWAIT errata
From: Alejandro Vallejo <agarciav@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250423113215.80755-1-roger.pau@citrix.com>
In-Reply-To: <20250423113215.80755-1-roger.pau@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 1311ce3b-5836-40ab-1be7-08dd83f5da0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TThQOEJDNS90dW5nZ3hSTlBMS3JxU29YQ2x6VDU2bFU1V3BkWVBsc0JJMUlP?=
 =?utf-8?B?SWR1OUFDMXpaN3czcU1LdzFjcVZFOGxGS2prYjQ3QjdSZmNEREFBZzlTVnY3?=
 =?utf-8?B?bDA3OFJpamlHZUJRYjBRQ2VxOW84dVFXZk4yYmlQdmVzazlENFA5N0p3Q0tl?=
 =?utf-8?B?dFZ1WGVsTUZBcUlGQmo0S2FmS1NZdWMvNkV4czd3Y0JvT01DM1JacUlidGhI?=
 =?utf-8?B?MVF1MmdNdkh0TnJlcEFxMHpab2czelFHNmdiaFh1cmpoVDVQRGw5RFAvK21M?=
 =?utf-8?B?TUFtZjBhc2dOSndYcEUxOTZsdDlyUGhtSlhXbVlScm9rLzYvSUxzdnhhcHFh?=
 =?utf-8?B?bGlVYlF4TVl6ZlBYaTV2UGlKZ3hEd0FXdGYwNmRTNzNwOCtMK3JZcHJkcDNY?=
 =?utf-8?B?LzdNd2pkSkJ5VFJ5dWFxWUQ5aXdXS25qeFlEQVVYUDA3Tm1UdGVPZlE1NlBj?=
 =?utf-8?B?dFZCT0M0Yk1UYUZlU2FOcU5JbEs5Mk9ObW1aQnFjOXhXdktuRHRVSm5xZm0w?=
 =?utf-8?B?eE03T0orN2t4WUs1ZzdtUGdrT2dGTVZkY0VieWU2UFExTW9oZFkrWndCVmJk?=
 =?utf-8?B?aXkvamJ2Ym5VZ2Q1TTFocTdZaVNEK0tLQmVUMzh0R1hjMDJnZHNNaDdlSkRF?=
 =?utf-8?B?M1hLeTNOVFRTeWZVMDB2M3R6ajB1L3ZxNzg1ZWpTT3RNYzZwaFN5aUxwVVBp?=
 =?utf-8?B?ZEtRaWk3NTEzY01kTDBqY25YZVRwODFwL0sxY2duNFppeXQyYTl1aGFlTXZR?=
 =?utf-8?B?akJaY2JVTHF2N3pidkxORWlsOG95OE8vT0JPMVlHZ1VWTG5SM0Ntc2V5Wmln?=
 =?utf-8?B?dGdvY1d4TEtsdjdyTWF3NXhQMzR1Tm50RVZTdTZrOC9jQkIrSkg3RjFueEhn?=
 =?utf-8?B?dTNsL1hRK1Mrb2xYYklSL0pMOXMvcUdhVmRJdkNiUDJHcGkxMktpMnF0aHFS?=
 =?utf-8?B?OU1UUHJ0MVJkbmRlSHM0VE1seFRRTDhUdVdpMmVlQzRmRmswcExSMSswS3l5?=
 =?utf-8?B?OVJFaE9DQmRLWVVaLzVRUFNrS0VtMDVQU0gwY2hVQjExTklwcXM1TUo1YzFJ?=
 =?utf-8?B?RDdqZVdsWVp6S0V4UjBIaWpjMUIzMU9wL1cyNFRlcVp2ZTBnd01zZis1VVY1?=
 =?utf-8?B?QTdtZklMS1A2d1h6V25YM3U4TEhCUFRtaVg4aGZFQ09qZW4vNVN5Y0lCZ0tJ?=
 =?utf-8?B?NXFUSGlPaWxOR29lU2d3WVNUaWFqY2xSTmsvVG5CYmVDOGJTUFRwUmpuTm43?=
 =?utf-8?B?Vk5FL0ZrOVlwSkNRMXQ4VzlUSlkrcXp1TmNVYWFUYjcyTGNFQjlzRHhSNHJj?=
 =?utf-8?B?NUQyZDVpUktrZklwalJiY251Y01nTzRTUHRPNlU0enRtSGdMNm5LQ0xkb0p6?=
 =?utf-8?B?ZDVGU1A3Rk9zcGk3eVYvT0ZlODFBb3RIYUR4Q1FBQnZKNGFDSENSY1lKWFEz?=
 =?utf-8?B?Vkg0VFl5MWg3RDB4aVYzQ0cvV1hpYnZCYnJhck9PMFhKQ29xVTNKejlLZXY1?=
 =?utf-8?B?OStDV3puck1aRzE1WllpWk1ZNEFtcWpzOGJsUDI1akF2cGR2dDZaNVQ0dHls?=
 =?utf-8?B?SW5PWXltK09PRlk3NXI1dFpNeVAxTVUzTzJkVnhSNllkYlpLU08zaEt4dEE5?=
 =?utf-8?B?Q3Z5UHl4d0N5SHNOWWdSVXNnVjhkMitXUlNsaTJ3RHhGMlpQOFJDRVdVL25r?=
 =?utf-8?B?MkozdDRnS203aDNmMitNOHg0YWJubVlOV3IzcWZHREUyc2pNUkdUWGtrUUZB?=
 =?utf-8?B?TWVKZEZBTEFXOGR4aXZjR3RQMU14NHk0SVhHN1lsRFczb0lRNDM4cW9RWVBK?=
 =?utf-8?B?UFFuUVduV1ZIekxxbFppVVhHcStpMUVrSmhsVm1aN00wWkcrSWxoNUtjRHRO?=
 =?utf-8?B?OG1FdUlGOEVJRXViTzd5Q0Fpa1JJVit4aHVHNHU5Y1NDeWVockdVS2N0NkhI?=
 =?utf-8?B?T2Q1RDQzTjIwdDMyT0NudUlTcElieldIS3ExVlVqZjI2clUxU1BzcXhFaVMv?=
 =?utf-8?B?RXVPVG5KcDZuaVJwcUF6a0h5SGh6dDJHVHBKZll2K0NCL1h1bG50WW1NbHoz?=
 =?utf-8?Q?dX71MW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:36:50.3565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1311ce3b-5836-40ab-1be7-08dd83f5da0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

On Wed Apr 23, 2025 at 12:32 PM BST, Roger Pau Monne wrote:
> There are several errata on Intel regarding the usage of the MONITOR/MWAI=
T
> instructions, all having in common that stores to the monitored region
> might not wake up the CPU.
>
> Fix them by forcing the sending of an IPI for the affected models.
>
> The Ice Lake issue has been reproduced internally on XenServer hardware,
> and the fix does seem to prevent it.  The symptom was APs getting stuck i=
n
> the idle loop immediately after bring up, which in turn prevented the BSP
> from making progress.

Ugh... so this is what it was... Awesome having this madness fixed.

Do you happen to know if Linux has a similar fix in place?

> This would happen before the watchdog was initialized, and hence the
> whole system would get stuck.

That's nasty. It was the misassumption that the watchdog was already
running that had me going in circles thinking it was a lockup rather
than a livelock. Oh, well.

I believe the kudos for finally being able to reproduce this goes to
Frediano?

Cheers,
Alejandro

