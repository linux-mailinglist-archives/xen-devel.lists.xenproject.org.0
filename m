Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF09C3C9F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833514.1248679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASAa-00088J-Q3; Mon, 11 Nov 2024 11:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833514.1248679; Mon, 11 Nov 2024 11:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASAa-00085v-Mo; Mon, 11 Nov 2024 11:01:20 +0000
Received: by outflank-mailman (input) for mailman id 833514;
 Mon, 11 Nov 2024 11:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBOk=SG=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tASAZ-00085p-Q8
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:01:19 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2608::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45547a1e-a01c-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 12:01:15 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA4PR03MB6829.eurprd03.prod.outlook.com (2603:10a6:102:e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:01:11 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 11:01:11 +0000
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
X-Inumbo-ID: 45547a1e-a01c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwODo6NjE0IiwiaGVsbyI6IkVVUjAyLURCNS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ1NTQ3YTFlLWEwMWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzIyODc1Ljg3NDEwOSwic2VuZGVyIjoic2VyZ2l5X2tpYnJpa0BlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJPn5eOjK/upuCUAkmlWFLjfavqTM5mZwuqEHtZyCHM652QajYYolIB9eVyipUVVbwakPODIQ9v/IeoaDL6KpQGSQ+RkhXFEt8PvOcRMSY2r4XxLbtNmvTHQVQRj/Kl18qpG1HLTEHGvuWz/VoIUD5rathYHPNjMWTVXszgnftPgTQy91FXp0AUeAUBymm1Q39TqoP0djSsYJ33OYXCVWN68C+b3cs1R55lR8oHNxh/dyarWV3BsP/EAqVoLyotUyWc4265PQ4a/9vGkU779lpMz8jX8I+86QPev2A/Mg9AebHbTSzeCvHMXPjybHdEU65eTUoLW5ZGUk/aTdaWAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaRJ4eSctnOcOyMu+PuRKTrKbvjYqj7wwyAXQ+futgI=;
 b=oXkKw04hOTCrcfCFmMl7R3Fd1tV32RWStqg3cWOyr+RvPyofqxi/NRUztHqjgyhzksQTfYn59XevM+pSjd3k3z5/jXFoxV/oQciOg91u+XG8id92fFoVVuNpdEnsMp+5UKY46PrZ35b1NG+yZcMvIayopbYCOum3k9LkzlR7Ivh//rENxmGGZO++DuiuhTYR3q5q2+Fe5QNE/jEMPok59HeMs+2zpvLJgkeWBVfxQWJaBdJnmnyEKIspAqKvNwFYyIi5cNNgIYkq5tHH/FlSpYVFH4TrdU5OpoOLoQC0ZMjNOWba05RcE1s3WK2aGZyAxBR3y45kCF8OTfOe+dIqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaRJ4eSctnOcOyMu+PuRKTrKbvjYqj7wwyAXQ+futgI=;
 b=baKXCevs+w3U1yDaEJas5t8rwgSjUx+MUiH3TlWj15DQk9Rm782ASFdExRJpIMWEmEKygDAD2/v6WCaTG4dDRZnl/W4J69jlu04+R9CaONnS5JW/KJ2/jtNeYAeyDjIpbsapzezD6HpmAjT69x7GBSzLQNUeAOl0HlluT5au6ZghIyXX++i8Eth87LNGzAbIwjgIUc7+D7rCN+8erUIHrmrZAjTxfxmnBGIU6Iq9/gSsisriJFnqnLUW1qVtmlvZv0Lo2cdqPd9oJitL7sbBCPa71avEWGt79gu9HPu7uAUTYKma66/tpm2nFIKNSdCV/z83UZOnFS1qploGYgGB2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <505e0790-10b9-4468-994b-1a3890eaef46@epam.com>
Date: Mon, 11 Nov 2024 13:01:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
 <34a2d071-59a8-46eb-a9fd-516cce801343@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <34a2d071-59a8-46eb-a9fd-516cce801343@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::16) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA4PR03MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d0beb3-2194-4c88-415f-08dd024026f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnJPbStGSUkrVHEwMjFqWWRYdmlqQ0N0VFEyaW9qWkU3UWVtcjRUYWs1UHVU?=
 =?utf-8?B?aDN3TjFBSHFWODM0Vis3c1VrQWdhMWhKV1Y0OGgrRElaUXQwTWVtQmNoM3Z1?=
 =?utf-8?B?cTFFbU1LaHJvZ0piVXgxbGxEa1RhTWN0UzVrQ0JlK1hzT1M0V01MQTl6QVlZ?=
 =?utf-8?B?MmhjV0FOVW1CaWhoMlBHTkJlT3dQcWpNU1IzYmZSbE5NSUlZU2tSUnlYaUU2?=
 =?utf-8?B?Q3o5QWF4czZUWFN1UkxBUmNrMW1Dai9tNVdPRHRuYnZCeEhsNTNZLzdhQkNh?=
 =?utf-8?B?T0srYnZFTHlCS3dhWnhYalVzOVNCUWdRRXA3M0xJaGFEMk9zVysrY2lVRzJx?=
 =?utf-8?B?clV1TU1lOW0vZkZacDYySjBsOXJVZ1lBeFRXdGhQREJNTHVoL2dUQW1obnRG?=
 =?utf-8?B?eXY3ZVRHNlRIMDByZFlyNHd3dHF6d24rUHVPRm5JWm1oWldFQVE3WGVjMEVQ?=
 =?utf-8?B?SGlnOVR4TG0rUTlFV1JIa0VzUmttc1hUR3drMk0vOXFIU1Nsa0tmR0JrTHFG?=
 =?utf-8?B?QW94eDVWUE0veXNqb2gzWDhkeHZnaTFSS1d3eHBZZ0NXYkRQT3MvNFdzbjN3?=
 =?utf-8?B?bzhWL3VreTRidXVKVVhTcUpRbHZPNytHUDZOTFZBcWZWNlRRZmZac3Z2WS9p?=
 =?utf-8?B?UHUzeGxvN1RGUlpoeDI2NWtSQzU3RnY2eXVMMDhiMnVFYTBWZUx4THF5TXRw?=
 =?utf-8?B?VVpOUUNCUnlLOWtZR2xlOWtpU0tscWs2ZUhIcjB4eGJNa0VKYWk0UXlUemsr?=
 =?utf-8?B?VFFpZHJqMW8yNTFvRUdqSTVjdkI5cGl6WmFSdzdBckgvOXp2UStxU0VYMGNX?=
 =?utf-8?B?d3VWWXZEWEhpTVZCRGdBWE51OVk5NlY5N1dvN3hUYXR0RkpuQmN2NlJBYlk3?=
 =?utf-8?B?a3lWdTR3MlRzSllJRENJdVl2S3N4dUJuWmRLdzVNYzdZR0FLSzBqSlBkTmhW?=
 =?utf-8?B?MXdvaFI3VUJQbERQU0MvUW1LdDRHTGJaWVFHMVJzdlFHbFBvNGtJSEJ6WGJM?=
 =?utf-8?B?TmdNZ1B5Zk5GVXhzdGtsdzVqVUU3anRDd0dQc2Rkek1ORFV4Tm9tQUk5ZE11?=
 =?utf-8?B?VkFGVVF0TjdVRHBCcnVQM2FRR05RS20xektCOUUvSGZQREZBK09Dek1pbWRS?=
 =?utf-8?B?UDUzRm12MG9OVnRxd0owS3A3TkRkdmtmenBNaHpNcUc2L0lLcS90RXhERFQr?=
 =?utf-8?B?eVVyeng5R20xTlhLOVdaYWR2dHpVS1VMRExSbVJTUmJmTjRKNVFDMVBQeFEw?=
 =?utf-8?B?Q1d6Q1V5WE9tdnJXa2lSMG42WHNERTJXcDhPd0oyNUlqR0VVT0RyeVJVS21F?=
 =?utf-8?B?ZjdBc1VaS2FqcU13N0M4SmJzOUdCZnpFLzA1UDRrSFRua3l6Rk55SGU0MGp0?=
 =?utf-8?B?UC9PR0dDc3p6V3J0dk56OVU3Yk04Sit1bU0zampEaGpwREY3Vmk5RUE5dkE2?=
 =?utf-8?B?S1FKcGx0alNjeEJzeFRXeWlOeTFFQi9NMldYMjJ1SzhUcUExWGpvZUx5Y2Yv?=
 =?utf-8?B?Z2EyTnBTN1VLTHdqUHhValRrbUY0aGR5dzZkb0IrR29mN3p6OHUxc2N3Y1M5?=
 =?utf-8?B?NStYa2FxZndxNjVpZVgvNkhlRWFYL2Rkb2d4Mks4ajZIc1kvV2tyU0ZPSW9s?=
 =?utf-8?B?Qjlma0l0cVFwYWZVMFdIT3Vpa0RpUWo3NDB4NlZYeWdtMXpWY24yV0QwWjlu?=
 =?utf-8?B?bUVVUTl1N2dXY2M2RGNST1lUekh6L0tERjUrL290SUovT0psSkN6cDQ2WXF2?=
 =?utf-8?Q?QKQHaW4MyO9r4/cD8KXodESx0DTSYu1sO2w4BZM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnhUNW5HNkUwMjlKVkplb2tuN3JQTGlUdklTai91L3ZIandvRklpVjRtNEs2?=
 =?utf-8?B?d3YvR25MblNaRlRPTEl5cUpvS0VxaWRYYmVqUlhtNUpqaDBSWkF1c3JISTRq?=
 =?utf-8?B?dFl1azdKK09vQUQ5SzVrdlJUTTlYdSsrVENVUjZNOVRwN0hwOThMNkUyM0hI?=
 =?utf-8?B?S0xSMFh0ZVZQSnRUSk9pc2dLNC9wNHljbDk5UEhZdG90bks1b0pJbVNKUlZJ?=
 =?utf-8?B?Z092aVBOUDl0bTVORFlIU0xLKzlwbkdlV0xyTisxdzhLOW9haU4xaFZVaE1p?=
 =?utf-8?B?eTY5S1FDN2p2ZEVhZ3BLN3dEYkMxeGVYWCswVG9QSzBobTNJUkRUZWViSFpF?=
 =?utf-8?B?OEVYaFVMZjlNbXI1QnBPY1lnQ0tpVHZZdGcxNzFNNm5uakY4NEJHOEw3Z1dw?=
 =?utf-8?B?QVdxNlVVMnVDeHo4M2tnMGZoYkJnOEVsUW9xMmU4V1BSYzRqNGhKQVArbzM1?=
 =?utf-8?B?RE9xdlNhbmVxZmVuYnIrYU1Ra2RJR1RFcng5MENxL0N4NlJDeVNYTCtSWENN?=
 =?utf-8?B?WnFYUmU1SGhsWjJRRWlHNk1vM0VkTXBLUGxBM285cWx1WkZCcVJBS2kzZnVV?=
 =?utf-8?B?WEMyWjNoejlZYWVrR3NKUU9lZ2VqYVVwNkhrQXk2anJRRHVtYjRDNCsyUDU0?=
 =?utf-8?B?UFZKdHJVajhUSm00eVcwS1FVc3QzZHFqU1Iwbm0vRWNwSkU2cnY2MWwyWHln?=
 =?utf-8?B?ZjRvYlI4ZkxaTDBtMkNpdjAxSVVHT3hhakdKeGpmS1oxS3dnMFl4T011ZlI1?=
 =?utf-8?B?LzNYRCtaWThyaGI0VVlDZWo2OGo1bkh2NmhJbkFrZzRvTUJJQnJSWm5SakJq?=
 =?utf-8?B?SEVhQWdwVCtSNUxrRTNZNVh4WkFHQ2FPL2RFb3YwMXpFTXRRZDN3VVIyKzMv?=
 =?utf-8?B?UjdmT0FoZEsvUWpoTzRFYThPdExLaGRIbXpVQ3BUcUx6VXh4T2dUaWJRcDlt?=
 =?utf-8?B?dm9BUmdlVGNtVm5OaGh6V3d6aGVBdjRlY3dFZ1RLeGVZbGMwVlVSTEpHcldB?=
 =?utf-8?B?QUI2a2Z0ek5SSWZGQkFBdElPRVkyY1R1Ny90cHh4UkpTNjRYaE1Pa2xvbmgx?=
 =?utf-8?B?Z1hmaWhTZDVtZm5aSFBiY1d3UFpqcHVuV2ExR0QwWHZtbnFmNWd5MmpSYXFU?=
 =?utf-8?B?NTVQR1g3UkVuRG91OXpMVnJuNkhiTDhDb1E3eCtUY25iR2NleHVVNUUvbFlM?=
 =?utf-8?B?ZzRzN3hyc3A3czA1NXdMWWlGZFFvc09uR0VOMHIwQ3RxSDlkMWtYcVpUOG1U?=
 =?utf-8?B?bERaVDUvaG4xU1o1cFVhTDdBcDkzc3lYQ1liK3ppWW9SOWRLT0RNaHV0Qy9l?=
 =?utf-8?B?MWRwOUxocmZ6RTd1VTVRZE5Sb3BpaXZudklNR1RiNHB0UDNWQk1PcHhsWXlG?=
 =?utf-8?B?TlM4N2k5VkxROFpJVW1zcmV0ekxXQXJOaEJmeGM5ZDFGa3NneHNUVzJoT05J?=
 =?utf-8?B?bWV4d1hpMnp2SVhzSUVnMDlhQzB2d0ExTlRCTUFaUXFHOVNCTXlJRmQvVjU0?=
 =?utf-8?B?T290cEd2cFRBWklJZUJlQ0FHOUxwRFRmUEswdll3VjJNajA5VHpWaFB0ZUgy?=
 =?utf-8?B?cVZmK2VaYkdlZnIvYXNDaDdHL3VNOHp4clFKN2Z3aTl6TkJsRHQvTEc2Q1l4?=
 =?utf-8?B?WG95d05aZGVyc1VkUXFVM1hGblJjbGU1ZkRDUGlkYTNlZVUyWU5EaHVCRElu?=
 =?utf-8?B?SzZPZlFUUG5saFpuMTIyTExXb0daK08wTnpBMzN3OFRpMkorT3BnZXNPUkFh?=
 =?utf-8?B?WWp6eTduMm14andWR0w0OEhCcmUwVmRuakcyanowQXR0YVo1SzhZV2hNTFIr?=
 =?utf-8?B?ajZxWjVYM2gzU24wYTRXSld1aHpnWUQzK2Y0d21pY2xkN1FUVHZnSHNoU3RJ?=
 =?utf-8?B?bXNweG5oakFPcUtIN1FHdUFZWWI5VytJRmFXMWQ1djYwUlJ1S2g1MjAraVQ1?=
 =?utf-8?B?eUxKaWVOckd1ckFGdmFEbCt1eVpMc3ZsZzB6UWVqTXVCQmQwZmZmRk1CNjgz?=
 =?utf-8?B?bDNvZ1U3KzJ2WFYwQTcydXlaQzMwbmdJNTVEZDRSbjZLZFdJaDhBNzhLRFk0?=
 =?utf-8?B?YWNHZm1sbTBZTDRsa1M5YU5tYzJOMDBuNUlnN3RZNkFnVWx1NkFUM0RsOGlt?=
 =?utf-8?B?Nko3eFJ3LytYKzROQWFXcXNoYk5WbXVodkZvSmQ2TWdHT1dBcGd2dG14RTAz?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d0beb3-2194-4c88-415f-08dd024026f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:01:11.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKHddVpJvzAvOb171FIGTD/2slGGWjfPVGbHEBWUQVUBN5UcLDhOzwOEyECJN9vfbJfa9D9guhq+JsBM4gMoIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6829

