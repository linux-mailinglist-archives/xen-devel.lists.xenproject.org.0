Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNBGHAe0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE6481C3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209003.1521128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCOB-0007QG-IK; Tue, 20 Jan 2026 14:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209003.1521128; Tue, 20 Jan 2026 14:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCOB-0007OB-Eo; Tue, 20 Jan 2026 14:07:23 +0000
Received: by outflank-mailman (input) for mailman id 1209003;
 Tue, 20 Jan 2026 14:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viCOA-0007O5-0h
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:07:22 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53b5dcfd-f609-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 15:07:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7401.namprd03.prod.outlook.com (2603:10b6:a03:55b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 20 Jan
 2026 14:07:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Tue, 20 Jan 2026
 14:07:14 +0000
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
X-Inumbo-ID: 53b5dcfd-f609-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWOs/I/WS0Fz9T5aSPGH12DPof26/fhvAUAHZE5w9Qdq0/xWZnfqjt4HUW7uMBaFs897O6X3Blhc+m2eWMEHT4i7MbXcCV1bdT38lYraKZ+R9L3p5nYoY1ZsuB43d2TjigsgMTkkdxI+NPMh16ihBAgArEK8xooXVCYzBOcD3RP+yNLnhLvI4LXD339zSRibxOl/yb9tXMtyM1ijwz3psVOri9whEcXIgtgtwjde6JO5IhWorsiV5184NaDeawf1CJUGK/3uf2I2lvaHTI9X4GEl/Si7SNtKRuOorf6z4QptN4QGa5sSPljObCFiDmx7ykirGNA5AL+og/FjQLfuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wMCjCg+l8nU5MPqP9WwnsjLA9RyAISWe+1h3Mco8JI=;
 b=QtMuHm2ZtpHg4kh4v3Xsvfk+n63u0cXpZQTGgqqclwc6csTfnWRd2SMmKUOixCipIBATeb3ApVukiggAaiUQ9az3v9MtcAWympXryYzJ+erxu9cVJqPEVevTxhIczKU3K/yKFWjmRXyhanuXmL+FCBecohqise/i0j6bAuWd7g8wF44mznQLRMKS8Z0zUPCEvpjDPuboh5nNEAWj9XTwvQ3RLuCFDeuyxs25jg6YyG1D+voFjq+UlJN3sDgJhobGwU4tVBnT33olblzzrx3q7UnSA5rGtzfhMfywxE38L64umtq+8eafzAc20OCWTLV16gduANRf9ZhtA13YyYD8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wMCjCg+l8nU5MPqP9WwnsjLA9RyAISWe+1h3Mco8JI=;
 b=BK7ll5+xMEVOEq6ximn+UnY7/G8Mu0VhHFYJy6ofWydX7lriUI6TTc8UdeOaX0FlrRQWFGs94unmxsHHhT2coUGOThpMu43EhNs2gp6pTlNALTJpual6Sn8HM2KfKH9Tqg4VpkvW7Hvl6jf0gmI4KrSaT33l4LX2k1bXxBZg12Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] Partial revert "x86/xen: fix balloon target initialization for PVH dom0"
