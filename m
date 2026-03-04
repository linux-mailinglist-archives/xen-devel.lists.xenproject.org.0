Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YETUBLtrqGn9uQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 18:28:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB1205229
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 18:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245845.1545211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxq0z-0004NF-MU; Wed, 04 Mar 2026 17:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245845.1545211; Wed, 04 Mar 2026 17:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxq0z-0004Kp-Ib; Wed, 04 Mar 2026 17:28:05 +0000
Received: by outflank-mailman (input) for mailman id 1245845;
 Wed, 04 Mar 2026 17:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYFb=BE=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vxq0y-0004Kj-AB
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 17:28:04 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f0305cd-17ef-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 18:28:03 +0100 (CET)
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by BLAPR03MB5556.namprd03.prod.outlook.com (2603:10b6:208:297::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:27:58 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:27:58 +0000
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
X-Inumbo-ID: 7f0305cd-17ef-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqGkz8Tlx3yj8xQe6jMXVqHorv8q2/Lyw+Qd/wbxTFeOdusQHWGFu2tBzVIw6h6ki7B7t36CrNBze3lGwRMYjRtZw9489ntT1OuLfXnXxoD9uapniGkTRK/7xvNsOJBlIYb4VwAwLaDizXnBmaZ6L10gYRgg89DzPXBZx3vNBUahcuopjRJhjfbZJfISyImzSLE7Ao61oCrSMPzBaj+WjjVV5f1uCPoo8elFwHzTavqW77HUyvUEa7nOCLLJY6kVAwySLR4jg0rbzjpTCWgreq2G6FnleGRlxK4xYoBnbgnsmjyjQPAssO2jfczlK3TriedIWOAGuRU72SVjbQbpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTW0OIApes7ucx+QNWFjxhTP/zA1bUY3ihHkrnMnzs8=;
 b=JJN4qkhPgojYIgn+lFHrCAz3VmCsaPkCRhW/42IgoPCN/S/C2x46WmFqunju05T7Xy3ORfmmovnpvE512EjbjUHhRej+qzyNoNY1fwq7KR7QfcnnfM06EDYgR8s6U01FRfvw8dDJnJntg/gzjkkB2gF2FPbe0gzDR2Dw/exbjy91/jBECW/X40p9Eb6GY5TCTuluZpkBCLgwrklXblQ6rlqUyAUWPRH2T4ACU6Oak3GO3dvfJ8G1E8T2Q7Q012xEgOs0xZjkFXtbwzX6jaTQIC7skAYkUph9eqkXf78cIuG6++pWAvhrnAewZqDqpL90dTBZ69gSppDqd5Lxk9Z8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTW0OIApes7ucx+QNWFjxhTP/zA1bUY3ihHkrnMnzs8=;
 b=NOVg0tu4yXqX/1VkAvv52Rkh3I3j0a2pmfcgkkXE9jfK4wJdPPjySQYZL6nYYE3QCmVJENOB9Zy1OXtY7wtPaVaaH2XrJGqlWHJwuEro+/xs7nxzcCsFCotQ6n9li4Y+yLu426Uf7UNUDxFusT+PKsV5NpW+J0xW1Q9IHwFNvsI=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 0/10] xen: Add NUMA-aware memory claims for domains
Thread-Topic: [PATCH v4 0/10] xen: Add NUMA-aware memory claims for domains
Thread-Index: AQHcq/EQ7U0dGER6F0e0O8+l9l+UF7Wen7Sg
Date: Wed, 4 Mar 2026 17:27:57 +0000
Message-ID:
 <LV3PR03MB770736F52A297314CB0E0B36877CA@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b1e6f37e-9d77-4aef-b088-73bba27382b9@suse.com>