11.11.24 11:51, Jan Beulich:
> On 06.11.2024 11:14, Sergiy Kibrik wrote:
>> Introduce config option X86_HVM_PMTIMER and make pmtimer emulation driver
>> configurable and possible to disable on systems that don't need it.
>> Option X86_X86_HVM_PMTIMER depends on HVM option, because this driver is part
>> of HVM support code.
>>
>> Introduced additional check of domain's emulation flags, to cover the case
>> when user explicitly states the requirement of emulated devices that are
>> disabled in the build. HVM always require these devices to be present so domains
>> of this type can't be created when pmtimer or any other emulated device are
>> disabled.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> What exactly was it that Roger suggested? I don't think it was what the patch
> does overall, but just _how_ it is being done? That makes quite a bit of a
> difference, as the former could be read as kind of an implicit ack to what is
> being done here (and also in the other patch). Issue is: I remain unconvinced
> that this conditionalizing is actually something we really want/need.

about a half of this patch is what Roger suggested. These changes were 
in a separate patch, which Roger suggested to be merged into other 
patches. What tag should be put in this case then?

>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -144,6 +144,19 @@ config INTEL_VMX
>>   	  If your system includes a processor with Intel VT-x support, say Y.
>>   	  If in doubt, say Y.
>>   
>> +menu "Emulated HVM devices support"
>> +       visible if EXPERT
>> +       depends on HVM
>> +
>> +config X86_HVM_PMTIMER
>> +	bool "ACPI PM timer emulation support"
>> +	default y
>> +	help
>> +	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
> 
> Does this really affect PVH guests? Isn't the whole point of the change
> that in a PVH-only environment this wouldn't be needed in Xen?

PVH guest may (depending on its configuration) still use PM timer, so 
I'd say the point is in a PVH-only environment this driver becomes optional.

> I wonder how meaningful "pmtimer" is to someone reading this help test in
> isolation. I'd just drop the word.

sure, the word is rarely mentioned anywhere, I'll remove it.

> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -742,11 +742,16 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>   
>>   static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>   {
>> -#ifdef CONFIG_HVM
>> +    const uint32_t disabled_emu_mask = X86_EMU_PM;
>> +
>> +#if defined(CONFIG_X86_HVM_PMTIMER)
>>       /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>>       BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>>   #endif
>>   
>> +    if ( emflags & disabled_emu_mask )
>> +        return false;
>> +
>>       if ( is_hvm_domain(d) )
>>       {
>>           if ( is_hardware_domain(d) &&
> 
> While you commented on this hunk, it didn't become clear what exactly the
> resulting new hunk would be. I question in particular the change to the
> #ifdef: If that's changed and the BUILD_BUG_ON() kept as is, the comment
> also needs adjusting. Yet it would perhaps be better of the BUILD_BUG_ON()
> was split accordingly.
> 

This #ifdef definitely wants nicer change. How would you suggest 
BUILD_BUG_ON() be split?

   -Sergiy

