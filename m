Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF3A889CF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950996.1347150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Nam-0001hR-JH; Mon, 14 Apr 2025 17:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950996.1347150; Mon, 14 Apr 2025 17:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Nam-0001f7-G9; Mon, 14 Apr 2025 17:27:32 +0000
Received: by outflank-mailman (input) for mailman id 950996;
 Mon, 14 Apr 2025 17:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4Nak-0001ec-8I
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:27:30 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:240a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa520c6-1955-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 19:27:25 +0200 (CEST)
Received: from SN7PR04CA0038.namprd04.prod.outlook.com (2603:10b6:806:120::13)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 14 Apr
 2025 17:27:18 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::54) by SN7PR04CA0038.outlook.office365.com
 (2603:10b6:806:120::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 17:27:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 17:27:18 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 12:27:16 -0500
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
X-Inumbo-ID: baa520c6-1955-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM99XIj02TX9N89pffEVuY4loT0OANsVYdkuTi/o/5pTKb/qV5CoTKUBjOnMwhiKK0YsxMqSY+LtEj3uVV/+aF10DMtn7vhBQdGqNqMknFXW3usH8dLjcDo2oA5Sd2epAy6tHz3bP6TO3XJCWWyN5xETPhgKFCNuoApJFkxexdwD6kBi/V5nUH4wJjgIN3ZNzwHyMKnLkQQE4MQquEUnWG9g03IhCNHc+fymwI6WRAEk4nsbB1cdGNoGFd5RIrPuof0ooFRTL33HZxdAzUlDI2+rupLApybuRyTtK1kt/Qy48bYjcNiMltPk04ILJbnSgKs/JFWZ/jf5YpyKd5vSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D/VHH+3jIcuMbjxTn/E8UCJN1HiyWgTHG2f3o1OSCA=;
 b=GmPJeCIyajMZnAj4Q8gVUmQ7f24oJBvTb5AK4Xazc83Y2np7xFODDOvufS8/MRgeFO7jMhdZJksah3/GkMjk84r6jRMHa08048f9KXqVe/uxg615LCIrhadUrIwxrBwlAWAPoddruZVEGy304rWcreKaATWgB3zTaaWS55mhnOnT3JA9pidOj73v40GxTWF/W4q77g1S5il4KED6g2Lh0ThcoGyUeCZ07M1Pi0FEywUpZLCVo1VzbvtF9w2xBx0mo2Bj4/qanOu1tRPmGpQbtboejqucD5JuUwJeGb3q9KlEYfa7pq+4hLmdQTm5kmhbLaVd4t1Pw4FjUKY2QZQF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D/VHH+3jIcuMbjxTn/E8UCJN1HiyWgTHG2f3o1OSCA=;
 b=1DCV+SutrJyXQlAy870n1yi2+wnmcC6wK49qTYZDzorw6F3fjQAUoOI250fLRrLjlfhsN97LKAedPM7Ac1gVxb3kVW6iPGEZpQf05gnNyNmmrSi35KkcqibSeGWb1Z3ah24m+9FvoVpmTdFKglp/EL3Eq4PB6kZT1z6x1nZRzmo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 18:27:15 +0100
Message-ID: <D96JE0Q8U026.2FWWHTWUUMTPE@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
 <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com>
In-Reply-To: <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: c62ac2f2-8eb8-493d-500a-08dd7b799b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3ZQcGJobjZiQWgvUDJQaGhDVFpwK0xUVUxSdE9LbzJIT2xXMXN3MXo1TWdt?=
 =?utf-8?B?TkVDdmhFRnNSdGZUOWgrK2NuZG1zQmVtQ2RBcXBDalFsYTVnSUtTTnhCWG9J?=
 =?utf-8?B?a3F1NnFSTTJEQythN1FZTnVGMGNlYTlpVzNEMDNQMVBIN0hDMUxJWEhwRE16?=
 =?utf-8?B?VFlwUzhwaXRzbXJQVTE4OE5hWEFBWE1rZVBFMDRicHg5N1lnRWRBeGM4VEtP?=
 =?utf-8?B?NEI4UllGWGVCaFhQRTU2L21QRXNVMmovdjhPNlIyOXRmNVZUYlJuUWFYbGtC?=
 =?utf-8?B?bmd4Zm4zenFHM0JKV3hCVXZxSjU3QkNkVDBFRm9TK2FYQXRQUXpkcjByeTJy?=
 =?utf-8?B?dTljYTMwNk4zSlRaQkZIeURyWCs1anBEbkZxRTd0WTNCanRZWi9JTDI5WlY3?=
 =?utf-8?B?N3BQTjRWSW9pYWk0QU1tS0hEVHcrSC9NQjRLSGZHY0FhbGcyZEFMcitmWkRY?=
 =?utf-8?B?V2pEMU5pZ29yVG9wdTdJNmxWNnlXVXVZTUs3cDNUbzhodFlwZEsxWStNbmNO?=
 =?utf-8?B?VzV0NVhJTFY2SGowN2xBY2Q2Q0p1NENtenhWWWhsSWZ4eElyMnplMVY1eVdG?=
 =?utf-8?B?K1NUVGljNU9hRjVkQkJpRjBLM0I5UU9vWlozS3dMaW1EZWoyaWRDYkZ6YkpV?=
 =?utf-8?B?bDJkeHZnOVFGaEloR3JxY0Y0UlpMNlZXVWYyYno4c0M0UWRFeTFHZlhYRjRM?=
 =?utf-8?B?SWNyU0xJbHA3NFprend4QVNnUmMzOCtmYTJtbVYzSmJ2UWhJWmFoSFVrWUxr?=
 =?utf-8?B?WXVLdjVEOTg3RGNQLzlWREtsVkE5c1lTS3dCNEdqcWdDQ3d5N3ZZVkYrWDRX?=
 =?utf-8?B?ekh1OHZhTjdpZEpvQnhXdTBZbG9DR096aFdFR3pqRkN6SEtTa1hVUUgyRmY2?=
 =?utf-8?B?cGJZdFRsd3Y2b3psQjZzc1lWZlkwUHdmWDNlVGRKTktiTUVIak5sbUFidDB1?=
 =?utf-8?B?eTMyOGJSVkpTQTY5d2ZWRU1HRW1ySUlTUktrS1d4T0FQL0lOdEhsVDFwcHpj?=
 =?utf-8?B?UEJYdFFidHJ6SC83eGQraHlKYUpZYnI4clRBMXd3RDZqNE9jNXhhYVEyU3Fs?=
 =?utf-8?B?RGJzN3Y5Y3ROejBZQlZTNXkvZDROVmlMb0VDOTV3QWVxeWs4ZUFVVUVVbUNT?=
 =?utf-8?B?WGxXY3FLT2JMLzdXeGhCTHlzS1JaL0JycnN5TWd4RmQ2QkUxcDQvVmhvM21R?=
 =?utf-8?B?Y0VOVks4Ti8zVWZLS0tvN2VBT0VBNkF0OTJHVGVPS1p5U3FIeTZzN1pqRGlP?=
 =?utf-8?B?c25VUmFWUU1NZlhDTXFXamtKVHo4eXpNdSsrK0UxQlJxRDg3WG8xWm03SjRF?=
 =?utf-8?B?bFB3U0tLMmNNZ2IwNGV0dG50aksvR3FDVGdPL0c3Y3RWWFpNVTlRU3lKb29S?=
 =?utf-8?B?VVlLSnVZbGREYkwySjdvZ0IycEk3T2o0TGxETzJ4bG03SVFjVXV3TDhTNjU4?=
 =?utf-8?B?alJHUUZIekh5blZiKytrc2ZQQytuZUNkQUdpRml3aDRjbllLaDFMYmtJbThl?=
 =?utf-8?B?QWVPRHlJUVZ6b09oZ1hQL21QYTBieHNLbFl4WnJScU9UU3ZtZmlWbHFBS25i?=
 =?utf-8?B?dC9pRHBKU1orQkdBSHoyYzZtT2g4U2NDNzRmeVpGckJkMFptbGpTcmc0STlh?=
 =?utf-8?B?N2FmTmU5dlhjelpDeXFQT1k5NFFtaW1janhLOFVkazRMOGoxOXI2YnJiQTlV?=
 =?utf-8?B?MVdOUGRyUi96cFpzRm1DeGQ5TG55K1padkpWdkxwWjlCemdCc1pwNnk4MU5t?=
 =?utf-8?B?NmhRTkdXTDJXQVBucTVqaVFrZkV3VnBEK3VyNDZYTFcxSThaa3ljalNPc3M4?=
 =?utf-8?B?T3RTSHB1Q2c2RlpBVG9OU3B1NU01ZDExZGY2TDZNaU1HSGJXajhCRmNtNGlx?=
 =?utf-8?B?L3JaUE9tT1c3N2FVMXVxLzFLSmNMTzJrdmJhUGNRMFVHZHNQZFdUNkw4UGs5?=
 =?utf-8?B?MnFmdkxhS2w4N2VzOEVTRGNMOHROY21OelNRRnU4WFJLRmk0ZHU5KzlNVE5R?=
 =?utf-8?B?NkhZV3BpUkplOEp4VWJqQXhnU3pwTkh2anFlQ2F0OTl3Mmpkc3U5endZM2Fs?=
 =?utf-8?Q?BNOdCb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:27:18.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c62ac2f2-8eb8-493d-500a-08dd7b799b6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153

On Mon Apr 14, 2025 at 6:06 PM BST, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 12:34 PM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>
>>> +            printk("  ramdisk: boot module %d\n", idx);
>>> +            bi->mods[idx].type =3D BOOTMOD_RAMDISK;
>>> +            bd->module =3D &bi->mods[idx];
>>
>> The field's named "module" now, but that now ends up inconsistent with
>> naming used elsewhere, as is pretty noticeable here.
>
> Well, yes. It is confusing. Also, the DTB is called multiboot,ramdisk,
> because multiboot,module is already used to detect what nodes are
> expressed as multiboot,modules. I'm considering going back and calling
> them ramdisk again. If anything, to avoid the ambiguity between
> domain modules and multiboot modules. e.g: a kernel is a multiboot
> module, but not a domain module.

Particularly when misc/arm/device-tree/booting.txt already states that
the initrd for dom0 ought to be provided with the "multiboot,ramdisk"
string in the "compatible" prop.  Deviating from that is just going to
make it far more annoying to unify arm and x86 in the future.  And
calling those ramdisks anything but ramdisk internally is just plain
confusing (as evidenced in the current series).

So... how frontally opposed would you be to restoring the ramdisk
nomenclature? Also, for ease of rebasing future patches it'd be far
nicer to go back to ramdisk rather than reinventing some new name.

I'm for the time being leaving things as they are (because it is a pain
to change these things) until we settle on something.

Cheers,
Alejandro

