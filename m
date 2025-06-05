Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD9ACF07F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006858.1386112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAeF-0006rQ-FQ; Thu, 05 Jun 2025 13:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006858.1386112; Thu, 05 Jun 2025 13:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAeF-0006or-Cb; Thu, 05 Jun 2025 13:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1006858;
 Thu, 05 Jun 2025 13:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNAeE-0006ol-HO
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:28:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:200a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 005a1ea9-4211-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:28:43 +0200 (CEST)
Received: from BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21)
 by CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:28:40 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:117:cafe::6a) by BYAPR08CA0044.outlook.office365.com
 (2603:10b6:a03:117::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 5 Jun 2025 13:28:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 13:28:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 08:28:37 -0500
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
X-Inumbo-ID: 005a1ea9-4211-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNwJlTdZhHkTo3UpTxYLZcMzrg8ohqmLO4A+x77NTmVpwSSILXA+Vwk2ecFiZMyqIsXGZ/1qxiion4yMRHfS6yDEEsNX9XvelwM2y3Rqy+rz2Zn8DLi79FdiXFVnVMb4OSwE75OER4n2r/pa7olCGOsLuj80Y0LWQ4QZ2QrYwzkS/hooVSDzGYATwAa2XqWxQwSchPk+c+a2VpQPL+PRGwAKsP+EpB3Hh+SerbmO9oiHYy3TW0oxCq8ETkb9zwMvYZQhNlfEspAEx55PJL4x9R9w+nDYwvWtXXJwlj2ZKntl5awxx9Wk/LyP+QQXhuDfZ8sMU5rSHUWZhouZhbK3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VFP+JQWBL2kdZ1IWem3gLR3G5H2pW8T/1NTwF2lUS0=;
 b=uoKisIqG0epDBdhUYkmeCsh++FbHo+Qy2BsOCnIJN3tZTWuBoprF5WkNMjJ18N+YWePO8MEBHukGnvbwBXkB6XExBDZm2DncEJkTBrN8NosQNHfD/NblGoCRcwxJgwb80frd27tJjNp+41yJoqnDlClCrHFmi447iDnElNZlsyKnM1Q7L5cYH7tQu+pZMV4JckZii3zQHmafrbmlEy4estKNdK0NDtITnoOaJWOZauuXNUG8Lt2iemd4lJzX4AVa7E6DLuZstMRRIYUZ4qHtb8SR2p/YNF8Hzax+kNzWuwGq3rzHSKe9po8keHFAs0HHWDvbGJ1wscYBj0c9WNK/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VFP+JQWBL2kdZ1IWem3gLR3G5H2pW8T/1NTwF2lUS0=;
 b=1RXpQGViKBx/BJzSgm0ymrCN5i8UNYwmvc1luq+cMqIZXZC8PeFTNo4vAMI2ZaJarZdHnvXn0a/QVl3gBe/pI+dneG8JoStYkMg0IrifoVArC00tOnMek8zZnlZAqfveR67Hjf7r4zj0TCL7s8RKWFFj2lor+5QgWIIS548Kp3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 15:28:36 +0200
Message-ID: <DAEMVMKAAYLF.1QSAMHWWQXL4S@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 05/19] arm: Remove dependencies with membank(s)
 definitions from setup.h
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-6-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301748170.1147082@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505301748170.1147082@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|CH1PR12MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f54999-ac11-4c5e-5238-08dda434e261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGJzNkhrYmcvMG8zY2hnVExFVHh0bEZzTUpYbEd5Z2VkT3dON0doNGVIN2Za?=
 =?utf-8?B?d09uSFBtNTdLTGFVK1FYZGt6VXZSbFlkMGFRM2xRY2FocFBidzI4eHM3Ri83?=
 =?utf-8?B?Y05pbzFmZVFXZWFBVTJwN2dMQXlrcTRUZFgycU45OUowTncrb25qTW9sNjdn?=
 =?utf-8?B?ZkhsZmxEelJiRExycVF2Sy8yZ1FOZ0JpRlhiMVBLQUNQNzVOTys3aldtWDR0?=
 =?utf-8?B?d054QnFEUmlLL1NWT0J4Nk9GRnNiNllNcFZpM2hEalJYc0RVbGd4RzYzQjRR?=
 =?utf-8?B?ajNRTWRDMHNCNnVsSU1WQkMvalpxbDUxVFpVbUVvck1RQWhoQnVReFdiSkFC?=
 =?utf-8?B?RmtkNWVWeWQwaTBDWVBxL1RqTVRzZnhCTk94cDJQaUQwVTNlRVk0OTdLUkVS?=
 =?utf-8?B?c09TTnlFV0VLb1hsR3d0RUVtNmpTdmpxNVhKWDNiQytNMWFVYmM5eXBTNFlr?=
 =?utf-8?B?Z2hyNDV2Q1JUbjUwRHpZb2p4SkxtVy95TVJ6ZXlDclhUTWdmckV2SytlNjRV?=
 =?utf-8?B?MkRVNURsUzY4bXVaUmswNUZwRTNGeDBwczBHN3VwdEZZNFFNOHFTMmtkTjlL?=
 =?utf-8?B?aVlLU2ZnSHdSd0QxbTJJSWhBOFNVN1VsNUNxY3NwOWhaU05HYWc5dDNGTUZD?=
 =?utf-8?B?NFdFUTdZdVBXcExkWFlDcVZSeDF2MHE0dHlEOGVINDV3ZlphZDh5STl6c0d1?=
 =?utf-8?B?QlpvNHptTWhIb01TbE5wNHhUcmt0di9aSmFRTVNOMUFBS0ZCWjJRNmdDRlFI?=
 =?utf-8?B?UDJ1YmwxY1lSZDU2K2tjaHZxWE1GUGc4R2VOQXNheE1aWVpzblUwOUhxNFFH?=
 =?utf-8?B?Z0lldmRFc2pHUDI2ZGtMT3A1d2g2Z0g2QlFEckhUQWdxWWZTQ1hmZWVDa0NU?=
 =?utf-8?B?MzRyRTVlVWdoVTV4cy85eDhJUDNLWHE5RjBQL0tUUFVjQ0ZGZFNyalpGT2JI?=
 =?utf-8?B?WWkyaFN6N2hlNXZGV0YvN2Z1OFZGWXVsZ04wU3llOUp3Q25sSlQzS1BjTS9U?=
 =?utf-8?B?UGJuZ2x3RXVwNG15VnRXMU41Qm9MbXFUV0xybzhBVGF6ZXRxazBpR0JSQTV5?=
 =?utf-8?B?a08yVnA5d1hlbVRHM1NRWUpiajM0R0F5bkUxWTB4MXRrRVNhQU9jUDF6c3pX?=
 =?utf-8?B?STBYNGF4bkJXR1loTUo4K0YrbmoyeUNhSWMvd1FkNHlXK3paZlM5dFdQc2F0?=
 =?utf-8?B?UTR4bFlxS3kzN2RxTWN6bjMrUENmcGY0ODNCVWlMbUxTVnBEcWdjNUtOeHJV?=
 =?utf-8?B?VWNNZkdpcXB0MXIrQnJWV1FEM0VmMVJQS0JYQ2VraGFBd2d5ZCsxUUx4VFBo?=
 =?utf-8?B?dUxtVzIzM1JLQTgvNHB0eXA0VVdpOXJSU3E0LzlDWjl0K2lQeDljaGdmcWJY?=
 =?utf-8?B?VjUyVXVsbHpVU1NYKzdNelRYTFFLVy93UzdJVlk3Q01RMVVLOWNTaVl0aHBt?=
 =?utf-8?B?MENQZmtIQmJyc2hYeE9XL1BqNW1RaDZHUG9qSFF3VmwrT0JHQWN5Tk1UdWVG?=
 =?utf-8?B?bUZKM3JlTXNFMkNSK1hFZUt5ZFVKbkdVaHo5UC9YZnJhK1BtTHlQclZWc0FL?=
 =?utf-8?B?TmlwY0hCYm5salBmWmRtR1BtUlZXTVFtd2Jsdy85YWlDczdGU0pENVROZjNj?=
 =?utf-8?B?bVc1QWlwL01oSWQySVd2SW1GVnFSZWoyUGZFU1YyTGpmNXpSMnVtelFjZ1FO?=
 =?utf-8?B?bmx6bHcyMHgyeDFQZm5VV0pJVUVkT1YrQW81c1NtVlRLMjZscWRGbHBnenZs?=
 =?utf-8?B?dGxmZVNUR3VjQ2tWc043blErOVNjSm1TR0QrbFpZSEJXZUNBbjY2M2pZTlk4?=
 =?utf-8?B?T3dONzgwVVdLN3Y1VGxzTUtqb1VJMW9zU3llZVNmeFc0WUd1OXR6UWZmMnhG?=
 =?utf-8?B?OU5ERm9pREYyT3BKTDE3ME1veWRVcGZVOHVnZU9EcW9IbEV5VzBjSnNqdkl0?=
 =?utf-8?B?RTl5VURDRmZ2Tll0SjNRS0ZJN0dPVGtOY25wdGxGWDVYVVlmNExjbnV0YW9x?=
 =?utf-8?B?d0llZEVNaDYxaWlzRy9RK09qRGV0QzFKdnB0Q3kvSGx6NnpucFRLRHFiT3pC?=
 =?utf-8?Q?8U+l8x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:28:39.8488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f54999-ac11-4c5e-5238-08dda434e261
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9575