In-Reply-To: <b1e6f37e-9d77-4aef-b088-73bba27382b9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|BLAPR03MB5556:EE_
x-ms-office365-filtering-correlation-id: 8d1fe9c3-8b44-4898-4000-08de7a1360c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 DMcfUBvB7RKPIzg/pfZYC9YbI1yvGxgglnmUMzYJOJ/uMmyx/pxaaRmOg16LR8kMFhZ9xZf7p2hP8kKCiLv9wkbE3r8f3HH5PtcdSZ9X535swVD08O0M7M97yOsMvkbjz/pP6FhWUrPJXd90CNCK1Ki0EpXXs4tR8Y8ekUU2Yg/yuaKC91pbeMUQ8jqxgIuVh+J8oBn0TV9xfb0rYvxKFTQgyP7uY5ZNBFDFGVOEb8fZMbYdTLgfqDiiXWW1MOst6ZJvt2I4z/7x/Dp5p6HykWW06qlzPML6FbCezkr0Cdi9xMmZzFT5OlFwVNEWneK9GtODwC4x34WgavJXpfijn04V7dRzWlP+Q99ZUTO6TK0CmhIjHNqOql3/xRdu/iZRe+/ResjlzHB9xYkLKx96PHqOWf20wQ9Woy71InV8oQVbux29gqzyGgaM65LJzoWanIbnyKXoAf3fzEXlCh7wEuptx0cHohxpvY1UQqTALCgEW1pBO3P+iA/qFGZJZGCDJ6XjvwNCyFIi8wPXaL/Seu/1xkLNsVKS1UhSE6m0zPIfUT+Jv6UiorctWQQJMQ7HCkxGfgdwufCxEfOomyeAnAcHdSDs36j62RW8c6wSy4A8q6RzqaCaMuLieFjMIXF7RqPZ6DOci8tRSGRX+A+5W1tTgKhqJZNz1nKYgkSA2oKcUfmq6kHOE3DFsCx8xVxAgcxhIlfdCvlHLTrgWYmEyKPeL1Xbx8bsZyO51oYZIEZVtiTD7FEMObcxbH8tMtjG48stszLpq8SED6NlyuM37R+6LoIe1R8Uh+vP6tXGPPs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qi9iSmR6MWo2WHZCU1FYd0NPbk5HZTVyS0JCdVJ2amtTZXZ5MlZaU2QveGNZ?=
 =?utf-8?B?RXNNVHZacGtodmduUkg3Q2ZGakkvS2phSXJDSlJDV3hOVTVITjU3eHJOKyth?=
 =?utf-8?B?UzFzMkFOckRKL0F2K214QUROWUFQcnVaNmw5Z1dOL0RBNHA5cHZ2VEZqaG5o?=
 =?utf-8?B?LzA3L2xIVFNlUXJIWlNCSnNtdFFYdTlrTXpZNmVUaWR0SktFNitncUFZZE1p?=
 =?utf-8?B?bjh2MC83Z2daQUlla09qMnVld2tkdms3c3I5YVRzV0V4OWJod2hwUWg2cGxh?=
 =?utf-8?B?U1NlMmd5bjQrWXR0ekhIRnNNN29tQUFNWmR0Ty9STkFGSUxJdC94djliRDV4?=
 =?utf-8?B?QTc3UVpnVlJEU2lLRHhucmdqYnVhNFUrRVJQTzk3N1luMHR2SVk0cmc0NFhY?=
 =?utf-8?B?K2NQUFVHaFJkbVcxajlsVFB6MmdMaFk5M3dsdWplK0RrWTJ6NlF0MzdwN3Bv?=
 =?utf-8?B?MHU5a2FkUGhMQnFVbzd3OU5LQUZYTGlsUEhpc2F4dDNUMHNydlYrVm1aVlk5?=
 =?utf-8?B?SWlyeitkckZyTmJzc0dEc2JRUVJsUkIvWVlKY1JkTEZZVVdnWUhkbFR1WVJw?=
 =?utf-8?B?LzRyN0V5eUJ0dTkrU2I1dmtRbVFrVjU2d3YzbEEzdnVIZ2Y4dy9RaU9wNUUx?=
 =?utf-8?B?d0pjbUw5Z0pDOHlJWUNGZjVpSlFhT3hwcnV4VmlaZ2Q0d1pDRFZNMWtMWUgv?=
 =?utf-8?B?dEdaNWE0MEUzdTYxTDBiMXN0eTl1b096ZjRURmZFYVJhYnFYUnpOaWJZMHY5?=
 =?utf-8?B?NWUxVUNjTWNWRmFYaG1NTWh4VmFTeEJGdGgyNHdKZS9CMkRGUkxVd2NmMEtR?=
 =?utf-8?B?QzRDRVB3SFFPaUdILzNJVjh5NCtMM3hKUEEwMDIrRGVQT21DMFJHZm1XR3px?=
 =?utf-8?B?cDA3dTlPaEkxNzYvaXV4N2hCSXREaWx4YkgxZERRZSt0L0NUaHJiUWlOUUVJ?=
 =?utf-8?B?ZjdCbGh5RFFsQkNPWlhCeGN4bEUrci8yelh4RlM3Ny9tcTBhSndCNVgvQUxm?=
 =?utf-8?B?NEE1WkpFRHE4RXZnNTNjU1RUYkhGWU5zOXVzWm5iU28wVCsvRU1CYkQxSXVS?=
 =?utf-8?B?RDFiVEJ1dnhtbk52RERjNk5DMHoxQTlCVmZMYTAxOTZLamZYRVFrRDdIN2Ez?=
 =?utf-8?B?cHk5ZFBMdHd5SFJvUUduQ0JMb2lTdExYZ2c2QnYydVluenRTOHRzQXdxRjE0?=
 =?utf-8?B?SnFjSERPWWJNdXgzMTJhNEVYQWJxcWkrcmtwdk82NnNNbFVwOWdxYVhpL3Vv?=
 =?utf-8?B?aXE5blpyZEd1UTdWM25idnFFeUpsSjZoMVNYYkJhQ1ZzeXYyN1U2WUFYeXlJ?=
 =?utf-8?B?YVJKQm9KY2tJU0FNVGs2V0c5bnF1TUkxeGNCeER1TmQ5blZkYm5qUTdha3Nx?=
 =?utf-8?B?NUxuU0t2WEszbGtZMUxBUVlnNjUwL3VXV2hHK21kaUJuaGV5L1dIWFl4czM2?=
 =?utf-8?B?TzFWYjA2d0Vvd3NiNTFwOHV6WllpczNJa0dnQXJ1ZWRqS0hhd2R6VHUwTzVi?=
 =?utf-8?B?cUhvdHFBWHhaVHlJaUhpdy9IYTF2enlDL2JaUjdZQXlvRFVkOG5rRVRZRTRu?=
 =?utf-8?B?TlJMWHpzRmVJZ25MNDBXNkJOYytFTDFsQjdYVGJIS1Y4azYwRGFjeTZxUnpN?=
 =?utf-8?B?U1FwY0MwYUhBbjc4V2dVVGo5TUhwbFdaU09oUVFNdEFWRWVSdDkvSVcvTXZ5?=
 =?utf-8?B?NnVzSnAxaTBnalN1NkpYWHVSNy92SjhaWlJHcXVXTkVia2RUZkFKa3crU2VQ?=
 =?utf-8?B?VjRielptZENtS1Y2cDE1R000ZDFrOGg1aVc0Y2t2QUJ1bTBIaXpOSXl0WlpL?=
 =?utf-8?B?RWNmNnFkQ1E2djRJeG1oUlBRazh3bTU2T0o4RTF6c2tWWERIQWRKeTVLYW15?=
 =?utf-8?B?cHA1RkRkQTQ5QklWTWVVK2VmSmdzSWJOTlhQQlFuVE9RZUZSVjNJcDV0bzdF?=
 =?utf-8?B?Y1Jlb05jTzRSZ3pZeSs5UmZ4S0tnY2JnQ2NudnBDckd4NmZKSmtrMEdNeGFq?=
 =?utf-8?B?RHY4RkIyaE40enJySndWUjdXaXZac0xFa2VPSEhJV2pQOFUveG1ZdDFYSURB?=
 =?utf-8?B?SldGQS9zYm9QcGpEcmwraWI0aStJbEpGRkQya0lzMXV2dzNxUG11RTQyRUw2?=
 =?utf-8?B?bXM1K3hWWVFyb09mMGQxZWdzYjFiQmFQNjdoZGtDUk44RTR1SXYxREdWdHJP?=
 =?utf-8?B?MXJHTzFHWnYyb0c0Q200RFpRajNnWDRGRGM1VGsyVEdzUXdGTVlhcUxOaGY1?=
 =?utf-8?B?WWVMUGFaTHZjVi9YU2NaYXBFanJ5NG9nMGJ6Y2NrNTcxd2llOWRwb0ZlTUtJ?=
 =?utf-8?B?ZklkZ0VSSGkvT25LZ2d0ZEorWU4zTmRlbDZxMHBheDZhVTJDZGVGdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1fe9c3-8b44-4898-4000-08de7a1360c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 17:27:57.9096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWjZ+qLNuWCY0Yp10DdEmhH0pbiGpCD0MFeJezVgZm6QpuyjrwtPilwshLvdgJvgc4ZAtPGxb6eim8bxFABZLLdwCfK+S382HTDU6MWpRw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5556
