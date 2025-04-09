Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C8A821E6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943776.1342412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SXC-0003b3-Q9; Wed, 09 Apr 2025 10:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943776.1342412; Wed, 09 Apr 2025 10:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SXC-0003Yu-NU; Wed, 09 Apr 2025 10:19:54 +0000
Received: by outflank-mailman (input) for mailman id 943776;
 Wed, 09 Apr 2025 10:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx2+=W3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2SXC-0003Yo-3n
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:19:54 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2418::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c149ece-152c-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:19:52 +0200 (CEST)
Received: from SN7PR04CA0224.namprd04.prod.outlook.com (2603:10b6:806:127::19)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 10:19:47 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:127:cafe::81) by SN7PR04CA0224.outlook.office365.com
 (2603:10b6:806:127::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 10:19:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 10:19:46 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 05:19:44 -0500
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
X-Inumbo-ID: 2c149ece-152c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KApGUgmYthx8hS4IhTbp7QlwGK94PckHNS3iiX9RRQSWRtJ4BO7px3PYjxNE4ZbqqEyCElF5Nrn+/8VHTI/ZcZWogJEWlhG9nRUsWYgQ4nXJJn1DB52vGwQX6vnZkecXjlJN2eqBGY0cAc0aXQQX94u4EoXuTmbpZNoemG/7YbeFtwG1sBKgSymbv0kon7ziaIqIYDFPyrvWaW35+R89QG28jjYMA1BI4YN/8PX+TDjzhrNzJ5OqnMNZiItk3TnowOVSx5rLcdQUpmQG4MmyyBuhCp7vkbKhixMjcA0XRi2TWLLJdCVNyKXc7C2imbqSTm+Fi4WcvgQbL0hICp0GPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlAKGnRoQUjpY8Xm997hHWannmGhk1xufV4ideu0GvU=;
 b=txlSejfkl4YuIhBMK43cyNj6AePZKxOfrdUiFHy3La+21UVT3gzlfq2txnQX1N6szlTK2sarQG/IEHAtqUTdTZRRZbarpwozrZqLX8hJz58rax8bInAeQDc/DjsP6kUsdQk21TRpts7MgxseGAkTpFq8P9oAzBcCbkVZgzVGY9bfME87EAhJsDyio/KnYc2FGXF086vfklUFUfAgp2D9/EDGgCyiI19Lq8GyeycA/B0LsvQvVAgIOjjZPzOqORnPcK6iOpRACVunXM8uNiMGEIM5VqjOEs4L6If23zk+BW+wn7pjn+QRie/UUIWMlZ4SmpdCHhrFco/HJhs9WlsFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlAKGnRoQUjpY8Xm997hHWannmGhk1xufV4ideu0GvU=;
 b=foQgaw5FdcUWtpoNasamWkQrqxPuFYo9CDoqGLInIbSURytZEWPNxIYD2zMNKzqreAQ7ThNT1suBfIBYf0BRE/tbeHeyCeQJ9xPANuPtAmxi/sy4Jztl0QJm7PNJXWdOuCXyaoNP/cq6UzC+9NEyWmnIXNbMNlmcXFrwkdWoDU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Apr 2025 11:19:42 +0100
Message-ID: <D9215Y1EFDAG.ORR7VWT2BSLX@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Julien
 Grall" <julien@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 00/16] Hyperlaunch device tree for dom0
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <1d809170-bef0-482e-bf6f-6da84204bfad@suse.com>
In-Reply-To: <1d809170-bef0-482e-bf6f-6da84204bfad@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|MW4PR12MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d109bd-30be-47b4-747d-08dd77500de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWxVV292dU5DVGMzajNMejFsNnVhWllzRkg1OGt2ZnZtcjFiQzgzeGRGdnA4?=
 =?utf-8?B?ZTJDM2FTS3ZzTDUzYWxNbzNrc2hnL1VSbSsxUVBSNjYyakJGVWRkWTRYajV1?=
 =?utf-8?B?NC9ZSzlabmpuWlh2a1d3QVVLMGlaakE4c0RXNnc5UnMwelRXNTRRK25EczZv?=
 =?utf-8?B?dktKSGVMK0hpaWVyL1JZd1ZjRXN2M3pDeVZQRlJDZ2kvSG1mTkU2cUFveFdY?=
 =?utf-8?B?a0VtSUU1aUpSK0tFeDFiVEJQa2szRWpDZTVIK0RLMUVOR1NXRXFwdkNqcVZY?=
 =?utf-8?B?SnFSdFZPQ2RRbDRueElsb2lhYkdjQW5wNUFrY2RLaGpYSGp3djBsNXZwK0No?=
 =?utf-8?B?ZTg3TFl4bUlFMHZDaG5xS2VFenUvR09XWGFVY1RDTklaSmhFeG42WFBVdGtI?=
 =?utf-8?B?VElrNys0ZENWY0V3MVo1MytMVlU1cldGNThuQkpPUFNPTG9JakZ3QTd4MWZ2?=
 =?utf-8?B?QzM5ZFd6QTJ4bGk1RitSRUpKZUQyVU9walVPRVkwd0VGUy9EUTdpNmpKYWxv?=
 =?utf-8?B?SWtJMEh1N3h5amJscTNLQ2V0SjM1NmJ4UG1WZlBKNFBEQmlJZlA2TTl3V2hI?=
 =?utf-8?B?YVJkT0hFbVp3L0RPcVBORkI5OWJscWdrdjdqLzFndGljeUI3UXMrdExwK3VG?=
 =?utf-8?B?WmpETU1kaW1FT1ZUd2RaUzE5c05Ecjc1bzJhdndRaEJqdTg5bUxvRDRtcGxM?=
 =?utf-8?B?YUJOWGFqenNlUlQ4NVdxd0JXTWxYcGNvRExlNzcvcTJDbVRscW12M2NlRzJm?=
 =?utf-8?B?L3B2a1dCakZYamJCNFkrYkp4ZC9jNEZnV0FUVldrTFpRNWM1eWZjL01LVXJu?=
 =?utf-8?B?M244V2JiTy9rRk9lNWZJa0hwQndNUnlWeFErSkp1Szh2MHJHUFBDakw5blRj?=
 =?utf-8?B?Q2NDbXBSOVB3d3RSUFFUYUgrbE4xTWk4ditYRmwwRnRrc2UyUWpYN3E0UFVt?=
 =?utf-8?B?WkNiTmJrbnVSb2E3OWtsbUZWeU9EbC80UC9rSUhCZDFtNUgrUUtyKzRMaHhk?=
 =?utf-8?B?VjZWbmFoOEdOVDc4OXlLV3R5ZWxPOXlkYkNGcDcwbEFyN0pnckRhMis5Szgr?=
 =?utf-8?B?V1lvWjFpUUxkQWFWR1FuRTNiQU9sUE9nQnA1THZ3TXliVDJLeERuZjJTOVRy?=
 =?utf-8?B?amF5TkZPcE5SdDlZTWFLM0l3Z3lGZmxCS0RKYXJTeFpTVnFyaW15Y0NZNThZ?=
 =?utf-8?B?WjRsVDdQOGJRTmZ5TVhHWUlISDYyV0V0R0pMdVcyZVlnRlVPU3grdXNwdWI1?=
 =?utf-8?B?VUZLSFFnUmI5NWpVVXErY3RQNG0rZFdHMldhQnNuOFU2ZldHdnN1am44UmRU?=
 =?utf-8?B?cXgvc1hGYkIwcFpYY0UxMU40YUJVKzE0aDdnNlg5djcrVDlRYll6QWZhQ29W?=
 =?utf-8?B?ZFRmSGtaMGNKdlVxSnowM0lsQVc2SG5LUXdjbkQyUWQyWXJYYWRJZlhkTGMw?=
 =?utf-8?B?R1cvNWpuUEpHZTlNc2c2dVRnbU9YdmlVQTQ1djd5eEtuTmVGdDZTQWxRZXYv?=
 =?utf-8?B?ajRVdyt5cGFxSDBITHBacFdGWXhscEMxeG9FV2hBNUNPOUNNNXYvRVlDdk1I?=
 =?utf-8?B?QVBmZmtFc0U0TlY1V2NwVzZGZEtWY0gyTUdMenltVmZNODNiU1VoVExvWlBh?=
 =?utf-8?B?YkpuTWowTUFqUXI1SDJpMWo5YTQzT3lLVkpiTThwMXVuZkc1dlVNRnM2Z3py?=
 =?utf-8?B?NlU4UEsybUxhbUNSUE9UTzdSM1V3T3d3YkRQZmwvaWlUUzVvWUI2L2w5YStr?=
 =?utf-8?B?SEp6d0p2MEVuUGhaUytXV0ExVCtKeVYvRWVoUEdiVTdQZ0Jka2dLYlZUb2hG?=
 =?utf-8?B?c29xVUZmbGJES1M2K2VPL05XYjBFbFhpUW9JZFRRVzl1cmhqdGYwVVFQRVMz?=
 =?utf-8?B?RVgyTmRFaU9ObXhieFJnS3o4MENlbktjVGl4MkkwK3oxRTRPMzlKZlErbDhq?=
 =?utf-8?B?MXhsaDVBU25VYzF4cmtPa0xwRDZmbjQ0N0Zwa3EvSS92UnRmRGI3V01IZTRa?=
 =?utf-8?B?VWthcm4wSXFTaU5sQUIxNzVuVHZDekdQNm1mK2hhdWNGMTdtdDNaVnZzVWFZ?=
 =?utf-8?Q?VWTo5o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:19:46.9862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d109bd-30be-47b4-747d-08dd77500de4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031

On Wed Apr 9, 2025 at 7:29 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> I've purposefully not added my S-by on anything I haven't touched
>> (besides rebasing) as most of the feedback had already been addressed by
>> Jason by the time I looked at it and it would be utterly nonsensical to
>> give myself authorship over it.
>
> My understanding of it is that S-o-b doesn't indicate (only) authorship.
> See docs/process/sending-patches.pandoc "Developer's Certificate of Origi=
n
> 1.1" point (c). And what you would want to demonstrate with adding your
> own one is agreement with (d) there. With this I'm not even sure I could
> commit patches becoming ready in their present form.
>
> Jan

Fair enough. Will add myself everywhere on v4, then. Seeing as there's
still changes to go through.

Cheers,
Alejandro

