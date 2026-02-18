Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN92GifLlWlfUwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:22:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D126C1570B6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235613.1538542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiRT-0002xo-3w; Wed, 18 Feb 2026 14:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235613.1538542; Wed, 18 Feb 2026 14:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiRT-0002vt-1B; Wed, 18 Feb 2026 14:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1235613;
 Wed, 18 Feb 2026 14:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vsiRR-0002vm-H8
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 14:22:13 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e578e02-0cd5-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 15:21:59 +0100 (CET)
Received: from PH8P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::9)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 14:21:53 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::ff) by PH8P220CA0001.outlook.office365.com
 (2603:10b6:510:345::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 14:21:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:21:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 18 Feb
 2026 08:21:51 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Feb
 2026 08:21:51 -0600
Received: from [172.17.121.74] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 08:21:50 -0600
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
X-Inumbo-ID: 2e578e02-0cd5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO/exAmA3sCpidrzd0quy3lj6/rO41qvTcUCpjnQim99Jx2d2S01eNI64O/vQ8J5FnbyK4/pqReufznzs5D/FbBZVvXQvCQMiM6pj/8QiJ5K0i8VbIlaDRmHlSSAQSs3HcVKlTcsY/CEJxLAcIikZzSEmtUlFIvHJtT8GrV5G0gwT2OwDBlstR5tTvPKD912woJakT1tGjDW5aQ7XX2aJGZPPPwsas2AYgqfPYCIt53LJ0SrlaKY0ovSI28wCQzVj+qK6HRceAxOzNA25pBB9ldTDP2aBhbGvqLGKugnKzMuHlPt/v1RcCcSThbg9rlp+yyTyTzG1cVH25BOVaVN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBmJZqieVx4eMrchRuss9RQRotrVE45CAjOb7dQZ7to=;
 b=RVmLs2Rh/qIz+dnTxO/y+LAM1xRR89bJswvN6Hgb63VVCyP2SpuuYevk8V5v1m2RlwWpw0Lxj8UazkUT12aaXki4DglrcwLx0pOHJRdIuwK7pEV680RLXyvv8QTHevaFqPkxK0K/Y+M9FSNVRGiJCpn7JkVhXEwvFL0YiO8cIeSEj2JIVHMWR4bhutSL6G2NQE4aF9NAYFdNKC10HG4qR3Hig9PHLZxbi16+1ZfcXCLzYgCHH/ghlGPLdHTXdgkDL8o9cyjILu61ZCHrNRdTQCU5gsQSciXVpna/E11ONCHeViMlq3qWUKaMQu3L4K3abGtTmPgZrltwBHPMJlylNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBmJZqieVx4eMrchRuss9RQRotrVE45CAjOb7dQZ7to=;
 b=UGw8WyxUDPnWhFg9gn4mXmtPGHYMiISKPHq1uJgIB8luqP2+GQDibA0kS1mcNIrQqgx/aOFsyFiGCUu6z0dfq4yNPcio7v1/CLrRY8c2YyYaElJtnafBXCvOsu9uWSHgnuHGiD14FGfLM51jq8o9ooFgEpcaOHntNmSj+2A1e9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f91e0f7e-9afe-40bd-8e44-4aadbdf8e4b0@amd.com>
Date: Wed, 18 Feb 2026 09:21:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix unmapped access trapping on GICv2 hardware
To: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260205190128.38716-1-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20260205190128.38716-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5b78c0-afb2-4a54-b438-08de6ef90fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vk5OMjUwbmo3K2dnY1ZTcTQxeURiRUtZWXVpaGxtVy85YmxndTMycTJTekRl?=
 =?utf-8?B?L0ZHSE0wSGVKZUNWUUowdWhBcWZMcW1iQXZzWGtacXRVV3orQlIwNTRWYUhG?=
 =?utf-8?B?ZlZWWm1lNzY3a2lsTXJuZ0NYOHI5TjVCTWFBSlpBQmI0Y1hodjFQL2crY3pM?=
 =?utf-8?B?ZUZuTHFOejBRRVM4dEVDeFM2V2NSSEw1dWZKY1krb3o5bndZU0hMdlUzZVRa?=
 =?utf-8?B?NForNjhmM0V0ZWE1VEV4NHdnNHlFZTQxRkxjWFVmbmZ5MXFRNTJpTlJmWW5n?=
 =?utf-8?B?ejh6LzVtMXF5clRzVTdtaUZ0UFZFa0xUMFpDTFNEMVR0bCtJQ0NjOUJGUktX?=
 =?utf-8?B?M3NjZHRYMG54RGtIRjR3U2w0Yy9jZmY3eHR3NDF6WWd0aFc0WEhsTUxHR2pw?=
 =?utf-8?B?NUEva2R0MlJtTzZKLzlVK1Q3WTIyS0tRaFVJek42OEV4NmpudVJLc1ZPd2hm?=
 =?utf-8?B?WmM3bHBSS2FQekp1UThWbEUyaXJIa0cvdmdiaXo0TERvRiszVDJYRjM1ZVRm?=
 =?utf-8?B?bDlvaGdETU5jTFk5a3JxUS93QW9CZklweFNYY3MwQkFvaUhPNmNZNmFwcnV5?=
 =?utf-8?B?SkRFSG10UkppVGxJRU5RNmowS3lOWXNiWlNJV2ZMSXhnNU5EaGpIMXQvMUxH?=
 =?utf-8?B?M0x0empndG92RklNMWRqS05aSU51V3I4alVjMkR3UmNENmxOKythbkZGNE95?=
 =?utf-8?B?RFVKVUZSQVdkcytXUGdCaGNHSG0xa05ud0tLeVJRbW84dUJLQk1RczlVUzFu?=
 =?utf-8?B?dVlPdzdxK2Y1ZXBJMXVjbWt3ejd0eHR6Y2hvZy9XbkVpeVBhZXNVZk9OZkVF?=
 =?utf-8?B?ZUd0Q1J0NXZaUmdvY3B0cG40VGFiZUdsWnQxWHUzTzZZeW0xOTdyOUxsUjZC?=
 =?utf-8?B?dm0vSzhjKzk5WFJ1Tkg3WTFXbUlYOGlsdTFkUG81c3FHN1Y5aUY1SEJ5blBG?=
 =?utf-8?B?dFg5TTN4Q253SWRaeGtXQVFKOWRMaDFlUjJPRzFJZFNyRTZlenlzc3FaSGxq?=
 =?utf-8?B?YXkrbEd6ekhaQ3JrUHhSSkxDYmVRQVhKSGZOZk1TYU5GZU81UFBoYnhmVExs?=
 =?utf-8?B?T3Y5aGpvaEZ0NVhoODlYNGVJdGNaZCtKZ1NIQjZ2WXJhR1ZKeDYxaTJLTHcz?=
 =?utf-8?B?d3BpRkVBOGp0ajZTVS9BUEhUL2huTmJWZElJL05iK041TXdsSS9Id1pqUFBY?=
 =?utf-8?B?YkRBL1M5OStxRXgzN1JCbVFNQ3IweXpmQ2RHUllXb08vbk94cEV3dmRISWVz?=
 =?utf-8?B?VWZCSWwxQ1AyRTE0T2dIUlZFcnFkK1VJVFR1TmdpQTE5U21TZnJVM3pmWEFT?=
 =?utf-8?B?aFRjbTh5L21jRUZzamhGa28xaURwM0gzTUpHbFZ6ZmpiSTNVQjhabFYxaFhL?=
 =?utf-8?B?dFZmK3JHMGFxSFNXMWpzekU5eTlqVXp6bTlaM0hPNzVsY3NkNWplQUw5R0Vi?=
 =?utf-8?B?c2o0Ukt0ZVdZU01sMmZxaVhYeXRrMXVucEtvbUI5a2RSdXhTSDN5QXhkWG52?=
 =?utf-8?B?YlppM3hUR3RLVTlHK3J5K2hpYjV6OGpjdzNGV0VmVUJnTGIzV0x5NXRYZzRO?=
 =?utf-8?B?YVJqZ1NNbWJIeGI3RXphYU9OY2NDaDNITjczK2gzbURtTU85Slp1YmYwWjZ6?=
 =?utf-8?B?Z1pMdzExSEtVTnUrNG1hcTZ6cXRhdWlLOUNRL2JmcHdVWXhENlNoRExacTZa?=
 =?utf-8?B?dndxWm1OY1dyRWhDM3VlM05reWhvNHhyRFFPdkxPd0M0WGZiK1hBdmQ5UUlT?=
 =?utf-8?B?aTI0aEp3WXN1TTJNZFdSMm9JUVhXTWd3Lzg3NHRvRW10WXZMK3lGS2Y4Mm5a?=
 =?utf-8?B?bk5KdEwzQmZTaTlSL0xnUzc3MHl4WkJ6R282Z2UrbG5Jcm5kbThNYSt2eTh3?=
 =?utf-8?B?d092eDQxSUxKYjdvdzQxYTBTQk1taEZoSkxwWWc4bGNBTm54dzlSajZ2M243?=
 =?utf-8?B?Z0hhT1BRZWh4TXNuR1EwS01qMDEzVEwvN0s1YmtydnhZRnpvS3VVcW01RlJa?=
 =?utf-8?B?a0Z0Umw4a0cxVm1GVkg5Rjg4d2FBTXZ6US9JZjJjcUs2d2R3NytZUWlQZCs2?=
 =?utf-8?B?Wkt6clJiUzdwby9VOXd4VC8zMEdXRlpLcjF1YnQ2ekZRZlEvR1UreHdUL240?=
 =?utf-8?B?QVlqdUNmWGcxNVUwYm8rNVdCMGNIRXIrOUV5V1hObjI1a1RZOGhIZkt1RnRW?=
 =?utf-8?B?MDJtUGNFdVNBa0M4dnJSdFNJZVFWSlN1TUxoUjNvWnBUbnp0K3g4SFU0YllK?=
 =?utf-8?B?dWlWYmF1YzRtNlFCbkM3dHA2MmR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ORJzmuy4Mwt2PKkdxNXJEkXSG8C8UFb7Q1Obdcque6S12nJFR0Tvnd2vLKDiVMiyOd49Baj9bhgLx7NZ0RwabT6WCWxJjoIcXdSZucxgr7Bv2DE4ZuSnaUnh2Ror6Y5m22HlYyfmyEO7wI+GSIc70XKKl4q6FDgtVUaKElzjPB0j9kcsiSZiGzDBctI/rgfMHELAi+6yO1i5vzbuMHzUe0iUSVhQYRvTDb8eOv9EGmyLdg1uIUrJqg/oDFrLWo7buVMqzD435GIza3S++89Uhag1DNtNhzU4mTqC+WUDQf3Ht6SwMzsp7v+o03CL276NC9/+fY0WbuCb6XSzrg8de2bILGRbDVudeLT1+bfZgwiZnmTP7TyS/1Gw567lWLeJS9A2V0t1hqqQAgCHgz7uux3K6UYqwSqS7shuImfjoJOWuK6PTHPlinMnuJFe99hY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:21:52.0862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5b78c0-afb2-4a54-b438-08de6ef90fa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: D126C1570B6
X-Rspamd-Action: no action

Gentle ping.

To be clear, domU interrupts with vGICv2 are currently broken when
XEN_DOMCTL_CDF_trap_unmapped_accesses is not set.

On 2/5/26 14:01, Stewart Hildebrand wrote:
> Since 4dbcb0653621, the vGICv2 CPU interface is mapped in a deferred
> manner. On domains with XEN_DOMCTL_CDF_trap_unmapped_accesses unset on
> GICv2 hardware, the vGICv2 CPU interface fails to be mapped. A visible
> symptom is that a domU gets stuck at:
> 
>   [    0.177983] smp: Bringing up secondary CPUs ...
> 
> Move the 2nd check_p2m earlier so it's prioritized over try_handle_mmio.
> 
> Fixes: 980aff4e8fcd ("xen/arm: Add way to disable traps on accesses to unmapped addresses")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> This should be backported to 4.21.
> 
> Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2010469665
> ---
>  xen/arch/arm/traps.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 040c0f2e0db1..0c01f37ad6b4 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1915,6 +1915,14 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>          if ( info.dabt_instr.state == INSTR_ERROR )
>              goto inject_abt;
>  
> +        /*
> +         * If the instruction syndrome was invalid, then we already checked if
> +         * this was due to a P2M fault. So no point to check again as the result
> +         * will be the same.
> +         */
> +        if ( (info.dabt_instr.state == INSTR_VALID) && check_p2m(is_data, gpa) )
> +            return;
> +
>          state = try_handle_mmio(regs, &info);
>  
>          switch ( state )
> @@ -1939,14 +1947,6 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>                  break;
>          }
>  
> -        /*
> -         * If the instruction syndrome was invalid, then we already checked if
> -         * this was due to a P2M fault. So no point to check again as the result
> -         * will be the same.
> -         */
> -        if ( (info.dabt_instr.state == INSTR_VALID) && check_p2m(is_data, gpa) )
> -            return;
> -
>          break;
>      }
>      default:


