Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5334ADC785
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018056.1394968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTCk-0001bT-Lg; Tue, 17 Jun 2025 10:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018056.1394968; Tue, 17 Jun 2025 10:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTCk-0001YR-IX; Tue, 17 Jun 2025 10:06:10 +0000
Received: by outflank-mailman (input) for mailman id 1018056;
 Tue, 17 Jun 2025 10:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wDO=ZA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRTCj-0001YL-2p
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:06:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2413::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef836e3-4b62-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 12:06:07 +0200 (CEST)
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 10:05:58 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::64) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 10:05:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 10:05:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 05:05:55 -0500
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
X-Inumbo-ID: aef836e3-4b62-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3Dh9wimFpSXCRD2z9j157l0Lp5l21Yby+BG+s/NNY+eDH0KNveknVA4TzrWEgWUx3d9PHm5+XVIt3ax+eRgzFXHtyOOzIAr4RkdUBRGwWKdNDDJHC1yDvGQJqs5TiYTPKL4RyXCYZZp+WgWmgsjjeQ83Iva9knbb45yq35J9aFn9su2i3SvfPkWxj4TeXQUGglRzGFNhhXNToJrAMPKewj4orJByMnpfR+vRJPsFdbKAIyVIIiwUvjKKAN7QnIiEA3nvQLHtwjm3/ERdx8E+huNkCByRJMkWwrrz9lfc2SJSzLYffEWf9AOoxbPtxM3qiILhBbBaEiRPelyytn0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQIRDRDP+DrnJgoJHFlAKc3k8AM7vs3qKBi025NYhP0=;
 b=podLQLwLm57rstsSKvZ87uJjncFe888ZdBiU0PSAnhh7FDTRH2ZuBmk2VPzLqrBzU9Gw0SnV3tcK/fllkAzK+iVRaDE2DXxAJqQmZMrIz3rt9tArY6gDkyyl+8mv7M62U+WdgoeuOqOzaGNSqCEy9pTN5nzpoqaiE27WIUYwqCniqftYKBkp1PCXaM7XrtDyosxs7RKPe2/EWuCM4bHKMAOgkMRWoe8wG2oGIUVK8+itdy2ptEg1riKwR3eJvfciid2N7l8nPEaoNMM4Z859aM7a6v2zTZHe6nA2xkQO9+ZZgPpjLuIRoB8OQiNLm2QwUjhNjHbqNy6derK3CXH4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQIRDRDP+DrnJgoJHFlAKc3k8AM7vs3qKBi025NYhP0=;
 b=J9tN8nn4QuT97S+0Arpilk/PzL3s4idob/HbuIyxJQk+f1BPr6bQdIZkcI4/NsVtBW4zdDlG6iN4w8IK8+J2T2mLra4qQJYhMRJ0c931qjXGqwMQ5Y1lATzYPLuezi2pB6yRljnTPjf8T0XTP0ZAIef34ijG7thLIU0aiEzeyWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Jun 2025 12:05:54 +0200
Message-ID: <DAOQ2YKYAXF9.61P9CPTUJ6JD@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 06/14] xen: Refactor kernel_info to have a header
 like boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-7-agarciav@amd.com>
 <4b33dbe2-ee86-441a-b426-6551ccd04b31@apertussolutions.com>
