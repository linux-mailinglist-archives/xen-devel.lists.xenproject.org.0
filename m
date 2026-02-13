Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPPDKspsj2mNQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:26:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF24138E99
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231635.1536710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqxr8-0000Qt-Cf; Fri, 13 Feb 2026 18:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231635.1536710; Fri, 13 Feb 2026 18:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqxr8-0000PS-9Z; Fri, 13 Feb 2026 18:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1231635;
 Fri, 13 Feb 2026 18:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqxr7-0000PM-B2
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 18:25:29 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b08f9bb-0909-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 19:25:23 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6379.namprd03.prod.outlook.com (2603:10b6:303:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 18:25:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 18:25:18 +0000
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
X-Inumbo-ID: 5b08f9bb-0909-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESkHy/kA4dwouDG14Cfe/ENKfCfiLv5tBW1ymckjOWajTDWVShTqYQr0mBsb0pm89QHCn6tIZck6DTWbCcRY7oNUfl4Hc2bZHPCgf13+Ff6hldVbM8vuwaWVcCN5zo5BWSvU1I2uxl0VEqqMOfKWJIpY7xH4PPo4n+N5eixHjaUnCsFuAlypEYOKHaRrt/HpA8Ym/zhfnExZQSEzf+PQ8+5n36V+QB/bKblQp2+d7LWJzkxcc+nLGf1U1T+TSiom87rBI+ETdtO6fAoD8YiCGeHn0geM/HUYthQcKPJJAiCvHGJnRA2RbWjifEQqdXZ0rD4/jUYrA5RkKolL9LWq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEfukp+hq7IEkNLnwMdr9XX3LAeR8fYU3ZvuXEU0c+U=;
 b=jAtZfo2i71qsdLGDYM56GS9+51txIAbA/yyen2fA/xmFR6cPW3v0oBXYv/QlsEWw4Idf5s7TRS5DRvZ/w7cuq3TgDyozPvhVOe76BnLGmWWe/3EdwzKuHaSzlIHH7d0kkebl/XiS5Tn0zMJisb66rbemO/IjazC7CdZt/jcvsaWRpHZxbL8Ximhr7E1zgj1LQZOWC57qvVKSQ1U4O3Uv5aTWHYopy1nYgCB8h9KdijlhTBB9dfGuTQ9IEd5GjJ4SmcUjd+oHHVeEtf2hf7Dw+Q+pH4+4c04Iw5XfvT36snWMKeo3ypeaOe3zJ6e6oJY4UdSnupYFHgSyhUmwZYoo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEfukp+hq7IEkNLnwMdr9XX3LAeR8fYU3ZvuXEU0c+U=;
 b=eg8zFNjOMomwe20jiS67lbaaq24c/13IkgaVo/dBY+h4xuW00RRap1WL33gS88OtYjUm/nXHz/uZNrxXnaZRG3YAe4iej83yYlkY33+wgrsqZOeoyJ8F4ZlYLkdX61is+D7YbSFkInH5R9hewR2L+/qIvzOTWUUSH9RYvf+A0QU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 19:25:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
Message-ID: <aY9siy9z2WV1Q-Iv@Mac.lan>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003225334.2123667-8-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0040.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 60333b38-eecb-4fac-13ef-08de6b2d3d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akViZGVuZWtwR1VDNEZROE9sazhqcDFqRWhodjhMK3ZOUGN0NEd6NHh2bjNt?=
 =?utf-8?B?UGdJTVdhS3RPZzRxbENRUkU3UFA0VXRtN3lCQWZsbHZTZkpxNVlUUi9NWXYr?=
 =?utf-8?B?RjVtbU5oOFBoQ1cwMDUreWl6MFFSczNrSXNPMFovaWY3L3B2STlMdnl2TUNn?=
 =?utf-8?B?MkUzOHRrL0RtN2wvVkgrdi9kYlozL3d0eExsQXBoNzBBK3h0R1RpcEJEcVdJ?=
 =?utf-8?B?VUpsZm1jbUd0TEFoZ1ZnRzRrU3JwTGFLbHBUallzRENrNksvdlVUbjljWFlZ?=
 =?utf-8?B?N2FVSEQ2UHpNWlcvb3gyOStBZFVWYVN5OFJIa0thcFhudmE5VnR2aTBic3BS?=
 =?utf-8?B?MHlTNjkxMFFqNkFieTlCWUpaSWtpditNVFB0NitYV3hrVHZROGFrY3l0MVZM?=
 =?utf-8?B?TWY4WGJKNm5PTWVXWU9oa1BaWmhLb0liQmZ6TjNQQ3BhanEyNTZiVmJhZk56?=
 =?utf-8?B?VG9EcnNaV2JROG5qYm9nTC9FbTJJRllIZmt0c2lRQTFKMUFIR2RlMnlwUjhn?=
 =?utf-8?B?YUR5U250TkYyTXQ2ZmtlSFg5RkR4QUJZUUJrbTYySndraitkNlZoTEJhVFY3?=
 =?utf-8?B?bSt5blMzdVAwT21LN2JMTENwWlh0TFdpV29BblFKV3B4MkFreHBQMzJSK2pj?=
 =?utf-8?B?UVpDQkNyOFZuRTVHNjhLR1F6M2ZMYlpaVmFTS2xFMnhlN3hXUDN6WGlOL3l5?=
 =?utf-8?B?c1ByOTlXQ3JROTkxUnRwaW5vVGdiWXNpZ1A5MklsZUpweVJKVFIvM1FKUEVG?=
 =?utf-8?B?RUNVcXlUQmZseVNMYnJ6M3BTeSt0VjFpMTMwRTZHdXN1MGlscTVBNjFEZ3hw?=
 =?utf-8?B?cGxvY2VtODZXVEJxcUo0Z1BpekpkRlNjMHF2R2U0cHdyUVBvKzE2Tm94clAy?=
 =?utf-8?B?YmFOV1hyOEFkZFJsYnd6eE9BV3JlY1Z1czVmUWpiNGdwVUNrOGxLQTFhWTRR?=
 =?utf-8?B?V2NHN3lpNm83QUx6U0xEVkRibnpvK0FKR1RiZ2VBaG9VSnNqY2tqeGwrYjhl?=
 =?utf-8?B?Qy9PeDMxeU05eUhwdnI0Zm1KWVVCVVpXR3lyd2VXZVRFSkliMXNOaXN3czdy?=
 =?utf-8?B?YnFVY0ErazQwY3hyVXgzVE1FQUg1MzhaWmZXakk2S1pEQ3B2QjgxWHdROCt6?=
 =?utf-8?B?b0dzOEpWS25ESjEvamZQTitOWEFLb2JreThpVGJDU2dTRlFJVEIyVFFpbU1Y?=
 =?utf-8?B?RXYxU3pOdDEweDM1cDkzVlkzK2RsV0dkSlFLa2pyVDhCTlppSGxLUVBTWm9B?=
 =?utf-8?B?ZFBpQ2RyTXVGRVorViszRkl1cFpIQVEzY24wT1BLYm5NL01JRTdYRHRNbEtP?=
 =?utf-8?B?Y0h1ZEovYThmZTl4MWJFOFpLVDNvSTg3bE4ySGlDODlNL0lWMUVYb1ZZRFV6?=
 =?utf-8?B?ZnpMTlRzRHBmQzU4TFRCNG8xUzlLbW5WdElQbzl6TmFQSHNITUplNGk2cXVv?=
 =?utf-8?B?MTlRd3c1S0RwK0JDYnRDVnpQQ1JnOHJzcmZNWTBLRjMvQnJNSnhRZFVrOVkx?=
 =?utf-8?B?U3JBN3lwSHFJeXZJL24xNzVjdVplVWUrUGJiS3crdHV6OU9RR0E2M1cvb2Jj?=
 =?utf-8?B?U0tub2hkNklKSGFlMFQyRVdRd25aNUsydks1MUJJSGNQem5rbmJSaDNjWnRr?=
 =?utf-8?B?VjVjWStHcFIvc0ZpR2Z4UDAwOXBQQmFIdlJ4V0ZqcTg3dGEvYVhsdTd0RURn?=
 =?utf-8?B?NmNodExpTHN2N284TkJyc3lYNkt1MkM2REpyRUlITm84UzJGOEZMc0ZQdDhE?=
 =?utf-8?B?Q2l5RTlzZEFmOWxRZzJlRDA1VUE4Qmo5K3poamJDTExuTG5ha1R0akhWWEVt?=
 =?utf-8?B?ZXJNTFdYTFJTZm10aGFIakJOenI5L0dOYktRdWlEaE01bTZORCtqOG42dU1z?=
 =?utf-8?B?citQTjVsdE9EaWVFWjRJV3FXM0Z2QTRyQWdlK2lBbnN4a29VTGVnTTl0cXFa?=
 =?utf-8?B?T3dJQ1U1WHNLbmJpV21XWmszSnlPbUo0MXJPa0hxNTZiVFRXOGlRb082Y1Qx?=
 =?utf-8?B?RVpUMlNQblh2Ymd5SkJZalhCbm1nRzQyRzJPbG9vZ1RVNG1XWUl3Mjd1a3pZ?=
 =?utf-8?B?bWM5bzByU2NLZm05eldIZHRFM2hzbE1mc0N0Q3VFSUh3Q0wvWWVpVkV6YTc0?=
 =?utf-8?Q?LEuo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlRaGdETHAwTDR2UnhVMXFka3ArbjBmMnZCWjlUM2xuSGw4UmNnM0pNSWRq?=
 =?utf-8?B?enVoSWVIcmZvVEVkVnArWTZqR3EwMWFhZmVhMEg0RVpqQ0dmZ0RVaHVteWRh?=
 =?utf-8?B?WGlWWG5BTmFybWt6THVRVHgyUnptTXd1M1dtMzBFaXlDcjc1VkxCQmNTRVNS?=
 =?utf-8?B?NmlMcVozZHdhaWxlN3R1Z1kzM3k3Vlh5ZzlMTDV1WFZjTGtOZW9McSsrUWtk?=
 =?utf-8?B?RllIV2xVRExjbm5FdWxaV0kvRFpXK1FYSjdkSzdaOW5hUHpsRXB3TVhsM2FK?=
 =?utf-8?B?NTloZ0JIOW9mUHRiSTYyR3ZYNmVKUFBCNm9KbnprZGlHVUQ5d01zOXpwaEVV?=
 =?utf-8?B?dWh2UlpaWStCa3BXZFJMMXVHMC9CZFlLVFh2bnlDMEViUEgrTFh5eDVyK3Uz?=
 =?utf-8?B?ck91UnQ5WkZNbWhiREFwUmFvK3pyMDBOL3p0UjM4dzJ6czVKL2tsMTdFcXVN?=
 =?utf-8?B?NW15TzBHNzNMTXQxV2lBR0tmSDY4bHhNdFVCNWFTb2g2bWp2UmlXa2g2a1Zw?=
 =?utf-8?B?elBTSGs3TlZxbjhodnB6Z0UrT2dGdmFybENYVk1BenZjTGxiZEtKMEJscWJi?=
 =?utf-8?B?YllES3lwWXVlNXRmeGh5U0VrakppNnNsTlpiaU5KWVlOYkdaZFlCM20rNE5q?=
 =?utf-8?B?bkw1eFpzZVRPV1Q5K003RUVGVmU4SkdaQmNXaWc5enRYT1hzRGkvV044NFBl?=
 =?utf-8?B?bFVBaG51ZFhabnNjdlhPWDlQZVoyRHZBOVFLNG5qd2NNbWxGaVh0UURUMFA0?=
 =?utf-8?B?RmdvZXFVVktwZlE5SUFka1Exa3I5WWkvUFlMNGZTaUY5L1B3dXNXbUxyS1F6?=
 =?utf-8?B?dlpvZ3N4U291UDEvblBsZjZhaWZoMXl0UDJoU2RtKzRqVkZVL3hoQllodGZG?=
 =?utf-8?B?clFHWkdMaVdlUlhET21YeGFlS25qbXFKOXo4ZHJrWjQwcmhEL0EzYjJ1cVJ1?=
 =?utf-8?B?YTErUStWQmliSXlTZ3JWRnBZcUh2VUZlVFpEMVI3d215U200SHhLVG5vejlv?=
 =?utf-8?B?OHRreGZIcURVMFh2M2VSYURiZjZJNkVBdVJXc1IxWVp3dmsvNUxTdFh2U2N6?=
 =?utf-8?B?T2pTV1lOU0tVSFJCVW14YlZsNlVMei8reTVJSk1rUkxYamc1M2x1UTcrZzA5?=
 =?utf-8?B?Q0ZDQnJaY3lGKzF4ZDZZOUx0UXc3VEQxUEJTd3JmajdXaCtyL1ZMeGdTSHJi?=
 =?utf-8?B?SFFrd0ViWWFWTmJtZGhCK0d3V2tpT2gzdjgxNFlJYlY1MUJvRGVNT1RNQ0Jq?=
 =?utf-8?B?UDNKWlNONFBFQ0hvV2VaZFJmdGttQUJSWk4yS04xYXZCL29FeGFKYk1UNlJm?=
 =?utf-8?B?WW1hYTFMQWNkSGZPd2dWVk9pczYvcmVra0dWYXJrMzVVNHN6ZVBIdlBZMi9l?=
 =?utf-8?B?R3pKRklPSkhZcERpMldaNVgrdWt5WXJ4QzFNWkNxcEUxUTNEN2k1SzFoTTZv?=
 =?utf-8?B?c2d5VWJ1bU5IS0szRzg1bE9aWnRka01zcFRsb2hSOTBKQkM1ZmFoMWdlWURk?=
 =?utf-8?B?aThyMTVKQlErNWdHeFJKcEtJcVNIOUlmTkI0YWdUbnphVWt2MU4yTzF0Nytl?=
 =?utf-8?B?bllwQmwra0RCNzZQZlZOcU4vclQ2YnYzQlhvNGVNOVVkQUM2bTZWU1p1N0x3?=
 =?utf-8?B?MVgwOEhVaFBtMWg2ZW15UERObXNYanYvUk1IZ3h5N1A4REFMT1ZsVVlpZUxY?=
 =?utf-8?B?L1lLVXM1OEZ3a2lYK0h5OXRVRWxjekZKM01XaHJRVzRuV1ZxY0pES0lxSm85?=
 =?utf-8?B?Nmh5M1ZLVUZOb2htMWNyREkwTGdDTFk5aWlTaDBEdjBCWmFpRWJmZTdqNWtq?=
 =?utf-8?B?cFVXazRuaVpuaUFtbVlPTzB2Y2J2ekUzODFyMTZmV1pFbWEyWEZFVm1BSFFl?=
 =?utf-8?B?ZkJkeWNrM3RUaW9RTlUrakVtamNReUhZYmF1UXA3dkpudk1hcTJEa0p4VjFY?=
 =?utf-8?B?b3dIR1lCVFJzYUo3dVNEZWl5WURkNGhZU0hNaG5ZZ0J5OGhKdVpUMHFualYx?=
 =?utf-8?B?Q3d0bXpxTmc4SjJtN3NWYjZlNXByalhQT1BRRGtJbjMxMzB1RWtaTlE2TStw?=
 =?utf-8?B?UXAzbjl6bXBDYmFPamxlZGVEMDBFSDdxU0xidkZDdjJsQTUxcmxtUWdDZGYw?=
 =?utf-8?B?ZTRLZHJWbVlaWHpjaXJYMTNBY0gzdEkySXE5aFdGc1Zoa3kwUVNlOURxM2FM?=
 =?utf-8?B?Wm51Ky9Ua1d4UEJCanQ0RDB6RThFM2lFNmVaekpGbXZZaXJjR3FDL2hXZVJ2?=
 =?utf-8?B?bzJteFhER0FZSVhoUFJ6Ui8vek5SbnpDMGRPK25oMVE5OUx1WEV5ekZvQXZD?=
 =?utf-8?B?K0ZaMm5kQVBna1hMVURCajF2WkI4Q1pTZ1ZMS0o2NGZtdGdLYmYydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60333b38-eecb-4fac-13ef-08de6b2d3d52
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 18:25:18.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nI/TLjYxUiYkxZOpu6lJG20Wj10qS+xd5Uz5YrZUGVZ0E3Kq2rlUBpRb3uBbucYsYDk1feHoeATxfmJUDN59PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6379
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0DF24138E99
X-Rspamd-Action: no action

On Fri, Oct 03, 2025 at 11:53:19PM +0100, Andrew Cooper wrote:
> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
> means that switch_stack_and_jump() needs to discard one extra word when FRED
> is active.
> 
> Fix a typo in the parameter name, which should be shstk_base.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
> to parse as an instruction immediate.
> 
> v3:
>  * Fix a typo in the parameter name.
> v2:
>  * Use X86_FEATURE_XEN_FRED
> ---
>  xen/arch/x86/include/asm/current.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
> index c1eb27b1c4c2..62817e8476ec 100644
> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>      "rdsspd %[ssp];"                                            \
>      "cmp $1, %[ssp];"                                           \
>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
> -    "mov $%c[skstk_base], %[val];"                              \
> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
> +                "mov $%c[shstk_base] + 8, %[val];",             \

I would also be fine with using the more simple '%' if that yields the
same result.  But seeing existing code is already using this
formatter, I think it makes more sense for this commit to not change
it.  It can always be adjusted in a followup commit if there's a
pressing need to change this.

I wouldn't have used %c myself unless it was already present, simply
because I'm not that proficient in inline assembly.

Thanks, Roger.

