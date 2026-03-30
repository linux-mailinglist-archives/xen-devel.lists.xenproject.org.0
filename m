Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK29GxgLy2lwDQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 01:45:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40A36266E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 01:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268197.1557509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7MHN-0008Op-Ba; Mon, 30 Mar 2026 23:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268197.1557509; Mon, 30 Mar 2026 23:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7MHN-0008MD-8r; Mon, 30 Mar 2026 23:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1268197;
 Mon, 30 Mar 2026 23:44:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w7MHL-0008M7-Mk
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 23:44:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7MHK-00GyY1-3B
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:44:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69cb0a58-e002-0a2a0a5209dd-0a2a4505a15c-44
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:44:18 +0200
Received: from [52.101.69.110]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69cb0ad1-5aeb-0a2a45050019-3465456ec4f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:44:17 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9638.eurprd03.prod.outlook.com
 (2603:10a6:10:458::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 23:44:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 23:44:13 +0000
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
 b=xOMD4tdyg8yXt94AvoVH2zjR7pTYN/7mgu1RDMXKPrI4beSgeeUlWUSxfKQFOodu/XhUjn4EMYU3RVnFd/+7JELCzDKezcOLpOv318ashIS9i6iqsBXO0RTr3YBUEcKyrB7eeBrfsZigcYZKoV6nexjEiQR1gxfh5Wdn7DGHs66qDcPgpBuPTSHusNZwhgxf2Xo1Y544YXZw5KjoWhUbRxDn2i+7sQVWlK9c+c5ELT3ygTCqHnqpFfjMYtkGoLQ689D0rsjjBP+XaQQnqWsHghGugmmKqgEFxqsp7pOTB1dBFjiHd0/9uuILBFQKinCsNoOXo3ghD01+5SZBj4vBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fPsvRapofhmAxW35fldnrYM5OVDRSI+lv6JF2LcqV4=;
 b=D9N519I/uIi+Zs0x7WxDz2pYH2otHSRQKCVQ0ZP5YLJlOQsgH030tMhaV8SLMjoaCLtNp1T2rqVxH2moJly39T4fJLC3onE3i8QQAfAMGKS49zO9T6CQZVAQXHHe9cR8/S6uOquVtlHJ35Lqlag+3XvlxNsbeTr9npXMz1BqwR/rjPc8VSEd1zOivVp6vHNEEO1bkZpd+MJLHYmKbbmGdq4spu3UWETsiQ4DiEZ1mRHM5fXkNmz29QPYD2kwncSHvanZJPsB9i8C+wcWNodA++xfSObRT++J+Loa4j9K1Ozj1dWskyEpXNA6VVD5wBSlCR4AckByTp9zaQKkNbxDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fPsvRapofhmAxW35fldnrYM5OVDRSI+lv6JF2LcqV4=;
 b=ciXTC81WGIVxi7YoklsE105ZTofOcAC+D/md5R56QGtHF5LcunzB6QL2bRv7+Fd0sYPdZX7h2kbRGjVIRgQ3684be3toEpGmChaf9HU/n8GF5Uden5yx+RgKkafNhW4QKR0AiuZeKDHeLMOwAGS98BQTcRdMnm51bVqGblpLosXz+5dsy37j9g4IKGziTnKoWqapowLlB77uEFkX+3tFpCVty1xtD0kYYnZ230vZeNsDQGNYU5P+Tc455gVkmNiCn2HDgwrbT2fS1TaKFPHjFK3voVj48xEPVIjAMlcrU8a9PWCNgdZmWrELmCiVs9w8ymYOK++nSuJ84eGGVkZhIA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/4] xen/arm: its: collect quirk flags and honor
 dma-noncoherent
Thread-Topic: [PATCH 1/4] xen/arm: its: collect quirk flags and honor
 dma-noncoherent
Thread-Index: AQHcvEPlse85KJ7ml0OZmvGoi7I/KA==
Date: Mon, 30 Mar 2026 23:44:12 +0000
Message-ID: <87o6k4vq5x.fsf@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
	<5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
	<87bjgcvul6.fsf@epam.com>
	<CAGeoDV87irnVf8k+Z2L6=k41p87N9O6DpLCFdkMwErzDpXB9KA@mail.gmail.com>
