Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D0D3C58E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208651.1520789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi98l-0006uC-V4; Tue, 20 Jan 2026 10:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208651.1520789; Tue, 20 Jan 2026 10:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi98l-0006rW-SK; Tue, 20 Jan 2026 10:39:15 +0000
Received: by outflank-mailman (input) for mailman id 1208651;
 Tue, 20 Jan 2026 10:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi98j-0006rQ-Ip
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:39:13 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0f9a3d-f5ec-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 11:39:07 +0100 (CET)
Received: from CH0PR03CA0192.namprd03.prod.outlook.com (2603:10b6:610:e4::17)
 by MW5PR12MB5624.namprd12.prod.outlook.com (2603:10b6:303:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:39:00 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::73) by CH0PR03CA0192.outlook.office365.com
 (2603:10b6:610:e4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 10:38:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 10:39:00 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 04:38:57 -0600
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
X-Inumbo-ID: 3f0f9a3d-f5ec-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOcKeE2419BUzpaTH5AeIg+btSSqNz7lqFfe6ZuZPjVlNscU2RRrN+t3nqh2aqJB/5uKp04bsSJH7CqCUvkpoFRgfdXec+mDHR8mqmuLYc139CM2j6AvUOWQQRirlP31/6vhI60RbmQK+rz/EldZO1cMGhfR9i/7p4N5I3a/YawduSDWr8zTGUSRkhLpsGn5hBs09eH7hux7D6EHLgtcCssGJdX9NL9CZhnRUC2zufMnQjM+NSiOpIx/mcpYcr3cMAzRF9qU6kLTd8To7CwjAtiv5X7Tgtscefr6eP3G4v6WaeBkZRt1ZmouvB8PIpK64huJJx8t+nFtASmXjh9owQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUkRTQUOpK2l5eZy1zzqW+mxTNu0ZCipmk7i6pOAx5g=;
 b=FfPauaPxHCSzQ0aC3F1RR7IiVvildKfHbhw0xUxDrZ9+n9skoCNNv+13ZuVCzn7BIYRBETHGbb7zsm548YldAjTDeQV3V+BD0Ba6jmSSTQbXJ8ImLP1X1eLb2t3FI0RH/EL4AZSRc9XNI0hbaq7TpSlt6PYtR533flnptWwVSlZ3NlxW0zCea4s2vPFPkRrC3hannIkspbM1CcEQFKWFhHav/r7PznlSfm7+12+aHUs4eyU8VW36OQBKwiGcbEmjR8vn/qgYHD71Xg6SSx9jBFmQeJk3tOFqINZjAyFjQO5HxyGZKIt79XeVyzue8LBfOxtEfnoICzxVg7Q8fhvabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUkRTQUOpK2l5eZy1zzqW+mxTNu0ZCipmk7i6pOAx5g=;
 b=KXi/y67N1UzzlZhTlzzbddn6Uhdde05x703/9SKmIZIq/aaUMNmOS0cBukdF37ypt07uRpZXL3UPfnvFQG1AAKVziIkYQzqfTI66C3S0f+I8eJMph3h0hm/yI6scqjalxrEtQeakz+F9MAZnXvzv65AqODBz94U2SQlyNvfafY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 11:38:55 +0100
Message-ID: <DFTCOGP65Q9O.3S2TVE18USSUP@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 0/4] Add Kconfig option to remove microcode loading
 support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <d5620135-5e91-4223-a0ba-c6876fb8702f@suse.com>
