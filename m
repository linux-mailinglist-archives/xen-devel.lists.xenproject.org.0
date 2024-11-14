Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D39C8879
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836277.1252162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXiO-0005T5-Hc; Thu, 14 Nov 2024 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836277.1252162; Thu, 14 Nov 2024 11:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXiO-0005Ra-Eu; Thu, 14 Nov 2024 11:08:44 +0000
Received: by outflank-mailman (input) for mailman id 836277;
 Thu, 14 Nov 2024 11:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpK4=SJ=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tBXiN-0005RU-F0
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:08:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f403:2614::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdba43dc-a278-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 12:08:40 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB7634.eurprd03.prod.outlook.com (2603:10a6:102:1dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 11:08:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 11:08:37 +0000
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
X-Inumbo-ID: cdba43dc-a278-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjIxIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImNkYmE0M2RjLWEyNzgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTgyNTIwLjY5OTQzNCwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbXVHJR3HHY6X83bS1fzhU+TF/mv4W7WMj37m1GCiqROG/422tDasLjkppEdCWe0IzVHpkszgkAtXPrG6Ka6qpgXZF1xZ6oSrhcCGFvQJIUEkEPFGBrDyXqhwT2c1WnOX4fIrsjBAhpJv+Hf3qojVeNwsTiqKQ/LKbVOPnS7zdzTQrKzq8TeV00hEbZpfWcdHbZ1sQchZ/6YeFNVHk1k6OTMisJLCl+XmG2UZIBfgbz3Xj55+MEKx271t1wQVJjFM4A7Xlu4DDEJl/YwUpv6atAuGRtOXYdYB/6txzF214Ea7SnXud0cApiEAVMfTi0wP9r4P/n7/uYYc6hhMzI+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWjwJdgEjAg0pVlHjrnvoQQVUCrIB47RZjxSVRvZYe4=;
 b=t+LqM/VRoA3GhdDScAeNs9igctRdyyOdNykAfwzjcfwtEVHBv11b3dua/+BT5PDS0wuqRxLEIj+pOzG1BytTRdPxI4MCA9SU+a+fqGMajAwZS0B6gcyJsP83zdyfGZ8qr/qU/xR5TQ4VMRGlNKdqPDtIzzQkwoKottc46OEQVB7UBbNgxMbXR8FrklsTYzRM8/ztR2XQDMZN9Jhc5RF/vLj/CEhGAmgN8jQs2RJYRwOLHyrJNZsUd35jv+l5DUrkvV7xij+Dl+Ln2HEx+4xeYIQknL059FRssmOXfIlE2sxUf3zhT2ckeENaKYUz1rL0XI+nnokBHgKT3gJ6f7CCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWjwJdgEjAg0pVlHjrnvoQQVUCrIB47RZjxSVRvZYe4=;
 b=oJtpLY9oXfNR0qWNszrTlxymibpnxELlJ01mQX91mayggyYP/OZVVEmYlthzd5WRO5oa0G/1sEpvCjcikEpXv2jDwDa86zoO24jms4+bx71Atz3+JRWNUIjuX2xjysK7FUA4ogRgBugiurgvz98fWJCy11cpD/nU9OxRtex/AXwRmYopU4/+izG/pUrXqrvTsRtKm1Yr+xhCs/3UlhxwCJB6yViDR8d3d1HdPvt6uGqwtkXP7uAT/KWW+d0qvRIwonrGbL6+K8gz6jp1N941IDl00c0YwE1j+jk68BeRwdIJVxqMGRCFSUUO4RCjI1KhZjK58aCt/+0XKqZalicL/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <690f9613-b50f-4bae-9580-7acdf21c6336@epam.com>
Date: Thu, 14 Nov 2024 13:08:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/device-tree: Allow region overlapping with
 /memreserve/ ranges
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20241114102802.54512-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20241114102802.54512-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAXPR03MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 682df1f7-a4ca-4101-0289-08dd049cb047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2xFTVlUUXRTTExzZnJxVHBOY2JwM3hXTHZxNzl6UVY5U1ZiYk9oeUlrck5I?=
 =?utf-8?B?MTMzNTVpdndpSzJUcXVDUmVURm0zS0g3U1A4MkNPakRLbU1qQ0RJTU9aRUhM?=
 =?utf-8?B?NmpueGZuRVJNMDliZWJrM3dETm13ZlRrOTJzWVN4ajczeVdLSVNUWWcwR1Vt?=
 =?utf-8?B?bkdoVnpiMFAyNWZxM2p0V0JrQ2dOemVxUWZXUkdLYWpHU1p4M09wcHFzaldR?=
 =?utf-8?B?cDA4WGowMnV2eW12RnhLRXg2QWtYblczYURtak90OXlxR1JpQm9PU0tFY0VG?=
 =?utf-8?B?L21WbWZEcExab013R3V1SmJEYkxESTFKamp4aXgwOG5BTU1zUmhxZzVpZDM4?=
 =?utf-8?B?Q3oxTUZHK2prTFpkNUZGNVVGdUNRTlJMZVRNbGkxL3hISEQ0dFVRMzFNYmFI?=
 =?utf-8?B?VlB3ejFhbEN3VVRXWHJ0VEtaT0hRSmxMV1hKUEh0Smx5ZW9jRy9CQzFkTWpq?=
 =?utf-8?B?OGpPbjRyV0gwR0VEay9jQ2xhTWp1ZDd0S0w4amxFbE1aZFVhUSs0M3RtQkxV?=
 =?utf-8?B?U295NVUvVzBDQ3Y1SGdyMUFQdkV5VDg1ckJmcHhvbTVLRW9sK2tFRERFVWc1?=
 =?utf-8?B?eXJoZjcyN3hkc1J3clJqelZOeHprT3ZxV3dXU1ZYaXNPZnFMRStySzZ2LzAz?=
 =?utf-8?B?QVE1cmxJeStFclU1OUhpcGJmMzdwTFlTbGFVTEtkMEd1c3EwN00zcllRSHBN?=
 =?utf-8?B?ZnJZUzZMckJLbFNOblIzVCtONUhhWS9zOFJMcU5YcEpyREVNdXpqVzJqQWli?=
 =?utf-8?B?R2FObWVYZ0hPbmlmdnhVMlJ5eU5SdFA3dk04aE9zMUVsNVJyNjZxeTM5bVhE?=
 =?utf-8?B?U2JlOUVHTGJhMVltVFJ1YkQ1b3pmUjJKam9sOGI1U1BVdk9yV3dkNkhPMDVR?=
 =?utf-8?B?SWIva1RmbHVpT3JhVVd2N3dDcjhCMGduU2ZJQUpYeTFCemd6eW82OU45a1A5?=
 =?utf-8?B?TTNVeTc0TXozcUhWSTgxVXJrK2tpSDhkNGJRSFR2OXJ0Y1VNNGR0V3dHQitR?=
 =?utf-8?B?T3BXUE9vQlUvSkluRVRZZGRNK2w3S0J1Vk1LSDBJVExydXk1L21YNnowL2ox?=
 =?utf-8?B?d2h2ajR4S0VkaDFjQm9KclVxMm1BNVlQY1Z1UDJnUHVKSW52b3F5VnVFNDFC?=
 =?utf-8?B?MkVJVFlrV3dMOWpjc0VWWDMvd045Q1R1dml3d2drMU43VWh5ZEUxeHNGN25V?=
 =?utf-8?B?RjhqK3VOOXY0UjJaUzlLVFZoeThGSWFDeHlUYjJFYTNQNHkvdDd1VjQ1c1hS?=
 =?utf-8?B?SGlsdFNqRE04d2gwVGk3cXZoRGxMVWpUYjVBOUZXalJwekNQUjl2NW1Fclkx?=
 =?utf-8?B?b1M4L0FYYVQ1c2dyU0FoSTNMdnRNRVBORTN0Tm5HQ3UxWXl3OEVEVVpQVDB1?=
 =?utf-8?B?VFMrTDRVMWpjZHR0TUJXeSs5ZWlSUi9UYVQ4NDlocTFURlBnZ1FTUkZNa0xx?=
 =?utf-8?B?ZnduNWYxM0V1UUhsUDBXNkZ3bkF3bU50Q0RIVWtObkVjQ09lY2RqS29DQ1NM?=
 =?utf-8?B?SGhpZHBPcmNFdm1ibG9sV05hcjRHOFNmWWhvM0Rzb2gwenYvWjhCSGlWeUZH?=
 =?utf-8?B?SXIwMG4vZTUybkVFQXVIOG5wN1lvQlZTa1dQVTNYTTA3OHhEWkdIMGhhNjlt?=
 =?utf-8?B?a2dYalFGcGNBdUlpR2g1MlNqUHdzMVp5NFhkV3RMSjNDRU1GOXNYS0xkWDBp?=
 =?utf-8?B?aHQwbFNMbWw3Z2RQeFU2Nm90ZVEzenIyNk9tT2ZpR2JvUTJLK2FTeld2SUhS?=
 =?utf-8?Q?iHND19E3R+0jVrcVffuDITZmmy04ohP4aut7VGL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2daREd0YUp5UUlGY0RsNjBRbDgrakZheGV3S3RlcTVCWW8zUWJGL2tmYzN4?=
 =?utf-8?B?VWlCN2pPcWRUQTBIZndHS0x1OXdrc042b2YrSVRYSzNuWW5acEllUy9RMzZB?=
 =?utf-8?B?ZHFRclkybmk0VnR1dmo0bGRBNy9NRjRUaCtuQ0FLSlVLZDZqRW1WM1lCMHBF?=
 =?utf-8?B?OWhJRDhuYlA0U0ErSGFFQkZBUkYzUnY2a3ZJZ21EZ2l5c2JWQWhZc1FONGxH?=
 =?utf-8?B?MDZrK2t2b2cwelNMMEVlamNaSDdTTkgvb29WRis5UnpoTlhjZ0oyNzNVYUJs?=
 =?utf-8?B?aHpnUTVSSXB2Zm9VWXkzdFJQMDRmb2o2djlsTThhalJNV2JMS2pNeEZKa2Fy?=
 =?utf-8?B?VnpDVldpZGxTV01wYVdIbWI1OXJzcHExVjNjOVBod2dhSmtZaTVJZ0dHbzJi?=
 =?utf-8?B?SUVnNVArbkYxL0FnQXVob2FhK09MZllWQXRmVWtvcitrWGRkaU55b2lJemtm?=
 =?utf-8?B?TE1KZHRwR1UvQjVqUm9ML0hVNnMxWEVtVVJFY1RkT3FzWWJucGhrZmY1bHQ5?=
 =?utf-8?B?RXU3K2Y4ZTZGOGRqMWYrdStEYmVUZXJLcCtBa2NHMlc5SGk4ZW9ZSjd5eUtS?=
 =?utf-8?B?SXJmcTVqcTdSWlhNL3V0U2liUWxTYkF5U3VWSDdVUkN1cVFmYTh6U05sNmtK?=
 =?utf-8?B?OHZFQ2RDN1RpNHhqU3VBSnZ4SVUwdVNkZU9YR1YyY3RXdWVYbHloaTFSWEtn?=
 =?utf-8?B?eGl6RjVZU1RTbUU3ZXlOTlNZejVIcnBpQWNicFBiQ001MTl4N3VuTW15ZjM3?=
 =?utf-8?B?UkR1Y0Q5TnIydFVNaHZGR0hHSFJuUENXL2lDU3dqcnord3ZLalJXUnJER1Ez?=
 =?utf-8?B?OXRycHRlYzUrMzZBVDZ4TWhNYUlNMVRZZzE1OENoSkJhay9HREJCMHQ5UVEz?=
 =?utf-8?B?Uk54dlY1ditSbEJNTHVEajAxbzQ5Q2NhdXFHbjRydS9LM2dpcUJZRmQ5cEJh?=
 =?utf-8?B?MnhjSklEQ2lSUkVKVldLOGVwYW94a05Bcm90VFBYcGovY0s0VTJ3TVI0dHpZ?=
 =?utf-8?B?akRaT1U3VHlJUEpHWkdOYWM1RTJBQ3VVcktWSE9XN3VQMGJqRDNrNVFFa3dI?=
 =?utf-8?B?RUNEWTJIaE5kZERPaUx3S1BadDl4V0lqV2dVUk5EcVlZaUlJQ3hyVU0vYk5O?=
 =?utf-8?B?SzU4elJEZ0trSlpZN0JPNG90R0pXVXdvZEE0ajhnSko2dXZZU3Q4RVg2YjBS?=
 =?utf-8?B?Sm5PV204aXdiN0paMy9URERaM3E0Mk9IWldCdnRzTlNka3ZCOUQ4dVM4SFFU?=
 =?utf-8?B?WkVWREQ5dlVsb3dMRUgzUEN6NFhHZHd1U2x6MGlwcjdQbzF3VDdGbnNsbkVM?=
 =?utf-8?B?UE9jbUxSZ0NwN21ya3doaHdnUEtuVXpBTzNhUEpaVmQ3SC9hK2hYUjlOQzRT?=
 =?utf-8?B?L2ZucEZDM0xQdVNGTVJ6ODNRUloxNVZIVnQ0cU1LcUdWR3E2NGpFYnU2MWdw?=
 =?utf-8?B?TG5qcEpOcFBxMk9VR0YvWWwxN0JpaG1uSFFKUlcycFdwQVZWTWo0djdGWUpw?=
 =?utf-8?B?YXJmVXRIclNzdHlicGhkbUpvUEE0cnIzZ1hJZG1ac0l0dHozY0h6VExrL0dZ?=
 =?utf-8?B?eFFvNGlYb3hrdUMxd3h1anlqdTdQWXdCRk9rZ2E1RGc0cFU0VUtCektLaDV4?=
 =?utf-8?B?WHY3L3FvS0d0NE5PSEhzeWZSbzY5QVVlbkxGeVJpZk5XQzNHRGV2VTd0d1ND?=
 =?utf-8?B?UEJVb1I4RFJtalphSTNBSzJpRVM5aGZndU5IZmNPVC90RU1IMnAzM3hweTNm?=
 =?utf-8?B?U3BwREdIQ3RLaUJ4R0RGYmk5dHY0dXEvZTZqWUp4b1RkRU5wRlZFeU9NSWxx?=
 =?utf-8?B?OVNkWGRvNExHNS9yenlheUpRNWoxWmU1bWRiZnZYSnJjVlEyU1dIWE5uMjJh?=
 =?utf-8?B?dHNLRzZvQ0tCU0huM0VqTGVERWFpb3lxdTByMWdhaHZ0M3dKUEZHaWRCK2Y1?=
 =?utf-8?B?ZU9oaWVDUkZNTno2bk9xMjFaQ2NybFJ5MjFydytpY2ZlYkFHUHJicmk1OXNo?=
 =?utf-8?B?NFdxTTBNR0xudkFCZm9BM0ordHVFNmhrY2NmQ2pzcDNuTjRNVFNOdkoyY0hv?=
 =?utf-8?B?ZjBBOHFYWlY4dlRoeDNsYktPTEdMNXg1aTloMXNKUE9VTFpVLzFMSFZtS1dP?=
 =?utf-8?B?cCs1UmErRUtOYzJ2N2pWdHRISVFMRTgyaTlJbXRBTndvcHFLNTczcVc5VUN0?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682df1f7-a4ca-4101-0289-08dd049cb047
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:08:37.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDHc/vptZ/6w/bX28VhQs1G2jJ9HNzW0PnhbYgF6/dcdzjJqJYRQWDc1F7AJ5Isb5auTg+AL7KSTt3bXsdGv2htTPW5EBH5hNa2jOYVcP/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7634



On 14.11.24 12:28, Luca Fancellu wrote:
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
> in order to fix this behavior, allow overlapping with the /memreserve/
> ranges in the 'check_reserved_regions_overlap' function when a flag
> is set.
> 
> In order to implement this solution, there is a distinction between
> the 'struct membanks *' handled by meminfo_overlap_check(...) that
> needs to be done, because the static shared memory banks doesn't have
> a usable bank[].type field and so it can't be accessed, hence now
> the 'struct membanks_hdr' have a 'enum region_type type' field in order
> to be able to identify static shared memory banks in meminfo_overlap_check(...).
> 
> While there, set a type for the memory recorded using meminfo_add_bank()
> from efi-boot.h.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v1:
>   - fixed commit message
>   - used boolean to allow /memreserve/ overlap or not
>   - now 'struct membanks *' have a type, while it might seem a waste of space,
>     it might be used in the future to consolidate also the 'struct bootmodules'
>     and 'struct bootcmdlines' to use the same 'struct membanks *' interface.
>     Also the added space is limited to 3/4 enum size.
>   - The change above allowed this version to remove the "hack" when dealing with
>     static shared memory banks, that doesn't have a type.
> 
> I tested this patch adding the same range in a /memreserve/ entry and
> /reserved-memory node, and by letting u-boot pass a ramdisk.
> I've also tested that a configuration running static shared memory still works
> fine.
> ---
> ---
>   xen/arch/arm/efi/efi-boot.h       |  3 ++-
>   xen/arch/arm/static-shmem.c       |  2 +-
>   xen/common/device-tree/bootfdt.c  |  9 ++++++-
>   xen/common/device-tree/bootinfo.c | 39 +++++++++++++++++++++++--------
>   xen/include/xen/bootfdt.h         | 20 +++++++++++++---
>   5 files changed, 57 insertions(+), 16 deletions(-)
> 

[...]

Dom0 started successfully with Initrd.

Tested-by: Grygorii Strashko <grygorii_strashko@epam.com>

Meminfo from boot log is below:

(XEN) Checking for initrd in /chosen
(XEN) Initrd 0000000084000040-0000000087bc5831
(XEN) RAM: 0000000048000000 - 00000000bfffffff
(XEN) RAM: 0000000480000000 - 00000004ffffffff
(XEN) RAM: 0000000600000000 - 00000006ffffffff
(XEN)
(XEN) MODULE[0]: 0000000048080000 - 00000000481ec000 Xen
(XEN) MODULE[1]: 0000000048000000 - 000000004801e080 Device Tree
(XEN) MODULE[2]: 0000000084000040 - 0000000087bc5831 Ramdisk
(XEN) MODULE[3]: 0000000048300000 - 000000004a300000 Kernel
(XEN) MODULE[4]: 0000000048070000 - 0000000048080000 XSM
(XEN)  RESVD[0]: 0000000084000040 - 0000000087bc5830
(XEN)  RESVD[1]: 0000000060000000 - 000000007fffffff
(XEN)  RESVD[2]: 00000000b0000000 - 00000000bfffffff
(XEN)  RESVD[3]: 00000000a0000000 - 00000000afffffff

Thank you,
-grygorii

