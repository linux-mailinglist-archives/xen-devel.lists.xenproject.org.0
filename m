Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF74ACB170
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003480.1383046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM60t-0000D9-7H; Mon, 02 Jun 2025 14:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003480.1383046; Mon, 02 Jun 2025 14:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM60t-0000Be-4Y; Mon, 02 Jun 2025 14:19:43 +0000
Received: by outflank-mailman (input) for mailman id 1003480;
 Mon, 02 Jun 2025 14:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM60r-0008Bu-Oo
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:19:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb79e65-3fbc-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:19:40 +0200 (CEST)
Received: from MW3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:303:2b::18)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 2 Jun
 2025 14:19:25 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::93) by MW3PR05CA0013.outlook.office365.com
 (2603:10b6:303:2b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.17 via Frontend Transport; Mon,
 2 Jun 2025 14:19:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 14:19:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 09:19:20 -0500
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
X-Inumbo-ID: 9eb79e65-3fbc-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhYFk8h50o3yIrgIZhSP3W9+G79jEJn8igzKzRs8QvSG63AT0HILbVTvrZnVMxwqk8LhbdhPgl7XdJ1ENCVeRL/HY/41y/FGyKa5alW2NIL6/9elutiaJbJ5o5riZvJDLwRJCrrFwMsXEASDJ7RgExuLwcM+KqC7GdUGvV2F4HiUsVsviB0yV/LXZkwwSLTdsSvE5p7mLbKMltpkJSb1Xbrh9+4IrIAwt0i5K7kZumB8DfjVLqD0GXMLA6RkLfREVnbSKx/BFLGfuPhy+AH7wxThebsIPlhvByI0ISjdZwHS99OFSCQKYllWWyXJghzG3wrzLTbgOwC3lvjW4VBvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEfCPmWcu3ajNrJzQLhFprDXyE0OyQKnt3mZTPoj9DQ=;
 b=ANY4dExC44N2q4LgMa9OA1PyMYIONs+KJMKpZD6dhyTv/RmSXekVeBcG0zi9TM1sxaFrvx0JGLi95vs/btHHIQYZ/+aIDzSPK0qg9uD1qkYz0qUNBHRoGPhGBHhIqXF+F7u1HcUXtDR34EmtrvkgaHHS+mLJhMLbfcQlHlxo0AL6M+vaNDUxTCFyCK/yioHd+I85G7od8zFzrqqUM2RDSP/Oqqh8iE2ICoh5J10wTE8W97u3/3esxTWgJn5PyA9gRnw9/Il45Wyfn84Bb7tIEQfBTUHutL42BrXJW4+GLhDQfjA4DWYps+/rn6amO5drShSNneZm2TfbbsxvXhZofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEfCPmWcu3ajNrJzQLhFprDXyE0OyQKnt3mZTPoj9DQ=;
 b=I/nB26SzJAeBNKxjq+HrFrwxiXXPcBm+0HmrF865hbZt35qpsKnS+bEpkE4s2VoiH4gDsjDjJuHtX1uz8wNsB0A8Cwq1nZHxcvxtUn6SYjLUI9y8aJi0I7oM7HydwqnluMbBaStdS62iQs+K6QQKWrjDDls/IZSaJxiH5Rf75dM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 16:19:18 +0200
Message-ID: <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
 <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
In-Reply-To: <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SJ2PR12MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 991a7e7f-5711-4bc9-d13d-08dda1e07a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEF5NHNXZXZhVjVpb2x2Q0pEMnNhV1U2UkJJd0FmZGJoRmpRUU0zTUxMb1FY?=
 =?utf-8?B?TU01aFVkWVoxQ29rWDVORUxzQnUzVy9CUGZ5bnd4MVNrZDdBNGw2c1dHUlhl?=
 =?utf-8?B?bGthUnBYVklBK29jMEZkMVA4bEFRK3NzMWNlYWRxYysrK1p0VFNvK0lvUnF4?=
 =?utf-8?B?WXFjZHY5a2dlWkxUYTZsWE1hQXlzQTBPOXVGZFpWWXRob1pWc2pQU1lrN2Vj?=
 =?utf-8?B?eFIvZlQ1TkZBR09Rd3R5aFpUc0dTMy9YeTZETit3c1NyeXpwRUp3OVdNVllH?=
 =?utf-8?B?Y1V6eW90VUU1d1F0TkZuSGhjbTlNSlRJdkNOYktiWVExVlFidnVzVktLUUt4?=
 =?utf-8?B?dVNxQ0FhaXBiQlZDb0Y5SFNTdFdQMUc5K1IyZk1VUm8yQlJ4amFZOU9LYVQx?=
 =?utf-8?B?VkZWbitSSUNQQ01yVDFUTlVnOWtlb2NsaHN4cElxUE5qa1B2NXhpalNuOVhF?=
 =?utf-8?B?TkZBN2VLL0M3WWJQM1hvWnlCNktqYWN6K25zVlR0UkovbVRPZmN6U0VHdUxE?=
 =?utf-8?B?YnV4d3ZtMitoY1lXOFdQZExjNi9BcW1pY0o4akREKzBxY0MzeXJseXhuaFg4?=
 =?utf-8?B?WmttUjJHQ1phSDU3Rm11VkNrbmQvalkyNTU2bWQ3MGt4c3pzV3BnSVI0ajRF?=
 =?utf-8?B?dCs3c01Oay9jckRQeHRlMXM1VXViY2ZoQVlMRk51UzFYUXErRVNmSWlyazh6?=
 =?utf-8?B?NTR6R0hqaHo4NTI2QWwvd0xWQUJxbnJidWpGMXZTVDN1MkljMzRxbkZZN1BQ?=
 =?utf-8?B?QU44TW5kKzNFVXpMMUZSenB5Rlp3THlxUlUraHRjNXV3M2JKTFZjSU5JOWl3?=
 =?utf-8?B?V3dIZldkQk5PZWlUenBubmVyODJoR3lmcW4zZ1RYN3hwU3dHZSsvYnM4Vkx1?=
 =?utf-8?B?RHpkSnNsL2JyYUpWcVIycFY5dzdBaytxU0JiUHJlNkQ4UFZGaEtzT0xMK2hI?=
 =?utf-8?B?Zlc3MGQwS2N6L0ZHWVJJNU9EaHRBSGR2NjZWZzFzMTU4Rm9wUTl5MFVvaUNB?=
 =?utf-8?B?TkJLbHFkcU1BcFNLT1V5RVdaYi9HdFpOQmZ3bUtWMC9CRXpBSmRaQXo3dGlv?=
 =?utf-8?B?T29hUjRvalh5Q3pMc3Zud3ZlUXIrdnlQWXFwUFJhNUlwRzNtQXBpb0V0eUJS?=
 =?utf-8?B?YTlZTFdQQVkvQzRnNnVSM0tLTjNKYUM3a2I0NW9oMnJycXh4aGhUVUJoY3Rj?=
 =?utf-8?B?dERlRUNoa0JKTXFUaml6QTJGTENGM3lNMGRGbW9oYjFCbUJGOTJTR3NRQVBH?=
 =?utf-8?B?RCtMWENwNVlSdmZNMEczRTJORjZDNDBBUTUzUk9Vek1KT3FZVUFNMkxkaS96?=
 =?utf-8?B?aHF4WXhDYXlpS1p5TUwydDBjL1pIYU9LK2R3SGlvN0tGcnMwcGkyMytiZjR0?=
 =?utf-8?B?UEh5Ynl3L2Y0NU5Cdmh1Z3UrVWRzbHpsNm1FRlZTOHlEVWVLOUN2dDByNWhq?=
 =?utf-8?B?VHRHcytLcW10ZlV3Y0x4ZWxHbGRDZEplek04dVZSU29VZVY0TlZTWXdPSHN4?=
 =?utf-8?B?VVU0eFlwYTdYOWh5T2drL09UUlRZN3orYXBXSlNDY0dWVDQ1RHNQQVNZbVhN?=
 =?utf-8?B?YUlnQjZLd1BoWklXUklXZXZXMzJqQVZ0STVEQnYrVVlNNlltSjRHaXVTclQv?=
 =?utf-8?B?cHNtTVRYeEp5bEE5OW9PekhrWk9qOCtJaWRuVUFPL3NBZDVMY2tNNFpnUnNw?=
 =?utf-8?B?OUs3Y0RqMzdWOHVueENyejRhOGZ1NlNnMmszMWYrQVFyc3NvRXI3eElsRld4?=
 =?utf-8?B?N3hOWTFrS25mM0RrcVMxZ1lKTGNXL0F2WjBJSVZ0Y0pibUlzQlBRQ280ZjRL?=
 =?utf-8?B?K084R09UQkkvMzAvWG12b1ZUbXJUMnhXMjFhczU2eTZvUXNZb0J2SHFrWWNJ?=
 =?utf-8?B?M3k5YlNSemI1QWJCRnFON044WFZrN3UzV2c3OHNFU0ZRTVlnUjBTVlZjc2NE?=
 =?utf-8?B?U05RMzdHbVpCd1QxVjFYUDNvSXdkQUg4ZHZ1TjV3b2drT21Wblc2NkV3V3pS?=
 =?utf-8?B?K3RWS05PcWlPWmo5WHpOOG9DZlBzWVpKUWVkY0J2dXdRZFRmVXZmdGY1YUVJ?=
 =?utf-8?Q?Ksy27i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:19:24.9493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 991a7e7f-5711-4bc9-d13d-08dda1e07a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192

On Mon Jun 2, 2025 at 9:51 AM CEST, Jan Beulich wrote:
> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>> --- a/xen/include/asm-generic/device.h
>> +++ b/xen/include/asm-generic/device.h
>> @@ -6,9 +6,7 @@
>> =20
>>  enum device_type
>>  {
>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>      DEV_DT,
>> -#endif
>
> Why would this enumerator need exposing on a non-DT arch? In fact I would=
 have
> hoped for ...

A non-DT arch would not include this. x86 doesn't.

>
>>      DEV_PCI
>
> ... this to be hidden for arch-es not supporting PCI.
>
> Similar concerns elsewhere in this change.
>
> Jan

This file is exclusively used by arches supporting DT to abstract away wher=
e
the device came from. x86 does not use it at all, and while it wouldn't be
impossible to compile-out DEV_PCI, it would needlessly pollute the codebase=
 with
no measurable gain, because the abstractions still need to stay.

This patch is merely removing ifdefs that don't amount to anything in pract=
ice,
and I'd rather not go further than that.

Cheers,
Alejandro

