Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D5DA82205
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943804.1342432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SfJ-0007Cd-Um; Wed, 09 Apr 2025 10:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943804.1342432; Wed, 09 Apr 2025 10:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SfJ-00079d-S4; Wed, 09 Apr 2025 10:28:17 +0000
Received: by outflank-mailman (input) for mailman id 943804;
 Wed, 09 Apr 2025 10:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx2+=W3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2SfI-00079V-Cu
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:28:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2009::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5709d184-152d-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:28:13 +0200 (CEST)
Received: from MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37) by
 MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.31; Wed, 9 Apr 2025 10:28:08 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::f8) by MW2PR16CA0024.outlook.office365.com
 (2603:10b6:907::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 10:28:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 10:28:08 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 05:28:05 -0500
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
X-Inumbo-ID: 5709d184-152d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc/q2uTYLCvPJooskCBhK9MimAp8FkNPVaGyh/1Dira35xMq2d9kobd75YqIVkog6o6HkIW61XAmurAP8POc9bmg2CrG7LFqyPPGu2baUXrRiA0kBccfR00nmxa4+KN+CaPisQylveUlcdMtfcbPt3WvLuhG/L1S8pq3JicBu2coqSIT6VcUst2nUPakq1PLfk83mNWH3Tl1x2UldcGm10FA1SU7rUYVqRgRQMLZyVwQaozZp3mfzDZUX12/b1jlU9i/qH4dTLLPD+0ku5qtBahICT/yIrRxwrd2ENWeW1LBl+VzeR0qi6k6Rm5+gx60gPdczSGik/GuLirm/hA0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIqEyIM6x0v6E3ZGjk2b4m08c5+ps5PMNq22O4+Mjd4=;
 b=a2L29mkn3QS1rzfqeMvGhVenHbbt8yKnhyVgYmYAf7WznnuxivtEIjClCQXB8jiUspEAmQHiSZ9za43EWn/bpk4RgI+Ot+teDaxWH5hpyeDkjncCfOYB6VPlUeOEs9jQHKtfqxCParZJbuDhx0909oTjCgaJ0+98tnC78e3GPaCfx9AZZxeTv1sun1T7eCVvRGS3BgN466yNiZeMspP7CaD8eZZdd+dOWE1aNsZ2RzW6bGaDN6UlUKjZbX+/zFRQPO3xGyZsx7q/xVWo2cNyAQfTZO7PPzY11xVkKvQ4rDJUGJ63IRLW1T7tSTpQyJq0iIF/Upxx40JyLgpMeTq+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIqEyIM6x0v6E3ZGjk2b4m08c5+ps5PMNq22O4+Mjd4=;
 b=lY6DwHt9btRBZ2piQmjcJyO6wAcAG4rp6qcmYdL2rurF8k/Djvaa8QLyMJrt8T2kv3qe51EEAI7hUwt+04zPiNh05vDXo3oZ+PLXRdHiJQsK2aA0GSuj0Vc82xHPYDRKX2y2JF4fsRsoUq8cQPuclHuqRBDun9GazVdqdSUl4J8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Apr 2025 11:28:04 +0100
Message-ID: <D921CCFOSV90.2LUNCRRSE6Q5M@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
In-Reply-To: <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|MW4PR12MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b78f76-b9a7-49c7-663f-08dd775138c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmQzMUpDU3ZVRHFlS2RrUDdrOTBlKythMkc4K24yalIxVmdNamFvYVd4ZEls?=
 =?utf-8?B?dk05L1FhOGltMHczdENoVmZBZXppTkNZMkJ1L1J6L3VQaW1qUUt6cWNZK1Fs?=
 =?utf-8?B?UytuMWNjeWFrdjg2REhjNklRcjZzeHZCeGsvU0IyRFYyL1IxL25SZUhHOWJo?=
 =?utf-8?B?UHFtNldYdUpJb1NwL0lNN0xLeGJzNXpHQ0I1UlRWdndDZUNRVk9IRU5PNC9n?=
 =?utf-8?B?Z2NCcUI2dUk2Y1UxektnMDBUN01OODQ0MzZlbytzVlVWS0ZtcnNabFVKbXNi?=
 =?utf-8?B?VTV2MVR1bzVXTDFzT3VkL3N6TEJsTzBjVFB0eS90SlVlZktLcnNNditwT2N3?=
 =?utf-8?B?UzhzQ3NwNVpZYTJYamN5WEhMbG1YSURJMmczNzk3YklPb21pdmFpYmJrRC9G?=
 =?utf-8?B?dFB1NU9COFdTSW5hWTdnbFJieXZNMnQvUHBnWW9YRTZKRVMzbnZBaDZUWHc5?=
 =?utf-8?B?M0ZnWng3R1hzNEZkQWxJb054U0NxREJWMWg3U3VseE9OenBYRWJDMlpHNTJu?=
 =?utf-8?B?UVZQOUNxN0gzdGFZSGNBeTY3ZXNyOSt3VTdFQTZtSjRkRGlySm10cnNFV3J2?=
 =?utf-8?B?VGc1TTcrbjFZdHMxaWJhdVdialBUVkVKZmdRWjhVTlRhQkpwMEE5TXlTRmFG?=
 =?utf-8?B?ZnNCVFZ6OStuQUtFa3RqWHM4M3R6QkxRWTMzWlFBN1EzWHZCM2xiUk1oUEd2?=
 =?utf-8?B?M2VuS1RhNzRZTVV6R2Q1V0xnOUQyakdhSXZZYlQ1RjFzMHREdlcxMHpxMmV0?=
 =?utf-8?B?c3F0WCt0NXA3Umh6MWxkVFNXSDFUQWMySjlFR01YRkFhNlJzajVQWFJraDNs?=
 =?utf-8?B?SExZcHJnQUVBODhIMGVLYzVUZmROenFjckVoNXpBVStTZUxVcGp5WC96b0ZD?=
 =?utf-8?B?RDluaEZCNUNzNlZ2Z3c4dDlKSXUrK3AzOE1lYXcxeXFLNTZ5dU43Tmd5bEVY?=
 =?utf-8?B?VHU0YWJMSzZSVUdPZ21lOVJRSjRlTENPVTlxaHhCMEp0eHFydWQ4SlJzQWVB?=
 =?utf-8?B?QlZhUDN4RFluZ3BQZzdVR3FodEZHOGhuNFVIdzFLbEVHS2EwaXcxUWVXSGdN?=
 =?utf-8?B?cHo1amxoMU04eDZkR1kwK21DN2ozaHJ5eHM4Z3JUT1ZHNU91VTlsSG5DNExq?=
 =?utf-8?B?d242bU5GeVpuUUhHOVR2RVdKWkxLQTFvT1ZPNVNFbWFLNmRZd2p4NkNLS0Qw?=
 =?utf-8?B?eXFMaGtKcVNMOVMwbUZCdVJaTkhRN2hheEVHNEpoamJGbS9JZTB2N1BseVNC?=
 =?utf-8?B?UVlYYW0xS3hmWW9MbnpSemVEU2NuRENpMGJ2SzdLSHNMa094RXhwN2dEZTFH?=
 =?utf-8?B?Nm82d0ZxUnFINFVrcWhKcEd1Z2ZhVk9kTi9pTEJwNTRUVytOdXl4MFdWK0tN?=
 =?utf-8?B?WWFaV2FsRjB1blNINkplTThIbHJiMEdQMkdGcGRyRERDWnNZdHp5L3g5WTZO?=
 =?utf-8?B?SVpPRW9FVWdzT2ZWc1BJalBTcG1mZENSWWx5UmYwdHBBcFBrUm54dVVLVElC?=
 =?utf-8?B?Y1BNaWxUUm11OUFQR3JhWk4zbStzQUJpeWtxa2lJR05PaEZpdG1qUGRFNHlU?=
 =?utf-8?B?YU1VcmVuY3Ftbm0xejM2YU5kcVhCOTJPTWhMQXJOLy9mZnlTbk1MZ1p5MXJo?=
 =?utf-8?B?YkQ3TzQrVmxXKzhDZk9CYVc1Tjl0YXMvTTN4RWdRWDBKc2RGT1N6aFZGS3Nm?=
 =?utf-8?B?L1BCUGF3czV6OHJDcEI5NjgzQTZwc0o3NHJUUmZuOEFFTVJLaDV2N0NIb2wr?=
 =?utf-8?B?Rzcvc0EzbXlMQ2xwdEpKNVBjUGxhYkE4b0ZYNEV3RGJNanJuNXN4MVF6MHc2?=
 =?utf-8?B?TE9VbUx0T3lodDBiMlg4ZjVaZ2J0eXBmczNvV1BncnpNOFRHRXhVQUtXNHNJ?=
 =?utf-8?B?RFBUYUZneG9lQU9ZOTFqUnJjMjIraEJNUWhaVEFiSVVGZGtvWDJET3lZcVM4?=
 =?utf-8?B?UGNmZWt2YTVYYk5rUFl4YU45dkUwbG9UNDBnSjZUUHQ3emg2U1VIME1meFZT?=
 =?utf-8?B?d0FrL1hYQ2JyT1ZQVHJvdjhXQVFIeWFWWWZYcFFBRzFlamhJZGlqQlZyRWdn?=
 =?utf-8?Q?Ngbh+f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:28:08.3327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b78f76-b9a7-49c7-663f-08dd775138c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898

On Wed Apr 9, 2025 at 7:24 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> To begin moving toward allowing the hypervisor to construct more than on=
e
>> domain at boot, a container is needed for a domain's build information.
>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initia=
l
>> struct boot_domain that encapsulate the build information for a domain.
>>=20
>> Add a kernel and ramdisk boot module reference along with a struct domai=
n
>> reference to the new struct boot_domain. This allows a struct boot_domai=
n
>> reference to be the only parameter necessary to pass down through the do=
main
>> construction call chain.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks

>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/boot-domain.h
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2024 Apertus Solutions, LLC
>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> + */
>
> I wonder if the 2024-s here shouldn't have been amended by 2025 now.

Maybe. I didn't think about it, tbh. One could argue that Daniel and
Christopher's original contribution was indeed in 2024 and the fact they
weren't committed until (hopefully!) 2025 doesn't remove the fact they
did exist in some form in 2024.

I don't particularly care either way, but tend to lean on the "it's fine
how it is".

Cheers,
Alejandro

