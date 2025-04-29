Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81813AA0970
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972060.1360470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9j3c-0000Zw-Kv; Tue, 29 Apr 2025 11:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972060.1360470; Tue, 29 Apr 2025 11:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9j3c-0000YU-I9; Tue, 29 Apr 2025 11:23:24 +0000
Received: by outflank-mailman (input) for mailman id 972060;
 Tue, 29 Apr 2025 11:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9j3a-0000YM-J3
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:23:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2415::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a4b3d30-24ec-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:23:20 +0200 (CEST)
Received: from DS7PR03CA0211.namprd03.prod.outlook.com (2603:10b6:5:3ba::6) by
 IA1PR12MB7590.namprd12.prod.outlook.com (2603:10b6:208:42a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Tue, 29 Apr 2025 11:23:16 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::e5) by DS7PR03CA0211.outlook.office365.com
 (2603:10b6:5:3ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 11:23:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 11:23:16 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 06:23:14 -0500
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
X-Inumbo-ID: 5a4b3d30-24ec-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy6cQ7xDhyIJGgn2LtsrAu1JdrTSby/UqIAdMsUWiOqBr/9fUgov2YJ1Jki0eIapue8OEKV8xy8oxB7QoM7g8VB0fiVW85Ax3Rj156TJ20EfgePwAPW/2rXO5vkcQ6aQHOWncAsVG5d396tt+OYjxR4cSrzkoq77tIT77hUHY0guvKH+JBvbQrUMmMt6ufjY7LifSRwIKUQrcmpgHz9e1MS1XnK0SpjzgN4BLphIm/91yx3ZBVdKZhrenvv7R77D3rLz2HQXgBjhsbj5VBOlmKb//ti5c0TE/AzdF3bKVLA1tdRj1LeebQMcs0DL+jAHY2ce47j4YOMfsFT447u73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxngcqNyQFoCyXhRaLSUeeJ3ReN4p9F/M7ziXji+s+8=;
 b=jLvRRS1XDHZbNeIAgTBv/sQzopiT5FViCWKcGKsMI/+1yKT8SYVMk1r9Q2UlvJGXtVg6rgZQD5F4p70PdetbdFn8gGGuyUbu4TGf2Jtep+TJXoLWLrFMWvH8ptfhxTlmrYCvz+kQKnH5Kcde8Ib6amn0jSPk/fPswZ7z2xmOw0iQb5oJFRQJIdrgcV0tIcy501Iqt283hgO14EI3gV+pTfKU/PT1GkOHEQQIQ6W8vA5BZGpwN5r/1ghdSliCPYHhm5pYZvcSdo+XK+RtQkBoczlLh+MXY4n0GE3TWSJcCTFDPXnmXqC8FbD44EmOrUdv3AXtqUuVZ72UCxKqJ2Yk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ariadne.space smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxngcqNyQFoCyXhRaLSUeeJ3ReN4p9F/M7ziXji+s+8=;
 b=niUE91hMxp7sbYelvsTGJ6UiRR8Xt7zKW/D9GNAMFc3Z/IAd+mLcRoJD6zvdLlyBucDZtQGK/h7fl/9KyvAoH37RrgDBa5ouNgnixsslV3HaF5bxk9TCRVZp32p6HCA4aKvy+Vr/KQymCJIWP3hsN1+4QjE/GP97c8RsQnDDh9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Apr 2025 12:23:13 +0100
Message-ID: <D9J31GQHZWX2.3TMGJW5VZ3S4T@amd.com>
CC: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v3] x86/hyperv: use dynamically allocated page for
 hypercalls
