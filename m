Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHvOBchBDGq4bwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:56:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03357CF6F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312765.1582866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPI78-0005tX-8o; Tue, 19 May 2026 10:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312765.1582866; Tue, 19 May 2026 10:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPI78-0005qe-5A; Tue, 19 May 2026 10:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1312765;
 Tue, 19 May 2026 10:55:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wPI77-0005qY-67
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:55:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPI76-00BpU3-CR
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:55:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0c41b2-bab6-0a2a0a5309dd-0a2a4505e378-12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:55:52 +0200
Received: from [52.101.56.18]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0c41b7-aaa8-0a2a45050019-346538121f2b-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:55:52 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA2PR03MB5883.namprd03.prod.outlook.com (2603:10b6:806:f9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 10:55:49 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 10:55:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRRrWroKYDvYlcHm0ypKv4mCLKkxBPaLMG07XnCFmgS9Uz15aYDtkLLvNB7wnPiuYXIYHwAxdWc+yRxR/D5mHCnILxisHJ/qaX336tEIblP4lXOqi5EBLj5edqCjzpXL7b1r0s8DhMPdba7jcX7vWEIf05aejK2G3lic407thCwOwYvmhOE5m0phDmGv7ZcDh+EL5KnTw4QECoQtX2idipNkIDYctDrDiG77ussjcS2KFt0sY8eZzP9EjsZh+abQaIEQgA4tXTqx9CQx+yTq1Q4GUUkdN1cP3uo/ciqFV6Td7Zq9i6rt4C6Q8cPINxVTRciKNeR8l9rddEVjGZTD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fOyH0DBH+exaiWsiqF3rVuVhvGeYYtelg3oQrF5zg4=;
 b=CptJA2Zesh2CUTLG1lntJPUHTuYJ+i3aflmT2y+yPLuK1466/qvAUD7GKkEopzs+QwGQ5dJbKF64lZRP/vADZzDpNjSJ8HJi9WpXkGfBGaci6MErjYWSfI+WdPmJBRX4IWwJr458dgP7iZDCWIvK6vnYHs8oksZlVWLEWloahbyZzVMxMkspYpDzgje6/yaqBE9osUZg/zKjrF9RwMyc3CJwCV+UH2FYEGuR6KXFgyl+OW4T2GsmRRwivyutAAjIyo+ntVljFfdJAAt15xvx/5Ln25lFKDyqB18JKCYAE5v9S7GiZGpf/KS7fi9JccAbe7AWusiExdug+xxB5IicSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fOyH0DBH+exaiWsiqF3rVuVhvGeYYtelg3oQrF5zg4=;
 b=AC2rKsPya5roukhlxP182v91QpdfcktJUcgqbwIebMl9tWs/SVSSBD9USbAdOXad00yX3DkHjuWhILAwKl2RrLqtMApjdObAkzr/iw4Zois6/vkSdl0FliLJWCkbC+ukSAKUBJnH6yQETUVFXjlbSH+NmoL2a0E6Dx1QIg7YtFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70d8aba0-9a8c-43f3-b20e-e017a6949ed1@citrix.com>
Date: Tue, 19 May 2026 11:55:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] livepatch-build: fix detection of structure sizes
To: Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240429145654.71669-1-roger.pau@citrix.com>
 <20240429145654.71669-4-roger.pau@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20240429145654.71669-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA2PR03MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 68034ea9-032a-46f7-8583-08deb5952f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799006|56012099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mWq3jgDyuLBTFacRaZALJ56cuOp2OM2rDE7/BYH8w0My4Ovcpkf1oAhfp+CEJ8ig16flpzTWKAvNxzMU40sF+r9OFVyZ+Pk6S6ohapUpl93dmZEscsodUWQKIjiUS5tWBhsrZnIgTgcFkSr5+o/RQSAVvzNH8qqki723czGRKYydcsbXkQlMM523iJVAmuOXhTX8ro+Fed/wPaBzlkmwAsxVxqCMpoMGrVUWoTjJFpBonlwi8lFb5J5mgPnlmo4zt2mTymVqU+T9Bqh2BpYHy5X5vNpxMnhm3RADfH0m/CsGKio1ua3QkMuJR0ZyMbYOpn+7PBOEo8RKYYM93O7/ybKb2rLVMfKipfD1vK7j43fcpNgDY48HcRcDq4E22ohkoyK9BjJ2cTnvqJo878KVz8H3ZeKo3ginFFQEFbH5ql7Vb3IjMmVjXz+yd7/xPYahakZtmo8w5YlFL1PtNA/sTIdydxqdi8i/8i//w59LyPFs46vx1ct2aI8mseLDfHTb1X8KKbo22G+6fAyl/RE9tsoqO2BLcnku+q4ga9EbufICkXfwAa+l3ENcSlNnNH0LReau9X76RJ4vZWB+je3ysu6YRALOofN4VxfEDtWaTduXCIOuwfdtnrVdo1GBY/FGA/qjPUovl/grk37T/358pZwmWT8BhVARnpHkc1R4r7cHQYTENHuzafOcPc7652h2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799006)(56012099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXZ6TmpuTlZXYzRwMHNBa01HZzVvQ081bnZReklSaEdlU2xHVHZUMGRDc0hN?=
 =?utf-8?B?STVkSnJRUW5FTkFUVG5RMHdaYUN1MzNiRkRoNWI0VVl0dE42SmhYdVN0eXpu?=
 =?utf-8?B?TUNZMjBNSEF0VnBiQTFna0Jla3NFaTNsT0tDZjRKajZ6QmN6VDZ6blZCM01D?=
 =?utf-8?B?NG5hQ3pWR1hEOVFvZ2hOVGJYY1pGT2VhTDU2N0ZxdXBOeUo5UXZLcGRvb3hJ?=
 =?utf-8?B?K21pNXZpd2x4NFRZRW9IbWYwMnpWUGp3SktXTEo1bkNqVHYzQXYrR3ZyRUto?=
 =?utf-8?B?OHVFT3VTeXFhVGZoZnZBQWE5dVlmSS91QTR5eUtSend3MlRKMmlnbm1BZHRE?=
 =?utf-8?B?YktZMytGeklQeXoxcmlIcDdZOWxRZkdKVlh3NHhBMUYzNVY0amJJT3hBOUhS?=
 =?utf-8?B?aE4yZlZZeVc2T2Q1T0ZiZlRIQWlCUEtrQzJzOU9hUS90SVNLYnY4QlZiV1dl?=
 =?utf-8?B?OE9kbnFlaFFPNEpDTE1jOG5rS3RKRldOMXFDT21zcnFPUnNuTHp0QjBDQ04r?=
 =?utf-8?B?cVRMamJwNWttdThHOVJxZUFLb2drU1poYURheXRQS2pWSlBpYlZNcFh5dit4?=
 =?utf-8?B?ZytIYU01U3FqakFiUktMUmd5M1o1OE5GbnBpbkhYb01FU3pnOWloQkpuOGtM?=
 =?utf-8?B?akdkUTFOVXRSQ29iZ1RENFFPbElNYm8vTFlDWkVyZ1NKakxpYVJHZDMvdEVs?=
 =?utf-8?B?ZGpYL095Q2V2Z3d6UWFYK1Ywd0JRTERwV0E4eGt4QUhzUE90K0pnQlZuSEs1?=
 =?utf-8?B?a0d0ZXRncmdETWg5aVRmWDdiVGYzNFkvdUlhaVEyZ3RwMFBVanlmZ2dyRVAw?=
 =?utf-8?B?T01sVENCTUxVaG9OQS9jV1dHaG8yOWpGQzVlL1VYckRxQWcvbHMwWmk1eTV5?=
 =?utf-8?B?WU5iMDJFcXQ5bjdKWUJQUmZnajFiZndma3cxZW4ycGlxMGViZGt0YnltRTdw?=
 =?utf-8?B?VDVHdDVjYnR1ZTVOTm9kRG9UVDMwajV3dE0rMEdya2F6dXA5bmhRQmtaWWtO?=
 =?utf-8?B?cE92OFgzSFdaSGg0ZUN5UVlMbGVVcFVXb3JHOUdoVGVyQ2pNdVBiM25sRVFj?=
 =?utf-8?B?R2FCSW56dmJnejMwbjNLSzlObjVPSk5HSjlNQWRnK003eHY3SC8weURRdlAz?=
 =?utf-8?B?dVVLV3U2R2dycmNxM0hDYTZSUUtqT0pJVDNFQmlDelpObVphdzJ5Zno3WnVn?=
 =?utf-8?B?aHdhS0J5K1QzSndXOVRBU0ZPTkE3Z2syQkMyT1VVN3p4bzhhZ1lDbTdJOFVR?=
 =?utf-8?B?alNzRzRpazFrSDN1YW9IOWkxbUY1U3RnaUdrc1o0MFYwSTduQ21mZkFEV1M2?=
 =?utf-8?B?S0RjUklna1R0a0JvZlUxM3FmdVpJTGI2OWNRLzBRYm9walpZdk5RbklLOWVM?=
 =?utf-8?B?d0tsQ25UZy92Z2FTb1IzY1M0ekFPNFRNN3pCd255WWZBalczOHEzV3EzTUcr?=
 =?utf-8?B?NlpCOWVSQWZBVlNBTjlUUjNvK2ZSNVN2RTJ2bjNqR1FTeFZUY2g4M1dSc094?=
 =?utf-8?B?M29xWGlXZ3FqL3o4UFF4UnpzbEY1aDdzQWZ4NU1lcnk1NUg4YU9aaUhNeVpY?=
 =?utf-8?B?NTgvWWJxTVM2dk1qand3dTVEc3R2ZFZiazJObnh6Ukl0U3BBajBuWDBaK3I1?=
 =?utf-8?B?REEzWlpkd0kraG1pVTd6VDJQVWppSEw5aTd1MWVnUGtFb0F6bUtFVVA4eHdE?=
 =?utf-8?B?ZGtyWWFVZ0dBdmtNdW5nMmVjc3dtOGl5WXpTWkRFMHhYdkFlYW5wZ1FkaG16?=
 =?utf-8?B?UHlBY2NUSGxkenRXZGJwK1NHK2RkSXhCM2lNaEdUSkZCdGMwZzdpQXpBbU53?=
 =?utf-8?B?SWxodmJEZ25sc0VDNWRLclI3UG5DM0ZMZU0zRXV6eFJHcVlPV002YlJZVS9Q?=
 =?utf-8?B?SVh3UXlub29WYVJuVk4rdjlsVjh2c2lmTHFEUlYxUHRobE1xcjFOOFFxUXFo?=
 =?utf-8?B?WFdrdG5UWFdCci9lNDZ1UnNlZ05XMVcwLzNET25GZk4zL3dvSTFXZ2VHQmFS?=
 =?utf-8?B?QTdHWDRqZ0piSUxBdXpvcktQcGFlRVR5Q3FxblRQT084S1IvWnI0NC9wdHVK?=
 =?utf-8?B?d1BMRHFxTnpMa2djcUFMdTZ0ZTdzanBvUHJjcXhHaWhyYVN6V3hvS2tMOG9j?=
 =?utf-8?B?dHhyM3VqMHdmU21Na1U5ZzVUOFdjMUhpT2NMQnNZdHJyQVJEQnBVbzhHVW00?=
 =?utf-8?B?SzRQVThsYVd1ZWxvZEJkNE8rYTZKMXB6WUw3b253MU40anRVcG8rOXlQSTlD?=
 =?utf-8?B?VDZCQ2thNDAwNnd0eFgyb1BjdTM1bXVMUEswOGJRRmIremR0SmVibXlFN2g0?=
 =?utf-8?B?SzhUZmNDdzcvYUxaanhpbG91dXZCNThNM0xXdThhSjIwamtlQi90L2ZVd0hw?=
 =?utf-8?Q?DcUvHEIhtGujiS/4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68034ea9-032a-46f7-8583-08deb5952f4b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:55:48.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KfOW+GRBPNDzGwknGtmiI4FJl3KtXhX/mkLxJxsyiIsMg+5O6PW+M6R10KSyvy7K8fMx4R0LOC3uxEn7dth9LJQiet0AD+YbG0eBXmyIHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5883
X-purgate-ID: tlsNG-c201ff/1779188152-DBF66443-8CC4AD35/0/0
X-purgate-type: clean
X-purgate-size: 812
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C03357CF6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/29/24 3:56 PM, Roger Pau Monne wrote:
> The current runes assume that in the list of DWARF tags DW_AT_byte_size will
> come after DW_AT_name, but that's not always the case.  On one of my builds
> I've seen:
> 
>      <b618>   DW_AT_name        : (indirect string, offset: 0x3c45): exception_table_entry
>      <b61c>   DW_AT_declaration : 1
>   <1><b61c>: Abbrev Number: 5 (DW_TAG_const_type)
>      <b61d>   DW_AT_type        : <0xb617>
>   <1><b621>: Abbrev Number: 14 (DW_TAG_pointer_type)
>      <b622>   DW_AT_byte_size   : 8
> 
> Instead of assuming such order, explicitly search for the DW_AT_byte_size tag
> when a match in the DW_AT_name one is found.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

