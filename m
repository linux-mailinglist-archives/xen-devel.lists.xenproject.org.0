Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3AACF54F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007263.1386578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEKf-0007Dx-Ka; Thu, 05 Jun 2025 17:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007263.1386578; Thu, 05 Jun 2025 17:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEKf-0007CB-HM; Thu, 05 Jun 2025 17:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1007263;
 Thu, 05 Jun 2025 17:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNEKd-0007B4-O4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:24:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2418::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8baeb5e-4231-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:24:45 +0200 (CEST)
Received: from BLAPR03CA0088.namprd03.prod.outlook.com (2603:10b6:208:329::33)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 17:24:41 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::a0) by BLAPR03CA0088.outlook.office365.com
 (2603:10b6:208:329::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Thu,
 5 Jun 2025 17:24:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 17:24:40 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 12:24:39 -0500
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
X-Inumbo-ID: f8baeb5e-4231-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNWRAQhcgyxgIcmjrzglXaR9o3AY0a84Y48CMFUSvkd79EP5InWuRsCaqNzfQ8/MVM8MTs2Wtl7PppqYuSqPVGV9tfv8NIz0WERy0BfCmMwpcFtAElYrkXU/NJwQQ/HpiuVR3vsGX6LifUItEqqM6+r2KVx3wOSYlO2/0zErEMGrG/olnmyu2EWBLru1GH7Kb5lpfFiAMMAYDxEpzpBfBGgsEMht/wWFLDy/MviDZQl9KEQPq+jvPiBczwehUJqo4UWVs8OTeGdVjHQFAFqUy4goFnoorl2hytGbbzAJ0ss8WYdFLD/3wzjBJH0vlT/keCuW0BFmGXxqI7d392sNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpmexu2+sCiQj18H24S9Ey/Mz6uQd491ofVzFdM9REw=;
 b=hJAWF2OV1JUYPuQ3EuzGrBiUsKc0EZk4WywGcWWsOXI6xq0VKNMuLyWq2bfk33RQY6aREzRM3BewEuC+HPdNh7og1Fc0TKXSejiVX+pXsFvD6SAtat0wWMPOBO71AC9BAYYUVO6FdkhfINb/6/fgrkGB8Ju9D1PYS3xmdeaecLsYsNz5plRcgNoEz/THZ7RqH3jLIutbPWx5Ov3oCBBhIiT9NdEJlQDdOtBqXQt7tIK0hCMRDAoMflFaqZrBHq3cA9fOAFBS1o6wdG0YOmSnm5NI3rqE1ZRMG2KlpeAHm7Vwrn2hQudBykapuIgOmVxdx5nD/Xt5blVJZeYp0Tw1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpmexu2+sCiQj18H24S9Ey/Mz6uQd491ofVzFdM9REw=;
 b=sghFNBv1Md8MFvMsZFs4zecYA+/3RwT8NxcXutVUM6XzPbzAMUsamufuYMfrtUMiJ41cZLf7kCx9dUQ7e3Sksqp95l7ZOlH/il1G8GNgcirZm47JTgBuwD5/vsfmmK5K2jXgSzFtkUwxRygsEuz1Y4GH5VwFHgwb6YwM1wkZyxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 19:24:37 +0200
Message-ID: <DAERWC6PNNIL.2KAG1NVW9VHR9@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 09/19] x86: Preinitialise all modules to be of kind
 BOOTMOD_UNKNOWN
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-10-agarciav@amd.com>
 <2548f9a0-76f8-4e6e-8330-759b118b777b@suse.com>
