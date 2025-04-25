Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499DA9C916
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967901.1357626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IMe-0006Hx-0D; Fri, 25 Apr 2025 12:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967901.1357626; Fri, 25 Apr 2025 12:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IMd-0006FU-TD; Fri, 25 Apr 2025 12:41:07 +0000
Received: by outflank-mailman (input) for mailman id 967901;
 Fri, 25 Apr 2025 12:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8IMc-0006FO-CI
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:41:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2418::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c68e6a6-21d2-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:41:04 +0200 (CEST)
Received: from BYAPR05CA0071.namprd05.prod.outlook.com (2603:10b6:a03:74::48)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 12:41:00 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::ab) by BYAPR05CA0071.outlook.office365.com
 (2603:10b6:a03:74::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Fri,
 25 Apr 2025 12:40:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 12:40:59 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:40:57 -0500
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
X-Inumbo-ID: 8c68e6a6-21d2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mw/bkPrDJeE3hB7EPfzPNXapypSKwMtVFqeR+JkkYdIIMMeoDBfz+YVUEOI893EpzPNuoxQgclP10r4skbTnVX/7JuZh6xlT2c+M2KgP48XVlaZlmx+zbcx+WmL7KEtKjV6X8uKarp2Ah//7Th7uN1TH8kqTZCcMtXR/z1+vzjrPaqlEYlmhX7h8dXnshcVLEJnTJX+/115PPUj3jWWHrhV+ullxBgs9cv3W6bKVOvKrb7dRrgGzG3V5ku5WjnyYJ9q0TbkAI1FV+UiG6QCvwtZLnD3vZZaWyrzy08w0uWzE3qoujrknZQwsskPTn0YuIJayXx77OfD9sGIa5pRfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj05Nef9tml9IMjrZFGWs3G6Itzb/yvhwRqLRa/UMGs=;
 b=qGExuRTWhaaNK+z38AvdiPeg0BKUFDhtWzd0wqN1+GRrOJA5b/S3DH6p8HElOlaxR4EqOSIkoQ/wes86yU9B/qPyUvI8TB1EobXF/bEA9m2SyRlmcVVw3xyZJ+nDhZEu79/QRjq1F1GZFt7zh5CXZsMStXT5Oq39OBdnl4YMKDbd2Edu1zMRi98h9+FyWZ6KIWNwM3r8dsEEGNwqcnv5RW0302QZn87f9fhV9+kZs/mCiRAca4ae7UJ7hpB8NDu8CMcAQ4IBKwE2MicWAcHz/AJbLoT0/9gKTV9BlhGSWTFsTV2S+vpcs2dy+PcpqNqA2s9ClHbwFsaN33QgpHKXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj05Nef9tml9IMjrZFGWs3G6Itzb/yvhwRqLRa/UMGs=;
 b=BnpjApLKd6WdAAYVH2r1/c8JeEFz76VImRZ+wRCOtRchgzTZxqanTaahIbxjpaBUKt1MV4bc7n+oLlh17pvYY9DHTcrqgr2gKvCYNPLNtITVXy4AvR7URCl8G2yNdV5uZsWnFo9vx6JYikBDmt9vgjsK4wztgQccuSmv84Kytl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 13:40:56 +0100
Message-ID: <D9FQ6SCMB5BW.H4C34X9UIEP5@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/12] kconfig: introduce domain builder config
 options
From: Alejandro Vallejo <agarciav@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-2-agarciav@amd.com>
 <4f634f22-3947-40f6-ac2e-5670376a7980@amd.com>
