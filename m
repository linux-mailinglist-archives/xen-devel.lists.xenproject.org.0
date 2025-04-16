Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9CCA90508
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956207.1349694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53EC-0008O0-Kx; Wed, 16 Apr 2025 13:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956207.1349694; Wed, 16 Apr 2025 13:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53EC-0008LI-Hh; Wed, 16 Apr 2025 13:55:00 +0000
Received: by outflank-mailman (input) for mailman id 956207;
 Wed, 16 Apr 2025 13:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6+O=XC=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u53EB-0008L6-0j
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:54:59 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6080ce94-1aca-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:54:56 +0200 (CEST)
Received: from BLAPR03CA0149.namprd03.prod.outlook.com (2603:10b6:208:32e::34)
 by SA1PR12MB7271.namprd12.prod.outlook.com (2603:10b6:806:2b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 13:54:51 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::75) by BLAPR03CA0149.outlook.office365.com
 (2603:10b6:208:32e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 13:54:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 13:54:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 08:54:48 -0500
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
X-Inumbo-ID: 6080ce94-1aca-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0ouYWoPSsfBhL1cstVvCV7SjAz4Ke4NYpnfejWOI7A+ggKEmT83dVzhvJckAzmJknLfgO3qRkNZrRccRmBxdkBuOytBiRUPCwxCpeAbahbn3wr2nXVhyHTkumtXINIp/518UH2PmZ9jpjK6mX40eJs5wiZUqD3xHUu/PYFlTII+DDDR/APzoQkzsyYclYj/qR/QbyPWc8ujlX6CXKoDATWLHJWIgqZnY+RJOQclHth0ORnH0bnnCKTcvED/mPErQ7sN5UOG1oFEmlpbIykbPpUkQhs6oDUI4IErYM//9iBFAIkYP6U8I3VLHwHvsyurutrht0Ynq+J2wz+wpUqHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PDFOsbdDrqNum/A2Hsj/mkBWXf32uj2SIaJWHTqL48=;
 b=vi0sZzke0n4si/yZJOs1jl31BAJJww+JoGQJTy8JGgXZEzdT4DmCXxNdOFD3pYukFUlnFnyI4DteE1Aq6jmigfoN840jltLKzkTQvaHP6FS8Yxtm8EsLhyzkNKjowP3X/jSAv9CTn4ydW65fde6YNchiFZIkydUYOHFKn2wCiQmtFbofkhIjeGst7IoLFR6azqTW0+7tQRj9/eSC8+XmYJbdjavOfhv+PDMYMRCm1MDyMuSMeSH1dX+RNH7L9JCTyuK2ABgKmDameUvlsCtlAggLBEUiGaVtKT8wbqkC89OBESlvfASH74TkN22FXDccyK1q2ECd2oX/J+u99smYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PDFOsbdDrqNum/A2Hsj/mkBWXf32uj2SIaJWHTqL48=;
 b=1ey7taBmsCoTjiRWqxJGN9aeqRVy4RXQyvKOZuoMbE5coaV+Og2OOsurfvKlx7gDBzi5vWetm0+tl7BWXXi21iY0xj2YI11ZTbxLslWipcLYAIlSAZTV0dSknwp63RYSdEX8/IFXxs5t6b0bak7RC39uETGwJnKvjRCwj8XUU4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Apr 2025 14:54:47 +0100
Message-ID: <D9844FO74PFM.3R6HB5K2JXAOR@amd.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-16-agarciav@amd.com>
 <c1e5af91-8f84-458d-a9b8-ab9758b5cbce@suse.com>
 <5a674e65-77bc-4d07-a4e3-2fa2c96bb37e@apertussolutions.com>
In-Reply-To: <5a674e65-77bc-4d07-a4e3-2fa2c96bb37e@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SA1PR12MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: ae116302-2d0c-4333-36d1-08dd7cee421d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFROZ2I1NVRLWS9tSTkwdmZlZWgzc2R1cmY4aHNLK2RJblJPZmZvVDFRZHd0?=
 =?utf-8?B?dUV2MDFhUWc3Nm53bHF2R09pMy9XK0FjRXlVWEs0d3BReWFVWVdlNlV1NHh1?=
 =?utf-8?B?dzNhV091KzVrd2t5R3A1MktVN3UzN0xqKzY0R0pyL0VlR2w1eFM4MzdEYW9F?=
 =?utf-8?B?YzVxendVOUR6U3pyWnpvdno1WnZWTVhFQWtabnJ6YWw3S0pYNFhXc1ZKVlVF?=
 =?utf-8?B?clhhaVp2ZjlEYzZjSEg4S3E5aGQ3MUt6UUMzeTZLVGJyR1pRZ1lTaXVrUWNW?=
 =?utf-8?B?TmF4MlZQNTdKS1ZLMkNqbGRoaFVXaUNtKzdmWUZFQkdhVzArZ0JEWFdCclE4?=
 =?utf-8?B?bXU3UXJFTGsvQkhvU1VjS2FRbk1tampTSDdUejVURWNWS3Ntb01RdC9mVllx?=
 =?utf-8?B?c09GQmhFdnJFdy91YklNYUNyaVVWRFVvaGZZOW1MdTVZN1dKU281Z3pXeE9z?=
 =?utf-8?B?MjZaVnErcVF2d1F3c045SUo5Skx6ckJXQm9GSXowbXNhSFBaWU9nK3A1aS9p?=
 =?utf-8?B?TXNkK3MydXdSYWU3RUZIZ0EwMWtrNlVZSXZyK0t0NFMzQWltcHBMa2UzcDlX?=
 =?utf-8?B?N200V0tqSldYKzBaS0xJc3lNZVNWRks0aHk0KzEwMXYyWjk5bXdzMk9XeUJI?=
 =?utf-8?B?MEZhV1Z0YnlkSzVxRFNONloyNit2OGMwSTJiUGdWYTlBeTB2dzQwM3p5Smgw?=
 =?utf-8?B?SDlCS0xLbzNVVmhxUTl5cmlyajNNRU9YR2lIdEpSOVBlRU1tQ3QrVlJuOXkz?=
 =?utf-8?B?NGZoQ0xUZE1zd3FGeFdIRDY2eU53bjdzTERybGlJdkdrT2lCNWhHdUNMbWRF?=
 =?utf-8?B?a0xhS3VyL1RiSGJXMEpPakVBUE9pdWhWRXNIZG1lSGIzekplOHN6M3h5emE4?=
 =?utf-8?B?aHh5b2ZaT0lSS3R5YWYrbkl3YktIRmgvS2ZNdXQraUZIT3NBSm5VQW5UemNq?=
 =?utf-8?B?UDdpQWlDQU5acVBGdjN4WHA4elkrWEFCT3hDV2Q2RGw0b3NGYlhmNFlvWFhU?=
 =?utf-8?B?dzZ0UU0rMEpCaEtqYndiMnJyc012QnZBTUlacUtXRVdPaFBsVXB3NmZvSGdT?=
 =?utf-8?B?ODNPb3ZUTE51Z1dpN3Z3RTFuV0NtNDNIcFBFSDIvK21xeXJucjhmY25MajFn?=
 =?utf-8?B?VzdWUWE2QVBDcWVycDVDUmZLSFFmY0NPWGFsS1QwVFVkNVFMNTVjYS9PTzlV?=
 =?utf-8?B?K0NDWnlYT0NtSUVhM0tiQWZhNStzSUtTdk5TU0Z0MTVZVU8vTVZyamQyOFdP?=
 =?utf-8?B?ZEdrSEt3bWV4cnlaTkZwSkdpZ1BRa2F6c05SK0VjUG9NTnlsamEyQVhBNHU5?=
 =?utf-8?B?UlczUFF0d2Q1MjQ2NTllcUZ2K2RYS1NIckV1T2s2bHkxb3BROG84Q05RNlVu?=
 =?utf-8?B?cWJIRmpJK213MXFBV0grTytBNWdOZ09tRU5VOU5BKzI4NE9mRkpaZENLMFJs?=
 =?utf-8?B?Z0l3UEowTkVUZGY4Z1p0cVExcHZRcXJ6S3BZd1NxMlQ2N01KVU9XUmU0anE0?=
 =?utf-8?B?NUhvYmdnY2V4V0xGM1NOMVZoUFNLUFc4OUNWU2RTRTZLd2JPY0RiUVU3N1No?=
 =?utf-8?B?U2pLRS9oOTNVU1AyM1NKeU0vUnpHSkluRzkyVHNLMldvVzRoYWdUbHowQXV3?=
 =?utf-8?B?RXhSRG5QUEJQTnBFSkdiOTRoNTlJcDNJOExJK1Q0TGNaLytQUTBHR2lVMDFh?=
 =?utf-8?B?VVpKa05jMGxHUHFnNzlOZThLS044WklSb0UvK2dJMlRablk0ZmRCTXpCZ0Ra?=
 =?utf-8?B?dE14U3gzNEZGeTRLdldmTGN3VTN4Tm1BNjRCYnlVU2N2MXp3ZnNKOXEwVWtM?=
 =?utf-8?B?cTFUMURuczAzVXkydzBtYU9hTTBJNXRYTTFIcTA3WEwyeEIzQ0pJVTJpNzVt?=
 =?utf-8?B?bmZXUTFrTXRKNFFMdlVieUdoYi9BQThRYVlqSW9FT0RsUUd4aW5sbCsxQzVG?=
 =?utf-8?B?TGxYWVVJVEE3K0lLazkremlvNWNwcVpOQ25zeVRESEp3OW9HRFNSTmdmNGlJ?=
 =?utf-8?B?eGRacWJOODhxUGhEbjlySGFOQ3ZFTVByOEhYdStySFZSbUFNTGh2SWxYN1o4?=
 =?utf-8?Q?uJzZo6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:54:50.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae116302-2d0c-4333-36d1-08dd7cee421d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7271

On Wed Apr 16, 2025 at 2:42 PM BST, Daniel P. Smith wrote:
>
> On 4/10/25 08:08, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>
>>> Introduce the `cpus` property, named as such for dom0less compatibility=
, that
>>> represents the maximum number of vpcus to allocate for a domain. In the=
 device
                                       ^
                                       |
				     "vcpus"

>>=20
>> Nit: vcpus
>
> I agree with you here, the issue is that it was requested that we keep=20
> this field in line with Arm's DT, and they unfortunately used `cpus` to=
=20
> specify the vcpu allocation.

He meant in the commit message. There's a typo.

Cheers,
Alejandro

