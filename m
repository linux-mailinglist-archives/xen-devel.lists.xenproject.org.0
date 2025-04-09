Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018DA8223E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943816.1342442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Sl0-0001kr-GW; Wed, 09 Apr 2025 10:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943816.1342442; Wed, 09 Apr 2025 10:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Sl0-0001jH-Dp; Wed, 09 Apr 2025 10:34:10 +0000
Received: by outflank-mailman (input) for mailman id 943816;
 Wed, 09 Apr 2025 10:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx2+=W3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2Sky-0001jB-HY
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:34:08 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2409::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d43387-152e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:34:05 +0200 (CEST)
Received: from SJ0PR13CA0121.namprd13.prod.outlook.com (2603:10b6:a03:2c6::6)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 10:34:02 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::b2) by SJ0PR13CA0121.outlook.office365.com
 (2603:10b6:a03:2c6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.11 via Frontend Transport; Wed,
 9 Apr 2025 10:34:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 10:34:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 05:33:58 -0500
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
X-Inumbo-ID: 28d43387-152e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv8cnczwM1mTrJylI+9ssJ45qMOGfAJi7+O1Cvju7Qg7GkB8Yb4Y2cUdEci0ACAp9HYKC9h2AS78ZgmuzLCFCrvP83Rovp2jegMHEg+Tjk26Ve7iQH8RC9pXrno5INLeArkhxRMIrUadiqTC0q0gYgW2uwos7FyUCxgClh8BLleKIRqQTBQieeCiwPZ/lE8b71LIGDikOJWUcLdHlPUh1VUKkSWhV9o8b3SHvsYHhdLY01pUV7LqN/wbHBFBPbWvzbYhixCFczaeqv6seDQm1pAZPfhpKCqVV4l/zVhLLxzUZJJCn3I8Fs9swn125N0vNJGJPrdfewVYhb7O9y38yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pke6scDrYyqJ8alNKcGehBSfFs5tCsHErWrJaemKv94=;
 b=s3D9TAOO9xXvlN4bnQccZTmQNSw1b3nB/OYDbVxKdg23VSuRUFEgUDvEmXxVFltHdGoSRHWmxOZO5Ly3+Kp0WxOrbZuVApDs123E9+qiKlUOnDi5fSwxURtetYc2EUj34trIP9PTisb8CkV66nfSrJqTNexPP8UNLctxDqJdCkl7qBg/Pqd/bj1KXdcGoVfN1eYv7GKGqzV7SrqcRqB8cqXd+xW6JQalgQf42lS8uNVG2EVlNyyCkd8rCNqJQxbJVfEb5Stp0bBCxKn2fJdrUwTbtrDfEjq8oWiCq+8D93Ff8vsqxrCViUz8S91Og6A7kXQTkQYN5h8NH2xAZ5XYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pke6scDrYyqJ8alNKcGehBSfFs5tCsHErWrJaemKv94=;
 b=RT9sWs9YgF6FAQWx1s2tcN6wLp5NJWhpFb7kwFp/DOVxYH8RPD3sIuPqHPssPwhX0nu4GqOl0BJyuEKucUtKJ8oLS2iqMIQIw5NOAs1/zcYfo4pAsP3AfIaUFrRGkA4UwZ8/22TAO7CV95Yl86UZBDn7te3nTt7eGm7mPcDBDXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Apr 2025 11:33:56 +0100
Message-ID: <D921GUF7GQSF.F8WN34U5M7L4@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 02/16] x86/boot: introduce domid field to struct
 boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-3-agarciav@amd.com>
 <8089dab8-d94d-4eca-ad75-fec972386c80@suse.com>
