Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914BADC987
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018178.1395108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUcL-0003pl-Cb; Tue, 17 Jun 2025 11:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018178.1395108; Tue, 17 Jun 2025 11:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUcL-0003oK-9Z; Tue, 17 Jun 2025 11:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1018178;
 Tue, 17 Jun 2025 11:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wDO=ZA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRUcK-0003oE-Mw
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:36:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2406::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54c3e7ec-4b6f-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 13:36:39 +0200 (CEST)
Received: from BLAPR05CA0030.namprd05.prod.outlook.com (2603:10b6:208:335::11)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 11:36:34 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::7) by BLAPR05CA0030.outlook.office365.com
 (2603:10b6:208:335::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 11:36:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 11:36:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:36:32 -0500
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
X-Inumbo-ID: 54c3e7ec-4b6f-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOCG0I4flZ9h8dEWxSBJL8Bjju1Ix8G3YoxG9H47BLidE9NbPTo9S4Jjd/YTKT62LdtWsgtB+Qy6LidWWKMl2Uuk7riMBhnlqoonLd37JTOKemz8/b0jGjmLBxK1BAaGDhSSoqP9IWMqd0NMh+VrScIvouvA/Z+3QTWCUCSESuEcSuaNaqPHWqPPrmaTfrXozdC+GtPe6v7/JcLjXjqrnyL879d0uQbI1Y+uMCJTT5ZlTixz0VOL+as0Lpjd1KQbQWEZyIsBUy+CJLJ1/u+Xcpsen1sbbCXCBlep4wo5pcYMudj5Hj1n05Ae+9f0GPAoqh4cddwblwmvaifInbslRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+hLMQohkGA0mRWXwRR+PeBKyEaJsyg0lqF1Eox3Abw=;
 b=Ki5RS7ASAWrg0c6AZjNhaoIr6cFB/7k4Aj0aOFOA4PuBUiapYfRQy1HIfHY/CguSCtWC5wWua32EWuwS5O2v8jauL3+aw7Bu/HlyyCA/HgYcNM+tADIQ6QYdWnuuaSrLWufqt4SeOCoBGWKc1W5ihgHCeeF5VwvkkxHCemm6FqOnlWRRc2Jcvc12caTLAVJpiKOlpQ0h2JmdxS4WYP05ttTuDK+YISEwYOnQ2a3+W5kowJovmYVI6Andn4d5cOUL1hMIij554ERvbcBXDF+PU+makNk6nHzJov1tnrUvyERL+46Hm/z1n0v61TckEiRuX+V0hq5acMtftBSDkctHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+hLMQohkGA0mRWXwRR+PeBKyEaJsyg0lqF1Eox3Abw=;
 b=dhozMuaI68KvpB/3YGIy3HQQNL0p1csASiDfdxgrmY3WB/YkGMxp8cJ7e2gnjkX6cWU7wNYTKCQXUymgnX+l8WwheXE56Wb7rbwcVPol9fXAjmIWrC6N3PEbETkcqXdiXsNLqE2jM8MiuGq0gKHauBjJcRa5qHsZ/m1MMMwp8b8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Jun 2025 13:36:30 +0200
Message-ID: <DAOS0C133ZYB.2QNMHIAT6J7DD@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 05/14] x86: Replace arch-specific boot_module with
 common one
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: c12f32e2-f9be-4df9-7c85-08ddad93365a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW4yVUdmOCtYMHNDSndWR2YwUC9BNG1pZytIeTZFSmZYK2dQQ2xiQjNEdXNm?=
 =?utf-8?B?dHJKTjBBRFpkUy9DZnFueTJVRW9lMjlYR0NpTkx2cGVrcFNyakwvUWhEdEZN?=
 =?utf-8?B?UGhUVDdHOUNXT2hrWDV0Unl1a3JiQVdLWUhHQ0lTekcyWGxFYWREekNXNEJF?=
 =?utf-8?B?VWFmSk1uQTNQWS93Q1hkS3FmZGdMaFMxZVBzenFTcnVBY0lja1VZNHNjYXJL?=
 =?utf-8?B?L0kyU0o0UUdXMXhIMDNnbjlObmMrL0tYV1BGdFBFeTVmR0tGWk5GTXdrdTIx?=
 =?utf-8?B?OGc0aGIvV2djZ0JhRnBlOTFseHdQY1ovQmNJSm9ockVzVmQ2eGE0NEJWZUFZ?=
 =?utf-8?B?VVBtWnJCRU5tVUQrcmxHV2wwMkFOV3VKbS9CSktDZ3F5SFpkS3VKM2ZGU3gx?=
 =?utf-8?B?S2JGUURaakhCWFhLS2RPVTJyM1V1cXZDTEJ4aFhvTGNYYXh6cUFoRmc4UjB6?=
 =?utf-8?B?QWMwWms4RjhtZ1NxVEkrRm1ZQ3lWQlRoRjYzQWJWZVB2UHdCTUh3cHBOZ2lG?=
 =?utf-8?B?MmZKcDRiYzEzbWdGZHpQdUZ2MVM5WVd3Y3p2YUE0RTZTVndKbkxuREhQWG80?=
 =?utf-8?B?NlBQeTVWVFRiNlUyajAxeGhhRUR6eW1EUXVWQ1p0S0QvQUgyVHBHL1dNbEd6?=
 =?utf-8?B?QnNVbjlaS1FmdVBjMEdLVkVZYWNaQnlIM3A2a1VVbTdGSWlLTGNwWDZ3YXZP?=
 =?utf-8?B?YVU3Y3NBUEp2YmFjYkZqYUVHQnN5b1NLSUlpY0w5dzBUNWpEbmxEc1hWSW1K?=
 =?utf-8?B?MEJkYWVyOXluL3YvOUg3OThpR0ticTdka0p4UEtwdHBGaWh1MmZkNWtFTEps?=
 =?utf-8?B?WEpDc2hpVGJIc1Fsd1czeTFETi9laWRaOHgrRXRGQnBTOU0weDVXeUJlOC85?=
 =?utf-8?B?REwrdndaK2VSd2luVDBxRjNDNEZOOU5SeS93dzRuZHdXa1Vnc1Q3RGsxY0J6?=
 =?utf-8?B?cUtlNVhlZjZBQ3JkUis0eGNGNWRMM2hxaEk1bXZwb20rbTZub2tGdHg0cEFF?=
 =?utf-8?B?NklsNWxGa3NNNElaa2FnNkZLQVBaSDRneVRkb0tReG5JL0U1RnpNMSt6RVFt?=
 =?utf-8?B?NExRdnkxbmVxb2orc0hzN1NzeFJ6U29FZU5VWno5bXFUWDYyM1hpTGFRYnJE?=
 =?utf-8?B?ZitaTnNkWnBHTUwvMzcyZTNGamdHL2RGNk0xQWlCd0JhektTWGlyUWNFTHZT?=
 =?utf-8?B?NDJxeFBHUEU0c0tGQ0NhaTBKQ09vK3JoM0Q1ZWhid0lRTFBzbGQvQ1VNQTla?=
 =?utf-8?B?M1NwNmtBQ0k4STNnWE5RUHh4VFQwRWxXZ3d5bzVFd2RUUFgvOE9vdzlLa05O?=
 =?utf-8?B?QTFQVmJ0c0tQdXhMcHZod3RyQjFGR2FsOXBmZHVBRjMvQ0h6WGxUU2VoWXA0?=
 =?utf-8?B?NThXa0RyTW1HQS85Z25PdHFyb2ZJbzFadXlMeTlzMmpPbHlNNHNRbVBONnJ6?=
 =?utf-8?B?ZmMzVCsrOEhUODZ4ZXh0NmphUSs3SjR0cVQzN2N3TVpkSjNuZm1pdFZpSk51?=
 =?utf-8?B?SExTTnZmd3BheWFZanB6a0R1aTEvUUxMdzJWZkF5K3NIZ2ZjQ0tLc0NJRzFB?=
 =?utf-8?B?ZVlqT1N3dzJCSW9vY251UEJhcFEzeC90Y3pDcC9Ca1R4ZFZNWEFOT0RaT1lt?=
 =?utf-8?B?N01ZUXFkRzVsT0I1bk94aXFSVjQzdkRnMTRsUlhmWlA4U01CZG1uTEw4akZK?=
 =?utf-8?B?NkpJTzkwYXpzdWRtUm5CdjJlRkxMZXdEUkdVR29Pc0QweWdxUlpJa1hOK2FL?=
 =?utf-8?B?ZVhUaCtobGlyRFljVFhPODBESHFXUmlFTi8vMzRHTFdTL3J1T2QxRkZ0WDEz?=
 =?utf-8?B?clVvOXdKa09uK2V1Tm5SK20zbjk5eVpMdWxpQVNBSUttZjl3ZHlwUWhTaHdO?=
 =?utf-8?B?b0pwMXVuNVk3dmVaZDlmSk96YSsvekdiZ2pnUHZJOTk3T2FRMHdUK2NRTGlo?=
 =?utf-8?B?SFcyM0tuNi8wbS9RYmVLa01pV0MyNzlxOFVHOFcyeW9sbWI3dDZzM0NZajB4?=
 =?utf-8?B?LzVwNzR2V1JFSk5haHZkUUV4UGlKVTYzZnVLV2FtSGN6bUk1c1dsR0NlWFZj?=
 =?utf-8?B?TCs3NUNzdEVwenUwODhXVmlpQlhBeHpVajlDUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:36:33.9705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12f32e2-f9be-4df9-7c85-08ddad93365a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141

On Sat Jun 14, 2025 at 2:54 AM CEST, Stefano Stabellini wrote:
> On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build=
.c
>> index a038e58c11..8d2734f2b5 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -648,9 +648,9 @@ static int __init pvh_load_kernel(
>>  {
>>      struct domain *d =3D bd->d;
>>      struct boot_module *image =3D bd->kernel;
>> -    struct boot_module *initrd =3D bd->module;
>> +    struct boot_module *initrd =3D bd->initrd;
>
> It looks like struct boot_domain is still calling its member "module" at
> this point

Bah, yes. Way too many lines in the diff.

What's _really_ fun is that the pipeline passed. Including the job to build
each commit.

  https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/186863671=
2

I'll have to look into what the hell happened.

Cheers,
Alejandro

