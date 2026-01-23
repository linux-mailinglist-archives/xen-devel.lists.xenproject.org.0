Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFkzDWu5c2n/yAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:09:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794567961E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212449.1523567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjLaV-00043r-PX; Fri, 23 Jan 2026 18:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212449.1523567; Fri, 23 Jan 2026 18:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjLaV-00042N-Mg; Fri, 23 Jan 2026 18:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1212449;
 Fri, 23 Jan 2026 18:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sxq=74=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjLaV-00042H-3O
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 18:08:51 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b8318a-f886-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 19:08:49 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB5961.namprd03.prod.outlook.com (2603:10b6:408:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 18:08:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 18:08:46 +0000
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
X-Inumbo-ID: 90b8318a-f886-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5uNOKRlpL1EkA0PUXWt/94jzcOJ3E0DqgIaHfjtHkUQJsriUjUIAKGPFCPyDxUWvTt3ydM12TEwnJdjCh4xwoU/XqSPza7i0B8bZO8S86vdfR+Ywj5wqgaBV9mJlH5I9VZVmmOpBF29b+8HNMsoOxouxTHew8NBIaLmsemj9w9bnIfIgDo2RuWn8l10eJAHbLmazMRWNuXw7Kyvbq/s6WenRnJMdvbQqv51CZWLSESuTSalJ+wZZoFuja7mgK8w08cbbkYtiTdOkdNzCsEnKhxm/dGz3ThuqYaJgE84O17P3kYYQ6WB1Bp+BZxNQFjX/6R/tPae/FVvMsD3a8lRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62NfDDEvfd1aVyeL4f97hlmw6DmXRzMdkbN/W+svQhY=;
 b=lIH4kUGbdykWdbvzv6x1FDUTRmY4ovOxHEXExSvnLRBJDMVruCc1OyZGGQ5UNTKCJDK4gitv8xCqcF3MjBHN8ng2Sh6Vz1pEV6YDSyctDfDt1ityfxjicmyB3e2uxTerXsQK9BxFA+8kAQ0iEF3JlDEtJHJMnKBBsJeufshEAt+8YU+m0NO4THRt5jU+s9LnVM/ZRjAE/xG6ejXD+7nQeQAGrPyTp1wmWK53j7Wqevnsj0vwF5evRa8586Xyu8f4bvc6SmMX/6yuwu5rXt46URGcmMRQNU80VzRnAMakMn05sGp2WeHbdw8K6b3cj+HEcDIg0XENQDMtjuGXvH0zMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62NfDDEvfd1aVyeL4f97hlmw6DmXRzMdkbN/W+svQhY=;
 b=If86Mp9nXZzWosBPeDDhC+m5ya/MjUV2hAvDvbkfrTWl4LGHOFtoBwki+BDX2tB3obPm9HDqqy22skf0zYGEnX7cnOzj29WdlJVxcuND1AveOPBBR8174elLCxP1Rd+o6Pdwa9+r7SAGglg/jEAY/748jSDSBrjIr37ong3x9qY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b926cd09-dc65-49aa-b6a5-36ed46a270c4@citrix.com>
Date: Fri, 23 Jan 2026 18:08:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 4/4] x86/svm: Drop emulation of Intel's SYSENTER behaviour
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-5-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260122164943.20691-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: ace5f243-a52a-4f0a-b1d5-08de5aaa7351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wnl1NEx5WG1RZjloZkgxQVlrcC9ZMTJCZlFaNkE3M01XWjVWRmNrVVBmcWo1?=
 =?utf-8?B?ZnZzdWR4UWdtWmhTRHp2cDdlcjQ5cVAwdXZLanZUaUJqcWZpNnBQTXVJdm5r?=
 =?utf-8?B?YytVRTJRM0g0UUcydm0yVFFZNS93UzN3UjFwRGpRSUFMVVM4M2ZWQ1VCWExh?=
 =?utf-8?B?d1FnSlhHZXRMV3hHaDBTaTJxL1FxcXJxYWlUMDBMZm1zZnpVTE00eXg3Y2V6?=
 =?utf-8?B?YkhIUkJpL0ZEK1VKam0yTnNOMEdyWVRRZHhGSFNOVEpxdkhYQmpaWUxxOVZq?=
 =?utf-8?B?SDBGaHhENk80Q2lzUFp4LzNIM2Nad2JQR3VtOEdmU3J1RVZxdUphWjRBY21a?=
 =?utf-8?B?NVozVkVpS2Y5MDFvMjRjKzdzcmVYcGNPWENsUFZkRU1IQ1VwWnlxeC9mazR6?=
 =?utf-8?B?VFUwNkJBSFVGWTRBZXd1WC9LMmRrcUNFNVJ4cHUxcGVINVd2czdTQ1BFaVph?=
 =?utf-8?B?SFVOMVpoMXdBNkIxWTFlK1pnTjZNTk1lN1lHK2dPUUl1ZkYxcG9sVHgwUU9s?=
 =?utf-8?B?eVltWWNsdzJjWWVQQ0trdmNaRUJlM05QNmhwTzdIV0c4TDdMYVIrNW1BRGNZ?=
 =?utf-8?B?d1ZEbHJWTXhnQ2pCeFNmWHordU5BUGZ0b1p4bjM2Zm5WQitqY2gvdWZXT2FZ?=
 =?utf-8?B?WmkyTFhteWlzT1cxbkpyVEMrRzYydHlSdTlZUm9BTFZqUFZEbGVUN2RUYUlY?=
 =?utf-8?B?dE9id2NyUklMNkVWOTZmZ3pWV09oMFlyVXQyY1JoTkZrNTZudDVleVo3YXcx?=
 =?utf-8?B?NGtuaFQ3d3ZyUzE5OFk3RFcwbXZaY2svVjZaUWxzNFlUUkhjVDhwbERUNmt3?=
 =?utf-8?B?d2lWR1JEeDhwRFc5aXc3R0ovS2p3dU5OaEl2bFdWRGdvMnZQMG5EaUZvWWRQ?=
 =?utf-8?B?V0QzdG0vSWxRamt0K2J2am5SVXNlM3B6NVNOYzVjajQ4UXRiWW9nWlUvc1Qv?=
 =?utf-8?B?L3hlakdnUDJWdUE5OFo5WHJCVUsyL2V4U2hkaGcwRHhxTnlwcWYwS3c5YWJV?=
 =?utf-8?B?bE9MZnQxbDFFaFVDVlN4VS9Ga1lDbEVVT0ZDQm1CRjc4T3NnWEE0NE5KeXN2?=
 =?utf-8?B?VXNFaUUzSnYxWDJPei9UeWdmMmkwU3g1QlE0UzIxKzJKQ3B4dDhGdmkyWGRl?=
 =?utf-8?B?QkkyTzFTWVRVSWxSTHkrRVBuV3R2TVlZd3VyZ0dFd2hQVDVOdElFbG4xTUlw?=
 =?utf-8?B?ZUk4VWNEd2FYcGJFMGE0bFdxUU00cUY0RDRHWTJPNzBtQ0VMRlNXWkEwTHJr?=
 =?utf-8?B?Z25tM2VOSnB5VHJORUZvU3ZtOThEV2ZhbGhGVTByOW05YXFTUVpsU3Z5Uis1?=
 =?utf-8?B?SVBiNUJkenVmMFFoRENubDJoMEhqZ0l4QnpMTEF4SVJLVklEY0VFcEZnSzRO?=
 =?utf-8?B?WURnbDlCQitwWXd1NExoR0dETTN4VlBEbUZUSk1VaUZ1T0h2Q2ZMNEFOcEhI?=
 =?utf-8?B?RW1XUnhCUDh3dWpuOEluSXhQL3lSMEx2Wit5b1loT244MUtISU8wYy9yK2Iw?=
 =?utf-8?B?dVEwQkxMYmQzVkQvSjR2OStUOGVPMDQ1eXVOWWxjbWFPMk9OUmxJbFlvWTNB?=
 =?utf-8?B?Sk1FSDJJazFwUHpqYTFKaWd6djBsVnRYcTVpbE5JdWZUTDZwRFFlRWt6Z3c0?=
 =?utf-8?B?NS9XS0ZLRGVLNDBMZGNYMXhSbGtzcWlWazRNUDI0NTdFQ29tZnJOZDNDanND?=
 =?utf-8?B?bmdoWnAxdzJjeTFzZmd1Yy9BYlNycWlJb2kySUNlQVlnbHFqeUtXemJ4OFlo?=
 =?utf-8?B?Nm1WTnhFbjJYV3l5aGFhcWdrSGZBQjJRYlp0eWhNZXR5WnN2VjdyZktxV1Z6?=
 =?utf-8?B?UlBaZGppTlBRdEhWZ3hVc2c4a3BRelc5a2lPVEp4TXVPZTRSVzduNnlpdlBx?=
 =?utf-8?B?ZHlSdThZSXdBTUhUUldWTHo1OUo2VXdyR1lualdNbjNKVEhvVjM4cGtYam9N?=
 =?utf-8?B?Z09FdmZXSGJHNmlpODRuV1p5ZC9yWEtHT0NPMnFLaXJBK0Z2VzZGRURhS2Zv?=
 =?utf-8?B?dXc0bno1NzhIRzRKOFJkOVM1UlNIMU0vQ3hwTExnamtncnBLa0laYnAvZWlp?=
 =?utf-8?B?T2NSNHVCZ3NFVThXSndVWlpwNXQ2aXovZktHWGpCZGJ2SVhRWU5DUWJBTFk0?=
 =?utf-8?Q?dGrM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YytxWDlLYmZicXpyM0U3OHJqV3QxRkJlR0NxTWFUejU0Uzc5UVFyZG0rYXlU?=
 =?utf-8?B?djJDcC9oMWg3WUxvOGxWOG5FUkZkVmxxK0hYemh4QzhFUlhMQVF0WktNL0Q1?=
 =?utf-8?B?QlNBWUhjLzBmL1dJTzYxenhqKzMrSmhtcU4wT1BYakxwbGhNWXQ2MnFyc3Jq?=
 =?utf-8?B?R3JLWGhPeWUzb0FIN0wrd05rcnJJK0RCdEhueG5mNjZNZ0hlNVo0SUdsTGRN?=
 =?utf-8?B?MjdJVVVlQzdmTzhPTTBRV2RyZ0RHZE01Z2xzeWFtYmYvUUhmL2dqNVVHMXly?=
 =?utf-8?B?Z1dvZHd5K0dHMUEza2hBQ0dSYlNRaHozdlVhYTAxUDZTTWdURktrTkgrdVFm?=
 =?utf-8?B?amdPSDd1MnpISlNHTjlzNUdGQ2FsVmlRSW5yanFoNnBjRW9kVytwYTl6WW56?=
 =?utf-8?B?Q09aa2VWamNaYmJJSUxkcGFIRmw5Vm9obDFMQTJKTFhmRkVjYWxVSjZONUYy?=
 =?utf-8?B?Z1YyeDhDdTE4eEgvNU5TQWU0SGZTdHVmR0hrYkZmc0VDRVdYQlZ1M000TmNh?=
 =?utf-8?B?VUZMMzNZRzh3VEM4YWFnN3UwWWRId2JzeTZVaXdKQ200bzFCS0sxY1BQSUwy?=
 =?utf-8?B?OE9QWlVxVDFPaXBhOHpMQ0dFQjhQdzg2UlRtblhmR0xub0JTcVVqKzdCWHBS?=
 =?utf-8?B?cU1ZeUhNQmIxcVMvTUZhMnNGOEoxbTl3OVFOZVR6NFhqWjEwZmgzYWh6dzRv?=
 =?utf-8?B?MG9iVGhGeUVKdWQvRGdteFV2Q3ZFY1pCTFRKcVZtaHdiNGIycldQdWdVZkVo?=
 =?utf-8?B?WlhTQjZCTzZXZ2h0YXdnUlZpb2hQd20vNTV3bURiS3FhVklmNitBd1phQmhM?=
 =?utf-8?B?aGM2ak42L2NQQ1VpRFV4dXB6aUxocmlLeW1XdFFwZ1dvOWtpR1NzaHlpVTcv?=
 =?utf-8?B?YU1xWWlWVnlJeGhBL1dCd21FZHNDSzRmQXFlZDZRZ1RNdmppTWx4bVpSQ3FR?=
 =?utf-8?B?RDNDcVJvRGhKaU5teDJDRnhnWm1QVkVrUHY5ZThFNkdOa2lDUVJPYWxPVXV4?=
 =?utf-8?B?NkUwOWR5NGdPZ01iTk1LZjlEeEZadGNHMjZvRVd2eHI3UXIwMjNwaDFsWFdn?=
 =?utf-8?B?YjBIdm0vYnZPV2psdFBUYnRaY0hTRll1SEVNMlJMRFBtZHg5aU5YMktuRklm?=
 =?utf-8?B?N2d1UWJJSmF4MEMxeEwwQk5Bd0NMVlNCUjFaS3dtK2pMT1FxeU10R3JnTms0?=
 =?utf-8?B?MWt1ZTEvSXNRZ1FIUkpMSW9VWk1tbmtaYjNIVmUrVkpjQUJaK0JjeTljRFAr?=
 =?utf-8?B?eU9nNnF6V2N4QUhxSmFMa1R3RGZIV3B3SHhlelFUaEFabUFMMmpEelIxTTRn?=
 =?utf-8?B?SUtQcy90QndYQ201dDk1L1hSUnk3RVZnbEtmZUpiZDNKYnZCMm9aSFdBTUZj?=
 =?utf-8?B?akdVbWI5WHgyMHJNV1g0ZmFNQlJRMG80bllXM29idE5vQmZuMkhTaFVQQ3Vk?=
 =?utf-8?B?b0sxTklzNm5velRkT3pKTVM0Qkx1Q3czVG5hbVdyKytmWkJrL2xzQTF3RWxr?=
 =?utf-8?B?RURxbmJpQnAxM2J0SzdDQnp5YVdlYUFyNnBWTWFwSW9weHJJbmxISE9kQ3ZJ?=
 =?utf-8?B?Skkwa0NpWnBSRUFmQXJZdkFFSitqbGFDVC9nT2EyWnkvVUthbllrNVdBVTQ4?=
 =?utf-8?B?dHE1VFYvN0ZRMG9kamdRR1o4UmZSV2x4ZXl0Q1BIclZwMkZqZXpOellzenFQ?=
 =?utf-8?B?VVF4ZTBKSzRHTks3WWF4RG56WVhvYUg4QjhJWGE3eVZrYlJTOVZaeEg5R3VS?=
 =?utf-8?B?YURZY3lTMnl6cm5WT3ZTWDM2YWxrWDBXbXRPSmN0YklXTEVKUEliUWdtajVO?=
 =?utf-8?B?SzYyR3IwcEhqeUh1Yk1OSHJhaWFZbWxQYllpc0QzMGZiMXN2MjkwU1pFcmow?=
 =?utf-8?B?V01SdUY0UWlkbC9QaVhzWVpWb0J0a0hnN0lEVmdXMzl0ckRpU3p6TGtiTVcx?=
 =?utf-8?B?bWNTSXFQcnY0eFVMVERVdTB1a3RrcFpRWGlNWWV4bk45dEpPeHJldzRRTVYx?=
 =?utf-8?B?bEN6U1hVSDBLNTE1LzRoTnRNSEJIVTVyOXZEcXdNNHQvc01YT2xFZk5uUXA0?=
 =?utf-8?B?d0hKTGMxTjRVUUF0Ny9tQnk4YXI2amZ4Z2RPWHVtdFVZWVNYZGtoZWJHZzRt?=
 =?utf-8?B?VmRTYlVVTU5NOXRUYmt1RDE0TWtLQTVYeUI1WEZBZk5sZUxFZWRVZ0luRktK?=
 =?utf-8?B?TVBCc2l6Uis0Uk5DUE0zeXQrSk0ra2VWV2xnZ1d3YU82TTZvSk53bERxeFZW?=
 =?utf-8?B?L1RzUG0yNzF3OUdTRHpkTnA0MVQxV1RPVWdLQzh4MzNVVkhEQlYyNERZQnM4?=
 =?utf-8?B?OERoNTl2R1FVK3lNQWxLYmp4aEJYcUs1alZPams5YXBiQmJJeDY1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace5f243-a52a-4f0a-b1d5-08de5aaa7351
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:08:46.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlJBnvVOS+Tm1eiwjPF6rObdxtD5dCwSKUiElYBiMgetqlWIhrMzSjCWqnRAwHVpRddaberJ7sc21mb/C68AO+BNwt9JhUrninvdy/ixhGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.873];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 794567961E
X-Rspamd-Action: no action