In-Reply-To: <8089dab8-d94d-4eca-ad75-fec972386c80@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: fc86b9eb-8f0a-423a-2d40-08dd77520b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1U2NWNSaDBvbmo1a1FpTTBaNU5kczYycThhRWN1LzN3bERFbDB2VjhQRWhv?=
 =?utf-8?B?aE1FYmJGc21pWHAvLzhoWUd2Nk1UWE9kV3B2bk01NlVMbkVRKzZmeVNiWXlr?=
 =?utf-8?B?QTFVSEYxWG9oS00yelFvbzdBb3NFVXFNRkdWUCtsdmdkQk10bVNGZmhydGgy?=
 =?utf-8?B?NnUrUVhZWFljRC9FN1FMQ0tXeUNqYWZDZzFEdWdmTHJ6L1RZRHlJWXF5MFM0?=
 =?utf-8?B?TndCeHdxeHJUUmU5bjBXMzdKTU53VW1hQnRtOGROakpoTTVPdVhCOXRwSTNT?=
 =?utf-8?B?TlBiWWphRkdoeTZWcFgwTFFTQm1qSWs1YzAvVTVYYTJyeXBqUi9WRFNHNnA5?=
 =?utf-8?B?Q3orcFRCUFZYY0pLUGlSVzI1dHRzdVFZaUFTb3p3VWl2eUdQS2xsNGtnaitr?=
 =?utf-8?B?U2tjb1djQkkxZElSMUo3RzUyOGRzRzlMR3FubFlxcmwrVVlyWlBvSGFrSDdN?=
 =?utf-8?B?VzJCYXowd1hlVWZnL1c0c05XS3g3RFZpQVBmY1ZmMDFQM2FHK2V5eVptZ25F?=
 =?utf-8?B?UlQ2MFdlOEFtTG51elAwNm9HM2Z3NjBKT0JWWTJCc1dIU2pRYlNOWkR1UUUw?=
 =?utf-8?B?WDY4WWgrN2FkUHBZN1FRVVRyd2oxWnJWeCsyeEhCa3o5RzZrL255aHB4blVk?=
 =?utf-8?B?aUpaS3FTMFVqL25zYUVBdmFhbHVSRkYyUldsbGdCblltUERBU1FMejhaeVB3?=
 =?utf-8?B?OWhwNURCZ3dyTFozSEk1MUdwdFROWU81QVZKd1FhdlJac202amZzaGFTNUl2?=
 =?utf-8?B?bnBPT0l2dHVZendjWGlPSW1kMWs2ZjV3VkRGSmxCTXZoUnRCdzUxbVR1TzlD?=
 =?utf-8?B?cTErdTJXTzA1cVAzNnN0ajZWaTlUdGRucmNyM3VydktyclFjb252b1pVM0Vk?=
 =?utf-8?B?RjN2bWZUeFJKWjVVVktUVWprSENLS3lMQW1WRWxHWFVtNTd1aEZxcHN1SEFz?=
 =?utf-8?B?clpUMHVoNEVaQ3F0dm9Kb0lNbWs2R2x6WGgwN0Y2djQ4NWs3TXNUV0tVU2xS?=
 =?utf-8?B?bElEWFJRd2hpcHN5ZWVOdlBYT3d4cDMzVFZtdURDbDhIOE9UcGk2SkFBZlhU?=
 =?utf-8?B?QnFwVmpYcVVIZW5acmtDYlRCWXVidkQ5S0l3WWFLYURrdkt3dmhNZ0ozTjlo?=
 =?utf-8?B?Tm52a3FlZytDdEVCaThpT1JEa3pRNFJsb1BFWXlNajB6VFAraXhwM29nT2FL?=
 =?utf-8?B?b0FGaWkxSUlRTVMzZ2YyM3hHTjlYWDlxNmhnR0ZpUmF1cUlKVTM1TVJ0MDFQ?=
 =?utf-8?B?VG5ib1ZPdzI1ZHJNNTFvdkdSc25jTHFMNWovZ0N6czZMbzBVWU9zVUdpMGNX?=
 =?utf-8?B?VVVlbU0zbkQxWkdCd0krSUJqZGlRTWlIN0ZvWnZhYVVYd0NmTC9YeVJNTDVh?=
 =?utf-8?B?MDhmUnRpRWg3Q01hUktrR0lvNytnc1RUVXJLVm0vSjgzQnVOMngrVEZ3eUFk?=
 =?utf-8?B?U09tMjhrQjN4R0hqcDYwUlNuK0hWR3RlRnBHN0VCaFA1Z01pM2tqaDdaTmx5?=
 =?utf-8?B?amd5WCt4d0FSR056RmZxK3hxZkdiOCtvOUw5bjBsaS9hVXYzZURnVWgrd2ps?=
 =?utf-8?B?YS9TakUzQTVsSFNNQnZiamtDb0ZYZWpGQWgrc1lFb0grY3pSYVVJdnk4L25z?=
 =?utf-8?B?bE5jZ2FKU2k4V1hJTUZTWThjakpHWjR2T1Zia0xsNzdnRE4yNzFuR1VIeGV3?=
 =?utf-8?B?cWhzZE1waU9udG1oam5TeHBua3BQMTlOR1VpV2x6bzhJQ2ppY2U2RUFKRmlh?=
 =?utf-8?B?TFpYU2dIN2lTL285a20vQTZJSjhpL1lBT3R2ejNxaXFWREZJY2t2akVGWHNj?=
 =?utf-8?B?Nk5UM09MY3hoVFpqS01NUWltUktySUUrSHBNbiszOXhtNFRPYnhxQ2VFTitB?=
 =?utf-8?B?elR5VTRmWUtSb1MxNStvVlc0V21idTMvRHJvalM0RDJTQi9ZWDZZbjd5bDJ6?=
 =?utf-8?B?Y3kxMXVRSEpoMGxKZkZjUFhXaXlPRm83cUdSOXR1UnVWS05LWXF2QmFZY1ZE?=
 =?utf-8?B?MU5ybnhTeHFMelFqNTJFRjdYTzVERkowa0ZTRlVLZlM4NmFNOXQwWlArdndm?=
 =?utf-8?Q?unvh+S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:34:01.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc86b9eb-8f0a-423a-2d40-08dd77520b54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277

On Wed Apr 9, 2025 at 7:34 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> @@ -1010,15 +1010,15 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> =20
>>      /* Create initial domain.  Not d0 for pvshim. */
>> -    domid =3D get_initial_domain_id();
>> -    d =3D domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged)=
;
>> +    bd->domid =3D get_initial_domain_id();
>> +    d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privile=
ged);
>>      if ( IS_ERR(d) )
>> -        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
>> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> =20
>>      init_dom0_cpuid_policy(d);
>> =20
>>      if ( alloc_dom0_vcpu0(d) =3D=3D NULL )
>> -        panic("Error creating d%uv0\n", domid);
>> +        panic("Error creating %pd vcpu 0\n", d);
>
> And why exactly is this not %pdv0?

Likely to avoid what looks like a highly cryptic format specifier. But I
agree your option seems nicer.

> That's what would be possible to catch by
> grep-ing for what vsnprintf() would emit for %pv. Preferably with that ad=
justed
> (which can be done while committing):

Yes, please.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks

>
> Jan

Cheers,
Alejandro

