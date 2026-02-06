Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGtuOpk1hmlrLAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:40:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351F1021BC
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223787.1531187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQkW-00041j-GO; Fri, 06 Feb 2026 18:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223787.1531187; Fri, 06 Feb 2026 18:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQkW-0003yc-DF; Fri, 06 Feb 2026 18:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1223787;
 Fri, 06 Feb 2026 18:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1voQkU-0003yW-TB
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 18:40:10 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42cedb65-038b-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 19:40:09 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5454.namprd03.prod.outlook.com (2603:10b6:a03:284::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 18:39:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:39:53 +0000
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
X-Inumbo-ID: 42cedb65-038b-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhmMGxBKeuYUrQtD5jXTWrhTOfqkyZ75VKSEYlHupi8sDtUy07tMQpN0DAYykPgqXBaqtqU5k/Ebb7jc6UcFmpVQFg+y/XjQu2OKFFra4aNMRdNLZpJlXiwzwBXPYzPcwBHKP2kf3C7/uM+11zFxyeeiYRsrV5L1HvE+G7TJZtmzeNvK3KroZ6QbnRtwYpfqulibDuCI73Hj2C32U07vNaFneKuxRhGpSZ4pYURgJ6RGz0Uv8LdFyrjyn7MWqIwci73uyOdacxPYfrqaSo4bXtogY3q33ZpvWTI6KpqiAM9Ug/kGqODpfH/cFc4Y0sxhei7zd2Nzqt5xgZYq7KpmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syBf/RLorpv/i9yzElRI4iOU5fZxH4MOYfIBjXEPObA=;
 b=oEJNWtgSxQJHxOJoYovtq44L3eJTpQL3kANvmmsSrNGUp0C27cZET/d1yIgAATVP0fbRqtOAcW/aC1uMFZRx0W8YJ1g00+rJp/WOsiKXvN9e5/LAAprnXyfeSN93bpZc2BZkei9/WHPkd+ErB7HG3FIMIYZHdHkWB8agMfYlUyIiBEXY0KqEN02Bb/IXjuL15V72R5tCwHot25VQtzWQXeoFnqzJFD6sCgObU4Qzpx6z1gcIgr11I6XuO04YBjpJfiUs8J89/sogSItDHkdZktWf0YQT8+YSnTV9nDQNPF8yXc2o7AvLbj+S9eqgBeQEAayDTFQtN3LnnQHJYf3i7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syBf/RLorpv/i9yzElRI4iOU5fZxH4MOYfIBjXEPObA=;
 b=PPldD3CIECFuOzbHeZNucVXdaQWTqHoNNQoAJG6ruGcIL+duJPHCCjpStSKup1HkT6GI5+k/heRfVPMYRfmwu1l/XuiL4Hp3RXdL27DZZ2y56FSRa8tmJwHOmFR/D6KOZOp9+D0gtvxCv2dBqzIhQRYx4ptQxRzVNaADXMXlfjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Feb 2026 19:39:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/kexec: return error code for unknown hypercalls
Message-ID: <aYY1diy1J81MajXI@Mac.lan>
References: <20260206183100.28195-1-roger.pau@citrix.com>
 <d754b3b3-ef3f-43ee-81fd-076f50ada106@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d754b3b3-ef3f-43ee-81fd-076f50ada106@citrix.com>
X-ClientProxiedBy: MA3P292CA0051.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5454:EE_
X-MS-Office365-Filtering-Correlation-Id: a23aa6c4-1976-4b0f-cf44-08de65af1dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnhEVytvWnlYVmhJTkg2VlR2NVRyaTNmcWRYSThYT29pVWRMaDN2Q3RKWmV3?=
 =?utf-8?B?a0FrREVuZXNlY04rQ09LMWVMajBnUFQ5enlWQytqOW1FdXd3ZmM4NUZjNndr?=
 =?utf-8?B?cHVJWWI0bytVNEp6cDdjWW1RQ24wNnRWSEFvSFlxN2tmd1NRblBpanpIWGRC?=
 =?utf-8?B?ZkgxNUpkdlp1RzRXa1AxZFJvTENCekg0Q0lvNHJxU2tYUFllSFdGUUkvS2dl?=
 =?utf-8?B?ZEVDRWhWSjQ0cUhFNld3VUNOZXJiL0ZkSVprN0xyMk9WdGU5ZUplNjFsUCtm?=
 =?utf-8?B?RnM0SmpUNU1nNkMzdUo4VVVHenpheHdPVXZ3NmVGWGsrNW9GczFMeWNaRFhr?=
 =?utf-8?B?OWxpRkJodG9YTGJueVRPRHVOdzJhK21RVlZlb3N6UFFWcTl1bWMzUkNuRE92?=
 =?utf-8?B?ZkhGL1JSSUg3MHQ2Z0hGZzZqem9Hck9LTHF1clV4cE5YeVZJb21ZRGphbFRU?=
 =?utf-8?B?ZUh6WW1iSFBhZm1wYXZzUjR2TXV5Wm9OM25nWE5JbGgxMUJyZ0svNDYyV2RI?=
 =?utf-8?B?WGUwNG1hT0JRTHJ6S2xrOFZOVUtibkg0NlJJUHFzOXJJM2F2MWVGUjJNT2ND?=
 =?utf-8?B?cHYybkF6QXBMcDJ4emwzd0tPMTdack5oR29wV1RUbk5rTHBTdjJwVXNhQ3RX?=
 =?utf-8?B?R2dlQVYvUERHK05Yd01adHE2NklmdG4rVXNZTGhEZDh5cXU5TEJaWHFKNVNT?=
 =?utf-8?B?eUU4OFVaOXhXc241aENhMWtZR01TSitubGxORXBRanZEL2ljbk9DYVU0UTBl?=
 =?utf-8?B?Z1BRcjBISnRUWmdhOHQ2Z2t1aTh5d3cvcHRNV2llZzVtbGNsWEZ1a0RmUXVE?=
 =?utf-8?B?Rnl5eHNCTGt0bGVOd0tJVzZORlUvd3hYQVZ1Q0ZRRmFwODNVbnhJUTV1V3JP?=
 =?utf-8?B?UnUyYzFHdW9tYzBvb01SbHk3NWViZVdmdFJrUmNodjVIRnJlMHYyQ1l5N3ZX?=
 =?utf-8?B?UHdSOUFtNEpXQ1RiMlFWSXdRZmxleHBFc2thN3NKbjI0SVRTN0dGbGJrNDdv?=
 =?utf-8?B?TFFpZmRmR1ZnRlhBUFFHMEZVTDBzU1U3bGNkQjRMbDg2TTB6NkQwQzNJVkhD?=
 =?utf-8?B?M2JPVzJoOEpZQlZxY3ozRVpjd2krQmRiZ2ZQVG1CK2dqT1EydmtKeTUwQ1BU?=
 =?utf-8?B?SlFwSTNQQlBGSmpLdVd1TWFZeVlkWnVGNVhKOFdJcXh4N3JsNTFxdHdLQ25H?=
 =?utf-8?B?RE5WMFUrdWVGM2N3YmdWQXI2encwcFU5MnNpNkNpZnJqWnhGVkJzdWhaUXBS?=
 =?utf-8?B?U3R4ZGlxeFAyYlNiZjVBb2pTeWFMU3Z4WHFBNWg3RE9Jc1JBRGpDTXo1OFBO?=
 =?utf-8?B?azRUNXcxcUxZUmdndU1UQWp3SFI2R0V6cFZ5dmJCcEVXWUY4U0dGajNHdkdV?=
 =?utf-8?B?UVVLbGtzT2xOWDMrR2RyRU9JODBnTExINXcvbTk1djFLc2d6WVVzc2tjNVQw?=
 =?utf-8?B?ZGFwdmpnT3NtV292VUZnY1R5K1RENG5pcUZLK2MxS3pvMG43WFRibzRicTdG?=
 =?utf-8?B?Q3ZpVVV6bTVDdHp2TWtpN3cvcW93N09kdHpzSWNPZ3h0WjlUQVYwbFNjWWNR?=
 =?utf-8?B?Y1NSdWdwYTl3MjRZdnM1dVQwZ21rZERzVVllMDNnQTVpcCtTSFVEOUVwam9H?=
 =?utf-8?B?WUR2cEJGQmtXOXdhR1BsL3ZzdjJHcC9Yd25PeG5Gd2tjY010WVdZaGtCNThk?=
 =?utf-8?B?VmZMZDdzOHRWbm82eFp1d0lzcXhHWm9vWUkzeEVFVzZUbTZvQWpGS09kaUM5?=
 =?utf-8?B?SHJybnRuUC9LTk1JQ010VXJaOVJRbGhFMXF6WjR1eHJjSXkxNEpOR0h1VVpr?=
 =?utf-8?B?dzFFV01ZMDlxN3dWcEQ3N1VsTllWQzE5SWlzemd1Y05oWTlrYk1ybTZkcm1V?=
 =?utf-8?B?MFIyTjFUNmdSVlFJSUNLNjZlcjN4NGJoeFpoRmszTU9HOVIzWVF4K1FiUEhD?=
 =?utf-8?B?V0JoZ3ZqdWUxS0tBd082b3d2T1RCMmRrOFFjM0Y4akZSd2Y3MldCcGphY0Ra?=
 =?utf-8?B?V3pnVnQ4TVArSWtmQmtaK0VLODVoZE13cExtZC9FTHB2QmZQOEo3Wmd6ekRu?=
 =?utf-8?B?eUFqdHEyeWpOWEFJYTRGTFNiSXpydlF1b2Y4bFcwUzFHVXhVNDU0SzRMOEEr?=
 =?utf-8?Q?+rno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NHaXBsOE43TTJ3WXloRG5sZE8rTWdZY2pJSm9vUjBhNUh0SlFQSTJzU1I0?=
 =?utf-8?B?cm0zaWU3QXUvQjFBcEtMeEZsWms3OGMvbzNhSlFZR1lMSnFNN09tSWZJZVZS?=
 =?utf-8?B?b1FRRWU1aVZFNzdHQk5KdXFWaTBoTEw1dFlBRzQrdWUyaHpjTWpKUVlMQjVt?=
 =?utf-8?B?TWRSaERmRXNadXpReDNvUUJhQkhOS2xLMERHL3BhRWc5WWliUVF2bnBMWnZZ?=
 =?utf-8?B?YU56K2YyMVJMb3FTRi9EdThMejdqZHpPNnU4OTFoK0dJSXNuSEk1Z1VyTFdu?=
 =?utf-8?B?elY5TDV0ODNKekk2b0NXTzJHR2NsMnhPRzJoMGNaSHYzZlV4S1J3NUNWZndw?=
 =?utf-8?B?YWpudnFzdWF4aU5GYTJVQXY5TE1kRzR6OEtYamQzMUF2a3dHVGs4bU5CaG16?=
 =?utf-8?B?ZDl1UDJ1dTQvUGRWQ2dJRnphVXhOTGJrMHM4VTVsYnVRa1dBYkxGd3dMQkU0?=
 =?utf-8?B?YnpqcUhEUXN1cGdoc01VSy9PaVpiN00wWW5teUhCUmxtWlpGVm1Rc3Q1WlZq?=
 =?utf-8?B?TnVZcDNPUWEvRmFPbFVRM1plUStvUXZ0MUVhNVJtYm1xZUtJQUpYR1lNa1hm?=
 =?utf-8?B?MXRVY2Y3aEJzT3gxN1B0eFpET3FsT0l2TDRzcSt1dkkxMndKK1Z6TUptek9N?=
 =?utf-8?B?ZEdtY044QjYvWXMrSXl5bm9VaEc3RzVBbXlPL0VSalNQZjlrdHVSOTZodVNi?=
 =?utf-8?B?TFpYaDJibkhvajBWZ2JCSHB5Y2ZPcisyVXJ4YmJLVk1mTjV3dHA3TkZ0aDF3?=
 =?utf-8?B?Ri9acjJmT2cxMlEyVTIwSkt6OXdpc0JERHU4OUxCSkg0TFYvdHIxQlRzVk54?=
 =?utf-8?B?QkhrYWFEdE5acGZwSmxxYTZuV1l2RUJ3b1dEN090MWdPNWxNV2JnV2p5K0FB?=
 =?utf-8?B?eHZGMGoyWnc2czl5dFVZbFBiL1pNWDhRL3JIZEozQlFubURTQmovZ3ppUjJB?=
 =?utf-8?B?LytxUE9HOW9YeW1NUzVXNW5JMmdFaWRRYUcxYkt1djdzTzk5MGMxbUMrWWRa?=
 =?utf-8?B?b0pxakVUL2VpRzdEZ0FobkxVY2lGQXJSajhOcnlFakdXVklDVlRRbTlrWjc1?=
 =?utf-8?B?cFFNZGl3M285VHl3WHFkQ2pmODQzYW9mbDFhTFpkREdhT2J4c2NaN3RnWjNX?=
 =?utf-8?B?OUhSSCtaWThRcytTUGh0VGpjMzZ5K3YwMW5rYTN6ZEovOXFIOGVpcEFBTlhm?=
 =?utf-8?B?NE1NaitOUzNEeTYwSmluRW5wSmF5bXU0QW5MOThaUTdoaHozc2ttU0NBeDQy?=
 =?utf-8?B?TGUrTG9RZXJqZWp0amNqUjY1T3I4bXlObU11OHE2WWg3b1BsN2ZFM2RyQmFW?=
 =?utf-8?B?NlcvaDBtSVJlQmltcFdIZmZMWFlZRmUvN2RxeDdlb1hFOTNKdVhRTnlWM3do?=
 =?utf-8?B?WHJGTG9jc3BhUldxdzhBbWpSa2taL0FaeGloZWhsRTVLOXU1UXlxaU4zeDhH?=
 =?utf-8?B?YVpmZS9RMExlNTZ1V2hXcTJ5NENsK1hOVVRDQVUvWllBNXVFT2FUbnF6ZEpz?=
 =?utf-8?B?OTBtZ1FDVmVRMXZJU0U2UFNCS3BrZ0RGRFkrQmNwSkdHaVNtcDFxQVlQK25W?=
 =?utf-8?B?ZSs1aHU0MUJoTUQ0S2ZmNm9RWHcvZllNUHlrYjZodngvSUgyaHJtSG9jeVND?=
 =?utf-8?B?UTlhcjRVK1FSK2YwY3FmT3Q1VnQzbzJLTi9LUUxmUTZkTjBDNTB3K1hENWEr?=
 =?utf-8?B?SlU3cHRadnFaa1BOSy9KaGlZM2lSaDB0VE1oakV2MlY4M2Zycm5pTFdMc1Yv?=
 =?utf-8?B?RWJidlJPbHpFU3ZlZ0hSQmFlWStxa2hQL25lK0x3czZxQkxlTGV1RkYySzJt?=
 =?utf-8?B?ZzUwOTN5LzJFdDFZbG8wbHVhTElsdFRDd1d0REx1bTRVV3NjREt1TGJFU1BW?=
 =?utf-8?B?bFR5bEcvemsyK25pbnFZTVNYbStNMERWbnlDUFR1aHRJSUR2ZnRxNS9EU1Ry?=
 =?utf-8?B?Q2IwaDdvM1p3bmgrMzh0OXUzSW9VUWdoRFd5NmRTaXhLWC84Um1HbmhRYm1S?=
 =?utf-8?B?UmRoVWlNeTlsQllqRWl2QnRTT1RxaEo5cDVJSUk0SkNrVUNGc2lieW9JZiti?=
 =?utf-8?B?U0NYeW5aYUZGRFNTTFdxUG9FMk1VdVpzcXR0UzBHUXVucno0b0p2MGZ6N3Rv?=
 =?utf-8?B?U056UnVoMkRxYTVPeGZxYkhlR0toYWhGRDQ5L0U4b3lxTGNySzdab2ZEb1Y2?=
 =?utf-8?B?TEpiL0JMOUwySDJwQjN1RmF5OTdMV0VsWWdIejhsMjljdk1mNXdJZklvaHQ0?=
 =?utf-8?B?bmc2MFROanFzd2RBRVIvVXk4cjRaNFJmSGlpdWx4U2pVSHBNL2kyajZKZ1RL?=
 =?utf-8?B?MTI2ODloSi9tbkdGeEwxSW9XNGE0MHo5ZFdmYVlOYW5KNml4cmFYUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23aa6c4-1976-4b0f-cf44-08de65af1dd5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:39:52.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: youUz4AMGTFhZznH4efthLmVKmEt0nfP0zSxb1RgAOCtj635+Bk6eFDmVP8dpvI3j430S6uDqCzSskDcxy9i5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6351F1021BC
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 06:35:32PM +0000, Andrew Cooper wrote:
> On 06/02/2026 6:31 pm, Roger Pau Monne wrote:
> > Currently do_kexec_op_internal() will return 0 for unknown hypercalls.  Fix
> > this by returning -EOPNOTSUPP instead.
> >
> > Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > ---
> > Arguably the error code for unsupported kexec hypercalls was already wonky
> > before the XSM addiiton, as it would return -EINVAL.  It's however way
> > worse after the XSM addition, as it returns 0.
> > ---
> >  xen/common/kexec.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> > index 84fe8c35976e..8f52c5506d4a 100644
> > --- a/xen/common/kexec.c
> > +++ b/xen/common/kexec.c
> > @@ -1217,9 +1217,8 @@ static int do_kexec_op_internal(unsigned long op,
> >                                  XEN_GUEST_HANDLE_PARAM(void) uarg,
> >                                  bool compat)
> >  {
> > -    int ret = -EINVAL;
> > +    int ret = xsm_kexec(XSM_PRIV);
> >  
> > -    ret = xsm_kexec(XSM_PRIV);
> >      if ( ret )
> >          return ret;
> 
> Personally, I'd just have `int ret;` and leave the xsm_kexec() call as
> it was.  That leaves the slightly more normal pattern intact.

I'm fine with that as it also drops the dead -EINVAL initialization.

Thanks, Roger.

