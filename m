Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8EDA82272
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943843.1342473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SqK-00039I-K9; Wed, 09 Apr 2025 10:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943843.1342473; Wed, 09 Apr 2025 10:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SqK-00036z-GN; Wed, 09 Apr 2025 10:39:40 +0000
Received: by outflank-mailman (input) for mailman id 943843;
 Wed, 09 Apr 2025 10:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx2+=W3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2SqJ-0002JG-6h
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:39:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecdf8d90-152e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:39:35 +0200 (CEST)
Received: from SA1P222CA0048.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::23)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Wed, 9 Apr 2025 10:39:29 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:2d0:cafe::44) by SA1P222CA0048.outlook.office365.com
 (2603:10b6:806:2d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 10:39:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 10:39:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 05:39:26 -0500
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
X-Inumbo-ID: ecdf8d90-152e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruxbAm6HaE2IL3yskvY0/lXJTapzrBbtkCPOhJeESLndEejgCe29PCTatKXbyK7IXiBHqmyJeKUsHXgn5ZcU/zYmAVuvmsmCPg9Atwgn3/gdaPj1Q3MHuJdrLDZkUbV3Oj7+8AXhf9nDB8BoW6QUf6t5FA9O5zU8iWrk0gnKrQVQ31gRgyTQLu9D364NphULiqCkrxZtv3S7dbeMDLRKmj426czdVK3wYHzocmaLMJjoRa763HP+05zyzGCEwmMcNdjjr+rTx1ytJbfZDyvPaGDlPWRcfVQLxTCjxKC03vgXQ0rfj7gb1T+GyBIhG+knSzYL8b9M9Hxm4Js5NaB2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gqcuz+psfemaUYqAM7CQ3QQkk7KSwNUxqN3LeM97AU=;
 b=FeHUxRE8WmschfjuRtMdhdFNOTuQy8F9NOpSxCFkHZS4f5TKWE2XCN+RAWf6WjtF+Cso/wJ60k5jl0VF2y28ybuxWdm0aCe/j2kFMTCUm9KC0PwRx3Ds5s5qAqjTpA7VQCQMogwzuZgBVfunDdgFkGOPwey8Yi4N7Pn5xV+T+Bx2/DghONLeboO3zN5awj+j6ALK64k4YgFCJWSYBwprmALHl6cu9WRqofAmlhX+VSe3urkyOh+tGd3gUjQxiPlA3ybLyIqC3+J5CLfeA5PqHI0Nzh15lh8tU05OXfmynMQXJJPjZc+HvP2j21wyCm56H5rFRTDWHDRxjrV+Q9eirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gqcuz+psfemaUYqAM7CQ3QQkk7KSwNUxqN3LeM97AU=;
 b=0khZgzL3ckEnapXCGi3SA8Ge807BcgJDhcEIX3Xa94ZuXiUmjhcigrrIhZq0CNgUk2pYm5ZvE72ihTzDa5g9EI2FlfkqAZN38G0uZjW58X8qSez6RZYOCeEfzpl6xYH/vvrA09HBliR6DJq6s3AcFUNoPBc03VxJDEAjBiVqpZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Apr 2025 11:39:24 +0100
Message-ID: <D921L104T75I.1ILCT2YAF1XC8@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Julien
 Grall" <julien@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v3 00/16] Hyperlaunch device tree for dom0
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <1d809170-bef0-482e-bf6f-6da84204bfad@suse.com>
 <D9215Y1EFDAG.ORR7VWT2BSLX@amd.com>
In-Reply-To: <D9215Y1EFDAG.ORR7VWT2BSLX@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d8de04-2d75-4f20-bf04-08dd7752cedb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enB5MzhPQ2RpMmV6UDVCWVlFZWNiWW41STVvdW9JT1R4b3FZeTZ1MFkzcGl3?=
 =?utf-8?B?b2dEWXB4MXVDdWErbjI5NjY4Tmo2RkdFbkc5MzNvaXNqYklOU2tkVUJwNlds?=
 =?utf-8?B?d01kT3RpVjhJb0FJSEg0NmZ1QWM5ek92VW1aUVdJSVh6TDM3SjI2UjVwOU52?=
 =?utf-8?B?YVc5azFIZG54WVlBZE0vdE8vRFJmK0tiZU03S2ZPaG5FOStVUkNpQ2JIMytC?=
 =?utf-8?B?d3NObVFwV0s3T05aRC9Tb2ZrcVM1c3BDTXMreDFER2pnZTZDTlpWbmxzWGh4?=
 =?utf-8?B?ZDNoNXJqSjFwK3FwK2RiL0p2UnlwWFNISDhRRzQ3bmRBcXdiVlNjS2g2b2NC?=
 =?utf-8?B?Z2lOQlZKSXU2MTg0UEFEamJKQWpnaXZicFppa0J2MEgxRTJsck1vK0xSNCtZ?=
 =?utf-8?B?YmFNOUdhREJraCtTSnl4alhVeHR2ZlFCSWYyTVE0Tm5QYjhhSDJJY1JQSUhv?=
 =?utf-8?B?OGVjS2VYSCsrRHMyTUl5QXkwYWs1RFFMYWJLWVk0YzMxRnVrdGRveXNJQVhY?=
 =?utf-8?B?dUprN3ZKUVUrb0tialRtazg5a3U2MjJPRThEeUVlTG55djBWLzZJN0lXZzVP?=
 =?utf-8?B?VUNaMk1GMy9WRGJxd0VUT05QaUNyREtuOG5XU1RGdEJYNjZzM05mWGNZNEtm?=
 =?utf-8?B?SDA5OWpWUUpRMFRuVXE1cmhneXg4c2FURVVvbXkrVGQxdGpCVHlmcGtDZjQv?=
 =?utf-8?B?VzQzQUMwdDZWSlhkeXBKWGdyd1dTRmllRUlXT1QwNEYyQys1b2ZWZkNZTGFN?=
 =?utf-8?B?YWlzTi9IV0pkbmFFT2JaM3JOZnplUExaQ3NvdEkvaEpmdFM1WExrck5JS251?=
 =?utf-8?B?N0lwK0NIazRNb3VXNnR1KytkSnpJOGlINTVNRnJmM2JnTE1iTmc5ajh5bnMz?=
 =?utf-8?B?aTlCT0RwT2d1UjFBbkoxUjhuZWU2c2F0V2I5cVNOc20rVHNwdkhVOFpoQ2tF?=
 =?utf-8?B?MHZaMDlGM1A1djlXdEdsZk9nY09RY29qeXQ4YkV0RUg0bmIrUHBWQm9haHN1?=
 =?utf-8?B?b2NRTjNJVEd5YWRqUUluV0x2M0hOWi81aXZNL1g0dVc0WkppRWJ6TEJ4S2V0?=
 =?utf-8?B?eG1vYVpPUkNZaDB1VndqTUF6NjNmR0c5VmxlN29zOVlXNnRjQ2NFd2laZEpK?=
 =?utf-8?B?U0Z3ZCtUZUNWVUliYWhWT1kzWW14dWRHakF0MmJQU1lHZ0kySkUwNnVYWTNa?=
 =?utf-8?B?Y054ekJ6eUU2QXVISHVNd3pQQVVaTGtqV2MyeDVqalE2MUxlV2ZaN1pyODhi?=
 =?utf-8?B?LzBkekt1L2RSVkhWUFZRZVE4ajQyQ21JeXA1b1pienFrUmgvMjhaVWRmdzFn?=
 =?utf-8?B?eFFra3ZMV2FXNHVOM0FIQzZTUDJpd3pRMHBVZnBKRTYzNC9aV1hmWUJ3OUFv?=
 =?utf-8?B?dE5HTzhjbDVsK1dBYUV4QWZpb0wvU2hSZldQVURMS1ZIUnA0U2Q3SEdtMU9k?=
 =?utf-8?B?SllySFdYckovVnF3aDJsNnY2VktGMlVzSjVtWm9CcUtPRk5ReGdVb2VHVUV2?=
 =?utf-8?B?R3FTSjVyQ21LTk9MeWwyUmpyYlJHTkp0Q3lReXd2aVlJeW5STDdsQk5sVVRF?=
 =?utf-8?B?MEp0MjNWK05KcTlkODZGMzBuTnkxQlRHcENNY056N2JQQ0xPUFdmUmpmaGE3?=
 =?utf-8?B?TlFWQ0lVVHRrV1I1RVM4UnB0azRZUGpsbkdpS2FxNVRGSFpUQVFnYnZLOHdH?=
 =?utf-8?B?UENPL2REWnhLN0pXSStyQ1pyVXE3K3BneTJqM0I4emVvVkRzejJCempDMzRK?=
 =?utf-8?B?S1RrMUhIaEhCOVI1THRFUzQvR0JPaWxSMTUxVWtEb0Q4dnM5WXZuR3lKdHFQ?=
 =?utf-8?B?Z1FPN2hWeG1zWldCS2dmVDBPdGxTcUNIVWQzUGtVVnJ1WnV0Z2t5OGpDWHFx?=
 =?utf-8?B?SFdyamhyMno3eFM5Y3g2QW0wM05FbmgxWnQ5c2VxZUlUWG1nRDYzNktKSHNW?=
 =?utf-8?B?cVVka0J2RWJEMFZqeUtubERienRtejBzWk1MMW84TXZiVFU1ZVE1L3VxL2ta?=
 =?utf-8?B?TSsvZXVkOG5PSG8rR0VxbW9scVRSQ0xWZkVlSlhWck0wdHJzbldxNGxkVFls?=
 =?utf-8?Q?i0qGHP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:39:29.7228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d8de04-2d75-4f20-bf04-08dd7752cedb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289

On Wed Apr 9, 2025 at 11:19 AM BST, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 7:29 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> I've purposefully not added my S-by on anything I haven't touched
>>> (besides rebasing) as most of the feedback had already been addressed b=
y
>>> Jason by the time I looked at it and it would be utterly nonsensical to
>>> give myself authorship over it.
>>
>> My understanding of it is that S-o-b doesn't indicate (only) authorship.
>> See docs/process/sending-patches.pandoc "Developer's Certificate of Orig=
in
>> 1.1" point (c). And what you would want to demonstrate with adding your
>> own one is agreement with (d) there. With this I'm not even sure I could
>> commit patches becoming ready in their present form.
>>
>> Jan
>
> Fair enough. Will add myself everywhere on v4, then. Seeing as there's
> still changes to go through.
>
> Cheers,
> Alejandro

And FTAOD, that also meant an implicit

    Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

to everything in v3.

Cheers,
Alejandro

