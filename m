Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C49K4PteWkF1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:05:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551C9FEC3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215408.1525613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3MX-0002ml-H1; Wed, 28 Jan 2026 11:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215408.1525613; Wed, 28 Jan 2026 11:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3MX-0002kf-DL; Wed, 28 Jan 2026 11:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1215408;
 Wed, 28 Jan 2026 11:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl3MV-0002H5-Jb
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:05:27 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f906b49-fc39-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:05:26 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7226.namprd03.prod.outlook.com (2603:10b6:8:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 11:05:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:05:23 +0000
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
X-Inumbo-ID: 3f906b49-fc39-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYG83KAQ4n5w6HBGVGYMmZaudddUqSOQFczsESZZzi+n3rnj3Nn7lFWnDA778lp2nZlOB0RkHWGGcP1FzdTfbQhAugv4DhfemKzTrPMyCQgVc3+X8Cn74Qt1oFk/GoVDHDRTnuSKcoC8hjkENTOf5SBOcVkXLMXTKCTLwPX+mxHkUfBqRA37cJpy7yecf/gZ2MEtMNfufY2Vc8wem88jgjxtBFvxnxObqzfP5AOtsozcNUKjjAikX2NLOYXRP1CxUo/RIt19OIDeIClyxnOmMnVBDU7EHbz4l64hcisygpQGTr6+Y1/FrJHK2G6MqlHQBeJx8jrmMUC/hsmBe8WtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+NJhugKUI8XfeUu5jC3/2LyubMrallgBTyM0xeCUkQ=;
 b=PXxUUSWdtiwiXBzti1iaioM+RFMGX8tJwDtqH6mGsd2p7pKacb1xBmyi/OoJmykkAOxSjU19knfZpY4B2NFSw9NB3wSyURk2zh9YXrPcvB9gM7WUdYWwtBWtYrUiSctCov2GPjZyLiOrMOKa1skkVPh0d60Dg9u/mQ7nXi2vEVurnZTzZPSoXLo/24Xw74fX8+kzCq0IoNmGN5NYf2Rv52ghX7VQcd/h56Z3HNOviRkkZucYWVNy/MGoAll7XEea+UwjL0pBqcep51NWU6vV55FnOdbUuMXGNH6MdX3MydNSP0HjC6rsapVvcW8rp3HJIy+rixCLMsdscSLoVuwbqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+NJhugKUI8XfeUu5jC3/2LyubMrallgBTyM0xeCUkQ=;
 b=y46yoeKhfAaisexDmL0CNQaiXfRfR19HdBy9OiKH8btMUYHyybHEPsYC5AbMq4piNFyf+Cv3OzHaeYCu6x5b3dIrLGoqHB/SBzxBy+76Hxvhvqh8mY2qtt9y+SkdxDGBxlWiQU3ePL5y926/s2IN0pGr98mOck1BRkqB/PdgVKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon target for dom0
Date: Wed, 28 Jan 2026 12:05:09 +0100
Message-ID: <20260128110510.46425-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128110510.46425-1-roger.pau@citrix.com>
References: <20260128110510.46425-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::24) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2d79c9-0f5a-4400-861d-08de5e5d2267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGo0OEtqSUd1cU9xeTc2MkhxUFVYdzAwRFRrYjRSTk9GamRUQS96SWxVbnlt?=
 =?utf-8?B?UjRpVk4wckg2WSs4R01OLyt4STJiY1RDdWxDODRRcUxOZFpiVHdEQWRGUHJ6?=
 =?utf-8?B?K1FiWTc3SnE0UCtPdXpDMHpiWVd6d0lhc1VjNHh1b0FubnAycDJmQU5GM3JW?=
 =?utf-8?B?TDJWemV0NmhWYThNUzE0SnhJUW1WTEVuWDYrOFN5NFlxK2VPNnhueGsrNnFw?=
 =?utf-8?B?VUoyeHdhbjZDYy9HMWgrUW94RkZFakViVnA2R2NXQXlOYnY4YUQ5Vm5KeVNR?=
 =?utf-8?B?cnJmK0NqT0VlYkJpSmNvYWVLV0pkYzlTeXVkbU1DY0YvMWxNUktlbXI4elJi?=
 =?utf-8?B?WTl2dXdDYkhQUG5wT1V0RCtRVkxjc2Y1WjZTazJNNDkzenk5dDhxTW5JT0V4?=
 =?utf-8?B?UklDT2VBVFByZVZzcExSZ0oxK0JFU2ZFTXZEU2ZnRm92OStQOGVuWHBrMk5i?=
 =?utf-8?B?TE1PTG8wWjg5emZYQWJaVzJFZStpbkZtK1pWWlU5SHFENzdLMUt0cTQzUmtP?=
 =?utf-8?B?cjVydzFOcWlPRWM2QlRWVWlrOUdhT0crd21wVGExTWtIVmFoK08xMEZyTmFm?=
 =?utf-8?B?cXBweDNFdFJEcDRWU1Erd05KaDFHemdmZHpHSURhVVZpSTlYMlFQbGZ3UEEr?=
 =?utf-8?B?RWRheENJV2tLWVlnZDBrdGM5Rjhxem9kaHNpYzQ5T09Kb3FJK1JQcEIvMFVI?=
 =?utf-8?B?ZE5WYkQrWVlRaXFsbFNmbFpuZm5LZDlrMU9kOWR6T0Y3ZGZPT2NsZHpzd3BK?=
 =?utf-8?B?OFk2dUxIQWdCMHQvK2plMXdYYkM1NTd5YnhNUm5wUkdCcU9maUJ4bnZKR1dL?=
 =?utf-8?B?TnlWUXdHOFRwaG82SHZpZEVoRkt3ZExpTVZpVVJsOW1Gd1huRWlHY2lqVE9G?=
 =?utf-8?B?TjBReUNWUFpjZU9TQ1dSREVNcXlsYzVIVGVrMFVocFc3M0VCNWM1TGJyMG1X?=
 =?utf-8?B?WmFnMzMveUd1OGJKcnhtem9BK0dhb3NDakpTcXBCeEVYbE4rRGpHOFZGRzRR?=
 =?utf-8?B?T1dqb1l5bE5VVVl3SDllRFQxVTdjTWN1Q3c0YktsVitwbkVnRGJBTHFCbGhQ?=
 =?utf-8?B?R2RGOGxJL3paZEM3K0VGdzNPQVRiSHV0MUxmTUZXYS9UVkYvazVIZ2RqcVds?=
 =?utf-8?B?aXE0TzdQRlU1VElZZFU0R2UxcURNaUxPOFI3TVM4ajdOaDZhblZkNERLUkFR?=
 =?utf-8?B?QVhpWUIwY016dXhrU3hNMllLb2xoWDVIZFhiazN6eU4wRkpTMjc0OGFZalUx?=
 =?utf-8?B?T2VDSHNOUjdhQ2JnMW1VU0h5dW80Lzd0cE4xOUc3d0RhMW1FdHRuOWZxK2Vu?=
 =?utf-8?B?YUppY1dEaUhWWGJZNnFjNmJTTi83di8yTmQ3VXppdDZBeFZsK3ExMGE1WVJq?=
 =?utf-8?B?cGVTZEU1cWtxWVI0VkZsZFhrd0Y3QjdDWTQwcThMdG1LQXRxQ1Y4dlZ2eGtl?=
 =?utf-8?B?M0Q5d3gxYTZ5UmR2NHpwTGdUek44ZzdYa2VESlJ5T0dYYWpqUG1CVXF1YWZ4?=
 =?utf-8?B?cXJkdzc0T2NnRkQvbHgxYWlpTE0xRVl0TVc3bmpVUm5TVUZLQ3pyUnFDSW9r?=
 =?utf-8?B?a0hQaHREdkxHdnZ6Nm9oYkxmTjlONzBuUDBwcDlKaTNOaXZwOUdIZVBnS0hn?=
 =?utf-8?B?V05Id2ZlbHowbW9mbHhlODdvTkkwYVJhSTFqNjRNWkNlZzJiZWt0RkptcW83?=
 =?utf-8?B?M1RQS2ZwbFk1aWgyUDdhRWFrdFhTVW5Vdm1va3I5UXJmR3c1NFJQK0g2Nmdp?=
 =?utf-8?B?VlE1bFNzMUg2b2tJQ3p2bEhWRGxudDVNRHdXb0R0ZlF5a044aEg1R0Q0NnR2?=
 =?utf-8?B?WWxjR3dlQlhIdm0rc1NMQmwycENvVVdnZ1Q5dnJaV29heGxqRjl5bmRYU3gz?=
 =?utf-8?B?YmlGSXFXTFNTTStFdDhtK055b0E2N3JxQ25jRExxWll0RWxEeEh6OUN1Wlov?=
 =?utf-8?B?akJXWEIvbTVTT3FnNlFza1AvR0hpTXZyZHZDRjJlMi9SOWhvRVhUa3Q5UFQr?=
 =?utf-8?B?MkZEZ0UraUNnK2ZEQVBZVGY3cDd5RXR1RFgraksyR1k5MU9qQ0UwL0lsUmtu?=
 =?utf-8?B?SVh3emhrTFcxQWswMnNzOFZsWkhUckN0ZW5jMFJRbnA1T291eFNtNjBReEFv?=
 =?utf-8?Q?s9yo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2dPNEtCR3VvMHhOa0JSL0pKN2xuWGEyUnFZZ29DT28vTU9zbjlsbnN4WWJT?=
 =?utf-8?B?Qk9WdmN1QmtuTGlRUkxibGF2K1VEdFhpRnJVZW1hZUlpdTVpZVZDdmZOUGRZ?=
 =?utf-8?B?MFJUWmV2OFlDMjVhMHZCVmVGdUVoT3JyY0d0aE1pRnRaSDR0UEhrWmZHOTRt?=
 =?utf-8?B?eHlLQWxQYW85bXBBdnAzRml3aUxzenhxUXA5K0I4bzJJbVVPS1NYMWhodGRB?=
 =?utf-8?B?WVZoSHozaHNKK3lUbjZBVEwvUXF6Z085TTlvQlYyTVJpMHpVeWNEeUNEREdE?=
 =?utf-8?B?OFRZZEt4QU5ZZUpvdkNLMmFzNllYQVgwVWJUNFI4dTdPS1RHVXNKdHpxRmlk?=
 =?utf-8?B?N0I0R1pnWnIrQVBMWk5raW5hZGZTL2Q0QjV4bnFOYlFVdVdrQnE2b3podDZy?=
 =?utf-8?B?TnBpSmt4b0g5NWlJOUxycFRQbXlRSXpKRkN1akYvTmZ2YU1qTGRXYlhWS0Vy?=
 =?utf-8?B?VDBzUlZMWWJ6MTZuMHdXT2JiVkp6dC84UkRIUkhhVTQ3Z3ZVT2Y4TWFNZmh6?=
 =?utf-8?B?bU5XVFhwT2M2TFR2czltQmpMUjEySTRXcStwNWdUeVc4TXQxY09tUEd3T2Rv?=
 =?utf-8?B?MTVlRXBjOXB5cExrc1YrUGE0S1dBaDF3Z2I1YjNqbkI2bFpHTWxQdXV6TllV?=
 =?utf-8?B?cGVhTFdCUFY0ck9ybjAwb1lWak4reHNEZ1RsWGFTNHFLSFhkbFRVYkRkcG42?=
 =?utf-8?B?cHJlQUVTK0NmQ1l4bWR6eDhJUVRrejNjYTVHYzc1cXRHY0hkOE9JZUhWWVFn?=
 =?utf-8?B?M2gwenFEOURGZktWMFdnb2tMRDlueEx3TzRwUjNJbHUrd0RhZjJmb0ZFbDN5?=
 =?utf-8?B?MFdpTDZRQW05aFprOGdjRlI4UnFFaFMyb1dQS0haMzBqNTdCbFozU05DelpI?=
 =?utf-8?B?dEFoMWtYY2o2cVUwWnIwNklGOFBrR1h4RWErL3lvYm03TVZoUm15MEJQdkdw?=
 =?utf-8?B?TGIxUGNnZ21SSVhUVlJ3KzVhQVRPU2paeDVWM0ZOZE1oTFFvNlVtSWwyOEgz?=
 =?utf-8?B?RC9ZVVgwUWptMi9ZYzFiK3ROVWVWY3dxUmc1QmRpcEFreUl3RjVOdnppZVpP?=
 =?utf-8?B?MXlBNkRTN3ZmSGVpay83YUVOUFhuTUZUdU1DZzdGbEQwTGd6SE5JVnBZUWhR?=
 =?utf-8?B?c3IzYWFpTWJsbVEyQWhNV1R4M0QvbW9IR0NvNnFBS3BxMjB5aUV6d1VOTnMw?=
 =?utf-8?B?bWFMTkhlTk96ZDhYNFRjSW1rR21vZUZTWC9lQTBKb3dOOC9ORjlPYTFxNzEz?=
 =?utf-8?B?VTZablZKL0t0VFRMckNpcW9haS92SXh0UTdld3l1V1NnTFRYS3Bpdm0rU0wx?=
 =?utf-8?B?Ykg2TGg2WDNVQlF2SE5rOFhUclRseHhoRTdhYnRsMHMrWk9nS2h1VlIwQ21U?=
 =?utf-8?B?ZC93Um9WTnl6T1BYOEM1UjA0My82bHJWaXJEN29TU3F0ZVBXK2F1ZFE4aG9G?=
 =?utf-8?B?T3poVnNlcnBDSW9RZms4UVRES2lxUHdTSlc2TEJkMHEyUy9PN1RsOVQwcGhB?=
 =?utf-8?B?ajhSNW9mSWhlZlVtOERHMk5RKzU0dmw2eC9DUlFxYWo0QmU1cWY3VXVrbUdH?=
 =?utf-8?B?QjloQjBWUlNtRTVaNCtxWisrZDRzdnVYc3lvTjI5UDBLUXVRVGgreUlENGxC?=
 =?utf-8?B?QXNPRnFSbGlOcTNpWnd0bVN4QnExL0V6VGtnTW1HL3JHY0VQMldCRjlBOXZ2?=
 =?utf-8?B?cHgydk43UlllUVJpMEdJYU1GNjQ2NWV5ZHhhM3NRL1lpT0NrN3JyQVZ2WUhI?=
 =?utf-8?B?eUZxY1F1alBpYnFkV2lUSlU1d3lYYndLWEdtWlFNUGtXT0dRcmRjUWQ3Skph?=
 =?utf-8?B?eXZXVmVpZ1J6c3hsTGlRTU1QekdSbEQxSWRpOHhERnY4NnhnaUloY1NVamlW?=
 =?utf-8?B?WUhVRUtQc3RGWE8rQUJSMHNFVGFMNVNoM3ZBK2N0eXZ4RGdxVWczUi9abGpv?=
 =?utf-8?B?dnYybW5jdnJhSzlOMkdTcCtrQjFOKzdINHF5eUt4TmtURVJkb2FxUTZKMHRX?=
 =?utf-8?B?bWh2bXA3WEpFWVR6cmF5Skx2eGNXZXg5ODdnZmtxSTJFc2c1NGNCU2c4RzEr?=
 =?utf-8?B?bjNEZEkyWEdVaTMyQVVNYk1wYkJ1d2lHd3lqOWE5Y3dhTTlSTUVzNytSM1A2?=
 =?utf-8?B?MXRyeUpNSEMzOWU2M0ZUWVRuQ2N0Y1NjOGRaMHZSa2l4U3FPNUxCN3A3cGlN?=
 =?utf-8?B?ZDBOZFpZbGpWMTdHQ0d4RXgzZGJnT2hJSEkzcnBnUVJvZ3Y3L1UrTmdkNlRn?=
 =?utf-8?B?OTYzUC8vYjIxa0FPTUxvUE8wNG1RZ1dlQUtaTi95TmZIVUJVdXpBQXFuaVlw?=
 =?utf-8?B?VndqLzR2ZjJLNnFiQWZ0V3pVMW1rU05IT0hSZUR1SWQ2N3hRVm1FZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2d79c9-0f5a-4400-861d-08de5e5d2267
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:05:23.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 153ALN6uSgsvk03gWLweub8CWXXFa5sXvFXRyS3uKeG4UNKMWhHmjAEisoSaWb0MQFXCPqTkaZwbqQaIyr1YcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:roger.pau@citrix.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6551C9FEC3
X-Rspamd-Action: no action

