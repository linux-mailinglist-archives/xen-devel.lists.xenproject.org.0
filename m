Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371A9CF32A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837953.1253862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC0Li-0002tY-5y; Fri, 15 Nov 2024 17:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837953.1253862; Fri, 15 Nov 2024 17:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC0Li-0002ql-39; Fri, 15 Nov 2024 17:43:14 +0000
Received: by outflank-mailman (input) for mailman id 837953;
 Fri, 15 Nov 2024 17:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuMk=SK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tC0Lh-0002qf-9S
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:43:13 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:200a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d7593d-a379-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 18:43:05 +0100 (CET)
Received: from BLAPR03CA0057.namprd03.prod.outlook.com (2603:10b6:208:32d::32)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 17:42:57 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::37) by BLAPR03CA0057.outlook.office365.com
 (2603:10b6:208:32d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Fri, 15 Nov 2024 17:42:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 17:42:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 11:42:56 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 11:42:55 -0600
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
X-Inumbo-ID: 10d7593d-a379-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjBmIiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjEwZDc1OTNkLWEzNzktMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjkyNTg1LjczODg5MSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLbrsfbueRIwsX24Nobs9HSeBIX/I1BeG/HGmr0FuxteJgBazQ2RUIHx0o/9HN212zIeFBaoXz8FaToPTxCXGM4lEeUr2rckcWGPk6FFZZ91XQ7hAcdrJQuVSDTgwfPK2CIA/pTGmACfh9ghOfRt/seKHqPRB+qbdfyv/5F/kKT5qGVIyCSYuOllwANWMeH4ZDwNkbsvREhhVTcbeASbVuDxGHeF2x5P86Jx6xYxCBySk4P4kJT+yhpLU4hse27zVSPP/FJPE4kk29aCGJXt/Mkr6lbF02xcAAYX+oc9cysUvaVy1zqMaVy/2mzOusaWPjBm3OSgwZ+zmD69uzs5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6epml8VYlzDbO/4BkdDq6lOkgUNkcK3H4yv8NSHVzXg=;
 b=mJck018TF+EJ40+kFVeunRtQSZiaFG1aEpKzXC6OtblnggC/oN0QacLjf80Cm0+chalVv+6AGXUf8Uwc3g50j867U8yHUJ3shGvKzUevwQgoE+fgN7l+Lnbo6xSAt6AYep0GIn1nL8zbbHGU7aWJwsoBkTLUbxRwHkOXmWMP22YJwbdZ1pBpMoghv3+ZevPxBa3+H2W0S2kmjR1K/9U8r0NKaHKsLAv7ZiypVALN+2bHj+DhsZX1o+tdg7JJ1gwxboIcjuen6XDJi9VGjUn12bc89E6xLfJ3tFxTG/rcudaUMymWu42uxx1daCNUKeis/THl+KJdTEcx88UXA+KvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6epml8VYlzDbO/4BkdDq6lOkgUNkcK3H4yv8NSHVzXg=;
 b=NPNBFWSeXEFXAgLRyYp4ha5TCFOkxGuWH5eU9QH4G5xGUddY8e/j0WsX1pC8TgTxFaVakOguJrHrJngdqhlIMh7+BR5d/I6UPW5X5wK90cJRRzf/OOMMaev0uom6UXjqzGvI0U0wBXcKAJGmHcsv7ziU0evZhYb5EiClbTLYqhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <87d2a1e6-c69e-4789-b4e1-54aaf60eb858@amd.com>
Date: Fri, 15 Nov 2024 12:31:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] x86/boot: add start and size fields to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-4-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241115131204.32135-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: e6eda7f6-1764-415d-748a-08dd059cf0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDRJRTlHdkZheXp0Sm5BU0UxVXJtTzhpUzd6T2ZqTXl1b3cxQXluSUVYc3JE?=
 =?utf-8?B?SXNiMlY5WkFucWtFNE9qbUU4RjJhV1UrTHRPVzZFQWovODBlQ0s4Yk51WGVr?=
 =?utf-8?B?SHdmZ29aYXcyOUZnRndIVDlZZGRKY2tRSVQrWUVrOXBna1J0QUxyc2NQeDhK?=
 =?utf-8?B?T09CT3JXV091ejh6TE5KR2tLSkR4K2tvRmx6bjlvbUFLWDE4S3FRYXRyNEVv?=
 =?utf-8?B?bHd2ZHpwWGlEODA5Q1YvYTdQVHlLNCt0ZGVjd01mM1JEcDE5YnZPSHJwZnFT?=
 =?utf-8?B?Q2RVLy9sdUFZa3FFRGxUQk5wSE40V0hlSW96L1ZMcnpvSFE4dHpjS1IweTlV?=
 =?utf-8?B?WkFEeXhFTEFMZlNoRmJPU29scUlUTS8zd0FQc1BkclhOblZPVFp6VVdVWkJr?=
 =?utf-8?B?UW1HUDl3QTNWdnlTYnFZTG1Db3dwOENSK0c5WHBYNDdlNzFGM0VHb1lva205?=
 =?utf-8?B?cUJvNTd5SUFWcndaa0NHbG5ueks0TmZZb21DZHpJblFnVWhuUFcyWXhpWVJ1?=
 =?utf-8?B?WEl6NHJsKzBaSnRLNDMyN1krbUhOWTZ4aDV3NjhoL2I0Z2ZWQWZyS1hqTUcw?=
 =?utf-8?B?VEQzWkxpYmRENURuSXo2Y240Smw3RzdMb05kQnlOS3Z3WEY1UjRHT1pacHMz?=
 =?utf-8?B?NldyODNmWkFWYkc0c1J1aSt5R0lOUFZ2Tlp6WU1acU1PSWRTZFIwaWx6V2tB?=
 =?utf-8?B?TmhYeHdQTm9rbFhoYmFjU28vTlJmeXFIZnMxcFQxVlF4UjBZR0x5WlhHeUhJ?=
 =?utf-8?B?ZnkwMDdkbXlvWUFiZktHRk5CTDdudUU1UTVWWmRyYW5PeHRvUEc1amllVWtL?=
 =?utf-8?B?b0JSQVEzV2huRWZYUWlhbXRCSTBnS2FhS1BBZXFBbUc2ZjVQUXRMQS92RWVI?=
 =?utf-8?B?czlvT1hRNjk0c2NwT2ZVL3JhQTR0RlhiQzZkWmZ1K1lIcDM5eWc3UkFLSWgr?=
 =?utf-8?B?WVJONXE1QTcrZ2ZVSVpDR2tRWXJvcGNBWm1ESllod3hsbklaQjZCMk1aY25r?=
 =?utf-8?B?R1ozWk56V2xSOFJZbmVGSUtMYUdWaFNYOEtKSFJDN0N1TUZVMlMrai9iamxr?=
 =?utf-8?B?M01Ib082QWtpZEFNRjA4aUNVVDZYZElVT05FUHUxQlNYNmppOHo5SHd2VmZW?=
 =?utf-8?B?RWo2Nm8wWTN5WFdzWlE0RTh6RTErSHRtZ21NK3BpaTdSRElZMGs1T0gyU3lj?=
 =?utf-8?B?bGxZdVpSMFJVdU8yalR5ZGtyT2MwcWFnQ1R6YVRQWTZDUm0wK3ltWmp3TkFH?=
 =?utf-8?B?ZGdOQmR3dms1UFQ5WHM3NytzekxyWmRpN3ZGKzB4SjNmdTFRKzRUazFMQW9B?=
 =?utf-8?B?MHhndis2YzJQOFQ2OTZWNVJ5NWVoeDlxTlpCQ29ieEpTMS9qZ044eFhySnlv?=
 =?utf-8?B?TWpMd2w1M2pyQmdEbjEveXh6c01LQXFRR0tvNHRkYi9sNnM5TWtxUW9NYVEr?=
 =?utf-8?B?U3FKVUJRQUhDMjlrVHFGbFk5SlJUUHoxQVRDQTZSNG5vSkMwWDRLOEVEVU5R?=
 =?utf-8?B?K2gyT3M0NWhIb3pjc0kyQkM1TjQ2Y3NzK2tQL0VLV0Q5TlA2VFJZblJVS3Vm?=
 =?utf-8?B?OTdMR29yWkhkM3RtcWhsalhTNWR4cmRJaVhRcm40K0E3dlFBN1dqYjdoUXBz?=
 =?utf-8?B?WWhmWTh2SzZNaW5hODN3ZzlmdE8yMEFGYmVseUNTVnpmL3ZhWEtuVzM0bWR6?=
 =?utf-8?B?eE94ZzBJN1Vod3REMXNFMitvYytSUmdnUHhET1dFZHdReUdoUkIvS2hkeElS?=
 =?utf-8?B?OG82SysxNDlNbzZ6Wmt1MkphT0JiQnJMNG5iNk9DejI3NWRlWFlqN01LS1Ju?=
 =?utf-8?B?WWNOL1lGSU0zOUVXODFjUlZWWFgrVnRCN3l6TzJnYkE0SmRBTWRpaFVtSzZQ?=
 =?utf-8?B?SWt4bTc2NkJOOVhKRmtwOVQwN0tsbmxPSG9Ob3lPc0dKL2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 17:42:56.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eda7f6-1764-415d-748a-08dd059cf0d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402

On 2024-11-15 08:12, Daniel P. Smith wrote:
> Introduce the start and size fields to struct boot_module and
> assigns their value during boot_info construction. All uses of module_t to get
> the address and size of a module are replaced with start and size.
> 
> The EFI entry point is a special case, as the EFI file loading boot service may
> load a file beyond the 4G barrier. As a result, to make the address fit in the
> 32bit integer used by the MB1 module_t structure, the frame number is stored in
> mod_start and size in mod_end. Until the EFI entry point is enlightened to work
> with boot_info and boot_module, multiboot_fill_boot_info will handle the
> alternate values in mod_start and mod_end when EFI is detected.
> 
> A result of the switch to start/size removes all uses of the mod field in
> struct boot_modules, along with the uses of bootstra_map() and release_module()

bootstrap_map()

> functions. With all usage gone, they all are dropped here.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

with that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