From: Alejandro Vallejo <agarciav@amd.com>
To: Ariadne Conill <ariadne@ariadne.space>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250428195736.2516-1-ariadne@ariadne.space>
In-Reply-To: <20250428195736.2516-1-ariadne@ariadne.space>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|IA1PR12MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de08383-9952-49c6-97a9-08dd87103c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkRBaFlRUnp3RkluYkFqN3lJOGUyT3hpdnExTHQxZnBaWjJqamVPelF2ZGdk?=
 =?utf-8?B?eFJpWStOeDZaNkx6RWRjVGVtK1BaZzlmOEs4d0RROHJtSDFtRVBhT2F5cFdH?=
 =?utf-8?B?QnJYRis3SjZ3VlB3RFU2VGJvQ1dsSlc2d1J6TThpQkVFNzJBVVQzQmpPSjFK?=
 =?utf-8?B?c29LM1VoeTR1QXJkdXZXQmt0SEJmN3o0dkh1cWJiRVpGNU43bDllQUt5SVJm?=
 =?utf-8?B?eVpCMkpyMGkxNnpCVHN6NHN1djMvUjRZTXZkVW9mL0VRTW5IdnpDbjhXVnRr?=
 =?utf-8?B?NHFkQ1lRSXlsNFZ4NHVhdldpSFJWbTF6cVc4dm80SHliMkF6R2pkTVZtMWJs?=
 =?utf-8?B?cTdzK3BOb25mdkVhb0xiZHdNZG5uRzZyM1ZzV2RXU1FyR3dzV3Y1amE2eWNp?=
 =?utf-8?B?Wm4wR0k5aFR2RWhzcEhxYkVkdXcyYUF5NzVZQVdwdTF0OS91bytqNFErblUr?=
 =?utf-8?B?UjJtRnFoZm1iZHVaK2VBejFwb2dnaE5vUkRDQmNRS0V6eDZ3N2ZKRXh5U2gz?=
 =?utf-8?B?a2dhSld4L2tWOVUvakk2RUJoVnlpRjNyN0lZeGlMMjY4cmhyV3Ftd3F4dnBy?=
 =?utf-8?B?ek8ycldWL0tZdXZya2Nha0loZFB3cmVJQWZLK2llMGJTYzFwcnVqaS9XYUlT?=
 =?utf-8?B?QWJialJ4VlNoNW91Vld5c0sxY3JqdG5JdnZuVGllTFlydTc5S2xGMys0aFZ0?=
 =?utf-8?B?M1l0Nzg4UzRQak1sekpVelg3MlJBVitEVnROWVd5ejE3RVg3MXlZK2lrOWEx?=
 =?utf-8?B?MCtEaFpXQ3p4RWtaMEZ1MFdvN1RWSVhITERmQ0ZBOTJsK3VrR2FRTUZCMEtZ?=
 =?utf-8?B?SjZBNXI3c241ZTRwV1RjaUdDQ0lsR1E3TWJ1Q2dyVTBuNEZyU01nYTU1TTFn?=
 =?utf-8?B?S1N5NXJ2WGZMZXh0UWs3azZkaVROQzN6eDdwVjNKcTdLR21ZVnY3N0Q5TmtL?=
 =?utf-8?B?WU13eU5OWGxnSEYvenpkSnZyNk5rVEVOQ1ZGV3YxSEJqdjUvUDhoczEvalYy?=
 =?utf-8?B?ZFlmUUE0VU96bFhwUGxFTTM5MWdlc1AxN1FPa2pmVjlQWHBDRUlBeG9wc0du?=
 =?utf-8?B?WDltanhRQ3d5aG4yV1orUVRFTDJtV2t6M1RqWkdRRnpFenF1OS8vc1pqMjhF?=
 =?utf-8?B?cFhwRFZ4YjVJZFBrRzR5bUx3dFUva054NGdIYkZWUUxtc2dRWmNpZDhoZ3RL?=
 =?utf-8?B?TEpFOGx5NkhwcGcxTFNRVTRKTzIxMy9GZGE3UXBmZnhtTmNGNUV3ekZXK0ZS?=
 =?utf-8?B?c3EvcnZ1eEhSVWtRaTlMaDdMWFNBdlpPR0NkamxrWFN1VndaLzZ1S1lJMDJD?=
 =?utf-8?B?RW0xNk9mMzZnblFsSlpxSWFqQUpHaFRZQVp6eDdmK3RwbmxZTEJLV2RQZ3Qy?=
 =?utf-8?B?bHN0VGNrUUZOQXg2aHo4Z3FBRWNOWThCZG8rcHpTczhVK3dIYWgyTWZ5Tnpr?=
 =?utf-8?B?eGpVNHJyYk0wTDdmT3RnRlFRcS90OHNnWHJHaGNvTllMYzVLZWU4Wkt2NWti?=
 =?utf-8?B?aDVMWVc4K0hVVDBDb1l6UEtVd21Na3ZoWWVubER3UEZBZGFsWUVvV0pyclNO?=
 =?utf-8?B?YzU5cXpNeUZtTWR5L0txZmdjR25nZXdJT2dJa3hldW5oVmNzUWtQeXBhSkkw?=
 =?utf-8?B?dWJjR0pGeWFkOXNUaWVDZk5PaTg1LzVycW0vbHYzZE9TZ2lDeHR3TnVyb2ps?=
 =?utf-8?B?blJzMlpjcGd5OEZFWXRzTTdra0R0ZXJ1cXpJWFl5YStnNXRBV3UwTTdzeUFv?=
 =?utf-8?B?ajRjNlQ5bjA0U01XcDI0Rll4WnlOVlJRcWNudWJweHhxMThrOU5zZmhXbzhu?=
 =?utf-8?B?LzhXR0xEUDB1SkJQN3ZMYjdUZTdyOVgyUGJIYndBWmlJMXdHWkh5RGdic1lz?=
 =?utf-8?B?OU1lZjV1aGpKVjdibGlUMU55LzFOVVV5elhVK3BZclcvZ0tWSGowMHpHNThy?=
 =?utf-8?B?QVpLSlNGR2xydkR3UXpXQWVMVTB3c01DSHFkeGxQYjhHU3lFcXRrYjBYeFBK?=
 =?utf-8?B?MnRsK3l4VzhXSTg3aWYyZnltaGo1RXdVMnhicGdvT0Q4M2VkS3ExeGJwM2dB?=
 =?utf-8?Q?g2XN1E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 11:23:16.0837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de08383-9952-49c6-97a9-08dd87103c8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7590

On Mon Apr 28, 2025 at 8:57 PM BST, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.
>
> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.
>
> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> Cc: Alejandro Vallejo <agarciav@amd.com>
> Cc: Alexander M. Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>

  Reviewed-by: Alejandro Vallejo <agarciav@amd.com>

I'm happy with the patch as-is, and I'm equally happy...

> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hype=
rv/hyperv.c
> index 6989af38f1..f69f596441 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -98,10 +98,18 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn =3D HV_HCALL_MFN;
> +        void *hcall_page =3D alloc_xenheap_page();
> +
> +        if ( !hcall_page )
> +            panic("Hyper-V: Failed to allocate hypercall trampoline page=
\n");

... with Roger's suggestion to probe <4G first with MEMF(32) here.

> +
> +        mfn =3D virt_to_mfn(hcall_page);
>          hypercall_msr.enable =3D 1;
>          hypercall_msr.guest_physical_address =3D mfn;
>          wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +
> +        dprintk(XENLOG_INFO,
> +                "Hyper-V: Allocated hypercall page at MFN %lx\n", mfn);

nit: This is a personal preference thing, but I find %lx is very
unhelpful when the variable is something like 0x123, as 123 might be
misinterpreted to be in decimal. An mfn is not nearly as problematic as
an error code, but %#lx avoids the ambiguity altogether.

Cheers,
Alejandro

