Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OfysOciwjGkvsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:39:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165B126396
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227942.1534318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDEa-0005mf-To; Wed, 11 Feb 2026 16:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227942.1534318; Wed, 11 Feb 2026 16:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDEa-0005kq-R9; Wed, 11 Feb 2026 16:38:36 +0000
Received: by outflank-mailman (input) for mailman id 1227942;
 Wed, 11 Feb 2026 16:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqDEZ-0005kk-1O
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:38:35 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191d3bb7-0768-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 17:38:31 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB8016.namprd03.prod.outlook.com (2603:10b6:8:1fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 16:38:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 16:38:27 +0000
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
X-Inumbo-ID: 191d3bb7-0768-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbarvTXPK9ntBZ7nIreHepIFuRZQDgant3bNt/kv4wgAp2qiatC/rMBcUGlJ9Zq6CgUUcFxXOmPYlJ8OXEUzvd/h1SUGmGBMK26Wve1cVJzU6nf2zJzGtxCcYfHed2haRjsCBgnOF4ANIDs0GGU5YMjBSIf3sMNyFLFC+mK9vnzdQBVi1rC8jGBELjKEI1fPk3xiSYXKowVwAdn8t+fsQ8LYVVPw84oYvOpd5SN3SzfUwIHyjrMAJ9Q0ZxwDaYhrp1nhjiNdo/N4FbrTuS2BY5iOabUf6SlfP4DtknbW3N//SYdfAbCZkqfeznNS5t7jJpPXBYbrVqSw5SeXJexA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSgH1rOR/UYO3qR//dXq798FVDGk5S2/nveeqKw9PYc=;
 b=DWwh3/LSUnHjXs+RHAG2RGbR/zdhHzXVkoQXLaREL16xJPYflwUAOvoRTApM3xk13mT8I7yAopMiEIdgW92gaRxXDC7V3u5da6mba8nAXKyrwZQL9pUDtoFm3k4X8TknKZhBW5OMMug3LdUf549Kd+4BBJ9vbE38U5l20IzUpM8lkkJVLD3Yc4WShHwnKFmYDj+q/VWG0yqpjCk7qyn/I4VxHgbKekxtCrVWnjIjVeD4utIi0s8n6gvRjcKw/qnxVbJeSdCFU3Rwzf1JqZjLKV+YrEox235HkLMPEMXOeKIFRsKjbNihhfcqYCc++WLqScPlkrP1dbfjpIaXPifn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSgH1rOR/UYO3qR//dXq798FVDGk5S2/nveeqKw9PYc=;
 b=UwuA42lpZsuK9TOLofWV8+L2wymuA6GSIfmJYuC8v8Lm346NZLjivsWLKzIhpMRgxv+AJY3REfq8H0ZWjzDqbaRsVpmZiVm8jV3LeMe0ck3eYsCeTym0Q0KoiOHYhdNNMvPfbcTqZVjFINgJCWrj+roTUSn0Ndv+KvDH9F1l2Hg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 Feb 2026 17:38:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH livepatch-build-tools v2] Treat constant sections as
 string sections
Message-ID: <aYywgMMoCqOH7hWb@Mac.lan>
References: <CAHt6W4ejPT-A7bGfrZGW-8zEBxmQ__LVa91GRcXhYZO_3C1meg@mail.gmail.com>
 <CAHt6W4eQmiuXfBfwi-Wzpp+fzCzr-JAO45+OD3tc5PQXE-0WXw@mail.gmail.com>
 <CAHt6W4egn8t2NKwPEquHG=p67C-kNzfCTrS9dg4K=Qjskntvyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHt6W4egn8t2NKwPEquHG=p67C-kNzfCTrS9dg4K=Qjskntvyw@mail.gmail.com>
