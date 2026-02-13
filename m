Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eSRTMqqBj2lMRQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 20:55:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93713948F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 20:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231789.1536781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqzF7-0006Ty-Ti; Fri, 13 Feb 2026 19:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231789.1536781; Fri, 13 Feb 2026 19:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqzF7-0006Rl-Qd; Fri, 13 Feb 2026 19:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1231789;
 Fri, 13 Feb 2026 19:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqzF6-0006Rf-QG
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 19:54:20 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c61a541d-0915-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 20:54:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6484.namprd03.prod.outlook.com (2603:10b6:806:1c3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 19:54:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 19:54:11 +0000
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
X-Inumbo-ID: c61a541d-0915-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DE4vKVzsYETZhj8t33AflImwxnExg0iN8osy+EjChbRDrV2L+ZQakI+q4nT0xICSTmmMvuJm8Pfp9cwGUMl7N81XN8XCQo2ZBJvoxyq0FmwCDHNY7DgLn2ZMjoruIymxftIzdKxiZkpeCOf5gBYAmx1N/jF0f8hVgzZF53Ki3W2u1+cT7ivI1OjXA3jlIAqxHOBRAiOxewdSIGAU6mC53VwtZX2rzb26wwB6mQmCY/bBMKu7UsHyyC4SEmX/LK3uU+gj45evFyKrjThPlX7JKWSMB1L5ySugZZNcFnUfsQ2RGerg9OG8EgqoZU5CaF0yWpPBdrYw/Cag69YSgmiPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlx36ml5HfQ3qyFlB9kUsHK5uCFO73NpFC9Oi2ci5R8=;
 b=pjeQA3rGGG638jjb8d5eDSjpkhmuK+O3Shtzn9BamwHNm//qRbFK0ZZeXdUr5usX8tnLZdwriJGhu8LUMYuajqO+4WDBqQg0RSC7lPS8/nBh52W6FKv4R7Pk1iLcKV6T29IpBTf6zUbYSEHpSbNeVs4hjDS8sMxgg1DW/TGrgH8e0bmEtKnujNqga/VXGVi0HsMt4m6NuM4SJDOlkkqyD0WwPNQ8vZ6JTOAqZ4oDw6KrNStJe6hg5LUA+DfGF+/QVCmW4j3KRS3jYWuLfxlPxcqQ6k5Qy8WearNdJIqnwQ8Z0JYA9UkNzDAIU/YwHbOdKia/VWLIy2fpQkZfmS+tMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlx36ml5HfQ3qyFlB9kUsHK5uCFO73NpFC9Oi2ci5R8=;
 b=hPZIE5QW82nZVvOAK75TR+rH94MY4icOVHSSZgqT06EhYlKtnsIZI/DktT5jCcf3tUfi11WXImavrwdqm+Hm3ewadw1z4R5Mq/TadXyMXEV8ZmQo6EhvtRvUJmdnZgKOV/Wnp2DwFz6ZTC+BbQ59Fl+29KQHMGblUIovMD/ays4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 20:54:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86: Force HAP to be enabled when PV and shadow
 paging are compiled out
Message-ID: <aY-BYJfPdHtZOzKv@Mac.lan>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
 <aY8-wlXW6Y90vvOv@Mac.lan>
 <DGE0GZ9SPVXI.13JZK2Q4WWG8@amd.com>
 <aY9wqBi9xKQv9tiQ@Mac.lan>
 <DGE2N97NJMIR.LU2XTI1URT8S@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGE2N97NJMIR.LU2XTI1URT8S@amd.com>
X-ClientProxiedBy: MA3P292CA0072.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e4b74d-a047-4d15-454e-08de6b39a874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ny9sUEpNeDROdDlPNEhpSGEydlZLaFF4QitTY0JkNGlkdmRRdlNCN0Rkd2lM?=
 =?utf-8?B?WWpONWd0NUdWbGRqTk9PSEcrd0FEaUo3d0VhcVdyVUZ2S0d6SjY3bGZ6YmQ0?=
 =?utf-8?B?Nzk5QUZOVlJMN2F3VnZrNk5sV2hFSFRySDhkemZZUGxLUW4rYUE1NEZ0dlZQ?=
 =?utf-8?B?bDRZdFNTTzFHWUllVklvRXVWeUl6N3lHTmo3MmZoTkhId2dZcEN2Z3RkTTVD?=
 =?utf-8?B?eW1FSUgyS2ZudVNHa2dMdVRUSHZwekZxNWl3RVFHWDdJSFV3YzVmNXZvbTFL?=
 =?utf-8?B?ZGE5YlE5eHM0TitKVmdudHJBSVh5RHdUaHl3MUt3N1dHbnY2bTlQWXZLRTI4?=
 =?utf-8?B?emQ3N3BRT2s3Vkd4cS9vWTBleVNpN21PWXZJN3k0dzg0enZFZDFQak9OL2dC?=
 =?utf-8?B?WHNRUUpaZkZLeG1kS2xVNitkSUNNYUtEMVU5Y3RQbTdwZnp3VGxhL2JUeUFN?=
 =?utf-8?B?OHVvZmVWSmcxQlU1Nmc4a0Yyb2tQWFpUeDBXMkIwN0hHWVY5ZlJtc2dublNs?=
 =?utf-8?B?R0VMM1dkaE1DNVJEZXFub1VFUkpmcmxDaDYwRTdIYlJrOVVqUnUrTWt0Yjll?=
 =?utf-8?B?bHQ2elNmSzJjcFQ3cTlIUitkY01BbzFQUENQcllDelkxT0R4U0x2TzJxSmlK?=
 =?utf-8?B?OFZpSXpjRUlUK2xWTFVsaFFOYlFwa0tHTmpMaE40UUtDNURIbGxCOHMwTFlN?=
 =?utf-8?B?aS9SbTlNVmdPZjlnRTVITmdFQWVBVXY5clFEQ21OdXdFdkp6OEZrOUZYS1VZ?=
 =?utf-8?B?cURYbHIzaE4rMHFIN0JGa3NSY2s2UkI2TWJ0KzkxWVFDeEduV1h3b1dkYnVY?=
 =?utf-8?B?OVArcU96U0Y1V0d5aDlOcWFwcksrckNzYTVUdWI3SktodHR5VzF6c0k4VzNh?=
 =?utf-8?B?dFFUYTV2K3pQNG1jbFFsOGw2NW5INE9XelNRT3NmcTdrNGFhaUhLOGtLMmVT?=
 =?utf-8?B?Rm9aOHpBVmxaUG1SeUhuSEtMampNSUtuWGhwQTFTMy9CbTd2R3J1YTlrYkJ3?=
 =?utf-8?B?Z0c5cGMxT3Jvc1JsVXVRUHhZeHc2d1ZmWHhSSmxiTTlsV3BIQnJVT1JVK3VZ?=
 =?utf-8?B?akhwc1lwVmkyYTllbml3RU5SWTFYS3ozKzZ5bkNTQnpnSnhFQ2RseWJIc0JG?=
 =?utf-8?B?UHBJMlZabWl4dnFTb0VaOXQ0MjNFcklsek10NmgxbFhXSlE4cFlwcmxIK0Zl?=
 =?utf-8?B?dVlod1ZMRTRxSGVrVUkyaFBsSWl6QUR0U09qWkR0cnRqT3hhNzZpNTY0a2pt?=
 =?utf-8?B?RHpGaE9SejhzRG93Z2c4Q2g0M0Z6dzlhNjZnN2VZdlo5QzNUcm44YW1tL2JI?=
 =?utf-8?B?cEtUSG9SMENEeUgxUUJXejZVdEp6cUxuOUNtNUxhbDV3dXhrMVJ1a1VpcFl5?=
 =?utf-8?B?RFdXaW5vQzNNSjhOWS9qV3FiQ0cwV0ZKYm9yUGtpcmwvVGtLckVmQlQ4ZEQy?=
 =?utf-8?B?Wk5VdDh5NGZ4QWRJa3YrVzNZbU5SMGJRbU5lTXE5RXlyU2xlSUdvY3NyaW9Z?=
 =?utf-8?B?OUFad1BBV05LbUQvSEh3STZwTHRDWHYzRUlwcitNWjRrNXplV0RTQlc2c0dX?=
 =?utf-8?B?cmN6UEhXcG1xa2VjczhxWENBclNNYTlQNk5FWWd4c05JeTBtbmVtUll5NWVQ?=
 =?utf-8?B?OTZvL3VYWHB2MjBHMjlJS0VmQy9VL01UdHdxUFNDc1FhcEp3eHNaRlVMY2V6?=
 =?utf-8?B?TFgxdVpLSTBRMWE1QmxxSnk4SmhsU0JYQkRHZDEvOGRkREppcitLVS9RaFd2?=
 =?utf-8?B?TWx0b01kUXdrTUJMSmtjRDdXdUV5OWc4Qjl3NFpFUHNzRVQrRzdMbGFaV2VT?=
 =?utf-8?B?OFc1L3NpckZvalB1VmhUekJyM0ZaRk9KSnhnNXI3cTBoM3RqaVRidWZLTi9W?=
 =?utf-8?B?ZUIxZlo4bUoxeXVLWHN2L0xOTStFWE4vbys2S2xiVUJrRGQxN01qR25EVEhm?=
 =?utf-8?B?WXAySldDdjdNVTJuVE81dXgwUDVBMnNDWVFWaStvZzlDdnZoemhCa01RQnhM?=
 =?utf-8?B?VFcxY2lLVWtQKzVtemNuaWZZakg5SlFWdDhHdncrM1V4VlU3YXZLZGNsRVZG?=
 =?utf-8?B?c0NtTFNsZnNVQ1czd2pRUnoyNXVVS1l0M2x0V0JTS05IZU10dlRNUEd4QTBN?=
 =?utf-8?Q?wLWo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0FiREJPK0VFV0hWblJKeVYyNEQyTWdoSUhTS2ZXK1Jjd3ZJaXlYM2czcFov?=
 =?utf-8?B?YUgzVnpKRWNmWjJ3UFZKUVVlSWVkVGJJd1dBZzgvbUNGR3FOWXdMS0luK2Vu?=
 =?utf-8?B?dHRzNVBTVzJQSHBrMStpVkRteXAzOENlUy9OazVQdEFqTzdLcEFDajBxYlVp?=
 =?utf-8?B?czNkbGpBUVVCZnRtdkY3d0tpclYyTWVjVnJxNjlHejJ3UDcwSWNSRzM3VHF0?=
 =?utf-8?B?Rnp4cFQ1U3NJQmQ1ZzAwVXpYOHYyQ25OM0xMeWNhVTY0UDFtbmJuS1hGRUd3?=
 =?utf-8?B?MDZMSFltb1hTYS9BVDlXQi8wSnpWM2VuaTZNamJYckFUT1l1TlhLOEhJb1ND?=
 =?utf-8?B?SU5VaXRYenBSTU9UdFFXSmhqc1NCbXBtbnBRM213TUQ0R2tCWS9Ca1JOblk4?=
 =?utf-8?B?cENIYWxwR2svWVNzTmI0NklDUnlBYlNzWk1raGhDcUdqdU1jaTRMcmhXOHI3?=
 =?utf-8?B?MkVzL0Y0aThRQisrNlB3akp4bTZMbUdVY3JnbXk1Q0lIOUp6bXRjV1B2RTRE?=
 =?utf-8?B?NWEzcFJPWlRPbFVUbWVCMUc4QkIxT0luK24rZ05ZN2dBR3FLZjFINFZ6MnBW?=
 =?utf-8?B?UXFtbUYrU3hMblpqRU1MeE1sd2pXYTk5a1NQaTh2OXQvbks1VXJsdW1LMWNh?=
 =?utf-8?B?Z1FQb25TeEE1bVloOU1yV2xMZzJIbkUxbmVoTlVmZWpuN2RJWS9JTlBuaXBa?=
 =?utf-8?B?QjNpczY4a0ZmT1V6Z0FMeFI2OEZNVkJQVy9jSDdnRTNSc3VISGJPVWcwODJk?=
 =?utf-8?B?NU9hUE5zU2VHc20rWTV4NHo5bjVkVjRyYnY5WmlJZXQrNDRIRWV2TENPZTdH?=
 =?utf-8?B?VTRyMllOT1RKOG9hK01PUDIvSjM3WExhY2Jiam9iM3YrWUgrNGFtWnVkd0NN?=
 =?utf-8?B?T1V6cThYbm85WVZVSC9IWURrS2RaRjVSOUdGN0MzTlZScE9oVy9lMFNBYkIw?=
 =?utf-8?B?dlhYbkVQby9WZ2FybmNPMjgvWDkrVGFURk1rWFNjR3pGTHNiaU5PeUg4NVI1?=
 =?utf-8?B?UGxQZ2VYN2NsN28rUnVNK0dwdWl3c3FCYmJkZ0dCNno0MjJ3REJueDlrdmwz?=
 =?utf-8?B?Z3VuVC9GOEowb2NoTEhoV3UrdDY3VVpudk80TFg0cXdwSG1qUExVSUl6MHZV?=
 =?utf-8?B?TDZtL0dDbGtrSXhkbWRjbjZ2Yld1bE5VZHR1a2FndEYxNFh1bEtMTnpaVU03?=
 =?utf-8?B?TGc1UjFBNzZna1pYZS8ybHNJWklnNkVjdTlVMDJhMWRVamVCazZsaXJBc2F0?=
 =?utf-8?B?MXFhZ3g1WTlhdEhuNUplTEV4eFc1ei9Hb1hGZEtDZU1IQ01HVUt1RDRhN3Ax?=
 =?utf-8?B?OTJHYnNmUU9ZMTFsNFllOGI5R0p0TlEybGcwN0NNRnR5dXdUaTNadi9mWEth?=
 =?utf-8?B?bmg4WThtSWxmQ2ZNZlFya014VVFZM0l3NGllR1BjUFRXRFVwQXpMWkFGRlI2?=
 =?utf-8?B?YUJCb3h0MjhKS1c4cFYwNGpZdE8rcHY0WktxcitSQzlMbWVkdDliMGR1M3dx?=
 =?utf-8?B?dWF3VVBob293dUNWQmV2bTNPUFEyb3F1TnlqTFA5RlRkeWszZ2t2c0REai90?=
 =?utf-8?B?K0F6S2UxN2p5S1kxQkRzU2daV2dEM0F1eG9UeEhaMm9jcHdTMzg1UHVVVjdU?=
 =?utf-8?B?eDdkS2QvRzFpdXovN2w0QXNyem5kUmhkM0dlOWRzWXlVditPWEVnK09tbjlO?=
 =?utf-8?B?WWpMNlk0OWtJaE40cUpTcEZuSGdIeGcrODd5WkJkNElQL0hESVd4RWxOZmFM?=
 =?utf-8?B?S1g3VEs0cnFkUU80cURNclFLaTNuMnE0ajFPUHdNSDBJUzE3ZWNPTjdtTHJ6?=
 =?utf-8?B?S2pFSGhFb2VTbGNOc2Y3NkpJcUgrYTZGMkh3Z0VzUm82UmxuTE9KSlNkbThn?=
 =?utf-8?B?MFV2MU41VVNsTWZUWk02R1c0dFVvNjVrNjBrNXZEd0tORHU1TG43aGM4ZVVw?=
 =?utf-8?B?K3E4ajFJN1NIYXRaUUN5WGJuSlk5ODJKek1FT1pmSWJ3OGxvS3pUS1NJejdD?=
 =?utf-8?B?b2Z4Y0xuVG43OVgxT28zbVY0SzFLRzdGMWVNaTU0SHdlVnZmU3IzRDBIdjM1?=
 =?utf-8?B?VStYU29hV1VlWTJsU1hxM0FNdjRXd2tkY3NaeHkwVFlPcFhqTHcwWnB4MXcx?=
 =?utf-8?B?YWFmSHk4b2tmbW52UWJFVi9DOXVIN3NuM3JvdWtWUEFUV2kvSUNRSEJITkVk?=
 =?utf-8?B?VjdNdUMwRkRXaWpFd2pmVDlrY1ZkWm5iQUVhREhiSVZFZjZ2RzJhKzBrVW02?=
 =?utf-8?B?OEo4a3BWUVBVNHNVWnF0cHpyc0JSYkdsa21DeFo1VitJL0xTSFJubGYvN3FV?=
 =?utf-8?B?OXg2UDlEU2Y0b3FHUnNmUnBERlQvMDRrQmVOcTNBYmorKzZ5MTFyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e4b74d-a047-4d15-454e-08de6b39a874
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:54:11.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BafflJETlzr83wJ1kR28VyerX+ttidFYCY3MfGMQTZMr8/aDZNlG4ADO2zLN/B8LSka7zX6GMWwF0rJLEqI4OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1C93713948F
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 08:13:09PM +0100, Alejandro Vallejo wrote:
> On Fri Feb 13, 2026 at 7:42 PM CET, Roger Pau Monné wrote:
> >> >> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> >> >> index 960f6e8409..64fde82c50 100644
> >> >> --- a/xen/arch/x86/mm/Makefile
> >> >> +++ b/xen/arch/x86/mm/Makefile
> >> >> @@ -1,4 +1,4 @@
> >> >> -obj-y += shadow/
> >> >> +obj-$(CONFIG_OPT_HAP) += shadow/
> >> >
> >> > I think you can use:
> >> >
> >> > obj-$(findstring y,$(CONFIG_PV) $(CONFIG_SHADOW_PAGING)) += ...
> >> 
> >> Hmmm. I guess I shouldn't just include it twice, like we do for other .o files.
> >
> > I see, so use:
> >
> > obj-$(CONFIG_PV) += shadow/
> > obj-$(CONFIG_SHADOW_PAGING) += shadow/
> >
> > Maybe that's simpler really, and it's a pattern we already use
> > elsewhere.
> 
> I meant them being folder with makefiles potentially doing things that should
> only be done once. I don't know if we dedup tokens somewhere. These makefiles
> are rather arcane.

I'm not a Makefile expert, so I might be wrong.  We apply $(sort ...)
in several places to remove duplicates, I would assume, I see:

# Subdirectories we need to descend into
subdir-y := $(sort $(subdir-y) $(patsubst %/,%,$(filter %/, $(obj-y))))

Which should remove any duplicated folders.

I've tried the duplicated folder addition to obj-y and seems to build
fine.

Thanks, Roger.

