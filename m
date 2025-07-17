Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB9B0890F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 11:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046460.1416810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKfs-0006og-Lg; Thu, 17 Jul 2025 09:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046460.1416810; Thu, 17 Jul 2025 09:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKfs-0006li-H3; Thu, 17 Jul 2025 09:13:08 +0000
Received: by outflank-mailman (input) for mailman id 1046460;
 Thu, 17 Jul 2025 09:13:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucKfq-0006lc-N6
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 09:13:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2417::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dd34475-62ee-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 11:13:02 +0200 (CEST)
Received: from BN8PR07CA0035.namprd07.prod.outlook.com (2603:10b6:408:ac::48)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 09:12:58 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:ac:cafe::96) by BN8PR07CA0035.outlook.office365.com
 (2603:10b6:408:ac::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 09:12:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 09:12:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 04:12:57 -0500
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
X-Inumbo-ID: 3dd34475-62ee-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTwSee3gxFoMdO8eu7Kh5l5QLC+iRppsyV8eoPZj8RRcur79uJRTiTmqJgK+wxbP61vNZj3u8KpH934Zj7MTwBDgID0ofNOSC4gwu/nGQvr/NU8h8A8+uX/3hg1QYPFLwHxqzovMC7EiJMO8THPQzGkjp27TISBy9rRfiA64d4NFapwosIuvLKhkqTP1Wg/R4exHM9uLt1c9K/qkMCGlnUsoT693pIlkekSwzOAJ9w2zgbNWRM/faAOybS2QulQO573s5PLswysLP7TBejt3MLgk5/pyfvubxxAJtk+IuGpAwpmju8c+3qgM3DbLW7WZhjX9ybPjSo/FpTnSQ5WWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjV+37JhNXykQ/OtCb4lv4yeAUrj/WCYHSTZSRHbjPI=;
 b=hQzxOLHwWiZtbSgXnvQe8cmAlw/ybfbf5pEi8zVyDAqQ8/9Iv+uyBoh4QIVzEtSyPXZocA9n+KQEZAApdg6lvxdH3TIau7i4Xytkq34Vu3b+velWE6QJE71pFmYC6+2qQqD6ScysHbJ10Splyu2wH5czPnygD1cxhNB+aiYHuuywtty10gidzYAZqqAb4EH2S9GlrUkJFZcWyo6J4f8I88LVsYq6EwOfON6qXN5BjWeG+Lxz3b34Lu9F68m0WEXcbTIfYDM2gcnZKQLcGr/7K4nLeZb9JqO69tXbUXttqQvzRSYvuikjcK9ciJYRBNzRt/oRQk5JdrgCl0qujh57sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjV+37JhNXykQ/OtCb4lv4yeAUrj/WCYHSTZSRHbjPI=;
 b=5e4SMiAVTMsUnVWUUvLLGFKZSMEEzk7pM6ASIDu2BjliczsiqljzsDMS8hcI1cDZMBbRUFNdfXqkEjYN5FVxi0JLdVv7KSzEokEee/fgXlD5eOLZkyiZEV5FSvkgj5FII14mKx/RzQdCpIUQRuD0EBOF4F0uhY7vcSVwROPwciU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Jul 2025 11:12:55 +0200
Message-ID: <DBE7QQVT261D.2943BGM58TT8Z@amd.com>
Subject: Re: [PATCH] x86: Prefer d->max_vcpus to dom0_max_vcpus()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
 <39f6555a-acea-4fd6-acdc-f19b681705c0@suse.com>
In-Reply-To: <39f6555a-acea-4fd6-acdc-f19b681705c0@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH2PR12MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: c30a65f7-b3bc-4451-a323-08ddc5121f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGRyVEdpNHFkOVU0NnZPM3F1VnYvdWY5MmtLTEhqZlFvWkdQRTVITHExRXRh?=
 =?utf-8?B?OHlUaHlBL2RqRDc0cURySDk2cmNwSTh0V2pzM1B5VEoxZmFtUHpqTGZaRG5J?=
 =?utf-8?B?SWlPK2NManJRMmlTRHh0VWZCeCthL2thMURXT3hMNSs1YkpaYW1oWDRhRlFI?=
 =?utf-8?B?RU9ZMlJsaUxzbkFob0taSWNSdUF2NUJaN1dqeE5vdW43WmU2elhWYldTV0N6?=
 =?utf-8?B?TDR1L00vS2VYM0FJTG1qZlN4aHJSSW50c1poUW9VNmMrVFhNQ3huYVdHYllK?=
 =?utf-8?B?M0dSRnJCcUtHTUxSdVJRbTE0S0p5VE44UjMxZ213L1ZZZ0p4N2drUDdKZGZr?=
 =?utf-8?B?S0hxYmtDZ1VtNldpbjFZTmh1NjcyU1FjQWdoVzZSTkdYZTdSdjhYQVJBUGFo?=
 =?utf-8?B?WGd4dmNXKy9wMXFRM29Ha3c1TEptZzByUDhOU0JDWTNvQVpuU0hPUW1XNHo3?=
 =?utf-8?B?STRNOE1FWGVqanJBcGxmVnFJQnlVTlNnaExzc2VpWWQwNlZscXpQc3cyaGhh?=
 =?utf-8?B?dkFDL00vbDVyRXFMZG9mS2NRVWhzc3JWQjFFTE9ETFVjR1ZZOUlDMHNOcU5S?=
 =?utf-8?B?Q3VHVTI1YnZ1b21ONW41U1dsamFuUlJFMHNENVF1RFpNY3UyalFVWWRZbTJ5?=
 =?utf-8?B?dXZjT1hoci9FSW94YTlNbHlOOXB1VGh6Z01YRlFsYWRBdndSMjliYnhVQndr?=
 =?utf-8?B?Rmh6WUx6dFhzMFB2VHdYWDArN3ZKSDg1L1NoTFBvYjg4Q05lcExVRHJKYTY2?=
 =?utf-8?B?VHp4SlBSL2NsZndrVXpQTWJnSlFFeUd5L2haV094Rk5VTWxReFo1bVROeDVF?=
 =?utf-8?B?MFZ2UzlCQjc1T2NKVEY3L05tamt1SWN4MzhLZHdYRFBCYmNJcnB4YlZKcmxz?=
 =?utf-8?B?L2ZCd0lRL2NwZzk4MnJJaEdlQWJ4enZ0YWpwZ0ZQZjlNaXRNK0x6RzdSZ0Rx?=
 =?utf-8?B?RGovdnlldm14Q2ZyZDBNeVBCQ3B4a08xVWgxMGVQSDZlY01LVE9JZmptWkM4?=
 =?utf-8?B?RW9RZkNaVkRzVklrRG16MmdRTkJPUTlqZlQ0YysxYzI5OUxkdkxYVk94OWtF?=
 =?utf-8?B?MzZlNDk4UkZPMDJvU3R3RkYxR2diMlIzTXJES29xN0hMZGRodDl0bFU3TEJP?=
 =?utf-8?B?Wk1vRzFhQk9JbVFycnNoMXdGZTZTU2grNnYyYzEvTnhYTmV6U3hjRkdveWlV?=
 =?utf-8?B?dHdIRW5uam9QVkh5SXdycnVyZ0Rnb1g2Wmg1NGI3TFdxbE5xeTd3cGdianQ1?=
 =?utf-8?B?clhReFZTQzM3NGdITUIxYS9qT0F6bDFCMXBjV2Y1RlRTMldoRWRYY284TmxM?=
 =?utf-8?B?NXZ1VU4zZ1FtQ3Vzb1ozcWVCeDg1NUFGaXJ1bjlQM1cxOVkzRkYxNDlqU0ZF?=
 =?utf-8?B?UWxLVlNvdnRoT3BtUjliVjIrWnhXbW4wMkIzVGxYOXdCRXN1UlFnTk5STENR?=
 =?utf-8?B?UmZrRWdSSDA5RDhBUzVPNU40S28zN0Y0bG1veGJyWXNySkI4ekpWbllKRmxD?=
 =?utf-8?B?U1VpcnNTNE9xSG9VcG12M296Wm1qV2VqRmx1d3VKU3BUR2dTNzd5ME5hUFp1?=
 =?utf-8?B?UTJHRlVOUkNnYzU5Q0tPbFoyY2JvNzZyTElGajZvWG5OeFowU0pEMHU5c2tD?=
 =?utf-8?B?dGdUODJLWXRXRUluN214U1Vndjg0cVA5ZmlNdld3ZkZyOUFZc0NDSC8yZ3h2?=
 =?utf-8?B?MWRXeURLdmpTaVdyYnM4QmM0U0I4U0JPbnBYTXlaNmRXUzhsRUptaGd2UXR4?=
 =?utf-8?B?QTZiQXJ6ME1Fa2JjTEhFYVNxTTRYcnJoSlRnZXRHcm9tM2YrN0daQUdPME9m?=
 =?utf-8?B?cDRmaisvOFBjbzljakVUTnBUU2lhVnRZSWNIaEVYUUNRWGZvaXNSQUNUMTVO?=
 =?utf-8?B?NnVxYmQ1Wmlyei8wd1k0NnFZQlVkc0ZNd2JPQ1FVQk1tcUlETERBRTBEMFo5?=
 =?utf-8?B?WUg0MUJWbHZEYTBlNjN4eDJZbFlkN1VQSVh6MGpiY05HdEl6OU1kYmVBREFD?=
 =?utf-8?B?SkdheC9UR0sraWRaWDF1NVdzN0swNTE4NGdPQjhJdnIxdlVjUSs0aHluN2Vn?=
 =?utf-8?Q?2U4a/M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:12:58.6046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c30a65f7-b3bc-4451-a323-08ddc5121f95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054

On Thu Jul 17, 2025 at 8:49 AM CEST, Jan Beulich wrote:
> On 16.07.2025 16:18, Alejandro Vallejo wrote:
>> These days d->max_vcpus is populated on domain_create(), so use that ins=
tead and
>> avoid a function call.
>
> One further nit though: Please limit commit message line length to 75 cha=
rs,
> such that certain git output (indenting by 4 chars) still stays below 80.
>
> Jan

Sure, I'm happy to do that. We might want to add it to the CODING_STYLE if =
there
is consensus though. I'm not a big fan of unwritten rules.

Cheers,
Alejandro

