Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6FC98287
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 17:03:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175849.1500452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6MQ-0002TQ-JW; Mon, 01 Dec 2025 16:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175849.1500452; Mon, 01 Dec 2025 16:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6MQ-0002Rz-GR; Mon, 01 Dec 2025 16:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1175849;
 Mon, 01 Dec 2025 16:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSEW=6H=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vQ6MO-0002Ri-IF
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 16:02:44 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 298baf14-cecf-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 17:02:40 +0100 (CET)
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:02:36 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::70) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 16:01:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 16:02:35 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 10:02:34 -0600
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
X-Inumbo-ID: 298baf14-cecf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTPlRgXmZ6sGzvtnxMZGAk+9W9kIH0+457IMTsd3z0+8U+xUUS8OKi2/epJ3B/qPw/Ywu4T7qu2SRzyl2P77dWb/gwl+BSYEF0jLDA+cgRJPRBSd+xBWD/10z7hizvPSvk/e4AEFBbAaye9J4M9QYl6RqfpN3gXT9hKM7atDulnmJvAOqvNdsQjebgI43O5L5xTBttgWBfG+N2YwKVMNWPESaisOIMoLAi5KXjTd38EKsuyLLAZfEW6bp1yUH9hnlEqk7lTIcxO9F6lmvJPPNDQ9jOM1+pFsIdfm3oX1we+XXQeqNCnkk7LgUBeniuDQ1Czi/tjlM0RJzPXYrRwrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wnM6YZ9GXbG4PWy1OEPQoo1KbQ/Pc/X5oKx+uTb8Ew=;
 b=FwGNm2XE3hn6Ln68qmQ2jI9T9XqYWMyQOG13U6SwlzGoA1FYBAe8UNTagXI+ntIBhGhE84xNMJTvBVDZ3sEp6ZnuA6NYntmW8ZTNDAEUupyZLQg2OEd1HjuTycrtt6RL+frtyAZBr3dGlY493/OCPDc7Im5xLrG9cFr3YwVcQtnrJxYR1q8BlNprz3CLYH49sgv9ilFMVDKRNPNcCEx9IdS1LI+VCyjSpNC79sCbgnLechpU4rEvHS77xMQLEJvSOaV0AVGzrqr5OetvSYVGigIaW3i8xyTv8CXSTV35rc/Gmpg3AVnhgDplOk/tUlrR/tUc4k5RxLJnp2ZppdXBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wnM6YZ9GXbG4PWy1OEPQoo1KbQ/Pc/X5oKx+uTb8Ew=;
 b=v9Ciudpl1ZqVIbOVWS8COkkEGxTqwHLr0mYUMx4zcqKfdDU2xQXAghTMY0ZW1BC+MA9uJ+T0bzesrbIKMH53uPAafPPnpft4RCPoEi+cLOC3bhczPhM3FTBp8u8NUFKWQSNbGRf9omtzBxR9IYeCqXuKazmudaOR5wdlOarBUUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Dec 2025 17:02:33 +0100
Message-ID: <DEN090BAVOTH.2S8BW9I0HVMP8@amd.com>
CC: Jan Beulich <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Unilaterally inject #UD for unknown VMExits
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
 <DEMYRBFJE6YM.1I0BH2BFD5H72@amd.com>
