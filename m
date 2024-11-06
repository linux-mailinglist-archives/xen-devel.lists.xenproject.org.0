Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867399BF310
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 17:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831256.1246464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ij9-0005Ef-4A; Wed, 06 Nov 2024 16:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831256.1246464; Wed, 06 Nov 2024 16:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ij9-0005DA-07; Wed, 06 Nov 2024 16:17:51 +0000
Received: by outflank-mailman (input) for mailman id 831256;
 Wed, 06 Nov 2024 16:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68q8=SB=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1t8ij7-0005D0-Ux
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 16:17:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2613::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8c48c62-9c5a-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 17:17:46 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI0PR03MB10225.eurprd03.prod.outlook.com (2603:10a6:800:20e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 16:17:41 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 16:17:38 +0000
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
X-Inumbo-ID: a8c48c62-9c5a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjBhIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImE4YzQ4YzYyLTljNWEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA5ODY2LjczNzI0Niwic2VuZGVyIjoic2VyZ2l5X2tpYnJpa0BlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvNQ4mL468xEREdfBm33wRiWka58Iba5DCS1WgXKo2FhyqiUyCrC+atbzHSsOr4bEJ623bitBm+8Y5cAV6nd+Cc6Qi4gqYe5Cf5FZOMCItfml9WopoBnNTyjNeKiMLsETQkIKre3boj3/qWTLlWi3gypG12A0W6tYd5S9gohzAW83dNuk+hM7ov9Mq/GvNj+qlDv0kN3xO+eRH/g2Jrm4ViBZ9NYcqiXm/4LkYVWN8q/7yfo7ZcePwoEcqAjSGqoQf4z8e/F/2VNE3bih87bvLrZ+TPoIu9ctS1ZfxzRQfxvhd85oY6pVVcn60fiBMMQUFGe/zgC8iY3wl0UC1Lvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrCHY9gmvzgb1cRGQ4VSIWnw/tGtMWTjyeWRGT5V2r4=;
 b=xI1YXRmL0eiLsnYeo5jPquYchXCD0AYcd0AOCkb+plQsrAnQOdHHrT6ojkSitkSSQzlGACg3d2P5sXnE5zZuXKQVYB0kcbr5X1Zgauujol07Nc4KnU/NDKQGUw+iFJ8/mKTJeTjJ3If+BGX23VP1WIAvVNWIwlT2pe5YxDtls/JVc6nDQirv7d2ZIKIaxur+WEz90Byix68tc27/Lq8onM/e3t7WTn1DuOX6oBrmWS6fByiuYmHWRmLFsikMCYrcEnOCEjm2EM0Nn8pamFF+i06TP8PVWKFw9AYayOL2sjDJJOwFCAYEAeC0+W9BpnEVnl6FrOYUpdsoYmt+6toMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrCHY9gmvzgb1cRGQ4VSIWnw/tGtMWTjyeWRGT5V2r4=;
 b=OLxu+5EsFEp5aMOPhN17NHZEpuD2hfSSiWNsxFH/MHb7t0PElBVigeTigkrf8v3CGMmvrPLXQ+ZMKcrKNDsnz1WaZbn3ksH2Z13rro5jjzS5ibwCp2XNOLARus1s1ZDbodxe0NPC7JFWVo1dbyvD17AM67jrTC7UGrecaiqXrfgPzVZLnFw3C29lJ4ORcAr1OniKpoeEJI8p1DaMiNAOjiensMoiZFFmjGRQJKNvcuXxNX3qC22q8Oi5zsCLofKVWfoWA7P7w8TSsa5pSkDaF16jke/yHVDu1X6MRSlpZbX/llYr0CrSFbPJUmj5DFGdKOHKMwphbQtvWSMm3oh9zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <09171e88-28d2-433b-a9c3-ad822e9f57c0@epam.com>
Date: Wed, 6 Nov 2024 18:17:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI0PR03MB10225:EE_
X-MS-Office365-Filtering-Correlation-Id: 756326df-7177-4167-069e-08dcfe7e87dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWxKK3hrcUhNUWdSSjdiR3BEbFByNWw1eFRhR2txVmVFRU9GY2tBL2NGcmRR?=
 =?utf-8?B?SFVrK2IxRWdHR2EvdC9RZmtvL2oyQjRXa3laR2pma2RtY1N5WHVQL2NZeEZN?=
 =?utf-8?B?Zm5KWXcwYzBvR3pMRTRUUTQxemtBS3BpY2g3Q2pOT2ptZUNEQUFZNEVlbGlu?=
 =?utf-8?B?TGEzRGFOWnQvSGY2UG1FSjNzU25oQXA1NWEvMDVhN1c3RDlpYnJKSnlSMGdZ?=
 =?utf-8?B?WEd3WVNWMzI4Sk51aVRMTncwN0FvcndvQlVvN1FoWFYxWTBPYkYyNm1idWl0?=
 =?utf-8?B?NGdoaDJiK2lQbGk5YnVpN0t5WXFXYkdMLzlsYmFxL0RnZ3ZjdWpMdllYamNs?=
 =?utf-8?B?TWFoMjBIU29HZWZ2ZDJucUlraDNSM285cm1oL2c4d0V1TzA0MTZjUDdFTHV2?=
 =?utf-8?B?MzlIR2Q1ZDJtekk3MHVQL3I4dVNSOXRiZTdpVHQ4VXNrODNMV253aEsrdXo3?=
 =?utf-8?B?RnVra1RiVGpmN2tUOHd0ejRqRVV1UjBuYkxSMHNBV0tMYXptLzBEUDA2V2xR?=
 =?utf-8?B?MmZsY1h0NkdrNWw2WEhTWmdLeGpiaExTMW9pdkJkV2Vnbkx5c1E1and6YTBB?=
 =?utf-8?B?aUFJdFJkNGNMZnVUWW8vNFA2ckxkZFNUa0NjNDE2ZHphNHlzVWF1MXh6L2sz?=
 =?utf-8?B?dk1iRU1VZkNkRGFYZXVxeUNST05Ec05GdVU2YnU2SjZkK280cDVpVEd1MU5U?=
 =?utf-8?B?UndjTkdNTGJub1BreHZvSU1OTkRsZmFZUTF1djRlZERiRVpVUDNmMHR1Qkxm?=
 =?utf-8?B?QS94SW51MW5naVlELzBvUGkzRi8yUHY4RXpkM25KVlV2RWs1czlIWVdNSHJa?=
 =?utf-8?B?ZWt0Q0JWRTJHSzhCR0VDcGNjY3pjVE5BT0RuZGs1bzNpbzI1WitIQzE2dkVB?=
 =?utf-8?B?dnJXVUFyekFVTzM5WFFBTVczNWMyZHN4bjlmbDdQTi9QYjRIRDhTeUNuNjdY?=
 =?utf-8?B?ZHdpM3hDdDBOQXlyQ2lkeWhBWng5ZXVXTVBTRlpuQ0haQzVDZEpGU2drYlpG?=
 =?utf-8?B?NnFuTUZzald2K0g5ajVuSG13YW1rY2lMVzNRVVAyQWJFQkVCVkR6TGR6WDZJ?=
 =?utf-8?B?WFlNaEFQZG5yOEQvMEdnQjhXV0RhWEFxS0hZaStCVkJIOTkzZk5QZ2VPTE9m?=
 =?utf-8?B?WmhjUXlQNXdhbXN1L092eExmaCtWZytLN3hTdnV5Y09Pd2w1anN6cXJNY2xy?=
 =?utf-8?B?eEdhNmx5bXFKZSsrUHdiL2srVWV0QWpvUTEveVhSOGxITmlmYkJyaG5KYkFP?=
 =?utf-8?B?cnNVYlFUSUxpVHhpdVVSU1B5NmViSUtWZDNGRzNCV1lGUnBRa0lRUW5BY2JC?=
 =?utf-8?B?aE9wSHdVbWZwWGZLcnhQTzJXS0dhMW5peU1QaUpJZ0ljd2dGWUpVMUt0SVpo?=
 =?utf-8?B?cGxpOVBEa2dpRjY4cStwVDFVU3R1ZTFjd3lpU0FJN01lS2w4c1JkdXppSUhs?=
 =?utf-8?B?VmFOOGhuRFZIUWZaM3ppSnpDdEFlNmNEMUxGbFVKM1JMcWp6a0hPdUlTSHFV?=
 =?utf-8?B?VzNhRTY1T0ZaOEdNWUhpZ1g1elB2T2VJL3laQU1VMlU4b01BMEhScHoxN3Bx?=
 =?utf-8?B?cjZnMDNTWkdPa0RRTW80MUs5RC9CRDlsNGk5M3FBbUZGTDRJLzJIb0ExOXhu?=
 =?utf-8?B?M1JPWWg2aGR4VUNaTDlNMjgrWnJncDZXbzNHTnhWT0p3bnQrbENvbkplMjJu?=
 =?utf-8?B?NjMrNTZ2TTU2ckRoTmplcG1ZcFFxS09DaFhPZmlvTGNCWWtETjVEbVQ3UnNH?=
 =?utf-8?Q?U1zD+dejj/ANCKpCocQ2opRIt+53s16W/jMOvNf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmcrNXZLd0o3RkplODlERWU1YlUzWFFaWTJhOXZlU2didXlaRUF3ZXd3c2N0?=
 =?utf-8?B?WGZaallDSURzN0g2MmQzR1QveVFtSVo1KzhVZHNmemFmSTQ5V0ZXR2ZueUNr?=
 =?utf-8?B?eDRjRlVVMXpONVphcXdGbWgwQUZCUDBUMDRCU25rWVZhdmMwNmM2dHd5K04r?=
 =?utf-8?B?OXpzWUtrT3NmKy9vWnNyUlJ6cWJLRTQ3QlZWaS9rRDBvUE5mSm95b1gzOWxL?=
 =?utf-8?B?M1ZvNVp6UzdlK2VxWWNHRHJwRnhNc2xiWENvYWgzelJpUWZqZ0JSMTBXbFhX?=
 =?utf-8?B?N29iUS9raW1BdGdEeU91dFF6bTY0WTl0S2txOHNNMkRKTVVMcVN2SGUwYVZO?=
 =?utf-8?B?TGIwbDRZWFZSTGlPcE4yWFFBTy9hRDh5SEdHUTg5UURDT1JieTFtT0tEVFJJ?=
 =?utf-8?B?WHN3N09wQlh0SndJUHhZeHAvTzdvUkJCcG41SG5iTHpOb1VuSDg1UHFSQnoy?=
 =?utf-8?B?b2d6YjE3clc2bFMrckI2YVMwS1dwbFlsckJBL25HaUsvNGIwQ29pNkpzZFdU?=
 =?utf-8?B?eExJeGNtV2o4ZVdyeVI2LzhsVXp3QTllaXNPNVJscENybDk4UXZFYWUzZHdC?=
 =?utf-8?B?S1M4Vi9CWlFrTU5tam5TV1lwNGRQZzhNNnh3N3o1eUl5cWtNK1BwWmVnZktP?=
 =?utf-8?B?L010NTVzSVNQLzQvREREL01IcTgwWW1LbDRKR3N5cTNNNm5JZ240QmNuNjZh?=
 =?utf-8?B?VWl1RW1kVy81Rk91QTQ1NnZpZ1lHVTUvM0lxd2M5UTRta25zNVpQRlQvWC9Q?=
 =?utf-8?B?d2F2OFRybVhzWElJbWIrR1p1Szg2U2RuRDZtQVFnSmJrQUpsMm44c3IrMmNX?=
 =?utf-8?B?TXQxc2xtL3VpMGRYSWloTmR2RHl4TFJlN21GbHd6WHVOMExzUnlPVW4vcUZz?=
 =?utf-8?B?dmRqWUMxeTR2NTFPcHFNUVJBckViYlBvNnhvblQwSVIwci9nZnFYRDdJQ0pG?=
 =?utf-8?B?bUlLWnlNTDJBSU5BVWZXMTRGVUFpZDVhOWFmNXVPem9PZ3RBODUvcWJka1c1?=
 =?utf-8?B?NWo5WWxObHgvSk5Vbmo2MlhTeDdldVROdVNmempBOHFGbFhSNHJFVmRLMWNY?=
 =?utf-8?B?MWhHSzNFK2FUNzlXSmFFODJ0ckpyVkxPWlRLZ29KR2ZFMGZiTzBSLzBZczFV?=
 =?utf-8?B?Zk9MQko4WWdtT2krQ25ZaGwzd28vWi9EU05VWEZscTR4dkpITDlPN2xMbjdQ?=
 =?utf-8?B?RGJ0UHppYzdDVFBOWXNoUTROZXlwOFNBYU92TjNUeDFlSEM2RGMzOHd3Y3FG?=
 =?utf-8?B?b09KK0JIYjArUDZuOGQvNGhIZ0VHS2NSTWJEbytWbVk0RVhScnAyVlo5Rm1D?=
 =?utf-8?B?NXdPc1g2eFMraEFURUV2VXJrZHRWY3NramZHS1ZxYlZEYUxkNnpwVUpHRU1w?=
 =?utf-8?B?eC8xZE5uMlI5blcyeU5WbXk0d3BWZVpDclVBTTJZYlVjUHd4ZUZtYjZxSHlX?=
 =?utf-8?B?dDVEKzhVZkg3dFd0SERpb2NnY3ZndEdUT3BSeGFFcDVGOVlMS1pBb2d6QmtR?=
 =?utf-8?B?cm5GZ3R0M2xXTEE5cEo2L29yQ2VHd1dvK3BuUGw4WmQ5ZXR0TXozNXJqRGht?=
 =?utf-8?B?amk3dXJKZ3VjVE92K1ZjRjA5Mno2ZDFvYWhaQTljN2xLRVl1My9YNzd5Z1Z1?=
 =?utf-8?B?cEJPREFJY201a01DWi9ESktva2JoVjJXNDdhYWR0MHJidWN0S1pycWlKSnJh?=
 =?utf-8?B?WmduT0JXNHFSTGcyQXlvRXZQd0VjWG1lanJkYXlpekJxZ0VVeGwzbGxYY0tp?=
 =?utf-8?B?V09pU1VQMU5KQVRwdWNVYkFycHVyMk8xVkptVGNETkJMQTVMNFdrWFFmckdI?=
 =?utf-8?B?YXhINjdmTTJCV3V1b3J3V2s0WnNCMkpqbEI5d0s5QmtsbldSWGMxU0U0ay9L?=
 =?utf-8?B?d0ZzMm1ES3NpSm9UTU9samt4dDhqNzVGYllwVjVFMEhrbFFBN3grM2VBRTd5?=
 =?utf-8?B?Y0wvb1lhQWJvQUxzZ1VrdmpodlZsdTQ4U3dsK2hkNDN3akI4VVdaOHhLSGVJ?=
 =?utf-8?B?VG82WWF6bzhlOUt3ZEU2b1BVYXVpUElUaGRkZElPVU15dHVtVGY2WndsZEds?=
 =?utf-8?B?cW5YcGIwd2x2N3RDNlgweWxQdjJZdjg0M1FrVytQY2o5NWpJa0p4SlNndW5q?=
 =?utf-8?B?ek1mYWFjK0pGdTFGY3ZEb0NjZ1dSNXBwQTNUMWVZMmJJZ3B2aUlIbTl0ZHRK?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756326df-7177-4167-069e-08dcfe7e87dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:17:38.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFjGHgCH6HzyeMRTMWGtc7usGEnt4wBmMKP6QgDFC7ojfcPOQ8TxCTP/DnzN+evpjNiO24I1faohldqbN0oyyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10225

06.11.24 12:14, Sergiy Kibrik:
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 78a13e6812..b340818ee2 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -742,11 +742,16 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>   
>   static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>   {
> -#ifdef CONFIG_HVM
> +    const uint32_t disabled_emu_mask = X86_EMU_PM;
> +
> +#if defined(CONFIG_X86_HVM_PMTIMER)
>       /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>       BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>   #endif
>   
> +    if ( emflags & disabled_emu_mask )
> +        return false;
> +

oops, disregard this chunk please, it should be:

   if ( (emflags & X86_EMU_ALL) != emflags ) 

      return false;

with disabled_emu_mask completely removed.

>       if ( is_hvm_domain(d) )
>       {
>           if ( is_hardware_domain(d) &&


  -Sergiy

