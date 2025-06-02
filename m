Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB7ACB186
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003493.1383067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM61m-000220-S1; Mon, 02 Jun 2025 14:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003493.1383067; Mon, 02 Jun 2025 14:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM61m-00020G-Ne; Mon, 02 Jun 2025 14:20:38 +0000
Received: by outflank-mailman (input) for mailman id 1003493;
 Mon, 02 Jun 2025 14:20:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM61k-00008u-Nc
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:20:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:200a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb9ab93-3fbc-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 16:20:34 +0200 (CEST)
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:20:30 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::f0) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Mon,
 2 Jun 2025 14:20:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 14:20:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 09:20:24 -0500
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
X-Inumbo-ID: beb9ab93-3fbc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gac/Rm/pAz2FUvK0hP6RcX8fUUFRsd3iQIYsks0MqTJQ3NgG4y6ndpDqIqddSvtTW3Z/gN20hiIPROGFov+NQvGx+f15KWY0yT6kf2ADHrYl6A8SDOeTKJR+m1X+hfxr9zspaeOmra1kCbZRroV7mKaHXtriM+dAagrYUmj+pHznlkPv6QJ3cL+iQsvHpajqwo7nD5GSdGME1CJbi3WvR/PI302WDS3mCVNNJVpaeYxmtPmApDlg89yn7gJgED8WZMkCmhGOKhQOQNBKb07Py4WHEVqAm6YJwhpn05zWHE7SFn4iipM2EyV7RSFxaxBUqUmJPtLlgB2WhKbNtu9Srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M/SiW4a1t1yWHQE0fruyR4FKzJ2ExYRcXotkyi8dMc=;
 b=ZrZFM6yl+6kXAdVOAeJGHkC5nbJ8ElztZ5hI+lKPNybTuOv/MxKDGlAi9Rqh6fCA+6ywHH8prsS8SBDQ+5lsRe2PnWsE2ZkOLvi9Ia5uMbPBOdiQ9UOtTNooNetuIFz8hfeBp1yHaqogZhST5TAkuRtWvNoEwL70CbF29/2tt1zqEFa7k9KeHAoxEZVv00W2185hdUfLSbg5JAEGUb6/5Qw61WlJL5Fgs1FxRLuQTQooAqh1dVHfoVbLrCvRyjfxaXFNZAw06s4/TNhg+RsXnFrY/MFYcvPSYgunTX3M3q64bUJz03z3T14ktejYxUJ1nGve2rNsbdQ1T+zSDrc9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M/SiW4a1t1yWHQE0fruyR4FKzJ2ExYRcXotkyi8dMc=;
 b=d6XqwdsnXpASmZ9FIgvZHLR2m2fohgUgfVC3qV4K++prTv2eL9kFAU4QllbSULQyjIDexsphQRxXgfYMjFScag4Zw5UhsNs2AFFyx3zs6xHowDYO15/sld4oWRPQsaPCCNLvdcSiQwkA0UE9LlFtHJS2EDgV+o6gD5Mp5zNvqjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 16:20:17 +0200
Message-ID: <DAC43K9EI6KZ.19ZTJXVP2E80U@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
 <c94dd42c-a2be-4759-a5de-7c9db46acd16@amd.com>
