Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC269BEFFB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831113.1246278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gsW-0008Hw-MH; Wed, 06 Nov 2024 14:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831113.1246278; Wed, 06 Nov 2024 14:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gsW-0008FP-Ir; Wed, 06 Nov 2024 14:19:24 +0000
Received: by outflank-mailman (input) for mailman id 831113;
 Wed, 06 Nov 2024 14:19:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMU+=SB=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1t8gsV-0008FJ-LK
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:19:23 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cb677cc-9c4a-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 15:19:19 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB6944.eurprd03.prod.outlook.com (2603:10a6:102:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 14:19:17 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 14:19:16 +0000
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
X-Inumbo-ID: 1cb677cc-9c4a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6YzIwMDo6NCIsImhlbG8iOiJEVVpQUjgzQ1UwMDEub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFjYjY3N2NjLTljNGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTAyNzU5Ljg4ODgyOCwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvtisC0etbqMc0SzSafOdUqEECau8i0jo1KxUEnf0NaD2Us40y7Uh6JzmpzK0aAQi60RsPM99EPQETR5tc0nGwYGOtTYfT2Ekr42TEfi1uPkJ5Tots4IqiYAuw38jIVH55bRGsQhrVM4Zk2HUVh4PvHn/3Qd2ZXAnKV5wj10JasNwqk9LXeakGntC57lUkCMn2NR9SrIPBc8Z0z0Q5D74E/Ong4leGbQcc+H3l9wRKY0Z5llf9MiO+T7m/8NlKM6LDmbiQFQ8/xmyM+xUHAygpOEZpJ/KGl35MLDGPvlR0hKN0AYDvTtGR4Uqmc3POtZ+WzB04V0sUG8ezN7LtZYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1dAccebykuxnKhJ6CqD4TxswwzD4ENLzUsm4zKB5B8=;
 b=pZ/tPlTV7zohdvIqbilo276mYk+4bQQ5iRhMA+gbzr8Efv0UNpxyGT7qf4gEgKHpe8dA7tLVPlEFGl2BiuLUYX6amzc/BTL7Do9xoWrNamkdnbRQc5QxXbfFWoYD0467KqgM8s2GCGeIVgOM9GgwMmONTKoakWfgPozpZyG0m/28seVewG5fGnYkjIDSJep7SGJllOXK4FdJUl8zVOFNE3d5X5IMfuY7kMXFssFRJifpKfck3MWYVlMHohwVzrE3b/kFEhWWooUtWiSD55aClrT9N5jn1HV5PlV/YydYMERX/YF2chX7PTPgxpcAOVvtkrzMEz4FxUBTaVZU4tUYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1dAccebykuxnKhJ6CqD4TxswwzD4ENLzUsm4zKB5B8=;
 b=e/nQ1T855/SVPAiK6jRMYXz9bnXfqZuz9QTdrt5Dte7KySHgL+jyRDmz3Blh4h3gnTv3QTe9skhlJ+HvHIxQe6tDkaqZd34xwAieVoA3R9YO0cDSSM82taGpz65y62cv2xjBw1clJqfQRhJdjUWpOJtbXLQJjf8leDiltzRPG1gNJdu7hPZTIV9ZP8caVu2QnNUA46Lj2C8yxwzUnDQtBXRuO3N6sDKVvxRRWNcioRbWD09rEO0JyJ2rLIarVkkEcOoZxAG5MG4jLvgJUY25uPz/WDn9kFMLJ/iunGGH+3OaT0BODX7SqirpKlbw4BCPo/z5VSK6n1qY9VLu2nmAVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1175a6a0-9eef-4029-a7c0-e07d15b0aa76@epam.com>
Date: Wed, 6 Nov 2024 16:19:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20241106134132.2185492-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 57905e91-3c8a-442d-1449-08dcfe6dff41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlFNY01DblFQNFdTQ3QrMVFpT3NkdCt0M09iQlZMQW9PKzVZY1liOVV5RmNz?=
 =?utf-8?B?THdDRnZWSjlpTGhWWjJ4bHpHdDRsbDFBbE15bmZSWkJnRkZxbEJIUitCM2Vo?=
 =?utf-8?B?MEtuMXNvN05kMU9samxLSmdtWWdyQ25xS0NwVkFhbEc5K3ZqckZmcW1IYldl?=
 =?utf-8?B?MWJhSmpHTXpOOE0vYUVoUkFxeGZCVndsMVBzdmQ4UDhDREFRajZPTThTQzhU?=
 =?utf-8?B?R2pBd1VnK3FkVjA3eTY2RTJzdWhqWGY1cWxSem1ReUVpNHdMbFhMbG94ckVL?=
 =?utf-8?B?WUNJYVlxSHhoNDA1Snl3b0hqNG8zN3JMMk9MeWg2VFFqS2lPSVZTOFIwU1p4?=
 =?utf-8?B?RzFxL2tYVEthK2hIOVFZYXJzdFZoL2g4QjlZcjZrWXNnUGhudUdCY3VLQUJC?=
 =?utf-8?B?NmlNU0FrNllidG9YSERRdGxvaXA5TjRoMEtyQjAzZmIzWlNoQ29OM0VJOUdp?=
 =?utf-8?B?bmpXZGxaaFlrdDVLUE1SNWU4UzhoSlN3OWs2dXlXSVgyNVJWWU5iUlZQTitJ?=
 =?utf-8?B?dVQxRUhYYzcxSitLbW9MZHNydzM1bmdxdjBWQStBeHYxRXVucVl5bFF5bEUr?=
 =?utf-8?B?eTc3L29zZ1JzWUxVZWRGaFBMOXBpVUdrSklsSGpzdHhZWW1DNmVXWEQ4c1Vx?=
 =?utf-8?B?ZENEUDZhZ3kwUHd3Nk9NRnhzQTVEWkcxdmlGdE9rY1NaT2xYY0tpcUpsUU1r?=
 =?utf-8?B?eWszUzRLaE5tT3dwZlBUWkJtM2ZUQUlxczdiWjE3ZFh2dUR3aytzQ3h6TW85?=
 =?utf-8?B?RVR4T21wNWcwOWlsbEN2YWJUcmcyeTVvT2pkWEpWb2ZaY0xZZHRKcUVyQlNX?=
 =?utf-8?B?QUZYMERZUTZRZ1FTaWRWRjV0T01KREdjU2xDZWpRZ2htZVd4eGlkVUVJOS84?=
 =?utf-8?B?aHd6TjJHaFE3dC9pQWRrYzBEZXhFQTMzYnNaY0NWaEsvcldkM2I3eXJRaDBW?=
 =?utf-8?B?bUNTcmFmTXQ4UlRmSmlOZ2pCTGlBZ1hVRDc2dkdCZk52dGt6bHh5V2ptRGxW?=
 =?utf-8?B?QTk5SDYzRVNWNWRxU0E2dnlWcGFVZ3Z0d3pLSnZvaTJOMkpVS1VKeTlXV0J0?=
 =?utf-8?B?ejRFT2RWNFM3cnllckQzUnk3Vk1raGM4dVk3Sm9lNm5UVDhxOWZSNlREWHlZ?=
 =?utf-8?B?b2tISWRwWEoxVkpsaFZJbUlEbW90R0RrRGRZelJLWGFhbE5PelZhQTVtd0dj?=
 =?utf-8?B?OVVxM2xvRDd2TTgxZXBoYk1XQ093cnh3L0MxQjYzSk1sL2FjbXJ5ZTVRbE9P?=
 =?utf-8?B?b3Y3ZjRJQUVleUI4dVJWT0lvRGZTNXR1T2xnM0VqOWp4OC9vcmorcDgvcHJh?=
 =?utf-8?B?TzFXS0p5amIxTHcyV3czVWFIcnlEemFZZk91bVZKS2pySHhMMndaYmh2R1B3?=
 =?utf-8?B?ZFMrREN1NGhEOG5yYTlqWWRXOEVrcy9IR2hlMGxQamZzUnZnaDFSUW10TmZu?=
 =?utf-8?B?MlNlY0tWc2NaY2hXSUJkRGVkZm5HWWNIUkR5clhFL0JSZ2dzSG9ndjhkNGhI?=
 =?utf-8?B?ZjZHYktXNk56RU40eHloS1BqQy9QZ0lMaE9hdDVBNTNuYkhWSUVkc0htMDdz?=
 =?utf-8?B?Mk9lQmNRMDZUSksyQ0t3MTdqZklpSkVQVDVPMXRqL1grMk9SK055UFdQMXZU?=
 =?utf-8?B?TDd2WE9XdS9ucCsybWswRmZ3bXp1cUpzcGYrU1Z4YWxiR3E4emhQb3pSY0g0?=
 =?utf-8?B?U1oyc09ZN2pxQ1RPKzE2T0orUHk4N29QeUMrRlc5MHZjWVZ4WFRuZGRzV01v?=
 =?utf-8?Q?mQjwq8OQn1vOaE7oiQE9b58Jm6y/CB2r3b0DXFi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2c0K0dnczdib3BtMmpwWE5ub1NlUjNsVytLdXQzbDZJQWZ1c0Z6ZGtkdCty?=
 =?utf-8?B?Y3JHeC9Jb0MvSU5GSllEOWdLWGQ2QTBMc3JMRjdXdHRhR25mNnQ3bTBsSm40?=
 =?utf-8?B?dVFTeVZjelNtclFtZ1JwQTF3cXY5U2FWYUZyQ29LM3A1NjVHb3paL05nUCtQ?=
 =?utf-8?B?VzJTWGZvcHhEeXlzZVB2Y29Eb0NSYmdUVjVTanZzVkJMSzdVR1cvNlRuL3Zp?=
 =?utf-8?B?NkJDRGZoMTlOeXB6SUVBa2lLQTFmUmg0UnYycnp4V0pGdm4wME90T3I3SElj?=
 =?utf-8?B?YUZ6d3FNKzdnZDBScFM0ajM0KzVYT2N5U2lzTXVCK3BiNGk3Q2xseVJwVG50?=
 =?utf-8?B?WHJWa0VPSy9DMzlOS1RSbXptdXA4RjlzRTlyaTFLVkU3eGo5N0NUWjFTVXVG?=
 =?utf-8?B?a3NkVGhRaXlVNjdNdXEvbEd0bVhUVnNvT01oSGNidzZmUitNTDdyRWFrR3NU?=
 =?utf-8?B?aE9zNnBDVCtLdm8xU21DSjlDeHc3bjZ5WW80V3l0cFhXdTVRWHhKdUM5RjFx?=
 =?utf-8?B?aG9BZ1lEK0VMNlpxSk5oNjBaTnJKRG9aWi9xUHhSdkxZSE44dXdUQ1JDSVNW?=
 =?utf-8?B?SU1lS1JYa1kzbFBVeHhQc09zRjd0UDkrTG5ZQk1oN1kycGcra0xSYmdRa3Fx?=
 =?utf-8?B?QmJLU3MwYjhoQ1QzYml4ZGFMRitSeStxMkg2ODd2TTJ6VW42eWpCbkJ4a1Vq?=
 =?utf-8?B?a2xVR0FKSGZWdys4L0VPU0ZOeHJvZEdSOHo2bFk5N3hMcTZjYzZTQmJOMEpm?=
 =?utf-8?B?VVBzaDlqaHB0YVRyc1hEekt3bENRUVVMbGFxLzFjb21jWG1PVW1Gam5yeElo?=
 =?utf-8?B?cjc0WlB0SEZvc0RCbjdtVzkzSkR0ZDQ5OUkrZlViOEkwT1Q4U2Q4ancwNlBO?=
 =?utf-8?B?dktPS3dLR3dnNjNlb3VHb2hlU1p3SmhINFdZZkpBVHBxMWFHSTByV0JoTHdz?=
 =?utf-8?B?a3hMbUpHdFU2K2hPYXFJVUtaRnpuOVVDaE9UUUdwRk5aMjY0Tm1oZjg3Nk9O?=
 =?utf-8?B?RW42bWEydjVoMDgzYktOVWRSRVN2NjFWWkFRT1VDR0sxNE5GSDB1M2FFRitD?=
 =?utf-8?B?ZUZjN1ZwaUNaRFkrU1ZSRmRhb2IrSWJBeVh3OTh0WlJpQm5hL1dJL21aUjE2?=
 =?utf-8?B?ZWhheWpTVi9oR0NhZVhGVlF0VGJYVzFrZC8vTmVUVVVQaGVlTFZuK3d3Uk83?=
 =?utf-8?B?M1dBOXdaejdUZkhic1BOR21vOEN1ZnR1VWp5bmlWRDBaOWNlVG9tSExaSSsy?=
 =?utf-8?B?cEVKMHJpZjZVOHdGdWhnbWRBY3ZVeEdETnQvRkdtektSb1V1VEQ5bjVwSjg1?=
 =?utf-8?B?eFFFRzQrZHlUNjJiTy9YWFBMMUtTa0RMQjhqTUI1TWlnaG5hdWxYMSsxR2Ir?=
 =?utf-8?B?NUphdlJ2MXVvTXFmOVRxc00wdTRNRXJXTXBZeTdTQmxXL3FIcE5nVTl6ZDI0?=
 =?utf-8?B?SnZ5c29RVFFucWlMdmNwSWJZbG9NMlJvM1N1TVZOTmIxeE80eTBJTUdlbjQx?=
 =?utf-8?B?QW45WmZpRUpkVmtwTE0raTBiQjRLWGc4b1d3MWpteW9GRmNRdThuVWlRWWdo?=
 =?utf-8?B?WUt0OG9CUXhuMit2RU16aVROSHFvUzBFeDlaMUU4eDhCNEdNTUVsUEZidElF?=
 =?utf-8?B?TWJCYW1pTUdKVkpoWEUrYk95cHJCWmxJMlNaQng1VmJlR1ZCejVIYWxZcTNo?=
 =?utf-8?B?a1ZmemZjV0s5VkZtQWZWMEtHSUdxa2tLZUNlRmp0VHp2RmZBdm10M1FjY1R2?=
 =?utf-8?B?MExaaUJjNW1WazlVVmovS2p3Y0ZFSlNGVWUzZzVqVCt4aHNlTWlNZFV2a0p2?=
 =?utf-8?B?YkgvclRLdkNtLzIwYXFUalRSN3dzWnJ1cm52d2huVUt1QU84eFRQV1VRWFlX?=
 =?utf-8?B?d01tWkRnK0R4bExtUVRIV1Byd0xQUEdXOFFVVFJYMkozQ2wxRTB6NXVaT1Nl?=
 =?utf-8?B?Y3dZU3k2VUVBQTNUZmNIa3BwZ2JnWFJIaXVUcjhyVFlndUxqbW12TkVGREJl?=
 =?utf-8?B?V2VlTDBUVmFsUlNKQUpaTUNhTXJrT2VMZTFhWC9jaXB6Q1IrbUczWTFGbWhm?=
 =?utf-8?B?bUhBSkcyaEdKVis1SVlQeHFNVXY2aVI2MVB1VGlLUjd2STErMHZUbUZKdGZ4?=
 =?utf-8?B?NjlMOTkyOTBpcjF5VnlobERBVXNvWnJKa2JsaGhlSzNCeDhmZzRnZk15NzZv?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57905e91-3c8a-442d-1449-08dcfe6dff41
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:19:16.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivvbBzoLabZEHaoNbMz+eLRBq6+q8I4pbH899ayTqPP487VFFCrUYjRrg7oRCDfM1AitYRXCUYSuof4llucfOvEFpG85JT4Mus8UqjPxHw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6944



On 06.11.24 15:41, Luca Fancellu wrote:
> There are some cases where the device tree exposes a memory range
> in both /memreserve/ and reserved-memory node, in this case the
> current code will stop Xen to boot since it will find that the
> latter range is clashing with the already recorded /memreserve/
> ranges.
> 
> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
> in the /memreserve/ part and even in this case this will prevent
> Xen to boot since it will see that the module memory range that
> it is going to add in 'add_boot_module' clashes with a /memreserve/
> range.
> 
> When Xen populate the data structure that tracks the memory ranges,
> it also adds a memory type described in 'enum membank_type', so
> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
> function to check for exact memory range match given a specific memory
> type; allowing reserved-memory node ranges and boot modules to have an
> exact match with ranges from /memreserve/.
> 
> While there, set a type for the memory recorded during ACPI boot.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> I tested this patch adding the same range in a /memreserve/ entry and
> /reserved-memory node, and by letting u-boot pass a ramdisk.
> I've also tested that a configuration running static shared memory still works
> fine.

[...]

Thank you, Dom0 started successfully with Initrd.

Tested-by: Grygorii Strashko <grygorii_strashko@epam.com>

Meminfo from boot log is below:

(XEN) Checking for initrd in /chosen
(XEN) Initrd 0000000084000040-00000000860864fd
(XEN) RAM: 0000000048000000 - 00000000bfffffff
(XEN) RAM: 0000000480000000 - 00000004ffffffff
(XEN) RAM: 0000000600000000 - 00000006ffffffff
(XEN)
(XEN) MODULE[0]: 0000000048080000 - 00000000481ec000 Xen
(XEN) MODULE[1]: 0000000048000000 - 000000004801e080 Device Tree
(XEN) MODULE[2]: 0000000084000040 - 00000000860864fd Ramdisk
(XEN) MODULE[3]: 0000000048300000 - 000000004a300000 Kernel
(XEN) MODULE[4]: 0000000048070000 - 0000000048080000 XSM
(XEN)  RESVD[0]: 0000000084000040 - 00000000860864fc
(XEN)  RESVD[1]: 0000000060000000 - 000000007fffffff
(XEN)  RESVD[2]: 00000000b0000000 - 00000000bfffffff
(XEN)  RESVD[3]: 00000000a0000000 - 00000000afffffff
...

BR,
-grygorii