In-Reply-To: <DEMYRBFJE6YM.1I0BH2BFD5H72@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DM6PR12MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 2651ed49-f411-43e8-962b-08de30f30b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFd5N210K3VucDA3bDVNU3ZMNGxRZE01RVFYbUVSYmJIRW1leStjWkNlWUtw?=
 =?utf-8?B?R0RLV05GbkNja3QzbCtudWM5dEM1dStzQVNRaDZQbEp3cXdVSGZHZkV5cDVO?=
 =?utf-8?B?OEpzM3Q4RVZzWjV2NG10cVM5MC94eVJnRk1WZGJRYURyRFcrUzlYSjVHOEtw?=
 =?utf-8?B?dEdldzN3QURyNkxqdklqVGxjaU03L2hDalVYSXdyeGthQytyd1hsYitvcUxC?=
 =?utf-8?B?djU5TmZnd3B1ai80Z0owTUtiUmtPZ01UTko3b0VJcnBBWklhR3l2OExRbVlV?=
 =?utf-8?B?ZVowVVFqanNnRzMrS2M1VXFIUWswMml1NDVCWkRKODRtVmE2MWxrL1kwM0FT?=
 =?utf-8?B?Ymp2Y0JnQXRXMmc3MUVib1NLQ05OT3BaejMwNXh1YzlDSGZnK0h6UFV5UmFz?=
 =?utf-8?B?UFdYcThjeGxSc1NmMllXRzNsbW5qRWVjaEh4a2N1dmI2emw0aXVlMWh5aGx5?=
 =?utf-8?B?UjhCVkE0WVVRWlM3dE1RSVBxYXNSUlhvSXArSEszOUFTdG5vRG1qUGc0R3dh?=
 =?utf-8?B?OUk3cXpDUFQrV3ZZMHVkelFuSUZVT0w2OU1WT3VxREpGRHBNUW04bEN3d25D?=
 =?utf-8?B?dEdoSWNzUkI2bjFYbmNONWJ0a3RhUWFCMVR2MWZxMnVuMDVCeVVlQ2pHRUF0?=
 =?utf-8?B?WUxWajkrMkFHWWpOVldNRUx0UkxrS0VIMUFJVS9OdERicUR3cG9mMlJNNFUv?=
 =?utf-8?B?bGF6TmhiQjNnMWFyd0ZZeHc3RWR5K0RXTUNMdFNBVVZ0amR2R2NwcUNEZ1Fa?=
 =?utf-8?B?V2JJb0xYYm5KUHlXUXFBeXo2UkVzYWF1SEgzYzhtMHVHWFpoYW5xUklEQk5T?=
 =?utf-8?B?OXNKOVpwcXdWQklBYXZ4Q20vbFYveHk4ZzdqaDlwTnA0TkFteHdsQW9QR09G?=
 =?utf-8?B?eGhnTXVpdnk0Zmp1aWQ2am01dloramRCRzF4dnBTMWFrS2ljSUtZQkNkbnRC?=
 =?utf-8?B?b1c4MzdkZHJObEMwaFFmUVRpdnlydk1LVlhvTEhzS0ZIdzdmcElJZk1DYlZv?=
 =?utf-8?B?VjNqOGorc29UMGFoV1BWVU9jRDFmZmlQZkNjeng1ZDBxbk9BUVFRNTFvZFRG?=
 =?utf-8?B?MEFPNEFvcjcraXZlZitmdW9yNkJYR0NqanVTVXhKSkwxK0V4Y3JIQkwvTmd5?=
 =?utf-8?B?eW1vRG5HMUlwTlRzZ2Q4TFF0TVVTQStPQ3JYKzFteHF2YjYyU1pFRU5kUmcr?=
 =?utf-8?B?R3c3S2Y1Y1VPQWM2aStLRjNyR0Y5Qnl6TGdLZUhyVm5SVEM3WndjSkx0ZHNT?=
 =?utf-8?B?M0pySFBZWkM3aXZxVWowUlNtZkxLVk8xUG4zbGpsd3NYR1J4K2dFcGM5aTVk?=
 =?utf-8?B?NTZMSDB6TVU1dkM0VWRVOWpxS0V5WUkyKzcxZ1B5YUFDVnk0L2N1M1ZpZ2cx?=
 =?utf-8?B?ZS81VFhydnA1bHgxM2IzVUQzMkJHR1oybzFMc3UzbXZvSnRLdW1UdW5xV0ht?=
 =?utf-8?B?YVBwQXZXWFJDMWlXYzdpdjZ5QjhWVWM5NDJaem5SWHhkSmMweDlKVlJ3bHBj?=
 =?utf-8?B?UUwycDVxYWxBUWlNaEFCY3AwMDVPdGljTmxUVG82UlBrV1NmRHZxNGowY1dq?=
 =?utf-8?B?elc4WnBocXlkZ01zdXF1SWtST0RJd1VMNERtVlJlcTcwNVhIWjFJbEhrd1hr?=
 =?utf-8?B?NTFsOXB5WUxHUmNMakhwOFN5eHZJdWRibU52SW5mNzdjUGlUeG8yd0ZRYmg0?=
 =?utf-8?B?V1RRcGJKcU1CRHlkOU9HaUFxeWlZeUdjWFlaQWdQMkI5R1JXbytXUDRIRUow?=
 =?utf-8?B?bWx5WjhLTjNydGc1KzVtV0NJS2NoNVJRYlNUR3pLWWthQkhUWU5OT3ZzVHZi?=
 =?utf-8?B?ckxYdll2VERVTENaTTNVUWYvY0p4b2hSU2NublhzdkpnZ0kvK2xjc2UxZmVw?=
 =?utf-8?B?a3VWY3N1OUFxbTVwR0UzNmUzZ1A5QkJINGYyall1c2NEaVBWMm81ai92Rk1I?=
 =?utf-8?B?QWplallRWThvTTZIaWJLdHRXOWdBZ2Jma0RObXNITjJxZmhmTHRUNjE0MGpO?=
 =?utf-8?B?UkJKZGR1b09FeGZBTlRFbXJVa2gya1pESTlFVzl5Q1lpakFyZUxXUWFFKzcx?=
 =?utf-8?B?dHEvSDVMTlJkcGZlbFMwdVhMNjFnTmtDeDV1TFZKcmlLYUEwNFB1bGUyYzNy?=
 =?utf-8?Q?g6lo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:02:35.7346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2651ed49-f411-43e8-962b-08de30f30b4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468

On Mon Dec 1, 2025 at 3:52 PM CET, Alejandro Vallejo wrote:
> On Fri Nov 28, 2025 at 6:47 PM CET, Andrew Cooper wrote:
>> While we do this for unknown user mode exits, crashing for supervisor mo=
de
>> exits is unhelpful.  Intel in particular expect the unknown case to be #=
UD
>> because they do introduce new instructions with new VMEXIT_* codes witho=
ut
>> other enablement controls.  e.g. MSRLIST, USER_MSR, MSR_IMM, but AMD hav=
e
>> RDPRU and SKINIT as examples too.
>
> I don't know how often Intel adds intercepts (or whatever the VMX equival=
ent is)
> without default-off knobs, but there's a potentially dangerous assumption=
 here
> about all intercepts being synchronous with the executed instruction. Som=
e might
> depend on other events (i.e: NMIs, IRQs, IPIs, etc) and injecting #UD in =
those
> cases would be very insecure for the guest. It might encourage the kernel=
 to
> interpret the current instruction that the kernel can't know wasn't meant=
 to
> ever trigger #UD. This would be an integrity-compromising mistake to make=
.
>
> IOW, I think this is a dangerous default to have and Xen should just cras=
h the
> domain irrespective of CPL. At least on SVM. If a guest executes SKINIT a=
nd it
> doesn't exist=20

... and it doesn't exist, it's fine for a guest to crash. The domain crashi=
ng is
a Xen bug, but the bug triggering is a guest bug. And that's ok.

Sorry, those linnes got lost.

Cheers,
Alejandro

