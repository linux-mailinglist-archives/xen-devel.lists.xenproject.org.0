Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F787A88BFF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951251.1347349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PEM-0004wX-KZ; Mon, 14 Apr 2025 19:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951251.1347349; Mon, 14 Apr 2025 19:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PEM-0004un-HZ; Mon, 14 Apr 2025 19:12:30 +0000
Received: by outflank-mailman (input) for mailman id 951251;
 Mon, 14 Apr 2025 19:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4PEL-0004uh-7n
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:12:29 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2412::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 665782d2-1964-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 21:12:26 +0200 (CEST)
Received: from DM6PR11CA0033.namprd11.prod.outlook.com (2603:10b6:5:190::46)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 19:12:20 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::7e) by DM6PR11CA0033.outlook.office365.com
 (2603:10b6:5:190::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 19:12:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 19:12:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 14:12:18 -0500
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
X-Inumbo-ID: 665782d2-1964-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxrJnQ4FGTlpR5o25I+oefC87vpXeBdesxfIYfD/kscRV5S+tB5ti0dMV2BieiEYLsRSAeK6X5uhjRG63bMwZrgZaKMePxwE1Iz4C2EeQp/tfMYJh4fi3KvUXlIrWspuhedRMkoC/dd1bEVq1oAsMDgBZbS/cVvcRV6SyfTeWCP6qfq/XyWszIsbIUY2fxng5V1eC6tsCYrIC7CyD/P4yPJ07s4x1gFW6IS/YnHAWBvyIUzvkgds2RK/K5bSIV7S7FZticGmcU8ShnHDmGqsFl0qFOdTuDUk3jWRhX6PDhaUkDmaP9O9nmCjXqsL92s/gDNg8KLKHMHDtLLL6mmDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/dBCQNIEY1Zf5BiUnfHn+bavnDnFJgkzYF7mcfJGSs=;
 b=plDJ8nfhUsL/c6quk3UlUXt6sKiD49KqUxeOhOexEoL/dPZrdf7S+dZXeFLuk7uMXcM2n7ASJERiJrTiBofDk0QrVj4uC/kkUXhUkZarNXGGSYPPYWvR+sKQpmttC4PNsghhil+Uw6pR90LQ/9sap0aYmZjrLogEeV1NZUtGdWVTTb8UrwO/0xCu7vcjOYg1EDTbTcjiLBODkAJ65BaWxrsK305ANSwmsjwDYjk9sF8DOAzGVEOMJ5sg6kdYIfQdbr1opsm8B5ZRplg7xl29rR/lLzK3hU5t32BDBGX/9FbjC0DGuHK12/K5SHF016QubjfLQB2WWlpm2VHLoIQegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/dBCQNIEY1Zf5BiUnfHn+bavnDnFJgkzYF7mcfJGSs=;
 b=1qhFOGDOE2BlAUpeJQcaMoUMap9D9v/iymOtJAMEKTJ6DKZ3fjLseutLTkqB+bJhcC/qzqMG51NUrWV8Boa9ToLeLQvElGI6WmvGVOMthrWqwlAPnUmh54lLaqDWFQ3cHqX/6gahUbXH3g8FVLnwbS0kDqh1zrL/w+qtriv/jkY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 20:12:17 +0100
Message-ID: <D96LMFYIE1I7.HKMK9UZR2KIV@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-16-agarciav@amd.com>
 <c1e5af91-8f84-458d-a9b8-ab9758b5cbce@suse.com>
In-Reply-To: <c1e5af91-8f84-458d-a9b8-ab9758b5cbce@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: eee1f85d-51a3-4d58-6bfe-08dd7b8847ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTlpZkxLb3RxZXd6azFLRm8zSUVhcGVKeittdzRKYXVYSXd6bk1CTFZzMWZX?=
 =?utf-8?B?SUlCQXEwS0E0dmhnSU1ZTW0vVkc0YlFkSTFDanU0bnJ1OEVNZjJEWk1WeUhY?=
 =?utf-8?B?YWRCU0dwZHkzMTQyQWtvY21Pcm9FZWJyS0grYUhYZU5rQnc2a09zdVR5NTdq?=
 =?utf-8?B?Wi9zMllVYU01Wm5PRzRNdTVTUFVyODFjVTRITjFOM1ZVKyt6K2lFcXd1enhp?=
 =?utf-8?B?WW0zMzArWkR4dTVOZXo5MmRvSXVoMFF4azhUL2dyUmVRd09PMjl5Sjl3MVE2?=
 =?utf-8?B?MkF4cnY2NUg3Z2d0RnVPQVVyYldDNnlYRkx5K2ZHYXRSdHRsUC9MalhkQktp?=
 =?utf-8?B?NW5Wc1Zxa0xVREFKak9GNjJuNzBQZng5NkVMTGRLSk9NRXlFUk1hNW5oSzN4?=
 =?utf-8?B?OHAvZVRaNVJsMVBGUDRpNVlQVHNWQldVRVlNMmIreEduT2g3aGx6aFVCL2NQ?=
 =?utf-8?B?MUhhQytUdElSTHhiSTExL1dMOW1pY0k4L1pKRWl2UUFGbWdpNFpQczNZRmZm?=
 =?utf-8?B?MGE1N29HU2MxSlUwUHgxenVlUGkzejVEa04ybTRKZlczb09qSnk1VTV5cy9E?=
 =?utf-8?B?QU5BbVhONUZoUWRXVGlnbHB1djkzaDRVZ0Z1WVdZLzR6b2NoNFlJQUp5SlFm?=
 =?utf-8?B?SFVCeGxZMEZXMUpmOGtaQ3ROOVl4OXcvQ3NyakJZNlE0RnE5SU95ZTFBK3Jq?=
 =?utf-8?B?enhROFZTSWtBTnIrc1hKMW1RSkN1dHBVWTQrM3F6bEhSSXRJSVlia0FMWTBo?=
 =?utf-8?B?WXZlTHVmZTBVZ0ZxZEVQWVhCa1Y2M3VsWE1EZUgvajJxZUgyRStzajhLTmxh?=
 =?utf-8?B?aUgzcGtXUVk3Z0hpVFJ2UXhsYXBpbjIrWTlIQUNpc0NqUnd5WGVtVnZzSjRi?=
 =?utf-8?B?Q3dEbzJWWnNPOGdEdDY2bUZOeDRNZUZIa051MU1rK3FEWE53ZndwcUd1NU1U?=
 =?utf-8?B?SFpyaHpSbjZRTk90dzVoeEQwTW9RSWpKbnZVS2lFRGlERysrQVZCZWc2YUtH?=
 =?utf-8?B?ckNpMGR2c1VNNmVCa3ZpOVNOMi9tQlBYdU9QVkRLY3JJNTdOSWlYd3ZuYkgv?=
 =?utf-8?B?eFF6MUd3VzFUSHZHM1JJUy9rSTNtSFlCYXRQR3N0YlhCaHZRL1U1d0VYK3FQ?=
 =?utf-8?B?ZHB1ZEtsRnR6L3FQMVRMOFhzY3VkTWtEcmhkNWtqMDZTZ3FIRmtJa2tqRi91?=
 =?utf-8?B?MmRkd2NUcHUyMTZCam9mbGVjcFZvZ0svU0NZZnBWY0pTUUxCUnUxcTZuM2c2?=
 =?utf-8?B?QWhGaWQreVU2b2QwY3kzWWZVNEN6ZkpTUGs1aXRJcFErdWVqVm9ncVpLUERY?=
 =?utf-8?B?NUx0NlFRTHVDU3BpUFQwU0ZyOTdra1NHUXgrcndrcW9tNGZOUmVHcmpscDhi?=
 =?utf-8?B?TDYyYzlzUUVsVnc0aXc4Qks2dW01NzVaREFUV0lWZkZGNHpIUmhUYkRpVjVW?=
 =?utf-8?B?SWlJYndyWHpqTzdlUmxoaGtVTnc1THhRREJWcFRLN1NnR0JEU2dtbjMwWVhD?=
 =?utf-8?B?Z09DRjY1ZGpkbFlBSHhHOGQ3RnN6WGhhUGZQMWNEZWJKczVzeExkWE9TRzFW?=
 =?utf-8?B?Z0xMUkY2RDVoUkVMa1B1elJEK0JycDFXQ3pNMVl5ZXFPWUZScm96V0RzRlhO?=
 =?utf-8?B?K0VONDhMbW5FRmYzTFA2d056RFAwNHRtZDR2NHZ2UWgxYVFaU2gvbXk2bk1o?=
 =?utf-8?B?d3JFN1UwV3c1bWUvNkdwTW1JV1MxMXdRV2wzdDVSNldSbXp4cVllM0ZaU2hr?=
 =?utf-8?B?ZzlGS3VRUDB2L1Y5cGRLbDUrOW90WmRhTWVIWlh2VWVSdEtQMTQyNVowU3B6?=
 =?utf-8?B?WU9QK2NHWXUrUzI4cDVMdFRtaHpqcE5Wa2RBa1lUaENPYlBsclcxbTl6YSs5?=
 =?utf-8?B?VGdaYURobFlnMzBUR3ZoTEhjTTJ6ODR3eWhhSmJKYXIxZEs4dEk4THZmUldU?=
 =?utf-8?B?NTFhMTRkUCtWcmRxZjh6d0JjQThNbDdXRVBuTlY0SkpkaUJsdGhGWGUxaUZI?=
 =?utf-8?B?akVGU1pVd0t6Nmw4b1JYam1Zakc0VHBPSnJQaE9HaTN1djI2c0lhTzEveFZX?=
 =?utf-8?Q?nc+AU3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:12:20.3922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eee1f85d-51a3-4d58-6bfe-08dd7b8847ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383

On Thu Apr 10, 2025 at 1:08 PM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the `cpus` property, named as such for dom0less compatibility,=
 that
>> represents the maximum number of vpcus to allocate for a domain. In the =
device
>
> Nit: vcpus

Ack, and same below

>
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -246,6 +246,17 @@ static int __init process_domain_node(
>>              bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
>>              printk("  max memory: %ld kb\n", kb);
>>          }
>> +        else if ( strncmp(prop_name, "cpus", name_len) =3D=3D 0 )
>> +        {
>> +            uint32_t val =3D UINT_MAX;
>> +            if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
>
> And again the same nit.
>
>> +            {
>> +                printk("  failed processing max_vcpus for domain %s\n",=
 name);
>
> There's no "max_vcpus" being processed here; that purely ...
>
>> +                return -EINVAL;
>> +            }
>> +            bd->max_vcpus =3D val;
>
> ... the internal name we use for the struct field etc. The user observing=
 the
> message ought to be able to easily associate it back with the DT item.
>
> Jan

Very true. I agree, and will change accordingly.

Cheers,
Alejandro

