Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8277ADB332
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017312.1394292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAa1-0003dN-QY; Mon, 16 Jun 2025 14:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017312.1394292; Mon, 16 Jun 2025 14:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAa1-0003aP-Mh; Mon, 16 Jun 2025 14:12:57 +0000
Received: by outflank-mailman (input) for mailman id 1017312;
 Mon, 16 Jun 2025 14:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRAa0-0003aJ-Cf
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:12:56 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe8e4c23-4abb-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 16:12:55 +0200 (CEST)
Received: from CH2PR07CA0051.namprd07.prod.outlook.com (2603:10b6:610:5b::25)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Mon, 16 Jun
 2025 14:12:51 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::d9) by CH2PR07CA0051.outlook.office365.com
 (2603:10b6:610:5b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 16 Jun 2025 14:12:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Mon, 16 Jun 2025 14:12:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 09:12:48 -0500
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
X-Inumbo-ID: fe8e4c23-4abb-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZzH1sRv/Ro8GIwcU15iQ7Ru1+N9S4R2KcL26EPGW5Gh2ZG4z+SwXkt2bPwjozabLYMSAqaq8xA7fW8P2/Rb2FPZGhev/nb2u8GuTp9IDjd/ulx0ljrl0AJoMFT1y5rEXzMm3WEbMoVl6CQhHFcTeDM7uRxfFw/cm7f/LKDpj0LPsE6IpSSA2jAXETqAk6DSeEGCo2Od/IweAfxPzUdsjA5nFHJ7Mww5Qb4XYjcDUZ4CIJ81aNkrTs4/hcwrMdbz7MzeORhr/hnMBzd3tg3wQ5QSMjKjSxnVONBQ3mfLs4N8eLgZTmkElqnunV3x8AY55GTVdCZUwnSWXOwsLpXX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx7lp/ksjiw0VI7/3FfQcZx2MJDnwmnHgMFliPWDJXM=;
 b=wLX1jU5bJd4wzEJH9exZeQ0gbTwfv96uUi7qLVY0ay22nl3VN3/wo7LS85LSe4Fr7ablQW9OyyFiKNREcx0DUhK4LglQincJkZnQytDBrZ69rO26UfeNvqDMD18XJPQrI6YyPOFYwEMNFC70QxNt7nbUgvTmnYL+WPTpkPsIm5NqCCiz2EbPZp6lK3/o2FJFlBnldqMqzZTuqFb7r3btFDXCiScpU32mtkslCCp5HcS5enfxgj2CJG2hmOQGpYLp35vNdgAqBDQc+4kONVq4NYEWs4rzfwbxh62bA7WTMXfgajecx8PFkIrYw1vPFXtkB/cD2+STV46aQJgvLpXyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx7lp/ksjiw0VI7/3FfQcZx2MJDnwmnHgMFliPWDJXM=;
 b=GGyh05M5Ob2kQmEi/dB8O3NDTQXIyo8QEsreqEFgal81YIEEU6PxvW86PTtUSdgU3GGQ6TjFVMhVJ0G/O+w6lOy439BNxs8aC/FvA0ayJJY38lFl4AL4CVbRH88xNu2LfpZOJ1smQY4GBEJ119+DRpdCbvNlgZc+eSDJKEXMsvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 16:12:46 +0200
Message-ID: <DAO0PFUYWBH9.1WIFUKRSL6CJE@amd.com>
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick
 CONFIG_DOM0LESS_BOOT
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-15-agarciav@amd.com>
 <79722683-cd29-4b38-bd93-ef9458f95056@suse.com>
In-Reply-To: <79722683-cd29-4b38-bd93-ef9458f95056@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 5375b4db-5ed2-4f17-dcf2-08ddacdfe0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkZvaWczL2xpTVh0RDVURlZMMWpDV0Z3ck1GeUppN3R4aVBOdmVHdTVKWVVn?=
 =?utf-8?B?a2RiWjcvYkcrUklCQTNJN1BtZ25hV1VDRENWOFZPTkZtTi9oRHhUcWVFYjVp?=
 =?utf-8?B?S2ZQcVF6MEZNN2dFVWlQK1ZYTmVPMnlvTmVxSlJ3T1R6Q3dQYXhCa1lQU2xy?=
 =?utf-8?B?VWhFMDA1QmZkVjVRZHpnOG9RM1U2d0tsbWNTa2ZKUzJFZDFLVXUzTGV4cGVm?=
 =?utf-8?B?L29pTUJwU2lDa1kzNWpUOHhlT3ZIYWE5WjNJVkh5OHlVQ1VqZE43N1hCdW9S?=
 =?utf-8?B?RnFGM1hVM1JJam9nMHk3UFdIOC9ibDJla1FLbFo3VHJBdlk5UGhDb3R6anpk?=
 =?utf-8?B?eGxzTDVoakZKaHZWK29FdEZhSGVuK210N1M1SFp4MWErR1YrNmZkQy9pVk85?=
 =?utf-8?B?ZHZuNU0rU3I4MVMxRmdUcmFUWkRaRkFSNGQ2eUV6VnNpd1h4MEtOQTdPMGRL?=
 =?utf-8?B?TXY1YTVhT3BhbzNMWVdVS29ZV2xMNGtEdTBtSXJ6clNXaldCNUdLeFBDaDBn?=
 =?utf-8?B?MUlCZENzZmZnT2hEZ3oxRkwrb0h0cTdkOWJhcjJDOE5xMTBHcmVhNDBkd2hv?=
 =?utf-8?B?UlF6d0xVT3Y2cEVPdDJwM1dPYUg2M01rSkNnN2N1R3lOdXNHSEtmNXM2bHNJ?=
 =?utf-8?B?aE9HQVV3WjdDOWh6R1ZkS2tHRi9yQjJHcWJVK2tGMHg4VUVTVVFHODcrL2lw?=
 =?utf-8?B?T1JJZ3c5aXg5Z2ZlOWJEb29OWVV4bXpBZjJxL0c2TlZnaFlXb3FrSk45eCtx?=
 =?utf-8?B?NlJVQ21rSzA3cDdJK0lYQkZ0Ykpjc1pnV3huLzdoTDZoNW9Ib2Y0SG5iRHh2?=
 =?utf-8?B?c1dLNEMyWVRCSExnb1lYb3ZmcTNVdUVNNys3YWdlTFJhQmxuV3ZiWENWeEVv?=
 =?utf-8?B?VDJ5UzBaWWw1YTBNNGY0Vk9td1Z2SlFJWjNrTmN3dWFaREV3QmpscWk3R3Nx?=
 =?utf-8?B?Y2xXVUo5UitzakdoaDdBWVVNRWpLMktDK25wOHU3T1lWWlVTK0cyVkR6c0dB?=
 =?utf-8?B?cm4zaWQ0aHpLYkZaUlp0OW1qTG1hMG0wUG5ZUmlneXBvTFpNRjVHem56Smxr?=
 =?utf-8?B?aE5qMmdpZ25RSmxsUDhTWGxOcm5ZMXlNNmdwV1pyc2srUWxXSDNHOTRYU0NQ?=
 =?utf-8?B?ZHFnbk1jeEk1b0J5UWRaSVlaVzVHK1JkT1ZROFJYcGhDd284MVVESHIvUW1G?=
 =?utf-8?B?Wnoya2xKUzk3eUxTQmtOOVVDeUEvd1h1KzY4VUlyNXdDcnkwbmhQQ3cvRXpv?=
 =?utf-8?B?UHNQK0NKREVBa1BWb2hzSm5kZm9ndDUyMDZBcFMwUzZlLzgva3JUQ0hlM3RU?=
 =?utf-8?B?NmhhK1MrSnIvTUVDczQzYyswY2lHbmFQM1EvWmd2V01taGtGbHZSUlZ1SFNI?=
 =?utf-8?B?MUs3dkNpVVJjOExJZDI4Y2syZDVRbE5yN1lQN1NtMEZkZDZMSkxmbFZlTHpu?=
 =?utf-8?B?VGpLVGpxOGZxWDErSTlVb205djlGWW94Ly9jL3BWOVZIbUYxODdaaWF2b3Vh?=
 =?utf-8?B?QkJ6V21PRHRxa01URTZmN29mczVLQTIxVkpnd3VVQnQ3VThNYlBPTVdMK3JF?=
 =?utf-8?B?VVM5WEFXblQwbXcyRHp2Q21PVmk5VERzOTE4cXVkMFM3bHBVYTY2d2lvM0xO?=
 =?utf-8?B?RmF2Nko2WFNzYTNCeXFRZkhycStJTWV6eVpWdU14RDQ1K1Q4UUVMNlFpRW9z?=
 =?utf-8?B?YmtvQWg1aW5rWlllTkc4NFpUNk9SYWt2K1BoNnAvQVp6UlBleWRJRHAzaUJw?=
 =?utf-8?B?bzNBVnh3VisrOS9FcEdUbC9XK0UzTjFDdHh2K3lKQUxOVXA1YWt4Y2hvbkpU?=
 =?utf-8?B?NDA4T3JaR3dDTXRheXVZZWMvUXhLYnQycUZBaWtIdzhXQmxwQmlsVzJLSGFj?=
 =?utf-8?B?RFJlQm1DUG9nQ2lXcmUvQ1RCTTVub2Q0YXlRZTdGLzk2S0dtcDJJVU4wdTZn?=
 =?utf-8?B?ZWNaMjI2N3ZiaDloYnZZMnBsckllSzVySWNBUVJ0eWFESGtZbEYxMUdUUXc0?=
 =?utf-8?B?cllGTk9NR2l4QVZxT1VQSWRNYVZrZEFoemFPaGE4bkdNNVRNK2JNdUpzemFv?=
 =?utf-8?Q?P+CgpN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:12:50.3898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5375b4db-5ed2-4f17-dcf2-08ddacdfe0b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883

On Mon Jun 16, 2025 at 8:59 AM CEST, Jan Beulich wrote:
> On 13.06.2025 17:13, Alejandro Vallejo wrote:
>> Without picking CONFIG_HAS_DEVICE_TREE.
>>=20
>> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
>> of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
>> as that's tightly integrated still to the ARM way of building domains.
>
> Which then is grossly misleading: x86 also ought to select HAS_DEVICE_TRE=
E
> if it wants to use that machinery. Instead of theis an the previous patch=
,

It wants to use a _subset_. I can't use the full machinery.

> I think what we need is a new Kconfig setting to control the use of
> dom0less-build.c.
>
> Jan

It's not just dom0less-build.c. It's critical to avoid parsing device_t's
during the unflatten procedure (which is the few lines compiled out with
ifdef CONFIG_DEVICE_TREE).

Renaming CONFIG_HAS_DEVICE_TREE to CONFIG_HAS_PLATFORM_DT (with a suitable
`help` message for clarity, even though it would always be enabled) should
help clarify things.

Does that sound reasonable?

Cheers,
Alejandro

