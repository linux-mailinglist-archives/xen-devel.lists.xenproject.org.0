Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A3BB66BC
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 12:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136517.1473068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cfR-0007N6-9c; Fri, 03 Oct 2025 10:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136517.1473068; Fri, 03 Oct 2025 10:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cfR-0007Km-6b; Fri, 03 Oct 2025 10:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1136517;
 Fri, 03 Oct 2025 10:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swgf=4M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4cfP-0007KY-JN
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 10:05:35 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dfdcbf3-a040-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 12:05:31 +0200 (CEST)
Received: from PH7PR10CA0010.namprd10.prod.outlook.com (2603:10b6:510:23d::19)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 10:05:22 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::9c) by PH7PR10CA0010.outlook.office365.com
 (2603:10b6:510:23d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.17 via Frontend Transport; Fri,
 3 Oct 2025 10:05:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 10:05:21 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Oct
 2025 03:05:19 -0700
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
X-Inumbo-ID: 7dfdcbf3-a040-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9ctMBZUr3WsUUUKU44PJHOkwBJgAl6xvSEsTPqilDDuS2eVKo01UMzom78k1sD+orzdEoARHb3d6jo34+bqqAXaLn9+PM8TATfAb92lrMVo1/mKoipJyImudySxsc8Tv6Cbq/aHdv3p9DrcerX5Oxd7H7atJdfP7rxTIAG/2vCop/KdUCa/Ms9WxvdB/iDDruI7KYJUFcLwsrj/0/ce4+fIwa0PHpQvI9O/PKMxUTdFKqpqXRJbvF9BhkWjGkuiFejVdtKIvL30JIE7xuPD4rMSXT04W/IdXglpIE4oSgnaPmW80QC7iKWfKKv3AIRZBR+8tuoooh6vBASPPKcAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G5ZTsr4oeDnjEW7f98NiznSh4CHSoXlhyMe1fIbGuY=;
 b=Gjmj5zL78cCaSNTdtTe3LMknH54Oj2aUf4XFTPVy1B6XLRqhhgYyHFc7W4wfQ1raBGpNzcWSGJcDNbMDIFoEaDBaBox7qOJn/J0LXEXgG5oyDPh+HJMc8aL5e3W6m+HzrT4FQn/IxG7/5DqIrlTJ3BdAXolLw7wpTagAELFfO18rgFKoUhF/nrBp4sddbjqX9kooSCfp/bqoinsmuGfs0OM0Mr4C2aE3IxRgFxfyFm3pUOR39uDsOv21Ls/O0HPJ9f9k/RFjfiqJN0xj8cvRKfFKBoY9VsNf0yHmox+NujkOGkbj7vnXQc7Gvh57af6/suQEObKBZV78UtNW0FnK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G5ZTsr4oeDnjEW7f98NiznSh4CHSoXlhyMe1fIbGuY=;
 b=4jyF2oWlSSWyXo5ufjtitr9mSV8hVKXk/eazmPjbQR36yi2LEYAvUVKIdmxdNgc5NvZDbPxpgvFQQYoUxSvMJRXthZPhIlOyaEv7RrZfcZjUnDfa8M/RVD3p8bdyeNSVhnzbNrhPoqTeHsWp1DdbaUY/JJkyYzDyW6jyoVeynF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 3 Oct 2025 12:05:18 +0200
Message-ID: <DD8LPC6M7AOI.2YFMXY9IMGXJP@amd.com>
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Milan Djokic <milan_djokic@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
In-Reply-To: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b25d96c-d677-4140-36fd-08de02645d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OSsrUWVoQTRBTEsrV0Rkd1ZCUUJnc1FZdVUzTnpqVVY0UldlL1F3MWFzZnAw?=
 =?utf-8?B?UVNyOVV6U1c1dElkRlVnQ3dIT3c1cnFuWGhLakYyQUpqS1FJUmlpc1o4T29u?=
 =?utf-8?B?WENYZkwvdEVVNmxzU1k5VnBjMlpMRXcyZ3FWdm5DT29abXVraUFEY0NNcDlp?=
 =?utf-8?B?RnhJSS95cUtRVXE1ZThIbW5PL3l2TEFYUkFUYVJJYnVEOVMyTllJUW5yay8z?=
 =?utf-8?B?QVpwMXRrYWNlQWpnUnIrTy9rUHd0REUrZGdzdkZidEZDRFJnUnRHUXp3Mm9w?=
 =?utf-8?B?MjIvWmt6czRlVnFkOGw4N0dwYTNUUk9YOFRWcHkvWXppczg1QVpkYXhIalg2?=
 =?utf-8?B?MkhhbW92RFlVOEEyZzhoY3IxK29ONTZZWjhNTnB3VWxPTzlGeDRqRGY2ajdG?=
 =?utf-8?B?ckxlV1NaaHFsQUtLUU1WUno1eVJUbUs3aW5zNFk5NFhwYXdMcnVSMzllT2xL?=
 =?utf-8?B?bktVWUR2R1hKajlva0pueXk4bVZnSlpIVzdkV2FlUU1HUjgwdjFVSmJqUFFC?=
 =?utf-8?B?dnlnai9VM1ZLZEdvaVh5ZW9FcHhiaVJHQVJEYTJ1aGFIcmJqTjNISFpCV21S?=
 =?utf-8?B?ZVdZdXczSWdRVnpqZmMvUVR2bkMxQ2pabnBqWTZ5US9EMWxBMGhGaTlUM2Jr?=
 =?utf-8?B?eHNvTCtoVElLYVByNlRDdWFpcVprUE52bmtxaDFxSzJBMGFxSXpOeGtlN0dM?=
 =?utf-8?B?MDk3KzVFR1J6WmVDaTU0ZmFGNnN6dGYyaHVVZHhhYy9qQXIzdE5ycTQxYkhq?=
 =?utf-8?B?dGg0c1BtZUJOTmdINmJuSGR2dE1EYnlObld4aTg1L05wV1VXd281RDYyYnRC?=
 =?utf-8?B?Sk9JcktvSUlxajFlNkRSNnZ0UnNTSWNFeUJEMENwNWE4YUhhUVFnaWh3ZVRX?=
 =?utf-8?B?UGd6YzBramNNbDZQQVNnSHNjSk1ESVNRQWNDdk1ZRVA4ekpYUFpaMWs2Wlhj?=
 =?utf-8?B?WXJPNnl4SGp1bmZXYWhRaXQxK09FM0o1clJ5ZU1xbGpyZ1g3NWhWYUdQZ2Vj?=
 =?utf-8?B?ZzBkL0RWL1RMZmtUNG9HYXEyc2pkUVZWZ2JSTmtZaUI2YmRDMGluNk51NnBz?=
 =?utf-8?B?RmZGWTdoYzFkZ1BKSWVVOFpMa2wrSkpXY2JiRjJGckVuVWlrbENLYmFENHgx?=
 =?utf-8?B?TnQwMmFVVkZrMERCMURETnhnNm9DQVppa1BDMHloWDRwbzM4M2pWaHhFczJl?=
 =?utf-8?B?d0JDcFIyY0NTeWpMVHhUNGNXVTdOcGVLQkxmZ25lb1BXdjJ1d2FFT1NhZUlP?=
 =?utf-8?B?V2Y5a3pEc0YzR1oxOHJVWit4Vm9sTWxDT2daNll1NC9sWnVrVFk4bDViZVJF?=
 =?utf-8?B?eTltcWpNYkNNdndQRllZTU9ZU3E2WXZQd3BsaGV4c0xFTVZsS2ZZYWQrVk5P?=
 =?utf-8?B?dUhjcm1HNGZLWlBNb2tDY1R2QmVYdzFYaG05eWUyQTBERjhPZWltbXZKV1Zu?=
 =?utf-8?B?Uk4zcm1wdkQ3czhPUXdGQ1FXSVpQS0c1MXk0QlkrUk5mTnY3MUFrRUdzVEFi?=
 =?utf-8?B?bUJZSmdNWVV5b0hPQXl3aTdIbzZQY091QXUxcXN5ZDJMU2NheVc0VUZOcjh1?=
 =?utf-8?B?cUZLeC9sdENBY3lYN09CMWxrK0NadFY2T2F5R2h4WHpnUXcvRTcyQlkyN1hl?=
 =?utf-8?B?RC96VVFCcExpQWRYTjlicmhJc2JhVE1Ia2pFWEhPYXVwK0xDQWswVHJhb2dD?=
 =?utf-8?B?ZndiQk1XNVFFUm16QW5YeW50Nkg0clNyTmRNY0NycW11bGRGcjdjZXFraDZN?=
 =?utf-8?B?elJZbW5kV2lGZHdHbTJtdTNWblB6TkVQV2loUTYyckVZYzk3bnlBbnJaRkt0?=
 =?utf-8?B?THVJZC83MXZEUjNxeDM2Z0ZicSsyTE02YU5WbmFOMTB3TVJic0pnenYvak9L?=
 =?utf-8?B?RFRsMWkxUDJZRjM2QkVPRjhMTHZwd1J4cnRlN3FGMWdqTWc3UUs5N1BVaHFF?=
 =?utf-8?B?QmJ3VG04clNJMWprNHpKNjJYczBoS2NrdTBVZFMzOHdXQlB6NFVoaVpENC9o?=
 =?utf-8?B?QitQTmZpYzcvRzZWS3BsRG1kUFZQQWUwVmJmc2pCU0hIZjZYVTBJTUdCQW9i?=
 =?utf-8?B?MXV4NE1JQmVNY081dW5OSytESFMvWWRzSzhmelhzR2ZNZDJ5bVp5blBzeUc4?=
 =?utf-8?Q?3xeE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 10:05:21.3711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b25d96c-d677-4140-36fd-08de02645d11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483

On Wed Oct 1, 2025 at 10:01 PM CEST, Milan Djokic wrote:
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>
> ---
> XEN_DOMCTL_get_address_size hypercall is not implemented for arm (only fo=
r x86)
> It would be useful to have this hypercall supported for arm64, in order t=
o get
> current guest addressing mode

Why is this helpful? You're racing against the guest transitioning between =
32
and 64 bits, so the result is stale by the time you read it.

Do you care about the instantanerous bitness of the vCPU or whether you
created a 32 or 64 bit guest?

> and also to verify that XEN_DOMCTL_set_address_size
> performs switch to target addressing mode (instead of relying on its retu=
rned error code only).

You can't use that in HVM. Even if you could, why would you? What's the ult=
imate
goal?

Cheers,
Alejandro

