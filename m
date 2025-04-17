Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011FEA91B47
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 13:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957435.1350560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NnP-0001gm-6Z; Thu, 17 Apr 2025 11:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957435.1350560; Thu, 17 Apr 2025 11:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NnP-0001de-3d; Thu, 17 Apr 2025 11:52:43 +0000
Received: by outflank-mailman (input) for mailman id 957435;
 Thu, 17 Apr 2025 11:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5NnO-0001dU-FI
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 11:52:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 767f95d0-1b82-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 13:52:39 +0200 (CEST)
Received: from MW3PR06CA0027.namprd06.prod.outlook.com (2603:10b6:303:2a::32)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 11:52:35 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::e3) by MW3PR06CA0027.outlook.office365.com
 (2603:10b6:303:2a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 11:52:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 11:52:34 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 06:52:32 -0500
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
X-Inumbo-ID: 767f95d0-1b82-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE7PzIrsrWUsNc7lP21TVh7pDg43+xoG2Nzrf0eTaP9hS4dYQlb6mwGg9p7/z4Qzpu/AcocDKE7Gd3rqVX8k5hS0sjdTU1o1BoVc1BKrkRvc92MttMhST1a6McCuzDllr20xJ36rHxk7s8yOsZ5T31FEbRuCKJRorWT0+XVlY3f7yPi6ZwORVdvODPSD11VikelJzJYA0Xsm5d+mneGOe/F7eCJ0QnHtD8Xld2p/xya/s3pVWq0vZccGsTllKEo6PPQs9fXbm6yhMhP641CabWxLibrtyFr9icb/nENtpWe2BgkjkBmgJD33hLsORcrpIiEOzq/zb0G8bnOOPEr7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNARHEYffQbGzF0lv+iC3h6aQeYqSnjIfuvsEOnBQn8=;
 b=PJo4wdDL5MsrkB3YFO04MBYXE359YMHdbwh6JTfs8cacJRxjogeGDxJckBVv4vXAc80U4D+iLKQOdU6gq9ebIn4To7i1ilkTkofg4y8foBjtblPm8/8/KNMkfKKYyal/CCUz3oXL2BZH0dCWMvaJyaow54xyKqVs95jH+tzq/RsvqtKA9tdgNya+X4kcufgvk8ESgKlvjSqadHfry9KsFHRH0aUxTK0V8Nj9zDgLBV6X/KqsRSjbl6I4Jq++aT3JTxgMZiXsL7XIEJoTFeM6O0TvRLYiajrQa3c19ZMDkcvgnRLiqt9ysZYiaRFH+zR12sQDsvexJfiWpdkNJUKIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNARHEYffQbGzF0lv+iC3h6aQeYqSnjIfuvsEOnBQn8=;
 b=pw9QXqTsIWe1Y5tbk9HvnPAWnx6Rh3Qwhwiq+pDnCA29BgSAqLG38g1mASKmzs3+yL88LlBsCqB1jr64AhWVjRKOP5l3z3imr8crLXLyI1zl9lbOEy1Rv4dR0n50s21JJUQhuP+CbCmM7ALf7WVyDG1TK15k/9DwPRz/eyCNrew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 12:52:31 +0100
Message-ID: <D98W5DACRL5O.3ABYPRTAR6QTZ@amd.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [ImageBuilder v2] uboot-script-gen: add xen xsm policy loading
 support
From: Alejandro Vallejo <agarciav@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250415070128.1938253-1-grygorii_strashko@epam.com>
In-Reply-To: <20250415070128.1938253-1-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: fbffcd11-7b46-41e7-d5fa-08dd7da6579f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXNhS3RDblNrMHBVVkkwY1BaZG0zVS9RNUh2cXZZelBPUU9teCt4YVpNQUx5?=
 =?utf-8?B?MUx1aXZRZExEaC9qQ0Rnc2s2c29ESEx0aitlbTcyYWYxYmFsWVBweFFaaDFk?=
 =?utf-8?B?SmtmTWR4cUVvcWJFN3E2NkxCSEpvTU9oRUNZbmRnUU16WDR2RVpQb2NMNnNJ?=
 =?utf-8?B?ZlBzc3E4eTRFYVhWRDdwbXNVR29qa0tpeHlBMCtDdkZBZzRwTWcyU0xUcnJ3?=
 =?utf-8?B?eWJ2bUY3TXI0RUVFa2w3Vmdha0VQOWhzNEc5ZUZVNXdGbWVkU0RXNGZVTU84?=
 =?utf-8?B?ZzViUHMxc1J3VU1Qd29Qb0hNZ1cvUmI5TmZZRFJkVHlycFJoODJyNlV1ZXoz?=
 =?utf-8?B?MDkxRENWUlM4Ui9WUzA2V25TNTNaL3JHVG1WVkg3ekE1aENOZS9xeXFNZ0hY?=
 =?utf-8?B?QjNFaG9nZWY1U0wrVEVSNDRIQjYyOWVRa0xMUWlLNkMxbWVoNUZqTE1QV1Bq?=
 =?utf-8?B?TDZ4RUlzYkx0U3N4T3FDTlFObG1ISkpsTzdOYzlrU2hLL095Ti9FNTZZOU42?=
 =?utf-8?B?eEUyT2g5Y3F3WjRzTVNqcktYQXg5QjRQMnFzZnA3RmM3a3RVaHFlZWRaQzVz?=
 =?utf-8?B?NFIvSklPTlVUV1l5MG1LVGM0bnVMcS85YU5yMEZhcUhrY0pQbnRxNkZMNkRO?=
 =?utf-8?B?RGVjQUJYeHUycklOYUkyOUlsVVJ3bmRMNGJqMEpRTFpxMjdaWk5JcjFPSFg3?=
 =?utf-8?B?cmkvcGp3ckMrQjViNlZxeTczNGJDZFpGVGpuV3VyZmNJbnpiTUgweitEUk11?=
 =?utf-8?B?emVqbm01UHdBV2hkbkl2UWZLMnYyMWxaV1NqVWJMZjFjKzNDZFpZSFJDYzk2?=
 =?utf-8?B?TFZrRnVRQlB1SlRya3dDaitLY1VNMkFhSk5zaDYvV2UyQWJodmZKMjhMQ1lR?=
 =?utf-8?B?UmpqV3NFcEYxRzZ3Z0FRTDJuMmMwU2xhQUtycXF0bGpTa2lzeWp2VnB6T0Vx?=
 =?utf-8?B?alFkUVRjQjRtNVVjR3JURTJrOE8zeFByaWhVNndwUHN6Z2RPR0M1SUw0WUx0?=
 =?utf-8?B?T3ExK1pmSFJJQWgyYXhhMjhBMUMyQzQ4empCNGMvTmxlTGJjVXBVZWQwZmx5?=
 =?utf-8?B?VWFPdUwyY2l0d0xmRHFLdk85eGN0NEZMOGt5Qm9GUlhsSjFMMEZTZzgvZk05?=
 =?utf-8?B?NTNRYXZ6UUV2NCtGbzZjZHcyWXd4UFdTYlpKOTNqVzF5RzN1QXBwRmIyOVp3?=
 =?utf-8?B?UnhHUCtWTFp4MlAxdS9IdERPT3dOYjl5Slc5RnRVR0dwMGE4cVptNG0wT3l6?=
 =?utf-8?B?d2NZb0hGMVR4MVhUbmRSSEM5UTQrMGNpTzk4dTVCWFBNRTllc2cvZE1Pa1pX?=
 =?utf-8?B?eFhpem45N3luRGhsRjVDaDREZ3ppZmd0MWxVb1Y4MzJ1Ti9SWHhoeUdEUEFy?=
 =?utf-8?B?ZWUwSHFBbDZEdWxoaXhXNXhqaHV6RGVYdkRvN2NFMFluSTE0RlFkWFpJQzFq?=
 =?utf-8?B?Q2xGby9FRHJieVVqTFFMQjBXZysyZytIeFE0SEhsbnZyZ0EvR1JPV0wzNGg2?=
 =?utf-8?B?Y0VoUS9KcS9MYnEydUZYdzYvL2YwYmovVGpKWDVNR3prdTlXRnNndEkxNmR4?=
 =?utf-8?B?ZmxOdWxHd0UrME1rZk9IRERuaWRRQ2d0MWVXeHF5MVBDY0dtYmdNbmpmVjk3?=
 =?utf-8?B?MTVmOVZGNHpScFBxYnROdisvd3VuQmlCTmtHLzcyQXI4K2llUk5oVUJ3RXFt?=
 =?utf-8?B?UUhBK2VQM01WLzhGRnhYOFp1bkhxa1cxeFZleWJ1bENwU1ZnM2tlSnRyeHNM?=
 =?utf-8?B?RjBESHJ4a3RXMGYwTUlLbW9hSGNKTzBuWnVsdVZZbWJ2aEtCVWdOeThRSURO?=
 =?utf-8?B?aHhFYkV1RXZUOXZ2aVYxeWxrMGpLNWhiWERQclUzUGd0dnFLbnhwc0RPOHFP?=
 =?utf-8?B?N3N1SDNtNUR2ZXZSZjRhNXNOeWdFeDlRWnN6Y0c4NVRnZ08xdng2UitOVE11?=
 =?utf-8?B?WEZXckV3b2l0d1V6cmFoYjVEeTI2OUJjWDVlZjRCS0tWei82Rmd4R1hiNXcx?=
 =?utf-8?B?TDQrandYbC9qa0xCRmlOT1M1WlRRQ2pPSDNJRGtUTXk4bjNyZmJSK0IzZVZX?=
 =?utf-8?Q?kZES+H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:52:34.3051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbffcd11-7b46-41e7-d5fa-08dd7da6579f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601

On Tue Apr 15, 2025 at 8:01 AM BST, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> This patch adds Xen XSM policy loading support.
>
> The configuration file XEN_POLICY specifies Xen hypervisor
> XSM policy binary to load.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Alejandro Vallejo <agarciav@amd.com>

Cheers,
Alejandro

