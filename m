Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79CA9F427
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970795.1359377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Q9j-0003aP-TO; Mon, 28 Apr 2025 15:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970795.1359377; Mon, 28 Apr 2025 15:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Q9j-0003XK-Qd; Mon, 28 Apr 2025 15:12:27 +0000
Received: by outflank-mailman (input) for mailman id 970795;
 Mon, 28 Apr 2025 15:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9Q9i-0003X9-CZ
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:12:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2418::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e246af9-2443-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 17:12:21 +0200 (CEST)
Received: from SJ0PR13CA0219.namprd13.prod.outlook.com (2603:10b6:a03:2c1::14)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 15:12:16 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::6f) by SJ0PR13CA0219.outlook.office365.com
 (2603:10b6:a03:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 28 Apr 2025 15:12:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 15:12:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:12:13 -0500
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
X-Inumbo-ID: 2e246af9-2443-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uldKffMKeVb+c04wF4xrCrMLVjxSpo2kSKJqQHaZl86T3sy+hvVcR6tX7YcmBKS1PxBKIg2EdecBGQ/CDYCy8z8z3cE2GhcJHDdrYhecjMbYBubA+HNxA+J99otM0MOoEXAH/3aBtOrxG+TpTYgtMxoRiBToXFa3W3Jmk5G/UJmpNsUrwUMXbNqrRwYMRGNDWaTck3F6CFp1Hnciwc+DUZi+lyBSceXyzmlYgm6XGg5hPMi8RDgTSQ6DT8l74Pwsibe0LvB2N8Nz1ESqtZjx2lbD6+VroOdEExh8Vr3Wxj84kohHyE625YUhRNHZd3cX6qTqShabAUButv6Ziu4pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbFeJiscs6mnjRSre8iH3XAgzgdPZbzmpEiXk7Xoy9w=;
 b=V+A6Zer9zrUukSQO3ioR41VvYsIZkIQKMw0TAs4p3QY5K5lwpmct4IBEpO9S1tweVBLEFjl/KhjsHllNrtiQ4lNs2YrJlKeVt7/luBG3m3Bw5AmaVQsLmlTChQd6lbBkIePHQdN6OxkFy1pnhD0JyPH3AGcPSEKj/0L7q8lWD3ptjvsBYbY5psd3WlCCW9mbhb5vCw5lP6kTqDLryGwxVnvR39j7bE493Jro/g04nLcokIF3u5nEEm8L5fxfBryCsMgSk8OQRW8iubVN79dEWOd33AWQRX30E29mEItBLqBx+2L2nbzaE4UPr52D2pVvEhpUqjA+GW/RtZsM/pCSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbFeJiscs6mnjRSre8iH3XAgzgdPZbzmpEiXk7Xoy9w=;
 b=oKaimCeHbD41Fh1j5YuKmtNf161KtMa6V3QctmwwebuW2WGAWPfc+IWDNaynKlHhyQucXVwl5CbCzGWAn3ozaZq7kSRvCWwOmr/AugiYuEyZf03cLxfwgR99i8xdhjYGOyF5pTBqokwbVd3piKhchjJxS1OkSqE3z+ou2WqvgFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 16:12:12 +0100
Message-ID: <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
From: Alejandro Vallejo <agarciav@amd.com>
To: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
In-Reply-To: <aAoHOrcZ5LlhEObL@l14>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d695a31-bc0f-44c8-abf1-08dd86670f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVFUY3ZFT2tTYmdITFZ2UnpQaWJEVXdrbTZGQnJSMzR1QkNlcG1mUGpPQlZM?=
 =?utf-8?B?TS9kTEMrbWRCbmtURHE4WFl4L1dVeVY5dTd6bUU4Q1lidHREc3pwUHUyY0hy?=
 =?utf-8?B?K0xQSERyZWhVVEJVbm5HcStSejFaOTBuVk9tbElEellyMENNQ1lyOEFhaGxq?=
 =?utf-8?B?NEZOcVpKRHRadW4xbUpqUHRHVUFQQXRoeU45c3JOMzBpUlhyenpycE51S3dH?=
 =?utf-8?B?UFdlTWZTUTM0NU9WaHNLa29ZdldDRmZFbnNCeERZdVRkMHVodkw1ODJ3R2lQ?=
 =?utf-8?B?L1JiNjRiRnc5R1lwZldYK3JKVmw4NnJFRVkzMTNCa3l1NVRwVk15S256V1RS?=
 =?utf-8?B?RFdzNFlZL2FnOWJFdzBheWJESStTdzQ0YVAxNnE2ODhzMEl5amNIRjFqUGlD?=
 =?utf-8?B?cUR4YitaSUlmWFB4d1Y4ZkZrYi9GQitqaUlSUm9sVm8wQ3YvbURPT1JjbFdp?=
 =?utf-8?B?RmJJY3RUWWoxUks2U1VYejhTREcyQ0g2N0J3cnBKNklJQUgvU1N0T3B5dXNo?=
 =?utf-8?B?NGJZMGpnSXhnaWJaajNIK2I3aUtkc2hpa3c3TzF2TElDVTE5bURwVVlyWkFu?=
 =?utf-8?B?aDBOMS9Wa2h6YmRTTDdhSzFoSGxDL3lWYkszS1UxVms4cUpTcjVqVFczaWlO?=
 =?utf-8?B?cDVkN3RsT0xtWUNkK2hMcEtzSTljNzhFd3lHQ2Q5TTNmNm9SaGtYdUR1bjY3?=
 =?utf-8?B?TWF4Zk4xNEloQjQvTkRYcUh5Zm1RVFV4elp5RXUxV2dDeDIzZndxVStKZW95?=
 =?utf-8?B?RlNIaFdUMmxwNjV4VmRZOWVTcit0SnlJODJXakthTFlScGNQdFVRZXhHZElC?=
 =?utf-8?B?OWlBbUsrVmlXUXdPcjR0THdTLzYwOHNuOTdBWEswMzRtZy91cXkyOE43ZHA5?=
 =?utf-8?B?aFhML1hPS09uZHhNeEJhcitxL2JZeExLSkowRFZpNStwSjlhV1YrMkNiMjQ2?=
 =?utf-8?B?WjU1ZEU3MzZ6R2pZQk53czR6U2hXYUxyS0VFUXFmS1hnV1pSSGtxYXBDZEJ4?=
 =?utf-8?B?V2FVam81TXR0SWNsTDlieVNueTN1TG9KZkZHMmpSYVdBRkkwQmEyUlJyQnN2?=
 =?utf-8?B?SHRsTU1zTWVlZDc4aFRURTlERkxaS0x0Y2ozMWFtelNablNyanA5RGxKTU9y?=
 =?utf-8?B?N2RBUmJvRXV3a0dlVjAzUkdJTDNRc05rMG8yYVV2RWw4bTZIeC9mQ2xrQkdI?=
 =?utf-8?B?RGY0aU8xN0hKMGFzdS9EcXdGK3cwR3dXbmQ3dzNyajE1RlJ0N1oxaGRkL0VQ?=
 =?utf-8?B?aU1MbFRBLzJHeTVpMTNuZmNRZXBvNXVxdjNYUnNROTROdGVWYTJjR2Zjd1VQ?=
 =?utf-8?B?eVBkZGxQRUhwNVh0TWVMZWFHUThQRTFDWk1hWEhzRWtTbGZWdlRqa0ViMFdw?=
 =?utf-8?B?NFRHTlppcERtL0cvblVJTTg4UFM0V2VGZ1doYnpXQmZYK09HVnNhS3VVQkd0?=
 =?utf-8?B?NGZ4Rk9JS05yTGpzZndpdDhXMUIvd1k1ZlBLYURPWVF1UmlBZ1hpUWVvMmVZ?=
 =?utf-8?B?SFRUUHpYa05rajk2VE9VdXdoaklzeGU4dEoyTmtESkg5UkhTVjl1MkpTQml4?=
 =?utf-8?B?eGpranlSeHVPNVpUZDNOL3NiME10UmdILzB4ZjM0UmpvdlFRbGJlTWdmVjVU?=
 =?utf-8?B?cTl0OEY5cDgwcCtwc3FKaHhvbTJndzN4MnlQT0RvbzJUVHNJV1daaXRjcVNO?=
 =?utf-8?B?TEpWa3AwcVNlc05sMDY3alBMWUlxc3orcGdJc1VvSmpDRWNBTUIrZ0ozUXdR?=
 =?utf-8?B?OFF1aG5NNjhBMlM1Um80cDM5dDVIZHRaaXU2TFR1eGx2OHBYQ25oOXZWY0xp?=
 =?utf-8?B?Z2NkczIvZGxLbi9vQzBKZTIxWnVIZmE0dTNnTVBaNjVLdmtZWmk2bTZncjRT?=
 =?utf-8?B?MzhmbDlXSDRiVEpDUGJXeWFTbXdMSG9ldVZYb29UUU5oN1RzV1k0Vjc5WXBM?=
 =?utf-8?B?TkExZzd2SEZqdWQ1UFBMQUxPZlA1aWZubnc0ZG0xNDY4TXZxME1uM1VSRVdy?=
 =?utf-8?B?NGFQOFNGQzBuN3M1QWNUMnVpK2ROTTZJaHovSmMvV1NzSFVjY0l5MXhCUlN5?=
 =?utf-8?Q?/BEr5R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 15:12:15.5826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d695a31-bc0f-44c8-abf1-08dd86670f8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471

On Thu Apr 24, 2025 at 10:41 AM BST, Anthony PERARD wrote:
> On Tue, Apr 08, 2025 at 02:35:20PM +0200, Juergen Gross wrote:
>> @@ -1903,10 +1894,7 @@ it may be useful to request a different one, like=
 UEFI.
>> =20
>>  =3Ditem B<rombios>
>> =20
>> -Loads ROMBIOS, a 16-bit x86 compatible BIOS. This is used by default
>> -when B<device_model_version=3Dqemu-xen-traditional>. This is the only B=
IOS
>> -option supported when B<device_model_version=3Dqemu-xen-traditional>. T=
his is
>> -the BIOS used by all previous Xen versions.
>> +Loads ROMBIOS, a 16-bit x86 compatible BIOS.
>
> This option is not valid anymore, libxl will complain with:
>     "qemu-xen does not support bios=3Drombios."

Sounds like a good time to remove bios=3Drombios altogether and strictly
support bios=3Dseabios only (plus the override).

>
> And I have no idea if it can work on not, I just know that XenServer
> still use RomBIOS with a patched QEMU.

Not XCP-ng? Regardless, none of them do so via xl or libxl.

Cheers,
Alejandro

