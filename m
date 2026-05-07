Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LG1EIZU/GmKOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2BB4E5650
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302296.1576388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKua3-0007Lg-WD; Thu, 07 May 2026 08:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302296.1576388; Thu, 07 May 2026 08:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKua3-0007J0-S3; Thu, 07 May 2026 08:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1302296;
 Thu, 07 May 2026 08:38:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wKuFG-0006TL-4Q
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:38:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuFF-00Bjds-7A
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:38:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 69fc4f70-e002-0a2a0a5209dd-0a2a4507acb0-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:38:08 +0200
Received: from [40.93.198.52]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 69fc4f6e-229c-0a2a45070019-285dc6341e7b-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:38:08 +0200
Received: from DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21)
 by PH7PR12MB7020.namprd12.prod.outlook.com (2603:10b6:510:1ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 08:38:02 +0000
Received: from DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2]) by DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2%5]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 08:38:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtDv33+SiDfMdsHdf0pW4kImxsxDlxl9vmKJ9TalN81w4TBOGSbIhFh7ZVU6q6SR5fTlFWfBVPYoA1bAKDOVHwE1QnzFX7PeoUalXAG0U7Ilaqwf1ld7pb1TmaBNvYHWYSrEECWCQGaQlv7h0QBvNifevItucB3e2enzaCejszvfJLJXYc+l4+d9yyoDmordUI8BFmjmc3Gw1adljQezCS61guzlblWM2RhnDvKEfkNRbgCLDYV1d7fxEjxLwcgl/tM0/VX33iPIrfRBfB2pIvADzytkJkfVJnAKll3jfseexNJPMHGvcEpf/Q0oGACOHxN+mn5OBGevni8tNqFtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS59B/GMJw0Zpz6SzS4Qy4tfXnjcb9uz8yPFcu81sbo=;
 b=g+S4wtR5ObEM+LBeonTkLpWlWYLUUXDx7vuLOVoSF8RX8jJMOwB2Sz6QY0C/SzpdItFexMqOGV1pijzlTcS0n55pmlb/QprJuSl7TzdWeXUqZzP8EZaUwyrz5PzcQaaoPvDz54jA73PNvPaSi6S9pNlW4W/pfTGD42dezlW3aJvuO1LYtmEjDyRobJ5P4qM2IuiA9pM6wNjqFWR+m4oWVr6QX2wNyY5a9pP06fGSQvqOEtg4PrDXVZMnBXVzMSq5YMhMEilmhjPkYlnfX+c/k6PJTvkyVSRdAd8t4xb878YIGu7KEFT0Ys+5XFp/1R4KXskRPgvHNTbKvmNNalnY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xS59B/GMJw0Zpz6SzS4Qy4tfXnjcb9uz8yPFcu81sbo=;
 b=ZKXTYsYgvW+YxOtzGXFePIQNUUGnhEwEgoMKkvxufq5222zaAlQMVrTvEcta2G/FpXtJ9hr1d+Xje+eUAXux3ggG2EiJbrWAvFCp/RfilKAdc5roiDDysuBHp+9cZOJOMMBu0PKriPV6NMblmytBH7uvVIuOmIw7/Zf4ZP8ARqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3531c9e1-97a8-42ab-aae7-4cfa8976f443@amd.com>
Date: Thu, 7 May 2026 16:37:43 +0800
User-Agent: Mozilla Thunderbird
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Subject: Re: [PATCH v1 0/2] x86/amd_node: harden amd_smn_init() against Xen
 dom0 topology
