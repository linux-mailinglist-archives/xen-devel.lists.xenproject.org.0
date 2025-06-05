Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A1ACF55A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007283.1386609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNENy-0000Y0-Ia; Thu, 05 Jun 2025 17:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007283.1386609; Thu, 05 Jun 2025 17:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNENy-0000Vr-Fw; Thu, 05 Jun 2025 17:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1007283;
 Thu, 05 Jun 2025 17:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNENw-0008Ub-TX
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:28:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2412::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73ecbf1e-4232-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:28:11 +0200 (CEST)
Received: from PH7PR17CA0012.namprd17.prod.outlook.com (2603:10b6:510:324::12)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 17:28:05 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::54) by PH7PR17CA0012.outlook.office365.com
 (2603:10b6:510:324::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.34 via Frontend Transport; Thu,
 5 Jun 2025 17:28:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 17:28:05 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 12:28:03 -0500
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
X-Inumbo-ID: 73ecbf1e-4232-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slhFKtAi/znIfiSNnQ8DPwEk5K6l8KF3+uiAWRoJ41/3LJF2pOSvi6JCQKXJciNv6PatGq0o150MkFEsMrMmKNwvdElaAVZLwFJM9pudFfsW8iL+8J26l6UB0FDl7iAB2Yjpz56OKcxcpf4oPe/SLUjS8KVHFX0E9wqEL7yqL+Mtve0Vgab3hNeVb9e6sLwgZCfIp5HrZnKo4rOVX+TUfNyOY5XCpzyYgfaoeOUcGgvypA8o0r6r4BPKA0Jy9Mw7ml+RiOKWcEDiJpdHpgeIL00MXJk0Z3HQ0baWGvgf8mr9XqFDLS8+o7B5Zo3dvFRvOVuwrEaE5GtKL/+70q+zKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v45liQZ9u4g8rrXd0GBP0aliU2oTKBvp3+NCfl7FqCY=;
 b=YkZ0oGK+O30SSpwJsUtuVrYwQU2bf0dvkPtnDA8n6/e46oNASOF9MF9O5xTZI0VoOXDigoXHscuEz4Ch1xO8q3Zo3o0TqUmblR6qL/pi3YnnLDL2kBaAUddI5wVrWAjEYxJvNuSweHVGUjfmspy5R9icnQKY4AM1JHKwFKdv3Fc70gYtxVSZeeIVovnx2H5vGhYpyjPf8dwTv6eR6GDQPLl2A2PrgHaw0WzAMI2jnfG5FLgpVnSDxdahNnFSxp6N373hTQ26OJV4jDGZLKbPbuFpX/O5THw2I2qW6YTXcCQfhZVQZQG3hp48BsfzB+x960XUkVVs8WyZbkYOpGiB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v45liQZ9u4g8rrXd0GBP0aliU2oTKBvp3+NCfl7FqCY=;
 b=ZiAy7Y4oD+rH8Mv8kfdJ+YW9yC25F7GJS1jRtsb+hx7ajTLceOabZcogaAAafyameqEcAdlgDVQtpvyZZbwYIkyPsQxU6reszbYahVq7xOQs/+aT6HFHysui4livKojHMaQ+A0hNCINa1CwKh+i2WmQWZQMlfSN3PUSyPJN7pes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 19:28:01 +0200
Message-ID: <DAERYXX8M48M.2X249UHMKARPF@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
From: Alejandro Vallejo <agarciav@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-11-agarciav@amd.com>
 <214c8863-5cd4-4be9-948e-e44b67f541bd@citrix.com>
In-Reply-To: <214c8863-5cd4-4be9-948e-e44b67f541bd@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c912a7-95fc-43b5-ea75-08dda45654c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|30052699003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVcvc3YrODhpZUdWVDUxY2lsNk5NaWJTanhDRjE5cjl3UW40bmZzd2piMzZr?=
 =?utf-8?B?MUVzSFhNZG1MSnp3YnV4SmRFeFBZRU1URVpYWmc1c0lGeGpYS0JhMUJaWVV3?=
 =?utf-8?B?UG1sSzNLeGEzN1ZIUVJDSDhZc3NOSldMVko5WHZZTWpnTzZEd0NMRSsrbDlj?=
 =?utf-8?B?cjBMOTdHQTQ4Y0pCZVc3dFFtU3VKRjk1Z3FLNUV1S3YzcjNsTWNoQjBZM1A1?=
 =?utf-8?B?UU50T25XcjdSeDdXSkxMTVBURUJnLzhndUl1eG9wWkVSUzZJU2R4T3VxVGtZ?=
 =?utf-8?B?ZVdVK0NIRitOUnczTk1kcWNBcUlCWElKTlNSRmVkMkx2MGlUWlpVYWhBM1kr?=
 =?utf-8?B?RjlIS2w5SzBzK1ZYY2RIU1Q3a2F2RUNyTzNyL1dUSEZtWE9SUzVvcnBNY3RR?=
 =?utf-8?B?S1ZBWFJQbWtXaWpoZ09yS2NhRWhWczlYbUE2UVdYZHhvOGRRc3h1dVV6YXNQ?=
 =?utf-8?B?c0E4cEppaDAySGllVVJuMUpncTU3WVBkM0RQSi8zTUFyUVZya2lZZWJ4Q0Fr?=
 =?utf-8?B?RnorY21FVGRFZWY1NUVrMUt2eHlsUnlNelFCRWtCYUhFRnVNeGVwaFB6WEto?=
 =?utf-8?B?aG9qbWpUN0xDZDNoOTJDZWVwMU1aVWdmNm4zUFIvbEFXWG4ySWU5MVFnVmVU?=
 =?utf-8?B?UFVYeGxaY1RQa0dZNHh6MlQ3SWdtcVlwcGc0THlyMGlCZFFhWVlaSEVTMytU?=
 =?utf-8?B?TTFpVVVabENqWjdXMklwY1pKVExoUkxpZXQ2V0dtZFdscW5LU3pVRGU2SmdW?=
 =?utf-8?B?azBnYlF5ZmFDYksxWkRtUkppSDByZUJUWTlJcFIwU1hwSjh3dHVtR0xPTWZP?=
 =?utf-8?B?eC9lTE5kM1U3NUpGUVE4NUFFNkZkN1BxazRMN3pEV25GMDg1eEhESlMvU05x?=
 =?utf-8?B?Q2pNUzRPUTVPTmtFK21VV2tRaWsyVDBmQzZkd0tYem95dTF6Ukt6NVc5MEVi?=
 =?utf-8?B?ME5yYW9hL25Ca3hBRXhybDVCOGE0Szd6M3oxTHdUSGZ2RUpHR0N2V0t4T1Nh?=
 =?utf-8?B?Rm9NNGRSNVVmTTgyZng4NzY4M1BjZC9BeUFnSGo2OE9zYTFET0NXS3p5cmZt?=
 =?utf-8?B?UFFuOW43YmVjUU53aGlnaDJwRFkwc2FlSmg4dDdPZ1gvMXlsZjJaZHdXVVc3?=
 =?utf-8?B?WjRZTU5INkJuNmdhaUFId3FnbFhDK25ySzZSRFlIMXZpZUNIRTVYZ2RIRlJW?=
 =?utf-8?B?aTM4blQ0N2JkVHRTd1dJMWpVQXhyZmFnT1lReHFjdmdDVHJrMXV5OTdFLzQ5?=
 =?utf-8?B?d2FZWG1oSXZBNVcrRTV5NHNubm5MMXBVZWFSbHdKems5WDNudVltdlNoaDZT?=
 =?utf-8?B?SzhzOGdaYmhUM1pPTkc5bDV3TEMzYnhDU0xzUUJhODdVTlQ5SnJyem5UVUlw?=
 =?utf-8?B?ZXNCYW9GZUJEM3MwY2wzNGEzN0tCakNjeHhxUUpWS1gxQ2FROXNkTjJRS0Fq?=
 =?utf-8?B?TTFMdVUrWUwxK1FuZWhoVithcWthS2ZkejN6a3pUTFpHd2xJb3JHMnZ3ODBR?=
 =?utf-8?B?ZGRSK2pUTFBWRzViRTZlSU1lM2NlS3djc1U5aHdTNllnQ3luSzFxUzMzRHhi?=
 =?utf-8?B?NmNGem0xcDBPOHc3eFlTY0I4c0JqTkpWa1BJajBJd3RCalA3ZnY2S3QwekUv?=
 =?utf-8?B?NzZnQzJJSFBKTGIzUHZvTjBCd0NCMkxNZmk2TkF6aEVFOEJsb0xPVTVweG9P?=
 =?utf-8?B?Vkp3MDQ1YWppeWNBbXpvbWdHY0J0eEZQWkVUT3BMcFJIZnpIa3ZnM1RraFIx?=
 =?utf-8?B?am05Vy9pcHJ3VzlrYkVYUGpMZEJiUlk2UXoyQVQ2ZFRiTXJLeEoxTHNGckZa?=
 =?utf-8?B?eEtIUk94WVBVOEtMV0laQnhzeWN5NnV2NGdMV3hONU5CNEVJT3dFSEhQQUpl?=
 =?utf-8?B?b3R2UUVwVXZtOHFWWk9zUlBHZTE4alBFOE5JM0RsbGdqMWFoMGgzSWI2djBP?=
 =?utf-8?B?UGE4aUd1L29lUUFoMEZZRlhvelVNRzZYN0FXOW5lbHFRaEYzNjIwd0NvVlJL?=
 =?utf-8?B?MzNnU1dBZTA1RElWdXRvTUIyOGoxUHgxTWxZTi83TWF6SmdtODlYSVZab3dR?=
 =?utf-8?Q?9M2aJl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(30052699003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:28:05.1680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c912a7-95fc-43b5-ea75-08dda45654c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422

On Mon Jun 2, 2025 at 7:00 PM CEST, Andrew Cooper wrote:
> On 30/05/2025 1:02 pm, Alejandro Vallejo wrote:
>> These types resemble each other very closely in layout and intent, and
>> with "struct bootmodule" already in common code it makes perfect sense
>> to merge them. In order to do so, add an arch-specific area for
>> x86-specific tidbits.
>>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Yet this is a distinct backwards step in terms of legibility.
>
> How about modifying the common code to be more legible, rather than
> regressing the x86 code.
>
> ~Andrew

I meant to ifdef out the fields unused on x86, but after some massaging I
think I got it lookin much nicer. It's essentially using the common parts o=
f
kernel_info and boot_domain as a header to kernel_info.

That way, x86 keeps using a substantially smaller (yet common) data structu=
re
while the rest of dom0less can keep using the original as-is.

Refactoring kernel_info to rationalise its contents is somewhere in my TODO
list, but I have much more urgent fish to fry first.

Cheers,
Alejandro