X-Rspamd-Queue-Id: 79CB1205229
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

SmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gLSBBbGVqYW5kcm8gVmFsbGVqbyBkZXZlbG9wZWQgdGhl
IGluaXRpYWwgdmVyc2lvbg0KPiA+IC0gUm9nZXIgUGF1IE1vbm7DqSB1cGRhdGVkIHRoZSBpbXBs
ZW1lbnRhdGlvbiBhbmQgdXBzdHJlYW1lZCBrZXkgaW1wcm92ZW1lbnRzDQo+ID4gLSBNYXJjdXMg
R3JhbmFkbyBjb250cmlidXRlZCBhbmFseXNpcyBhbmQgc3VnZ2VzdGlvbnMgZHVyaW5nIGRldmVs
b3BtZW50DQo+IA0KPiBEZXNwaXRlIGFueSBvZiB0aGlzLCAuLi4NClsuLi5dIA0KPiAuLi4gb25s
eSBhIHNpbmdsZSBwYXRjaCBoYXMgYW4gUy1vLWIgb3RoZXIgdGhhbiB5b3Vycy4gSXMgdGhpcyBh
IGNvcnJlY3QNCj4gcmVwcmVzZW50YXRpb24gb2YgYXV0aG9yc2hpcD8NCg0KUGF0Y2ggMyBzaG91
bGQgaGF2ZSBTLW8tYnMgYnkgUm9nZXIgYW5kIEFsZWphbmRybyBpbiB0aGUgY29tbWl0LCBJIHdp
bGwgZml4IGl0Lg0KDQpUaGFua3MgZm9yIHRoZSBjYXRjaCwNCkJlcm5oYXJkDQoNClBTOiBEZXRh
aWxzIG9mIHRoZSBwYXRjaGVzOg0KDQpJJ2xsIGFsc28gYWRkIFJlcXVlc3RlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSB0byB0aGUgaHlwZXJjYWxsIGhlIHJlcXVlc3RlZCB0bw0KaW1wbGVtZW50IGZv
ciB0aGlzIHNlcmllcy4NCg0KSGVyZSBpcyB0aGUgYnJlYWtkb3duIG9mIGNvbnRyaWJ1dGlvbnM6
DQoNCjEuIHhlbi9wYWdlX2FsbG9jOiBFeHRyYWN0IGNvZGUgZm9yIGNvbnN1bWluZyBjbGFpbXMg
aW50byBpbmxpbmUgZnVuY3Rpb24NCg0KICAgLSBCeSBtZSBhcyBwcmVwYXJhdGlvbiB0byBhdm9p
ZCBkdXBsaWNhdGVkIGNvZGUuDQoNCjIuIHhlbi9wYWdlX2FsbG9jOiBPcHRpbWl6ZSBnZXR0aW5n
IHBlci1OVU1BLW5vZGUgZnJlZSBwYWdlIGNvdW50cw0KDQogICAtIEhhcyBTLW8tYiBieSBBbGVq
YW5kcm8sDQogICAgIC0gRXh0cmFjdGVkIGludG8gYSBzZXBhcmF0ZSBwYXRjaCBmb3IgbW9yZSBm
b2N1c3NlZCByZXZpZXcNCiAgICAgLSBVc2Ugbm9kZV9hdmFpbF9wYWdlc1tub2RlXSBhbHNvIGZv
ciBhdmFpbF9ub2RlX2hlYXBfcGFnZXMobm9kZSkNCiAgICAgLSBVc2UgdW5zaWduZWQgKHRvIGJl
IGZhY3RvcmVkIGludG8gYSBzZXBhcmF0ZSBjb21taXQgcGVyIHlvdXIgcmV2aWV3KQ0KDQozLiB4
ZW4vcGFnZV9hbGxvYzogSW1wbGVtZW50IE5VTUEtbm9kZS1zcGVjaWZpYyBjbGFpbXMNCg0KICAg
LSBUaGFua3MgZm9yIHRoZSBjYXRjaCwgSSB3aWxsIHRoZSBmaXggU3VnZ2VzdGVkLWJ5IHRvIFMt
by1iJ3MuDQoNCjQuIHhlbi9wYWdlX2FsbG9jOiBDb25zb2xpZGF0ZSBwZXItbm9kZSBjb3VudGVy
cyBpbnRvIGF2YWlsW10gYXJyYXkNCg0KICAgLSBJJ2xsIHJlbW92ZSBpdCBmcm9tIHRoZSBzZXJp
ZXMsIHNraXAgaXRzIHJldmlldy4NCiAgICAgTm90IG5lZWRlZCwgYW5kIGl0IG1pc3NlZCBpbml0
aWFsaXppbmcgbm9kZXMgd2l0aG91dCBhbnkgbWVtb3J5Lg0KDQo1LiB4ZW4vZG9tYWluOiBBZGQg
RE9NQ1RMIGhhbmRsZXIgZm9yIGNsYWltaW5nIG1lbW9yeSB3aXRoIE5VTUEgYXdhcmVuZXNzDQo2
LiB4c20vZmxhc2s6IEFkZCBYRU5fRE9NQ1RMX2NsYWltX21lbW9yeSB0byBmbGFzaw0KNy4gdG9v
bHMvbGliL2N0cmwveGM6IEFkZCB4Y19kb21haW5fY2xhaW1fbWVtb3J5KCkgdG8gbGlieGVuY3Ry
bA0KOC4gdG9vbHMvb2NhbWwvbGlicy94YzogYWRkIE9DYW1sIGRvbWFpbl9jbGFpbV9tZW1vcnkg
YmluZGluZw0KOS4gdG9vbHMvdGVzdHM6IFVwZGF0ZSB0aGUgY2xhaW1zIHRlc3QgdG8gdGVzdCBj
bGFpbV9tZW1vcnkgaHlwZXJjYWxsDQoxMC4gZG9jcy9ndWVzdC1ndWlkZTogZG9jdW1lbnQgdGhl
IG1lbW9yeSBjbGFpbSBoeXBlcmNhbGxzDQoNCiAgIC0gVGhlc2UgYXJlIHRoZSBwYXRjaGVzIGZv
ciB0aGUgbmV3IGh5cGVyY2FsbCBpbnRlcmZhY2UgcmVxdWVzdGVkIGJ5IFJvZ2VyLA0KICAgICBJ
J2xsIGFkZCBhIFJlcXVlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSB0byB0aGUgQVBJIGludGVy
ZmFjZSBwYXRjaGVzLg0KICAgICBUaGV5IGFyZSBvZiBjb3Vyc2UgYmFzZWQgWGVuIGNvZGUsIGJ1
dCBub3Qgb24gcGF0Y2hlcyBvZiBzb21lYm9keSBlbHNlLg0KDQpCZXJuaGFyZA0K

