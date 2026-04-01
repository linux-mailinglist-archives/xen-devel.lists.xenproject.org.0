Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN13I53QzGlFWwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:00:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250873766B1
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269835.1558723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qUU-0000kp-5C; Wed, 01 Apr 2026 07:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269835.1558723; Wed, 01 Apr 2026 07:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qUU-0000hm-2X; Wed, 01 Apr 2026 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 1269835;
 Wed, 01 Apr 2026 07:59:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7qUS-0000hg-BY
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 07:59:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7qUP-000SDw-Kz
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 09:59:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ccd072-5cb7-0a2a0a5109dd-0a2a45079516-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:59:50 +0200
Received: from [40.107.162.82]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ccd076-ba2d-0a2a45070019-286ba252a3cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 09:59:50 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB6708.eurprd03.prod.outlook.com
 (2603:10a6:20b:2da::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 07:59:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 07:59:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6JJQgJPG4zsK1J45oOewiK+yGd18At8B4LKaXVAFZopkLqaqX6WjzeeU7tKKozciHsooz65MGBr5OLAoveyBHp7uDRyDzxzpmpfv0ZZmDNBVCTf89r5LWgj50xMSYyn4fEdoxDyXBIxc5sPLEEsTZF4UztNeTjv5ptNtO23prsoin+TXiyEwCYkxj5wyNj9N/NhJ+12rTq6KDtCnMchTzTdBdHI3M7Ig1cjQNodA4UAtwVKFae/59xFoPEpg+qAGSrpr1XE0oY2sUMEso0gCFGBu4FAXS4HkwaLC9TH4CJXYMOgPC7uUK1//O+ju9J0dZDiv2ugEfbtCzu+vLAfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyccBUdGtR+KGpMCaO5EyuEWNvfC79fGikTxNBZSgG0=;
 b=KbDdn8UTJcxny3lsPVAFgZX+p3XAKgL+qOe8maHvJwx4XwUHAtAywu3+pVj67auhKCwdz2/pJ1TH0um4Hw2zVIr+hzF+8wgpx74r886tgQPnZq3nwy1Xtk1m98JccHrqc9r/0IEpxQpGFATXYvmI3BO+qAXypCr+EHSgG7rB+SzvxG8CC03DxUaqVN1qoQ+6TzFJiXuONL396nW1z2pS//gYwj4oAephRNS20xN1t3uU9CHfu+omaSkkvMojr2hN1d31RPImkRowHkl3C2z97dXVa5OrJmzRbQpHZwelglly7Bu+R+BmDZfHLSs1wiMxZmlDNH/542q6dX44Vgiidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyccBUdGtR+KGpMCaO5EyuEWNvfC79fGikTxNBZSgG0=;
 b=CLu9OHpAMTpGodDGEoJAodCObIjnze6Zsd6unwHI7D9oK5wTB/2M/5ISd81gW+QbrbtHKg3C0GE14Fp0HSmfMQKNl3bfOhxmujzJ9V502Gmab2kJKdk5k3qnzzFehV6hkUb0y73/tzw7ewxhy3qUN57EU5IGOyndAqslK7JrzGjshv7Vsh6SYQlaKrb11IjeqUvkGdyJIDeSCotCpC+S9M3D05V8Ii3wFzOFNA+alIfZdW1O/XPs2BEG2MsP7FlGBdcxgeWhgKM8ZZ0n6ZAaBJw1HDdqNmpX7QdcTvK3gHsp7EJPuwJ6V9xHMczZvAEuDDyP46Jfz6DUVK96SHX3VQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Topic: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Index: AQHcr7UNjpbdOXJQP0qdir/zrd85obXI3WYAgAEeNIA=
Date: Wed, 1 Apr 2026 07:59:48 +0000
Message-ID: <0275be7d-d1d9-47ee-bec2-bfbbb90b4bae@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
 <f546ae19-2107-469e-847b-7a4cde2c95fd@suse.com>
In-Reply-To: <f546ae19-2107-469e-847b-7a4cde2c95fd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB6708:EE_
x-ms-office365-filtering-correlation-id: f321d213-c8c6-419e-b94d-08de8fc4a58d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 tpEsNu9rU4dbFO19YwnF8TpvMgDjr32iHkQqax6g1RqKQ0gsu/S4n17ykisFk6uk4TwwhIzoTEbpSp9A6NPSTqqo15/8uS/ciSq6gyIBRhCEVH0RVmWvOLOTyVzgKUR/io2+pYihAE6KPtAqCHDv7mxlHwTXye+UNbWG+NujyBkf7T0yOTIW0y2/r7CVRNsA4o2ChYSbjVCx3ge09OM5GE6lSsAsuTmK0/tHEw0C38f4I2v0CVXMW3nI7TjKDcBEkaP8E4ItGMEhtKgPVf6zgOV+qpwhdXaQ4dbNltrrQ4TGlXcSE2lvFFoqpJ3pNVkPHl7ArOFC3YEUwxsXbXtDtpQ/lEhhKzrj6x/eYDE1Dbo61YSVA06+jotqzZu98O8muavg1p7smZ7VGC+8xX0O25x6d7dRDy7x0wlNyXD2XRFDSk20fzpeZGY6niN6nu3xUrYgmQKgaaja80AEjsARXgf63BudOX65/gEqYi4uaMFQZSdMYbPWu9vttEmCtUHs+AUv9bj4b8cfu41z5dNdf1EOiFILYtxq6yo2V8Mp2QYpg7AIDEEyNA9KLD3H2i87k7WQer9upAAigBwNq6XXeL0J5rAFeM1OktH+M9v9IjCNGRi51CWkjBAjNhgC3S+09WE6wi9agj/X8N01sQqZJaIf/nzfSBzg/STnc5Id2ppVzRI2kptbxEO+aYpwziE8wi7uvCkSCukUzhUQuDj9Yd/cN3TZOkpKpkFNyZ6plWq/FGKFpP1ZxZsfJZHj1XR5nIOAzTSrHjIiKy5Tu+4AIN+h9IoJpdEjjC8hwDhIxvU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eW5wdy9xUUZPUkJZVjh6ajQ4VGI4YVNiWE9OS3FIb1l0SDdMN2ZNOGRNamtx?=
 =?utf-8?B?bkE2N2o5YStOQ0Y5Um5QNWErK3QxekFDVGVNMWEvb0ZyNlpIc3JrSEwzSmZ4?=
 =?utf-8?B?UEVJQUNVRXB4UkVyU3VMNFVMWEdZM1dPV3lrbyt3RktEeEFMZTZoajRRb0h2?=
 =?utf-8?B?L0V6VWVTUWFUYkJhV041Zmd5T0VwZCs4SzRaVnV4ZWFFWG5hQ0JQQ1I4b2hj?=
 =?utf-8?B?MWZtVGVJNGowc2Y3SU5LTkxsR25sQTBybFRFbkhaU280a09oK0VzWnRPWnFT?=
 =?utf-8?B?ZnVQTzFWSmZqV1RHR3hVYnhtbE5nTFlUSlAweVVKeWxqWFR4ZEZJWjBSZ08y?=
 =?utf-8?B?Zzl5cXNnK1draVJrNGp1U3lkYlRKR3BRY1g5ZytUNDNEZUgzMyt1a0ZCOEhY?=
 =?utf-8?B?aFJvNzJTZTNJLzhod2NsZWhxMTdrbys2ZzF2aXhXdG4zanlwaEJaSnF4c3Ay?=
 =?utf-8?B?MUY3THFPYzJ4VS9lRldyR0ZUMkludjU1T0tRemJMOWJ4OUpkODJrclFPanI2?=
 =?utf-8?B?bm9ZZldaajRHSTF1eVBHbEtNdGREUE1vSnp1NEVLeTNtbTdkWi9HclJPRWJt?=
 =?utf-8?B?RWlIbndhSUFFTlQ5RVNWRHdZRkFPS2tqTUVWUTlUU2s1L0MrRkY3bkxiNUl6?=
 =?utf-8?B?WklySW9RR1QyaXQ1akhnKzh0a0s5dlFwWlRtREFCVUYyci9OcWIxc0E0d1M4?=
 =?utf-8?B?N0RjVmN3L3Qreko2ZWF0NnBzQ0lDMDFnRTYxSElmdkcvQWZGckNtNkxQckhv?=
 =?utf-8?B?UWx0Z1dDN0NNd1RudkduZ2xoZWMyWnA2bDVzaHJ2cVF5U2UxYXdjSXlia3B4?=
 =?utf-8?B?L3ZYcUhKM1hFUzdQb203YVkzb1VwQ21lYnR4RkE3V0p1Y2tjblJVNy9WNFJX?=
 =?utf-8?B?UzBpWEtoNnJwV1ZubmV6b0EySUZBL3YzYnM1L2NKYXVLVHVCeXVDK2xhYTlt?=
 =?utf-8?B?MlFPSkJweGkyZGRaajZKRnhEcEx6SkRDaWg2RnNMOHpQQUR6RUZWTXhFMTNQ?=
 =?utf-8?B?RTBEN0dWR3NHRWZrWGxFQ1l3RC95WWpNNVNEejREdkF0NDlwMzd3UFBDVFAv?=
 =?utf-8?B?c0pRdFcrOEJGMlFvTjh2eXBNVnN3L29mdzYzRXQ2WTNEZWM0bklvc2hZUWRW?=
 =?utf-8?B?cWVCQlI0czBnQWVBemMvWEM4V28wbXpHNEM2MzFIUzBZWDR1TEVwa3pTb1R5?=
 =?utf-8?B?cGhaaVJ5ZHExaG9BbERyZmtoUFhkRWFNVUdiRmVmWmhoTnN5UzRTVkdid1Yr?=
 =?utf-8?B?UGExWXlBZHo1ekluVGgxeUlmTDMxTmVWZ0g5VGtJMUJGcmF1VGJNVHV1MUJE?=
 =?utf-8?B?Y0tDY2x0Q3dvay9LaDF6RkxrM3JkZ3VPTnlOcGFrYnJsK2JObXRtdFlGVE1I?=
 =?utf-8?B?MlJJMXFCR3EyZ1lwNEhvY29nQm85aEptY3EvVGpaRWMzOXVNTUt3eHhMS2Mw?=
 =?utf-8?B?TExjcXFRcFNiT1UvR2tSOW5kbG96aVJQeXhaNXhsQy9JT2QrRXlzbWZHc0wr?=
 =?utf-8?B?YjVyQ1BsOXpiM2J5OHc4WnVmLzVTdU1xbWdSREl1UTJ0YzhNQjh3ZXUzaE5p?=
 =?utf-8?B?UHlsTGVlR3FMQzZxMkJnVGVOK1JCYno1MGhHY1VXQjVCN3pkelRwamFDMGIw?=
 =?utf-8?B?QXlaait4b3p4dVlPZTdxbU52bVBGYyszWkkvWm9tN1E1UjBhdnRRYlZDanJt?=
 =?utf-8?B?eGs0VnpOMXpTMHl4aW9Va0ljRjZLdHZoelZFZkZ0TXc2M0NRSTNPS2o3U0wy?=
 =?utf-8?B?V3dXL1NlY0syMVR3UkxIbXRqZ2tZK0dpNDdoWVlnaUoxY1VmdEJVL3ozbUhw?=
 =?utf-8?B?YVJ4THpOQmJGOW5BUzRYcStjU0gya3c1U3lxWjFjeHhKcEJWY2VtQnR1WHRI?=
 =?utf-8?B?VXdXVlIvZW1BRittOWRXZTNUU1VjUS8vT0EyZ05yQkYydEh5N0l5NkFYM2J6?=
 =?utf-8?B?R056MXBXY0ljRHFqNzg0ZUF2TDN5VmwyRHRpcHpLWU1XY292c0wwL2dQSFJk?=
 =?utf-8?B?Sm5MaWdkQy83Q3dOWFg3c1k5T0Y5SStaVjJ0MmVYS1lIbUNlUVFXRHBPL2Rs?=
 =?utf-8?B?bVJBLzJjSVJZV29nc21uUVZ0SkNudWVNakhTUnNvRGk2V0s1N3BTNGZNbnZl?=
 =?utf-8?B?bk50d2RwNHJyUDYwR1o1S3lVZUpMSk5oTXdJcWl5b3Ywa3k5eVlRejdGandC?=
 =?utf-8?B?dDd1Q0E4QmFuN3R4dTJEblFqaytsTGVJWXFlZUYxWTJCNnFjdTZJWHhHUUtT?=
 =?utf-8?B?amVRVDVDVHZVbU9GSTBQZ2wvczFDb2dKUi9FY2FFYWNIdEZTeHpXN2lPMFA1?=
 =?utf-8?B?M1NQemozNklOQy9HR2dkbjlhcWh1MnJ2Y0Mrb1pzcHRCTDNlZ1JlNit4bWhK?=
 =?utf-8?Q?JeQPzpkN55G0SE5Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB676799DF67B44D99588A991BFB5AD5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f321d213-c8c6-419e-b94d-08de8fc4a58d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 07:59:48.6973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pITZWJ4qH9UsfVe6fL04elut7JaAPWx/RhXWCIusNAmaR8xyUGljId4qCRiVvHnB4J/9faPoU/MQDsJi9y7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6708
X-purgate-ID: tlsNG-ef75cf/1775030390-10D5F41E-56A00504/0/0
X-purgate-type: clean
X-purgate-size: 9854
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 250873766B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8zMS8yNiAxNzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjAzLjIwMjYgMTI6
MDgsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFk
ZXIuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gQEAgLTE3NSw3NiAr
MTc1LDkyIEBAIHN0YXRpYyB2b2lkIG1vZGlmeV9kZWNvZGluZyhjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgdWludDE2X3QgY21kLA0KPj4gICANCj4+ICAgYm9vbCB2cGNpX3Byb2Nlc3NfcGVu
ZGluZyhzdHJ1Y3QgdmNwdSAqdikNCj4+ICAgew0KPj4gLSAgICBjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiA9IHYtPnZwY2kucGRldjsNCj4+IC0gICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFk
ZXIgPSBOVUxMOw0KPj4gLSAgICB1bnNpZ25lZCBpbnQgaTsNCj4+IC0NCj4+IC0gICAgaWYgKCAh
cGRldiApDQo+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiAtDQo+PiAtICAgIHJlYWRfbG9j
aygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+PiAtDQo+PiAtICAgIGlmICggIXBkZXYtPnZwY2kg
fHwgKHYtPmRvbWFpbiAhPSBwZGV2LT5kb21haW4pICkNCj4+ICsgICAgc3dpdGNoICggdi0+dnBj
aS50YXNrICkNCj4+ICAgICAgIHsNCj4+IC0gICAgICAgIHYtPnZwY2kucGRldiA9IE5VTEw7DQo+
PiAtICAgICAgICByZWFkX3VubG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+PiAtICAgICAg
ICByZXR1cm4gZmFsc2U7DQo+PiAtICAgIH0NCj4+IC0NCj4+IC0gICAgaGVhZGVyID0gJnBkZXYt
PnZwY2ktPmhlYWRlcjsNCj4+IC0gICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRl
ci0+YmFycyk7IGkrKyApDQo+PiArICAgIGNhc2UgTU9ESUZZX01FTU9SWToNCj4+ICAgICAgIHsN
Cj4+IC0gICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+
IC0gICAgICAgIHN0cnVjdCByYW5nZXNldCAqbWVtID0gdi0+dnBjaS5iYXJfbWVtW2ldOw0KPj4g
LSAgICAgICAgc3RydWN0IG1hcF9kYXRhIGRhdGEgPSB7DQo+PiAtICAgICAgICAgICAgLmQgPSB2
LT5kb21haW4sDQo+PiAtICAgICAgICAgICAgLm1hcCA9IHYtPnZwY2kuY21kICYgUENJX0NPTU1B
TkRfTUVNT1JZLA0KPj4gLSAgICAgICAgICAgIC5iYXIgPSBiYXIsDQo+PiAtICAgICAgICB9Ow0K
Pj4gLSAgICAgICAgaW50IHJjOw0KPj4gKyAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSB2LT52cGNpLm1lbW9yeS5wZGV2Ow0KPj4gKyAgICAgICAgc3RydWN0IHZwY2lfaGVhZGVy
ICpoZWFkZXIgPSBOVUxMOw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+PiAgIA0KPj4g
LSAgICAgICAgaWYgKCByYW5nZXNldF9pc19lbXB0eShtZW0pICkNCj4+IC0gICAgICAgICAgICBj
b250aW51ZTsNCj4+ICsgICAgICAgIGlmICggIXBkZXYgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFr
Ow0KPj4gICANCj4+IC0gICAgICAgIHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBt
YXBfcmFuZ2UsICZkYXRhKTsNCj4+ICsgICAgICAgIHJlYWRfbG9jaygmdi0+ZG9tYWluLT5wY2lf
bG9jayk7DQo+PiAgIA0KPj4gLSAgICAgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQ0KPj4gKyAg
ICAgICAgaWYgKCAhcGRldi0+dnBjaSB8fCAodi0+ZG9tYWluICE9IHBkZXYtPmRvbWFpbikgKQ0K
Pj4gICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVM
TDsNCj4+ICAgICAgICAgICAgICAgcmVhZF91bmxvY2soJnYtPmRvbWFpbi0+cGNpX2xvY2spOw0K
Pj4gLSAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4g
ICAgICAgICAgIH0NCj4+ICAgDQo+PiAtICAgICAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIGhl
YWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQo+PiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8
IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCj4+ICAgICAgICAgICB7DQo+PiAtICAg
ICAgICAgICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+IC0gICAgICAgICAgICAv
KiBEaXNhYmxlIG1lbW9yeSBkZWNvZGluZyB1bmNvbmRpdGlvbmFsbHkgb24gZmFpbHVyZS4gKi8N
Cj4+IC0gICAgICAgICAgICBtb2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5jbWQgJiB+UENJ
X0NPTU1BTkRfTUVNT1JZLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxzZSk7
DQo+PiAtICAgICAgICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gKyAg
ICAgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+ICsg
ICAgICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSA9IHYtPnZwY2kuYmFyX21lbVtpXTsNCj4+
ICsgICAgICAgICAgICBzdHJ1Y3QgbWFwX2RhdGEgZGF0YSA9IHsNCj4+ICsgICAgICAgICAgICAg
ICAgLmQgPSB2LT5kb21haW4sDQo+PiArICAgICAgICAgICAgICAgIC5tYXAgPSB2LT52cGNpLm1l
bW9yeS5jbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlksDQo+PiArICAgICAgICAgICAgICAgIC5iYXIg
PSBiYXIsDQo+PiArICAgICAgICAgICAgfTsNCj4+ICsgICAgICAgICAgICBpbnQgcmM7DQo+PiAr
DQo+PiArICAgICAgICAgICAgaWYgKCByYW5nZXNldF9pc19lbXB0eShtZW0pICkNCj4+ICsgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+PiAgIA0KPj4gLSAgICAgICAgICAgIC8qIENsZWFuIGFs
bCB0aGUgcmFuZ2VzZXRzICovDQo+PiAtICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+PiAtICAgICAgICAgICAgICAgIGlmICggIXJh
bmdlc2V0X2lzX2VtcHR5KHYtPnZwY2kuYmFyX21lbVtpXSkgKQ0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgIHJhbmdlc2V0X3B1cmdlKHYtPnZwY2kuYmFyX21lbVtpXSk7DQo+PiArICAgICAgICAg
ICAgcmMgPSByYW5nZXNldF9jb25zdW1lX3JhbmdlcyhtZW0sIG1hcF9yYW5nZSwgJmRhdGEpOw0K
Pj4gICANCj4+IC0gICAgICAgICAgICB2LT52cGNpLnBkZXYgPSBOVUxMOw0KPj4gKyAgICAgICAg
ICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkNCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAg
ICAgICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+ICsgICAgICAg
ICAgICAgICAgcmV0dXJuIHRydWU7DQo+PiArICAgICAgICAgICAgfQ0KPj4gICANCj4+IC0gICAg
ICAgICAgICByZWFkX3VubG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+PiArICAgICAgICAg
ICAgaWYgKCByYyApDQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICBzcGlu
X2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gKyAgICAgICAgICAgICAgICAvKiBEaXNhYmxl
IG1lbW9yeSBkZWNvZGluZyB1bmNvbmRpdGlvbmFsbHkgb24gZmFpbHVyZS4gKi8NCj4+ICsgICAg
ICAgICAgICAgICAgbW9kaWZ5X2RlY29kaW5nKHBkZXYsIHYtPnZwY2kubWVtb3J5LmNtZCAmIH5Q
Q0lfQ09NTUFORF9NRU1PUlksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWxzZSk7DQo+PiArICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2Nr
KTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgICAgLyogQ2xlYW4gYWxsIHRoZSByYW5nZXNldHMg
Ki8NCj4+ICsgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRl
ci0+YmFycyk7IGkrKyApDQo+PiArICAgICAgICAgICAgICAgICAgICBpZiAoICFyYW5nZXNldF9p
c19lbXB0eSh2LT52cGNpLmJhcl9tZW1baV0pICkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICByYW5nZXNldF9wdXJnZSh2LT52cGNpLmJhcl9tZW1baV0pOw0KPj4gKw0KPj4gKyAgICAgICAg
ICAgICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVMTDsNCj4+ICsNCj4+ICsgICAgICAgICAg
ICAgICAgcmVhZF91bmxvY2soJnYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4gICANCj4+IC0gICAg
ICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4odi0+ZG9tYWluKSApDQo+PiAtICAgICAg
ICAgICAgICAgIGRvbWFpbl9jcmFzaCh2LT5kb21haW4pOw0KPj4gKyAgICAgICAgICAgICAgICBp
ZiAoICFpc19oYXJkd2FyZV9kb21haW4odi0+ZG9tYWluKSApDQo+PiArICAgICAgICAgICAgICAg
ICAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsNCj4+ICAgDQo+PiAtICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOw0KPj4gKyAgICAgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgICAgICB9
DQo+PiAgICAgICAgICAgfQ0KPj4gLSAgICB9DQo+PiAtICAgIHYtPnZwY2kucGRldiA9IE5VTEw7
DQo+PiArICAgICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVMTDsNCj4+ICAgDQo+PiAtICAg
IHNwaW5fbG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+PiAtICAgIG1vZGlmeV9kZWNvZGluZyhw
ZGV2LCB2LT52cGNpLmNtZCwgdi0+dnBjaS5yb21fb25seSk7DQo+PiAtICAgIHNwaW5fdW5sb2Nr
KCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+ICsgICAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaS0+
bG9jayk7DQo+PiArICAgICAgICBtb2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5tZW1vcnku
Y21kLCB2LT52cGNpLm1lbW9yeS5yb21fb25seSk7DQo+PiArICAgICAgICBzcGluX3VubG9jaygm
cGRldi0+dnBjaS0+bG9jayk7DQo+PiAgIA0KPj4gLSAgICByZWFkX3VubG9jaygmdi0+ZG9tYWlu
LT5wY2lfbG9jayk7DQo+PiArICAgICAgICByZWFkX3VubG9jaygmdi0+ZG9tYWluLT5wY2lfbG9j
ayk7DQo+PiArDQo+PiArICAgICAgICBicmVhazsNCj4+ICsgICAgfQ0KPj4gKyAgICBjYXNlIFdB
SVQ6DQo+PiArICAgICAgICBpZiAoIE5PVygpIDwgdi0+dnBjaS53YWl0LmVuZCApDQo+PiArICAg
ICAgICAgICAgcmV0dXJuIHRydWU7DQo+PiArICAgICAgICB2LT52cGNpLndhaXQuY2FsbGJhY2so
di0+dnBjaS53YWl0LmRhdGEpOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+IA0KPiBBcyBqdXN0IGlu
ZGljYXRlZCBpbiByZXBseSB0byBwYXRjaCA2LCBidXN5IHdhaXRpbmcgaXNuJ3QgcmVhbGx5IGFj
Y2VwdGFibGUuDQo+IFRoaXMgaXMgZXZlbiBtb3JlIHNvIHdoZW4gdGhlIHdhaXRpbmcgZXhjZWVk
cyB0aGUgdHlwaWNhbCBsZW5ndGggb2YgYQ0KPiBzY2hlZHVsaW5nIHRpbWVzbGljZS4NCj4gDQo+
IEluIHRoYXQgb3RoZXIgcmVwbHkgSSBzYWlkIHRvIHB1dCB0aGUgdkNQVSB0byBzbGVlcCwgYnV0
IHlvdSBuZWVkIHRvIGJlIGNhcmVmdWwNCj4gdGhlcmUgdG9vOiBUaGUgZG9tYWluIG1heSBub3Qg
ZXhwZWN0IGl0cyB2Q1BVIHRvIG5vdCBtYWtlIGFueSBwcm9ncmVzcyBmb3Igc3VjaA0KPiBhbiBl
eHRlbmRlZCBwZXJpb2Qgb2YgdGltZS4gVGhpcyBtYXkgbmVlZCBkb2luZyBlbnRpcmVseSBkaWZm
ZXJlbnRseTogT25jZSB0aGUNCj4gY29tbWFuZCByZWdpc3RlciB3YXMgd3JpdHRlbiwgeW91IG1h
eSB3YW50IHRvIHJlY29yZCB0aGUgdGltZSBhZnRlciB3aGljaA0KPiBhY2Nlc3NlcyB0byB0aGUg
VkYgcmVnaXN0ZXJzIGFyZSBwZXJtaXR0ZWQuIEVhcmxpZXIgYWNjZXNzZXMgd291bGQgc2ltcGx5
IGJlDQo+IHRlcm1pbmF0ZWQuIFlvdSBtYXkgc3RpbGwgYWRkaXRpb25hbGx5IG5lZWQgYSB0aW1l
ciwgaW4gb3JkZXIgdG8ga2ljayBvZmYgQkFSDQo+IG1hcHBpbmcgYWZ0ZXIgdGhhdCB0aW1lLiAo
WWV0IGJldHRlciB3b3VsZCAgYmUgaWYgdGhlIEJBUiBtYXBwaW5nIGNvdWxkIGJlDQo+IGRvbmUg
ZHVyaW5nIHRob3NlIDEwMG1zLiBBZnRlciBhbGwgdGhhdCBtYXkgYmUgYSByZWFzb24gd2h5IHRo
aXMgbG9uZyBhIGRlbGF5DQo+IGlzIHNwZWNpZmllZDogRmlybXdhcmUgb24gdGhlIGRldmljZSBt
YXkgYWxzbyByZXF1aXJlIHNvbWUgdGltZSB0byBzZXQgdXAgdGhlDQo+IEJBUnMgYWNjb3JkaW5n
bHkuKQ0KPiANCj4gSmFuDQoNCkkgYW0gbm90IHN1cmUgaXQgd291bGQgd29yayB0aGF0IHdheS4g
SWYgd2UgbG9vayBhdCBob3cgbGludXggDQppbml0aWFsaXplZCBzcmlvdiwgaXQgd3JpdGVzIFZG
RSBhbmQgTVNFIGJpdHMsIHdhaXRzIDEwMG1zIGFuZCB0aGVuIA0KZXhwZWN0cyBWRnMgdG8gYmUg
b3BlcmF0aW9uYWwuIElmIHRoZXkgYXJlIG5vdCBvcGVyYXRpb25hbCBhdCB0aGF0IA0KbW9tZW50
LCB0aGVuIGl0IGNvbnNpZGVycyB0aGUgb3BlcmF0aW9uIGZhaWxlZCBhbmQgcmVtb3ZlcyBhbGwg
VkZzLiBJZiANCndlIGFsc28gd2FpdCAxMDBtcyBiZWZvcmUgZW5hYmxpbmcgYWNjZXNzLCB0aGUg
cHJvYmFiaWxpdHkgb2YgYSBndWVzdCANCnRyeWluZyB0byBhY2Nlc3Mgc29tZXRoaW5nIGJlZm9y
ZSB3ZSBhbGxvdyBpdCB3b3VsZCBiZSB2ZXJ5IGhpZ2guDQoNClNvIEkgdGhpbmsgdGhlcmUgaXMg
bm8gd2F5IHRvIGFkZCBWRnMgaW4gWGVuIHdpdGhvdXQgYmxvY2tpbmcgdGhlIA0KZ3Vlc3TigJlz
IHZDUFUgaW4gc29tZSB3YXkuIFdlIGNhbiByZXZlcnQgYmFjayB0byB0aGUgb2xkIHZhcmlhbnQg
YW5kIHJlbHkgDQpvbiBwaHlzZGV2IG9wIHRvIGFkZCBWRnMgb25lIGJ5IG9uZSBhcyB0aGV5IGFy
ZSBkaXNjb3ZlcmVkIGJ5IERvbTAsIHRoZW4gDQp3ZSB3aWxsIG5vdCBuZWVkIHRvIGV4cGxpY2l0
bHkgd2FpdC4NCkBSb2dlciBhcmUgeW91IG9rYXkgd2l0aCB0aGF0Pw0KDQoNClNuaXBwZXQgZnJv
bSBMaW51eDoNCg0Kc3RhdGljIGludCBzcmlvdl9lbmFibGUoc3RydWN0IHBjaV9kZXYgKmRldiwg
aW50IG5yX3ZpcnRmbikNCnsNCgkuLi4NCglwY2lfaW92X3NldF9udW12ZnMoZGV2LCBucl92aXJ0
Zm4pOw0KCWlvdi0+Y3RybCB8PSBQQ0lfU1JJT1ZfQ1RSTF9WRkUgfCBQQ0lfU1JJT1ZfQ1RSTF9N
U0U7DQoJcGNpX2NmZ19hY2Nlc3NfbG9jayhkZXYpOw0KCXBjaV93cml0ZV9jb25maWdfd29yZChk
ZXYsIGlvdi0+cG9zICsgUENJX1NSSU9WX0NUUkwsIGlvdi0+Y3RybCk7DQoJbXNsZWVwKDEwMCk7
DQoJcGNpX2NmZ19hY2Nlc3NfdW5sb2NrKGRldik7DQoNCglyYyA9IHNyaW92X2FkZF92ZnMoZGV2
LCBpbml0aWFsKTsNCglpZiAocmMpDQoJCWdvdG8gZXJyX3BjaWJpb3M7DQoJLi4uDQp9DQoNCg0K
DQoNCg0KLS0gDQpNeWt5dGE=

