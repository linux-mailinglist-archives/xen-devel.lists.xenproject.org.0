Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D2AADAEAF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 13:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017170.1394141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR87W-0000hd-QG; Mon, 16 Jun 2025 11:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017170.1394141; Mon, 16 Jun 2025 11:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR87W-0000fT-NQ; Mon, 16 Jun 2025 11:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1017170;
 Mon, 16 Jun 2025 11:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uR87U-0000fN-Mp
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 11:35:20 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2412::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf8a315-4aa5-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 13:35:19 +0200 (CEST)
Received: from SN7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::13)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 11:35:15 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::77) by SN7P222CA0019.outlook.office365.com
 (2603:10b6:806:124::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Mon,
 16 Jun 2025 11:35:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 11:35:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 06:35:12 -0500
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
X-Inumbo-ID: faf8a315-4aa5-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCknEX8HTfBYsBN/R3RIhHS1MCEMWIAofCZJxoCFrK/i+YtjzIijgaC85fA3OSRDtmK901QhDVveXN6eyqWinYOw9XLBBpGXms+vdGKTmvOnakQjW9udSJwR2uUZWMYNb6cG/Q23d60Cf1JElFTmCq7ZwtILYWqaJc5rJCbzSUR2B6OkaxVc+gWfmAGnZeDUIQVlDHw3fdMzzISo4gwddp7CcZOSKn3QehDpWKjNExMWvdq4/4oH+o6/4r8WfzezAA78MHI98F1H2caSnlyKo0SQKaFQKUQcQQEHGlYSBLe4gb3PTcZjDud9DvuDVcE2Jbg9Z8mwPHIFumLg3Cwf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDQ3bQFYdjDOzL3hTZiERV4U8ZBQU4fS93H25iuCVBU=;
 b=Bk/5a8BjU8YNPm7uutpCKNCgKjrvk5XuI8gRXXvGoqSCbMqr8mUaX/YZgbyEp4qd4wh7nEribPlSHV8ReXybwHllrba10qSvPzAKBjuoifdggkOvlAkkgdBsyI6+DDWThIm/N0qMbW6KWnbtXlGw0RQBSmqfM1pkW59viw83fSSeZSYzSuXEZchifTDeFnYiSmReYsT0wDM8X8UhsWcOVgLaPWgxOmK4g5XZcA+91d160S4TsipPQLnpjM82mOAMgHR+MbayfSM/s4hevig4oISg/w3UKg4jYZqULgnrWo/RgtYt+oyu/iiY2DpMtPqLVL3/X2li28MvBZkGdVZXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDQ3bQFYdjDOzL3hTZiERV4U8ZBQU4fS93H25iuCVBU=;
 b=vikwEr/Vyh1xvT25nHwpQuOQ1fvAwFqIV6Hq6xyuc4Y9Ff5srV/cWUj4Gr/fIHOPyWTtUjcEmPI03M3lhVXm4OtpBSNhMgzjHxej7eMBn5+pIVtBxkbEnN5NZ71RM6zbaWPEZlLtSW+qNsUAXIBUn7D159X7bMpWYT0GE9Fs8Qg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 13:35:11 +0200
Message-ID: <DANXCS0P7EB9.3U1GSTXIP6RU5@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 05/14] x86: Replace arch-specific boot_module with
 common one
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-6-agarciav@amd.com>
 <alpine.DEB.2.22.394.2506131743190.8480@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506131743190.8480@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|IA0PR12MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 10276f65-c12b-4937-00b7-08ddacc9dcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1E1WE1BM29laWtjNHg4Sml6bmtqMGFMeFpQRk9aQ0N6R2FMSm9WdU5OVVRp?=
 =?utf-8?B?TDJMOGxYSUFlOHN4U28reERIUUxXbVBUbDlBek9GWmk5SG5MelBmbUNMTUNq?=
 =?utf-8?B?V3RBWnFGM01QWk1LVlRvTFVPdDcwb2p4emJxSzEzQnNQMVZibjZESU4reW1S?=
 =?utf-8?B?WEdJbklHdUErRTVwQU81OFhPVTRpQm1vQTUvM2RoZjhPUTFYOU5TVUtRby9G?=
 =?utf-8?B?S3o3Ui9nMjhoU1NoMWovYUNQQzREa1RJbGtwbW1pemNZL0pBN2t5WWJMR2tZ?=
 =?utf-8?B?eHJRRDJibm0yaFhjeGowVjk5aksrYnRQL2w2WndleGJUc0NyY2Rqa1o2L2Za?=
 =?utf-8?B?RnJESm9QWG9FamcvUi9CaU9QWHNPY0YxT09Oejh1RFJIVjhJQ1RObklvMUhl?=
 =?utf-8?B?VWNCRjBpYjAzMTQydFFaUUFwUGo4eVd6clhnNE0zN1BNQ1I3SmFBMVpYMkhP?=
 =?utf-8?B?ZlZtS0FDaG1jRmVBeUEybjNFQU80aWFBbG1yK0t6SGRpRVc4Y3hOU2IyY01l?=
 =?utf-8?B?QW9ISWVVN3lPKzZxeVVyMFEwYk90cnFDTWhJNkZqVVNtRDltSmtFZzJkUFRt?=
 =?utf-8?B?QjFxMnQ4dlFPb3Y3RFNvZE41amVuNTlrT0pCeWU1UHgzUWd6M2JJbktYVHhB?=
 =?utf-8?B?MFJ3NmI5bzBBRmd6STluSGxPeERkL0ZOREhHS1I1SmtyUzExM25FTUdpaEky?=
 =?utf-8?B?bEdIeDVhUjBLSDFxbms4aUoxb2E0endCUG92bThjdTc1UTVzVmpVdEN1em1L?=
 =?utf-8?B?ZkFTQ1lkVGFvcXVFVWdkaTE5QllnM29Qb1RHdDZHWUpNRUNuUTZCT3RGeGFH?=
 =?utf-8?B?WnlKSE14VEtDdGR5V0srKytwM1RQNnRUQ0p1YVEwUUdRQkZmOTFpK2NsY0I0?=
 =?utf-8?B?RlFqdXZUTktKRUFjb25XRzhVcFBMOHc0N2V0Yy9scTZuMG9hZzNrUVBFd0k0?=
 =?utf-8?B?Q1hjN0pTQUxvZFprQkJxb1RERklLeHcweTdRc2tNdEYxRG5nUDJUWURXa3Rz?=
 =?utf-8?B?UFl2eFNILzhZblJySnoyMlhWcTVaejBuM3QxN2QyTjNOcUJCeHZhQ2VGbmR1?=
 =?utf-8?B?MVl5WDI5UDhkNVFiSXl4Z21HZU85Tm5oNkUwVHpidnlmS2l1eWdQOURUalVw?=
 =?utf-8?B?b3AvQjZ3NEJqeGdSZW5yeVByNSt0T00zbldvMFA5NG83cThKWWlQR1VGazJC?=
 =?utf-8?B?c01KdnNjNmppUThHRTRZeDVzUk85cDhqRlRzR3VISlRmaVhqM1ZXdFlYTlpu?=
 =?utf-8?B?eEUybHFZZ1cvdG4yWWNINlV2bytOdDI3OHNOYUNKYm83MU5ucVg1T1U4QlM0?=
 =?utf-8?B?OHBtdzgxYlhZNm1tN1UySm5BbGpYUVl5NGJPaEcyY2dhQ3FmZ1NVZjcrWnpR?=
 =?utf-8?B?eUl4byszL3B4VW5ZZnhDeGs0elAzL0o3dS9DU3A3dDlhNGx1d0ZYVTZGVDAy?=
 =?utf-8?B?a2hBWklXY2hzeTVoK2ZkMkpTN1p5THBMSlN6WWZnaDdpTDZteVZnNld2UFls?=
 =?utf-8?B?RG1PREZhRzEyc0FUVUlEcHRGRmozNlV1T2p0Q3Nrd1dFMVlLTEpJVnVsVXc4?=
 =?utf-8?B?RzVoaEhmWUtLNlRaeDR2dUVhNElneUJXV1BaVXlINUtwaUxxWkYrakpCMmlj?=
 =?utf-8?B?Mld5bTBUQWVueGkrYmpYSVFlK21XUmYzSldtaG5pZmhiRTFMV3hQSnMxbk5W?=
 =?utf-8?B?Yk9vYURDR2NJWC9KUHM3R04ydGNRNWFPMEVDYlZkMkx4RWNqQWFEK2VOdUFX?=
 =?utf-8?B?WnNMRUdXTmxCaG1VNFhTSmVaRXE5R1ZIeU1DTW5VUVl3Mlh5STVobWIrUUJm?=
 =?utf-8?B?SFdDcEdRbzduS2hkZEFaU0ROSnBQTTlxY2JHVmtqZm5LR214YmJ0SHdteXQv?=
 =?utf-8?B?TGFyQjd0UjdROFdoRVVwTFZNb3A5bUEwWWRnWGtCMWU4d3NBWVhQQ2daVktH?=
 =?utf-8?B?aDBscG4yVGJyVi93cU9Db09YV2c4SHlvRXh4SHNrbGRzRG1PcWRhODRoRm85?=
 =?utf-8?B?Ry9YZy9FZlFUbEhMbzFjWHBxOTVqeU5qWFdNMFZiZUQvdU40UEFlbVd4OEc0?=
 =?utf-8?Q?OUSjoO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:35:14.7071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10276f65-c12b-4937-00b7-08ddacc9dcb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713

On Sat Jun 14, 2025 at 2:54 AM CEST, Stefano Stabellini wrote:
> On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
>> These types resemble each other very closely in layout and intent,
>> and with "struct boot_module" already in common code it makes perfect
>> sense to merge them. In order to do so, add an arch-specific area for
>> x86-specific tidbits, and rename identical fields with conflicting
>> names.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Hi Alejandro, this patch doesn't apply to staging anymore, it conflict
> with 3998da124.

Ugh, I'll rebase it and re-send after the existing discussions are sorted.

Cheers,
Alejandro

