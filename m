Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNIgHAgxi2kFRgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 14:22:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A508C11B2EB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 14:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226403.1532929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpngl-0005J2-JL; Tue, 10 Feb 2026 13:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226403.1532929; Tue, 10 Feb 2026 13:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpngl-0005HJ-GH; Tue, 10 Feb 2026 13:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1226403;
 Tue, 10 Feb 2026 13:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYRw=AO=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpngk-0005Gu-5e
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 13:21:58 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78106fad-0683-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 14:21:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB4937.namprd03.prod.outlook.com (2603:10b6:5:1f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 13:21:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 13:21:51 +0000
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
X-Inumbo-ID: 78106fad-0683-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUAj5nFAF4wlmaWhBMFp/AxwMouhB4ScJFNLwxQ9jXvT9+0dr/TC4r4snNCuNt+4oIfBR+VElAsPyX+lazxd9WrhSUw9oatpxuMfFZsx3OvXBy+eQJVwADmK77vE3EeoMK8uUhEtjma6NSP9IHPxnVbRxK4AV9BE43C+kT2ewr5JzJX7paE4R5LNzQJG3dx3gohuV33o4wtHOFuT0Wqi6XpM8R/WkIUMQhrN4+Ui22TK39Vezhus/t0F7vSwP77e3Dp793boBo17SIhjj0HnIbaETBWPeTB2wn+y4+g3fMt1qdLFKOUOpu8IPRbl6XMlcT60KBBQ2s7YgfkalI2B2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMmK2gPcK1bTqKukorZZ6WFimKCpnQxihGzN3sKnAKg=;
 b=XXFyLzIUkIRtR1buO4MiDLyshJy7+scT5+Ab7zmJJNAusOO3LOpzifjpCBReBdnEE5sGOfNwHiW25hsGeqLFe15Bw8Iy3C3K7n64GQbWhFvGrf/wfz6yjZm19jb83w9Unlnwmdno9/lP2xrdD5Rw35Bxj09lZHfIestYZHAs9xg3pezeSpUJ30JpV8tb1lipeQRClCi4kHukhooCM9entDl50AursFxccs6oofhZdUroODTi8BEhl8AwMqTodYDZyCbKlT7en00jqdVZDCzAbsyuIa4QiJYS1B21VMrXOPCFPdVAuqrXBYoOJ4MjXdUrmC0v4p7kP2bSIAb719G4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMmK2gPcK1bTqKukorZZ6WFimKCpnQxihGzN3sKnAKg=;
 b=hF7e1b4PC1X76QZL9CeACrjqVqj7Faw7RPZVQ65DV38wi8eWq40J8OBvug4YWgXE/fGbenGv20HNF4n4IubLlXNtZLa+NAvOf4MU3JYT8qJsJ/kGOP/H3rmPp3Ju4ClwzzfdpXTDTyRHVLJPZfawYUhc7hSjig3kekS+jeAxTSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <71b236bc-beb9-4fec-ac33-6d877ce91dd2@citrix.com>
Date: Tue, 10 Feb 2026 13:21:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
 <c5a9075b-6ed0-4778-b3ad-fe6647dad8b7@suse.com>
 <DGAJ9XN03HPS.TC0OLO5PJN6H@amd.com>
 <1c33beef-f638-4e62-b38a-8b79575adf18@suse.com>
 <DGBB4JCFAPUT.GTAWF68EZP9Q@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DGBB4JCFAPUT.GTAWF68EZP9Q@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a71ee3-5eb0-46cd-81b3-08de68a759dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dFRm1JVWZCZjE2NG05VnVUNDk4TFA3UmFrSFZ1SHZkVXlqQTlDSWVyRURt?=
 =?utf-8?B?eHFTZ3RTS1FCWVE1Uks2bGV5M3k2cHZId0Q0V1JsYU12dllVUjdxbHAvOTlF?=
 =?utf-8?B?ZTRGMG9Ga0tlK01panpHbHJINXZXVXp0NzR5Sy9GZUtFc1FsWlFwbmtRWUZs?=
 =?utf-8?B?ZnVZaHBKVE1rSk9iNzhNZTMyeWZuVlFLbjdmUGhrelBObm1RZktRK2FjVUlw?=
 =?utf-8?B?OVU5eHphZnpqTFpRVkhRQllUYW4wRkpac2pjcWtZZHd1cnUzbnZWbDRyWHo5?=
 =?utf-8?B?dk0vdUx1ZUQzRG1UUDVDMXRTZnYvdWxEVHQ1b1plNDJaZGFvUjM5Mng2Rld5?=
 =?utf-8?B?NXZ4STJWME1VUklhZFpFcGNKYjU3S2pUY2NoNlFtaVg2TUdHTEF1UmQ4a0or?=
 =?utf-8?B?anZuNWFsS1BNRHduNURXR3JGVFRVQmxGQjNPdDdFU2RJaUgwVTNZdUt3QWxl?=
 =?utf-8?B?TFJtYmNWOWFSeVZLYkNpVlZtNXVTcWRNbkVIeWlPcTFnMUljQ09qeGpRQVQz?=
 =?utf-8?B?OW83QXE2MFUxN2w3c0dlbTdxa3RJL1pVd2xvaGpzU1R3RzhwWC9GUVh6RTV2?=
 =?utf-8?B?UmE5Zm1Tckd6RUo1VlRzMGJqNHNxZzloR3ZvSXJZMVJ0eUdjbWlzVDdHQ2lm?=
 =?utf-8?B?bUJUNWZqWU1WWUR2dllEYlptdlkzS1NRRm8wTlBqOXJuekcvQmhkQU81d1Ex?=
 =?utf-8?B?RDdodUlXS1grM2xTMFZIdmZnZGhKN2p1cDJuckczandOVjRab0p0ZXRIKzZR?=
 =?utf-8?B?TWNFRHNIaTJabDhPc2cwMFJRTG52ZVZqc010TFBQVUxIRDB4dlpRR0I4UVlu?=
 =?utf-8?B?OXJSL3NrR3IzK2dTbHBNOVMxL1lVVTdnK0NqcVBSUUFCSnRKZVRCM04yZWRy?=
 =?utf-8?B?Q3JJd3ZlRGVYL25FN2luQ2hWY0c5NG16cVhvSVg5Z0xqWXBGZG9peVZuYXhH?=
 =?utf-8?B?TEp4cHViRXMzMlZGR3R1YjMyVi83M1VtVkc0VnRqQWg2T0JxcU5hYjVpUDRR?=
 =?utf-8?B?Tjh6cENhaEpIby96cWlWMnRxS3I5ZHVhMjR1TmRkYXd2YnlyRlZwUUR0eFVB?=
 =?utf-8?B?QnphbHRQMmJMbVZDRWlPNnFpbnRoWnBOS1ByOVMya29ZRXNWcm4rSVU4NFlX?=
 =?utf-8?B?QXd1Mlc3UHlYUEQxNUlUaHc2M3VPZUpGZys0b2YxN2N4NWhTUkdOdEl5Si9L?=
 =?utf-8?B?STFweXNIMktNTjdxTWVnS2FDUmVMUUxlb0lXMFpiMFErVVMrdVpLdXRkaVBm?=
 =?utf-8?B?ZVR6QmJUdGtpYUJKdzdyQXB5RWdEcVVLVDk0U0t0bUY3YVJKRFh0WVc1bTRs?=
 =?utf-8?B?OFhQdFhHZG1RZmVobFFmWkVPcW00NW9lWnU4WWdLQ0JHUzUwc2tsc3dGNE9U?=
 =?utf-8?B?amgvQ3dxYzRTTkwvYS9CWjZuNWRuVUI5dHZPYmRaR1FZV1VhUG9RU2RkMTAv?=
 =?utf-8?B?b3VaWkN6U0NYRVFza1BNUUROcC93S3AvYk1uT3loWUJXWGxiN2wxQmliLzRm?=
 =?utf-8?B?RnlwWVB0MUpKZjBqOUs1VUtzZEVaU0Nxd094Ymc0NTBSa3RoTy9ZR1ZQcStC?=
 =?utf-8?B?U0ZwUjF2SlJBQUJSZzhBSkQ4dnR5bUhId0dlcXNxWUZMeTRxSnZJRVRhSUNM?=
 =?utf-8?B?dmNnbmZIN2VLM05zMENlYUlER3l5aXBqZ2h1VEs1YlNQRHJzdnA4bnZFVXRZ?=
 =?utf-8?B?NGxBWEtybS9UTGRyMllRcjZ2NFQzUmZuZ3YxcC9qOTE0bkliUDFvWjJxMGJN?=
 =?utf-8?B?NWZ4ZVpZVEhSNWNEVXJMczhUUmZPYkxYV3YxbHFiOGRVRTM1UXFLci8zenNo?=
 =?utf-8?B?OGU5S3RHZDkvNnpqV0xGbVoyQllYOXZvc1Z4bFVQZnV6VGVlMzJQcmFId2ww?=
 =?utf-8?B?RFdLUUZ0MDZkb0xrY25vRVBsengxanp0UzJ2VVRFa285YjZDeS9Za0FndGpG?=
 =?utf-8?B?emduZlVRTjZTdE9QOTVVRHZJbGlaNFFlTFZ6RmlLZE1oNEJkeU5BTXJCckpp?=
 =?utf-8?B?N3M4eHFibGtQT2NYTC8yNEF4VVVPSEVTbzRWODVZS1FmNFQ3NEI2Q3RCNFhP?=
 =?utf-8?B?bDMraWp2UzQxcEE4d2hBVm5qa1k4K0g3UmIvWWk2VXM3b05hUmE4S2pkUEZQ?=
 =?utf-8?Q?f7AE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2VnN2RsOHFDS08xTU9SR1IyWmFJZy9DQzBGQTFnaDZYVkdpMXRCbG5lY1ZG?=
 =?utf-8?B?eXZOUE85V1pDOTR4a1RubmNIZExkbkw5UW5hL1h3YlZFODBEZndONXhSUVJG?=
 =?utf-8?B?amt0VmVHVTU2U0pTdS9oenhSdk8wYXZEUlAzZmhUeGt4SDZBWi82Mjl6NzlT?=
 =?utf-8?B?ZFQ1ZUxXZGNKWWY3ZThkYjF5cWRHdTFqNXdVN2xUZ3ZhakJBUHgwWHFyclVH?=
 =?utf-8?B?dTYyNlZLcnEwZFpmRGdJUFJGZDlpZEpWOW9FVjhycEdYVjVYRjZXYUpVUkpF?=
 =?utf-8?B?TlZuY2NHb09MM3RpYXVSbzBydnd6aUFTY0VGRXZraFdNb0thWUtuUGNMb3N4?=
 =?utf-8?B?YTZHbGJPL2RZQnlKMTZqWUMvaGw3L3l3T0h6czEvTldEejA1VzVYN3NqKzVa?=
 =?utf-8?B?RTByL295YW9IS0JNWDNQMGJDeDE0MFAwNm9tUkVyMnBmbGxGamZKRVVIekt0?=
 =?utf-8?B?dnpxSnNsTFJQNVRDOEk3RmNjL0dDb3E4NDZrcU9NVXBDNVZtelR0T0lyUmlY?=
 =?utf-8?B?aGdySGx3ZG5FSG54ZXQydmNvMHc1aERNclhVT0lqcnFIaXBLcG9iVlQ2eHV5?=
 =?utf-8?B?WUVhZHhhQ0QyeGhsRmZ3bEM3bjZwSGpZTmV6dnlQdGJxMWt3Z2Jic0VVUzgz?=
 =?utf-8?B?LzBJaWllUC9EWkZ6QmVvTTU0d1IrWGpiUWNRYWZOaFdtWjdTOTFmdUVDUTg4?=
 =?utf-8?B?RlRRdmFpKytmeHVNNnpnbmZ3dldhNnlTbk9QT2c4dDVYdFdPZk93eHFJVnBa?=
 =?utf-8?B?enFSdEZyc0h6b1c0S083LzJFdnp2dS94bWZ3ZXNEcHZPY25qanVlMFd3U1h4?=
 =?utf-8?B?aFZIc0RkNVVyK2ZqQjM0bys5bUppcjZjZFdiRkpGeTF4Qi9PZjMzR1VqbjJh?=
 =?utf-8?B?L2dEREZZY3daM0dGQmIyQzczM2YzaDVqNW82dk9LbURiR2puSHBzTk5CN2N1?=
 =?utf-8?B?ZVlpNEcycTNnOU1HenFCS3orU2NrdW1LWXRyN2wzSEUvK3lIRFF3OTVYcmND?=
 =?utf-8?B?bjJ6dmxSYUI3ZDhBL29QbE8xMm4rWGJ0WDlhT2N3QXRPRHVpbUJ2SWhRdlg0?=
 =?utf-8?B?UlZWWGlsRVBmMnBTK3paSTg0OXFHOUdFVEJQaUQ4UXhuOTVjdlpTeGZSc1Yv?=
 =?utf-8?B?bys1djIvVGpTSTl5U2ZUdi9yblFDL2ZYZUI4MTk2bGlDQWRYbjdGYjJQOTZ2?=
 =?utf-8?B?c04yUXBBaEJJdVFxbDdwVXRzQVhTY29NSlE2RjAxaE14TzNOcnB0L3RMQTB1?=
 =?utf-8?B?VUFxNHVXbDNQYS8xT29xU3M1Yk5ZSE1RaFc0OUdJTFJSMXBOcnVFSnV2bUNh?=
 =?utf-8?B?d0hucmVrMG1zZnFZdlFkSHZRR1U5RE9zdm5jelE5VUR6aG9mZnlUL01tUUY3?=
 =?utf-8?B?SkNiV0VUOU1RdEhFOWN0ODd6WDBGM3NkQlVPT2hSYTBQMTRhN095VlVzbENv?=
 =?utf-8?B?dFdtK2NJamV2Wm4yZm9Ybi8zQ2NEb291WHQxODZNem1nNHFweEd6dDhIUTRo?=
 =?utf-8?B?bnFVbnpsTUk2OWoyL0xrM3VSeE1aUGhEeFhoSWViK1NPdUczNFVMTFhsRnc0?=
 =?utf-8?B?ak1PZ29OYzN5SWJjdjdvdUVHS0VhMVFzZkcveDZrMU94bFQxZGk1K1pXTDlE?=
 =?utf-8?B?RVJvUEtuSUJuei9aanNMWWdYengzVm95NTh1TU94UmJUVkxlNWMzSWZOaUJI?=
 =?utf-8?B?Y2tRSzFZb3BJWE1vK1dXSXRmOWVIVk5EUlRDK01WODhvdENZdzZ3SnBkb1ov?=
 =?utf-8?B?cko4ek1RT1VvNjgzUUd2QWhad3NNZGFlRkpFZHR3ZWgzUWQvUTc4Y3lrcU9z?=
 =?utf-8?B?RkhwVk1sbW1Rc2RyV3IvNkY3NUtkT0dRK0hpaks5SkJ1SEJBSTdxMkN3VmV1?=
 =?utf-8?B?cDVpQ3lyYWhNMkZRZDFxNEJvMXRwYUgrVExqZTZINVdZODhGV1FqbE4vQmRm?=
 =?utf-8?B?TzFtQWVJUnZQUElINkJYeUs2bW5PYnBmenpBdDIvSU9RcHozRnhVYTZZOCtK?=
 =?utf-8?B?Ri9YMUEyVFZRTFdOTXR6ZmhwWUZGY2NvR3pBSzRqWDFKVnNEdUllSk5RaDU3?=
 =?utf-8?B?TzdWQjNsNlhOblNadGpZVXdjWTUzbENudCs5V2s3OVFBZEtqWXlyQ2VyVG9R?=
 =?utf-8?B?cUNmNE1BWnJyOEkyREc3NmVJUm8rYzJtMjdwM2xOaW51NWRFTkxCK0lMV0NF?=
 =?utf-8?B?RDI0R1ljRTRWblNycGVaY0g3SGRlR29pT1Y2ZGY1RldZNTBGb1RQR1NkOUU0?=
 =?utf-8?B?ODV6ZFd4d3VBUFB6Z3VYVUFoUzhsUTUwaTEzdTQ2eU1wNVFxQ1VaaWc5a0Nn?=
 =?utf-8?B?NG5nVXdkN05WZEQ3dGFZUjh1TUVVWDNIWlJ4bnQ2bXN6SHRzNWt6dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a71ee3-5eb0-46cd-81b3-08de68a759dc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:21:51.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZdJYLTFMP8Kl3UguCUtyjxF/MBYnt1rPgqAlj2Klf9A/S6I8aSlULN/w0JN/IISWZLqUoaV/qbhbVin/l7AmNbsxh+sqgObnScCpHxhhvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4937
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A508C11B2EB
X-Rspamd-Action: no action

On 10/02/2026 1:13 pm, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 4:55 PM CET, Jan Beulich wrote:
>> On 09.02.2026 16:24, Alejandro Vallejo wrote:
>>> On Mon Feb 9, 2026 at 3:48 PM CET, Jan Beulich wrote:
>>>> On 09.02.2026 11:31, Alejandro Vallejo wrote:
>>>>> --- a/xen/arch/x86/Kconfig
>>>>> +++ b/xen/arch/x86/Kconfig
>>>>> @@ -146,6 +146,7 @@ config XEN_IBT
>>>>>  config SHADOW_PAGING
>>>>>  	bool "Shadow Paging"
>>>>>  	default !PV_SHIM_EXCLUSIVE
>>>>> +	select LOG_DIRTY
>>>>>  	depends on PV || HVM
>>>>>  	help
>>>> Why would this be? IOW why would shadow imply log-dirty, but HAP wouldn't?
>>> The logic is rather opaque. I admit I'm a bit fuzzy on the uses of logdirty.
>>>
>>> I know what it's for and I could navigate the code if a problem arose, but I'm
>>> less clear about which other elements of the hypervisor rely on it (pod? nsvm?
>>> vvmx? shadow? hap?).
>>>
>>> If it's strictly toolstack/DM-driven maybe it'd be more apt to have a separate
>>> LIVE_MIGRATION and SAVE_RESTORE configs where LM selects SAVE_RESTORE, which
>>> selects LOG_DIRTY. That's also improve some defaults auto-downgraded from the
>>> max policy just in case a VM is migrated.
>> It's save (not restore) for both PV and HVM, and VRAM dirty tracking for HVM
>> only. Ordinary HVM guests will want VRAM tracking, so compiling out support
>> for it will imo want mentioning in the Kconfig help text.
> ack.
>
>>>>> --- a/xen/arch/x86/domctl.c
>>>>> +++ b/xen/arch/x86/domctl.c
>>>>> @@ -220,15 +220,15 @@ long arch_do_domctl(
>>>>>      {
>>>>>  
>>>>>      case XEN_DOMCTL_shadow_op:
>>>>> -#ifdef CONFIG_PAGING
>>>>> +        ret = -EOPNOTSUPP;
>>>>> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
>>>>> +            break;
>>>>> +
>>>>>          ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>>>>>          if ( ret == -ERESTART )
>>>>>              return hypercall_create_continuation(
>>>>>                         __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
>>>>>          copyback = true;
>>>>> -#else
>>>>> -        ret = -EOPNOTSUPP;
>>>>> -#endif
>>>>>          break;
>>>> Can a HVM-only hypervisor create any guests with this? I simply fail to
>>>> see how XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION would then make it through to
>>>> hap_domctl().
>>> xl doesn't seem to call it at all. hap_set_allocation() is implicitly called
>>> through paging_enable() -> hap_enable() -> hap_set_allocation()
>> xl must be calling it, at least in the case where the paging pool size is
>> explicitly set in the guest config. The important point is - not all of
>> XEN_DOMCTL_shadow_op's sub-ops are log-dirty related.
>>
>> It's also odd that you did make changes at the call site here, but then
>> left the called function (and its sibling paging_domctl_cont()) in place.
>>
>> Jan
> That goes through DOMCTL_set_paging_mempool_size.

This DOMCTL was added in an XSA because ARM needed the functionality,
hence no cleanup.

I didn't get around to cleaning up
XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION, but please do.  We should not
have multiple ways of configuring this, and it simplifies the your patch.

~Andrew