In-Reply-To: <4b33dbe2-ee86-441a-b426-6551ccd04b31@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dff3368-9327-48a3-fdff-08ddad868e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE1yU0FjVkVCa3ZVNFFSaVhpamJwSUZMbFhCWExuR3lsb1pNdldrTlNBNkJa?=
 =?utf-8?B?RWZMRTFiMlhEMnhnb3VBYlNRNWNZQ1RkbnFObElWTTArOFl4bWVPcFIwT3hG?=
 =?utf-8?B?MUdJRXZleks1b1lZRThsL2dUczEvNG9KbllOeU1zUlFIRTdBT252N2FTQ1do?=
 =?utf-8?B?M0t3VFZEdUJJMUdJRHZlTHl5NVV6bGNqQ3RlaGVhK3J3ejl1UmYvV1IrMTVX?=
 =?utf-8?B?cDU2NU96R0tZcE1XVVJFT203UytHbGVCSVY3SnkreEp0Ym5xSzhndDA1VmZv?=
 =?utf-8?B?dWVNZlVFQkFMSzNobE14YWZxN042WHFGT2tuSjlhMjBkTmgwdlhNbE43bGYv?=
 =?utf-8?B?S1lnamNCZUNpMXNPTEJkUDE0UEI3dWpIUUhpM1N5dDd6emUydjlab01aUFJ6?=
 =?utf-8?B?bmxZc0oxUHUxdFBoMXViWHVmV0o2Z01Ud1gyTU1OZTgyK3dtRWl1aWhFRFAz?=
 =?utf-8?B?amNsd0xUeVhsVUpBeTVFTnBZOUx6Z3VuSjlNQ1VhV3JlZWZHNUpKZEFyVWlC?=
 =?utf-8?B?NStGUnluY3lvZjczY3dBUXpaTGw3b1hOOXhWdExDQmZQd0F2TloyRFdscGFZ?=
 =?utf-8?B?eWdzeEZaMXprVTRJUmJjT1YzSHhsKzhBOEp6eXpJbGVKb3FMWmZwUmhaMDBu?=
 =?utf-8?B?MFE0cUs4bE9wemx5S2lybkFuSEJuZE5BeW5vZmJuSGdFM3F4YlpqR251Ukho?=
 =?utf-8?B?Qis3RTdieDh5Zm5JdWVNQ1ZXUElFaXVHWFl4bTNTN0xNUXU1c2NLekViSXVN?=
 =?utf-8?B?ZGJxTTZ1aThSb1NPSmlId2kzTkdLNGd6NjRIZ2Vyb0FMN0E1dnlqZzMwVlBH?=
 =?utf-8?B?U09tVldKK09OZk5nWlJjd2JKTkdpakV5VEJDM01ZUngzZUt3VzZkTExhUHUy?=
 =?utf-8?B?ZUM3U1hKdDE1dlNMZXd1dzVWcWZmei96eEZuQ3NXT2lUUGUzTmpuY1ZHZE9S?=
 =?utf-8?B?eFN6Q1JuTGUxajV0L0xrS1NuVzRKakVMc1NMVWJBREs5bnZkMjBIWkg5bTZZ?=
 =?utf-8?B?NzhLTzJqb3Z4dSttc3hVYnBxbzYvYWhSWnIrazdNOTNTc2orMUY2c0lzVnlP?=
 =?utf-8?B?TWVySEtHUnhoTWhjZUNTK1NvU0pXR1BHSHQzSk5MTUhqeTlRU0NHNzQwazNX?=
 =?utf-8?B?aHlxbURrWVVuMlRvck9EZFpLVEc1ZlMzeXdiR2N0K0tCS3FoU3ZhUGtNR2V2?=
 =?utf-8?B?V3pBNjgyWmV6bENXQjQvSG1LQkNNelZVaTNtWTR1VWk1cTRjbVA4NDcwbWI5?=
 =?utf-8?B?WWdZRkpWZ29JeGl3Tk1TSjQ2a0NiOWVCc25kdm9ROG1mUkJ6MDhrdmpHTEZu?=
 =?utf-8?B?VUZjSjJlcmFEZldXRkp0c0FXUW1vcVVrbXYwTGlwK2ppOVBueG9QM2dsOEc4?=
 =?utf-8?B?N3d3WUNZZHZmMDNPcC9lNjYydHp4K2dBVU5GZVBFTFl3NTNwTm9tTk1TOEVB?=
 =?utf-8?B?NUhBSWk0YkdYbkFKZk1FamYyOTNJSnhUdjhKZmRLZGFJbllBM0xRVTMxbTk5?=
 =?utf-8?B?a3IvSUU4MnhYV2oyWnBGT2tMK2NEL05xK3gyN0M3R21RVk1aU2RYckpXNUsr?=
 =?utf-8?B?RUZ4bVdybWlYSmxYWExiNjFCTFY0UGZaTGp4UHNmUDV1N3huNjRNVGhVUXBa?=
 =?utf-8?B?dm5DMm14VjZLTktlUVFOS0V4ZWFFYmpFdE51YXl4RzZaM3d2UkJvcUQ0NVlq?=
 =?utf-8?B?RTJKZXh2OVlpdUpLQ1UzQ3h6N0NpMTJIVk5hNUdrZUZxaEZvQXpQcUhobXl1?=
 =?utf-8?B?Uldsc1M3RU1GUlVDT3JlazZLK01KeldLMzlXb2ZKc2VOUDNwSjNubURxS1U0?=
 =?utf-8?B?U2MzU2VFQ1A1SGsvME5RN0xySmkyekRlR3FDaC9SWG9GbHJ4OE9GdVMzVndB?=
 =?utf-8?B?SHRlVk9FMkJyWmRlQlg5dEM0NC9uZjN1Y01pdUlHVHN4TTVzR0xjek9WRGFu?=
 =?utf-8?B?SEFmSmFqQVBmOFFVSjVoUHFmRnNmUW5DOHRkdzYxT3FQTkxld3lheW0yZ3Y5?=
 =?utf-8?B?SDRwd2U4Z1hqMXM1OGU4bWhsWmR1VTFTNldBaW1uM2NwRUVsNCtmTnR5RDRz?=
 =?utf-8?Q?Z6hLbr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:05:58.0288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dff3368-9327-48a3-fdff-08ddad868e54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

On Tue Jun 17, 2025 at 3:22 AM CEST, Daniel P. Smith wrote:
>
> On 6/13/25 11:13, Alejandro Vallejo wrote:
>> Create a struct header within kernel_info with the contents common to
>> kernel_info and boot_domain, and define that header in common code. This=
 enables
>> x86 to use that header as-is and drop x86's boot_domain
>
> IMHO kernel_info is an extremely poor name for this structure and=20
> hyperlauch attempt to resolve some of these less than optimal choices is=
=20
> being undone.
>
> v/r,
> dps

kernel_info is a big misnomer, which is why I originally typedeff'd it to
bootdomain_t. Note however that at no point (in v3) does kernel_info reach =
x86.
The header is effectively what was already in boot_domain, except it's comm=
on
code now so the domid field (not yet included in dom0less) goes on an "arch=
"
subfield. And x86 only uses that header and doesn't know or care about the =
rest.

Cheers,
Alejandro

