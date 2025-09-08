Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A4B48B16
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 13:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115105.1461844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvZfu-0000SC-V5; Mon, 08 Sep 2025 11:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115105.1461844; Mon, 08 Sep 2025 11:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvZfu-0000Pz-Rk; Mon, 08 Sep 2025 11:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1115105;
 Mon, 08 Sep 2025 11:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bERQ=3T=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uvZfs-0000Pn-Uz
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 11:04:41 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2409::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99ab401d-8ca3-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 13:04:34 +0200 (CEST)
Received: from BN9PR03CA0324.namprd03.prod.outlook.com (2603:10b6:408:112::29)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 11:04:27 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::4) by BN9PR03CA0324.outlook.office365.com
 (2603:10b6:408:112::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 11:04:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 11:04:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 04:04:19 -0700
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
X-Inumbo-ID: 99ab401d-8ca3-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQosuGEdP0xUXIxvexabIEIj9j5xT6guWNl2dZjdV4CsXpRmnAi6YRcFnldeTWBoBAkD74LnReS+bKIFVMjNOM0YYZ1iIOnpkyxjB0UDbMWJfyEmjQmn1j1qbrNX3IOSbxRYFli7xqdlPwJ28CJLVtqn2PuZdfZJb971U59G+FI489nqymt+A9mAn9QYcFkwKY/w8D3Ezn28UiirBOSWnG65usRqAzx/JNcqjN9/jJLx1CTiyqzsvQpeo0VIxW3QKiYRa1LKsA9L+ATGZKFZDH9w6bzDhVFVfR/4SxP8kWZ2O11P3XNPxssXCNeuFiJFW9Msk87YbWVbtZJap0Qquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAJKJjn3gN+PFICaW0C0tCKi0gSp+GCZeCXOdStbLo8=;
 b=owCtyE1hbLLWFoWj5rgUE/FQxxKKydHNHYWiIfmgxD6NavS8OxQwCPuFBR3qRMdPq8FMBTLgdeweVc0tmYgRPXXG8Xzx7+Yme9/OYV1qH2AafnWnvcKYCxIC750TZ1GJGMjk3HbdjxENT0HrjWwOnt7WZv7nm1GEGQviqsIZ7tRZ7941iChLAbIxBzsT1StnQwEb4lpSz5xz67mQUSBZ6Vwwl4Ws3KmUoo/+mJC2ZZy8xECESDS66QYLE6Sbj7N+Nux1ogDCKPDuOU09IQX4OIpuuvMQYkNAVZrKCVcsqBIaKBv206HtRqyRhR0rvsDg7L4dus9qpEyGm6kiSfVSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAJKJjn3gN+PFICaW0C0tCKi0gSp+GCZeCXOdStbLo8=;
 b=Br8L68cZs2OhjwgV+guCLtjw15+Oy8RLdgPxPOqZsZYiyH6opuuF/K3CarasGBCJui0Bk3Nr0t+TEF9jh97phgUaHSWTMTDKUoFc2kLVJWbqR3BXIHAU3iZ2eNv75kJeEOGWvhHgSTL6aRyvKpa4PiTBnGe4NH3yhlRVF/JDs0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 8 Sep 2025 13:04:18 +0200
Message-ID: <DCNDAW983CUC.C7PT9CRVXUWU@amd.com>
CC: Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: New Defects reported by Coverity Scan for XenProject
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <68bd98b92c2b2_2afba52d9ed55e79908873e@prd-scan-dashboard-0.mail> <77361e51-dcb8-40e2-a526-9ff90ba942a2@suse.com>
In-Reply-To: <77361e51-dcb8-40e2-a526-9ff90ba942a2@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b681e41-3148-4069-72c7-08ddeec77a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1NNektEZHhZSmQwTUFkMFovOS9yZHVXdklhanhrQWM1eE9GRlBHeHRWT2hy?=
 =?utf-8?B?dEFPSGJiMHZxSm02bWpibjFlWFFHNFlzc2tMbG9nWVFCUjhCQm9lYktCSnR4?=
 =?utf-8?B?ajhJSDVrMFFsSndwV1NIUTdkVmp6UzA5YkxTWTl2OW5CMGEwM051YzNXWWpX?=
 =?utf-8?B?V3ZEMnJGYVpWQ3FNZUNDVmQ3eTlhZEJBWHFOcVBUdzFPZlplR09zb050VEFU?=
 =?utf-8?B?dWlWUzcybkdHT1h6WE16SGxyR04raVBRUXZXWm1rc1NQUE84djlpNTBXWDBW?=
 =?utf-8?B?ZThJb1pTM3dMN0dodzZVRXVUeWZyVFdETzMwSW80d2JndUNaSEVGQlFKZStx?=
 =?utf-8?B?YWxJWERYdUdFUlZvQUJHQVA4ZjdxSTZ6QkFieTl3c2xUUEQxei9YOVFuR2g5?=
 =?utf-8?B?WFBPWnY5NU8vKzJPR0lJQ1kvWTBCMGZwVHdvTnVhVTdTQ0ZmZHgxL1packM5?=
 =?utf-8?B?ZkRwN1MwVDcydU9QUnQ5STJNOTA2QkJWdCthcnF0UUs4eWpJSWQ4Z05aNTdk?=
 =?utf-8?B?UDlCeGpVbFBhSHplSWlpbFc4M2dML3o5Zm5WaVRtK0p2RHVsRThnQmpiTFRR?=
 =?utf-8?B?MUFoY0ZmRitRU2JuZHcxSDdQV0hHR3JzS05oWjNlbFl0Lzh5bDRmVllNZ3ZC?=
 =?utf-8?B?aVV3dUpyYUhPSjZ4NXBtMFdJL2o2dEtFbTgxbVBObTJnUmpCSlJ2WW1mbFV2?=
 =?utf-8?B?NDlIemxtLytsNDlpYmlVcjFER2szbkI5YU40ejQ1bWkxTWNoYWtlbWV4YWhC?=
 =?utf-8?B?Z3VCT3NoSG9zanBUOUMxWGdyaDN5eW5jOVpQNTBGbENSSmd6MmpydGFtaFNX?=
 =?utf-8?B?eFVjam9yZytIbTBjbGhzc0pTWGJXMVp1MVoydi82U3ZJWW56b0tHS3NmZWtE?=
 =?utf-8?B?WmU5Y3JoZ1lubzZ6Tko4ajJnMlRFM1d5bnMyb2lLUVpJcWk1Qlp1V3dGS3RR?=
 =?utf-8?B?QzFtbFFCWTJtZjRRSEwxU21TZFhRSGdpTkl2R0hBeU40cVFTbHVSTTBvVWhy?=
 =?utf-8?B?cG5OaXFRb2VuUk4wREw3OExuTWhhSDNKNkg3OUxPeUNzSlFFb1B0VG1CeUV2?=
 =?utf-8?B?Z0E4SlUxb3lKcXcxQVdKbFk1amtRWHVpQmcvU1NJYWlPT0xmT2Z6L2VVK3pT?=
 =?utf-8?B?VnZ1dVRUaFZTaHlvQmVoeUhjeEtubDA0ZGNVSkQrZ2FFUm9aR2lNeTBySEgy?=
 =?utf-8?B?UFBVbkZvK3kwUFNqbFVYVEhHeEt6SndHVmhXUkNoNVRPUkIxU3pROXI4TVdi?=
 =?utf-8?B?bWlxNjZqM25CKzBsUXJrQ21tN0ZCaFc0YTRnZHkramZCeFZhbG5TZzFJdy9L?=
 =?utf-8?B?N3pmUzRmbWtUdTM2ajFNdGtWV3plWStiM3dvZXZHUmIvYW41QStMallEUEt1?=
 =?utf-8?B?akZweTI2b0lPYWpDVGdiN1JwSjFxZ3RsT0szN2pUeTRVM3JhWHdKRlR1YWJx?=
 =?utf-8?B?VWpYRFphRHhxTnJXZmpmMDROQ3RGbVArWmJkTE5ZMlpSRzl2TGZVNnl2RWdp?=
 =?utf-8?B?OVRTTFlKeVJRM0svVHlmTWhtUnNaNGFUa2l1QkQ3QjNnMjlwVDM2R1hCUzhF?=
 =?utf-8?B?d3RlODFrcFBsY2FkTFlWdXQ1d1RRcXlEeXhia1VWd24vUmhxV21JejAzcnY5?=
 =?utf-8?B?YlVUV3hyOGxPalZpWjM3c01DWVhJcWlXaVc0b2dlV0V2Qm1WMDJ2MlJ1dzhX?=
 =?utf-8?B?eHp6WEtJZHZzSTB2Z3hUNmluSVZWejJ5V1drYlc3TGd6dnI1aTFUOGhZcnBy?=
 =?utf-8?B?WEljUWFTejhXQmR3RWJzOExMb2sxRDlsV2pPQktWcE5aSlZNcXQyYnlvOVVh?=
 =?utf-8?B?NnpqMzFFTXovMFpacU5zZVAzMk0xSk5qSTNvMlFnOHFENXA4c2FCNXpSVkFn?=
 =?utf-8?B?c0YyN1F3WEQ0Szh5bkkzL05MK0h6eUZMbk9PM2JUZG9TcmpyTXJYWm1mUExs?=
 =?utf-8?B?NGxGNWZabCtydjVjRFZ3VEtHSENLRzhPc2ZzMDdieis2SlZ3N1BNeG1nMkJv?=
 =?utf-8?B?bmQwMlJjbmNYbXEzRXV2azUzYXBNL2ZsdFdjY2JpNW9QVmg4UEluS3N0YXlK?=
 =?utf-8?Q?+saqQa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:04:27.6745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b681e41-3148-4069-72c7-08ddeec77a79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342

On Mon Sep 8, 2025 at 12:19 PM CEST, Jan Beulich wrote:
> On 07.09.2025 16:37, scan-admin@coverity.com wrote:
>> ** CID 1665362:       Integer handling issues  (INTEGER_OVERFLOW)
>> /xen/lib/find-next-bit.c: 104           in find_next_zero_bit()
>>=20
>>=20
>> ________________________________________________________________________=
_____________________
>> *** CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>> /xen/lib/find-next-bit.c: 104             in find_next_zero_bit()
>> 98     	}
>> 99     	if (!size)
>> 100     		return result;
>> 101     	tmp =3D *p;
>> 102    =20
>> 103     found_first:
>>>>>     CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>>     Expression "0xffffffffffffffffUL << size", where "size" is known =
to be equal to 63, overflows the type of "0xffffffffffffffffUL << size", wh=
ich is type "unsigned long".
>> 104     	tmp |=3D ~0UL << size;
>> 105     	if (tmp =3D=3D ~0UL)	/* Are any bits zero? */
>> 106     		return result + size;	/* Nope. */
>> 107     found_middle:
>> 108     	return result + ffz(tmp);
>> 109     }
>
> I cannot make sense of their claim. 0xffffffffffffffffUL << 63 is simply
> 0x8000000000000000UL, isn't it? Where's the overflow there? There also
> cannot be talk of a 32-bit build, or else ~0UL would have been transforme=
d
> to 0xffffffffUL.
>
> Jan

The offending line LGTM too.

The only credible explanation I can think of is Coverity flagging discarded=
 1s
on left shifts as loss of precision.

If so, "~((1 << size) - 1)", or "(~0UL >> size) << size" should make it hap=
py,
but surely that error would flare up with all uses of GENMASK() too?

Cheers,
Alejandro

