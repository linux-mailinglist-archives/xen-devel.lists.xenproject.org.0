Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFfFHCsPcWlEcgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:38:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24EE5AA85
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:38:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210092.1521920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicAA-0005cO-NN; Wed, 21 Jan 2026 17:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210092.1521920; Wed, 21 Jan 2026 17:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicAA-0005ax-Kh; Wed, 21 Jan 2026 17:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1210092;
 Wed, 21 Jan 2026 17:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vicA8-0005ar-Jg
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:38:36 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01da070e-f6f0-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 18:38:34 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN6PR03MB7549.namprd03.prod.outlook.com (2603:10b6:208:4ff::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 17:38:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 17:38:30 +0000
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
X-Inumbo-ID: 01da070e-f6f0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmV3FKSDMQNi4Jiw5DnrbkwUiZ3Ije58o7Vv0TlX7Qn+d016Y5+TZNP8SPH9MtZmKNJ3vuoP3sSKSOVYXRRvaZeZA+8H+4bdYKbog6pgaVSmq993kg0ZwHZ/zSeX+QhmOpdUPb4YG+VqegjFXBp6kloTbMv9BJXhFFG96tpEfJF08x2Lt9D61EcPEv77wrSf15Dml6zZqlG56zlDcw2jShD8JL9fyLG2J0faVgmNPB4eILrszGQqrSX3Usdx5AjsbvYZlMCJ7vEWSLyABhj7nYJC80s/t4MkSstUoYeZqN1SSi7B8+alGvUwPfka7+K4nl0puOkJuzjgrYec46ZGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6A+lY0SRR4CJo46JRobHYSeSuuY3PRPG+P3sN2Bx4M=;
 b=l8LgJThAGXrIE/Yv26EZLlARCciHwdKstgFGtmMtJf/srRsNlYLQz8kVxo15Lj3b3rLCvTVcYXlH5tvGyKBN3c0X3bzl1Dbugr49DVVQxLEdD0sCGgvRauNi0/1Xz80Ii4HjY1ARnJuw3Htf8LpWnN19yne8Lb7mXhyoHKA+CRjQoBKomBRrQqNSWwYfoxhtE45VM9z57QKmInAxSjBKmbR8puCNuzcJNFqdj1nFWFQeO7FO5GoXIyYTTZ3aqE+oyhb3e3VlP1zQXzE7ZyNFaqvGSguGUHDyxKm8EjERTjArWSOLEme+xvehezmfiimUVvqWCho/LOeJkS4A7eEbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6A+lY0SRR4CJo46JRobHYSeSuuY3PRPG+P3sN2Bx4M=;
 b=zAfIHuTSySi8j0wNqDBMZgDhv4exG6VDoUP9HSQj7uCftSDLvyweQOTV9GVv86bY3ybSnSo24hMb/v7n5iSxb6HHUbOd5c7LZZsHtXgU1PeB4Fj419IRtqQLd9cNdJFFbDQCAX1czZYx/AbmAJo5SUVmN/f1+wMmWHz2xWBue6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 18:38:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] symbols: check table sizes don't change between
 linking passes 2 and 3
