Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBh1CVN4qGnpugAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 19:22:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C4206353
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 19:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245900.1545241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxqqy-0004Px-Ur; Wed, 04 Mar 2026 18:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245900.1545241; Wed, 04 Mar 2026 18:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxqqy-0004OW-Rm; Wed, 04 Mar 2026 18:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1245900;
 Wed, 04 Mar 2026 18:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYFb=BE=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vxqqy-0004O7-Ck
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 18:21:48 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009cef6a-17f7-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 19:21:47 +0100 (CET)
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by LV3PR03MB7611.namprd03.prod.outlook.com (2603:10b6:408:290::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:21:42 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:21:42 +0000
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
X-Inumbo-ID: 009cef6a-17f7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLOxQA3bUqKpeA0RY8nfFo1TqVEPEyR/LNFQR8qYKUHSIz1FnDSnETWcEqeNLrUgAvlX3qluQE/b6w37ya8c7j/UEezT6BIgu9U9LVHzC88kEddBu6hsyYzSuT+ubFNlkVKpE8j4tSP2oeX3N8ph7gT/pQPTZf17QOTTHz98eOvC9rsPvJ3xlTpEamCBgVDmckop6mERLzWeLsSDwkhksMhRQB330v9+aqOYzWkbgA2CvM0GVV5FmLheabWUCLkwl67PPu70XKqXk2nCe4gHg8IYdW1zQxvWJavdxuFPzVSpr7F4M0rQOZMFKed/WT00AXGYYoOH/Na82oAf9flm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT8S73pF0AdY20RHfdnN8wYSfqur/qUxBePSwcJeCFA=;
 b=Yx7oP7WNziXcjxkN7+1gu8n6iUtLmqjnNY5RJJVR9S0r1T6r/S+DF/jtezQggNhUfn3xKHO+efqa95qGj4tIXeAPf0T0x73zHppwgGuQkWRhdrly9zufkAkN3DIj6rcCOidq6qm3RTX0kRwMDDTKl95zMIFi2GNlw06zReJwKUtqTOahVIOzarA9rFuNlDO9ytpYmHoehnV3yeVp3s4u8Z4ud/SjsT9TdS2JVR24Yx90Ij326EOyjNbDcGDXBfOEztwf00nYrhr5cjr7V3ZywG3RxAksvoD+6qMU84IkQ0K4oYI2J58qXo1NX7JbrSzj1cr/R47d80MYp7V38DmXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT8S73pF0AdY20RHfdnN8wYSfqur/qUxBePSwcJeCFA=;
 b=ibQKt7Pg1pqtfMB7xayAa/EMXFL+A4MHjxyH0VvJz8pMkTDkOdmT6ozt74SGOSX4SxVKWmx5GEmHEVHvLTq7/0iGEYw7v9CQfsGs96WQBatWKux8rq8Jgy5RLrFS+s4eCKYEuhJMZO3itX3nm2A0lJBn7bD/emeWd898o5TLOMQ=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/10] xen/page_alloc: Optimize getting per-NUMA-node
 free page counts
Thread-Topic: [PATCH v4 02/10] xen/page_alloc: Optimize getting per-NUMA-node
 free page counts
Thread-Index: AQHcpy3M66O7r2QZuEav6YZwQwz7ULWemlMAgAAa8BA=
Date: Wed, 4 Mar 2026 18:21:42 +0000
Message-ID:
 <LV3PR03MB7707E83CF01464D69AF1E599877CA@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <c56658d1248660543fdba162810b0629c081bd94.1772098423.git.bernhard.kaindl@citrix.com>
 <5e4d4674-1e1a-4902-bcd0-a24fbd13dc8e@suse.com>
