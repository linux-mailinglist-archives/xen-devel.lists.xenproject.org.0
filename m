Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ4lNrfEeWl0zAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 09:11:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA479E12F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 09:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215229.1525444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl0dM-0007nF-I9; Wed, 28 Jan 2026 08:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215229.1525444; Wed, 28 Jan 2026 08:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl0dM-0007kx-EY; Wed, 28 Jan 2026 08:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1215229;
 Wed, 28 Jan 2026 08:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl0dK-0007kp-QM
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 08:10:39 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d34f0428-fc20-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 09:10:37 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6095.namprd03.prod.outlook.com (2603:10b6:5:396::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 08:10:33 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 08:10:33 +0000
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
X-Inumbo-ID: d34f0428-fc20-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWbUk1IRZVl8VMdmg5e1l8bMIRq1tJlMnYHabOT127b1qtkthcqSd9COpXlTFmuyXBpS1iPjJ7FDGdIam3TCkAJNnYb3C/C59HFXIZ1TK+idU8zGhBnY+PiPIz7WyQz7PKxh+ZneBBij+dtRI/XpQJVJxI6otOR8+cFWWapqXSFTAy1hNVFIdSoRJb9pXjRWDSh1SIsiZJ68jxgdNbcqdKSGo4OdSInC05pKYL7y76ZqCwPkMGkwvkOsJiZWyNqylz4PRGt09d6JDzG+j9yFc7CdqjPTLd+iZB5gClDTl+NyGYzm7I+Nv1igpxQmQbTRSYBct9ZCAe/OzlOecFaAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyGjkinb1hyYGCkuldyZbiBsPLybp4MPqlOF3Z9+SZo=;
 b=XpaG7CGTkL4ZUJqN3/Fp2NKqXLGI3pYdBfKDUiCli0TFa1WtqN7eQ02y1wc3qz/o67oaWS7KU2oe+rBINv0FbweeeruhRyppFXmfn2614OdbHK3Kbimg6z2OPhqfftGCX/e83Idiltk2ON/zO4dP35ISYD6aJt8GXz41OGpOSqKlhIrVqpsDzD/Gf0k5PEOxbDpmGCAuyx92h9X4q3tZGF+uNF9BTxVSNDQCBQnaDnBAA99q4jCrwOwgCHxZR/lo9AWBVMo5t89jHoY7Ypp1H5Sa5/z47a1ncQmvfP+vlvp+Ghp9aknGhpV5J0ZHiorEh1cSKH9MADJpR2LK97au6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyGjkinb1hyYGCkuldyZbiBsPLybp4MPqlOF3Z9+SZo=;
 b=MYSuDICrFs3kR7kyeB++zOeqqFKc0+HXFTjAw+thq3pAjcNeXgY/DPdyqbPFjODGT2g+kslDf2tJ+E7JBK80kwFMLP17/ObF47HEswVZBOCC4SvK1qUVDe9O3QYAt1RNfVGwoNFTG8qRjmRsr8QWnbRXPQSAiwsEmk/enRwOCqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 09:10:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
Message-ID: <aXnEdQxyevj-wMuv@Mac.lan>
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MR1P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: a005c640-fd09-4db5-bcc1-08de5e44b5b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTdEV0JtdzBycGhDdStkMERURnorcWl5R0h5Zng0U2RRU3FENVRFWDlRdEph?=
 =?utf-8?B?QnpGM3F6VEduZmtEUzFHS3ZOT2g4VmJOTVlzR2UvUXJtYitXL05HZEs4SS9t?=
 =?utf-8?B?cGtIdm5xVUkvd05KeWlPYURmVE56YnFrZWhNaFdtUVBZdldzQUhvWjY3U1Jp?=
 =?utf-8?B?Vjk0bjFjQ0JFQkF5SU40a1JLMWs2d2kyc0dyWEdjOFFoeCthRFhSdDlPMzA1?=
 =?utf-8?B?ekhxaWFaYkhlSC9Bd2Jqc2tjREQ5VWFEVUFhcHJmVFZjTFl5MldaeWhlYmF6?=
 =?utf-8?B?akF5QjM1d0FrbU80V2U4TnpYb0JIZmloLzJBVk5RdXk2d3pXWVFNVWdpYS8r?=
 =?utf-8?B?NG5ma3hmREE4amVHcHhJOHhYWVhCVUNtQVY5L0VyelFTQUN2VXBKSWRxWWFo?=
 =?utf-8?B?bkpaRVV4RHJiQlpqcUQ2YjlWSEEyYmhZVGlMVm8za0I2eWlyNGlQbnpqdjNS?=
 =?utf-8?B?bDBMRU96U2EyUzBacHJpU1hBWkRiV2JhL0RjdzA3UVFyNkNSeWN1RW9QM01M?=
 =?utf-8?B?ak1pK2tmMUlON3BjVkFMWnRnWWxXWjNiOHk2Y2t5VDh2SkpNZFRLY3huWXJo?=
 =?utf-8?B?bThOVXU3ZlpHTUorUEJCWnVGbHRQN1B3V0RPbkM1a0hNVjNDY1NDcVBYK2JH?=
 =?utf-8?B?YXViaDdwcmh6Y3NCdDREVElhUUxXWUgweGluR3liaGR6OXZoZk5kVlhqc1lI?=
 =?utf-8?B?dWwwZGM0d1VZZHQvY3lNVjc1dS9ZdUZ5UGVZdkwxcW5GTWszc1VOUFc2VzRa?=
 =?utf-8?B?RUhVdHpMVXdiRmVDNUlKSzdDNlNWZlhOandXcGVrYTAvZ3NhZEdpR1c4ZFNo?=
 =?utf-8?B?KzFsdWk5b29SbWpleFM2Zzc5bzRtWGRPSzZyMkEzaFJidCszaHpCdTVOcUtI?=
 =?utf-8?B?dFo5K2lUaEFvUlAwekJKRm9uQnhTbjdtTWNzalQyOGJVeE12SFlRRFNzWmdQ?=
 =?utf-8?B?RVg2eGFUU1VhalQxdzZMejRjUTR6Vk8vcWxmNHF1UlZNczNwa2svYjQvUW9J?=
 =?utf-8?B?RWRVNHBlaHU1ZXhuaEFsU1dvdU04TmlnZTlwbFJUMEErQ0RjMDVxOHpNcW5j?=
 =?utf-8?B?cDNNSThLNk5KdkV4bXUwb1RWdS8wSTk2TndVbjlaWC85T1JxQXdOWXBKSVcx?=
 =?utf-8?B?THpUVFI5VXgvM1ZWV0d2K0xTNDU5VDNxZzR2YXVSSGdXWjVVWEtDekVJL3hp?=
 =?utf-8?B?WG16alhUNVJmaUVkUnJEY09IQ1h5VmNVaVRrQXg1Qnh3emk1b0ErVFB3NTFx?=
 =?utf-8?B?MGR0djAwUmlFaDF2YXB2OVFRV29tTDVvUzgxRm9BcVh3Y2ZtbGUrR0xYMzls?=
 =?utf-8?B?bkJoQVpXekhRQ2xDaTNwSzgya0FsSVEvVmF5V2QvM1o3ZWxmQ0tyL1NMRGF6?=
 =?utf-8?B?RTFQdGxnTXdqY2lILzJXbWwwRGdCZHdCKyt3bG5Qa3puT3VCR0lKRTQ4SUM5?=
 =?utf-8?B?NzJNZXpuSFA5aEFHdVA1aG1UTEhIRzRMNkd6dk9KQzc3RUgvdCtKWTB5SzRQ?=
 =?utf-8?B?Nzg4K3RGenVMOFNRTkNibkFHbHhkZTlIUWk2SVVleGR0d1F2dUdSVDRjdE5w?=
 =?utf-8?B?RG1SQXVGNUREQ3dPU24zYmlqR0ZIbWppNWFsN1JVcytKSkRTOWl6QTBYMEM1?=
 =?utf-8?B?YkY3WXZOUTZ0K3VnQmQxZ2xFQnA1aHdsL1NWS1M0LytKMTFDQTJIU2ZLSjFP?=
 =?utf-8?B?MS8yZDR1alpsZXZrN3hKeWVhdlZXYUUvSStnTUhKanA2VnlMZEg4QjdJRHBp?=
 =?utf-8?B?T1YxOWdhVDlVRUV2NCtSYTVFRHF4MEpPU0hjNDcyK2Y1WUZvMEhEWERTSUZo?=
 =?utf-8?B?dUlpSmdhOUZIa3RaYW9uR2ozSHdCcnZGWXA3ZGwyMU1INUZlMFhOTUM4QSth?=
 =?utf-8?B?TEh2MHc5a1BUVGxzUE9MK1R4OUdUYjFuZkpEWU5yZXFzRzFyYk5BaUVkK0Q2?=
 =?utf-8?B?dGtTb2owY1dGcytLMEcza2pqQVlYOGZleU9nQUJFbWdkQzJoSVJ2WVNNTmIv?=
 =?utf-8?B?RExaWnlwK2xDTzVNSHFVT2ptbU95a3UycGpGZWVWNkxoK1NpR3VxVEVZR1Qv?=
 =?utf-8?Q?9hi6QO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWc1N05veCtpQmhmSUFUTEYvOTRiQ0grc3oyNUlyMTMwdVJnVXh5Z0Y2TEJ1?=
 =?utf-8?B?bHRhUGRMT2t4bWc5alFYei9PbDk0cmlucU5LZExDZmQ5KzdXMmtaSE1kSnV1?=
 =?utf-8?B?VGZmZUNBK0lPd3BBUWIyQnpNWkQ5WEhUYlBGYVdrWmFFTFdIZndHVkJQNnRh?=
 =?utf-8?B?aXMrQUVtZUJKRTlXZG56eG9QNFliYnVNdVVBbzlLMzlJdlZTNXNjZWk0dElW?=
 =?utf-8?B?VU52VlRNVGIwRGxlUTA1QjJSK3hESmkwWW1NZWxtQ2ZkTWI4eDgwRkM1SktG?=
 =?utf-8?B?RTFDaW1RZkhqMndjTmYzOVBlaHF6OHBkSTMwb1BwdjU4MWs4ZTFJNmg0YVNE?=
 =?utf-8?B?U1h5UkUwem0zYXZTdndIZTNVMVY2OTJsTzJCNjVoOExLdEM3ZDJWRjBzOUFI?=
 =?utf-8?B?c1dZZHpObEJNRTVaQW4yY1hjcUpNblVPaExQTFc5aVVOdXRmciswNGtHT21r?=
 =?utf-8?B?Lzdab0xSdlNTaXJaT0pvNUFMclBXSHBmTWthR0t2bEJWTVU5N3N2ZW5CRG9J?=
 =?utf-8?B?akZ5a2N2VHYvN09hbnB3OTZ2dzhsd3pQRzdjTU1ZSGljQ2tXME40a00zV2pp?=
 =?utf-8?B?bU51V2pXMDFHYkpaN3c2YlpITzdLYmJHYzNOdVdQblQwRjVFWmhqR0NnOFhC?=
 =?utf-8?B?ejkrenlrN0pXb0krUjBCdmV4UmoxWGhmMHJ5ODlTZkhlUXV2WG1lQ1BEZlB0?=
 =?utf-8?B?NjVxVDk4REp2cTE1T0xabWZoVmhHQ3FyRk80QTBWTGw2U0w1V0UyaVBHeTQ3?=
 =?utf-8?B?ZFhlM1laN0p5NjVkWnBFTjhzSnd5eTZjRm9JU2x4aEpqcml0TjRWTlJ0by94?=
 =?utf-8?B?OXhiMGlXYVdqeVN3Q21QakNxcTZyRkRHZEF5TXVWRjFTRGwyTlZrcWhGby8w?=
 =?utf-8?B?NVhqNXd1SUtDbUcwQTJVeEQ4RmpRRXRkQUZUaFppUnpERExVZTJoNktMOTJj?=
 =?utf-8?B?S3Nkc3BVSHVETVJRWG5TN2hqS0IxMEd1bStJMUJJY0pUb09WMG9HQWR3T001?=
 =?utf-8?B?Q3ZNenhGdHJ0cGh5YTNOOS9RSldkV21WOTAvdTVuUndITUhTYnRwMVdjdE9k?=
 =?utf-8?B?SXd2Y2p5c2xMOVlHR3c5V29nTXdVUmcxZzJTOEhGNEtxeFROZ0NpcjFqd3JJ?=
 =?utf-8?B?K1psL1BLTVhOZFBFZmJxQ1ZoUDE4WHBQRG5yMjFIOXVqbkh0MG5YM0RMQjdQ?=
 =?utf-8?B?YjhGTjVwMXNGb1JJL1czWWl6eWpFYmNZOG1XOWUxVFRldHBzdk5BNFdSdnBL?=
 =?utf-8?B?VEtUUC9wWTNtYjZ4ckkyOHV1cTdJUzRYS2tRdDFkTSszdVh6M28yOTgremdD?=
 =?utf-8?B?T2lwak80ZkNYTlpkV2VJNmlnN1NmWFkybW9KWEFQeDQxb0dneU9nWlFUd1RO?=
 =?utf-8?B?SnlEekhBVXN5eGkwcDFma0JocnV3cG5LNHB2UGZFZmZkSXRtenF4eWk2czll?=
 =?utf-8?B?RTdUUmxST0Q1cCtabUg3VWtyMTYwM0xqZHp2R3BSdmZSOTJ6KzgxMTk1Z1h5?=
 =?utf-8?B?Z0NSdm5lS0ZmUjhLRWNCZFRxK3YxM2EyakFaNzhTdHpoQmNXcG9OeTY1MCtw?=
 =?utf-8?B?M2k2QWlDcG5PbTB6TTdKdDNlcjNCQnprSmx1YXFwbmpBU0xpb2RTWVJmVG9v?=
 =?utf-8?B?R1lRREp1VkdUVUprcVlSOGVzNkdSSG13djVBZzNFZnZDMTljZEdaeStEb1RX?=
 =?utf-8?B?aTRrTXRVRUpuNklFalBWMHB3MzFLTUl2eENLR1FJUWxvL0MxTkZGQnEvYUVW?=
 =?utf-8?B?QVRpaCs0cjg4c0FJRGlhUUk2VHQ1ckV1aEVrZmxodXAxZ2k1RDk3RnI1ajRh?=
 =?utf-8?B?M1Z1dFJBVU5tNTRxalBPbDJrTnF5UC9JZW1HdlFBeW9qb0hrOFpnZXowYVEy?=
 =?utf-8?B?eFROUTZvWjFSRWFmTllnOXJQcXFNMlRyNXpXejFVKzFyQXN0NStlb05HeVl5?=
 =?utf-8?B?VlJIUElORVNIZTRBY2owUHVVOHBRM20wUVIwa0RGbVBzQURtMm5jRDBLd3o5?=
 =?utf-8?B?Rk5LSXQyaHU0dzl0ZU5QZWtQQlVXVC82SDllUTFQbDFPaFNzR0FSSmdVaklX?=
 =?utf-8?B?cWFUdHhyeHJVZHNXOGphQ2RicWxDU3hqWnlGSTZWaUZMYVpNV1N4N2xIMUVh?=
 =?utf-8?B?NnlXR2JwTnJSUkVpNVNvVTlnM0xLSG10T3JoMUZPTnVwVUs5QWRtMDlBVG93?=
 =?utf-8?B?c0h1VEZhNWtTTTdiaXBFcXlyZE84UzFiM3pmZkdQTjYzWU5mYnljYm85cEVD?=
 =?utf-8?B?VUVjSHdIUW5GOE4zdWgvc3RuU216RitXYUU4TXUrUXozQ1gxMHdnRWgrUzgr?=
 =?utf-8?B?VDJoRGpIaUdwYXUxREQzSWVpeEluL3JHaGdLeGNXTWVuK0pEYjhFdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a005c640-fd09-4db5-bcc1-08de5e44b5b3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:10:33.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvJKuwZjLUtLlQIjyX+7fi1PlJ3MsAIDoSCF1IZsbwCAdHBp04I8hNLbCf8hQ4aGGiCoJbQrEmqBSE2++XokoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6095
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
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EEA479E12F
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:24:01PM +0100, Alejandro Vallejo wrote:
> This patch modifies CODING_STYLE to severely discourage use of copyright
> notices when their presence is not legally mandatory.
> 
> Copyright notices are redundant on commit, misleading from the time the file
> receives contributions from anyone not represented by such notice, and actively
> harmful for attribution by the time the original code is long gone. They are
> plain wrong when added on code motion.... the list goes on.
> 
> All attribution worth keeping is version-controlled through Signed-off-by,
> Co-authored and the like, DCO and the cumulative contents of git history.
> License banners have already been superseded by the contents of licenses/ and
> SPDX tags.
> 
> Other FOSS projects have already moved away from explicit copyright notices
> where possible, and severely discourage their use when not.
> 
> Apache and LLVM take active issue with copyrighted contributions and Chromium
> takes issues with copyrighted contributions not attributed to the project. Some
> Linux subsystem maintainers already frown upon copyright notices too, even if
> it hasn't reached the point of being a mandated requirement yet.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> The actual changes are almost verbatim from the LLVM guideline, but it's not
> exact. Wording can be adjusted as needed. I care about the core of the proposal.
> Saying "please, drop the notice" on contributions where it's clearly not a
> legal requirement, or have the contributor state that it is a legal requirement
> and why. For fairness sake for all contributors to the project.
> 
> I'd prefer taking the Apache approach for new contributions, but I want
> some discussions to happen first.
> 
> Thoughts?
> 
> Relevant examples:
> 
>   - LLVM: They banned copyright notices, unless part of a vendored
>     components.
>     - Links:
>       - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyright-or-contributed-by-statements
>     - Relevant quote:
>         The LLVM project does not accept contributions that include
>         in-source copyright notices except where such notices are
>         part of a larger external project being added as a vendored
>         dependency.
> 
>   - Apache: They banned optional copyright notices and relegated
>             mandatory notices to a NOTICES file that also contains an
>             Apache copyright notice. See links.
>     - Links:
>        - https://www.apache.org/legal/src-headers.html
>        - https://infra.apache.org/licensing-howto.html#mod-notice
>     - Relevant quote:
>         If the source file is submitted with a copyright notice included
>         in it, the copyright owner (or owner's agent) must either:
>           * remove such notices, or
>           * move them to the NOTICE file associated with each applicable
>             project release, or
>           * provide written permission for the ASF to make such removal
>             or relocation of the notices.
> 
>   - btrfs: They are highly discouraged.
>     - Links:
>       - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.cz/
>       - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@gandalf.local.home/
>       - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
>       - https://lwn.net/Articles/912355/
>     - Relevant quote:
>       Let's say it's OK for substantial amount of code. What if somebody
>       moves existing code that he did not write to a new file and adds
>       a copyright notice? We got stuck there, both sides have different
>       answer. I see it at minimum as unfair to the original code authors
>       if not completely wrong because it could appear as "stealing"
>       ownership.
> 
> There's more cases of other projects taking similar stances.
> ---
>  CODING_STYLE | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index aae5a47ac2..97f80245ed 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -24,6 +24,24 @@ license, e.g.:
>  
>  See LICENSES/ for a list of licenses and SPDX tags currently used.
>  
> +Copyright notices
> +-----------------
> +
> +Copyright for the code in the Xen Project is held by the respective
> +contributors. Because you (or your company) retain ownership of the code you
> +contribute, you know it may only be used under the terms of the open source
> +license you contributed it under: the license for your contributions cannot be
> +changed in the future without your approval.

The usage of such direct language here, by using you to refer to the
reader / contributor, set a different tone from the rest of the
document.  Maybe something like:

"Copyright for the code in the Xen Project is held by the respective
contributors.  The author of the code is the owner of it as stated in
the DCO.  The project cannot retroactively change the copyright of
contributions, unless explicitly accepted by all authors of the
code."

> +The Xen Project does not accept contributions that include in-source copyright
> +notices except in the following cases:
> +  * where a committed file already contains it.

IMO we should also prevent expanding the existing list of copyright
owners in the headers, and hence don't accept expanding the copyright
notice of existing files in any way.  I don't think contributors to
Xen have been expanding those headers in a long time, but would be
good to have it written down.

> +  * where a committed file is renamed.
> +  * where such notices are on files from an external project being imported.

"where such notices are on files imported from an external project."

Seems easier to read to me, but I'm not a native speaker.

Thanks, Roger.

