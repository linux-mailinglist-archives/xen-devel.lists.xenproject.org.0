Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE37BA3EA8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 15:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131594.1470611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v28b7-0006xB-Jh; Fri, 26 Sep 2025 13:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131594.1470611; Fri, 26 Sep 2025 13:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v28b7-0006vY-Gx; Fri, 26 Sep 2025 13:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1131594;
 Fri, 26 Sep 2025 13:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJil=4F=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v28b5-0006vS-SH
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 13:34:52 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90cd5686-9add-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 15:34:46 +0200 (CEST)
Received: from CH0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::14)
 by IA1PR12MB9530.namprd12.prod.outlook.com (2603:10b6:208:593::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Fri, 26 Sep
 2025 13:34:41 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::bf) by CH0P221CA0004.outlook.office365.com
 (2603:10b6:610:11c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.11 via Frontend Transport; Fri,
 26 Sep 2025 13:34:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 26 Sep 2025 13:34:41 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 06:34:39 -0700
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
X-Inumbo-ID: 90cd5686-9add-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grI3qLNzErFJNJbCFtGWZ48dCYtHZhLYVG4UGqeD4KB1FSMxnDhxzvo9Rkfwid480H5HRGGEJHBA/z0PDHt0V9IULcFIi42tThpGPKsmFb9V6V0DBfcisNnLbywXdYmy4ku5Zm0YTDG1AyXLXrxxq2pj+UPdgei4ZlW+KqzKEjKpinlwFTnv6C0yxAbfc/v7yr6dMu6RaKaKbEo/IouyaS5vLMrLOi9Sec7NC060e8sTeHGBDXoBUeqftobmDCLtrrgspZ+44Q+Sx6xlp81yZQL4y868U+A59deOziPRLPOS4Cg1Ui1AsOSYDlFNGeYl6uPjL2xUubc6A3rWfvAEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9R1bsZg9zFi5SZMiIHOuy0km5G04Yq6pWuw7XLIbIo=;
 b=wQIek832Es7bXtmq0e5dADk3be8BQuM/9O25kMzcaA/7qf1IqpuNoCIAifziW5ZQV2BIpCMp9o3atqTerysp2q0JHz9p1I4SbQgTzauclBKtjMWltFHanW2z4Qcrx27k4ujikvAfg19kYnXyRv0LP80K3czFrnjwidoTr8WxfwAMh/I3+NIZfCn17JLUG9k2eUV/2oZ6Xby5kOqozQcWYIgLJPOw+TFv0cNbydOkx4FKTSQS+wWi0Zij16Cwk4oyilzPKi2Ni4HQZ/5w5ZflJFxNjmUgabbNb3qya2BQFm1pXlE4yDQPQMegrH3psc6zYHTBjeAnvw4WCAg33mn1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9R1bsZg9zFi5SZMiIHOuy0km5G04Yq6pWuw7XLIbIo=;
 b=HuNYAJYeLbZ9S+N4CE9wcrRCvYaH3OjnoCp7vm1z56S6B8UPIvCVqKUgCbL/B7VRuVatbc6jxGAD4zRFmtOr/chCBg93j7AlpuVR2huPgzd/GsVbomNTtSbzgv0iEVqgbNRWltV0kCPP91/anbAImZvuN1VgAw8ueBgYQpHzOcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Sep 2025 15:34:38 +0200
Message-ID: <DD2RRSS5SQ1P.2M25DVLIQEA7N@amd.com>
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
 <d6df84f5-862b-48af-8dea-3e15c029c433@epam.com>
 <d23f9b58-8da2-43e7-b8cc-351ee6d8c849@suse.com>
 <323babfe-2fe4-45ef-b3f7-fe15739c87da@epam.com>
In-Reply-To: <323babfe-2fe4-45ef-b3f7-fe15739c87da@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|IA1PR12MB9530:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bb692b-f35b-442c-a160-08ddfd017264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2hVaHZwK3FBR2NMWG1tc3h3bVBxSitURElNTFlXNk1OTHhFOTI4Nkd4T1h1?=
 =?utf-8?B?MXJqbFI0UllSUG9NSUw3S1ZJNk9LN2FMLzZaSjkydS9GaW41MThhRmFvakl0?=
 =?utf-8?B?ZFUyV2p5WlozRkwwNnE0eFlQejBzRERHZTFjcndoY0hIMnFJMnVzbDdibTBW?=
 =?utf-8?B?SWt6Z3N6TlBEamFteUpaa0xtV2VoZitHVHM5WGg4bXJZV0FmTXJua0xsemcy?=
 =?utf-8?B?N242cjFIYzM5NDg3Y24zdmd3aVU2aWNVS2xyUGRzRUVSazQxVzk2cGNQSkov?=
 =?utf-8?B?NTNxeFU2OUxSb1daNSt5WEM1Q1ZsVEhqVm5YTnJWcjdmSjRONTBvNUc3cERz?=
 =?utf-8?B?bXhNNW9lVlZQYjdEeUtibmlBMFB4OG1ISjl5ZSs4RVNrVG1SWVUzWCswcVlQ?=
 =?utf-8?B?WmRtRDJuZERUa2l5eStKNlJmUFJkWEFkd2F5eWRaU0RzUDNJSDlwTUhTeGdR?=
 =?utf-8?B?dXQ0Wk1Hbmowczc4b2xpV0xMbFZDdUh5dEc4bDg2VGN2L1l1YmhUYi9GQlZs?=
 =?utf-8?B?NmF3ODVJeGoxWmdqUnk2MFlla05Fall4RzJmQ2pqdjRUcGN5UjYyMWYzMmo5?=
 =?utf-8?B?OGdQVGRVenlXK0FQeFpKOXVjT0JBdElmNC8yWjVVM2RUN1JGb2pJUDFvcEo0?=
 =?utf-8?B?ZGc0MktUdlF3WkhNZlorWVJKUWttYW9GT2xOalpFb3gyMjJadW9oOGZ1MG5D?=
 =?utf-8?B?SytvOHkzT040SkszTWJTcHp0b0pMYUdjdmtWRDZkRXVJVkNMejQ3MEc2QTRF?=
 =?utf-8?B?MnVuV0trVitHZDYyOUduWmFteElBR1lPVFBMWUttSzVBa1U4ZEdkTjJDMFFF?=
 =?utf-8?B?Z1lFZldrazBjN2JSNUtPS1g0a2YwZm00a3JxR1FVT1RrZGYyZkFlaFBzQzVv?=
 =?utf-8?B?SndPNVNjVTd5c3FQMU4yZXA2eHl0dHozS29lV0t1VlNvbGxtNy9taGVtT0d5?=
 =?utf-8?B?WExZb2xGR0YyTWk3bEM2ZVU1bWtFSEg5bGhKVSs3TEZUTXNXMkxoc1ZVUEtS?=
 =?utf-8?B?N1o5U2FtUXZhZTY2YjBVYnZranBGalFDdzluMEpKNi92SWxlZ2ZvclRsckdq?=
 =?utf-8?B?cDYxaWhJYnpaQlJYMkFRaVpaNlVycXFXRDYwOVVqWDYrNEFXN0UwR2dGcGxJ?=
 =?utf-8?B?WlZMajRGeHA5dXBKOHBxa1VocnNYamhBTERzNUd3U2s1RjBOamV6L1RoaUVs?=
 =?utf-8?B?ZHFzdm5ydm9FY3Y3bmJoWUdZRnlCUUZTakZMQ1FlM3NTMExrazdpTWszSnNz?=
 =?utf-8?B?cmhReXNJWVhtcjJsMGY0NEFwTVU5TnJjbkpyeWVXT1o0cTZZb0lqNGhRSlVa?=
 =?utf-8?B?VzJENFdlR0J5T3dnNHNhK2o5bFRoUldUeVdXclpFMkszZ3dpWGlGNXA4aCtT?=
 =?utf-8?B?aEVnQ1hTUlpHQlBodkxKakJTYmRVOFgzNk1hNDRuZlgvUGk1OC8vNkFKU2Rh?=
 =?utf-8?B?RDg5My92NWZMODlrVUJjWXlPQ3VIUDU3c0d1TTI2Qkk1alVzMmVMWW9IaCts?=
 =?utf-8?B?RnBiZ2EzMmI4T3Rqdmh3MVpjVkM0dlZzTmN6M1NpZXZiOFJnSS9sMm01bU0v?=
 =?utf-8?B?TjhIeDBRdUxuUnkxa0hpM2RsVjlmcTFXQU9hOTVuRFp1aVAyYUlYYi9VVW01?=
 =?utf-8?B?b0JETjZBb29JMXlSUndaVkIzWnJkL2thdVR5YU9WOWJ6ZDdTZXlya3FwNm5J?=
 =?utf-8?B?b1VMdEdTRVRuL2pkckJSYURNQ1g0bG9ZcU9aVnJDajd0MkRHUGhnUlZIbGJi?=
 =?utf-8?B?cDUyak9iMUthUzdsMVo3Q216Y0hibTZhZ29XY1RuTFQ5L2JIc2dWRmoxV1hE?=
 =?utf-8?B?RVZzWTEzV2ZqUmlzK0c1Y3FDazhma1RPbEU1R1dYalloMUVCdVlhek1JVmNw?=
 =?utf-8?B?ZzNLa3duSXBMZ1RuTUV3REhjOVBrYlNvcE5EZitQMlNpOUpsbkViM2wwTWl6?=
 =?utf-8?B?ZzI5cDV4RjZON1lzZUN5MUdmZGNTQWpuTmZNaWRoU3o0WDVoVjNJTnFQT2ZV?=
 =?utf-8?B?bGd5eVY5QS91VlhiWkNCTVE1dTI0OVNJWmhwSVRyQmI3MHgwU3psczZiakdL?=
 =?utf-8?B?MkR0TWtoMzF2T0JxUjc4ZUxmQ2tBNVVEdmhhL0xWZU5YaUpHaDUvVHRidmdv?=
 =?utf-8?Q?ohtI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 13:34:41.1916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bb692b-f35b-442c-a160-08ddfd017264
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9530

On Thu Sep 18, 2025 at 7:13 PM CEST, Grygorii Strashko wrote:
>
>
> On 18.09.25 18:19, Jan Beulich wrote:
>> On 18.09.2025 17:15, Grygorii Strashko wrote:
>>> On 16.09.25 16:41, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/hvm/Kconfig
>>>> +++ b/xen/arch/x86/hvm/Kconfig
>>>> @@ -62,6 +62,16 @@ config ALTP2M
>>>>   =20
>>>>    	  If unsure, stay with defaults.
>>>>   =20
>>>> +config HVM_VIRIDIAN
>>>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>>>> +	default y
>>>> +	help
>>>> +	  Support optimizations for Hyper-V guests such as faster hypercalls=
,
>>>> +	  efficient timer and interrupt handling, and enhanced paravirtualiz=
ed
>>>> +	  I/O. This is to improve performance and compatibility of Windows V=
Ms.
>>>> +
>>>> +	  If unsure, say Y.
>>>> +
>>>
>>> Actually there is a question for x86 Experts -
>>> Does it make sense to have HVM_VIRIDIAN enabled without enabled AMD_SVM=
/INTEL_VMX Virtualization extensions?
>>=20
>> It makes as much or as little sense as HVM=3Dy with both of the ones you=
 mention
>> turned off. Iirc Andrew in particular wanted to permit such configuratio=
ns, to
>> allow to prove the (abstract) correctness of building them, even if the
>> resulting hypervisor may be of little use.
>
> I've been thinking about adding "depends on AMD_SVM || INTEL_VMX"
> to cleanly note dependency.

If anything, it would be CONFIG_HVM. Pretty sure one can't sanely implement
minimal viridian fully on PV. Certain extensions assume some degree of hard=
ware
emulation.

> It's very hard to understand dependencies within x86 code :(

They are very sparsely documented, you're not wrong.

Cheers,
Alejandro

