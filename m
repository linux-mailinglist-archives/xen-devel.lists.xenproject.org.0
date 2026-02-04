Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD2NEfx3g2mFmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:46:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFFEEA71C
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221022.1529412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vng1H-0001ET-Bs; Wed, 04 Feb 2026 16:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221022.1529412; Wed, 04 Feb 2026 16:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vng1H-0001Cx-8l; Wed, 04 Feb 2026 16:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1221022;
 Wed, 04 Feb 2026 16:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vng1F-0001Co-Sm
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:46:21 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 056cb3ab-01e9-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 17:46:16 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5748.namprd03.prod.outlook.com (2603:10b6:303:6d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 4 Feb
 2026 16:46:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 16:46:12 +0000
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
X-Inumbo-ID: 056cb3ab-01e9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQjgGHiPzm5Q+H4Ly2QaI1T+CM1wM7ClPiTLhCWiDUQKYzFaSsYMBABbSysB7/4Fc9g07ur9ws0R1Tb7p6IgWt0Zxl2hBpHJY7ubl0NMePF1zZ/Ag/3qr15vWPzLGeArnxa0g03ttRdMh0m3JMPaFksTGbAc3OizljCTpkTL2jx/HXQYbaUixmrjGCIM1FsncS3Zzh+OL9xQJ0s5DETt3EMN6xe5q3mTXLRKFhJ+oIQoLhjd/ooNZFqf2yqRPT+Aqsg3YrTRysXyvrYtr132VIkSTRc9wdvWbm2yHCyaTIeuVV09qwWPAs/kguKpvZmFQ/TeeCjig10tAG8QkYxufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saiNXBLVrcDqpgsnQ0dJQ3O4Zs1V6YrfH/Ozq6SSQdE=;
 b=B13F6NiD072XcioiUdlWAHx5meQKl++MYD4w3296HED5lbuejIQAXECdgyCls85s9u/pwG5fFT/wj9lPJbVF6UyQ8Ms7EOZ4HTIo+WhNMFzVAqw/1ZaxUrvAnUp64K72r0KQUVSk79+JCf3sVNYccoL4S3djvMEFcJSTm0LZq71ImvxD/KApAQfOISVcCwltU4K60K33dNUuCdeQT4a9Ps2yrxxCFtxzIno6dl8OYFA2FVR8uqiIjZiGA1nc4LjwoT5rW/Pn9KdV/R5tbax5FXkQZrcjDgC6U8J85jzDltTXSRCswvKBXJjKV1iMD96+yc4H1se9FiIDAsxeAz85hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saiNXBLVrcDqpgsnQ0dJQ3O4Zs1V6YrfH/Ozq6SSQdE=;
 b=EmMZVtsQKr87P5neBqqephc4gP6JwbPhfsrOC0iBznvJeDJ2L9oz7NSEGYf05vz3+Ny3fIizGeQEDW7anGw1CnFwjb/t8nzQSemoglpSEkrtEXzESmSdTzSm1lho6VahcB7k4v+GH4YmE6qAIA74YI9IHxasdeEJQC9eYJIWoC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 17:46:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYN30KD0jsJ2_H_z@Mac.lan>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com>
 <aYNdJ6sb4GPaSEyY@Mac.lan>
 <3f9b4337-3e0a-4693-b97f-46505bc1349a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f9b4337-3e0a-4693-b97f-46505bc1349a@suse.com>
X-ClientProxiedBy: MR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::24) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bd7987-9273-4502-9bb9-08de640ce7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDRDWFppY2MraHpNZ0tKdFdRL2kyYUNZWkQ2YkdCYktlK0hvVS9Qb0VYejNQ?=
 =?utf-8?B?MGFDTE5saDBWWHA3d0pHUUFPMXl3Qy9icGNQNTlQbUJoUjB0eDJQWU0vTEFN?=
 =?utf-8?B?ajhwb2htdFNwbFlGRmJWR3NqR09rOXQrbnNhMTlnM05ZeERsTGpaWmFrVGRT?=
 =?utf-8?B?NlJTeTYyak1ZQjl1S0NMWnNRZUorbDNsZVpKVFM5WEpIbVdGdWk5T1NKSHhI?=
 =?utf-8?B?RGZUai9zeUUwcHVEallaZGNCYUhSd0FUVVoyeERjMlpHWDlTcll2b3JZdVNp?=
 =?utf-8?B?Nmh4Z0ZxV1hWNEhRbXBlUDNlR2ZYQ3Jka2hEU0tRM3JMd1d0L0JJMFUvWXdE?=
 =?utf-8?B?QjE0TmNGbEs4SEFXQU81R1hVd0JoUkQxSmhYUjErOFR3OC9DRXBhU0diVWRm?=
 =?utf-8?B?bXRXTkZhUlZkQmtUVVJEQ1VFOWd0WkdmWDJMZktGaXFEL01TSmFNYzlKS0R6?=
 =?utf-8?B?UW80U25FWnBrRkV5ZVVSYTJ2dmc4STJtc3gwaEc2bWVsZVV6SUZST0wzZzk4?=
 =?utf-8?B?cDl5aTc2aW5YcmhCbDNONkNsU3lGTnJzK1pqbGpxVE44SisycytGK2pGTndV?=
 =?utf-8?B?SitHUE85bTFNNFQwUjBDazluaDFySFhxWkFVQnErSDVzTzBZUWJHSTB1U3NK?=
 =?utf-8?B?M2JERzU0REluaUhIUlh5Y21LLy9NS2JGR202dGhLWG1KZzYrLzQ0MHNUcStN?=
 =?utf-8?B?OGkxaXBIZmVxYjFSRGFRL1FCeHFVZnNtdGd1bzBGRlRsbFRqRmsxQjBIc2J3?=
 =?utf-8?B?YXBtbXRud0hmemFXUFJEenVZVWFiZ0RQREtUb1MzSWFwSHVUY0JnM1ZqL0dQ?=
 =?utf-8?B?US84OW1OWkVCYXZVV3dUV29JWG9XUC9La0NWTmtWaHBnU1JLYnV5U29PZHRt?=
 =?utf-8?B?Y3llTGxhVHd4NDRSMU9aR0h6czdqOVB3Z3RkUzFNZ0RoUHlHdkVEaVdGSElN?=
 =?utf-8?B?VHZMTmRHL0xTRGtJOFNaOGhrakVrZnJMNlFHcjlmd0lzL1J0d3hMKythcmM3?=
 =?utf-8?B?YlNpaUgzK09QU01DNzlXazRvTWFrdDhiVExJN2xQckliaVZ2MkhKclFxKzNC?=
 =?utf-8?B?M0l3THRkWkM1eURxclZHSHlJSHdKZFY2TnNmaDJBWnBmWEd1UGdxbDdNalJP?=
 =?utf-8?B?L21VaDRkbzltMUdFUGhRd3RzK0ZtOUlJdUVlYzQ3WXVKODk0M2VrRitpemw4?=
 =?utf-8?B?SENPdTROS0w4V1VhMjNJL2F4MmtYTE1Va0RxbkdHZFk1UmNKVFRlNUVUb3Za?=
 =?utf-8?B?Tnd1Y3N4RHpsN05ZRVRxaXljYitBczhxNUVKYUtOUHArdjBYT0ZlQzN6ZnEy?=
 =?utf-8?B?amtWbXB2ZnJncTFBcmw0cjdPZ25yWkJlWFc1Y2luZW5oSUFHUm5ONHFoTGZi?=
 =?utf-8?B?WVNOcCtiVkZFRTZtRS9vaHZSdElWTlJzeDdTRUlIekZFaFhDclBwWHRDMVJE?=
 =?utf-8?B?OHIvZXRIa2NSNnBsMldjcnFwa01pd0xKWGlIUytvUXZnanhPQ1MxaVlLV0s4?=
 =?utf-8?B?cW16eko3cUVWYVZ4RWdWVmlUaHN1cTlmYjhmOVFFL0xFRWowcVNPM2h0QU1P?=
 =?utf-8?B?N0RNQkdxSGh1R0FBUmdTK1ZONm1KcklpT1RnamFsK2srNVFWT1pOemhCL1Nq?=
 =?utf-8?B?MG42QTQ1aGd4SmRlbWVUNlJpWG1yZW83R0w0TjFTV2YrUy9pd2RHMWRpa3NG?=
 =?utf-8?B?cFcyYnB5ajh6aXA0L04wZjVmNS9rNVNVVFBDbitzSTRQK3c1RHlJY1MrVG9n?=
 =?utf-8?B?Z2pQQmVkMlZCWDdldWpvM3pBb3ZmMGdzeWpld0NQSkVldWJxRnUxazhveHJn?=
 =?utf-8?B?aDB4RU5tUlVKcjZNYkRkWlNUODB0L2s1SW0vb0hqSlNmUzdsbVBFZ2lUS25O?=
 =?utf-8?B?OW83UjhjMTBreGNDeHFIZld3SVhaYWZkaHQxMWpXUUdNY3ZUVytKUklxMnBq?=
 =?utf-8?B?MFkyRUVNNzluZzBENFk0YXNtSklsZjhMVXRMNVplenRCVjdIT0t6dGI3d0py?=
 =?utf-8?B?L08wMzVGdi9nZldUVnozR2FGNGlybzFNQ0FyWWtYZXFYWHl1N3E2MTFlMUhV?=
 =?utf-8?B?TDhPTGxQczRUQVVMODRvb241K0s5VnQwMGs1OUZNK1phZTFKSGVOamNXR3hu?=
 =?utf-8?Q?3v5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDc3b3BPRHRTREkrUkIwUTQ3TlJwVGwzNTZyTmIvdGMwZ1U2aE1rYlN5Lzk0?=
 =?utf-8?B?SVNrQ1JFdHBYbTBWQ09xVGVCTGR2Y3pzWVM3dE5peHBqQ2FLNi9OYWkraXpm?=
 =?utf-8?B?eUpLdlBsdlQ5NmJVcTRST01xR2dQcnNSZlpVWXQxeW9tTTY0Sk13RTNTMm5k?=
 =?utf-8?B?TzgvQ2FsajNvcjdkNDZrU0dwaUgvYzRsN2xwTWE1WDFaQ0NLcnlTVXUxQmVQ?=
 =?utf-8?B?cC9hcVF2WnlRL2g1M1hMMDNFT0VLQnVhajVLR3QrWHBRdGdFVnF5aFFsbVU5?=
 =?utf-8?B?RCtlbkhaeEhRaVVLaU9KS2Q5TjZleW8yQ0JpcVJNc1c5YUdxekZobFA2bk9S?=
 =?utf-8?B?ejRPczdBZ0J5REp4c3REV1hpYmE5bXpoS3FDdFBnSzYwSmJlNHZVWWVKLzdG?=
 =?utf-8?B?Mk1COC9EZXg4N2ZsdUR6QmM2SEt6SW0zUnhFZjZkRUJZYTE1V2M5YUMxQWhD?=
 =?utf-8?B?Zk1jU0REU3pnMHc5YWFZbzJVMzNyZ1Bycm1FWDBzQXh4WHBHanZYSk5GK05i?=
 =?utf-8?B?MHhSMkNFY1dxK1B4MlAxMU9QK2hOaXhRdHVTcTQ1VGdidUh1Q3dxSGV2dVB4?=
 =?utf-8?B?ZDJvZk03aUVheHkwSEhVczNucTZ4S2FIQVQ5cE0xbUtJN1k2anFLeVFOdjQy?=
 =?utf-8?B?azJsYi9RUUtXU2ZwMHpVcnI1RHgxRCt6emhsSEZYSXA1V2dXMmgxS2pSc2Zz?=
 =?utf-8?B?WXJub1NNWFRHTzdKa1g4bGpYRXBXTk9Ta1dZMlMzK2FBbmlKS3ZpdzBmTnZH?=
 =?utf-8?B?T0pVRE5ocHo1TmVpVFE5Wml4VGdPVDlSZFJjRjNDUHgxcU9zM0kwRGxKVFVt?=
 =?utf-8?B?SDJ2S08rTE01U1JjaEdPN2pEbUJrajh4M3ZQV2RJRm5SaHU1eHVnMm0vSHRp?=
 =?utf-8?B?OUpMQ1FiU3pvZUZ4WE5mUyt3MWNvZ24rdUorcXFVdnlTbzJKbXJQQW90SHpq?=
 =?utf-8?B?ckplWmN1c0R6U25GUzdydG5qZ1hpeitWdzl2dTF4V0VCT1VMQWdzYmJCVS9o?=
 =?utf-8?B?Mk92ZERWazNicE95Z2J2UDllNWg2SzFwK1dySHhMbTAxT3VGNXkzTzZJUVVh?=
 =?utf-8?B?V2NWRlhQZkZUSXAvaEJVUXM4YWY0R2dhTmd3Y3haRUZObzR1R1lXQ3BnVFNC?=
 =?utf-8?B?RXAyYjZPanVNczFoUTRFVjNkSU9CQk1adTZLWG9raUN0ZjR6Zm5yV3kwNU0v?=
 =?utf-8?B?VlpiTUhWMzhWcWFEUkNub3dTNlFCRXA1eFV4Zng3VCtIckJzd2tzVHgxRllp?=
 =?utf-8?B?RjV2V05RbC9UUWYrbkx5YlpQVHpaTnRIWm5rV0QvaUtrQUlURXRZc0g0WUlE?=
 =?utf-8?B?ZlBOS0pTMlpoREo1ajdVcFVpbjdmbmFrRzZJSGpWY0RoV2pYM1JTeGVrdnRT?=
 =?utf-8?B?Rk9FMFdUU2tZWmVBcjlWTHh5TVE5NWhLQXRWMm1HZ2doWVJ6NzZLYUpLTm1i?=
 =?utf-8?B?WTBXdjh4Q1h3UXBQWHVRZlNxQm9RcG15QWRGSGo3c2dNK2RLZDBnTE1FUVY3?=
 =?utf-8?B?aGx0cU1GdXNISitiODBuVDRFUk1OQXBuTWZCenJFYWRaVHJZZmlpSUYyMk4y?=
 =?utf-8?B?S2J6ZjVDeFRNMXV6TXhXNjBZM2RBd2xHVGlxVWd6eWhOM1d0eGRiTnNGcHAv?=
 =?utf-8?B?Tll5NGYybllrcnZtcUZOanN3dlJqaEpkWFg3TC9VckNBM3h4bUtsYUxXdWZz?=
 =?utf-8?B?d3dnK3Z6ajZqNTQ5KzcyREpWNWZ5cmRoOUVVNE9pUVUzZjVqUWVOTzB4YUVR?=
 =?utf-8?B?cXlNZ3JZZTc2RE4vbGlUZ2pUTTl6eGloVWlsbkphZXV0YTdVZk9XMXBqWFlN?=
 =?utf-8?B?YW5JRnh1eDFvVi9naWp5TEdxbjdzNlNIMHdPd3lVK2dhMm5aZks3dUNYeDdq?=
 =?utf-8?B?bzRaOEk1eUZqODhUcDhPeHVUeWptL0JUcU94R0hkc3BSbEwyaXZ0d1g1NVJi?=
 =?utf-8?B?djNiOVZmL3hDQ04weGRGeHg2MDRYN2I4cHNKREhtYlVxRkQyaVNoMVlYUWE4?=
 =?utf-8?B?OGExSTNOUEdlVHRoRkxjS1hsQzdPbUd2a1ZnMXdGaUNlalJsY3hTNTFxcmZD?=
 =?utf-8?B?K3I3Tksrd1dRWCtJYUt4Wk5heENDRkh5NE5wdjA5Mys4WFFSaThqZitaMkc0?=
 =?utf-8?B?S2FVZXVSdHpBWklzdEE1MWVhNVBQUXNveFNOdHgzTk9jVVFrek1RazgrVFU1?=
 =?utf-8?B?eDdvWllkeERoNW1LZHNGOUxKam1hUGVXcndQbTJVQ1UrRTU0N0crb2N5SHhs?=
 =?utf-8?B?cWRYTlZZaGh4NUxxZkFCM2JMb2JPQ1BKUUJFVTNtN25DcEg5Uk01aFpmQ1Zr?=
 =?utf-8?B?cUdQM3g1cGNRQytHZTQxemtNRDUzQ3VBalJuYTlRR3pDeTMrZGpuQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bd7987-9273-4502-9bb9-08de640ce7b5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:46:12.5267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDY0zG1v7KqKBRSgMIGb8jQPRLJXrY8u39DictuZrt6fZT1NjujnpItD0vzJQIwCR2UYJ9MISuxkG38qJufk8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5748
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9AFFEEA71C
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:08:21PM +0100, Jan Beulich wrote:
> On 04.02.2026 15:52, Roger Pau Monné wrote:
> > On Wed, Feb 04, 2026 at 03:06:52PM +0100, Jan Beulich wrote:
> >> On 04.02.2026 13:25, Roger Pau Monne wrote:
> >>> The limitation of shared_info being allocated below 4G to fit in the
> >>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> >>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
> >>>
> >>> Drop the restriction in arch_domain_create() and instead free and
> >>> re-allocate the page from memory below 4G if needed in switch_compat(),
> >>> when the guest is set to run in 32bit PV mode.
> >>>
> >>> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> >>
> >> The tag is here because there is the (largely theoretical?) possibility for
> >> a system to have no memory at all left below 4Gb, in which case creation of
> >> a PV64 or non-shadow HVM guest would needlessly fail?
> > 
> > It's kid of an issue we discovered when using strict domain NUMA node
> > placement.  At that point the toolstack would exhaust all memory on
> > node 0 and by doing that inadvertently consume all memory below 4G.
> 
> Right, and hence also my "memory: arrange to conserve on DMA reservation",
> where I'm still fighting with myself as to what to do with the comments you
> gave there.

Better fighting with yourself rather than fighting with me I guess ;).

That change would be controversial with what we currently do on
XenServer, because we don't (yet) special case the memory below 4G to
not account for it in the per node free amount of memory.

What would happen when you append the MEMF_no_dma flag as proposed in
your commit, but the caller is also passing MEMF_exact_node with
target node 0?  AFAICT the allocation would still refuse to use the
low 4G pool.

Also, your commit should also be expanded to avoid staking claims that
would drain the DMA pool, as then populate_physmap() won't be able to
allocate from there?  It would be weird for the toolstack to have
successfully made a claim, and then populate_physmap() returning
-ENOMEM because (part of) the claim has been made against the DMA
pool, which populate_physmap() would explicitly forbidden to allocate
from.

Thanks, Roger.