In-Reply-To: <5e4d4674-1e1a-4902-bcd0-a24fbd13dc8e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|LV3PR03MB7611:EE_
x-ms-office365-filtering-correlation-id: 21b1d24b-6ffd-4fb9-aaa1-08de7a1ae2c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 eoJN6BKC1GVZw7rZfMmYCYfOQ2L9Ccp1bkjRTqOkv8KgLS4SUsUpKn1KHPDPB3XOcpr9Mvtfu5ZZnj9TY2DnX1IuAcQXJ8R1QWgwGJgZZAvRBg4lsvFEj2SusDP3JpppKZzifu8eGu09BkBmmFxYXbWHh3szcInjim7VrRGB/TUp9aOvAqIT8+OShO3CUw12BsLhiLApzAF1u0OSqFdMgE8olvwiyBDZvabbe1G7bd1AtyGYAZsyXgTOKNS9r+7vH4v00P69gsbrlv5X8lwJap3Hm58ZgvBxV0HjCK+rIJ2jERg1nn9RijRKpTzBW9aAx+/EbUG3CqjyFK5TOfydlRH/m35D35UbaanVubSOY+UHmBDWQ5so9zsQqI9FvF9yGLeJRfQPySBIlEU/nmi/hX2xQsVvk0j192Pqd4gIGumO0vmpB+M/xSLRb6ECpO3llE1G7A5jjNrm4Taa4jq9QlRJkSEYSehiwGaNZKW2V5EMtIVLZisaP1ad0K/62++zjhWyFNbS8Ibt1JoqEVzgqbE2id/XzVHH41tqL9zvCNm69pIa5o3FIVUDaoesV3Mo/2gDzBbSrbLrFwwIgDZw+eKqjIgVMd26jrwK7QGdAIRK6CkOot1Hj20qlLGnUn2Uiz21mIvLXobhsxjX6kFN/7KWr4U90A5S93p4b1sf2wWpttn0A+TY7P2yZQ4tQmKE98W+TwfXKnC5CBm3TojvAoelRbBsBTAhHNUc6bqQBy0EKGx6dZvCvi1C33A/t8zLrsnB5CSKkE3xX/qFgyKLCdM6wJEu5ckkoPFgpm1vgTg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTl0RHF1MURtLzFOM3RqNTZyNE5PK0d3ajRTSFFBZFNJNjJDRWVaRFAyczg3?=
 =?utf-8?B?M1U2cVRFUE9EbG54cmZBNjFzS1k5dGh6dG0yWkFJODZHZDJsK0RlUWQxNW9w?=
 =?utf-8?B?YU5oa2J3WlcvWXU0dkNlQlY3aklXWHJqeWh0VHRwOW9SZzFDZzdsbFV6QW1T?=
 =?utf-8?B?UUhwNi9RMTQvRmMzOHQ3dTZFY1lnOU54dWJFTXdKNENTeElER1Y5SXp5L3g0?=
 =?utf-8?B?R2VTbWpuQWFPb0xXaTFEUHk2Y2dieXdNQWREVi9QcG1MYUpCQUxQYlZ4bjRr?=
 =?utf-8?B?cnFuRFdSdmdKU2NpY0IzZzh5cDVVMjdwR0pEMEd5THV3cXdPbkJCcEtZVmFx?=
 =?utf-8?B?Q1JqbTVPeU9DenFTeXpHSmRrZUxKNjJMNVU1ZDNkYlh0cXBHdkJ4SDV2dmNw?=
 =?utf-8?B?anpzNUpxc2xiQ2QxNWZCUGd3elRuSCtvUlQvaGdtRzFVQk1ZQTVxSnVWTWxQ?=
 =?utf-8?B?UXhOWm1FTGpJb3RUVDJoTnVHK1Z3dGlaMWZhazNIN2FDQ0xpb2NSNHdnTzBs?=
 =?utf-8?B?a2x5VHd2YVBuMzRqbWJKZHZiTGtSL3VRby8xd1VVVFhoSjdVc3dzdjdsTlp0?=
 =?utf-8?B?VUdMK0tmSEROTDBWTjczOVczdFNXM1dnbG1oVVR0eHE0ZzNtbXF1YVliYzRG?=
 =?utf-8?B?NEZBc3NESjZDSzIvWlFNUG5KQTRtZkxJUE5KdUN2SDdQTTc1ZnN0cUZnVlJU?=
 =?utf-8?B?RmpFck9STTZ1THY4Z0NRTUY4N3pVWTBJaURIcXozWE9RQjdTM050QkQ2WWZm?=
 =?utf-8?B?ZXpnc2ZDUjZPUHlSMG9SeG9kdVBXMWVtK09Ebk1Zd0dRRGdGWS9kTW5JR3VW?=
 =?utf-8?B?Rlp0aThmcG1yUmUrbHRZRm0yYkxRUytDTmhSaHQwc01BamJtb0Q5Y3c3UGpB?=
 =?utf-8?B?OTdnb2tzMis2dHBCeVgxMlYyQ1JnTXlJNzBwWktMZ0ZTaHpsMHMyRDdzaFBY?=
 =?utf-8?B?YjQreW1hOGdUS0FibVhhVm1xbVJzYXJOT0E4YkVFWGlOY3RhY2VPQlkyVUZy?=
 =?utf-8?B?WDR4V0d6U3ZMWkFmMkZqc2w5WHBWQkZDS0pNdmd0TmlGMzhuZ2ZXQXlGbWcv?=
 =?utf-8?B?bEtkYUFBcGFmdWVaaHVKS0hUdlN0aDdoYm9YQWNybXk0VVhQUDJDNVgwT1lI?=
 =?utf-8?B?K3U1ZUdTM3NTTkhBL0xmVUcvSjVVY2k3NnNHS3lhVVJybVJ1MDBjRzMybEVp?=
 =?utf-8?B?WnFRemZuOW0vMzVucHkyNXZvalVNaEh3SU9QZnlWY3lGNlUvdk5TSGVZbER6?=
 =?utf-8?B?Q2VXdmNUaE8rT0lIbGdiRTBZWlViM25TZG1LTjZnODBuZi80NVBlUGNRS1Zl?=
 =?utf-8?B?VjVQdWsxVWlaNk1BeXVVS3FuaVR3S2xOOForZ0FIYW5kS2Fwa2FlemJOUkJt?=
 =?utf-8?B?Q1B1dWs3aisxTmdFNFVzNTZkcUd6M0NVT1k4TVJvZVdtT3BWcXZVM2QybW5F?=
 =?utf-8?B?eDA1WmxxR3FSR2lkRStuN2JWdU9zOFFVVDdIdHhRRUtQdVk1ekpBd0VqZEht?=
 =?utf-8?B?TUZ1Z2Mxb0xFbmZUTi93cm9heU13UXVydWJVQWFkam11ck9xZVlQa2QwWUZN?=
 =?utf-8?B?MTVCTmxCY1BRSzMvOU8yR0NpZ2Q2c213NGhIcjFuSnBTY2llT0FldjlkTzhR?=
 =?utf-8?B?b0I0UC9rM2lRNHI0MzkrQzV5emFNWEdFWEtRMVZ3SjB6SUZiTjNWUmhxM1c0?=
 =?utf-8?B?TExHK1lLV20xQUMvSGlBS25qMmZ5SjBuaGtNVENwU0FmUWdqVUl4M3BMS0I3?=
 =?utf-8?B?QzN3L2dqajlYWTUzT1lTWWlYbUROWGI3SkVOdzFkSlJNOVVkU3dmLytjMkJJ?=
 =?utf-8?B?WldXeEQ2a05sdEc5NGV0YjdDQklVeTNUaHk1cmVURWxhS0hoMktsWWNVeVEx?=
 =?utf-8?B?blUrWjRoTEZFbHlDa09xZDdqWk92cm9GSE5WN2wyZzR6UzVoenRQRGYzd0tE?=
 =?utf-8?B?c2lJUVN1WEE4YXhqV2taN1RFZTl3WVh2VEYwMFB0dzVpUXdKZnFrTUQyR25s?=
 =?utf-8?B?NTR4N0xYb0xqalE3Y21WUHFpcytYaEp0YmtROFBhTU83OEFKVTdvOXh4WHhZ?=
 =?utf-8?B?ZGYyVTVISmZWTlpqcWZoTGZpVG9NazhlL0pwRk9ZQnJrdkQ5ZnJpODk0RGhD?=
 =?utf-8?B?QndheDZVTElxclEzR3hZWi9WMFJETHl0UkE2Qm9JNHZxT0s1NW9hOTVBSHdW?=
 =?utf-8?B?V0ZFSmxINTRWQkY1N0ZtcTIvdWxjSk9XRkJMR2tNNU8zU1RLTUpBckpYcHpp?=
 =?utf-8?B?SzFYOVpoY2syNlZEOEd2NTIxcE5XZ2lXeEdmdXNxZVM4NVNXZlNLYnd3NHV0?=
 =?utf-8?B?MUNwMnpNV2o2dy9RNjdleDRrTEtTVmVYVmIxNUpCNWFtNU55UXpydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b1d24b-6ffd-4fb9-aaa1-08de7a1ae2c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 18:21:42.4602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpiDrc0kw0Qp7yMDyoB6QGo7BFY1Bzn1+V2J0eoE0uRIa3s5YoeMb3DX4x2bOCLLM6mXrLrU753gHDgqCpoy23bPuv0CJ/rZhwgr2wTa5jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7611
