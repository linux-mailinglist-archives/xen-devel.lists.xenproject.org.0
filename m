Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E0AF5C1D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031346.1405153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWz0j-0000U4-G9; Wed, 02 Jul 2025 15:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031346.1405153; Wed, 02 Jul 2025 15:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWz0j-0000Rk-DQ; Wed, 02 Jul 2025 15:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1031346;
 Wed, 02 Jul 2025 15:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWS=ZP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWz0i-0000Rc-6h
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:04:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9f4a5d1-5755-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:04:29 +0200 (CEST)
Received: from BY3PR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:217::13)
 by IA0PR12MB8696.namprd12.prod.outlook.com (2603:10b6:208:48f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Wed, 2 Jul
 2025 15:04:26 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::4c) by BY3PR04CA0008.outlook.office365.com
 (2603:10b6:a03:217::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:04:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 15:04:26 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:04:23 -0500
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
X-Inumbo-ID: d9f4a5d1-5755-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEhpYbGzTNLGIl8uCLwInELJtJnPQv5CnoayMIostox2Nxis5I/AlnmjUPEIOhyQ1J2gfyDzTxwJhw3kMHM2eu9t096vLASiyWjhy7H/OyXgmzbZQLeUjCk/QnBgFMqL1OnmNznwfCDxFWa1oP2TxYvepFxE+mSgT1dmV7bjMrj17ZsmhCfQetJPAggoWok2UXXcdgch2G4nyqg/pjGsJM6kNSGAkF/L4/kuCtajWO8bLOvGGiFHygSvAqOhqp9MxRoKlWldYyim2DLElVxz/10s8BEzsC7QjP8zsF5SSgd5Bpr8gT8BktEHm4azBoyky9ngkhnhhmH8nXdM+uKIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VtO0xSKvYvtRmGAeHkwDLFMwyQWrku3ANzTOojKMLU=;
 b=dWaTPMw970GF8mo5W7x9DGOLwjy3JYceDYVo7O+dTNu9hG95xCXhB77yj2yxkcjSlR0MQjRNNmp7+22oDROKEP8pYizFKqFII2W3qXBzZ1GtuIXmfMCLenKFcnqHx/kr5frRC63/ww7XAebWYiUuQDUZ8M1vY3swL9YvT8ygtmq9JebViXOy8ROlFsEpCEmJ8ydouFJ3X9Yh8FOeo/UmcWCrXQxqZ7EMohEA1lPjFFjYK/Ol92BvNEjt32NrmmZIegxJfo9Ca4yhokP2AWBBKt4r8BmU3rPaCyi0Y7YOlOg/mBrZ3de2WrmUZAjzaokzuGkLlbVnkoZnzmT7aEYFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VtO0xSKvYvtRmGAeHkwDLFMwyQWrku3ANzTOojKMLU=;
 b=yXhTl3IfvAM7Tf8qARNt3J3sjOg53QxbHXDQZnqu0GxQ6UCIg73R14LMVZGcenvTXok6vM+QELotFlp538mrpdi+qKfi3Z9ylx/hvxyvmnlWUKlySbhlmU4K2mTw1xgKGTkPZcCFVXUsIjtRmD1QOHe3Dq2VcZ9QQY9x82SxBo8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 2 Jul 2025 17:04:22 +0200
Message-ID: <DB1NTNR0LRN7.2IC1UW3NI041V@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with
 the common one
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
 <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
In-Reply-To: <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|IA0PR12MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 545d811f-5d83-496b-8fb2-08ddb979bc8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlZNb0MyeGJwaHpIMUVEVFV6dE1KV0NKOGNydVpMT3VyV1YyZW1yWi8waUUx?=
 =?utf-8?B?dTVDNW1OQW82eGlhMUZNR09jZ3dLaVIvK21LRURrQW11NUhIQXpHdWg2bUxW?=
 =?utf-8?B?amI4azc5ZUtCUzVDL3dDT0d4Uyt6KzlmL0xybmJhTXVZd1lmbDA5VHlPdll4?=
 =?utf-8?B?cEdVYVNCZ256S0M3bVM0RGtyS1VCQkIwM2E0bEswR2ZtWFBFS0puTmdiTSsz?=
 =?utf-8?B?bGNWd1paSFkxZHFIRUFsYjFxdGtkOWJQNWZTRmtoMjkzeEdNWjlzOW9Ja0gy?=
 =?utf-8?B?WmJSdkVnZkJuYjVHbm02SVJpSmxoR1QxWUlpZU9UR2Z3cnpBTy9lcnpOMWtt?=
 =?utf-8?B?cTBHaWlkSXdmMmpiays2S0x4enZwZi9aRU9raERKbjE2MGY0a1ZmMHRnKzJK?=
 =?utf-8?B?ZlEwUC9OSmZpNGIySkhoaGVrMVpCZUhaQnk0MkNtNXBXUlhxaDB3NFRPK0x4?=
 =?utf-8?B?citpWDNDWWhvZ3dINW55L1FCQlBpSVRpNU5CaU8zL0ttbmJSWFcxSFBmNzRS?=
 =?utf-8?B?NXlTb1JmMXFwSGNjZWZUM1NUSkYyNXJRWXBEWnVoRnV0M0xPWk04L3FraGpO?=
 =?utf-8?B?b3pSVUJ5YU1BQ0JsRkdMcUFwUUNDblc0ek0yb2Q0MXJHZVdDRHJsM1ZBaFZj?=
 =?utf-8?B?N1VWanI0bmgzdGE5RlZuWWVuVXovL0ZQbXY5UzlRMXVTakdiRk11b0xyYTUx?=
 =?utf-8?B?OUI5ZUlESG05Z2xpV08zRUhMVDZnUElma2x1Yzg5eDlham9ETmlCVXl1dE4r?=
 =?utf-8?B?YkZuQVREVUNPR0h4STZOWUtqeXhJSXlUTmJRY2NsTFViMk5jK05LRGFlcERj?=
 =?utf-8?B?Wkl2cHh3WnVLM0JoZ1RPTE00dGRaaHc0Sk1VYjZjVjN2T05CejJ2NlZHeC9D?=
 =?utf-8?B?dGJVc1lISVlmNWQvb2l0aE5qTm1rQ3JjL29YQVdsNEtTVVc2eUhia21raDA5?=
 =?utf-8?B?aklnWWxoQ1VHSGNRYXl6ZHcxVk5QRC8yZlc2UlNnOFhhYnh3Sk1xMVZpNjVt?=
 =?utf-8?B?K1FEZmFnWmVIWm5FQjRYNXZuSEgvYkhRbGt4d2g2cmx4Sk9pQnI2UlZ0RG5s?=
 =?utf-8?B?L1ZseUVBNElTMXIySUlvY3F1Zi9SNmUzZEVWTjg2T3c1WXRhYy81V09RTUt4?=
 =?utf-8?B?UWhFNFk2QitobVY3V0tnODBPcVZ2SFVFL0JxRmRqaWMzU1gxMFl0SmoxS0tJ?=
 =?utf-8?B?SXJuRFM0YjJrQTRPRGRpdURCeUd1TDRWaXREaktwS0xRNmo5bThhcnZXbXhi?=
 =?utf-8?B?bHNwTFhrdXVpMXNmdmJGUzI1Zms3N3ZUS3Q4VEVmWVpIVHczT2pTT3RLaXRS?=
 =?utf-8?B?aEJUMnc3TDlRK1ZjRGtQb0VBZmsvSGprLzRvS2hqSnoxdmV4ZGtBT2pGQjNt?=
 =?utf-8?B?T3NlM3ZMVEJ5TE1vMzU3ZmtyT0tVaUh5eE5zNnVvTk1NRUg1UDRNelAyM3VH?=
 =?utf-8?B?VjlMSzF3NDhVN0NRTUxXSlBzRE5PQ1JXL2RuT2xha2ZITGxFZWp4Y1ZRclRG?=
 =?utf-8?B?aG9JSEJETTh0eklaUVhmeGJYdm1sdDk3cm8rM0E2V2ZabmxMMmNLWTFPNVhF?=
 =?utf-8?B?cjE1NEdyOEQwNmo4bUFONGYxcnpFeDRSV3NzemZuaWhDcFJnRklURmsxVmpQ?=
 =?utf-8?B?cGVhY2taaEEwZy92RGpwd3U2TllNam8xcy9GTU1BdXFycHgrU1h4aEUxYi9X?=
 =?utf-8?B?V1hMSUd0MnVTVlU1Tkp2L0hJcG9BeGFLRWN1dXd4YjVBaGo1OTRUUWdWNSt6?=
 =?utf-8?B?dEJWTlZHQjZna2RtVGRDWGg3azArS1Z4OEJ6UFBnRmI0R29SNElPaXlsMUVv?=
 =?utf-8?B?NlVLdkdlcjJZZys3K3FlSW0rY2pBd0s4cll1MnpkbFNTWHV1OVJKNW4ydlRB?=
 =?utf-8?B?eUNoUUdwWXlyS29KVHBvbW9xUFZZYTFkdXZZLzNsM0V0d3g5d2VRc3VqcVZK?=
 =?utf-8?B?R1NORjN0UE9SeFJ6ZGxoSVYzTy9BaWV6S01hUEJQd3BoM3dIUDM0Rm9YQ1pN?=
 =?utf-8?B?YUlRQ3RlSUFveUhUTUl6ZXB0d3lKM1JSTDdYMG9MbFhiR2RaNUZITjErV3BU?=
 =?utf-8?Q?klX4UC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:04:26.0578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 545d811f-5d83-496b-8fb2-08ddb979bc8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696

On Wed Jul 2, 2025 at 3:15 PM CEST, Jan Beulich wrote:
> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/include/asm/bootfdt.h
>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>> @@ -3,6 +3,12 @@
>>  #define X86_BOOTFDT_H
>> =20
>>  #include <xen/types.h>
>> +#include <public/xen.h>
>> +
>> +struct arch_boot_domain
>> +{
>> +    domid_t domid;
>> +};
>> =20
>>  struct arch_boot_module
>>  {
>>[...]
>> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> =20
>>      /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid =3D get_initial_domain_id();
>> -    d =3D domain_create(bd->domid, &dom0_cfg,
>> +    bd->arch.domid =3D get_initial_domain_id();
>> +    d =3D domain_create(bd->arch.domid, &dom0_cfg,
>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>      if ( IS_ERR(d) )
>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
>
> This being the only place where the (now) arch-specific field is used, wh=
y
> does it exist? A local variable would do? And if it's needed for
> (supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
> arch-specific? Daniel, Jason?
>
> Jan

It eventually becomes a holding spot for the domid property of each domain =
in
the DTB. It exists so we can describe every domain fully ahead of trying to
construct it.

Cheers,
Alejandro