In-Reply-To: <2548f9a0-76f8-4e6e-8330-759b118b777b@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: f9591976-8117-4f52-95a6-08dda455dac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0VEVno2RVExWXNTbU5VWGtURVVlMlF0L3E0RTFBWFBnaWdGOFh1eXBsN01E?=
 =?utf-8?B?U1h0dEpoVFlTdVcxMmY0bzE4QWQ4NjA1RXJXUjRzdGIxeXU0MnM5bWdkTmxw?=
 =?utf-8?B?ZmdoOEVUTElCT0dqVVdrMnplTlRPSkZrL1pRNVhvYnhra1VKRm1yQ3o1R21l?=
 =?utf-8?B?UG1meEhVaHp1ZktHK3BSbWRNY2RQNENwaGk4WURpVUNvUWExbk84WTczdkVi?=
 =?utf-8?B?TzVDdjk5eVBOWWQwaVRXNWZnS2I5MEFheGtGenRBVlhVNzdwQ0JMMWVISm5C?=
 =?utf-8?B?NkxUbDdhNytzSzVrTDhLc2pxTC8rZzRKVnBEVXlKWU1nTjJ5T0F1ZDlLeEZM?=
 =?utf-8?B?a09HS2tQZUxxTDhzUjRHaWpVS3FWRVRiME1RMWhueVkvaTM2VWh6ZlNRbWV3?=
 =?utf-8?B?OWJ6UWhaOGJ4YUJqWmhFd3Rzb2puSFFSc2xTZFRrdFl3OVA0Ym1lK3BzT2R6?=
 =?utf-8?B?MWpUM1o2L0tXNWQ0WkZRU3RuWk9vNW5keE1XZjVVc281ZkJWa3lrd3pFb0RM?=
 =?utf-8?B?SmtONTFWdGtlY3VDZVIwSjRVUGw0MndZaWVqL0s1c1czaGxpckVQWitPclIw?=
 =?utf-8?B?UGVhRWdwUENTWGNOL2twQStxdS9reCtBelpUYzRUTi9ZN2NYU3F2cXd4aEJw?=
 =?utf-8?B?MVJwaTBQZE5uMy9SVlovZ2pHSkhudWtTMksxbFlwU3ZCeFQwd1N0YzB1QkRs?=
 =?utf-8?B?SGN6TFJka0s5M01Ncm8zb1RlR3F2NWduOVdPSHdXL1QvUXg5MjhYVVZaWWg4?=
 =?utf-8?B?WTFSVFdXbks2MFVQUWM0cDd3aDdySk9ncHBxRk03WitsTUZuRjl6UTdpRC9B?=
 =?utf-8?B?Ty9HNi9hOGIzYWVxYWJIczBYTXJ4YjgrQmRhMWdMRGNKNUg2dlJSWVdWYXcr?=
 =?utf-8?B?YVJmMDBDcG5wbzFnUklmUnNTVi84eEdwalRqdzNrVzEzQUNUcjlua2o5ZUMv?=
 =?utf-8?B?RTczUzRVbWV3KytwMTFidHExNmVBT2hDTmM5QWNyWEFNSlRLenpOSmRpYnVv?=
 =?utf-8?B?Zm53cWFtR3hzT3hNNlVRVEdPcEsvMFhRQzgzVGRhT0s5akNOR2VYOXpMcVhp?=
 =?utf-8?B?WFFBMDhLOFA3OHlPL1dPYXNYMHkya3dwQnJCcUhJZFhBT1NHUGtHZ25sR0hx?=
 =?utf-8?B?WVcxSGM5Sk95QVk4eWRiOGZKSmh1bnliWFJZZEkxckZrWmFtSjNYUm9RMmd6?=
 =?utf-8?B?emM5ZWtPSGJjbUM0VWRwa2Z6bFlkcWRCK0kxZDVDKzVFOXRSYWhWWEFOQlM3?=
 =?utf-8?B?MHR0TllvbE5EWWM5Z0x4K0N3UTdLdU80bTJkL1lXdmE2VGp1RkJIemR6NXI2?=
 =?utf-8?B?Z0VtbVJNSXQ0TFJHS1lRSll0cWdVbWRQdExhcng0RGpna3RJL1FxQ2FsZ3lw?=
 =?utf-8?B?ME5PeHY1OHJHa21aaEN0dHgwaDVyblp2Q1puWGZrMGJCMVBtY0NkdWc0eVVl?=
 =?utf-8?B?MWhsZzBFR0NhRU5KdTdlZVo1czFhejc2Z2Y2aHI3aU5PTFhCOWRQTjAwYTVH?=
 =?utf-8?B?cHROUll3Y2FMT2xPYnFiaWRVc21kc2lrK0gzaU1EbFJ2d3hZanlmcnR2OGx5?=
 =?utf-8?B?U0R0RUFabG5ydEh4a29WNE5MMWQ5SnIzK21ITlJ0THgwTFFDd0c1ZWtjM2dX?=
 =?utf-8?B?MUM2cGtiVDJJTzE3c01OdU1ZMGVwdVlZaEhOL2w2QlpZY2lFQ0FPTVhFaDRF?=
 =?utf-8?B?cjRkeU9ZYitaQ0crZmZSY1puS1RYWVZyTlRFSXVIZHo5NjhXSDB6SmJrcDJk?=
 =?utf-8?B?NThnU0h5QzliVlp2NGtid00vbXdlZUY4TDh4cXJaaStNeUptUUlJbDJvMk9M?=
 =?utf-8?B?bnE0RjRrcStVUWhKR0RWMmk5MnhpaFVUYlhFcUY1YWk5emFpNnVmYjZRU2Rx?=
 =?utf-8?B?MjR3bytYREhYSCtLYkxkbTZxNTU5Q0NHeXlIU3k5ZUxaekp4dDdWOTg3TVhF?=
 =?utf-8?B?M1o4OFV6N010aU9adVBqdllVNlc4dGhkQ1lqMzZKMExaQzl5c2JUT3ptMncz?=
 =?utf-8?B?OVpmY0drMVNrMkR2YXM4UTBkdUlqWE15YWJPT0c4RXM4ejJSM0p1WkFhTHpU?=
 =?utf-8?Q?QaCNbI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:24:40.5527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9591976-8117-4f52-95a6-08dda455dac4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425

On Mon Jun 2, 2025 at 9:55 AM CEST, Jan Beulich wrote:
> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>> A later patch removes boot_module and replaces its uses with bootmodule.
>> The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
>> value, so it must be explicitly set in the static xen_boot_info.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/x86/setup.c | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 1f5cb67bd0..5da9df33c9 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -298,6 +298,7 @@ struct boot_info __initdata xen_boot_info =3D {
>>      .loader =3D "unknown",
>>      .cmdline =3D "",
>>      .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D { .domid =3D DOMID_I=
NVALID } },
>> +    .mods =3D { [0 ... MAX_NR_BOOTMODS] =3D { .type =3D BOOTMOD_UNKNOWN=
 } },
>>  };
>
> A brief comment may be nice, to help readers understand that there is no =
off-
> by-1 here.
>
> Jan

Sure.

Cheers,
Alejandro


