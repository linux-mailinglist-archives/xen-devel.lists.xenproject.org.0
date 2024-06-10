Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41772901F6A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737138.1143299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcID-0001N6-2j; Mon, 10 Jun 2024 10:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737138.1143299; Mon, 10 Jun 2024 10:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcIC-0001Kg-VY; Mon, 10 Jun 2024 10:30:24 +0000
Received: by outflank-mailman (input) for mailman id 737138;
 Mon, 10 Jun 2024 10:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtSS=NM=epam.com=prvs=289119432d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sGcIC-0001JK-1o
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:30:24 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70de8ee4-2714-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 12:30:22 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A8Dt8H003943;
 Mon, 10 Jun 2024 10:30:12 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ymekyvpu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:30:11 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA4PR03MB6703.eurprd03.prod.outlook.com (2603:10a6:102:ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.16; Mon, 10 Jun
 2024 10:30:09 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Mon, 10 Jun 2024
 10:30:09 +0000
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
X-Inumbo-ID: 70de8ee4-2714-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBUOC75GemOoBqVJFUwuIHnlBQIUHlh47DK0341pVXE5RYd/rMpe3KahmzJZnZC0hIMHKCSJaThTtbGg/CqtGhxaSoWgd9R6qAWjZ8lgKQW73aBxERdthnUXB3FHpUSlNrpOXaM7TFpyJE0T4xBfYJdsWDuVum4Uxd+cM8Vqhc+Ut7xsfyBijHzjElNKnILdC65+xOkll6TH7rB+XpeQlcozFMrd3U12bGCxL7zNEiSb1eDH4BkVo51c+21x41MWjnoO/BoiQP2w8YOmbmdfk7SEkc42v5MaYvnUOZ9jOkyRDPB1WoETlFHGYsZ8L6wULAM/QL+M6FnWLs1ma9tttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g57bSPk8mp4js75g+IUlOwMXroVDSlfYL+EhouJvoo=;
 b=nDOQUVkRdkpyPUaXg1FFMpLEGa1Gf2HGYrbmNA2j2DSHo2heYCxlcKD/CjO//u22tG0LmsfaV6Ac7wmxRuSh8JLNy6PSO4XESzcNaYFvInU9xzQXrflJfhnCvUHUSRiNnciSxNItV4kgjCZmTznmJDyhyBH+/CWIHIkuYAH6SEo+I0w0QlbYRXOeBjfwXVm52SMDtwciMHOU3eHkDnHlW12KfIgKkG7ykWkRMCeE2DMUdPkDwy/ZExvIIFaGyJQpa5a1OvavHj4aXKJHST8FsB/R4kGSAGZJRiS2dJnprMuR9/b5MtmRXscvHMG6Qtf7rmiuVk50w7SPOcV3hEm3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g57bSPk8mp4js75g+IUlOwMXroVDSlfYL+EhouJvoo=;
 b=cIdfD2B458XWYlG0MA7hJ9APU/CKXiKZg02l2TVN0h65zEwQswps/rNAwdCKIc4tuybZeNnnX8ijHty2+8NEmLu6gaBThfAncY7HULqaKPxHI1BzsUoiK0HxY+zROyFz1Pi6WNraOURNNraQ5jZVjzKrwQvnmpycBOllD1NVlVd4mGxenLUSt6KOCX4UrddKoloPK6daXngX/OhFKv/96HL6uQw72GLhtTmoj/Vo4Wy0Son6LUuibymHqx1HUDINnr45fii7bsgCN5jri98Uu6pcuQI/cQkJwejtjtzriLVzNIHRUm66aXyPwdYBUDX72PWnZws5IgAWjaHtGghEvA==
Message-ID: <66c92f54-f124-48c1-a419-4789bbf64c28@epam.com>
Date: Mon, 10 Jun 2024 13:30:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 07/16] x86/hvm: guard AMD-V and Intel VT-x
 hvm_function_table initializers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <25d4ade03f22ae4eb260af3eae5f48528f2e3ca8.1717410850.git.Sergiy_Kibrik@epam.com>
 <9255e072-f86a-4c82-90dc-9c41d11326fc@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <9255e072-f86a-4c82-90dc-9c41d11326fc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA4PR03MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 2658eb01-6ee9-4dc6-44eb-08dc89384d60
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SU1nWUdIS2RzQkpKMEsrU3hzS1Q1K0xPYWVCbzNoc2lFSnhEVDZzODd5UzJm?=
 =?utf-8?B?UWczamdxSXIzN25YaEYvSmZYY215UHp1T2dibXIxNDlQaStpV3lPdU5Ldk5r?=
 =?utf-8?B?SGNDU2FxN2lhNUhOYmJZaGNsYkJneWM2SUo3c1kxSEVPY1VXZlN5UTB4SlNJ?=
 =?utf-8?B?VjM1L0k2U0tUc0FLNGJlN2JLZWF2TTRmZnczRzlsc01OSFBwNlBEVjhuOG9x?=
 =?utf-8?B?RlY0d1Jod3dmL0VpZDAwV3FGVVJkaTR3OWVNRUI5aHlYaGVicWlMb3orc2Ir?=
 =?utf-8?B?YVU1cUVRNFVUZjI4Q2wrZ0Z0YXg0TlpGL1JpTzdjckIrUDJRS0lpekNTR1gw?=
 =?utf-8?B?KzdDdldPdktLMExMZjBRcmZhOG95Y2hSL0p4YTlXN2RzRk1TZUdrSDQwdm9T?=
 =?utf-8?B?cUpGY29GWTk1eFhWdjNod0JYMFU3a1JIUENtTFFFdnlEakN4aDNZTWNEaVFZ?=
 =?utf-8?B?OExmOE1iRWpSSzhEWHVJaEpYVTRWMkxMUDJJN1pZR2RDRHRvekRsYjNoaDdB?=
 =?utf-8?B?dDlGMU0yZDhlTXJXS0lqbTc4c2h1azNnYjFvSUc1bm82eGRIcmQxSm84anRR?=
 =?utf-8?B?cnR5OXNOelh4TnNURWEzTGFOVFZYa2ovaTBsekVIdjVpeHFKMGxjVUxqaFky?=
 =?utf-8?B?c255S0grU3hmOXRha0JISEJwUmZoNWFCTjNJUWFPdTFEL1NmSmxmb3VEMUJW?=
 =?utf-8?B?QkpmL00vRHFMMGJpd2hndzRUU2hONjdzazE5ZTl2dkxlWW9tZVErdFhvdWg3?=
 =?utf-8?B?a0NscHhlQ1BVZnQwcWtoQ1Rwd3ROcGptZ0EyKzV1MlNnNmdMK2RvSGtraXF3?=
 =?utf-8?B?VUVNT1lRZzBXUS8xTWRRTGhmd1NsTjlNbUhOejRrbVVhRTNYOEhBK201SXlx?=
 =?utf-8?B?MlF4VjFuNHRYRktVMDNFQ2w3Z2lzL3FQc1dGVDA4cUdwOVVDNklLUVNLTTFp?=
 =?utf-8?B?M0tCSENXdjBlSS9Cby9hSXZWWTBRbFpqU0EySHlZamNFdUpjcGVDalBya0Q4?=
 =?utf-8?B?cUtPbS9wV2dlRlpQR08rUEhoTzBRZUZpbnNtK3BCdzVYNC9ibktMTm9ZNmIr?=
 =?utf-8?B?MUlJS3hDSVdSOWZ5dy9NNUltVWl1dTVkT3Q3bzV5aFNwNmFLaXpndW43QnEz?=
 =?utf-8?B?MkpCRjluVUF2Yzhhbmk5RXErZEdqN0JUTmFLQXBvWUtIU3dEMmU3RlVpMEVl?=
 =?utf-8?B?NEJKSU9tVkdOczFlU0htaTFpeWNFRkhJQTZ5WHRRZlhOYVNsaStWbG5vYjRE?=
 =?utf-8?B?TmNMcllMQnlrZG5pUVVEd0pFTUVIWnJHZ1VaWDEzeXBjNFZlNmJUNGJ5bWN5?=
 =?utf-8?B?QVBGbWMzMmd4N25XZ2tCN2FzczhPaVRIa0VxaXQzQ1FEMnZsbW4zeDBnRnVV?=
 =?utf-8?B?Z0QzOWl2TjlLM0Y3S3BKeWtYL000YUQ5cFBzazdrYVJSOFoxbGhMM0xxRmU1?=
 =?utf-8?B?dk5Md1Z6dzJTUVBHcW5MSkZodVV1RlU0TFlXZ0pldkJMZ01VU3dvSTUzUHQw?=
 =?utf-8?B?TkQ1T3dBZXVycEt4bStMTHFZdTlab3ZVd3RWdmZ0YTAvQWQ0Z3ZLVjdpK0lI?=
 =?utf-8?B?bi9YdWt1Wm43YzhOVXVwQStGVGZlQXR3anJET3dOR2p6NTVKSnovdjFqWGRR?=
 =?utf-8?B?RmxWTDlkRGZGTWFCQUhOUUNZclVob000aXFFbnNEK2tvSTRzVTNoUlJyMVdP?=
 =?utf-8?B?WU1pKzQ4UTdWS1R0MUpkV0VHNjRHaTVSajZPTjhLU2EyaXdFUmxBSlhQWFdh?=
 =?utf-8?Q?n6hYTMSHwLV81GfVI5+hy2vqAwcnmrNxMyP5a+N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alpjV0Ezc2JIWXl6bk9IQnlFZnNQNjl4bWtnR1hhT204elYwQ3UvV2tLY3lW?=
 =?utf-8?B?TlJzaGxydkVhVTF2Vk9tRzdRdVRFeVpLR21qL0kwWXJKdG9EZDhIZlBCRmdm?=
 =?utf-8?B?bzdTOGttTnRRY29uQTBrMXlGYk1EWExaQ1dlUGdGdjVoSmNkK0JzVTJXdjI5?=
 =?utf-8?B?VEJXWDJMdWdubEIwT2FMSTk3azYrS3luWE5jVGlCTmRoajZjZnA0b0JTQzNQ?=
 =?utf-8?B?V3FJdzBJNS9qZFEyTWRPMEYzL0JXeDBlUHZ3ZkhYN2ZqbXZoSE9ia204MUN3?=
 =?utf-8?B?N213N1ZoaCtlYkR5d3ZLak5ORDNOdGNmelIraVNUd1dRNTY1U3NPbU1WazFr?=
 =?utf-8?B?bVBibnBsTW1HUnoyUm9EMmdqR3djTkp4U3FKdko0YnM1Yzkram0zYytmZEY5?=
 =?utf-8?B?NXdFZkZVRXMzY21YdVd3aWkweHkwWVBoa0lsYlYvUDhieVZ4NitBNWZNNHZT?=
 =?utf-8?B?NG9NUkVVTW92VjZ0azdSOTBMWlZDc252aGJWdGJjem9Qck8ydFE0L1E0QTk3?=
 =?utf-8?B?NzFTeU03UmRvQmhaVjY1b2QvYXNNdHE4VHpzakRzYmlDOWFxemRoNlk5TG9p?=
 =?utf-8?B?blBsSHNFa3dCU2JhbE9qUW9WcXhNYWZpZFdHSUlGN0FuNXhRSnJYdTV6dGlj?=
 =?utf-8?B?YytoZHpvNHNlNW1RYlplcVJ6djFueGFYOUNPdVRpKzhjc0lzMi9BQjY2VWFi?=
 =?utf-8?B?WDVxSlczMW1SSS9Hbzc3dFlNcjVlaXV2MVF6NFlFVVExQjNCZHZyaWl2ODE0?=
 =?utf-8?B?NnlsRVRnYlNqbzZVV3NPdXB0MDJ1d012NE1zdlVrWGZ4SUw1TTlzVmplV0ZS?=
 =?utf-8?B?cllwbU9Bb3h4MDdIQTY0dHh2eS9BeUh5SW94WnF6TWpObjlpbGRZNEx6RGdY?=
 =?utf-8?B?QlZ6TmtlZHJVb1cvZWNJZUlZbXorQ0kzT0VUTGRQN21GejZZMFVTRjYwM2x3?=
 =?utf-8?B?bHpMdHl5elo3MFE2SWNFcGxKMmhZWW1Wb05kcXpNRE1Wb3BzOS95MFNWQmJS?=
 =?utf-8?B?eitIdHlNV2loVnVyOC9jdHNrbUpOSUJsUE1sN1Nha2RWS0V4ZTNhNEw4YjZX?=
 =?utf-8?B?NVR3R1Z0TmJwcE9pSHRxZTc3L1NHaVVLTUxFRlg5UEx0b1UwWHpJTnRSYTcz?=
 =?utf-8?B?S2lHYmlia2FIUVJxWUI3bzhOd1hnMzBkSnhmT0dxUVl6S3JtdEhIZ2xyY1dt?=
 =?utf-8?B?ZFVKZlEzZm00RkEwMUVVMlBjd0lnT1U1aTdTcWxwZmV2UkROd1VoVFFOa20v?=
 =?utf-8?B?VjJsaU5WbGFrdzhlVHUxa2dQS2xvVjIyaVJ0RU9PcS9ZcEROR3JuL1NBeklj?=
 =?utf-8?B?Qlh4bHJUejQxVlZGMHhpS2N3TFUyWHVDdmV1a09tWGI3bk9QVDlvekRtVk1V?=
 =?utf-8?B?djV5YW05SzFOWTZyZzh1dURkY25NcTlyMU5iTGdRcmpiV3lic0xNTC9iRURU?=
 =?utf-8?B?Q0V1Nk95QVpNTXpmRWtDQ0dndEd3bWtzWnQrTWd2MWE0WVVUa0toZXV2a1I3?=
 =?utf-8?B?YytwV0hzZ3RFeHc0VkxmUmlRYzNZNERFNkhOcWEyNER4K2lVTEdHcjBJVXJH?=
 =?utf-8?B?Y0tQL2l2REY2NDFZazFkcnJ4WEZkZTJQdi9TUWVPdEs4L0MvaGduNk9iVWVD?=
 =?utf-8?B?Q2VRYUJxTlRMS1psUFpBVW5zb01idmZDbUpQNk81M0FtNTVZSXlCKzRueFF5?=
 =?utf-8?B?KzZ3S1lvMjhiQ0IzWitVZkdDaGhEKzc2MGhhZGMvdXNLKzZmQVorUjlDbmNh?=
 =?utf-8?B?UHV1WUFSSU5aeUxwRDZiWGJVNEJUZ2w1bWxVeS94d0U1SjBuWDdCSTNURlhO?=
 =?utf-8?B?SW0yU1A5RGI5clFxTHlFUXhwTkNKU1lUTjE0NGhsMC9zR0lVK3lPcTlzeWVY?=
 =?utf-8?B?Vm5mOGpSaEpBNWxFZ3JwZkpGdGUwRHNpK1ExMEsyTk5LQ1d0UDRxM1FoNXNR?=
 =?utf-8?B?bDNHdHR0UTgvWnlUb0Q3ekM4LzAxYWpNRXA1VG1qNDlYSTIrRitVZ29YR2pS?=
 =?utf-8?B?RnNlK3RqblNrTFdWb002d2lpc2VRdGlFK05NRWwrN05UMDN5SFdKSFJwSG12?=
 =?utf-8?B?d2Zpd2p1SXRTRVFjZitQTEFHSGtESEg4TVEvZ2hacmVwSmdMazczeTlqYkFI?=
 =?utf-8?Q?L91q2zpS5wB6B0O9WTQG9yfS+?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2658eb01-6ee9-4dc6-44eb-08dc89384d60
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 10:30:09.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3Adk2FUAgA6mys0qOGLfa7DO5oQty+thXP3TcUjagMgwv5l0712nLEt9aclLlZMffyeeN8WgAT3/aDRkydRMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6703
X-Proofpoint-ORIG-GUID: 6TUzi6UF7Ut2J30CGQJmb-F4pKx_wkbS
X-Proofpoint-GUID: 6TUzi6UF7Ut2J30CGQJmb-F4pKx_wkbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=813 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100079

07.06.24 11:01, Jan Beulich:
> On 03.06.2024 13:20, Sergiy Kibrik wrote:
>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Since start_svm() is AMD-V specific while start_vmx() is Intel VT-x specific,
>> any of them can potentially be excluded from build completely with CONFIG_SVM
>> or CONFIG_VMX options respectively, hence we have to explicitly check if
>> they're available and use specific macros using_{svm,vmx} for that.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> yet again I think this could sensibly be folded with the earlier
> two patches.
> 

sure, I'll squash together patches 5,6,7

   -Sergiy