X-Rspamd-Queue-Id: 7F7C4206353
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gT24gMjYuMDIuMjAyNiAx
NToyOSwgQmVybmhhcmQgS2FpbmRsIHdyb3RlOg0KPiA+DQo+ID4gQWxzbyBjaGFuZ2UgdG90YWxf
YXZhaWxfcGFnZXMgYW5kIG91dHN0YW5kaW5nX2NsYWltcyB0byB1bnNpZ25lZCBsb25nOg0KPiA+
DQo+ID4gVGhvc2UgbmV2ZXIgYmVjb21lIG5lZ2F0aXZlICh3ZSBwcm90ZWN0IHRoYXQgd2l0aCBB
U1NFUlQvQlVHX09OIGFscmVhZHkpLA0KPiA+IGFuZCBjb252ZXJ0aW5nIHRoZW0gdG8gdW5zaWdu
ZWQgbG9uZyBtYWtlcyB0aGF0IGV4cGxpY2l0LCBhbmQgYWxzbw0KPiA+IGZpeGVzIHNpZ25lZC91
bnNpZ25lZCBjb21wYXJpc29uIHdhcm5pbmdzLg0KPiANCj4gVGhpcyB3YW50cyB0byBiZSBhIHNl
cGFyYXRlIGNvbW1pdC4gSXQgaGFzbid0IGdvdCBhbnl0aGluZyB0byBkbyBpbiBoZXJlLg0KDQpP
ay4NCg0KPiA+IFRoaXMgb25seSBuZWVkcyBtb3ZpbmcgdGhlIEFTU0VSVCB0byBiZWZvcmUgdGhl
IHN1YnRyYWN0aW9uLg0KPiA+IFNlZSB0aGUgcHJldmlvdXMgY29tbWl0IG1vdmluZyB0aGUgQlVH
X09OIGZvciBvdXRzdGFuZGluZ19jbGFpbXMuDQo+IA0KPiBQbGVhc2UgY2FuIHlvdSBhdm9pZCBz
dWNoIHN0YXRlbWVudHM/IFlvdSB3b24ndCBrbm93IGluIHdoaWNoIG9yZGVyIHRoZQ0KPiBwYXRj
aGVzIGFyZSBjb21taXR0ZWQ6IFBhdGNoIDAxIG1heSBnbyBpbiB3ZWVrcyBvciBtb250aHMgYmVm
b3JlIHBhdGNoDQo+IDAyLg0KDQpUaGFua3MsIG9rLCB3aWxsIHJlbW92ZS4NCg0KLSBOQi4gSSBk
byB0aGluayB0aGUgZmlyc3QgMyBjb21taXRzIHNob3VsZCBiZXN0IGJlIGFwcGxpZWQgaW4gb25l
IGdvLg0KIA0KPiA+ICsjZGVmaW5lIG5vZGVfYXZhaWxfcGFnZXMobm9kZSkgKG5vZGVfYXZhaWxf
cGFnZXNbbm9kZV0pDQo+IA0KPiBUaGlzIGlzbid0IHJlYWxseSBuZWVkZWQgd2hlbiAuLi4NCj4g
DQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIG5vZGVfYXZhaWxfcGFnZXNbTUFYX05VTU5PREVT
XTsNCj4gDQo+IC4uLiBpdCdzIGEgc3RhdGljIGFycmF5IGFueXdheS4gUGx1cyB5b3UgbWF5IHdh
bnQgdG8gdGFsayB0byBBbmRyZXcgcmVnYXJkaW5nDQo+IHRoZSB1c2Ugb2Ygc3VjaCBhIG1hY3Jv
IGFzIGFuIGx2YWx1ZS4NCg0KT2suIEl0IHdhcyBvbmx5IGEgY29udHJvbGxlZCwgbG9jYWwgYWNj
ZXNzb3IgaW4gdGhpcyBmaWxlIHRvIHN1cHBvcnQgbW92aW5nDQppdCB0byBhbm90aGVyIHN0b3Jh
Z2UgdmFyaWFibGUsIGJ1dCBJJ2xsIG9taXQgdGhlIGFjY2Vzc29yIG1hY3JvKHMpIHRoZW4uDQoN
Cj4gPiArLyogdG90YWwgb3V0c3RhbmRpbmcgY2xhaW1zIGJ5IGFsbCBkb21haW5zICovDQo+ID4g
K3N0YXRpYyB1bnNpZ25lZCBsb25nIG91dHN0YW5kaW5nX2NsYWltczsNCj4gDQo+IEFzIHlvdSB0
b3VjaCBpdCwgY29tbWVudCBzdHlsZSB3YW50cyBjb3JyZWN0aW5nLg0KDQpJIGd1ZXNzIHlvdSBt
ZWFuIHRvIHVwcGVyY2FzZSB0aGUgMXN0IGxldHRlciBvZiB0aGUgY29tbWVudC4gV2lsbCBkby4N
Cg0KQmVybmhhcmQNCg==