On Sat May 31, 2025 at 2:51 AM CEST, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> ... as they can be forward-declared changing arrays for pointers in the =
function
>> declarations.
>>=20
>> No functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/arm/include/asm/setup.h | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm=
/setup.h
>> index 6cf272c160..0f9e531a34 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -3,7 +3,6 @@
>> =20
>>  #include <public/version.h>
>>  #include <asm/p2m.h>
>> -#include <xen/bootfdt.h>
>>  #include <xen/device_tree.h>
>
> This change breaks the build on ARM:
>
>   CC      xsm/xsm_policy.o
> xsm/xsm_policy.c: In function =E2=80=98xsm_dt_policy_init=E2=80=99:
> xsm/xsm_policy.c:71:30: error: implicit declaration of function =E2=80=98=
boot_module_find_by_kind=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>    71 |     struct bootmodule *mod =3D boot_module_find_by_kind(BOOTMOD_X=
SM);
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~
> xsm/xsm_policy.c:71:30: error: nested extern declaration of =E2=80=98boot=
_module_find_by_kind=E2=80=99 [-Werror=3Dnested-externs]
> xsm/xsm_policy.c:71:55: error: =E2=80=98BOOTMOD_XSM=E2=80=99 undeclared (=
first use in this function)
>    71 |     struct bootmodule *mod =3D boot_module_find_by_kind(BOOTMOD_X=
SM);
>       |                                                       ^~~~~~~~~~~
> xsm/xsm_policy.c:71:55: note: each undeclared identifier is reported only=
 once for each function it appears in
> xsm/xsm_policy.c:74:22: error: dereferencing pointer to incomplete type =
=E2=80=98struct bootmodule=E2=80=99
>    74 |     if ( !mod || !mod->size )
>       |                      ^~
> cc1: all warnings being treated as errors
> make[2]: *** [Rules.mk:249: xsm/xsm_policy.o] Error 1
> make[1]: *** [build.mk:72: xsm] Error 2
> make: *** [Makefile:619: xen] Error 2
>
> The rest looks OK

I see what goes on now. Later on the header shuffling fixes this breakage (=
somehow).

This is very much non-essential. I'll drop it for now and have another crac=
k
later on after the patches I do care most about get through.

Cheers,
Alejandro

