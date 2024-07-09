Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046292B35D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 11:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755987.1164535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6ur-0003at-FQ; Tue, 09 Jul 2024 09:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755987.1164535; Tue, 09 Jul 2024 09:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6ur-0003Ya-Bl; Tue, 09 Jul 2024 09:13:41 +0000
Received: by outflank-mailman (input) for mailman id 755987;
 Tue, 09 Jul 2024 09:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C54Y=OJ=epam.com=prvs=392098eeac=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sR6up-0003YT-JP
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 09:13:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 859a6323-3dd3-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 11:13:37 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4694Jl9d008372;
 Tue, 9 Jul 2024 09:13:26 GMT
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazlp17010004.outbound.protection.outlook.com [40.93.65.4])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 406w7r7rpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 09:13:25 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAVPR03MB9019.eurprd03.prod.outlook.com (2603:10a6:102:321::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 09:13:20 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 09:13:20 +0000
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
X-Inumbo-ID: 859a6323-3dd3-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dl9NS6M6XNDWs9EmfdWU+8YRYkmog+B4dS7kqeH/t3KFXpDHYqpMlFxTI/8m6WliBBpos++BkADjhFFMzKLZxTyobAIg2jS2/jsPUeYgV5H1f5hvzGUppynTDI6tL5iAoEjRc1lWoLxmHCzNaV0/FFGMVu2uW4dYAahLpUYuKRnD2LVxHuTwN4UKVY5QdLh2tMKMrYrIb97gmQ+7iI1H/2dnFaI6VhRjNMfCWZLxGXI+7UaaiTt9a0f9feIlsl5lhoSHhscijgS/Wc/kG5hUIDhWiKgtvdxFZPuGxY3ZLlDYfaOFdfIsqqP7Nqvqyn1a2GSZ+7fqBMy2GS2ZYTaJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nx8bSRr2FW9ttoTModCxJPOZvV3Y9Qu9XmQsErx//yw=;
 b=JSqJEqHgt8zP5uePS/6eyDcok4JLIhapY7pM13AALXo/C7DbFmm8g7HwcIPGR3V1CYTvKvQBgQA07N9VqC+M9IlrYJh7OD67rrHlnMEuB4oeaPA8BPoshZfnVQQ1x5EuiLPzqVZQgsmPBH8uYFpIjXxGG9A0osgFup6Cx4/Jum0Fkvj3flYSI1jflXtzDlBi/aUVWAUffyJtAJPNNLitlOt31YsIQTIvBmGiNaj1Po6H2O2gYZY5dq6QwkPxdCI2lgTVd8ACtPR39C7H2UEfMx6NMmJ5AD38vX6Y4DThd9MdRJq0tBHstZF77+KzaRliLzfLVsY8C96aVN4ylX9X8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nx8bSRr2FW9ttoTModCxJPOZvV3Y9Qu9XmQsErx//yw=;
 b=lhjyaOtkmrlU4KgGbjUMkmSI5h7v5E6tlsmp8c4gXoAjHeS+yAMH0vb94vIs/GTMtcGGepJBAV6Ql0ST8OY+CqKZ+5UiL5D/5a/RZPbtDz6C6Y94q0ADSLpeD1Ce2amqWg8pg2sXiBpfFr1uHdgBaU7pwnFxCK5YdQ6UIxWVeUruziFjGKJB6ObB8vakCRXf3jHQ1mhvSKB52QQc7mlm9azg9Ko8mv6X4gJfuvAwc3sLzcSWEPoQW+hVKTEscK+dLKJCZARPe1/b0R36y4WTCmT4gDWXbxmkQEHg87tPIRaJ8CXHCjmEI4IqaFiBqGWF1xrCGjDPx4rFWXhxOYAHEw==
Message-ID: <cbb957fa-3d71-4358-b01c-0a0857db43eb@epam.com>
Date: Tue, 9 Jul 2024 12:13:18 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/cpufreq: move ACPI cpufreq driver into
 separate file
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
 <d8a13eb8c53d8cde99d7fa1d8e4fce2a597f02fd.1719832871.git.Sergiy_Kibrik@epam.com>
 <0f883617-f4c0-43af-895f-3f70d4143a34@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <0f883617-f4c0-43af-895f-3f70d4143a34@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAVPR03MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: d2889066-6dab-4d5b-052d-08dc9ff7607e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MXZHa3JsTGxXMjFicVByWENTSUMvUTZqdTkrRzcrcDhEWFNGL1VieXpINSs2?=
 =?utf-8?B?MlNUeXpoL1lZUmY1UFZpb0Nzbjg5SjJDMjBxeWJ2MlNMODU3R1NnbWdlUXcw?=
 =?utf-8?B?Ymcrdm1VbjIvYXBPREZzK0Z4RDIzaytxVjk5eWVnSTZoY3VQcnIzeXVqYW0r?=
 =?utf-8?B?U2FwQitwTnc2c0MwU2pCb09pbWF6c0tBcUE4a25ZVmdndWFzU3NqMjFvYmZo?=
 =?utf-8?B?a09IcU9SWDZLblp3UHo3UEhoUUxWczdvS1NNU0FCOVllVGdCZlVyQzJUZzNK?=
 =?utf-8?B?MHBReGYwMHN3d3JoRkNpd2FDb0dnNEJLSjJvVVVONkZIb1dTdG9kNzUwSDU1?=
 =?utf-8?B?VFdKV1BlK0hxWTBGR1lQSjcxVFF2dDN0d3M4bXdJRmNVNzRNdmhWbGhjSlFx?=
 =?utf-8?B?c1JCWmVMSnJ0dTJuTXJzMG02ZkNoandESVZuRGU3V0NJUnQrKzE2V0srMGcw?=
 =?utf-8?B?Y2puaUxCMHdIWmtRSjgxcE5XQ1R5UnZLTU1WWitnUkNCL3ZWYVZySWxYeE0y?=
 =?utf-8?B?VVlPaTdvdXcwZ0N6RXFXYThuclMreVN2ZFkwcG91VEFYcTdhdEswblp4OTlW?=
 =?utf-8?B?SzJNR0F1QVlGdmVmRmM0RjVMNHh5R0dXdWIyRVRyT0V5ZWhRTFJpZWczN3hz?=
 =?utf-8?B?UkNRVWUxakM0OHdnQlh3MlJHSlQ5WW96eSsreDBBYm1sdE9yRmJvK3N6ZnVx?=
 =?utf-8?B?dmIrK1MxMEhLOWVYYzJ5SUZRWjlNMFBDYUhHR0lUSVFFczF1cDhpWnMxTGxZ?=
 =?utf-8?B?MThnRWFjOVhOMC9PYzBXclVYMFR3N3QzUEFidHhDMk5uSUhKanhiQzhaMldW?=
 =?utf-8?B?NXllN1cvbVpONnN0Q1B5T0wvbnhMeWdzOVpkcXJjMTh5V3Q4K3hEZG43S2JI?=
 =?utf-8?B?S3p2OXJuZjNtbXVlSzRIbGZLVDl4Z29jOEF2ZGw4SERhNEZRNlZaVUN5cVFY?=
 =?utf-8?B?R0JZc1RvUTJmV1RjMFVrNGMvUXc0Vkd2MlpUd1E1ZzlQUE5kUVhjUDdTVWhi?=
 =?utf-8?B?bytib1RyL1RoZWx3NG0vZjh3Q1VreTNFQ2tCSUxIZFVSUndTcFF1YmV5dHBX?=
 =?utf-8?B?ck5wZnEvZ05kMERtMHo0amZibUlpTzBEWkZwWGlON3hMU25raW1ycTJkWU1J?=
 =?utf-8?B?Y25UdkZlbGRXTjhCMkkyOWZQcGRCTVA4M2dCOU11RUdYdEdMMDAxdCt6WEhy?=
 =?utf-8?B?TXJvRTVGOXhYcUpVZzZqTGFRNFVZZ2lhVGJEcVFjWGIrUnp1YnJ0Y28vMEQ0?=
 =?utf-8?B?VDdLZ0puQkRwYXpoZjZjaVp4OS83YmNoeG9uRElXeFJGeFhrZ0Frc1BNMFFw?=
 =?utf-8?B?czdVVi9TTzczUUdnc0pxZEpyRW56ekZNNlN3ZDd3TWlKa1QzSkZqMVpobU9z?=
 =?utf-8?B?b2dGT2krdmQ0MTNvWmVNcWwxSlVzZUtubHdtY0Vlc3NsNVRPdjRaUEc4UVBr?=
 =?utf-8?B?QUhDcDBSWjV4L0NLM2VqSTRSQUhrNHQvSjdRZ0gxNTRCaWFMZmpNa2JZSmRj?=
 =?utf-8?B?c29zNlNxS21oMGI5VjdnTnZGR3lYZllBL1hNbVdVUGE4TVRBTEprdWcvZjl1?=
 =?utf-8?B?ZnBrQnFRVGVITVFjZE8zVnp0T0w1dDV3UVNyb241SWdSUVRuSVlRN1l0Z0tG?=
 =?utf-8?B?Z04zU3N5MmVRSmg5cUFXdHBLQVNENmVjK09LOUhyTFRFWlZKYmVMdkNnTXVt?=
 =?utf-8?B?V2dscTRjWTdzSFN3ZXR3VGw0Z1NSR3U2OEtSNEtXZXpHVm9zSiswY0w1cVdx?=
 =?utf-8?B?YkhSN0hMQUw3cFM2N2lCekV4MU5FVU1ScGJXSWZvek1XUW9CQ0x5ZFFUZDAr?=
 =?utf-8?B?ZHJEaGt4SnlaM2xDS0c1dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c050THF4eU04amI0Z1FKaWZTcEVRSFlWYklNNDRCQk95ME5JTnYyR0VpVExH?=
 =?utf-8?B?cjNqQVBRdHJnaStLV01CaDlTV3lucEJ6RGZFa2I3eHg4L2xIZVdkMmRVVTg2?=
 =?utf-8?B?K3BrQjRjbzVpOVV2aWFuS2FLMmxKS0duYTVoR0h3a0VmRVczbHRnWTAzbTFW?=
 =?utf-8?B?U1JUdkw1VFUvenpKUFVvQ1k2bG5wL2JtcHcyRmFRMmpQUURrRkphOG9uTlR4?=
 =?utf-8?B?V2p1MWpYQkh0NzhpS3lHbE5EUW5saFcxSTRNU1ordDVXZDVRUFRlcTFwYk1X?=
 =?utf-8?B?YXAwaDJONC9ZR3kyMlBDdTdqV2grQ0xBWk85RW8xUU13K1VUOXlWVkltbXR4?=
 =?utf-8?B?VWxTVnI5UUJDZklkU043c0hhRGtxdEFiV0JtUDN5QXVnOEFyRFgzNWYrQ1Ra?=
 =?utf-8?B?VWNyaGNoUUliemV2dVJ6d1RjVy9yTVVmUGxIelZHNkdNMjF4UHBySmNVVUJz?=
 =?utf-8?B?YS9JV291SVVTd0UwU2ZSVjZ0MXZoVHVienpDVGN2czFML3BBOHhnMDlZdkZH?=
 =?utf-8?B?cTR6UTdJZHVPTTB6ai9XNlEvSTZpTDAvQkRyMVNmcnQ2VGtLRVgwL1FEZDBw?=
 =?utf-8?B?N3dudUZ3QU5vYkNnQXNEQVZQLy8rVGlHaklRUUplRWtFOExJUHBtUzJDU01R?=
 =?utf-8?B?ZnFtQ21yRUNJTXBwdHlpb2ZXUDFYRVl0VlpNKzhDaU85TGhHZHRFNnF3K2FC?=
 =?utf-8?B?Rnp3TW1oVHdWTllEaHBjWmJXendNUGY3MW1uMmFQaTk2OHVHMU5NbVVDNmJl?=
 =?utf-8?B?MlA1NGJUUEtOSmM2K3dYcmEzbjQwNk5zQlZscm9iSkNzLzlHdEV6cFJublkw?=
 =?utf-8?B?cGErSTdlWTM0bWtUY1JKUEUrUnBXSWtMUS84dTY1NkxUaFdCWnJXYmRKSEQ1?=
 =?utf-8?B?aWJ4UStTWktWZ3dsUU5teDNMWlBVSHF2TkU0Nll0VVJhM0dja2tPQ0JCTnZF?=
 =?utf-8?B?K2sxMnVXWGVhM3Z0MEVjMzNxTkViSi9hMHUzOGh5S1ErdDUvRC9BNnZnVnhC?=
 =?utf-8?B?WUoweTYvS2g4UFlCKzU3RitnMmZ6VGlEOWRMTlA0U1F5TVNaNmxhckdOOUxz?=
 =?utf-8?B?cVdlaDZ4TkZqY1JJM1laRk1tRXppb0JvM1VxdVNmdzMrMlY2ZVBKVXpFQ1ZF?=
 =?utf-8?B?SG1rMzdacWU3WUh2OEpHdzF2elFRcG02K01hYXRFb3hVc1dRQzI2MkRESk5y?=
 =?utf-8?B?OHBhampLdytQelZMbC9USEZCMVBVWksyVk9NT2JEZnRNY2ZLQndRWnpRbFZF?=
 =?utf-8?B?ZDhiazc2L0s2cCtvQm9UM1k1ZEExcDNHWXFScGl6NGNjZjNXUkg2TmFjYUIr?=
 =?utf-8?B?UGdjOC9ldmZJc00rdlIxZHQ4RnRkWElISGJic2Q1MDFHd2tTYW1HZUlYLzg5?=
 =?utf-8?B?U2pUTWxvaUppYjNQdjd5bHhDRGdzMVFwM1U4MFN2Ui9seFQvcFlNUDlxVEly?=
 =?utf-8?B?eVc0MVh1VTBybzJad0ZaWit3N3NKQUFVRElyT3BucUpXOFdpcjBHWWg3K09E?=
 =?utf-8?B?TXdiSmlRb2RmZkFSSE9RMVJiMmR0d0hhM0MyU0c0emNBa2REZzBFQ2tJNkxO?=
 =?utf-8?B?RUJyanIrWUtDSGxqby9HbGl1VWxEdkk3ZDhGQnBDa1hycjlRZ05WTVNDRnFV?=
 =?utf-8?B?aisrR3dBeEM4M3NFSnAvZ0xaZ01iOHZscE9VT1hGbFp6TGxyeG1UMmMxcDM4?=
 =?utf-8?B?WHNHcEVGSW4zdkRTVW9wbU5BNkQ2UzdNdi9JczUrYXlFd3VZMXlRWWtONmMw?=
 =?utf-8?B?OFl6U28zK1pNVW52K2lyb3RPQU1xVVRLaGNGUzJGL3N5VzRDbk84MGN6S0dP?=
 =?utf-8?B?eGJzWUFvVGxqMVJVeUhjNjhSS2Q4NjBUS2pBdDhEc292OFZCUk1LV1VEWUtv?=
 =?utf-8?B?SEZySE1jS3RTSkZCM29tMzZOSldDTlhlZ05mZlBZS3UybG5QWE1jUWxlZno4?=
 =?utf-8?B?Zkpuc3kyZnZXTDdmUjBWcVBCY3hpQklrcFI4OVdDNGNjZFBYMVNBbTZGY3Mv?=
 =?utf-8?B?d2wwaWg4SzRDV09RdFFmS28xWkV4UzgvaHY5N0RoWG8rSXVaMENiTUR5MXN3?=
 =?utf-8?B?QmoxbFhUVTk2bnFWSFI2dnFaNzA1Y2dwUVFZMmErUldqbndKL2NCcEJvOWVz?=
 =?utf-8?Q?JbEQ/gNXkN1+znmlfDfcKB1Xk?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2889066-6dab-4d5b-052d-08dc9ff7607e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 09:13:20.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJYw/g7xvAZWl8ou0wgHGkOS6K8m1IYAM6mnCoGragxmpCxti8QJIZcJOqtvTgggoDxDHTrQ1kgXzQxjb4sS8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9019
X-Proofpoint-GUID: HlJIdOAIPx_grVM-eMeZyy4HSSLZ_GBN
X-Proofpoint-ORIG-GUID: HlJIdOAIPx_grVM-eMeZyy4HSSLZ_GBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090061

03.07.24 18:07, Jan Beulich:
> On 01.07.2024 14:03, Sergiy Kibrik wrote:
>> Separate ACPI driver from generic initialization cpufreq code.
>> This way acpi-cpufreq can become optional in the future and be disabled
>> from non-Intel builds.
>>
>> Other than acpi_register_driver() helper added and clean up a list of
>> included headers no changes to code were introduced.
> 
> And perhaps that's okay despite the many style violations that you move
> around. However, acpi_register_driver() is too generic a name. How
> about acpi_cpufreq_register() (not not have it grow overly long)? Plus

yes, sure

> 
>> --- /dev/null
>> +++ b/xen/arch/x86/acpi/cpufreq/acpi.c
>> @@ -0,0 +1,622 @@
>> +/*
>> + *  cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.4 $)
>> + *
>> + *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
>> + *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
>> + *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
>> + *  Copyright (C) 2006        Denis Sadykov <denis.m.sadykov@intel.com>
>> + *
>> + *  Feb 2008 - Liu Jinsong <jinsong.liu@intel.com>
>> + *      porting acpi-cpufreq.c from Linux 2.6.23 to Xen hypervisor
>> + *
>> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License as published by
>> + *  the Free Software Foundation; either version 2 of the License, or (at
>> + *  your option) any later version.
>> + *
[..]
>> + *
>> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> + */
> 
> ... I expect this should be transformed into an SPDX line. I expect the
> one in cpufreq.c wasn't picked up when the conversion was done because
> it doesn't fully match whatever pattern was looked for at the time.
> 

would the line

/* SPDX-License-Identifier: GPL-2.0-or-later */

be correct here?

   -Sergiy

