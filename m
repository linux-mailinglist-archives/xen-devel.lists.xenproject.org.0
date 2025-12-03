Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5CCA0449
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 18:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176978.1501411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqK9-00067q-4A; Wed, 03 Dec 2025 17:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176978.1501411; Wed, 03 Dec 2025 17:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqK9-00064l-1T; Wed, 03 Dec 2025 17:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1176978;
 Wed, 03 Dec 2025 17:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1HU=6J=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vQqK7-00064a-NT
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 17:07:27 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8846d46c-d06a-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 18:07:23 +0100 (CET)
Received: from PH7P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::33)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 17:07:18 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::25) by PH7P220CA0033.outlook.office365.com
 (2603:10b6:510:32b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 17:07:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 17:07:17 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 11:07:16 -0600
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
X-Inumbo-ID: 8846d46c-d06a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C64aqkEAYSijQfC61tSU8MA4NZWmnqG4JWZcKThiJB3IX0F6j94mHffgtLP6pbxPbCmgVq62RcN9a+gCpzADolF49zbqGfI4UMDDuqeXRYqXdycwfkJnLYaQxDLMhAPaoT1gCoDbih40I6fybby/lCwI7AEUWvcOsWulLwp3n4hO+nehEYeZ8tdiGdGEx+dz/wap4QLhoXSfa2kEEmVEVVGLRrXLwRTNcD6Xs2cZGAd3RP7qFR6XWS0XulggwXo2OdWnZXQOeF+bqjL6ONTcwGwtoc1IreuqdYI2zchZYY9UC+KuJMFSoZ9FvQrnpUCAAxUwSvSqzDwlO7qTBWWtsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdQjUmBHbThEu3wLwnA+hvhbsUwyLXlz/w2W1XAjPnI=;
 b=GoKp3/BRT8z4BjmHjgNX33ilqomimEpcbvdMnwQ9WHbATUDraB0iAvgD3GhKcHooG0QRgrzR4hmXi24hOe2AOKgDxasHtDvafy1Hh2RfyLMFegoOvhVwtoAua7EjZUVkdHbKp1n8US8kQ53UmKHJrOUQlQ8vw2s1BisfycAcipQz0LfMMatU8Z9teAQnggF3ehRtT8zHH4sfD7THtH9Zs1IXsYPWhPkDYkHMpCwARtA6D39I0r7pPR+M5WTQxA/Giw5ODpiPWoi1J4gICRjPMrtTJ74PdvSx5qI2ujTIndGCikZi1IEqBoQmOhXpRgVQqOa65nd+84CEHt06ynuOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdQjUmBHbThEu3wLwnA+hvhbsUwyLXlz/w2W1XAjPnI=;
 b=vfC8HejQQy2ElEGiwtY+yU3wQi+lkCq1WNf944kOL+svRzR/Pa2KBj/engwuIeioHmjwMq67ihc8NdFrNS2/lM2Plmt2GuOgOvv36Zl98xw0LdQ/Wc8C6ATEiYuTNM79ceCXLWnuYkuSa5w/NON2guRWl/fD9T0cZNjBToT2tCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 3 Dec 2025 18:07:15 +0100
Message-ID: <DEOQVMZ253US.Q734JQ1TNWZ9@amd.com>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] x86: Limit the non-architectural constant TSC model
 checks
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Kevin Lampis <kevin.lampis@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251203160618.91883-1-kevin.lampis@citrix.com>
In-Reply-To: <20251203160618.91883-1-kevin.lampis@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|MN2PR12MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0727a1d7-95cc-45fe-3cd7-08de328e6a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjEwWXJSZEpOUDIyWWZ0YUtSMnc1ZTBhRGZRZXVobUZtSWhMc3ZKQUtYMzhu?=
 =?utf-8?B?T0RTY29ScHBuVmdycU5ZWld6VXMxbkNDcnVUSGg2a05wMWFvUGJnMjFGZ0ox?=
 =?utf-8?B?LzY4ejlaM3lSa214QUVHbEtRVVpaWWR3VXFoa29ZMUZMb0s2Rng4QXg4MVUz?=
 =?utf-8?B?N29Fb2V0VThqajhyVTFVb294ZWs3ZWN0eDFWYmYrMzhkcDBBTTNSUzAzV05T?=
 =?utf-8?B?a0FMeUJ6VmpxMHlOcE0rVSsxMmlReFR4M3BtV2NKM0tkQjUvQkNibFlSOWZU?=
 =?utf-8?B?enh4TEVOcXo0MVdOSzBDdEk5ckluYzlHU1pQTGx6NjlhaFZycG15aGFMVHV5?=
 =?utf-8?B?ZmVBcStBbWNWVU9oZE9Ec1BGam1EVm1nVHRPczhiZmdtdXc0Z0V4SEN6R3Rn?=
 =?utf-8?B?UUtXb1N0WVI0b1A3MnhRangyRnhFVlBzL3FDMnpuNERnY1NjdWJpSmphdGRh?=
 =?utf-8?B?bEdsVVBBM3J2REYvdUVPTGtyajlOVEJxeFJzOGh4R29aRU9ZUnkwYVJHL2sr?=
 =?utf-8?B?OFhuWjgzL05oaE4xZUlxSk0reGZLNVBONWUrZG9RUm1NTHFjSi9QRjQyRXJy?=
 =?utf-8?B?alB6NWQ5QVF3R3VHVDdJZEhYYXpUOTJnQUEzZWl0K2Z5OFdIMlhhYzFZQ1Jp?=
 =?utf-8?B?eG9pQis3a04zbVh2eGxjQnNkeDRVNldKajJxSElrQmZQSDZoRjRUT25mSml6?=
 =?utf-8?B?UDRaMTV4MDlFR3ZpMThjbVRPbW1yVFBiN3V4Rzg2UFZMYlNaTFA3QXFRY1Ir?=
 =?utf-8?B?cXlCc3RLZWFhNmNNQk92REswOFdrbmxyM0xkekNjWU9ySjJXaTBzalBRY3JF?=
 =?utf-8?B?cmhHeC9uM3FVZFZhdlBsLzRteTZvYjlNK1U0ZyszeGZNU01Ed04xNDVWVXh2?=
 =?utf-8?B?Q3p1VFdITFEyS3E5Tk1pYmtUeTJ3OGw2Vms3RzhQZnN3UGszQkl0TFBiMlh1?=
 =?utf-8?B?YWdrUlA2blVmR1IxeHkrQWZtNUJBUHJPOTJkcWoyOVhyaWFlK2hXR0I1YW1s?=
 =?utf-8?B?U2l5SWNBeW9HKzZYTFRDdTBycC9xV3Y0TmhRMG1TRWgyZWFJYTY2cytoUDk3?=
 =?utf-8?B?dXFSS3U0WVVXRXJOL2tOSDBhWThuUmdSSXl3bXhGU2pWOTVpT3VPWlN1VnJh?=
 =?utf-8?B?MmZyUjQ1L2FDcStHeUNqQW5HS0NzeGhQMi9hNldkWTJ6ZVpHaDFObHRwSE9P?=
 =?utf-8?B?RDkxVDF2NENtakFWcHBERVZRZ1NxbHNES0R2d2NDWTNjZmk5V3JPMm1rRGhu?=
 =?utf-8?B?N0o3K0YwMnpPQzdYQXFVOXZMVTJ2SlBiQjlEY0Y3MDkvanNUM3ZiaElYdTcy?=
 =?utf-8?B?WjZKM0RpVGlQMWUxbTQwUG53NHQxZHN0Z2QvdFRMUzIvcGZjUXZuVGNtZW55?=
 =?utf-8?B?dlF4c24zQlpIRzY5bzhHQ1FuTjM5eVdZWGsxVEhBOTRIR1UyZXBuQ0JKWUhn?=
 =?utf-8?B?endqSDhzdjRKc0JRUVRhNE41ZlFhbDZTbDc4cnEwRzdBYnZhYWpFY2ZCRjlo?=
 =?utf-8?B?UmFlOUl3cC94TkZDMm85WTlLWkRDNlFuNFZXNFNPZzQ4RHZHOHQvWFkxWjZR?=
 =?utf-8?B?V1hDUW1CaktPY0NiN05DNFJNWVlXMDVNQjd4Tmd1Qkt6cGJheWptalZvOVlS?=
 =?utf-8?B?TEdCVGVQbnVSRXZKb0laSXZuWnBJQ09QNUJUTHRWcTRsV1NxVU9GQ3JxT0Nt?=
 =?utf-8?B?TEVtZ2VkTEV5U09yZzJOMlJXbkV6bkc0czJuUjZmRm5lZGxvdDhKVEZ2YTF6?=
 =?utf-8?B?R3U3L3M4Y3RqMDB1QUJyTGQ1WnE1c3BIYnE4YVc0QWpza1ZhSWRoL1B6eDcv?=
 =?utf-8?B?QXh2R29nZUsxYndrSFRFcmVHYXFrSm91dWN5c2c2ejFKc0s4dU9VRW1MaEwv?=
 =?utf-8?B?ZGdwMEh0eUIzZW9OTHdqMmFxRFM4RkNrWlVFbUJ3ajV0a2g3Kzh0cWVHSzhE?=
 =?utf-8?B?Z2VSLzFrRytkOGI1YUM1QjBDS1FwL0NtUnVUSlI0M09ZcG9PYTFIR1hTVFVB?=
 =?utf-8?B?S3YxZXVNT1JpU1hBNzJRM0tlT1NkZFhQSTA1b0NoMFgxU1FQZUpHTFR6R0cx?=
 =?utf-8?B?aWUyZnk1cHppemNQUlJlVkkzUEMvakFFSHRBMGdIYTBITXFQcDhxK0QxVjQ5?=
 =?utf-8?Q?kUEM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:07:17.9230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0727a1d7-95cc-45fe-3cd7-08de328e6a1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437

