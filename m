Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF079AE08AA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 16:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020174.1396564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSGBb-0007WJ-Kq; Thu, 19 Jun 2025 14:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020174.1396564; Thu, 19 Jun 2025 14:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSGBb-0007Ug-HC; Thu, 19 Jun 2025 14:24:15 +0000
Received: by outflank-mailman (input) for mailman id 1020174;
 Thu, 19 Jun 2025 14:24:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOCd=ZC=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSGBa-0007Tk-Qq
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 14:24:14 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2407::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 126bb876-4d19-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 16:24:13 +0200 (CEST)
Received: from BN9PR03CA0788.namprd03.prod.outlook.com (2603:10b6:408:13f::13)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 14:24:10 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::9b) by BN9PR03CA0788.outlook.office365.com
 (2603:10b6:408:13f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Thu,
 19 Jun 2025 14:24:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 14:24:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 09:24:08 -0500
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
X-Inumbo-ID: 126bb876-4d19-11f0-a30c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNF5nE/6TlbzHFuNmVvYLQH9IINrl6q8TSdCqE3Pjd5/j6PQltX3hAW8AT6cXhlZT9b9TvijgzwMfGlE4Gk1NDM5qtf8CoondaRh/YB3kkmefOgWjm5yJ4fwT97dqVGz2sfHc2G/UaHvUux83LdIrd/CfRHXWEDxfEdBb7/jRnk6jK+C/flAX0O+u3Di+nsO48l1w68VeMWYwLtywIN1MMu4/AC41Kjn/5jQA+tAcdhID4+IXhA5Nn5s+G9qpCYeEi1NSswAVSYdGN3/Yj8HKboiSAFNplaHeneH+KIALQeOvr8d2A+TGndWKU71O/YFRU/nOAPpbrFn1vNzJuSnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA57m571N628YCDf9fZF/OW+xl73AR9BKRui4ypZ3h0=;
 b=vHjeZoh2a6v8RI+pFt9t1ovdpeLKlBq6vi1ulfyuPeW7UVAkbBZWZNx4HxrjUMP688yuVIQZ8rrrsI2DKDL6Z/WTByWFiEByxA6jvPcyowEw4ONDnJCyTiAe5PB/Eec5258bjdgo/o3sNV9uTXAlnnf2qTc+uaJxoslrFXUFQ+7LybN2kibLdtINOqUhOftyKcosbYwyoyk0nZqjKI3dMdnY4hLCjfKYmpe7JtYwOeUSxnEDDMtUzYCOZxNVEBYSsXYpcmLxbR/Y01fcyrxdCVWjk9G2TK3JjA3VPSRUfv4wwYtXqwYmPmvCNalnr15JwZ3EOyEYNTSJ5Zpy1B5yCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA57m571N628YCDf9fZF/OW+xl73AR9BKRui4ypZ3h0=;
 b=3nwlobvgGCu2zu+z/l30GDZEuXV8KVPEzLTWPWamL/8iBQxwGaBSfd44ZLHi7oIJ0V6ynswxAdvYRvBeYd0IAo9pwZ2wfbkIDnYNpWET4XFFkasy9R0lDO4Yz+89dbYoSth2o4Cfn5nNbPYHlpzng1hcqlimVIr15HgTHwE8Oi8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 Jun 2025 16:24:07 +0200
Message-ID: <DAQKTR8QHLNG.281MIGAIW8SZ4@amd.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 08/14] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-9-agarciav@amd.com>
 <alpine.DEB.2.22.394.2506131815200.8480@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506131815200.8480@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 39eef873-76b8-4a76-6a8c-08ddaf3cf527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEtjVzdwRGVsaFBhcDdQUHZUWTd3RCtRTHNxL0V6bEZKeE1hNjJpbXRzQzBV?=
 =?utf-8?B?OFhxQ2x0WWFrc1FvOXRxN01ZVVJqNzV5UldHa3h4Ny9wWVpjRVBLYXEyYlR6?=
 =?utf-8?B?SGNHcTRWc2VKWXZwMi9jTEtoK0FZN0taQlpRSytwV0laWDRJdkJJQ0pmdnBD?=
 =?utf-8?B?KzdKTGlKS2tZcE5YOTVtTkZMWUFDaFVRQzg2VVYxZXphNmtIZWlqYmpZbUZN?=
 =?utf-8?B?YUlxbWJhQk1hOGxqOTRoT3FUZUtJanNHYWlaclpTdmhIcHlXallveHprU2NT?=
 =?utf-8?B?U2hyV2d5TXdqcGZXWm5mMlY0TDZFVytnMGxZZ1ZJK1UvMWp4Vzc0TUVuSExj?=
 =?utf-8?B?Szl3OWMyeGZkUW5EMU0vb3dWaThHK0I2Sm56cDFNNUdVWWYveUFYZS9NRmlw?=
 =?utf-8?B?UmFuVS9DazBRaktZZnRHek4xUU1ncWxBYXF5VENlOHE1bnIvSzBuUmJWMnFs?=
 =?utf-8?B?N0h6YXBiOCtEK1hHZWRqblVVYUhOamhmMmJDRE9ZOHBxb1FnRHBoRno1cmZt?=
 =?utf-8?B?Q25BMVU1OUgzOVVCeldTVkNmTHVHNTZwbXdrV2llTXdHVW1CdTR3WVFTVEZF?=
 =?utf-8?B?RGdDZkVQTmltcmZqYTRtVjdDbFl0dTNuTUFBSGNjelhqWGl3M1NlOEJuSkZh?=
 =?utf-8?B?YXVjRlJFMm1USG1xTm1LYmtFNTU2Lyt0d2REZUhsTTUwZU5mTTVQTk9iOHdU?=
 =?utf-8?B?cW9KNmYxZm9zbjhydzlUYWVvSUhkaCsvN2lxbm9mV0NzaitzWE5MaWhkanpD?=
 =?utf-8?B?UG5QYWltTS92aCtocG4wWTA5TU5obk9ja3pvbVdWaldjNHFvbEtFeWJDMlkr?=
 =?utf-8?B?eVJKcVp1b1pkUWY1aS9paXRRMi9GVlF5WFdhQ2VIUHRSWGx6Ujk0ZXpoZ3ph?=
 =?utf-8?B?cW9KZnYzOWtJSDRPK1FoT05jU1ZhejJESC9xV0Q0YVZmczBUakw2d2toRTlR?=
 =?utf-8?B?ZGhBbXE0SmdQZWl2Wmw0L2c2V3IyNE9hZUdGaWhBQTQvcEt4eXZkMWlKMUl0?=
 =?utf-8?B?blN2b29BTDV0SkJsMU1FQ3VnVWJ5TE9obkMrKytDc0NTQUNsdEZRZ1RITGxT?=
 =?utf-8?B?TUpPek0xVDhCTzR4ZWNzQlp5OTczOEZqaGg4N1p4Y3BEaUkrdUQybzZJQjFz?=
 =?utf-8?B?clJ6MXpUcGk5UDVqWjUvZHRwNERvVHU0VnNFY2wrdDMzYjl2NWRNbnIwOVVN?=
 =?utf-8?B?eU1qcGRCT0ZlN1R0MzNvRmtSaXlwOFQ3RGNkR0lWTjNWZnlTS3ZFWVNnc041?=
 =?utf-8?B?SVdJakljaEkxZXk0V2wxamtiTkowQ01MNHNMQWNKWjhacmZFWE5uZmI1WDc1?=
 =?utf-8?B?c3VRdWhpK081NGRNcGxjUTd0ZTAwS3MzVFhiYjFYTVBwSGxmT0RLc09uQWVG?=
 =?utf-8?B?NjEwS2VqNUpjNWhjTzJWcjFHekFiZ090VXJrR3NPWjI1emJGNm1QRFByMzQ5?=
 =?utf-8?B?NWVxbGRFNmdYU2RteUhIVEI1SkJVQUpFR0dXNHE0Zk9TTjlLZElIb1JzYjNt?=
 =?utf-8?B?M1hpV0E3NGJEanhKMGtHZXdZMTlLRlpYY1VwTm80QnZ5Sy9WZXVxdXAzQzgv?=
 =?utf-8?B?bHhHSVU3Vy9IMFhRSDhWUnRXRlBVVEtObWZ6UHZkK2RPN3cyNmRyTUlnT2or?=
 =?utf-8?B?Y09YWUpnc3ZMRkVRUWNwWUlpZzhMeWRxenJ1RTl3RWk1c01NN21nYlBnWmlG?=
 =?utf-8?B?NWNXNjVGQjhFeUM0TjUrd1V6ajE4UDRVMU1IVVh5Y05rV0VoRDcvSlFUUDBx?=
 =?utf-8?B?Sk1qc0RtS05oejJtbTliSWtwNXJhdDJSQWtQRWNSaHNNcE5YcEhiNjFQZGkv?=
 =?utf-8?B?dHQwbnJFRjVnUzI3VlNwSXk0dCtLQWZYdmFHWWtuNmNES1NwUU1OdzlkbEUy?=
 =?utf-8?B?ZVJUSndzaUNSWDVVRDl3dmc0WVlhME5Ma09vNm1Pc2RGN3dteWg4ZDk3b3dK?=
 =?utf-8?B?K2U4ekZpQzlJV1VZcnZqSSt6b3lqNnNPNjRlMHRUbkRmeXBXUmRoVDB4TG9W?=
 =?utf-8?B?VU4wRW9GR21DMUR6dExLMVMrQkQwLzRWV2s4TXluZ1g1b2xVc3FnTHd3NThp?=
 =?utf-8?Q?QUiEFp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:24:10.1951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39eef873-76b8-4a76-6a8c-08ddaf3cf527
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608

Hi,

On Sat Jun 14, 2025 at 3:16 AM CEST, Stefano Stabellini wrote:
> On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree=
.h
>> index 75017e4266..0a22b1ba1d 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -10,6 +10,7 @@
>>  #ifndef __XEN_DEVICE_TREE_H__
>>  #define __XEN_DEVICE_TREE_H__
>> =20
>> +#include <xen/bootfdt.h>
>>  #include <xen/byteorder.h>
>
> This should not be needed?

dt_read_number() is still needed in dt_read_paddr() in device_tree.h

I can move that helper too (makes sense, as it's strictly a wrapper) and
add includes in whatever .c files require it (tentatively it looks like onl=
y
static-evtchn.c. Then that include can be dropped.

Cheers,
Alejandro