To: Penny Zheng <penny.zheng@amd.com>, x86@kernel.org
Cc: ray.huang@amd.com, Jason.Andryuk@amd.com, stefano.stabellini@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260506055528.476493-1-penny.zheng@amd.com>
Content-Language: en-US
In-Reply-To: <20260506055528.476493-1-penny.zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To DSWPR12MB999151.namprd12.prod.outlook.com
 (2603:10b6:8:36b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSWPR12MB999151:EE_|PH7PR12MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abeb528-4783-4dd5-c920-08deac13f303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gYhbcg2oCpstSz2cyv9rrQtdfvuS85VsTKijLD2mAXy5uu3o4zaL/qjGAcBJZdqeNqCVAGRSVHjxVVjYgxsjB9+Yw6sXnT3Ytx9409hFKdyRLJpw80MPWxQfdFYtyLUyKhI3++zlESu3Or5F3M+t2akeq6HgK6TpFfSYqMnol6uqa/Ww+JfzSRB5LzhDx2GYAN2w8tsshTQwo34+1cGcWJPSGndr3kcNYJS3EdcytVzz7K0RbVpzc7SrEAVKrPZr+9ZSyGmNWvzsOw7YW0vgPHq+l+u/qKh3YAmlO399hsx1NRTPkxwB4ebSDFfHk3ySoo3s4PgO1QFuDxdbwc1ZekJPkd/ae50usbc/+9irWL5cQsbHuZvoKg6uxhUv7fKNSzxoHlaImcrJepP438jwVD+kDg6t11pMrXvztOUzMlpT1xvxgQPrFivHQGLLuOix6X0n+n5K2Kxyi3gs9nDZ2B0xAlyTBToO4sfj44ayp/fsc0iVYKJg4lZ2LlAEjIpOJz8yU+JQOrukViC048Pl2P4sMzAQ/OLTMPxeeIq8R6wGjBsQSnQfqgmIs9fr2APVoP6gmNQwbdXgfzlX02NrKMaSqo3iWy9DcSGyFOvvcJM6nplF5t5yuGmsSxAdysAhYd2yjoxohooEnQ/lGQK/J7qDOQuk6+jYArkVpDnrZ4xtRv8cmU6AbziGfWSEocNs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSWPR12MB999151.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnZRZnU2djRTdEhwbDBHYmZGaExSU2J6aUZxeS9NR2x4aEJkKytkSUxTOFZt?=
 =?utf-8?B?em1qSWF5ZDhYRjJ6bTcwYkJLVFdpcS9YRFpTWmFPTmFPaHdDd2NEMk0vdjhN?=
 =?utf-8?B?T3ZWM1pzd2tHdktHNXMzWjJLcGtINGRYN1B2ZXBmaFVUK2pJMUd4MTM0UUx5?=
 =?utf-8?B?Y2hNUXU3WjZic1ZBRU56aFNuc2xTZ3MzUkRYaXZsUHNRVUJXRTl6aFBTWFlH?=
 =?utf-8?B?ZlcrckxYY0tTeWF1NGNQcnpuQ2lzQWFUQzNpVnNsSkdvNjhIWWV1bW5QcnBB?=
 =?utf-8?B?L0ZqTGhub0pKVVBpK2RrNzFoVUlHaHdvdHF6eklvaXNXMWQyTGdyL0V1UlRD?=
 =?utf-8?B?WDNsZWZVaUpRT3ErejlObVMvSEtjeEJtSUNBSTdCQVd1ZDNMczlic2FIcXhN?=
 =?utf-8?B?a2gwRzJJQTJDdlNicEZZSWNZOXlIZ3dqRXRHNnFLVms0V0dhZnQwdlI5eHJa?=
 =?utf-8?B?WXFDTkUwaFZNNDduT3I3RldNSThzZFgrZ1ZIM0tjTUR4NncwTWFhUk9YRTBy?=
 =?utf-8?B?SlhEbXVlTEJIWGJRTUdrRW9DejZHbWsxbGVHR0pyQ25Ra1pMdzg3ODA0ZGx6?=
 =?utf-8?B?T0o1SVJNVkhJYmN3NkJTVE9hN1JLYWVHUnZUdXhkd2I0R0dXMHBmYmtqM3Bz?=
 =?utf-8?B?NVZMMjZ1MzRiMkdYTk5oVmQ1VUxhb2NId1ZpUHNoMjFTRjdCOFZQdzNEL2lM?=
 =?utf-8?B?RVpuL2NXa1VCY21XcFU1dFFtQnJDcGJRZmhrOWFyN3N2bG1Mb1AwbjF2enlP?=
 =?utf-8?B?WW5WUU1tWStHMHJxMXdIVFBVNm1PWCs2RTloQVBkMTZ2YVdvNG1nQStaWEhv?=
 =?utf-8?B?bS9pQ29vMGlqSVVPTTV2UTVXS01pSG81eDlCczBMRUd5RWRuZnNjamZsVXZW?=
 =?utf-8?B?VUtRMzM2RENVREExckp0Y1hNd29HaWpZNDFiQTA2OTM1cDIrb0F0ejQrT0h3?=
 =?utf-8?B?YjlrQU1SNmlMZ0t2RFFzblNWeEFLcVR0TmMveDhpbVFtUHl2alpyWTNnNy9F?=
 =?utf-8?B?b2RzRkhxSjI3Mm9Idm1MSGhZN0F1N1pXUTl1K0pxOUhCRUFZN2x1akVRMXR5?=
 =?utf-8?B?ZDliRnhFV05LVUNwNERycTZxck5ZRCtiamVIUlN5QkVNSnBmMUFYYS94Y3RX?=
 =?utf-8?B?T3JyYkxxZWhSK1pqUlJ4V0EwdE42MG1lbmRTeTZwMnNuNTZwcHNFQUE5OVFV?=
 =?utf-8?B?L1F6d2Joc1lRdjMxaG45NzIyTm1FOElGMy9aUTlCTnFTQTB1b2dRcHVxNFB3?=
 =?utf-8?B?aWRKTXNuNzQ4KzFMazBnQ1YxN1dXR09nVS8vRGVzN0Y0SkllUlBqaVFIQVhW?=
 =?utf-8?B?TWllNDNvMmFZQjhPV0x2WllQYmlWVXJPZzVOVDRQbXI2VUQzenl4YjJ1OXZL?=
 =?utf-8?B?OGRTNkNhK3doUytzVGUyZ3dLZ0ZNNEh1SXBkSnZLUjM5Y09pUmdNNXkwa2Jr?=
 =?utf-8?B?U0ZHUlpUTXB2YmN4b0R6ODJOcGU2Nk5VOGMxK3BMVk9qZVlDZldmN2F2K3N6?=
 =?utf-8?B?amdzREEyeUNDM0xWNVg0M3V3R3ozcENuUlNYTXFscFpDK1hpU2tadVY0U2tC?=
 =?utf-8?B?ZHNuWGtjZFR1MGp3dWh4Sm93N3gzeU5iU0tNUE9WeWlrSnhUcmt6WmZUUkpP?=
 =?utf-8?B?QUFBem9sS0dPc3FGSDRmb0JBOTlXOXNNSlZpWklIQTNsZzMwNzRCWUw3ZU5l?=
 =?utf-8?B?TGJLcWkvK2NLY0FyUDltRzF3YVNCSjQzNVByNHhlbUsrcllGQy9VVW54ZndS?=
 =?utf-8?B?VlI0eUM2amVnc3pDaFlmN1I4VzZMeklqcmhTbTlDOXQ4Um9TQnZud0F5OE0y?=
 =?utf-8?B?RnAwT0RxYVdkYmxOODNQOEQxelBhUXJ0czFPbmt4RXVPb3FXRGJPOTdnV1px?=
 =?utf-8?B?VXI5dG5iV0luZEZBSjdXTFN0YVJieEJ2dVNCV3hMWGsycWQyZjRPMTNkbUQx?=
 =?utf-8?B?bm5TdnpnSXlpMktFMUQwdjBNamRSSzdwNmxSd0VSSEI3M3dUMWVCTmpzY1JJ?=
 =?utf-8?B?MWJIYkQ0K0RlczZxcE0ybWo1VTVydGkvZjlRVDlpNGFjUFJ3NWJZRnRzUnov?=
 =?utf-8?B?dy9UL1FJSjRNNzQwdWZGZWwwTS9aTWdObWZXVDFNa1hFTWFEM0NZR1JqYU9F?=
 =?utf-8?B?VmZSZXorVlBDY2pGK1VGbFdScUhYaXNOOEpRY1VWdjFnNXBxdHZhMk5HVzFz?=
 =?utf-8?B?U1RNalZrOVJET3NOaFo3OEtTS2t0blRPeVh1WElrMXFiTTdUMzFKY0Q1TDVD?=
 =?utf-8?B?MWx2OGpVZExzS0NpaUdCVjhkbDFKeXZwdWNVSy93RzdUZjl0UDYxNkNwY0dL?=
 =?utf-8?Q?pRPpUTiE5rTeKeNmv7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abeb528-4783-4dd5-c920-08deac13f303
X-MS-Exchange-CrossTenant-AuthSource: DSWPR12MB999151.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:38:01.8729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yV/bW8t82bLCKrvTWWbKMj//XR0x0aI0ASgPBt7qXLfebAtVa6Lx2TZUa0H2h4oXX3BNslfLXRzMytZv9nT5iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7020
X-purgate-ID: tlsNG-ef75cf/1778143088-2976AC48-2D67E745/0/0
X-purgate-type: clean
X-purgate-size: 1510
X-Rspamd-Queue-Id: AF2BB4E5650
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:penny.zheng@amd.com,m:x86@kernel.org,m:ray.huang@amd.com,m:Jason.Andryuk@amd.com,m:stefano.stabellini@amd.com,m:mario.limonciello@amd.com,m:yazen.ghannam@amd.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This amd_smn_init div0 oops is also observed on 6.19.14+deb14 (Debian testing)
and 6.18.27. Given that 6.18 is LTS, suggesting `Cc: stable@vger.kernel.org`
to get it backported.

Thanks,
Jiaqing

On 2026-05-06 13:55, Penny Zheng wrote:
> While booting a recent linux-next kernel as a Xen PVH dom0 on x86, the kernel
> oopses very early during fs_initcall:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:amd_smn_init+0x188/0x2e0
> 
> Followed: on a kernel that survives the divide, it will fail by a NULL pointer
> dereference from the first SMN consumer (amd_pmc_probe -> amd_smn_read).
> 
> Root cause
> ==========
> 
> To prevent each dom0 vCPU from looking like an SMT sibling of another
> vCPU, Xen synthesizes guest x2APIC IDs as vcpu_index * 2. This spacing every
> vCPU's APIC ID by 2 can push the synthesized IDs past the package-field
> boundary. Linux then infers more "packages" and therefore more AMD
> nodes via amd_num_nodes() than the platform actually has, while the
> PCI-side host-bridge scan correctly reports the number of root complex.
> 
> The fixes are tested on Xen 4.20 PVH dom0 on AMD Zen (16 vCPUs) on top of
> linux-next/master (next-20260505).
> 
> Penny Zheng (2):
>   x86/amd_node: avoid divide-by-zero in amd_smn_init() under Xen dom0
>   x86/amd_node: reject SMN access when amd_smn_init() did not complete
> 
>  arch/x86/kernel/amd_node.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 