On Wed Dec 3, 2025 at 5:06 PM CET, Kevin Lampis wrote:
> There are some older Intel CPUs which have CONSTANT_TSC behavior but
> don't advertise it through CPUID. This change replaces the previous
> open-ended check with a definitive range to make it clear that this only
> applies to a specific set of CPUs and that later CPUs like Family 18+
> won't need to be included.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
>  xen/arch/x86/cpu/intel.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 2bb9956a79..1c37179bc5 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -673,15 +673,15 @@ static void cf_check init_intel(struct cpuinfo_x86 =
*c)
>  	/* Work around errata */
>  	Intel_errata_workarounds(c);
> =20
> -	if ( ( c->family =3D=3D 15 && c->model >=3D 0x03 ) ||
> -	     ( c->family =3D=3D 6 && c->model >=3D 0x0e ) )
> -		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> -
> +	/* Use a model specific check for some older CPUs that have
> +	 * constant TSC but may not report it via CPUID. */

nit:  This comment, or some variation of it, should (imo) be inside the bra=
nch
you add instead. Also, multiline comments follow Xen style elsewhere in
the file.

>  	if (cpu_has(c, X86_FEATURE_ITSC)) {
>  		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
>  		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
>  		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
> -	}
> +	} else if ( ( c->vfm >=3D INTEL_P4_PRESCOTT && c->vfm <=3D INTEL_P4_CED=
ARMILL ) ||
> +	            ( c->vfm >=3D INTEL_CORE_YONAH && c->vfm <=3D INTEL_IVYBRID=
GE ) )

I understand this is code motion + macro usage, but it might be worth gatin=
g
everything by !cpu_has(c, X86_FEATURE_HYPERVISOR). Otherwise you risk getti=
ng
your assumptions wrong when running virtualised.

This might be QEMU TCG, or other shenanigans with live migration when runni=
ng
virtualised and subject to guest-unaware live-migrations guest-unaware live
migration.

IOW: If you're running virtualised and you have no ITSC it's probably becau=
se
your hypervisor didn't want you making assumptions about it based on fam/mo=
del
checks.

Not that any CSP would use those processors, but my point stands.

Cheers,
Alejandro

