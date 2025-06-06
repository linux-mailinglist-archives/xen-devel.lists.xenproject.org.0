Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C9AD0010
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008346.1387633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU0a-0003bG-TT; Fri, 06 Jun 2025 10:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008346.1387633; Fri, 06 Jun 2025 10:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU0a-0003ZN-QI; Fri, 06 Jun 2025 10:09:08 +0000
Received: by outflank-mailman (input) for mailman id 1008346;
 Fri, 06 Jun 2025 10:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Tda=YV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNU0Z-0003ZF-Bo
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:09:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2416::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4719aa92-42be-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:09:05 +0200 (CEST)
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 10:08:59 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::f0) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 6 Jun 2025 10:08:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 10:08:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 05:08:56 -0500
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
X-Inumbo-ID: 4719aa92-42be-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC47nUlXDQAKHr8TOlVZHVU4py0hjJCLYAUpQM4viMsrJoWG4nf674fy6xTi5Ep4fMVLPzdBuoB7Dpgi1FcEiPfRPP+75W/w5p6yiBUdaNRQCp+WkdExhB8NxOtkbDCxqkUzAtyr0ctl4c3Dvd9DaVxnbrXCaH0BaPu/jitb/0XbwiWv0zSrJ7vVpxdOodwHtGNtaPjBdwTihl++FMoCyFh8FpSAGqZb0/LZjFXpL5zQIyXqldujFQ4OxvmVoUNvYvazNsbNuogw5W+3ajN0Tl1E2I6tr4M/C0GlpQyrjfxGtyi3L3kKzGL90X+Ff644Bq9uRsYprUcyDXC7ULfnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx3IxXBN5k5RcDcTzIpFvym+VVOBpMuufrYqlv1pobs=;
 b=p+7V5wy376wWdzq3tMn0By1Mb8Af+EAhtyhIYI7vYR2G6MZpp6ptCnw1vsT3hYuGgyxEXVxNcI/hWY2syET5eORuGkQDvuwi8/D3k1BZAxBFv+xAWO9U5E9VmUfVBOZZ512eCxSWxwsbZ4zcysml5G4CylnQ89kzVBkkvjoIA20cKpitb0HjFKhv1CxUpr82Ew/ovcFYh5ZEqx9v9XVIgzWjs+d8Np7zYkqgjld5QzUrSbjygSA3tsm/JMamrpdLwDM9U3Pg5ed0ZpA5ylPdn5QyYFFNF0mfo1d/13lZlQvOp/l2qR4k/XKHUehRrJrBWelCbOryhjmF6PGULMkEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx3IxXBN5k5RcDcTzIpFvym+VVOBpMuufrYqlv1pobs=;
 b=JL3dbiT+qFtDTyJmrsc5H4L2mtz6x55I9GnU0Wiozm+NvkrTNbcz8nBXx85yULylZaajLvcJWq67Lwg+/jb8H7A4ohYNWCLWYbOYF/1YwbbDh2wnXC9BKJUzz9X39cOrN3MS9p+e6N5q/9J2a1PGl1yvz/uG0fI+udWRjyp3R4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Jun 2025 12:08:54 +0200
Message-ID: <DAFD99VSFIEP.1VCU7C02XMFPO@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 08/15] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
From: Alejandro Vallejo <agarciav@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-9-agarciav@amd.com>
 <633ffa7f-cf26-4ec3-a153-28404c39d882@amd.com>