X-ClientProxiedBy: MN2PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:208:120::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c62659c-76e7-47c0-330f-08de698bfb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHBzT254aTJaek9SeEZLWGV5aTJtMHR1R2tMVWp5eVNScVU1M3ZGRWVYYVAz?=
 =?utf-8?B?WHhWTWNsZjRaUmxKd3JKVnBCUGxvOHlPc3pQaE53eFJqa2lSSWNoanRxYmpr?=
 =?utf-8?B?Tm9pYW95alNGcmNOclFXWjhDcmFjdlZKVFdVSEQ1UFFCL0hkeFBBRDlvYno0?=
 =?utf-8?B?dEMyZHVzcVZwclAwVENpdGo2cFhYdUIvSDZUWmV6cmFTM21qK2NyOFIrRGlH?=
 =?utf-8?B?djN2VXI0aW1pY0w3M043anUyNkF3ZE1QU2xOSFdsMDIvYXFGUEI1M21ETTJv?=
 =?utf-8?B?YmQ4OHNjWnh3YWtKVWM1ZW1mUzZORUZibDFORTNNS1JpNFpnVnpIUFNpelNR?=
 =?utf-8?B?QWNRRFJUYkxPRzVwRzA0N1BrNmxQRHpoaGpRa3FsYzFZNWFMcXREWmwzY3JH?=
 =?utf-8?B?MEwzZ3RCR0FVWmR2dy9BNjNicUJzQ2NoaktOTVpHM241bGFSRjkvOExnYUkv?=
 =?utf-8?B?R0EvMXNGZmlxYWJ4WWQ2SUNmZE45ZnJRZHprSk8xVVZHS1ljb2F0aERMR3RT?=
 =?utf-8?B?RVN1QUxCQU5CK0RtRGVSRHRoQ20vKzBwemc5QjdFdWYwUUpuRWk5TUNYZWVo?=
 =?utf-8?B?VjdLY2JNYUF4RlZib0o2RzZHdFlyc2RMY05DdmNRY0ZyNFN0M1BrVjVXbzBY?=
 =?utf-8?B?VE1ROGlKZmI1NGF6MW54bklCUzhKamNXclRCdkV5Vkcxc0l3ZUh4YlZHWnJ0?=
 =?utf-8?B?K0MzZ0tZQWFSTS9wcHZ6UUs5R201Y3BRdDYvQmxPdnlXM0hJdTNnaFg4VHl0?=
 =?utf-8?B?NTZFU25BcFJNdm9idmdNSjM3LzlmWHlpMXlLL1ZWSlp6eXFacDV4TDVLS0o0?=
 =?utf-8?B?RW5na1FwdFQwTGJ6YWY2RkJGd09ZVkpFTUU2N0pxYWd2c2J5Yk1TVEVTbUF2?=
 =?utf-8?B?SDBJUEJ5cDd6d0Yxb20vdTZraTdpbFZuV3ZqWTFEQUJFRTN4dUt0NkdXNkll?=
 =?utf-8?B?STRoQ2NMTDNBVzBiaTZXeWVKenBZR0IrMGVCemE1dFRRWlR4OXlHa1lBdWhS?=
 =?utf-8?B?QjkrSE12dzNKMHlFQ0pCc3lWT2ZiYzhYcWJaMlRDY21zemFVVWNjeEUyL2pv?=
 =?utf-8?B?Vmo1YWQ0V1U5dEFEbUZSSnQrUmo1UklFaVlvOHV5UEw0TUV6SzQ5OVFibndP?=
 =?utf-8?B?cGdFS284QU81WmV5QkVZZnJHZ21jL2U4UWJNUUdYa2M5SnExVDhqd2JqRHJY?=
 =?utf-8?B?VkJhbko4RUtyaEk4WDNEQUw4Nnh0SjhzcnJ1SFhvYloxZTZkMEhTMUEwc2xE?=
 =?utf-8?B?ZjRpdTJnRjJzUWRyNjJZRmF5VnV5ZENnazJqYk9TcEFZNHVYZlFzais1dmZC?=
 =?utf-8?B?V3hoaXZpRW54N3FHcEszV3Z4VklDR0FDRyttbG9uaDVtZGhNOUNCK29hNkpt?=
 =?utf-8?B?WDZqMFd2TVVETUg5VHNUZXBIbGZJaHlVQ2dzZlRLWTU4SWpJTXJlcmZCUXhm?=
 =?utf-8?B?MllJc3h6cDN5aHlETU1oN3pRZC9pSVdpUW0xdGlqbVZ1VHpGZDh6d09sOE1Q?=
 =?utf-8?B?cXFOZVYzWUJxQzJCUWF2WjREejFLRXM1Qmxabkw5dkNweFNPSExBQnVGUzYy?=
 =?utf-8?B?Z3U0ekk3UmpoUXNWS2szUlZaU0c1VGRpQkl0RkI5QkhMUmFpZG9FTENRVDV6?=
 =?utf-8?B?N1c3c3lGWnh0TWN5VmFTUEZBcW1BWEFPTDFZd0hqeEl5bld4cGV0YVZtUlM2?=
 =?utf-8?B?K1VyOEJmcUI1dHdhc1BneldWdytoR0s1MjQ0aHcrTGtSOUhSRUpWOGk5UW5U?=
 =?utf-8?B?dzRXMjNiYy9zazJPUzBKSFpyMlNxQVl4WUxlSDNTUWNJaGF3WjVmdFhXd1gv?=
 =?utf-8?B?Vnc4YzE4NkZMK3JWZWRydVpoZ3lKWENlOFVybHB6clNhMldvWEFoSjBrVUZM?=
 =?utf-8?B?Und1U2s3UDlhY1JGUExPTERHK3ozVjZ3V3NWU0EzWERkck5mcUhvOUVIOTEz?=
 =?utf-8?B?RW9mMHFBRkRqV2NNd3FabGw0blA1dWQwWS9OSForcE5rdXZsZjdkNmpQMWxs?=
 =?utf-8?B?SGVJS2VnQlRTeTA3c296eXArU3Ivc1JTcTJIMVhRZDJ4dDdRczJWby9UV0Rw?=
 =?utf-8?B?UjJwcStWT0pzWmV6aFRpZVg3dGY1dW9UdGM2KzYzUXA1R0I2NU1VSHVqWGdL?=
 =?utf-8?Q?tjF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHVEWkxib1ljbFphcnpuMnNoMGEzWjg4dERWRk5ncUNTLzZ0Q2srUGtzcTV2?=
 =?utf-8?B?MUNWcWZmMkdEQzJPL1NWSUk5N0ZzcWwyVlZScnNkckpPUEV2UUVibmcxZHJV?=
 =?utf-8?B?SVRDZ3ZaTnROSUl0UnkxczZ1OXkxeC8ybWE3bTV6eGhLNDJpZnd2WUdlTkd5?=
 =?utf-8?B?emwvZ1Rscm5Md09kRWYyQ2hyZEtrU0ZFaEJUZlFLMXRLZFIyU2ZpNERwZzgv?=
 =?utf-8?B?OEUzN3ZybHlCNkNpcFJ0K3FoNzB2d0tkRndpZUpXaG5NdUJ0a0JTMkNkSXpO?=
 =?utf-8?B?K1RBNVBka25HTE9GZjQvekdPRlNoSm5hSVRxdUk1RzNTdTdLMEc4YlZsSW9a?=
 =?utf-8?B?Mjl3RGg1VXhEemJrdXdoZWU3Y0hDaHFHNERtMXU2VTNndVVTL1BoWllqa1I0?=
 =?utf-8?B?dzJ5N1pJSXRUNkZVNmVITzV2M1Q5RXlseGtpNThaRmN3RThjUmZpOXJ0QkFx?=
 =?utf-8?B?eWltU1UyUExzUUsySTlsazhVU05OcnIzc1FrUTBpemt5cWJVaWNQQXltVzZY?=
 =?utf-8?B?OFdjTXFlVE9mbXQ1enMrbU55YUhnZEVXWTRhcU1SVHZ4UFlHRG1CQmY3cWVE?=
 =?utf-8?B?ek1YbTl5dzZ1SWNPVlpUaE05NVJoVm5YNFFQdzdMdFRpRTQ3QThGaFp6NjY2?=
 =?utf-8?B?dXNmK0o1cVlQRFlWUkRmZDRERDNJZE9FcHdjTWdqTWNBZEkwTEhmenhKYW9s?=
 =?utf-8?B?NDFFOVd0dHhaZFh0WjVwQVd6ZmRnUy9oVVlUR25VUjVQYXh0dFBVaUtwQmtk?=
 =?utf-8?B?MjBLRTBJczkwZlFZZ3BJSHhUS3MrY0kzKy9pZnZqcWlNN2xDVFhoQnRNR3dE?=
 =?utf-8?B?SFcxMEJQZE4xMVFoVmZQQlB5aFpqYlV2anFlM2VaV3ExdUxLQmFkZ0wvSVRi?=
 =?utf-8?B?OWlEZ1JTaEJtaktpbVR0ZjFDMnkzUzRLVGo2Y1F0a2lJeHA5bE9EakdCNUlm?=
 =?utf-8?B?R0M2NXhjeHY5UzI3VHVXOTlXMllJUmFvZTlSOU9HTlNES1dsNVNZM0d4TThx?=
 =?utf-8?B?S1FqT2MvUU5yd2djaHdSUXNJZEVvbFN5WlIvTzVTcEN4VFNVcTRLdjFaeVd5?=
 =?utf-8?B?STNyMWErV3VveEVpL1B5QThuMFBEcG9ndmlDVjgvNXJITEJVMTJKL2JtaDFB?=
 =?utf-8?B?dkltL0xZdHNtR3k5dlp1RHFqdmM2NUVoVGxxdWoyNUFLTTE1Zno4N2ltVlRG?=
 =?utf-8?B?YzhZL3FxWEpOWEZRdkpWdHk1SGJyUHM2eEs1MGYxY0ptQ2cyZDBNaVdCdWNC?=
 =?utf-8?B?RkFsa0REUmRxaWRPYzdxeDlNM0xENURKTlJpOFFPZ0kycFk2Qkg2b0N1WTZn?=
 =?utf-8?B?LzlPZHV4UThXb1l6YXlwYWpJYnEyY3hLK0EzU3FmQmpCWE15ZWxBQTlsaFcy?=
 =?utf-8?B?bVg3a0R3blNyenIwbVd5Tjl0ZTBvVGc3THNRQmtHTWhoZytCMGtac1FvNUJS?=
 =?utf-8?B?cURMZ3VNUGxNWU1rTm9oT2RhRUE3U21pZXZ2bkp2aWgyckRqejVWbzNzeGhk?=
 =?utf-8?B?bzBqeUZSYlpBdGo3VDBGbmg4MCs3TG5XRFZGQzIvSFVsaEswVjY0UzhidW9j?=
 =?utf-8?B?Tyt3Y2RQM21ka2hvZ1kwcjVWYzBsR0FOcmhpMFd4eUE3NDRPYUFSLzlIcmlq?=
 =?utf-8?B?NnQ5dStWeUVtbElHYkRqWU91Tmgxa2hqVDdkTERRZUZ6M2pSeGZwQnI1clhz?=
 =?utf-8?B?VWpRRG9tSkF3Ri9hanV0WTM1Z0hZQy9SQmhzOE51MWJaQnBuMjQwWHI2N3NU?=
 =?utf-8?B?T1BhTGNuR3JxaW1uN3RSQXhoamU1V0RZTnJjbXRKTGNFQ0dkYVBWeGhRWk1H?=
 =?utf-8?B?aXVVMFkxNTB2SDlHUEcyRDE2Y0NIT3VxU3lqZzlCeWVySTZ0MkNQeE1zUk52?=
 =?utf-8?B?dzBhaDluTElWUzNWSWNJYWlrMldmUTBaVWZ4ejVXbjlNUW9Db3o1cjRjVnZv?=
 =?utf-8?B?TWZreFN0SW9QK0JwcXlLU3BVdkZoRnpnQlUwTjRhWHM5d2JXS2ErZnV0MGZo?=
 =?utf-8?B?Q0JZQ21FcXdLWGJjcXBrcGNTVnQyaHd2VDB5c0NjT2dGUTV1ZEdwTkl2TGc0?=
 =?utf-8?B?Z1VBNjJMQStEeTVTdldxZ3NHY0dzY2paRDRsVkhqRTkzS1QrckFHTHAwdVdz?=
 =?utf-8?B?Q1BOa1hzVmxvMGYxejR1NEJnMkZiazZzTUhudndYK3RiMGhyQTk0V0FPTHVq?=
 =?utf-8?B?aTczVUtxbUhHY1ZVYWc1dUhnTVRwY3hUb0wwTzBZY003U2IxNzcvK3dBQ0k4?=
 =?utf-8?B?enVIalY5Z0x0Mkk5dk1UK0g1THAyVktBbXREQ1ZXa0lITmJlNDVTdUxibWZF?=
 =?utf-8?B?OEhEK1FDdVNPMk9vKzJjOUJCWGVkNVFydjlEVGxycWJrQkVMUlhWdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c62659c-76e7-47c0-330f-08de698bfb66
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 16:38:27.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xypUaM+eY8+xRkWBGdbfJbgGk+zv/CxVTzja2KUipc3cclTHdgq9H+cymd7OssTJ68kW+G56+2cHigK5sDXqQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8016
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:konrad.wilk@oracle.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5165B126396
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:50:21AM +0000, Frediano Ziglio wrote:
> On Tue, 13 Jan 2026 at 11:54, Frediano Ziglio <freddy77@gmail.com> wrote:
> >
> > On Tue, 18 Nov 2025 at 10:44, Frediano Ziglio <freddy77@gmail.com> wrote:
> > >
> > > > > Newer compiler can put some constant strings inside constant
> > > > > sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
> > > > > This causes the produced live patch to not apply when such
> > > > > strings are produced.
> > > > > So treat the constant sections as string ones.
> > > > >
> > > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > > >
> > > > Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > > >
> > > > Thanks,
> > > > Ross
> > >
> > > Hi,
> > >   any update on this change? Could it be merged?
> > >
> >
> > Any update?
> >
> 
> This is the third time I ping this patch.
> Can somebody at least give me a reason why this is still pending?

I've pushed this, but I'm not a maintainer of
livepatch-build-tools.git.  I was expecting Ross to push the change,
but maybe he is not able to push to xenbits?

I don't mind picking those up, but I wasn't aware I should be on the
hook for them.

Thanks, Roger.

