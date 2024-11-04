Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A529BB4D5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 13:42:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830011.1244931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7wPT-0002Pp-5t; Mon, 04 Nov 2024 12:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830011.1244931; Mon, 04 Nov 2024 12:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7wPT-0002NP-3D; Mon, 04 Nov 2024 12:42:19 +0000
Received: by outflank-mailman (input) for mailman id 830011;
 Mon, 04 Nov 2024 12:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8uZz=R7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1t7wPR-0002JZ-ID
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 12:42:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2612::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37aeaa63-9aaa-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 13:42:14 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB6689.eurprd03.prod.outlook.com (2603:10a6:20b:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:42:11 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:42:10 +0000
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
X-Inumbo-ID: 37aeaa63-9aaa-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjE5IiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjM3YWVhYTYzLTlhYWEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzI0MTM0LjM2MzcsInNlbmRlciI6ImdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kejKqSRCUYB6iMaS/KXf2DLjEsPxQOxuwjWmtT5QW1MRbpVmBjhy2Zp8DWi1lNUhjinZiDWovw58Py7fnRtCTtup7/xZrXQtOb2vGLBn7TOfxACMXm/jDljT3Il3CMmsNNm6dzz2wzVkiwn1nzH4BRGC5qCVebXkfmvJbf4drktqynNIg1f1Eog2P7dnKrESO3yjbQP7H7FeGYEeNHTPGOq45Yp12Nx0WD4gu0g/suRtnwzh5LM80FIMj8qUAe9djncJdHdkgz40jK5hi23hs1iSCfQEA3voPDBSqgWxG1CbnpVlMuSftzG5OpdKTziq7q7Rsc1o0t7HeDMSks62Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP13Dwz0SCtMJRUD/6GoyjWSaGYAEFGDz52m02gHDfI=;
 b=YgiFDoHgSeot7vE6cmAIeCD8ru6eIxd4m4t0TY77Ao40pxRFxaEyGkS0nwRdlcQAHK4Sqhssy6PMp5R7XZZrPsISIepPhy8QdYOd/iVowSWm/eDpNuGKeAyanNtaGCJyVBKQ0iCJd63GJz3F/0kt1/Uuv1tCziDlMeJkM0/W9JwQRBAyxAxCKG+fQMEN0i/yMgOZj15grOrmBSTNfeOG+V2TM8nTXg4Ei4wxvg3PFdGB0epADIoRrgDKVLuXVAV04AekOWS6U0n0znucPkIgV39ze/AUdPGD6mS5gkjH+jwhzWXDZ5DRLN0tnQmxa0Tm2aUNM5mXkfvDS+xR9Ar8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP13Dwz0SCtMJRUD/6GoyjWSaGYAEFGDz52m02gHDfI=;
 b=vYnDn8wdg5UMor13cLmWjrL8UOG6JBWK8FQygZ+gnhG4PTIViXwwXh7W0YYY7MwlQKwE+93HDIEWyQGf6Xx6TR8EpH0jPEcwnjRz8erByJ6S/0rCX5akSOctEFoOl/2W7n6qrQykuHHZWDIC4F/VT/R9ux62JLAMHjCZAI+lyP40Jw+3nBAUvbHZOv91JhzbzMbbWXqNrznnr0fTHl+zGhDffCDjXFZdyQ+Sjo1eEYVu5zd24KF556o7BUaECmM5kJK3jSM1RBcrJat7VV+s6umrWrQ10CfYoH8GDbqAoeAGGWVWpIymRUox0qdDjQO9IqbuXZwJwUdxLFi5xcvNZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e951c088-7b6a-45c9-8205-854e84d2c0e5@epam.com>
Date: Mon, 4 Nov 2024 14:42:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries
 overlap reserved-memory
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
 <1ae100b3-17f0-4ac5-beb3-fdd2f12adee7@amd.com>
 <a127edbb-8006-466d-a529-1b7a80af21b1@epam.com>
Content-Language: en-US
In-Reply-To: <a127edbb-8006-466d-a529-1b7a80af21b1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bec48f-19d1-48ce-a3e7-08dcfcce19d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFRTOVoxMklSYnAvbFdiTjNDeDZSSkFQcEROU1pCWmpPM3Vub2JIQ0VOUFlq?=
 =?utf-8?B?VTFibEV0SDVOdWZFSVlXN2IxQ2RaNW9hVlVCYmVNN2ZGL2FqU3kySlFXQ3Fy?=
 =?utf-8?B?RFRMei81TUVxUTFvcmc2OFBQU0x6TFlabVUrRU5VUW1zOTRTejlDbkhpN3Qv?=
 =?utf-8?B?a2ZkM01YTU1pRTBUdS9Da1habDlXMGN6VlZmSzZtWFcxVDlGR0F2QlowRkZp?=
 =?utf-8?B?c0FEeDZSWXJOb01pV1hwcmlwUHZiY05ZNXlSdE9OdWE3SDY4OUFPZC90aHN5?=
 =?utf-8?B?RUg3aER3cndnMlQwcVUrYmdQVExKN1JkNXpBa2x0czZtNkFsNnBPdTA4Q1lV?=
 =?utf-8?B?cGtsaisrUWJaNFAvMTQ5TkU5QmlYbVo5QVlrek9ud282WDgxUWs4WXRqWklT?=
 =?utf-8?B?Zk5yY2xmbHUvMUFiNEFiNTR4NXpwNlorMjh5UXJ4eU9jazI5NHJhNXRZMDcw?=
 =?utf-8?B?SnpXaUNjcW9WTC9Fc1BPaDNzK0gyNE5TUEVzdWpKWGN4TFBLcUQ4NEFZM2tF?=
 =?utf-8?B?N1lCaVpkSTNzTVF5YnZLMEh4ckR1SkhnMDk0UmM3Skw2MmdxSVpXTkZxa3Vu?=
 =?utf-8?B?b01aTEIyRFd2ZlpNeGZuZCtMd1JjTEUvYUVyVzVDTkJlY2JJbHZ6bEZ2UTNk?=
 =?utf-8?B?R1dTS01NZWdRQVRPZE0rWG13LzNKOFdIa2tVTXZJQjk3MjQ3WWNxak1LRlVL?=
 =?utf-8?B?cVdYQS81NTA3VitCRzhPWHJSK1I0U1BiS3AzMHJZblhjZ1RpeWpnQ0lMbVh0?=
 =?utf-8?B?bWRMemR2V1VjditnUm5qcGlpSTFqVnF2aERtVENzQmxQV3FpQUJQZWpvUFpC?=
 =?utf-8?B?MzN0Q0Rzd1hOT3picEZuRFh6WVozU09lY3BkSU1QTUE1VVlwRzlFTTRVdGt2?=
 =?utf-8?B?RUVwQWdoN2Z5V2IzclEwRlJvekhqSFBHY0djb0RpT2JvQldES1VKeGdXZjZB?=
 =?utf-8?B?ZXlJSEpjMmVVQW5tV0ZHcys2RVhsQVV5Ymd2WGJFb0dIYjNVRUtidTFHT1N0?=
 =?utf-8?B?VWxnWTNIVVJaWTNGY3ZYSmxvVmR4VVJweTdONGIwMk1kTndVMGU2azBGNWxm?=
 =?utf-8?B?VW9mc1BDYldDRlc5YTNvY2lsVlIxbis1djl2TE0ySlhremlhRFdFSFBoNzdn?=
 =?utf-8?B?ZXZ3Uzc0bTg4dkxGQlJHWFNFMkM2dW5acm1vM1AwWGtNd29HNElsdUFaOG14?=
 =?utf-8?B?dEI3dG1mTmxhcXBXNDNNNG9GOWhaNmNCRFo1VmpsYXVieC80ZDhRUkVvVU1n?=
 =?utf-8?B?WnJSRmxwd2FrVEo1ZDNDODk1N1JoSGYwUk9ZWnJ3blVqM3RXYlBrQjJKZitM?=
 =?utf-8?B?U1hzMG1UdXB0ckpGTmJ0TUNnRWpkZDJEYWFPQzZuNGttLzVPcVM5Y0lWTjlk?=
 =?utf-8?B?ckd5d21keUZybDlKbFF5ZVVXMWkzQlRFVmtoc2hTNEQzMS9PdTFjaU9rY2NU?=
 =?utf-8?B?c0VGeVp5QjdvWk95d010bGNqdGxoTzRTZWJ2ZXVBME1VS095emlLQVdGMzJs?=
 =?utf-8?B?c09IZjlaZU94RThNeHVvQmV5VTliVk5qdG1jZGZEbHRKUXpVUThWalRWcTlE?=
 =?utf-8?B?bmxyRUJaMkVWYUI1UlVrZFU1QjlEMEE3OFRHSFU5RkJqTU9sTkxSaGppZ2Yy?=
 =?utf-8?B?RjJScWNtblViUnFDR0E0UkhneUkvNlZJQkp0QkVueXdpWm1xRWNjbWVrRW9Z?=
 =?utf-8?B?S21zL1FtTmJOcnR3RmxnYXpIQTFhWjY1SHE0UFo0QUcxTlNwQUF4SEdxU2xv?=
 =?utf-8?Q?nOKq2Gz1ivPVIMvhNs9zXDKDS5eH4zxZm2/REaF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejY0RldjNUFXMGVZZkVjZFRNUTJod1NQc1g2WVJWbGM1S25sY3V2bHpOMFRX?=
 =?utf-8?B?NWhDbzh3a3RFTEUxRnhOQTV1Mk1CY0EwOUNRd08zK2N1Y2ZqVk1wQWc1MSsw?=
 =?utf-8?B?R0poOTlPRlh2dzFKMkRGSmdNVFdiUE5IdmVtcVRVSWJyM2lFbmdmOEx2UnR5?=
 =?utf-8?B?S2xjM2xQdVZQQUdXL3FtSVNVZmZjUHliT3FaVEIrSmJUaFZPSS9xWkFPaFFZ?=
 =?utf-8?B?ejkxMlpveTZ4YmZlTmdFT2J3ZWtjRys3Q2NPejl3ODgrdzBjbkRwYTVlWVFE?=
 =?utf-8?B?UXQxMnllT0tadHIwc3lMVGZxWlU5d2pndDluaWNQSFJWV0JQZGd0cEdObU1D?=
 =?utf-8?B?MHh5bTN6NlJFeTB1YzIwOTA3T1g0cTZOWHhaZnBBT1BYaW15YXJJMS9MV05R?=
 =?utf-8?B?SlVFNVFVbmZxanBreHBLSTlYWkM3NkwzMS9PQmJaREdONlh6TFFUdnllekVz?=
 =?utf-8?B?YXVheDNKdmpHNTh4TjVGOFozSm8yK2lDZ1ppNlVWdzlwRG4vZmsrT0ZlSTVT?=
 =?utf-8?B?WEtYbGlDZWU3Y0ZRZXRydUdCVW55WmVXQS9nSEtjaTRVWlo1Z1NRMEkyNXFq?=
 =?utf-8?B?aUhHaXdOR0wwZ1N1ZTNjV01mcUMxU2kvcy9DUSs2ZFh1L2dVYnFGeXVYZEtm?=
 =?utf-8?B?RkNrTE9za1FSbzQ4TGUxVWR6WUhFS09vTmNhZit4cmx0ejZYNm9hT3JsWloy?=
 =?utf-8?B?UkhaZml1Nis0WjgwQUdQc0VzVW1BU3R4eTBvcm1ZM0VtMm00QUNmRUkvNU54?=
 =?utf-8?B?Vmp1a0gyeVNTdzNhdVFEL3U3YnBZV2FRVlRHcGQ2eVAycUxieFFzcHZpTzdB?=
 =?utf-8?B?c1ducE5KaXVzUGlQYko5NWlvTGZNK29WWCtNUmZwTFl6Y2tBbXdYUk14T0xJ?=
 =?utf-8?B?QkNGNEtYQ3dRa1NhbHhsODdkVW5WRSt4ZFhiOG80bVkra3hFbFZMLzlKZFN6?=
 =?utf-8?B?SmVvWXNDMXh3bVNHN1lMaGhNbmtvYjRBb0ZKTTdqZTZEdUxBT2pIblhtNERU?=
 =?utf-8?B?VzhXWXk5UWZ4aDl2alFwZ3BqMXVsbUZHTEp0VUVFNE1kajNyZ3E4dGNidkhH?=
 =?utf-8?B?enkyMktaUXZ4djl3TzA0MWw5dXIwTThJbjlrQUgyby9GYjdlRGIzTHc1YVhN?=
 =?utf-8?B?MlcwOGNOWmpnd3pSRXRwZ3IwNmN3UnV2RHM3NlFYMVo5WUVncVArNXBaRDFN?=
 =?utf-8?B?ekw1MUk4NVFSampCNUsvb1lxUlV6bnl2aXVxRm9GRWxGQkdVd3FjVEJSTDl3?=
 =?utf-8?B?bjF3czRwMFJHelBKbVFwdWhNczMyczhHclAvdzJpUndIWG1HY2NHTXJMZjh4?=
 =?utf-8?B?VHhUNG9MWElUeFUzNmZnVFh1c01pRVZDTTYrbHZjYTArd2J0bGlJY040NUlZ?=
 =?utf-8?B?UjFrQjVQcDFpaStzYi9LSlRKb2RUMkJ0Q1FiWnRwMXdFVnpqckNSQjJycVFn?=
 =?utf-8?B?azQ2R01UMnEwQ1JlamI4RlZaeUNKNzJFR1AxTzlZOUtaY2hscFVwZkh1L1lZ?=
 =?utf-8?B?TUMzMHdPcmduSkNHRkpBeGgrVFRscFpEQnF0Und0M1Q3dXRFeEhRQmIzRDdV?=
 =?utf-8?B?bEMzMXpxM0ZGR3A2blBMN08zb1h2aFE4c2NlTDZMbUwzenNpN1IzbnRieUR6?=
 =?utf-8?B?RjZ4RFNZaSswdEptWndETCt1N3h4a0pTUFptZkIzajFrRHRnMjdxZlZYc3A0?=
 =?utf-8?B?OGpVWG1Ta0VrN3E0MVpsS1NJSVdwV0pCM2Y4V29jeFRPc0RBcXRZdzZUbmFi?=
 =?utf-8?B?elpKSmZBVEVoQUNtMllPTWM5Q1liMnhTcndnSkg1bHVHVnVvTUdobHpVUGRV?=
 =?utf-8?B?a3pVV1RsRDBFUVFRN0VCWVFVMHNUTlU2dm9aSVkwMVZHRlNjMFRQbVBmd1Ja?=
 =?utf-8?B?ME5IQjVLRVNlUkpZZlkyMGYzdWpoZ21NbFpBSVpJZ1RYa3E3MFJZUU1iT0hi?=
 =?utf-8?B?VlpJT2NVVW9lVUl3ckxaUGVUbWpLY280L1BrLzFNbjkrWC8rKzR4UTRhR2Ro?=
 =?utf-8?B?RlppQjN3MHJjRml2dHlkTkZMUUxzNjNvbUU1MUhnQlhjWVIyMTdaNFdnOUxV?=
 =?utf-8?B?eWYxbVN6dXZwYzVoS2NSSmRPUG5FNy9SWDZyVy9zSHdNY0NmQlMyaHBPSUhk?=
 =?utf-8?B?SnYwYmFncnd0QXNTRUdiUlUwWG9EV2NCWWQyVXB3bDJ0TmZRN3JxbDQzQTYy?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bec48f-19d1-48ce-a3e7-08dcfcce19d5
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:42:10.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DaIkQwSN6/ADhktI3gh/PLdDlVcBn5H2ThbybycSnX37s4KFBrYEy+J1YU8VJlk5eEujioLC1c7POlwL9Mwxvp5fyN3u0T+wgRa6J+Sd80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6689



On 04.11.24 14:39, Grygorii Strashko wrote:
> Hi All,
> 
> On 04.11.24 12:49, Michal Orzel wrote:
>>
>>
>> On 27/09/2024 00:24, Shawn Anastasio wrote:
>>>
>>>
>>> Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
>>> bootinfo.reserved_mem") changes the way reserve map regions are tracked,
>>> and as a result broke bootfdt's ability to handle device trees in which
>>> the reserve map and the `reserved-memory` node contain the same entries
>>> as each other, as is the case on PPC when booted by skiboot.
>>>
>>> Fix this behavior by moving the reserve map check to after the DT has
>>> been parsed and by explicitly allowing overlap with entries created by
>>> `reserved-memory` nodes.
>>>
>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> ---
>>>   xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
>>>   xen/common/device-tree/bootinfo.c | 11 +++++++++--
>>>   xen/include/xen/bootfdt.h         |  3 ++-
>>>   3 files changed, 34 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>>> index 911a630e7d..2a51ee44a3 100644
>>> --- a/xen/common/device-tree/bootfdt.c
>>> +++ b/xen/common/device-tree/bootfdt.c
>>> @@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>>>       {
>>>           device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>>>           if ( mem == bootinfo_get_reserved_mem() &&
>>> -             check_reserved_regions_overlap(start, size) )
>>> +             check_reserved_regions_overlap(start, size, NULL) )
>>>               return -EINVAL;
>>>           /* Some DT may describe empty bank, ignore them */
>>>           if ( !size )
>>> @@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>>       if ( nr_rsvd < 0 )
>>>           panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>>>
>>> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>> This should be moved before fdt_num_mem_rsv so that the program flow makes sense. In your case nr_rsvd is
>> not used immediately after.
>>
>>> +    if ( ret )
>>> +        panic("Early FDT parsing failed (%d)\n", ret);
>>> +
>>>       for ( i = 0; i < nr_rsvd; i++ )
>>>       {
>>> +        const struct membanks *overlap = NULL;
>>>           struct membank *bank;
>>>           paddr_t s, sz;
>>>
>>>           if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>>>               continue;
>>>
>>> +        if ( check_reserved_regions_overlap(s, sz, &overlap) )
>>> +        {
>>> +            if ( overlap == bootinfo_get_reserved_mem() )
>>> +            {
>>> +                /*
>>> +                 * Some valid device trees, such as those generated by OpenPOWER
>>> +                 * skiboot firmware, expose all reserved memory regions in the
>>> +                 * FDT memory reservation block (here) AND in the
>>> +                 * reserved-memory node which has already been parsed. Thus, any
>>> +                 * overlaps in the mem_reserved banks should be ignored.
>>> +                 */
>>> +                 continue;
>> I think this is incorrect. Imagine this scenario:
>> /memreserve/ 0x40000000 0x40000000;
>> and /reserved-memory/foo with:
>> reg = <0x0 0x7FFFF000 0x0 0x1000>;
>>
>> You would ignore the entire region described with /memreserve/ even though it overlaps just the last page.
>>
>> The problem you're describing is about regions that match 1:1 in /memreserve/ and /reserved-memory/.
>> Therefore I think you should check that the overlapped regions match exactly.
>>
> 
> I've also discovered an issue with Commit 53dc37829c31 ("xen/arm: Add DT reserve map
> regions to bootinfo.reserved_mem") - the bootloader adds Initrd in
> FDT reserved map which then conflicts with Initrd module (ARM64).
> 
> This patch, as is, doesn't fix an issue for me:
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000084000040-0000000086152ac6
> (XEN) Region: [0x00000084000040, 0x00000086152ac6) overlapping with mod[2]: [0x00000084000040, 0x00000086152ac6)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FDT reserve map overlapped with membanks/modules
> (XEN) ****************************************
> 
> So I did fast try of Michal Orzel suggestion and it seems working for me.
> And if it's working for PPC - may be that's it (feel free to incorporate). Diff below.
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000084000040-0000000086152ac6
> (XEN) RAM: 0000000048000000 - 00000000bfffffff
> (XEN) RAM: 0000000480000000 - 00000004ffffffff
> (XEN) RAM: 0000000600000000 - 00000006ffffffff
> (XEN)
> (XEN) MODULE[0]: 0000000048080000 - 00000000481ec000 Xen
> (XEN) MODULE[1]: 0000000048000000 - 000000004801e080 Device Tree
> (XEN) MODULE[2]: 0000000084000040 - 0000000086152ac6 Ramdisk
> (XEN) MODULE[3]: 0000000048300000 - 000000004a300000 Kernel
> (XEN) MODULE[4]: 0000000048070000 - 0000000048080000 XSM
> (XEN)  RESVD[0]: 0000000060000000 - 000000007fffffff
> (XEN)  RESVD[1]: 00000000b0000000 - 00000000bfffffff
> (XEN)  RESVD[2]: 00000000a0000000 - 00000000afffffff
> ...
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000048300000
> (XEN) Loading ramdisk from boot module @ 0000000084000040
> (XEN) Allocating 1:1 mappings totalling 256MB for dom0:
> (XEN) BANK[0] 0x00000050000000-0x00000060000000 (256MB)
> ...
> 
> 
> ---
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index f2e6a1145b7c..10e997eeca8d 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -124,6 +124,30 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>       return false;
>   }
> 
> +static bool __init meminfo_is_exist(const struct membanks *mem,
> +                                         paddr_t region_start,
> +                                         paddr_t region_size)
> +{
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, bank_num = mem->nr_banks;
> +
> +    for ( i = 0; i < bank_num; i++ )
> +    {
> +        bank_start = mem->bank[i].start;
> +        bank_end = bank_start + mem->bank[i].size;
> +
> +        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
> +             region_start >= bank_end )
> +            continue;
> +
> +        if ( region_start == bank_start && region_end  == bank_end)
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>   /*
>    * TODO: '*_end' could be 0 if the module/region is at the end of the physical
>    * address space. This is for now not handled as it requires more rework.
> @@ -154,6 +178,29 @@ static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
>       return false;
>   }
> 
> +static bool __init bootmodules_is_exist(struct bootmodules *bootmodules,
> +                                             paddr_t region_start,
> +                                             paddr_t region_size)
> +{
> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, mod_num = bootmodules->nr_mods;
> +
> +    for ( i = 0; i < mod_num; i++ )
> +    {
> +        mod_start = bootmodules->module[i].start;
> +        mod_end = mod_start + bootmodules->module[i].size;
> +
> +        if ( region_end <= mod_start || region_start >= mod_end )
> +            continue;
> +
> +        if (region_start == mod_start && region_end == mod_end)
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>   void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                     void (*cb)(paddr_t ps, paddr_t pe),
>                                     unsigned int first)
> @@ -201,6 +248,37 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>       return false;
>   }
> 
> +bool __init check_reserved_regions_is_exist(paddr_t region_start,
> +                                            paddr_t region_size)
> +{
> +    const struct membanks *mem_banks[] = {
> +        bootinfo_get_reserved_mem(),
> +#ifdef CONFIG_ACPI
> +        bootinfo_get_acpi(),
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +        bootinfo_get_shmem(),
> +#endif
> +    };
> +    unsigned int i;
> +
> +    /*
> +     * Check if input region is overlapping with reserved memory banks or
> +     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
> +     * shared memory banks (when static shared memory feature is enabled)
> +     */
> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> +        if ( meminfo_is_exist(mem_banks[i], region_start, region_size) )
> +            return true;
> +
> +    /* Check if input region is overlapping with bootmodules */
> +    if ( bootmodules_is_exist(&bootinfo.modules,
> +                                   region_start, region_size) )
> +        return true;
> +
> +    return false;
> +}
> +
>   struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                             paddr_t start, paddr_t size,
>                                             bool domU)
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 16fa05f38f38..b8db1335be6c 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -159,6 +159,8 @@ extern struct bootinfo bootinfo;
> 
>   bool check_reserved_regions_overlap(paddr_t region_start,
>                                       paddr_t region_size);
> +bool check_reserved_regions_is_exist(paddr_t region_start,
> +                                     paddr_t region_size);
> 
>   struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                      paddr_t start, paddr_t size, bool domU);
> 
> 

Sorry missed part of  the diff:

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 927f59c64b0d..18816b6f08f1 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -586,6 +586,10 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
  
      add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
  
+    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
+    if ( ret )
+        panic("Early FDT parsing failed (%d)\n", ret);
+
      nr_rsvd = fdt_num_mem_rsv(fdt);
      if ( nr_rsvd < 0 )
          panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
@@ -598,6 +602,9 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
          if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
              continue;
  
+        if (check_reserved_regions_is_exist(s, sz))
+            continue;
+
          if ( reserved_mem->nr_banks < reserved_mem->max_banks )
          {
              bank = &reserved_mem->bank[reserved_mem->nr_banks];
@@ -610,10 +617,6 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
              panic("Cannot allocate reserved memory bank\n");
      }
  
-    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
-    if ( ret )
-        panic("Early FDT parsing failed (%d)\n", ret);
-
      /*
       * On Arm64 setup_directmap_mappings() expects to be called with the lowest
       * bank in memory first. There is no requirement that the DT will provide