Message-ID: <aXEPEwpsaH9pkgF2@Mac.lan>
References: <7e550d03-13c3-4607-bfa5-1a4bd57ecef6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e550d03-13c3-4607-bfa5-1a4bd57ecef6@suse.com>
X-ClientProxiedBy: MR1P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN6PR03MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9ea854-5d57-49f1-b3d7-08de5913e467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHhTeUs5T0g1SEhWaER2ZjBLenVWTVJ6bjkrLzBGWENhbHlpZll3WU5aZHly?=
 =?utf-8?B?T2VCRTg1VS9PeGk3ekNtNElPMTUrMy9NdFVLbXAvU3NCZzY2YXhhalVFa1pW?=
 =?utf-8?B?dDJQSGY4WlNNUFd6VTFGV0I0d0xFRjk0SWcvaFQraG9nMGMvWHlSU29lM2h3?=
 =?utf-8?B?RDYrQW9WbmRoSUNXQ1FhbXBPWE4wWXh0VFZHMVFTNE81K1BqdnhtT3dUU2hs?=
 =?utf-8?B?dWd3SFZFU3Z3dG1UbEthU0N6NzQxNkgvUmg1Mmpud3NQd1RFanlBMjl1eFVJ?=
 =?utf-8?B?elpOTmRwbWsyeTJJR293MHJvUnNkVndzY2tkQ0FNdkdNenJkZmptRVpqSHBx?=
 =?utf-8?B?RzN2R1V4RWpVbE85bE5BelAwWTYzQkdGdVl5eUpPaldHQW1OUUNVYmhobkNO?=
 =?utf-8?B?cGRLUDlQS0ovM0dZL2NWck9JbWxPL3BnZFB1T0JnZHV3L3RmMTBzY1RYY3k5?=
 =?utf-8?B?RVNCeUkyRE1yS2J5SVpJV0JPbDRQTjg3WnY4KzRLZ2dpVGlHZ09WYmZHSnJv?=
 =?utf-8?B?MXJZaWI5R3pSbnhvRExKdFFaMld2L1FQOEx5NmNWVHBHVUtNWmU1eHpKNFYr?=
 =?utf-8?B?TXdGamF4UXZkT3djUHBJTXplbThiQjUyM0grUlFlc0pKMG9FNXVKaVVUR1p5?=
 =?utf-8?B?MXpSK3A0czgrbXp2K3h1Rm55dmtUejVwVUxrb3VLTWQ0ekZFcmMreTY1bkFE?=
 =?utf-8?B?N3NLTDVVV2xSbGp4SzhIby9YeEp6YmQvb3lPYm9zZGNMZHFVNFhzbko1NnJw?=
 =?utf-8?B?N05tK3oydTFjYitwVUlzKzlKazFqc3hsSmp3bUJqZWloZitKUkNLbVloNG04?=
 =?utf-8?B?M09iMDVPY05QWTVDVVF3UHB0L29WOUJJR1JlNVF3dnpjYWI3cDZucFNQRU1I?=
 =?utf-8?B?cDlzdHdLVmJQZFB5TmJTTW16cDRYSnh1N3Rja0prcVJpQ2Yvb3VJSDVnaSsx?=
 =?utf-8?B?SWk4MHZrUXRVdG5EK3A2RzR1Vi9QN2Ryd0FTSDJzL2laR3N3dWpDZDRsNVhB?=
 =?utf-8?B?Q1hIcUQ1YS94aVNGWWxTS1pianZkU2RtY0JUK2FYb1FKR1ZuYVpldlZoNFY1?=
 =?utf-8?B?TVRVOFlqb3FRZm0zOU45SitjMm1PZ2FYbWFURVB5UVBxQmcraWZuYkxST3lP?=
 =?utf-8?B?M1RMRjAzZjk3VHM2ang0SUg5Q0dGNWpjYUYwaG9uaXYzUFBGTGpIdTEzayta?=
 =?utf-8?B?aklCa0J4VmNLMXRWNWsyUDJhWVVVZVVFY0N2dnFOYndOdTRna0lTZURCd1Iz?=
 =?utf-8?B?N2NzaUFRTCtzRGRyY1NzdXNkREhKdG45Q0IxVGlWVS95cURLK2pXazVoWnVK?=
 =?utf-8?B?bkdFcDhsRmhNRUEzSkU1V1hZZ0RaUzhQUnJ5ellGbGl1UlFBR1FES0kwS0Nv?=
 =?utf-8?B?QnljdWtIT3YyMmRjOVNJdDJVY2ZyREhlVHBvMkUyQWNWbnh1dEFFNEhkQlpm?=
 =?utf-8?B?OFNPcU5CMWpLWlRHalFTLzFFY05mZ3UxaEJGdTFSNnlUUDZDT09zeWxUNStz?=
 =?utf-8?B?S3lCODk2MGNHZVozcnNwSk9wL3pxd3lrV29sblBYTVJHWTRtUFJuaHFZSXJR?=
 =?utf-8?B?T0FscklBQWJLN1U0VEUwMGgvbTlEV0c0N3VXOVZ3ZndlM1U0MFRpMjllbjJU?=
 =?utf-8?B?OWZkUE5QRGtRdnN3YjdUZ3p5TzY3MEg3dks4d2ZtYWR5dlc3bTJpM0VlYmkz?=
 =?utf-8?B?NUpvNytCTEM5SkJoNTJYTTVIakI2c2drL3FRVTBGaU5YR0pzc2kwcjBLRjRT?=
 =?utf-8?B?VlRMV2dCSlZGN0xuRUtrdVJjWUtyT0JkT0laMzBVUzhIc1MvZDZxbXZ4Q2xI?=
 =?utf-8?B?N29ManZ4eE90d2RndXgzVEdMbDVxbk9jcWlFTzh6eG91REg0bWRLYm5LckJE?=
 =?utf-8?B?c1Ayek5Hdm1JZnBHTWVKRzkzWW5CTkpSeGRQQm15OTBRK251OGdmUVZ4SGxK?=
 =?utf-8?B?UHd1Qlh3M2JPK0hLaHhaNHpqN0hOSUVpNUJLZjd4Wkh0V25CaStLZzZHK3lD?=
 =?utf-8?B?MHc2eHp1bEZLbGZ0bGJtZlpPdklSQ01wQzh1RksrZHR2Vnh1RTZUQ25OWFpU?=
 =?utf-8?B?WlBnMzlqRUNJcThrSUVhVjAvbkRKazV1N09VQSswalRlOExwSEdTWnBINGVB?=
 =?utf-8?Q?PZtw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXpwc29mUzMyL0k2VHdyUVo0TldZRFhhbnk4ZDhmVXNQZmZZeUZjVWdNbEgz?=
 =?utf-8?B?VDdja2lEOVMrWXBvZ2xENFRJZ1ErTnQ2TmdhbDFEQTduTlpnSzJVOGVCb0VW?=
 =?utf-8?B?aHVrMmJXMmhhcWlEQ25tYks4c0pFS0Y1NlBuT2krVVFNZVJpeTBBdktSclRv?=
 =?utf-8?B?RkF6ODdrRjJGK3hWZWZzY2NISGVmU1JuZ2hJTUlCSG5yTGtRV0lJU2NETmtq?=
 =?utf-8?B?aVBCQ2NiN3M1bjF3ampJUlhQb0pDbXlnWjZtdEpLSitCVkhkRFhodmlNc0VV?=
 =?utf-8?B?ZXBHUXpLYmtZODA2YmxXL0E1Tk5HaVdkY3lEUGx5N0pLU1hESUNlVGZkTzZT?=
 =?utf-8?B?M1kzRktoRVFlUmV6NlJGYkNGYkZBdEtTSXM0N095c0VYejlxdG1NQXJhcWlV?=
 =?utf-8?B?REprZkVRNEJkN0ZXM01qdHBKZU16OUlEemxFM2lEZFVEZTFxUDlWZVNXdlBv?=
 =?utf-8?B?Y1puU0duaDJDZFNaRXVwSUpVYWdHZkJkUzZiWkxaWS9zSnJvYWI3TGVwTExH?=
 =?utf-8?B?REZCYnIyUlN1TDBWdU9DN3lJWFJtbURhUGdxK1duTFNUMGJ4bVA3bGN3SGRo?=
 =?utf-8?B?dENJYVJYYVNWcWU1cGs4d3BYa3BsbXFNMFNIZVVzTTUrdHNSTU5HNnh6YVln?=
 =?utf-8?B?SytXSklmc01hMXFxWURvWDJmOC9KOWh4eXpjRCtmZmhFTmIzbmEvZjJZMDdx?=
 =?utf-8?B?c21VNUlpNFJRNzdFZkJHUXFVN0Qwb255QkZEWCt4dFd0ZWJoTVRPbDF2Q21Z?=
 =?utf-8?B?WGZ5Smx5bC9QQzlES3c3N0VtbEJaSEFZL0wvbVZ1K00zempSS1dodytrT05B?=
 =?utf-8?B?VktiOUFmeTdnUE9LTnpHVGFYQjI0NkNmNnFaR1M0bU53Wi8wNS9lY1VhRStr?=
 =?utf-8?B?WW1nUEtpalU0Tk4vOEdKcTZDTzExZ2ZXaHZGSkRvWEJWc0h6TTlZdHROSjhU?=
 =?utf-8?B?aXFySUpjUnM0aC9VNVpKNTlVVVJEUnh3RURDMlVMZ2pERVVPSXdPR2pIei9x?=
 =?utf-8?B?RTlFanV6L3BOL0xTMm44ZHZsOThJRWNOcWh5Z2tETlk3REgrdHBOQlFwR3Ns?=
 =?utf-8?B?WDFzY0hiR0kxWVNRY1BNUXRCdmNmenV6elZHclVGeGhSbkY4LzVpbnV6YitO?=
 =?utf-8?B?Wk1jSmlMRko4RXhsK0lOQnJLdnc0cXl2em5GUFhSRk91ZENYck50eDRuSW5h?=
 =?utf-8?B?d1BYZlloQU15SnFRR3VkUGwxUWFvWG8ycTRqeEJnQ2N4SGkxNWw1OTF4eWhT?=
 =?utf-8?B?MERsVTdXUGxweFRuT0lTb1NVQWloc0cxb0hBZWxzK2FPVkNDc1R6b21EbWJs?=
 =?utf-8?B?RnpuQko3YjdZSFNzZnh4ZjdoYlhBdWpkeFlWZmRlTFptV0pzbCt2eC84UjBt?=
 =?utf-8?B?eldocnZjUkwyMk1URmhzZE04c2pQOXMyMW9ueXA3aFZLeUZ6bUlRR2N1d0Fl?=
 =?utf-8?B?RjUxOTNLMnBpZUNwZXk1eVNiS201SnhMYmZkdzZEWUU0QmIzZTRNSGFDZkZC?=
 =?utf-8?B?MEFpM2E1WCttZjJ3cFdjQ25mMmpBa3NPc1d5eWljbXBuZjZFV1lKQUNRZzh6?=
 =?utf-8?B?R2g0SjNHNkt5Y2xRTHMycW9nbDFLclJOS01iMG1ZZjB4akhXVGRQT2JsK1Iv?=
 =?utf-8?B?TXdaMDRRUDBIVytjL3M2cWFSbXZqeVk3U3JRVzVNa1ZhN25nUzZHSkhYQko1?=
 =?utf-8?B?S20rZkJidG1FQXh5RUVGcnN6RWo0S3ZNbUcwTEd5SWNVRzNpYmsrVWsvNWdp?=
 =?utf-8?B?Skk5U1ZuSURsM3ZIYzlRTkZkVVhFVW1rV1FBUWNHb0EzNUY5dXVzcEhCU1BQ?=
 =?utf-8?B?anR3OXZrZ0pRc09mMlp1SVk2Z3N5bk15NmJkeXRwUDZyL3h5Nk1KTnZKRnJL?=
 =?utf-8?B?eWpxbWRLUzkweTBQek9zZjY0TjAwSXo4MDRDcU9sUVlOcjgzZEdBcGZkSEM4?=
 =?utf-8?B?RTRhUG9KYXBMSHZGRzg2UUVoV1JSQWlFOUdmdUpQVm0rTTNRM2xqWTkxUkdH?=
 =?utf-8?B?b2lrdlc2K1hUWFNuNzRQaEI3dU90MFk0N1hFcDZyR3oxTWVFTXowcG9NcndT?=
 =?utf-8?B?RzluTTV4Z2hZVjVPUWRQK25VZ3hrVnNKTUhuS21ZNmZjSzRGc1lsQ2twM2dx?=
 =?utf-8?B?OG54U2F2aHMrZ1VLcGIxdDJnVUNVQ3ZLNitSQ2RvUzc4aEtaWGJsUWZ1dERk?=
 =?utf-8?B?RVVjMzVic0dFOE1ZZFVkQlExWGVpWUNQVW41OFFjOHNkcnl1eWx5VjhRTlgr?=
 =?utf-8?B?T2hoeUVqQzlwRXhlbzhWV3RUUTBMSUxSMUFBSzlVYlNURC9vQndVamltRTRz?=
 =?utf-8?B?Y1llTVJ2WkFIbk4rcmJnYVJxVUF1eEtnSnAzd084ODZvUERiai9zdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9ea854-5d57-49f1-b3d7-08de5913e467
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:38:30.7297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avJXJG33wob9ejvm/Rxdq9bPYH/orZ2ZN1hmaRpEu/KJ9D1x7L0gqk9Jrl3KcuqqgTfyonuHLDPvo4E2rrJg3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7549
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:email,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D24EE5AA85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Dec 09, 2025 at 11:11:40AM +0100, Jan Beulich wrote:
> While sizes (and possibly positions) of the symbol table related symbols
> (and as a result other ones) are expected to change from linking pass 1
> to pass 2, no such change should happen anymore from pass 2 to pass 3, or
> else the internally recorded symbol table wouldn't represent the ELF or
> PE/COFF ones.
> 
> For comparing to be actually useful, i.e. most notably also covering the
> last of the arrays emitted, symbol sizes need establishing. Make use of
> the xen/linkage.h machinery to achieve that.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