The dom0 balloon target set by the toolstack is the value returned by
XENMEM_current_reservation.  Do the same in the kernel balloon driver and
set the current allocation to the value returned by
XENMEM_current_reservation.  On my test system this causes the kernel
balloon driver target to exactly match the value set by the toolstack in
xenstore.

Note this approach can be used by both PV and PVH dom0s, as the toolstack
always uses XENMEM_current_reservation to set the initial target regardless
of the dom0 type.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/xen/balloon.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 8c44a25a7d2b..9b6531eb28b6 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -724,7 +724,8 @@ static int __init balloon_add_regions(void)
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
-	unsigned long current_pages;
+	long current_pages = 0;
+	domid_t domid = DOMID_SELF;
 	int rc;
 
 	if (!xen_domain())
@@ -732,15 +733,21 @@ static int __init balloon_init(void)
 
 	pr_info("Initialising balloon driver\n");
 
-	if (xen_pv_domain()) {
-		if (xen_released_pages >= xen_start_info->nr_pages)
-			goto underflow;
-		current_pages = min(xen_start_info->nr_pages -
-		                    xen_released_pages, max_pfn);
-	} else {
-		if (xen_unpopulated_pages >= get_num_physpages())
-			goto underflow;
-		current_pages = get_num_physpages() - xen_unpopulated_pages;
+	if (xen_initial_domain())
+		current_pages = HYPERVISOR_memory_op(XENMEM_current_reservation,
+		                                     &domid);
+	if (current_pages <= 0) {
+		if (xen_pv_domain()) {
+			if (xen_released_pages >= xen_start_info->nr_pages)
+				goto underflow;
+			current_pages = min(xen_start_info->nr_pages -
+			                    xen_released_pages, max_pfn);
+		} else {
+			if (xen_unpopulated_pages >= get_num_physpages())
+				goto underflow;
+			current_pages = get_num_physpages() -
+			                xen_unpopulated_pages;
+		}
 	}
 
 	balloon_stats.current_pages = current_pages;
-- 
2.51.0