Date: Tue, 20 Jan 2026 15:06:47 +0100
Message-ID: <20260120140648.25977-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0313.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: b14598df-5945-471d-e395-08de582d3635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vkd1UlFxMVBRTzB6UVF4VEJZVUR3djZDSnRUUjJkRG1IZ3lYVWhuRlQ0UnFy?=
 =?utf-8?B?d0Fjakt4V040RCtJNjlzY25kcUxxVDg4SnFVYjEyWWMzMHZ4dG9ScFlXYmZP?=
 =?utf-8?B?VGtjSGVyN2s3NG9aNElvN0MwOWR6RTYzZkxKVi9kaHVPUWVYWlltZG9RcFRt?=
 =?utf-8?B?MThhYlZTT1NsazhSRUNsZzJGNmZCNjNkQlJlRndwOWt6bENJQkR5QTBpaHBz?=
 =?utf-8?B?MHZpSFlrOFBmWnNOaEEvQm1PQTdqQ3hTVy9GT1RDbmJiWEJwZUhPdUJMbHdj?=
 =?utf-8?B?ZnBUR3h5bDYvRDlRNEt5ODRPdHhQaC8wNkVpK1dHbkloZERWZ2tiTkh1Uzdi?=
 =?utf-8?B?QU9PWXdPTEhRajlhU1BCSllKOEwyczV0dzY0SWNFd2lMaUJNOFk2d0doVHFJ?=
 =?utf-8?B?a3hMZFNaMWIzOVNyZGJJSEE1WWY3MTROWnFkNFBsSnFQS2d5SG1vdUd0MFlS?=
 =?utf-8?B?M1prQ2dON1F6NkRZdTBZYk5FU000TW1DbmRCNFlVWlZCUEhDeTNDUjJvb2wy?=
 =?utf-8?B?Rzhsc3Nkai9LQnZDMVJLeG1XYnIxWHozVlMxRDN4TmlkUFVtNUxkdTVrZG16?=
 =?utf-8?B?NFNlREs4WGI1TnVWWEhrd0hjTVJ6NzF1SktsVGRDOTBmdWhYU1RGSHBOeUJK?=
 =?utf-8?B?MVpYZCtQZUhOWHJjaDNGeFNDSjhWZ0pZbVpoMmp5UW1IQitXYVlSTFdoUTVE?=
 =?utf-8?B?MENRakdNaXpQV1NsKzJvWi9ZaWxoS0hPYUNDN0xVT05ZU09DNU0wancrRFlB?=
 =?utf-8?B?c3VQaElJRzdSRzlhdW5tVTdxUlllVG0yMnFJMjNiV0dWc1B1cDhTWXllTDlM?=
 =?utf-8?B?cnR3SGxpVGZKWXE4Umh1N3JTZGJDc2ZxL2VFeDUxS0ZNYnhYSE1tMTliZndB?=
 =?utf-8?B?cWp0WjhvY3NidkMrTG0zYnVGNWpvUTV4S3IvYnllbDAwM2lrTVZPUXpRZnEy?=
 =?utf-8?B?dEFsYy9Bdk1PS2E5aWdHMkFzVVFrb2VFTEJ3ejlUZFhadTFxSGh0eENJSEpl?=
 =?utf-8?B?VUtzdUVpU3hSemE4d2RsYzJnWURhWUhjUzIyQmgrWjNONkRzZlppbStPRTdk?=
 =?utf-8?B?clBiNWtucHczZmM1L0poNG9YQXZUVEhlNExOc2J1WEsrSFZuRnUwVXF5bUUw?=
 =?utf-8?B?RkxkNlhuVzVGUmF5aXo2THlpYUdxVVlJUUpkSE9zSWdvR29EdDU3RWlPUk00?=
 =?utf-8?B?ZGFvYlJSb0lKMTZ4Q1RMRmZzdGlxeDRUUDBsQkZzRVAyWXJqd0xacHMwUlVV?=
 =?utf-8?B?UUlNTkxGLy92Y08rcmMreU5Fakw1Z3QrWlV5MzZlcFdmOFJQUW5kdzZjTEcr?=
 =?utf-8?B?WWNhLzVnYzJ6dDI4OUtPYmJkVHlEaFc4K2YrS21EQUZnZ2hwS0FZQVIveGRT?=
 =?utf-8?B?SnREZDZGQy9tMUxWTTAvV3RuK2NET0lVellWWVdLa0R0M0tkQzVjVXhjVkFV?=
 =?utf-8?B?bHdxa1o1WHlOVTNCYzh3TUIvL0VjYlk1YmljVlVTSzBPd0RoOTg5c0NlMUkv?=
 =?utf-8?B?UWtKOXUwOUVEK1pqVWc3ZW1TR1hOWmtFcEJKcFF2NVlCU2xLeCtmZzRQVG1m?=
 =?utf-8?B?RDQ3ZTk2QkJJQzV2c3ROdFdlT09CcG5GTlg1OTQxV3pVV2toZS8zaXJZenJu?=
 =?utf-8?B?cUYvWE91di9HZWFPOFFlVFVwakdTZ1Q0T0g2NVhXVVZXd3o4bGVOcGdJc05o?=
 =?utf-8?B?RVZ2aC85cUg3TXN6WlF3ZjFMWU44bFNVekdKUkdtbzFZendqek0wekNNN0c1?=
 =?utf-8?B?QTJ2RXYvQ3J1N1JmOGJjTmRBZTl4ajJxbGU2UGNvS2FCZ1JNSy8zRVJxMUcy?=
 =?utf-8?B?RDFHd0MwY1A2T0VqYXhiZVNaOTVpbnp0VFZKOTJ4Wkxabk41QVZRaTJnMXpw?=
 =?utf-8?B?UlRvRElLVXQ1OFBMaEd3KzFrYlpHVlo3ZmhzalhtZXdtRWZPcnVoZkRzL0JO?=
 =?utf-8?B?SlZtYWpEei85aVNtTmZ1UTVoRWFHbFlZbUJCZStISUloVzdmdHBQSVBuQmdH?=
 =?utf-8?B?azNVOWtmelFUWnNVenoxTnFCQThraGVDSmlEalVQTURCQVpMSnYyNEF0Rkt0?=
 =?utf-8?B?ZE1EWm1qN0tWRUI5UThCMTFoMVExRVQ2YVdKVk8yL2VCZk50MmJGaldURERn?=
 =?utf-8?Q?rYxo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG0wc3ovY2JndlVTRm5rUVNZcXYwUUgwMFpKYm9sY2RzSlYxSVJ2aWlUaC9x?=
 =?utf-8?B?UThKTVpxZTVOcEJETEo5d0pKSGpyNCtncVpHZmtyUll5U0hXM1QzdnNhN2VG?=
 =?utf-8?B?KzcxRWgrbW5VakZUUVhoK29HSEVrejRiT1ZYQko0S0ZLb0gyd2FRRXdBOWhB?=
 =?utf-8?B?WWpDem9tdFp1Q2tXM2xZV2FNMWRIbWlBZ2tVcDhKZlp5NituYmxrNTEweTBX?=
 =?utf-8?B?ZHNldUo4YnhhZS8zUDZaeVBicDhtZ3NKbmlVeXdKZm1zSVFva2tFVzRlb2FU?=
 =?utf-8?B?TkpicFB0c1B6VmEzNERXL0h3Ymx1T2JpYnhkMVNkMjRCN2YwV1ZmdFM2NUN6?=
 =?utf-8?B?WTJyVlpRYSt4Y2xCQlhJeWRxYzdUbVdIdmdIZFk5VHVicXd6Ylp1NExWSjJH?=
 =?utf-8?B?TXViZXdySTBHcFFLNmhQcVd5M1ZXZ1kxNGdJWnRyREN0dW90TWh0MEZUWnRJ?=
 =?utf-8?B?Z3BrYUhoWjVvM2xEejcxa0hWQ0VWR0owbXYxMjhKRmhaNlAwMzdyWGFZNUE1?=
 =?utf-8?B?NDZ0dm83bzRxTDFNZ3BGd2FpV29ZOElhV3huejlmU0FCV204YjBjdXJtVCsv?=
 =?utf-8?B?QU90aFJtcnR1SURWQWdlb2EvbTNrNTVZTVc2OHFsWTd6V0ZRb1NQUDVQZlVU?=
 =?utf-8?B?QlVEYzBGNlpzTU9uVDFpdnNFbXZwbXlhREZKc2YydFpycUprS1o5OEtZNGpI?=
 =?utf-8?B?QUh6dEdORDVCdTFVK08zdDlWSmJzeHZ0WU9ETTFtWkZzOVBGMzZLdUoxRFRR?=
 =?utf-8?B?Tk5xYXdXUlVROHlWdnFxRVo1bG5ZY0FKZklaZ3Z4T2tjREoycTBseDlrNlB5?=
 =?utf-8?B?REdnVERJbnlNZmJ4VDZHcTIybnFETG1tTThWS0d4MVZaQTd1NjFsTGJzV0x6?=
 =?utf-8?B?NlBSd1kzTWhrVDEyVjBWSzVFaS9XTk1pdnRpV2dYLzRVdmdSSFpDbURyTHd0?=
 =?utf-8?B?b09qZnFJaitvck92SXJ6akpIQi9Kc2VWWVNkejBienZ6c2FIODBPQUl2d3l4?=
 =?utf-8?B?UnhJV01kVkk5RjZzUGc0QVpSQ2FhcjYzd1djbHFDSE9YR2RNV2Q5eFAvTXA0?=
 =?utf-8?B?REt5RklJTXU3L3RXd1pzKy9Wbkh4dHZkZGdydHgxb1ZFTVczY2JlMDEyZnBu?=
 =?utf-8?B?SnhNQ0MrWWhBVnpMTlc1OVRiczlDR3B4WHlmZGIwUFQ5NHRNVGFSdmlkWFd4?=
 =?utf-8?B?WUY2RXlVSmxuaVlkVXdyTjlLMlhBdnNtSTBORS9BbVBLa0hIYmR6M1Z4NlEv?=
 =?utf-8?B?KzFSYTNIcmdSNTlMNnRNcUoyNVJRaTVkQW1lY1ViWmFaSjYrWlFtSndUNnBt?=
 =?utf-8?B?Nk0xZmxBYTBabGo0WndRZnJRcEhOOUxJMGYyd3dmVUFLM0hxa0J1OVVJZk51?=
 =?utf-8?B?T2praTRaM2hPNHEwMXpaVkV4azNCV3lRWkRpUlRwNnFReXN0cUxPQXhobnpN?=
 =?utf-8?B?N1Fpa1BMRTZ5MGhNY0RXNlZFSXdFZzBibXNIWFVOdWtWdmFhRyt3MVB6dmNa?=
 =?utf-8?B?TTM1K3Y5YXQ5eUt3K1F5MVJKREFiM2xTUWcySXdRTXhMU2ZYREZsbWFJTldr?=
 =?utf-8?B?bE9Oa2ltTDFmcVFIL2RxSWJEVzJNSnVtdjZwbUFDRFBWQTFqSjg0RUtDaUV0?=
 =?utf-8?B?Z05xaDU1d1ljcHdWNTl5NFVuaFdESnIwWmdGL0NDdzFWQkxhdjNhaC92NDk1?=
 =?utf-8?B?VHU0V2hKQUV5aVBGUk5LMzJPeXlBN1UvVG45djIyRDNtYXh3TUYyZE02ekhr?=
 =?utf-8?B?ZWVMUzZGSkJLVmJ0QnN0aElDaHozcWlGM2JFSEZGRmlhWWhISEZTV28wSTFp?=
 =?utf-8?B?ay90OU5SVi9rbW1HRzFHd1l2aUJyc1czK293WU96VU1xRXRCdjcyVlJ5MU9U?=
 =?utf-8?B?K1ZOd3JST2g2NzRwUG9qcHVFc1UzS2tIeTFXQ0ZWRWxDRmtRM2RUT0s3TUwv?=
 =?utf-8?B?R24xV0NKUWlOUThUa3JxQnVldmp5NTBIR0FFWUxRTGN4NWpIUXZtQ0hwdlBF?=
 =?utf-8?B?d0k0b1JXYkdhU3M5d285VEVpWEVQQVdMNVMxTjJxLzdjNHIyT2czWUxEaHB5?=
 =?utf-8?B?dUJYVzFaVHlCa3BLd2ZJOWJ3c21YaUdlYkVlS094cnFxa1dvcUUwU2xVdSsr?=
 =?utf-8?B?WHNJSHhtTFNCRmJ5WnRwVmJHdDF5VFcxSk4rUDZhck04WEZuS2NHNEVVVDZv?=
 =?utf-8?B?NktTMU1uZ3RTN0Z4RGZUblJEZXAwSy92NER5cU1waG15M1p3ZEdzd0dPWTRO?=
 =?utf-8?B?UjZrczBXVURUWWFvN09jSHg2RnRxRTgvQ0lFMisvYy9BcHFDaDRoakppajRN?=
 =?utf-8?B?UHdNSldxejFwMjdVTC9nOFlYR1R0YjJ0aTFzWGFvMThzM1NSRWdIdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14598df-5945-471d-e395-08de582d3635
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:07:14.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kef7MiHVSzi/BUsSaJFcm2QO4YgMqU0XPkzJYKqeRisKQmttZb6Jr2KVMHx+mEYvCvMObCl3D//kqt5DukyfzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7401
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:roger.pau@citrix.com,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E0DE6481C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
the current memory target for PV guests is still fetched from
start_info->nr_pages, which matches exactly what the toolstack sets the
initial memory target to.