In-Reply-To: <633ffa7f-cf26-4ec3-a153-28404c39d882@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: c822ac83-a4b2-4283-a9eb-08dda4e2272e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFlHRXhjRHdEZi9JZXpsYXREMzIwajdRYUFKemV3amR4UWRqR294bEhKbjBk?=
 =?utf-8?B?aVNqMTF6czZ5TWFMV0orZHVVMVZPRVVkeEZKcCtzNVZjSHgyVHo5Q0ZEbVFq?=
 =?utf-8?B?Z0llZDltbUFhVCs0Z2pnS0ZJL242MnErSTNIU2VKVEJTYndyd2Y1YjU4YVN1?=
 =?utf-8?B?bmRHWGF1M1JSZ2dsb0JER2VmalcwY3Q0NnpMVWRZbDgveUdEeWt0dnJYOG1h?=
 =?utf-8?B?VE1TRXZTdk84RUFYMHdqRGRzVzVnK2NLN2lLL1J0d2lsQlQyRG9CSCtQMmRt?=
 =?utf-8?B?ZEFVUXVvOXNzY1dYdGJmUFp1L0tWcWFlbVBBcWdYWXhXMWc2c3VLUnNHUVN1?=
 =?utf-8?B?alc1ZmRtOG0rUUkyZCtOU0xDa050cDd5S0ZpNVZwU0dXRGlacWZaOWhlVkZ5?=
 =?utf-8?B?QTZwKzVqTzRKOThFQ1dyNENYdkUzR0tEMTN3WHFTR0JBdkxFTU5kTnMvQktr?=
 =?utf-8?B?VkFRNS9qSVpoZzlXcFRTMDFla2JubFMxOTR0a2pyQmwwOEF1Z2NWS2hyU0wv?=
 =?utf-8?B?OTZScDVGNkg0NUtUTDd6TGErVFVvUzF0bnVZVzdBYTZDaERvNEVNUW16cUxj?=
 =?utf-8?B?Z2xxUzVTZmloRDdkbFJQWjN3cGNCY2dJcXNOTVdHNm1MQ3hYOHFYWXRVSUtL?=
 =?utf-8?B?RUZyU0o4RkZCYzErTjVrTFNMMXAwL1VjNVRmN1Y2elhSNHg4cDlXbjFNbFF5?=
 =?utf-8?B?QzV2cVhMWWJqQytnTWlYd0YzTzdhNUhCY1lLdWtYeEYrZGROK3dONkd3Tlox?=
 =?utf-8?B?Tm1TMDBuZ1RVL1NHaHk1c1FjajV0eVN6eEk2Z0Jhc0hBNzQ5NlhxRUpYWDZS?=
 =?utf-8?B?SHU1TW1ranpEYWRZUXBlckFGOWFuRTl5SWdoa0VSRFBFa0dmcEI1M0VNWjBu?=
 =?utf-8?B?VUw1VFdPQm1ycmdrRWExY3JTYUIxUGlXTnd1cHpTTW9ONXArME9IT3dkc1R6?=
 =?utf-8?B?YmNlZFZDL2NZWTJldmtiemxCMmpzZTRVS0RyQVd6YmQ5MGRZQ3Ewa2lUWGVl?=
 =?utf-8?B?Y1VJVTFZam83L2pSVnZrbGZlU2FSZmJ2VkZ4ZWlSZzR2S3dSQ21SUHMyWlFi?=
 =?utf-8?B?YkJidFpKNDIrSWF4cWpUOURQbDdJK1pZZm1uZmNqRWlsWndrb0pJbmFRbDVZ?=
 =?utf-8?B?WXZCWWFQMHhrQlBTV1E2d0dEZzNQRWY4WFJlODJyMlFRUEdWZ2RTd2F1NWN6?=
 =?utf-8?B?Q3ZCSTd2a3IvNTN2UWEwcFBYNU5Yekt5Q2dJZEMrUkJLYlR6eVFlYm5pZktK?=
 =?utf-8?B?UDkwQWI5a3dJR1ZUeGt6Y3VaVC9kMCtTUGJjMW1MNkw0djh1OE1rNjBzM2NJ?=
 =?utf-8?B?Qm9aVE1wbk45emppSFZaaUxjK05YTGRxRzdDZmRmRVhtQjNCdHJ2N0tONGs2?=
 =?utf-8?B?N2JiUUQ4K1d3Mmkvd2Q4bm5vMDdLQ0tEVkVlRkdNTC9mbE9vN3BzMEp4R04z?=
 =?utf-8?B?dEs5bWpGUWR1K3pEczkzaXBSQTZ4eXlBcXRqQk9ab2xHYWxJenBTWkxKTGRz?=
 =?utf-8?B?V0Q2VW1ndTYxZCtpTFQ2d1Zod0p6NEd3RW9udlFla0REVGo3SXJqV052dkF2?=
 =?utf-8?B?bjRRK2g4RmRCaVg0cVlQeUt2ZmRTUlM1RkUwV3JYNllmWVdGREFlZ3pwVHRo?=
 =?utf-8?B?Uys0cUEzTFVTcW9CYm9JRmNuRm9nWkdrNHUyQkpHcXlwbllNOXRoVndTT1FF?=
 =?utf-8?B?S3FSanM3eHhEMEZPeWlhVFNDSVVaM3FiWHo4eGFxejJsUm1ENStaeVpIRUky?=
 =?utf-8?B?YTN0MUJNdzJLNFFRa3dOTzJLZGRDNktGL1BJWFkva0RtY01YYitiUDFSL1ln?=
 =?utf-8?B?WDAxdmNhVm5zNFZ4UG9YRFY2aGhwMk8rOU95dWtWamtSbFVOZVY2SXp3cS9h?=
 =?utf-8?B?SzJNUDROTFpsUFFLdUp4bUpXYmp3SUs0WlY0Z2VHSXd5aE1YV1o2Y1drQ09k?=
 =?utf-8?B?UW9oZlR1L2NHZSswTk41OHJQaXIyY2J4M1NqU0w1RkNoMDdpKzR6MzhXZ1lr?=
 =?utf-8?B?WUhrU1BaUVdlMEFkMWxiOHZ3MjNhaU5ha1dScVEzbkw4eUtPUXllYy9lLzdS?=
 =?utf-8?Q?b/8Jif?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:08:58.2060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c822ac83-a4b2-4283-a9eb-08dda4e2272e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

On Fri Jun 6, 2025 at 10:59 AM CEST, Michal Orzel wrote:
>
>
> On 05/06/2025 21:48, Alejandro Vallejo wrote:
>> Part of an unpicking process to extract bootfdt contents independent of =
bootinfo
>> to a separate file for x86 to take.
>>=20
>> Move functions required for early FDT parsing from device_tree.h and arm=
's
>> setup.h onto bootfdt.h
>>=20
>> Declaration motion only. Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v2:
>>   * Remove the u32 identifiers in the device_tree_get_u32() implementati=
on
> I don't understand the reasoning behind changing u32->uint32_t only for o=
ne
> function in this patch while leaving others unmodified. Also what about u=
64?
> Either don't change any or change all.

Sure. Let's call the original u32->uint32_t change a misplaced mutation and
move on. The point is the motion, not these cleanups on top.

>
>>   * Fix an existing const-stripping case.
> These points should be mentioned in the commit msg.

Sure.

>
> ~Michal

Cheers,
Alejandro