In-Reply-To: <c94dd42c-a2be-4759-a5de-7c9db46acd16@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: f73868c9-3775-4e31-ff7c-08dda1e0a07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHY2Vk1VdmFnNG5jQzVXVGhSRENzcGI3cWUxdTRXVkcxMW05bXhQUmlrRlVP?=
 =?utf-8?B?MWN0QnhWS0hNbUdzQWpEQlhDVko5dDdNV012cjZ4WUpHUUFjc3FEVmlEV05W?=
 =?utf-8?B?UlVCNDNPUmIwUTU1TzhRWjR5dlllZXJWOUw4TFpLRjhUSWhmc29nZTd4Y2JH?=
 =?utf-8?B?cFVpUFRNb0tIY0Q2S0pwRk4xSDI2VUF6MnNNaUZJZE1BRmFJdWdLWnF5WHVP?=
 =?utf-8?B?M2lpREc5dUVYY25GOWpHVDI0U0g2NFBRVWx1MnNiQ0FQaCtWTHNGYU1zNG55?=
 =?utf-8?B?SldUVHdQZkpKNjV1Ymh1Q2pzenZjRWhram4yd3BETXFGT1ByNmJENHdsNlRS?=
 =?utf-8?B?Qm5tOWRtUnVoYXVVcncxamtDOTY1c2R3SHRFQTBkd2xpQUl6OGsra2NvVGUw?=
 =?utf-8?B?Nm9ON3BZNm84UStuV28rVlY4L3RVR1FTSDNwWnBTU2F0L2NZSkJkMEtEcXNv?=
 =?utf-8?B?RjZHQTVOT0JKRnoxVzFKWVBPUzM2QkE4U3dNaWNLQWlUcWZLOVpqM1hjT2NE?=
 =?utf-8?B?Y1d5d0h3S1hBTExHUjhZeEdyNU9UVW1xRW5EOFRLVDdNMmdHQzNHdllaQkZQ?=
 =?utf-8?B?WCtxNEFXTHZmM1BKT1MyWnhhQjZwY3djMitLcGpHSXk4SHNmUE5RZVIrSlNv?=
 =?utf-8?B?dy85VWZUeHd6cDJBK3N4SUxmUi9abFR1V3M1Vy95UldraXl6N1dPb0hxVldN?=
 =?utf-8?B?ekl3bURoTUxrUVgxWm82L3Vtd0lHUjM2TDZJb2ZvMTcybDNkSzFGdFNxOWdl?=
 =?utf-8?B?T2h5VWtQWHlKM2ZKdlQ4ZkxnVURXTjBMZkx0RW9tMklPSGVrcmdPdUl5bWNt?=
 =?utf-8?B?WFR6emxwVDc4cHRFcVc3SmJuYm5pSmdmb1QzdG54c2pOM1lCOVg0UEoyMk9y?=
 =?utf-8?B?QzZjSk92dExTbzdRVE1VY2V3OHpJQ1U5R2NKWitTQ1VqcFpyNU1XUi9YRzZX?=
 =?utf-8?B?ZW1KQ01YUjBJdDhPVy9NbTZRT1pXaklwcXRnR1BndmN3UHFoTzJTbTh5UitG?=
 =?utf-8?B?OTlpdWkvL0E2VU9Va2pGUkVCb1o4VHBXMFRianA2eGZYRGw2cU5SVTNuMER0?=
 =?utf-8?B?eGRqbHp1Z0FUMTliVzBjWWNUWWhmQkVnSmJrYWJyUjREZy94KzFaMmN1V0hR?=
 =?utf-8?B?Vlo0cDMvVFpWU1NLTjNEVGlMSllyMmtlMnRJVWRVMnZYWUFOYlZ5RnV0NEhB?=
 =?utf-8?B?VCtDWkFpZm0wcEtiZUlXQlZTWmQ3bzJFb3FtNnNSY0ZtT0pCZ2lHMjB2MWh0?=
 =?utf-8?B?QnI5dlh3d1k0N2Z4Q2x1RGJ1aHFYVXhFNGROWnhpLzJGN3hmcmJBR0JZb0Fo?=
 =?utf-8?B?eHA3NVpONTliWHdEOUhZSkxYK1BtOGJSTUJrYWVxcmhyNTVzRUhjYU03bkNB?=
 =?utf-8?B?aThJSUx2MFJzQ2Vsc2dnQTIxNjlTQTJDTTlmUi92TmFaRVJGbU1WTUtZOW9v?=
 =?utf-8?B?Vmh0M056aWRadXFYRmFQWkdCREtvamVTMSttS1VOdU10REVERkhXd2twOURo?=
 =?utf-8?B?RUtQTEl4eFdJY1d4UjhTWmRtckMyZHFiQ3AydllCQnhqaUFUTVIwbkhDaC9y?=
 =?utf-8?B?WWN4d0NMcGo5NHcxdG9qczFIbGEzR3oyMFlmaFR4bGhiS1JhUG45LzBTRXRq?=
 =?utf-8?B?azR2V1ZwWUxMa1hGUXdNRjkySEZuQnd2a1FiKzlubFdxS01KVGZLU244VzVR?=
 =?utf-8?B?eVZYS3Q0QWlINm9pMlplZ0V1dnF0Unk5d3VBV2dmWmJXZkl2QTF4cENmNFA5?=
 =?utf-8?B?YVA4dVlIQ2lrc0lTYWNOQXpNMUl4NS9FQllNRkVtN21jUzhMMWc0bUNnU0Nr?=
 =?utf-8?B?SEtoNXA1Ni81WUtzaUFlSEF3MElkV2dVTWtuQWoySHJSTUFNWUJNcFg4V3VC?=
 =?utf-8?B?NDNGeXFZSnB1UkQ0ODNidUxIMzVoWGVXNEM2Y1FKR1ZPZXBrbG0wRXNMRlBP?=
 =?utf-8?B?Wk8xaTM3U0ZpekZFb0V5TjMrQ09BNm1PTDJZMy9tVXR5MkltenRyMkZmdkxy?=
 =?utf-8?B?STM0WTg0QlU1UU11OE9JOWRYb1ViKzNreFhXci9ST0JXSnJtekZtSmFuS3lo?=
 =?utf-8?Q?dZPkIb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:20:29.2534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73868c9-3775-4e31-ff7c-08dda1e0a07e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491

On Fri May 30, 2025 at 11:04 PM CEST, Jason Andryuk wrote:
> On 2025-05-30 08:02, Alejandro Vallejo wrote:
>> xen/grant_table is meant to pull asm/grant_table, when it exists.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> I think you can also remove this one:
> xen/arch/arm/dom0less-build.c:#include <asm/grant_table.h>
>
> With that,
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Oh, yes. I missed that one. Thanks.

Cheers,
Alejandro