In-Reply-To: <4f634f22-3947-40f6-ac2e-5670376a7980@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|LV8PR12MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: d84fbeda-1b21-4d62-fc99-08dd83f66e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3NJaFB6YVU2M3hYZFlCQ1FLd1dPWFBvR0FSdUIxMXFpT3NQTWQzeU52c280?=
 =?utf-8?B?NzNHeFVzU0RpYStobFZLL3RWemtPWVJ1aWlLVUwzd0ZrZ21nR1lCRkhwVnJ6?=
 =?utf-8?B?Q2V1ZEpiRE03Z0h1akYvbG9ZeEFoTndJWVBGems4cXdLOWFwUkF6RTh1bk96?=
 =?utf-8?B?TmQ0emRJcERYWGZvNGcyOUcyOUFQSGVlL2laclA5Wm1lRUNpSGpXK0lzclpO?=
 =?utf-8?B?MHZ0OHpvaGl0UVBXbnBIZWxFL0lMY1EvVmZ4RFdiNGUyNHd6UEZQbWdqMkpm?=
 =?utf-8?B?dExWalJBQm1UaElPWW5KajhUOGVYdzJlOHJjTWF4ODhkVUVYVFdPcjV6WjFC?=
 =?utf-8?B?SE5MRHpxVTduVnFra1g1LzNyMmxoMmM2U2RGYTZxTiszWmdRUG5sZ2E4bWM1?=
 =?utf-8?B?OERZMm9BejdkbElnVllra09DOVdRUDRCbDhBR2QyS3laUHo3SDhGbU5aZFpQ?=
 =?utf-8?B?Q2w3TGtHZ0VSSTl6N0ZtYWhnUHkxbnV3cThSejE2Mit5dHdVZFQ3bW11a0VM?=
 =?utf-8?B?UTBwelp5cGMvZXNZUTQyK1FRMWNiUmcxbXpQd0Z0cUJSK3BUK3VlUzBhS0dR?=
 =?utf-8?B?bVJQcjB4dU8xRkI5a0w1aGE5NG1RTWhKdC85RTdKMHQ1dXNuZ29pL2dmS29I?=
 =?utf-8?B?UFBVamdhOFp2QnozZ1VoVmNRN3lkZ1lidnZrS3dLL3U2UC9MQkV6eFdRYnc1?=
 =?utf-8?B?dkxJSVRRc3ZSeC9xczBPaEVhQ1N1QU40aGpaZEdlcWpvL0dKR1ViTjJ3ZWRK?=
 =?utf-8?B?ZmRJai9SVDVOeHlvWTNDTUVmeTNTSSt1KytoRHJ6TmJUU0poSWtpMGh3b0w4?=
 =?utf-8?B?bEZWRkF3Qk9CSXBPWjZiaHIreXZGNjUwUkNkS3R6ZzVxdG81UEtsdCtEbmR6?=
 =?utf-8?B?OXZwTmZ5czYxMUxCSzR4aHBIZGtHczVZQWxSSm1kZnp5UWkzTTZNdWt4b2Qr?=
 =?utf-8?B?WGZZUlFmL3VsbS8wS3BQVHdsakd3ajdtNS9tSjVIMWtTMHFCZklCckk1ZTRO?=
 =?utf-8?B?b2ZuMjNJSTc1Znp4UmJSYmo2N3dpWStQWjl4V24rYUw2ZlFxMUdkamRnaHR2?=
 =?utf-8?B?cVVJTU1pVjFwa2Rub25ZM2xPbm8zQVoreTh3aStMREdmU1dYSGQrWkJYcUVI?=
 =?utf-8?B?RkxsbVVZOHhNdWxTZXEvRzFteTFhZXM4NXp0OUZYR3ovcFBVTTFNajk1SUVr?=
 =?utf-8?B?RkhTYVZnMlpKZktXYkNiSmhFRnA2dkl6dkpvZEQ5RGtTN2RaaWkyc2hkbFo4?=
 =?utf-8?B?ajdBMFRhN1FpdXBIL0FwQUgrS0J2RzlzOGdUOHBhWkVpdWxJMlFSdlBib29C?=
 =?utf-8?B?WDN2WEE0cStCSUU1MzF1b1hUVmJuam9jeVpubVBtaTJ3OXBlU3NPOUJNQThj?=
 =?utf-8?B?TTcxd1hINzFhTkJjWnRyUkh5UFFpRFBFVmEyY0s1WlpON3pMUDlhaW1FMnFG?=
 =?utf-8?B?LzE3eVNDRXhlU3VyNGtUelJKVHJ3ZUlRc2tiQzdzb3hiUUt3VUlmcEVwU1Iz?=
 =?utf-8?B?a052Y3p0ZTMrL2JzWlZ1VXUrZFg1THZrWFZFME9sQUZoaHFrREJSc01hOVdu?=
 =?utf-8?B?YjI5Y2N2cGx2cjNJaENFa21wSlV6bkQ3c0ZKdSsrVkhhMGdjUUhhTldiQmtl?=
 =?utf-8?B?ek1MNUVqUW1sVUh6MWtwbnN5d0xvZ0M2Y1VBTUVYMUlCa3dCdHFCSlRiSWVk?=
 =?utf-8?B?RnRhdDcrdDBxSTBtcjJ1MmkyRHBvVTRCckFEdHpONnoxSHplMC9VdGFuTTBE?=
 =?utf-8?B?R0dCTTl3eWFCY2xSY3UwUlBBV1hybmtHbjUrYlV5RHJSUnNNM2s1WVdiWWVK?=
 =?utf-8?B?Y2dtOVFqcnlmNDZLUE44M3VKMUJmWUtzaHpINHV1am9Qazh5WXpTN1d3djFw?=
 =?utf-8?B?Z1VqQXlDeWhkSzF5NCs4dTA4UWRpenU3VDFpL1BMaUJJV1BKSTRjMHhvRWpG?=
 =?utf-8?B?eHY2a1p1K1liRVhYcyt2eklUUXphU3pYYi9nOE1ML3hLZkFPRWVod1lkd2Fa?=
 =?utf-8?B?YmU3NHZHeHFXRHdrRUs4L3pTRGt2eVJYclhvMkk5OERYUWtOd1N0TnM0bFR5?=
 =?utf-8?Q?FFESeM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:40:59.1525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84fbeda-1b21-4d62-fc99-08dd83f66e57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620

On Thu Apr 24, 2025 at 5:54 PM BST, Jason Andryuk wrote:
> On 2025-04-24 12:10, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Hyperlaunch domain builder will be the consolidated boot time domain
>> building logic framework. Introduces the config option to enable this
>
> "Introduce the"
>
>> domain builder to eventually turn on the ability to load the domain
>> configuration via a flattened device tree.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Maybe the title should be "kconfig: introduce CONFIG_DOMAIN_BUILDER" to=
=20
> more directly state what is happening.

Sounds good.

>
> At least with the typo fixed:
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Cheers,
Alejandro