Using get_num_physpages() is possible on PV also, but needs adjusting to
take into account the ISA hole and the PFN at 0 not considered usable
memory depite being populated, and hence would need extra adjustments.
Instead of carrying those extra adjustments switch back to the previous
code.  That leaves Linux with a difference in how current memory target is
obtained for HVM vs PV, but that's better than adding extra logic just for
PV.

Also, for HVM the target is not (and has never been) accurately calculated,
as in that case part of what starts as guest memory is reused by hvmloader
and possibly other firmware to store ACPI tables and similar firmware
information, thus the memory is no longer being reported as RAM in the
memory map.

Reported-by: James Dingwall <james@dingwall.me.uk>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/xen/balloon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 49c3f9926394..e799650f6c8c 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -724,6 +724,7 @@ static int __init balloon_add_regions(void)
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
+	unsigned long current_pages;
 	int rc;
 
 	if (!xen_domain())
@@ -731,12 +732,15 @@ static int __init balloon_init(void)
 
 	pr_info("Initialising balloon driver\n");
 
-	if (xen_released_pages >= get_num_physpages()) {
+	current_pages = xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
+	                                : get_num_physpages();
+
+	if (xen_released_pages >= current_pages) {
 		WARN(1, "Released pages underflow current target");
 		return -ERANGE;
 	}
 
-	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
+	balloon_stats.current_pages = current_pages - xen_released_pages;
 	balloon_stats.target_pages  = balloon_stats.current_pages;
 	balloon_stats.balloon_low   = 0;
 	balloon_stats.balloon_high  = 0;
-- 
2.51.0


