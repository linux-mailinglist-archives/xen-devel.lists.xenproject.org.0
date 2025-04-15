Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA76A89C9C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953709.1348159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ec6-0004Wm-1j; Tue, 15 Apr 2025 11:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953709.1348159; Tue, 15 Apr 2025 11:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ec5-0004Tf-Uy; Tue, 15 Apr 2025 11:38:01 +0000
Received: by outflank-mailman (input) for mailman id 953709;
 Tue, 15 Apr 2025 11:38:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=moIN=XB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4ec4-0004TR-LI
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:38:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12e15804-19ee-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 13:37:56 +0200 (CEST)
Received: from PH7P221CA0073.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::30)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 11:37:53 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::ef) by PH7P221CA0073.outlook.office365.com
 (2603:10b6:510:328::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 11:37:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 11:37:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 06:37:50 -0500
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
X-Inumbo-ID: 12e15804-19ee-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaJBJLDcLOQnnEGsxkZQZbwnNxkNBkTURig3WnfYLPmKIkhtJieBbEcioSW3lAQQd50fo5yRZCZHVmcXSJTfJ4cLKrmhEwtF56NfKoxTMPcTET4lKJ7CofqtCInmBzi2hE75CICQeyDNgjJF09chwPJ2T1uMKTq3lCgz5YvlaSTKpLwDaSnpzTF2Qve8pSaRK1k4XkgMi/GThlhGGILb8uFj/pwbS9l2Ud3DCvWAXn6tWwkVw5YmGR5DGDNvtP0lTrREt5RxK1EloeFneXMZsaaHFdEhXW0NSOCyGrfn1a4nLKJhKYbzB139twP48xcgywyxQQ2ExesiNbNrKntFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2yb35nhrlCXpfZJSny/65bIuzSJP1s+/Zo+2Q3mgBw=;
 b=C3EoO+tl6a0NYIUXEcSVPgvEp0KpR49MEOXRXPk78RtTGKCRhiLGKwAWsiBReVFiIqvTmx3egb8jqWZfx7a2i/+EhcLOay9Ek6gyygaW8mvuD4uJ1+ga5bym0U+SJOXihjsXIPNYgUT1U9UEnOJXdj4Ks9Sz0fU4tU0rundOqSmwLBEl8PbGvpNgaDJyY/0MSJUqp5ZQXb4ytpufBVDuxQjR1BNWpGa1ReMpECc7/X5D0nWAyHTs/swKMuX4TGjVxzAqZp4prwWggHC0O8qFjsHkNJrNrePaX8TbYW+EtfmtZYIf66JL/zkCZhyO7bIOQFOzMRHJ7VXqLxI8fKrA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2yb35nhrlCXpfZJSny/65bIuzSJP1s+/Zo+2Q3mgBw=;
 b=dLol2KKXxZxJgLhYi9G23YbM4NefSmntGAGb8VsaeSIImqQYVkZxeGbaeHi5ZsBwciijVtmioFaZD2xxJ/wF6WwxIm4yakIt9JV3F7lImbop8y4OhDjseh0EkfU7aeSOinOxPZfeqFnDFwvlWowYrU9GUDWMXYPtw0MRpqoH7WU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Apr 2025 12:37:49 +0100
Message-ID: <D976L0UZ7GJJ.2IKE0CKO5Z7EC@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Denis Mukhin <dmkhn@proton.me>
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to
 domain config
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me> <D96K8KED132J.3C79EPWZM813D@amd.com> <1e86b0e1-fa1d-49b3-8718-db43099772c2@suse.com>
In-Reply-To: <1e86b0e1-fa1d-49b3-8718-db43099772c2@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c1ccf5-5606-4528-5a63-08dd7c11f54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2NDSm5aZlBDeG9XS1dBc3E0R1VJOWE0UFd0blVSMm5mV0tFNm9EdlFyVkxH?=
 =?utf-8?B?R3R1RU9COGZUMUZ2M2lOOXZENzcrWGVzZXVVRzMrOEh2WHV6eUVDTGdLZ0Zo?=
 =?utf-8?B?ZXU1RnZNWGNqSW9odTR0ZEROS0dmL2dRVVVwOXNXSkNJeVVwRS8zUjR4a28w?=
 =?utf-8?B?emJ6Y2haZHdUL0RHbnBNbGhNUlJsallhaVBTOWpZTTZlVWhJekpxNEFRR3Iy?=
 =?utf-8?B?TWRJN0xuODhWTG5uTEhBd3VBYi9iZ0gxdGtQVGxhL1J3RmFwWlJKK1BCUXVX?=
 =?utf-8?B?b1dPS3BLQjBWVjJ0MUk3M2RUZEk5NWR2S2RUdnpPQm1wYmpndkNQSGVYRzBF?=
 =?utf-8?B?QWRYd1ZxaTl1NGo1TWtWcWZCYm9zRkY5N1VFYXJId1RMbFgrbGRaamlaOFRL?=
 =?utf-8?B?aDNBT2ZISURHY2dQU01tbGt5bkp4TUE4NU14NEFDUkQxdWZZY1VYa2Y1MUc5?=
 =?utf-8?B?d3NXOC9FL212Y3cwRWZGNjNCVUpta2NoWnoyOVQ5VDlEVHlFQjh6UCt5ZDF6?=
 =?utf-8?B?NStQTndCR0U3Y3lkUU5kaWJ3MEs0N3hubjZzTnBwUjZvSUU3NVRla1ljd2tB?=
 =?utf-8?B?N3czUEJ0NXZ3KzVLcE02K09pZmdQOU1KT1dSRUlIWFZ5Tzd6WmU2a3pxQnFt?=
 =?utf-8?B?QkR1c0VkUkIvV2xYYWIyaEVyRVUwbVE1UHJEcU80L1dseXZLalNuMHh0NEJN?=
 =?utf-8?B?YSszOUdMbkZZVkgzUEJFMndBUnhkSXVyekNwTEJrSkpHS0RtcWY3eGJ2VVdE?=
 =?utf-8?B?QUE2WHRLRnQ4dHpkREM4YVNRVFNaUDhLMk03ZmJ3d0Z3ZVhNS2NVS1ZnNFdm?=
 =?utf-8?B?UjdaVXBhQlJyVkhlL2ZqbGlYTER3eVZWVHAzRC9NOG0vYXcvWEVpUldVc002?=
 =?utf-8?B?cHhpeFdLS1Q5YXFLQ0ppRnZBNFlmRzMxMUVUUUJpcHMrSldKdmM2MjJaMEV4?=
 =?utf-8?B?TDZGd25kYmJpUnQxaVl6UkVzZ2Zpb3FWbHRZMHQ2WW9zNTlsd2t4bndnWXgv?=
 =?utf-8?B?ZXB6VCtzTFJUT1NOYVNpclIxYWZUdXZySGJBc1lSUG5iRjZPMU1vc2gvamRx?=
 =?utf-8?B?WTNqT0VidzVEYWEvWlpkOWJBeml5Q3VXSFI3WlRnVEJtY3Y4Z3g5ak4wWUt4?=
 =?utf-8?B?L2Y0SkNZNnBxUnJuMWxEY20vQU5uQVNXUlczRHVtOFMzalBQRjRLb2RseUtV?=
 =?utf-8?B?YnFWR1AvNmJVYWtBNURiWUdFbVFiS1pydUVoek56T2p0UWVUVjg3OFVzd0hl?=
 =?utf-8?B?Ny9MQ0lyY1J0Z2JYdkVOMXB5SW4wM1k5eUwvTFVTVEhKWGptWHBIQWc0Zytr?=
 =?utf-8?B?OUk3aXU2YnVrTUNpTUV3QUNhNENXSnBRV0huRFRDQjdhWUNRUVNmYWtRNzNh?=
 =?utf-8?B?cGdJdEk2R0h4anc2bkNFSVlYWm51RDBoczFjcHpKL1NFN1AvOGt3QjFrNmF1?=
 =?utf-8?B?emh4WTF6VThYQWd1RzVxR01YbHdRRWsvcnlFakhHWVkxUUlpVXUxS3NMMk93?=
 =?utf-8?B?T2l5SVNFcCt1UlpKUmx5UDkxSkczdVJ1WksrOTJsalJkWjJ5S3VCWFJMandx?=
 =?utf-8?B?Yzg4dzVXOUo1Lys5MUpFb1ArL0M3N1J0ZnB5Tmc4dTczOFllbFBqZkg2VXFI?=
 =?utf-8?B?SGJYazdTTXVSVFFoMUFzTnQ3SDcwQ1hhdHhRdEh3ZEtORkpWdUNIN1FiOEFC?=
 =?utf-8?B?eC9YT3phU2xHMzc4YkRmQ3V1WE1qS080MzI2Ty9mblk3eTJOSXB1RCsvbW5N?=
 =?utf-8?B?QnJYaDdxZXFKTkkzYnlNNFNqb2NiM0J5Z0N5ZVhsRU9PR21PMlpCbHJDOWFq?=
 =?utf-8?B?cDhQWTlidnRYR0VMVlM0Z2Z4d3JTSUs2amhZZTFZZzdia2hrUzhqSUQyS3R2?=
 =?utf-8?B?ZXR6K3FsV0xtL1lHMXdCeWQyY2tQNkxBQTRscHRiNEIveGFzNXh5V1BTelJV?=
 =?utf-8?B?eUdrUEVITVZ2S25sWGRaVHN6UFFudDlxbmlyRWVodjNZc3M1Uk9PNXpwMjFC?=
 =?utf-8?B?Q3Vmb0cxb01rK2RWc3JZMzFMTTgrcnNSbWFWc0NSWnB0MlVpYzJ6c0xGcElR?=
 =?utf-8?Q?Fuzs/f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:37:52.7432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c1ccf5-5606-4528-5a63-08dd7c11f54a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069

On Tue Apr 15, 2025 at 7:21 AM BST, Jan Beulich wrote:
> On 14.04.2025 20:07, Alejandro Vallejo wrote:
>> On Wed Apr 9, 2025 at 11:15 PM BST, Denis Mukhin wrote:
>>> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd=
.com> wrote:
>>>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>>> return -ENODATA;
>>>> }
>>>>
>>>> + if ( bd->domid =3D=3D DOMID_INVALID )
>>>>
>>>> + bd->domid =3D get_initial_domain_id();
>>>>
>>>> + else if ( bd->domid !=3D get_initial_domain_id() )
>>>>
>>>> + printk(XENLOG_WARNING
>>>> + "WARN: Booting without initial domid not supported.\n");
>>>
>>> Drop WARN since the log message is XENLOG_WARNING level already?
>>=20
>> As mentioned elsewhere, the point of those prefixes are to be readable.
>
> This, however, imo is a matter of consistency across the codebase, not ju=
st
> within hyperlaunch.

I agree. There is precedent though for certain printks to have a
collective pattern for ease of reading (e.g: spec_ctrl.c when printing
mitigations). With I'm merely justifying the 2 spaces followed by
lowercase.

I did try to remove them and it was strictly harder to know what they
referred to.

> Plus (again imo) if anything, prefixes that are part of
> the log output should contain proper words ("Warning:" or "Error:"), and
> they shouldn't needlessly "shout" (i.e. "FATAL:" is okay-ish to be all ca=
ps,
> but the others aren't).
>
> Jan

Right. I'm happy to rewrite them as "Warning: ..." and "Error: ..."

Cheers,
Alejandro