On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
> With cross-vendor support gone, it's no longer needed.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

You're not really dropping or altering the SYSENTER behaviour.  You're
dropping the emulation of Intel's MSR behaviour on AMD systems.

And this comes which a subtle change in behaviour that is relevant to
point out.

Notably, AMD prohibit the use of the SYSENTER and SYSEXIT instructions
outside of Long mode, and they're behaviour for MSR_SEL_* still follows
the 32bit model where the upper half is write-discard.  AMD CPUs really
do only have 32 bits of storage for the 3 MSRs, and unlike Intel, did
not extend it to 64 bits of storage to support Long Mode.

Xen previously (and unconditionally, irrespective of same or cross
vendor configuration) emulated Intel behaviour on AMD CPUs.

I think this is even a latent bug; on hardware that supports
vVM{LOAD,SAVE}, the intercept doesn't trigger anyway, and this whole
emulation falls apart anyway.

Something which is very much not obvious in the slightest is that the
MSR Intercept bitmaps for VMs apply to the RDMSR/WRMSR instructions
only, and not to implicit MSR accesses such as
SWAPGS/LKGS/WR{FS,GS}BASE, etc.

Anyway,

I think it is necessary to note that VMs which were happening to store
state in the high parts of the SEP MSRs will now lose this state.  It is
an ABI change, but it's acceptable because there are almost certainly no
VMs doing this, because it's not how real AMD CPUs behave.

~Andrew