In-Reply-To:
 <CAGeoDV87irnVf8k+Z2L6=k41p87N9O6DpLCFdkMwErzDpXB9KA@mail.gmail.com>	(Mykola
 Kvach's message of "Wed, 25 Mar 2026 17:47:43 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9638:EE_
x-ms-office365-filtering-correlation-id: 40d9ac21-3f0c-48e1-c74f-08de8eb63f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 zwVwt7zg+3BorbOpKuKeSKqtMv3NVrErPNKz5QuX/zRL1agnn7+st80TjeA3Bsd931YEHw864xWCY9I0X/odDh/5aehHnCc0wjChC+2EBoE9bLLEftESyQnu72GW6oTHhdmcULAwkAGSb1oNl0qD94zZzNehHXqELDy7rtxeQXhkF4oZ184DtWhJG1BQyC1spC5hjDjtzxmoZOCfM2fiSGyooQIxiQuZIT0FNnFp/HW8OzDwBT6aXu0hsM60lYBCWASdlrLl6r1GcHOkbIRRAqJS0UiDgetWRwWI7QhKAUsetYdbyNnwrPZXzyIm7FO5MF8yy5cqVn3VCQd/+QKmZoLCXsXOAwX792MKe7OuiBVR8Enf9mFII74QmPRvrvXycFT5upOOaSuhUNcTBRCVn9xn8fkddpxi8kina3SAS8nAhnEp7KwkZSoQviWYMNFLI9j/c2tWqMuUkfQAmBS/CqRiF3nNNoBp5kx+ZJoTXmWq86lgLz2h9xas640ytFMc4agz3cmFC8WHis+dmpPq6O4+0045pWZMkUbZNer9ZFs3vsktO2W6F2noj1iSPaQ2/VtkAkG5ajbdMM+H2c/fybIz/e3IzAkCniORWnU4o1r/4GF0w3uJQpv1BNj0+nTZuoj+UcW5jk2ORdr1YVaahOcAAP0ILaFHWuqyU5PyphnnQirZPdy+/voBeLPvhGFg/XVV1X42+qTbunPhiINSxYGRZK/ZZA8+wMUFrqFkDmL27Se7WUIRA1mdfH3im5NaJWxgs+G6uVNIGn3OatZgDSIVVx6qHn13XuqxMtkGw04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkJqZEtZdGM1aHNBYzBDQ0xhSHowWWh5bFVqOHNpSUp1SWZCR2VqcmZUT2l2?=
 =?utf-8?B?R0NSdW9wSEtudFE5V0NTS1p0YmxveVhxaGtNNEt3V1FOOGlYUEhBRTdMeWVk?=
 =?utf-8?B?TjBNdE5nQXpvcWxIOXNRaTJCeXgzb1pObmhjanl5VWNUcDdxeDAxYWhvQ05Q?=
 =?utf-8?B?NzN0dXAvNGpnVCtMMjEzRkVITGwxQzZTSHY5cU5ZYi95d0NYVzM5REJLc1h2?=
 =?utf-8?B?aWZ3cVcvVnlvb3dQRUg2RmxRM1ZlbG42ZENLOEJIUytPUitRV084Z3FGbmRH?=
 =?utf-8?B?MzdScGltTlJYQzNJT1JLc3ZxZm1BS09Vd3RuRStESDBnS1VneG1NUllQRmNJ?=
 =?utf-8?B?OXArdGRZU3ZyZ1QrREtQN0hNUk5UZDRKUmE5RHk4VlBvV0VKYUp6Yi9jbkZv?=
 =?utf-8?B?cXkwbHdKTzM3U1ZQcXhheVVCZzM1V05TdzZkWlNqU05Ta1BHUjBrRE9vNVEx?=
 =?utf-8?B?V3RGK0lIRVluQm9kRSttQUw2UTZjYXlnTWNpR0xGZXNZUm9TM05obE5PVTNh?=
 =?utf-8?B?TlNHYmlKbEx6OGpoTFUxNWU1aytZN0xZcFVoc1ViMW9jZFpaYlVZaUpKZnUx?=
 =?utf-8?B?NUJSSTlTdTNMNUlmaTVQdUZzSXJucmtETkdDMXhncEdaczF2WTdBMVk2bXJK?=
 =?utf-8?B?SHdkTWNSV0NEYXhjeGdOcUFhWFcrcWR1WlMxdDlHR0ZWb1BDcTl5ZitaQXlH?=
 =?utf-8?B?dzBNTjl3ZUVDYWkyTUhhZzF1UVFvMlUzd1k3LzJRZmNJZG8yTUpRZlFjTmVq?=
 =?utf-8?B?MVVOZDI3TVdJMWNRMkZKWVFoRzRPbEJYc2F4bDFscy95bnptRXBiVnBIREwr?=
 =?utf-8?B?Mk5iRUNMZ0JlZ1Zib2lCZkpTb0tKL0pmZ3A3clZaZ2F0NXZLYy80Q0JTa3FT?=
 =?utf-8?B?dk51Ly9PZEFvWUVPeThjRXpRYkZ6RUdUYnZNcE1TYnVxME1VOUJBNzczdEkz?=
 =?utf-8?B?Nm9PZlNkK0RTRlZuS1NTcG1jaFpPVHFTbzE1YlJIcGVZREpySEo5bzgzZW1N?=
 =?utf-8?B?WmRkNFZiTmxWUFFjcStZdXdJdTZsRi9XbTZzWThTRjZVa2lmQkhieTY5elNS?=
 =?utf-8?B?aEJqUkM1L2d6M2doVi8weE9kK3g1SFZiN2o4WnZVZDhlTDZPb2N5L2d1L1BN?=
 =?utf-8?B?TzV0VitvVGZYbUxYTzZEZVlGSXBGaERJcWo5U0J4SGV5bCtzanhNRFlrU0FE?=
 =?utf-8?B?WUU3YWNjN3NtbzUwODhuNXphY1JjNVNFeVlDYkkyNVZTOHlwUTJSSTZoQ0x5?=
 =?utf-8?B?RE5oV0JsaVhvY3BqN050b0ZPRVk2OHZtc2dBdk1lOHp2OVZLSVp0TjdzMFZX?=
 =?utf-8?B?Q2Qwc3hEeVFPM0taVDRWSCszQmFmWVZCTldnNGtNZ1lodW5LNkxrcXFCdmM2?=
 =?utf-8?B?MjYzUTd2Z1dvSUtJN1RNK2Z3NlhYMGpvdUdlVmYxWFA4L05jcFRNS2F5SFlH?=
 =?utf-8?B?N2NhcjAzWVJrbnVoMmdQVUVlZi9rWnV1MGVOUVZqRGtmajlBbENmV1dBOUVN?=
 =?utf-8?B?UU1MQlROS2dsWGV1SFBsZE9MNzc1ZUlWT2pweXljRWpjNkxnYVB3WmNPR0t0?=
 =?utf-8?B?K2lBMGM4OUo1NDRHalpXenFsQnVxNEpYMzEwaXpscGVBVGR5a3ZGM0l6UEo3?=
 =?utf-8?B?VnNtN0pkYm5MeHY0WUl0c2ZreDRxRzBBWEV0blVUQStiVDhOK21UQllmcnls?=
 =?utf-8?B?Rm8wTWp2WjBvOUd0V0dCRmxNMGllQmxuZlYvMUplY1hQSlB2ZlZMcDNRNHo5?=
 =?utf-8?B?ZkUwMWNMVFhMSVozd0ZlTDQ4VXM2VXRNbVRGZS8renU4RGhDb1V1a2UvcGdq?=
 =?utf-8?B?a3k0UVorM1V1ZzFjN0dybmJEeC9udmZyZnJpNSsrRUJsWmZscStHekRQQ0Jn?=
 =?utf-8?B?RTA0ZGNaV3BreWxSdGk0eDY1NFZ4QUQxZ0U4SGpaQWhzR2ZMN3pBdzlsUXN6?=
 =?utf-8?B?VG1zeDJvVE5LMnozd3haS0MxV2htS3dMTldydCtmZ2hkaDBLVFpYMnB2WWN6?=
 =?utf-8?B?aWcwNlFKYURoWG90b3NnbExMVTJ0YisrRVFTbjMxQ1hCOFFBc2VPTmFWZ2po?=
 =?utf-8?B?cFlqR0dIYXErQTk1ZlNrb1ovdnhrWVBVYjRPRENpR3JESnJ2UXRvMTk2UXA1?=
 =?utf-8?B?c3JYQTdpNHdSNk5wR1Jyb0ovb3gzZWtzWTZaczlqNjAwVnY2T20yTG5qclNh?=
 =?utf-8?B?cjBRUlhXRWdhSW40c2ZTdGIxVUh5a3ZqZTJmalVVV3hKRXlHazdtWk1nVnYx?=
 =?utf-8?B?TVZQNjVjVzM3ZnEyc2pueDZoMHBhMiszcytFWkhLYm1VYndDbVRWM1N3bVhr?=
 =?utf-8?B?dXpIbi9mblF0QVExYXdKVUEzLzN1eDhTSllkNkV0eXo3bmpkUWlFZFJXZVQw?=
 =?utf-8?Q?7mu6y5pFDZL6KjdM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8E90783CE6184408A256FC05B9F2CB2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d9ac21-3f0c-48e1-c74f-08de8eb63f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 23:44:13.3505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TevItMy4JBGa2tecqpW8rBGSepSz+aKAT+QmSCDyQ7XK9IEnj0ESgQ7Fzpmk+/jKqhhaXYRWuX+/wV9paWH1VOOPkxozORTo/pc6VVyxKJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9638
X-purgate-ID: tlsNG-c201ff/1774914258-83347488-95163E5E/0/0
X-purgate-type: clean
X-purgate-size: 8926
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.894];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C40A36266E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQpNeWtvbGEgS3ZhY2ggPHhha2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyaXRl
czoNCg0KPiBIaSBWb2xvZHlteXIsDQo+DQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4N
Cj4gT24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgNDo0MuKAr1BNIFZvbG9keW15ciBCYWJjaHVrDQo+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgTXlrb2xhLA0K
Pj4NCj4+IE15a29sYSBLdmFjaCA8eGFrZXAuYW1hdG9wQGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4N
Cj4+ID4gRnJvbTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+PiA+DQo+
PiA+IFJlcGxhY2UgdGhlIHBlci1xdWlyayBpbml0IGNhbGxiYWNrIHdpdGggZGVjbGFyYXRpdmUg
ZmxhZ3MgaW4NCj4+ID4gc3RydWN0IGl0c19xdWlyaywgYW5kIGludHJvZHVjZSBnaWN2M19pdHNf
Y29sbGVjdF9xdWlya3MoKSB0byBnYXRoZXINCj4+ID4gdGhlIGVmZmVjdGl2ZSB3b3JrYXJvdW5k
IGZsYWdzIGZyb20gYm90aCB0aGUgSUlEUi1tYXRjaGVkIHF1aXJrIGVudHJ5DQo+PiA+IGFuZCB0
aGUgImRtYS1ub25jb2hlcmVudCIgZGV2aWNlLXRyZWUgcHJvcGVydHkuDQo+PiA+DQo+PiA+IFRo
aXMgbGV0cyBub24tY29oZXJlbnQgcGxhdGZvcm1zIGZvcmNlIG5vbi1jYWNoZWFibGUgSVRTIHRh
YmxlDQo+PiA+IGF0dHJpYnV0ZXMgZXZlbiB3aGVuIG5vIElJRFIgcXVpcmsgZW50cnkgbWF0Y2hl
cy4NCj4+ID4NCj4+ID4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hA
ZXBhbS5jb20+DQo+PiA+IC0tLQ0KPj4gPiAgeGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYyB8IDcw
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPj4gPg0KPj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYyBiL3hlbi9hcmNoL2FybS9naWMtdjMt
aXRzLmMNCj4+ID4gaW5kZXggOWJhMDY4YzQ2Zi4uMDA1MjRiNDNhMyAxMDA2NDQNCj4+ID4gLS0t
IGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZ2lj
LXYzLWl0cy5jDQo+PiA+IEBAIC01Nyw3MSArNTcsODcgQEAgc3RydWN0IGl0c19kZXZpY2Ugew0K
Pj4gPiAgICovDQo+PiA+ICBzdHJ1Y3QgaXRzX3F1aXJrIHsNCj4+ID4gICAgICBjb25zdCBjaGFy
ICpkZXNjOw0KPj4gPiAtICAgIGJvb2wgKCppbml0KShzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cyk7
DQo+PiA+ICAgICAgdWludDMyX3QgaWlkcjsNCj4+ID4gICAgICB1aW50MzJfdCBtYXNrOw0KPj4g
PiArICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gPiAgfTsNCj4+ID4NCj4+ID4gIHN0YXRpYyB1aW50
MzJfdCBfX3JvX2FmdGVyX2luaXQgaXRzX3F1aXJrX2ZsYWdzOw0KPj4gPg0KPj4gPiAtc3RhdGlj
IGJvb2wgZ2ljdjNfaXRzX2VuYWJsZV9xdWlya19nZW40KHN0cnVjdCBob3N0X2l0cyAqaHdfaXRz
KQ0KPj4gPiAtew0KPj4gPiAtICAgIGl0c19xdWlya19mbGFncyB8PSBIT1NUX0lUU19XT1JLQVJP
VU5EX05DX05TIHwNCj4+ID4gLSAgICAgICAgSE9TVF9JVFNfV09SS0FST1VORF8zMkJJVF9BRERS
Ow0KPj4gPiAtDQo+PiA+IC0gICAgcmV0dXJuIHRydWU7DQo+PiA+IC19DQo+PiA+IC0NCj4+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrIGl0c19xdWlya3NbXSA9IHsNCj4+ID4gICAg
ICB7DQo+PiA+IC0gICAgICAgIC5kZXNjICAgICAgICA9ICJSLUNhciBHZW40IiwNCj4+ID4gLSAg
ICAgICAgLmlpZHIgICAgICAgID0gMHgwMjAxNzQzYiwNCj4+ID4gLSAgICAgICAgLm1hc2sgICAg
ICAgID0gMHhmZmZmZmZmZlUsDQo+PiA+IC0gICAgICAgIC5pbml0ICAgICAgICA9IGdpY3YzX2l0
c19lbmFibGVfcXVpcmtfZ2VuNCwNCj4+ID4gKyAgICAgICAgLmRlc2MgID0gIlItQ2FyIEdlbjQi
LA0KPj4gPiArICAgICAgICAuaWlkciAgPSAweDAyMDE3NDNiLA0KPj4gPiArICAgICAgICAubWFz
ayAgPSAweGZmZmZmZmZmVSwNCj4+ID4gKyAgICAgICAgLmZsYWdzID0gSE9TVF9JVFNfV09SS0FS
T1VORF9OQ19OUyB8DQo+PiA+ICsgICAgICAgICAgICAgICAgIEhPU1RfSVRTX1dPUktBUk9VTkRf
MzJCSVRfQUREUiwNCj4+ID4gICAgICB9LA0KPj4gPiAgICAgIHsNCj4+ID4gICAgICAgICAgLyog
U2VudGluZWwuICovDQo+PiA+ICAgICAgfQ0KPj4gPiAgfTsNCj4+ID4NCj4+ID4gLXN0YXRpYyBz
dHJ1Y3QgaXRzX3F1aXJrKiBnaWN2M19pdHNfZmluZF9xdWlyayh1aW50MzJfdCBpaWRyKQ0KPj4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBpdHNfcXVpcmsgKmdpY3YzX2l0c19maW5kX3F1aXJrKHVp
bnQzMl90IGlpZHIpDQo+PiA+ICB7DQo+PiA+IC0gICAgY29uc3Qgc3RydWN0IGl0c19xdWlyayAq
cXVpcmtzID0gaXRzX3F1aXJrczsNCj4+ID4gKyAgICBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrICpx
dWlyayA9IGl0c19xdWlya3M7DQo+PiA+DQo+PiA+IC0gICAgZm9yICggOyBxdWlya3MtPmRlc2M7
IHF1aXJrcysrICkNCj4+ID4gKyAgICBmb3IgKCA7IHF1aXJrLT5kZXNjOyBxdWlyaysrICkNCj4+
ID4gICAgICB7DQo+PiA+IC0gICAgICAgIGlmICggcXVpcmtzLT5paWRyID09IChxdWlya3MtPm1h
c2sgJiBpaWRyKSApDQo+PiA+IC0gICAgICAgICAgICByZXR1cm4gKHN0cnVjdCBpdHNfcXVpcmsg
KilxdWlya3M7DQo+PiA+ICsgICAgICAgIGlmICggcXVpcmstPmlpZHIgIT0gKHF1aXJrLT5tYXNr
ICYgaWlkcikgKQ0KPj4gPiArICAgICAgICAgICAgY29udGludWU7DQo+PiA+ICsNCj4+ID4gKyAg
ICAgICAgcmV0dXJuIHF1aXJrOw0KPj4gPiAgICAgIH0NCj4+ID4NCj4+ID4gICAgICByZXR1cm4g
TlVMTDsNCj4+ID4gIH0NCj4+ID4NCj4+ID4gLXN0YXRpYyB2b2lkIGdpY3YzX2l0c19lbmFibGVf
cXVpcmtzKHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzKQ0KPj4gPiArc3RhdGljIHVpbnQzMl90IGdp
Y3YzX2l0c19jb2xsZWN0X3F1aXJrcyhjb25zdCBzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cywNCj4+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGl0c19xdWlyayAqKm1hdGNoZWRfcXVpcmspDQo+PiA+ICB7DQo+PiA+ICsgICAgY29uc3Qgc3Ry
dWN0IGl0c19xdWlyayAqcXVpcms7DQo+PiA+ICsgICAgdWludDMyX3QgZmxhZ3MgPSAwOw0KPj4g
PiAgICAgIHVpbnQzMl90IGlpZHIgPSByZWFkbF9yZWxheGVkKGh3X2l0cy0+aXRzX2Jhc2UgKyBH
SVRTX0lJRFIpOw0KPj4gPiAtICAgIGNvbnN0IHN0cnVjdCBpdHNfcXVpcmsgKnF1aXJrID0gZ2lj
djNfaXRzX2ZpbmRfcXVpcmsoaWlkcik7DQo+PiA+DQo+PiA+IC0gICAgaWYgKCBxdWlyayAmJiBx
dWlyay0+aW5pdChod19pdHMpICkNCj4+ID4gKyAgICBxdWlyayA9IGdpY3YzX2l0c19maW5kX3F1
aXJrKGlpZHIpOw0KPj4gPiArICAgIGlmICggcXVpcmsgKQ0KPj4gPiArICAgICAgICBmbGFncyB8
PSBxdWlyay0+ZmxhZ3M7DQo+PiA+ICsNCj4+ID4gKyAgICBpZiAoIGh3X2l0cy0+ZHRfbm9kZSAm
Jg0KPj4gPiArICAgICAgICAgZHRfcHJvcGVydHlfcmVhZF9ib29sKGh3X2l0cy0+ZHRfbm9kZSwg
ImRtYS1ub25jb2hlcmVudCIpICkNCj4+ID4gKyAgICAgICAgZmxhZ3MgfD0gSE9TVF9JVFNfV09S
S0FST1VORF9OQ19OUzsNCj4+ID4gKw0KPj4gPiArICAgIGlmICggbWF0Y2hlZF9xdWlyayApDQo+
PiA+ICsgICAgICAgICptYXRjaGVkX3F1aXJrID0gcXVpcms7DQo+PiA+ICsNCj4+ID4gKyAgICBy
ZXR1cm4gZmxhZ3M7DQo+PiA+ICt9DQo+PiA+ICsNCj4+ID4gK3N0YXRpYyB2b2lkIGdpY3YzX2l0
c19lbmFibGVfcXVpcmtzKHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzKQ0KPj4gPiArew0KPj4gPiAr
ICAgIGNvbnN0IHN0cnVjdCBpdHNfcXVpcmsgKnF1aXJrOw0KPj4gPiArDQo+PiA+ICsgICAgaXRz
X3F1aXJrX2ZsYWdzID0gZ2ljdjNfaXRzX2NvbGxlY3RfcXVpcmtzKGh3X2l0cywgJnF1aXJrKTsN
Cj4+ID4gKw0KPj4gPiArICAgIGlmICggcXVpcmsgKQ0KPj4gPiAgICAgICAgICBwcmludGsoIkdJ
Q3YzOiBlbmFibGluZyB3b3JrYXJvdW5kIGZvciBJVFM6ICVzXG4iLCBxdWlyay0+ZGVzYyk7DQo+
PiA+ICB9DQo+PiA+DQo+PiA+ICBzdGF0aWMgdm9pZCBnaWN2M19pdHNfdmFsaWRhdGVfcXVpcmtz
KHZvaWQpDQo+PiA+ICB7DQo+PiA+IC0gICAgY29uc3Qgc3RydWN0IGl0c19xdWlyayAqcXVpcmsg
PSBOVUxMLCAqcHJldiA9IE5VTEw7DQo+PiA+ICsgICAgdWludDMyX3QgcXVpcmtzLCBwcmV2X3F1
aXJrczsNCj4+ID4gICAgICBjb25zdCBzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0czsNCj4+ID4NCj4+
ID4gICAgICBpZiAoIGxpc3RfZW1wdHkoJmhvc3RfaXRzX2xpc3QpICkNCj4+ID4gICAgICAgICAg
cmV0dXJuOw0KPj4gPg0KPj4gPiAgICAgIGh3X2l0cyA9IGxpc3RfZmlyc3RfZW50cnkoJmhvc3Rf
aXRzX2xpc3QsIHN0cnVjdCBob3N0X2l0cywgZW50cnkpOw0KPj4gPiAtICAgIHByZXYgPSBnaWN2
M19pdHNfZmluZF9xdWlyayhyZWFkbF9yZWxheGVkKGh3X2l0cy0+aXRzX2Jhc2UgKyBHSVRTX0lJ
RFIpKTsNCj4+ID4gKyAgICBwcmV2X3F1aXJrcyA9IGdpY3YzX2l0c19jb2xsZWN0X3F1aXJrcyho
d19pdHMsIE5VTEwpOw0KPj4gPg0KPj4gPiAtICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoaHdfaXRz
LCAmaG9zdF9pdHNfbGlzdCwgZW50cnkpDQo+PiA+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9j
b250aW51ZShod19pdHMsICZob3N0X2l0c19saXN0LCBlbnRyeSkNCj4+ID4gICAgICB7DQo+PiA+
IC0gICAgICAgIHF1aXJrID0gZ2ljdjNfaXRzX2ZpbmRfcXVpcmsocmVhZGxfcmVsYXhlZChod19p
dHMtPml0c19iYXNlICsgR0lUU19JSURSKSk7DQo+PiA+IC0gICAgICAgIEJVR19PTihxdWlyayAh
PSBwcmV2KTsNCj4+ID4gLSAgICAgICAgcHJldiA9IHF1aXJrOw0KPj4gPiArICAgICAgICBxdWly
a3MgPSBnaWN2M19pdHNfY29sbGVjdF9xdWlya3MoaHdfaXRzLCBOVUxMKTsNCj4+ID4gKyAgICAg
ICAgQlVHX09OKHF1aXJrcyAhPSBwcmV2X3F1aXJrcyk7DQo+Pg0KPj4gSSBrbm93IGl0IHdhcyBp
biB0aGUgcHJldmlvdXMgdmVyc2lvbiwgYnV0IGFzIHlvdSBhcmUgYWxyZWFkeSB0b3VjaGluZw0K
Pj4gdGhpcy4uLiBUaGlzIGlzIG5vdCBYZW4gQlVHKCkuIFRoaXMgaXMgYSBwbGF0Zm9ybSBwcm9i
bGVtLiBTbyB5b3UgbmVlZA0KPj4gdG8gcGFuaWMgaGVyZS4gU29tZXRoaW5nIGxpa2UNCj4+DQo+
PiAgaWYgKHF1aXJrcyAhPSBwcmV2X3F1aXJrcykNCj4+ICAgICAgICAgcGFuaWMoIkRpZmZlcmVu
dCBJVFMgaW5zdGFuY2VzIGhhcyBkaWZmZXJlbnQgcXVpcmtzIikNCj4NCj4gQWNrLg0KPg0KPg0K
Pj4NCj4+DQo+PiBBbHNvLCBJIHdhbnQgdG8gcG9pbnQgb3V0IHRoYXQgeW91IGFyZSBub3QgdmFs
aWRhdGluZyAiZG1hLW5vbmNvaGVyZW50Ig0KPj4gcXVpcmsgaGVyZS4gSSBtZWFuLCBzb21lIElU
UyBlbnRyaWVzIGNhbiBoYXZlIHRoaXMgcHJvcGVydHksIHNvbWUgb3RoZXINCj4+IC0gZG9uJ3Qu
IFRoaXMgbWFrZXMgbWUgdGhpbmsgdGhhdCB5b3UgbmVlZCB0byBwcm9tb3RlIHRoaXMNCj4+ICJk
bWEtbm9uY29oZXJlbnQiIHF1aXJrIGZyb20gb3BlbiBjb2RlZCBjaGVjayB0byBhIGBzdHJ1Y3QN
Cj4+IGl0c19xdWlya2AgZW50cnksIHNvIGl0IHdpbGwgYmUgaGFuZGxlZCBpbiBnZW5lcmljIHdh
eS4NCj4NCj4gSnVzdCB0byBjbGFyaWZ5IHlvdXIgcG9pbnQgYWJvdXQgZG1hLW5vbmNvaGVyZW50
Og0KPg0KPiBJbiB0aGUgY3VycmVudCB2ZXJzaW9uIGl0IGlzIGFscmVhZHkgcGFydCBvZiB0aGUg
ZWZmZWN0aXZlIHF1aXJrIHNldCwNCj4gYmVjYXVzZSBnaWN2M19pdHNfdmFsaWRhdGVfcXVpcmtz
KCkgY29tcGFyZXMgdGhlIGZsYWdzIHJldHVybmVkIGJ5DQo+IGdpY3YzX2l0c19jb2xsZWN0X3F1
aXJrcygpLCBhbmQgdGhvc2UgYWxyZWFkeSBpbmNsdWRlIHRoZQ0KPiBkbWEtbm9uY29oZXJlbnQg
RFQgcHJvcGVydHkuDQo+DQo+IFNvIGlzIHlvdXIgY29uY2VybiB0aGF0IERULWRlcml2ZWQgSVRT
IHByb3BlcnRpZXMgc3VjaCBhcw0KPiBkbWEtbm9uY29oZXJlbnQgc2hvdWxkIGFsc28gZ28gdGhy
b3VnaCB0aGUgc2FtZSBjb21tb24gcXVpcmsvY29sbGVjdGlvbg0KPiBwbHVtYmluZyBhcyB0aGUg
b3RoZXIgSVRTIHdvcmthcm91bmQgc291cmNlcywgcmF0aGVyIHRoYW4gYmVpbmcgaGFuZGxlZA0K
PiBhcyBhIHNlcGFyYXRlIG9wZW4tY29kZWQgY2hlY2ssIHNpbWlsYXIgdG8gaG93IExpbnV4IG1v
ZGVscyB0aGlzIFsxXT8NCg0KWWVzLCBleGFjdGx5IHRoaXMuIEkgc2VlIG5vIHBvaW50IGluIGlu
dHJvZHVjaW5nIGdlbmVyaWMgcHJlZGljYXRlDQpmdW5jdGlvbiBhbmQgdGhlbiBub3QgdXNpbmcg
aXQuIFRoaXMgd2lsbCBjb25mdXNlIGFueW9uZSB3aG8gdHJpZXMgdG8NCnJlYWQgdGhlIGNvZGUu
DQoNCi0tIA0KV0JSLCBWb2xvZHlteXI=

