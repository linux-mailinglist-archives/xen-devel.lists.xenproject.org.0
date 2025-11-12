Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82882C52AD4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 15:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159948.1488203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBjA-0001j1-0S; Wed, 12 Nov 2025 14:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159948.1488203; Wed, 12 Nov 2025 14:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBj9-0001h1-Tp; Wed, 12 Nov 2025 14:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1159948;
 Wed, 12 Nov 2025 14:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJBj8-0001eo-Hy
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 14:21:38 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e30d7cb0-bfd2-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 15:21:33 +0100 (CET)
Received: from BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::21)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 14:21:28 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::8f) by BL1P223CA0016.outlook.office365.com
 (2603:10b6:208:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 14:21:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 14:21:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 06:21:25 -0800
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
X-Inumbo-ID: e30d7cb0-bfd2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9aAqzh4bE9SCrAnbt2Mx+Aj63gDWnFB7NmtrDnSCCGjYVmNlwv+/zmsNmqU3RUxOQgtRhluFVMZhJ4pJXEGui5BiJbfjzrA1rRricZhHviU2gUD/Byt6KXMZNjjb00UpFIZAcc/5urUQs2fobD6uppdVUWtIJWFphRjIjQD/BUKEJwMBMJCyuAxZhUk7ebiTA9vAXGeCqIOEgMEjwSMfkkgHuP9v9wNa+qrFMid/PS/XaJKi/MvHgfHYhf8u4xc+71lmXpdZchgbKufIc3/ButIXXb/mhzCu5wcEa1XCjb68dh6b7aEex1nD+Ravk4NQj1rngHhfrEWKC+SjB5trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq4BWceTs99e/JZyZudkANMJgFrYNQEqP4+vSrvNoHM=;
 b=yS61L9SAVMM9nHP8WVKhnsDVse4zJGdZQsPEPU5JuliSM1udRo17LrkMvzzW5nP3hjeoM35uDQKSuEqWbTvbfy9Q8zi1Sr1NPlWbGP4NlIjiHpnnjqs/saqO3ezxlDLjErSJJct1DZp+BoDDaW+CP6xf7dFtCd2d1/0Rcl8kh1Q+qjZ50r2iXVpku7pyIZCkDRPY9PDiYdjGhzN6x+SCjYW1Z64zT/BHFNeNihW1fe0yc8LEtiXJGtjCykXs0wrRAQdq/Ivxe4zonhqI6rmBpLE7vzf3gLy8oB1asWEuB0mTBOpHbWZYSvbTreAJZsVXU/zgaJcIbUY2SEvF35UoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq4BWceTs99e/JZyZudkANMJgFrYNQEqP4+vSrvNoHM=;
 b=EESgSUNnRMgd5YKjV3dKZbSm3uGs07quDgugmxLyIK2XR5QyBOD1fMlAog0N1eSGyrO+rY05l7NeE1q3oBI9t3EUqFjbvvNUnYRAXOYufIRFshdhBW5dDqyd18EuaT35Yl7mq4HbazstIFIpkPGdcE+tZXhNy4y7qmoajL/BTlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Nov 2025 15:21:24 +0100
Message-ID: <DE6S77WBXSMS.1P0AZU6C9TL3E@amd.com>
Subject: Re: [XEN][PATCH 0/5] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <fa98c390-db6a-4b3a-b34c-820625f139a4@vates.tech>
In-Reply-To: <fa98c390-db6a-4b3a-b34c-820625f139a4@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 56922eeb-52c9-4e42-dec2-08de21f6c4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjVINDNiUHNYaCtlUklKQlBReUVBQ2lDQnZMT1lUbENydVZBVXVTS2dXV3Zl?=
 =?utf-8?B?R1VqRXhFMTRjRHkxeCtHRk9DS1krWjI3WURpSDNmS05qK3dvVGdGZi85MGFH?=
 =?utf-8?B?SUxweHlVV0E2ck1vT3RsUllmcloydGxIaEtzZy8zSnJyY3Z3S1VVdmdSZDB6?=
 =?utf-8?B?YU5QcUFKNnZUQU5hMktNT3pST1BPV080MURROTdGMWZCQSsxSGx2UWEyTFp6?=
 =?utf-8?B?L0NoYU5semZpZzdoblMxWDgrVkVJdXlEV3JmTkxTN2lKYmpuMVNNcURwNWdJ?=
 =?utf-8?B?OXNGZ252bzdsSHY4bGZTY0k5NE15TUpENmdWRkRyVjdaRm02T2QvS2oxNEFJ?=
 =?utf-8?B?Mm16MUJHaEFSckhhTjZFR0t2Q0QrVS91aHR5aWZkdnBDeTBCYWhPVy94R255?=
 =?utf-8?B?bnpSY2ZYMDg5TUFyQWhBeVdLcm5HMDU2M0FQTXlZakRoQWtMR2MwbldnTjVx?=
 =?utf-8?B?Znk2OW5RMTErYnRVV05ESTNLMzVzT0dXV2RQcWNZS3E4VzdQV0VyZk80UW5u?=
 =?utf-8?B?ZEg4QlRTdVIzd3JKVHhWTEtxeUhzVG4wWERsQjZ2c3Zzc2RKVDFYSkhWL3Rn?=
 =?utf-8?B?Uk1OMStnYStQQXA2d08zbEZWejBOS1VtWUoxMzBsejh2Qm5KOEQ3elRQU05O?=
 =?utf-8?B?Y041elBSU0RGQSt1OUgxSFcrT1FaaVVWRVJEemFsMk5hQllkZFY4eU5PazNq?=
 =?utf-8?B?dldScmlmL1hUNERXY0Nwdk93ZnJnazFyUDBnVUx6ejd4SGdtSU5veVJ5d2xr?=
 =?utf-8?B?QTMwb2dxdktXYU1WMWNDM3FjZEJOKytPVG1zVlFIT0VleUpoSDlxeHNjZCtX?=
 =?utf-8?B?NmkwdjUzNmlYNDBwMFRHMGZBMEt5eVlJaE5KT1FYV1RUU0E0aHBqQjk0a2Ny?=
 =?utf-8?B?QVdHYUl5bWZVditRa3g3VE1MZlVzZ3hsSHdKc09Ud0EzSmcxeU5jdjNaQnNx?=
 =?utf-8?B?b1FJdGlqQzZhcnk0NWNySDROdklXR1c3bmU3bzI0OTFTZSt0em9mbzJxMlM2?=
 =?utf-8?B?TVBtVUZMVjR0S3ROYXF0OWM2TXRlV29xaWZSSDh4NzlvckEwUk4rYnRFR2Zv?=
 =?utf-8?B?WHZUUGswa0gxRW1uQVdiaWw1ODBMQnh5cjI2MmdVdmlYK1dqNmhDc0hTRnZk?=
 =?utf-8?B?SThyZE5vSjhrODMwSFFlRmhBK1E4QkcwKzg4SCs4ejJSaFptMlFvODlzUUhs?=
 =?utf-8?B?YUNSQkFVUk5xOVNlZW02UUtiTFVVZjhKemN1V3VKNnIvV2RMaXdjN1Q0Uk03?=
 =?utf-8?B?QVg4WHdIMjFNK2VOcnJQWUtWbTBUekNMd1pBZXN0djNrRjBkREtCNUNoVzdj?=
 =?utf-8?B?eEVEbVFMeVJGRmhtREZSWnJDMlN2dDdjaGFZMTl4eC9TY0R4KzVmU0crdVlu?=
 =?utf-8?B?c2duQlpta0xyVEtBOHFkK2MvQ3grTHk4WkQvU3oyMnZyOURZSXY1cDlia2px?=
 =?utf-8?B?cHV1Z2hYM2NHeGJ6L21nTVJ4c3dncVRvaFY3S1JyZHgxTzVBSlpaUmdKaXJ1?=
 =?utf-8?B?TDV3NlFrSktuM0ZVNEhRay9pbExqR0VsRTZQOG5pTndXSE9KOWJwdUNGMzZI?=
 =?utf-8?B?ZWpweUVlK3UyOW4vUzk4MlNXV01MVHhyZDZyNlJYL3J4R1BwL0lHNlJVbElu?=
 =?utf-8?B?MU54NnBqKzdJYWNuMFY2OHI5ZTlqVFhJWTMweWpTN2RBdEh6bCtvZ0xIbFJV?=
 =?utf-8?B?V1FmY3h2ODB6SWMybDE0R1piSDhKYWRPUnVkMkdzdklTdzFFOXJJR1VFMkw4?=
 =?utf-8?B?dFZPVENOc3BOUXZoMGdhT1lLWFNYYUlFTVpuZUpiK01BY0RZRUttUU9acHNQ?=
 =?utf-8?B?QTNEWjZiOElINnRkUERYc204cXc3Qy9abUxzSlM4eWFDMkxNUUN5VCtxaCtV?=
 =?utf-8?B?dnVmaVpNSzlpK3VNODdIZkJyME9VMWczY1NqUGJpZ0ZiTFpCN2QwT29jNTM4?=
 =?utf-8?B?WXFWNWJ1djRNOGRUeUhxcDhJMjR6TFNwM1RibWFGL1ZWaVRvODJBNjNheTFs?=
 =?utf-8?B?UTg4WUZTRnhCVy9hZUc0ZExQQ1BpMlc3SDFpSnAwb0U5S2hVTU90RHQ3a090?=
 =?utf-8?B?QjNPM2U1VERsdHYzVHl2ZEpGMklOVEJyUGdib0Rzd0hEb3JGdWlrMk5wcmZG?=
 =?utf-8?Q?S/ls=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:21:27.8917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56922eeb-52c9-4e42-dec2-08de21f6c4b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144

On Wed Nov 12, 2025 at 11:58 AM CET, Teddy Astie wrote:
> Le 11/11/2025 =C3=A0 18:55, Grygorii Strashko a =C3=A9crit=C2=A0:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>=20
>> Hi
>>=20
>> This series introduces possibility to disable 32-bit (COMPAT) interface =
support
>> in the following cases:
>>        - Only PVH domains are used
>
> I assume this one is mostly due to hvmloader being today running in=20
> protected mode 32-bits rather than a limitation "HVM" itself. I don't=20
> think of anything else preventing HVM (with 64-bits guests or 32-bits=20
> ones without Xen support) from working with COMPAT disabled.

It is indeed because hvmloader makes hypercalls. Otherwise HVM would work t=
oo.

Cheers,
Alejandro

