Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE76BACC7E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 14:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134223.1472196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZBy-0004IL-E0; Tue, 30 Sep 2025 12:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134223.1472196; Tue, 30 Sep 2025 12:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZBy-0004Gw-7y; Tue, 30 Sep 2025 12:10:50 +0000
Received: by outflank-mailman (input) for mailman id 1134223;
 Tue, 30 Sep 2025 12:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BylR=4J=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v3ZBw-0004Gq-Ae
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 12:10:48 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e6f90cd-9df6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 14:10:47 +0200 (CEST)
Received: from BYAPR07CA0054.namprd07.prod.outlook.com (2603:10b6:a03:60::31)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 12:10:40 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::47) by BYAPR07CA0054.outlook.office365.com
 (2603:10b6:a03:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 12:10:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 12:10:40 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 05:10:39 -0700
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
X-Inumbo-ID: 7e6f90cd-9df6-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbwA2LS2DSQFN6qd6/yGX1kCyL5rLd72jdwlsp4HQsRYtBm68s5G+DhlvhJsF8rJ6T5ZnpPIeX3jyG/eRVr7jkvOAUiGI7Zj0au71WwFIkB/QgXgWfaYCsH8rN9NwYTyDHh9SNFk4Wz25gxIJtA8Fi1C/RJ0UwZNKBFOL/IB/xFt+qkrMYuUBoyzbh0YpvIOV4iWE51ws4xf5aLMJh97dA3sDsqVYlzoqoAp1jwnPbF0RgB/CI5POwwXrswK+/8B5+M5NIsoWACsKNTjYwKxvMYHnuvtMNnBX10i4KAx2NdhsFcrKiFsfvYr+yF0Up1m0tEJPt4wUByG0i3FoY4byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5BjB6WmfOKtawsjUtZVDnZSAImvsiUyn+Twwdywo2E=;
 b=Uiaui52hDSIkg4blT3TXtdqmmMHem7OMDmrUg6TPzarZFYyvBLmSU6muVUJGXkZBcT+TYHtnJq3Y7+d0rGJP9P2nZeTfExExRYKS3tHri1gOessByurwBYgslCaCxtso56u9Qy6kg1Q5cHA6x3kmEy/ia/UqTq8cCXtgvY0bI3FFoRFniTCMIeqtvCsEpH0GguM6S6wn2GneE23CNMepPj37nOkHFbew+eeFyYBzWr7n86lMxSnwyLbHfAoUR27qBssBI5ICaKSe+DkJOQBRRZeF2U7cE9Vm6zejQY+GYEjz9hpc2Vug800CE10ZP+G551ZDkIRp4xrJjZ+L/Duosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5BjB6WmfOKtawsjUtZVDnZSAImvsiUyn+Twwdywo2E=;
 b=5BsaQ8Dl7zN/aCGGuRfUxyjK11NwJnpba1PCrWldY09uCTNdfIIHWdDfQ2+bGL6RZ741AH4wFI+N0ba9BBO8GpQ+vuUkdFk1M48oMtaMwqf5no8yUFUFnAo5orj5cklda9R4TgcZW6hw9DoETNVFFdQIQWY7efhBLBJlCnBBh5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Sep 2025 14:10:37 +0200
Message-ID: <DD64HNS8V9KM.H9H4WKW4YDY6@amd.com>
Subject: Re: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20250924101417.229108-1-grygorii_strashko@epam.com>
In-Reply-To: <20250924101417.229108-1-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: c4cc4599-6bd6-4825-b25f-08de001a5f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SytFblRYTGhYampHbTdvK2xaVUdXdTN0V0JjWmZHTWNmWTVEd1lPWWVCOUwv?=
 =?utf-8?B?bG5zYmNyWFU4eUhCdEpDTjZEdkxiWmpPOTJ6YWRtN2FnU0lFa1UwQis4RlhQ?=
 =?utf-8?B?OW1HU3ZVcktJK29laGkxVHFKTnZDZkhBaWNtdjBreldmQVU1TlFXWldhNm1n?=
 =?utf-8?B?R3dJc0Z0SUZySFkrSGpWNE5UWEJaSUhJZHFORkVHTFdzYzAzSnNkTkdOQ0t0?=
 =?utf-8?B?WVY0aVBEdHh2TTNsVWZmVFRpQU9kYUdkQjRpWmJyemdJMHF4akZMQWlkR0sv?=
 =?utf-8?B?b3NXUXNlM05hV05VRTNYWERRdHpuUjBOS3dnK0xhN2JDRzE1L0lHbis2Mm5N?=
 =?utf-8?B?d0U4MHlvWFNKSVJUQkh2WFRMWEk5VFBoRUVQVW52WXhUQnNuWHFSZStENENJ?=
 =?utf-8?B?VDU2MGtHZkwzNW1JTVpQV2V6NkZvS04ySVV0S2FlZkxVZUhPeWc0MDdZejlz?=
 =?utf-8?B?UDVrMC9vZWFQZm1QQzFOMHZ2ekhkWUtueUhtWHBuZEVxc0ExV1ozRUtvWndr?=
 =?utf-8?B?ZU5ieHV1K2k2Y0ZrTkh3TzR6RE83VVhEekE3dGR0bVZZZkhyakpUZzRjRTRm?=
 =?utf-8?B?eEtLWmhLREJuQTFOL0ZkU0FtS1dFUTNueTRjTWN6VDFxTWh5MytwT1dyaHhN?=
 =?utf-8?B?Y2hWeTA5UU5PYkxXTEYzYWN6V3JMZmVqemVlWk9DRXZSWXYwRFExTDdXbHFY?=
 =?utf-8?B?RktDanh5NlgzK2J3bVN6R3JRclNuUG9kc25vWk1oa0hnYVpKdG1aREw0SzBj?=
 =?utf-8?B?RWM1bmZZZ1FMOEpWTUx6OFFESEpiL3h4bnhGVUlOTE1nVy9VU3czdzZITlJ2?=
 =?utf-8?B?aC8zQkNML0xFRGU1NTBKb2lJWE1QN0F2MEc5cVU2Y0FTWUZ2c3RrZ05TanZF?=
 =?utf-8?B?NjFJeU9pVURwLzBudWR3eHRsYkFZdVl3Zmh4L1orS2QzOXplMFMwOVg3bDgy?=
 =?utf-8?B?OVZ0MTlvUldCWmRLMUVQYU1YUkc4SlZHUlIwSVRtRm5BT1p0V0ZxeUFoSUZn?=
 =?utf-8?B?SGluVnd6eVBRK1BrTjNHMGdhK0RjL0MxVy9adXBlVHQ0YnpZQXJjYTBybHFM?=
 =?utf-8?B?OFlpOUo1MlhtZGJYTmlUSnpFcW1nbTM3ZlhOMjZXcytoYUdDQ0pFMGtQMWww?=
 =?utf-8?B?cmFJamdxcVNnNVllK29qQXlTTUNCeDdFR3BVV1g4dG8yb2o4OHBoZ2ZzRFNa?=
 =?utf-8?B?MFI0TnZwL2lQb0kzeG5IdHE5c3hjc2JGS1QrMU9aOEVkTmRnQ2ZDSTZuN1Jx?=
 =?utf-8?B?Q3ZRYldsZmJ0RE4wenM5R2N4NzUrekM3dFJ0eWw0clp5akc2RklnTTJ6cC83?=
 =?utf-8?B?aXBCVkFvWGliZU9Vd1UxdndFMElEa0wrampDbFdIaHdSdm1zWGlVT3NqMy81?=
 =?utf-8?B?WVpkZ0VsVDArNm1ockQ3aVZwdmRSbVdUbGVYT2ttYUpiWVZ3Sm5TREhFT0lM?=
 =?utf-8?B?SWpRblRnTVRNYWtTWlVqVXRCK2pySXJGSlpoc0w3eXhXVlhxb2VFQ0lIaFpl?=
 =?utf-8?B?R2hJU2xIV0Q3aCtJVTJ3akNoU1lIMnF3STEraHZVZGlqbTl5OENEZG96aktl?=
 =?utf-8?B?aFczTkxkV3JtYXBLemloZjdPMURkMVNKaGY0VVlRa0IzdnFMSXBKRndMSGRY?=
 =?utf-8?B?MVR4eTd1UndNSjRHbWdRa0ZFVW0wS21VN25YRmpEdTk2RzNVQWgzRUo0Z2hH?=
 =?utf-8?B?QnBTUTEyempEdm8yL0tjbnNiNWlXNEFwS09XVGo5d0p4R1F3cytJQjRwM0Zl?=
 =?utf-8?B?cmtTOGhURENsWS9UMDliWEE1WXVxdEVpSFRmcWxiVHY3SC8zaW5ObVc2REs3?=
 =?utf-8?B?dXBGR3dWY2ZCOXE5TkdXM0RXOXBnZWZCMmFHWVQ5aE5Bbkw3ejFKcGVFK3Fx?=
 =?utf-8?B?RWsyZ1JCYnBSOGE4Y24rK0ExUnZIamNpU3VHL3B0ZG82aUFaR0M4b2FhNEQ1?=
 =?utf-8?B?VDZkcC9MenNGTXJIeDBpbDN3UytVNlhIbVp1T25zRlYxWmJmTnlHc0lLczN1?=
 =?utf-8?B?R1JYN29LZnkxVG9ISFdOYWZPOEhhTWlYL2ZnQU5USnlaTmRibjRKZlM3MkJy?=
 =?utf-8?B?WVB5MjJPREtUQkFjWHhnMkttZ0JCaVFOSmd0UUtWV1MwNmVFQ0N1VElWTzY5?=
 =?utf-8?Q?kyzg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:10:40.5312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cc4599-6bd6-4825-b25f-08de001a5f9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388

On Wed Sep 24, 2025 at 12:14 PM CEST, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") t=
he
> HVM Intel VT-x support can be disabled, but it still keeps VMX
> code partially built-in. Particularly in HVM code there are two places:
>
> 1) hvm/dom0_build.c
>  dom0_construct_pvh()->pvh_populate_p2m()
>     ...
>     if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) =
)
>     {
>         ...
>         [unreachable for !cpu_has_vmx case]
>         rc =3D pvh_setup_vmx_realmode_helpers(d);
>
> pvh_setup_vmx_realmode_helpers() allocates memory and configures
>  HVM_PARAM_VM86_TSS_SIZED
>  HVM_PARAM_IDENT_PT
>
> 2) hvm/hvm.c
>  hvm_set_param()
>     ...
>     case HVM_PARAM_IDENT_PT:
>
>         if ( !paging_mode_hap(d) || !cpu_has_vmx )
>         {
>             d->arch.hvm.params[index] =3D value;
>             break;
>         }
>         [unreachable for !cpu_has_vmx case]
>         ...

nit: These (1) and (2) are rather large for a commit message. I wouldn't mi=
nd
if they went away and the rest of the commit message was adjusted to make i=
t
a bit leaner.

Either way, with or without this change...

>
> Hence HVM_PARAM_IDENT_PT/HVM_PARAM_VM86_TSS_SIZED are used only by VMX co=
de
> above code become unreachable in !cpu_has_vmx case and can be optimazed
> when !CONFIG_INTEL_VMX.
>
> Replace "cpu_has_vmx" with using_vmx() to account !CONFIG_INTEL_VMX and a=
llow
> compiler DCE to optimize code.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

... Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