In-Reply-To: <d5620135-5e91-4223-a0ba-c6876fb8702f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|MW5PR12MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 5152f203-f16c-4d61-9976-08de58101f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlcxTTJuZ3J2cXdwbFNESnlTWTdRb2dZS0VzQzg3WHk5Y0NDSzI4eThEV3du?=
 =?utf-8?B?UE1jWTh4Mk9jVFlIdjJPdHNqYXF3UHBySURQVm5PVHJMeWpmdlE4dUtRcTlJ?=
 =?utf-8?B?ZENmU29FcWo4ODFYNGNFclhiZ05SUUtNZko4ZUtrVUdzdDNObWFUSVZ5aE0w?=
 =?utf-8?B?dnRGWHhNaGpIVlRIR0J1RElOTXM3MkI4Z0Z0aW1sNk8xYi9oUjJoWGR1K01r?=
 =?utf-8?B?UXRHRzg2RDRFQTlFZ1J6WHRSNHBxbEdVckNTWmNYTFdEcmZnaXVtQ0xqTito?=
 =?utf-8?B?Y2RVWVVBK2FEQmJwdTFlREh0MGVJVHdZQnZtL25Fekx5R0FVeE1PemwvQXBF?=
 =?utf-8?B?TFNzRmVjMjF5Nk04UlNzNlhoMk9MazV2U1lIdVZNRHdSekRlOHBsOE1UZVE4?=
 =?utf-8?B?VGtGdGxKb1VrR2lLdHZ4dDBXTmcyTG55bnBJK1ZWRm5NQWJ6NWpzYXptUWxK?=
 =?utf-8?B?QkVWR3A3ZEJIOFNpT0R6MElFdjhvYnFUNDkyT3JqRk42Mk9CUUFoZDYxWUNL?=
 =?utf-8?B?eHd5QWU0ZVlkdkpZcG5ackJWZWlKc254VzJpUHhXdTI0c3VBdU5tcUNucmVW?=
 =?utf-8?B?Uy9wWGdTS1R6Yk9CRVloU2xGaWp5YTZqR2lIT1F4ZXZyMk15MmpYc2ZjZ1dE?=
 =?utf-8?B?bmhMeWxGOFVaVTVBdi9zdTA4Vk44eDlFWjJiV0FHV3pFaHV4OFpkMGJ4bXQr?=
 =?utf-8?B?NzU3ajZEVGF4Wk9VTXY2RDdPbVlMNGZlR3ZVbUFiaTVRWjJSQ2ZCS25hRnBk?=
 =?utf-8?B?NlNXNnhrYkU5NE1kMWwvVXdaSVlCT3BBZnpUbnlyMkdQeTEzZlpjMkJPTnRK?=
 =?utf-8?B?ejBjai95RmtzUm9yc1c4Z2dvVUZ5SUZQSm5KUmNCZkljWWI1RlQvVXlhTjBv?=
 =?utf-8?B?bEdDM3RPd05UdUlEeE1UcVN6cG5WMWVqWlpTaDNlWDVkZHB2WUd6dk5XLytz?=
 =?utf-8?B?Rm1PN0JGbk4vU2tWUG1uUXhlV2w3Q3IvNk15ckRHMndJN01VMnJ0Skt5S0o2?=
 =?utf-8?B?TDkyZUEwYWI2MXlwV2J2VXBZOFk1NGpjQmFKYlFWQWJBS1ozWGJ5aXdmM05w?=
 =?utf-8?B?TDluVmJrL0JGSEdqZ0hGWWEyRzVMNUxKcDlWVzFiNHlhN1ZKQTU4VmhtSGh4?=
 =?utf-8?B?bmNCWEZpZUREVExLblUyQ04wUS9najk5RFF0UERPMnRhcDgzbW42ZEVCZFc1?=
 =?utf-8?B?TTJxTzJHVEdRcW5QbGRmZ04zTnVOOXRrSS8rZVdoYjF3MVZFc1NvY2FndHZE?=
 =?utf-8?B?dTJia25nMDdOVWllZXBoUTZMUndDOEVTd3Y0cVdRMmR0eEdVd0RYWkd3VkxS?=
 =?utf-8?B?VWsveUVIRy9JeWhnQ1krNlFsUHpIUXpNYWRoQXNIS1BiVXpiQnZYM0FBdzRq?=
 =?utf-8?B?UnNKQ3lyM2VLQlZBajJvc3haUG11b3NXajZ2YTB2WEJiL0MwT1I1aHJHandt?=
 =?utf-8?B?NElNWTFSZXFLQ2wrQWRtNFR6alMxa1hFdnFmWkNTeTlua2JmNjI5RG12a3FP?=
 =?utf-8?B?YXdnTnFnTC9oMUF6dDluQ2swRExKbmxnUzRFQmcxQkU5MktuaCs4aWl6Tmph?=
 =?utf-8?B?OWlvQmJrVW9MVmUrOG1GS0l3QzFWSG9nRzNuNlJSK3dWazA0Um9qRDExcEtz?=
 =?utf-8?B?c29mVmNEblBieW5ydG5MZWRRSExQUW9mcHFoQ0Y1ZnNRTDRFWkxNNU0vdS93?=
 =?utf-8?B?ZjJlcS9PdzNnT1FEWExOL0lzYVF2bEJ3Z2dYT1BrbzcwTVQxbyt3cmp2em1E?=
 =?utf-8?B?Rms2cmxXcm90akJVa2IxUnRJOVJvbzRwd21hb2JiQWtkczd5WEdwTlM1QWRK?=
 =?utf-8?B?encwS09nSVV4dkRZYndzS2hCVU5sMkhVSDZMSnl1QVdxYWdtL2dhU2RRVGgy?=
 =?utf-8?B?MDY0ZVljamllZHlTaDVnY0ZFb3NmaVNDSmI1US9TSE9sd2Y3ZGpSNVQrd2R3?=
 =?utf-8?B?VXRJTHNhcjBwTFMzNE9TdzZHWFNLbGMrRDRSWEI2VkVjWUVlZXBWWGlYbGdj?=
 =?utf-8?B?UzRGWjM5a1c4dml2aS9oS00xeWVPUVBGY1BTOXpUVC9SNkhGMnFRcDFKZExn?=
 =?utf-8?B?SHZ6YUlSelJpTFRmanM3RzBzem1GSGloN2dMQzV5bzYzTEFaenRZcDBldmVa?=
 =?utf-8?B?QTBTSTU2anVLTWJCWFJKd2wyRGhYdDJtajJ1NkVvaDZuNm5kUEgrN3ovbEMr?=
 =?utf-8?B?cDBBRXZscnVhRFNsOHkwZmFhclRtUXpvNGlRVEQ1aEtPZ2Y0aHJOdmVybXBi?=
 =?utf-8?B?bW8wclpUWUVPdzFXclFIT29tS0VRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:39:00.3567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5152f203-f16c-4d61-9976-08de58101f7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5624

On Tue Jan 20, 2026 at 11:20 AM CET, Jan Beulich wrote:
> On 20.01.2026 10:38, Alejandro Vallejo wrote:
>> The only dependency here is patch 2 going in before patch 3. Everything =
else
>> can be freely rearranged.
>
> Is this correct? Didn't you say (confirming what I observed elsewhere a l=
ittle
> while back) that there's a complaint when a file listed in the exclusions=
 doesn't
> exist anymore (which may have been cppcheck, not Eclair, but still breaki=
ng CI)?
> IOW can patch 4 really be separate from patch 3? Or, if its description w=
as to
> be trusted, wouldn't it need to go ahead of what is now patch 3?

Doh, you're right, they are out of order. Patch 4 now just removes the excl=
usion
so it's fine to do it separately.

So patch3 <-> patch4.

Cheers,
Alejandro

