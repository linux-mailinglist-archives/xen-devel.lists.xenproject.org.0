Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB32CA43F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 14:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42055.75606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk61X-0006pl-TL; Tue, 01 Dec 2020 13:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42055.75606; Tue, 01 Dec 2020 13:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk61X-0006pM-Pb; Tue, 01 Dec 2020 13:48:55 +0000
Received: by outflank-mailman (input) for mailman id 42055;
 Tue, 01 Dec 2020 13:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk61W-0006pH-L3
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 13:48:54 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 890a6b1c-f0c2-477b-88ed-b924eddcc14f;
 Tue, 01 Dec 2020 13:48:53 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1Dioac007084; Tue, 1 Dec 2020 13:48:52 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 353epur14m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 13:48:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4884.eurprd03.prod.outlook.com (2603:10a6:208:fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Tue, 1 Dec
 2020 13:48:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 13:48:46 +0000
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
X-Inumbo-ID: 890a6b1c-f0c2-477b-88ed-b924eddcc14f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5r26GqoT/BWE7hXoNw5hmYxjkvCv3Gq1ARlO6rvqL5XsKlfbIunfrY5llz6/j/1VwfERSvmxff0lMbRVf9yrFetIkST3qukVbQDmZhtAQaArAPYqVym9+9pq66L2WTtD/Y/zo/QIlYSUYIGrO/7UR++nsDZdVl0ZCwr0+G5hzR8+3FIlMR6n66yjyMaI8FsiaxzpHiNgRy3FhgxuzBUY6eu2D1q47QvvEm8x5M3WUm4icCGJ26whD4reuhMAK8XyUI2WcczpXVZorhkSa4VVz36kNjrn2N7Zta+tcufWYBrvdVKff+MClH9E/b+jNTPxNuL3opNiPRY+04tKwSaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wokN+bPcvXguk4xKfunrLZTNdt8u6aBsRhNNulVtlGA=;
 b=hlmswT9KUoux5lRZFA7dqCFfFrOhPsmBDPAnl2Ep1WH4cVRCLo1kFnERQxe1Pwo/cSQZqWrKBNinFg/1tQQlSMviJSxPpEfpFIwg4nsV3eu5plLMihEXt83gdRkmrTBAvpeEnqRJkZ1zZP7tPRxqkdopKF3m9u7+Ov4xqXrQ4lgNT+uhepSLJoBOtGp9sDfqGzYb/omhXkl82JLrVtzpIpYFyOREH82w5jsKLAVYGL8YREQUZinFRh4bZaHtWRboTdheo5pWlDc5/WWNPjy7we9kzcMcWdSPl+dTJ3dUeEqMcws0BgkbPQorUHU/GNjg4LJTnEpKYYr3Zio0/wSW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wokN+bPcvXguk4xKfunrLZTNdt8u6aBsRhNNulVtlGA=;
 b=sEOyGxkeKh66H1BreSmdsF1JC1kr86PPzXm8b48IpzLkX7jVb3T1ef68iJTPl/eGJHI1qnIesCv6KJucIFwVR8NG+bM2iBp/JFoDyl6iHAM8QwZLdHBK66b69AP3Z3Ap5ZT7lK3Jpzd57wh2bjsbCo8Z8wpjx9z+S+YvC05cUsqcfyubTzUzuhuBLOAzNmAmJNdNFkpVnfhFKpxZm4VZUf2Vx8pK/HS7nsjuDRJJ9Sg6I2NAgTQnswBxI2bpQ958+QH9Sm2EsDROv1ToV8RY9wQhzw7Py/c+DeDcrFh3/ZUuMPQ7IhOhOHoIGnQfTi/ii5Nat6njaLWUd0AlJQ9O6g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v4 08/23] libxl: generalise 'driver_path' xenstore access
 functions in libxl_pci.c
Thread-Topic: [PATCH v4 08/23] libxl: generalise 'driver_path' xenstore access
 functions in libxl_pci.c
Thread-Index: AQHWx+iwPYPJcGuC/0eTe1W0s2JAOQ==
Date: Tue, 1 Dec 2020 13:48:46 +0000
Message-ID: <3584ee50-914b-0652-4cce-0facb8092b18@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-9-paul@xen.org>
In-Reply-To: <20201124080159.11912-9-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88871e0d-dbcb-48e6-8dfc-08d895ffd34e
x-ms-traffictypediagnostic: AM0PR03MB4884:
x-microsoft-antispam-prvs: 
 <AM0PR03MB48842C0F8886D9A7BD4D2732E7F40@AM0PR03MB4884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yywao/3RITp2FLtE05fmfdutQSe3BfmgmrZ0HALjymZLABH9xoEA8wXoOdwMwPHTk5BOfh4TZ4E8hKzoFGoK2CHR69DtHZgMea7hComIlknuoAuK0isR0C7ZyrRTV4IhjuBRt4R1FolvrLdsVgBJEm4YiuC0v52DhNBRLpmCth0mwyzq26P0ODt2syC9Tcn6YfpeY47GACWqmZ+gO+jgnAQSx3c95nHNbqHyc4TffsHWmjxp2Aw/85+Fo/2EoC87oxKQZhR6Bpy8kmnwlSSoQDKNnNgX4xGFTNYaQWD3s4vlrPDunL4+ik0h7dsK/H9U708t6rzIr+Mew1DrSLCw7Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(66446008)(2616005)(83380400001)(76116006)(31696002)(6512007)(66946007)(478600001)(66556008)(31686004)(66476007)(64756008)(71200400001)(186003)(53546011)(36756003)(6506007)(86362001)(8936002)(2906002)(26005)(316002)(4326008)(5660300002)(6486002)(8676002)(54906003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?cDREa1N6ODc2SHh3dm9yTFJjT3BrRGhYT0ZjK1pmcWRjakIwOU5oNWpIVGJD?=
 =?utf-8?B?NWM5U1hQMHh0VDhoRXc5Yy9xL2lKOUhhdHJqWTNMRXh2K01hUUZZZHZMdXdt?=
 =?utf-8?B?M2xmcGRqNWRZSjlEUVkvR29iT2V5YmtLNTltOFVxaXpZQnBzallUbGgwK0Vj?=
 =?utf-8?B?MlBiclhwMG1MdkxoaGVhd1dKdkNBM3M4VllwOWgzUzRxSkV0NERqRHVYZUly?=
 =?utf-8?B?ckI5eTlUb1J0cnRlYTk1WVM2dC9yNjFRTUR5THo3ckJFem1YV1RPVk1FUDAw?=
 =?utf-8?B?U0Q2aC96VEpNaDdsYVdXWHRoL292SmVxNnNCdWxudWtudmZycjNUNzE4TVph?=
 =?utf-8?B?TVdCSmxENzBWYVE5bkNsNnpZUGJKQlRtdEhOVjF1TUlTNUpQd1ptUmpORHdu?=
 =?utf-8?B?UEE3UjlTK0I4eTRzb3EwbVVObWJCbHNhR1NjQ0Y1MVM0Qk90NDc2UlMvR3FV?=
 =?utf-8?B?NmRUZTRoZmtWdi9neFJKbE0xdVRrMGRONDJLOUtNUm82OWQyb3k1dWp4eGo0?=
 =?utf-8?B?S1o0a0J4aUlBODlmTGZoQnR3bU9oQlVXckFES1puNFp1VlA0Q0lWRVZEMHNI?=
 =?utf-8?B?bUtBYWVlNW1mM29ZSWZqTy95cUNXbnJkTkRGSTh4UWU5NkY4UGRVSXlsbUo0?=
 =?utf-8?B?RXVwNWd5YVNiNC9Ld2NVZmMveHU3LzBnR29NN2VPdjhvM2hrZ3poQkQxWUU1?=
 =?utf-8?B?MVZPQjRrSWZxTktJZ295bVhBdXRmMU9VY1lycjJGUzNESXJaSGhRKy9PM0hs?=
 =?utf-8?B?a2ZKYnRSbEUwZ3VvRi8zRFZHOFRwTjg5dWFmVmVMU24zcGpnYklQVVJ5U2JG?=
 =?utf-8?B?eDEzS2VLNVBYdS9XTnpoWFl5amllZllCaFVxM00zWkNGTE10UENBOXFqVytm?=
 =?utf-8?B?WlYxZmxQOUJvdnBPc2Z1TllGRW5zT1BIQ3dtRzVMMGNFbDZLWnh2ekJMSHYy?=
 =?utf-8?B?VUZjRGlTYjk1c05HTnAyY0lrdnQ2dDE3REgwZnVvR29zTm9vSUhKT3Q1RXpn?=
 =?utf-8?B?TnA5SURMS2FwelpVK0lLeDFyRVdWL1BIODgzOWF2dkJpYVY4NlpVRmdsZWMr?=
 =?utf-8?B?VnRDcndLQzJWZHZ5akxwYTlqZUwycFhtSi9YVFkwd2pTMXJ5UmJZbkdYelMv?=
 =?utf-8?B?OHVpa0FZbm9SS3RMc3RSeVRUSHMybDVpemY0TzFzZUFBTFJaV2o2bU1jL1Fv?=
 =?utf-8?B?SEx6dXlmaURWck1sYTdGQjMvbkIybC9FdVVyeit2YjhUbXVmemdkVTlzbk5X?=
 =?utf-8?B?SlJHWHZqYTVQSXhITHBteno5T0orZm1Za2xTbFZqU3JINnRyYTNGK0JiT2Yy?=
 =?utf-8?Q?MguC1jGgZQjLGElA6fE6IaIvLmQb5UgrfC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A02BE9FEC78EF942873AB28FE7385F70@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88871e0d-dbcb-48e6-8dfc-08d895ffd34e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 13:48:46.6548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gd1Pqoe8qv3C4Q28muoOEhF4oG46U69dwkBQAmijR0P8Nu2CoPm12qC3v4Z6x8fVNo/szBWUtkPWbojjD+/nVmrObQjZRuuYpZ0LsrrO4gAJ0wqI4VEMDY73l2uN6sH8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4884
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_05:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010089

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gRm9yIHRoZSBw
dXJwb3NlcyBvZiByZS1iaW5kaW5nIGEgZGV2aWNlIHRvIGl0cyBwcmV2aW91cyBkcml2ZXINCj4g
bGlieGxfX2RldmljZV9wY2lfYXNzaWduYWJsZV9hZGQoKSB3cml0ZXMgdGhlIGRyaXZlciBwYXRo
IGludG8geGVuc3RvcmUuDQo+IFRoaXMgcGF0aCBpcyB0aGVuIHJlYWQgYmFjayBpbiBsaWJ4bF9f
ZGV2aWNlX3BjaV9hc3NpZ25hYmxlX3JlbW92ZSgpLg0KPg0KPiBUaGUgZnVuY3Rpb25zIHRoYXQg
c3VwcG9ydCB0aGlzIHdyaXRpbmcgdG8gYW5kIHJlYWRpbmcgZnJvbSB4ZW5zdG9yZSBhcmUNCj4g
Y3VycmVudGx5IGRlZGljYXRlZCBmb3IgdGhpcyBwdXJwb3NlIGFuZCBoZW5jZSB0aGUgbm9kZSBu
YW1lICdkcml2ZXJfcGF0aCcNCj4gaXMgaGFyZC1jb2RlZC4gVGhpcyBwYXRjaCBnZW5lcmFsaXpl
cyB0aGVzZSB1dGlsaXR5IGZ1bmN0aW9ucyBhbmQgcGFzc2VzDQo+ICdkcml2ZXJfcGF0aCcgYXMg
YW4gYXJndW1lbnQuIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGludm9rZSB0aGVtIHRvDQo+IGFj
Y2VzcyBvdGhlciBub2Rlcy4NCj4NCj4gTk9URTogQmVjYXVzZSBmdW5jdGlvbnMgd2lsbCBoYXZl
IGEgYnJvYWRlciB1c2UgKG90aGVyIHRoYW4gc3RvcmluZyBhDQo+ICAgICAgICBkcml2ZXIgcGF0
aCBpbiBsaWV1IG9mIHBjaWJhY2spIHRoZSBiYXNlIHhlbnN0b3JlIHBhdGggaXMgYWxzbw0KPiAg
ICAgICAgY2hhbmdlZCBmcm9tICcvbGlieGwvcGNpYmFjaycgdG8gJy9saWJ4bC9wY2knLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNClJl
dmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+DQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQoNCj4gLS0tDQo+IENjOiBJ
YW4gSmFja3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4NCj4gLS0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyB8IDY2ICsrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMN
Cj4gaW5kZXggNzdlZGQyNzM0NS4uYTVkNWQyZTc4YiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9wY2kuYw0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5j
DQo+IEBAIC03MzcsNDggKzczNyw0NiBAQCBzdGF0aWMgaW50IHBjaWJhY2tfZGV2X3VuYXNzaWdu
KGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RldmljZV9wY2kgKnBjaSkNCj4gICAgICAgcmV0dXJuIDA7
DQo+ICAgfQ0KPiAgIA0KPiAtI2RlZmluZSBQQ0lCQUNLX0lORk9fUEFUSCAiL2xpYnhsL3BjaWJh
Y2siDQo+ICsjZGVmaW5lIFBDSV9JTkZPX1BBVEggIi9saWJ4bC9wY2kiDQo+ICAgDQo+IC1zdGF0
aWMgdm9pZCBwY2lfYXNzaWduYWJsZV9kcml2ZXJfcGF0aF93cml0ZShsaWJ4bF9fZ2MgKmdjLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZp
Y2VfcGNpICpwY2ksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNoYXIgKmRyaXZlcl9wYXRoKQ0KPiArc3RhdGljIGNoYXIgKnBjaV9pbmZvX3hzX3BhdGgo
bGlieGxfX2djICpnYywgbGlieGxfZGV2aWNlX3BjaSAqcGNpLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbm9kZSkNCj4gICB7DQo+IC0gICAgY2hhciAqcGF0
aDsNCj4gKyAgICByZXR1cm4gbm9kZSA/DQo+ICsgICAgICAgIEdDU1BSSU5URihQQ0lfSU5GT19Q
QVRIIi8iUENJX0JERl9YU1BBVEgiLyVzIiwNCj4gKyAgICAgICAgICAgICAgICAgIHBjaS0+ZG9t
YWluLCBwY2ktPmJ1cywgcGNpLT5kZXYsIHBjaS0+ZnVuYywNCj4gKyAgICAgICAgICAgICAgICAg
IG5vZGUpIDoNCj4gKyAgICAgICAgR0NTUFJJTlRGKFBDSV9JTkZPX1BBVEgiLyJQQ0lfQkRGX1hT
UEFUSCwNCj4gKyAgICAgICAgICAgICAgICAgIHBjaS0+ZG9tYWluLCBwY2ktPmJ1cywgcGNpLT5k
ZXYsIHBjaS0+ZnVuYyk7DQo+ICt9DQo+ICsNCj4gKw0KPiArc3RhdGljIHZvaWQgcGNpX2luZm9f
eHNfd3JpdGUobGlieGxfX2djICpnYywgbGlieGxfZGV2aWNlX3BjaSAqcGNpLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbm9kZSwgY29uc3QgY2hhciAqdmFs
KQ0KPiArew0KPiArICAgIGNoYXIgKnBhdGggPSBwY2lfaW5mb194c19wYXRoKGdjLCBwY2ksIG5v
ZGUpOw0KPiAgIA0KPiAtICAgIHBhdGggPSBHQ1NQUklOVEYoUENJQkFDS19JTkZPX1BBVEgiLyJQ
Q0lfQkRGX1hTUEFUSCIvZHJpdmVyX3BhdGgiLA0KPiAtICAgICAgICAgICAgICAgICAgICAgcGNp
LT5kb21haW4sDQo+IC0gICAgICAgICAgICAgICAgICAgICBwY2ktPmJ1cywNCj4gLSAgICAgICAg
ICAgICAgICAgICAgIHBjaS0+ZGV2LA0KPiAtICAgICAgICAgICAgICAgICAgICAgcGNpLT5mdW5j
KTsNCj4gLSAgICBpZiAoIGxpYnhsX194c19wcmludGYoZ2MsIFhCVF9OVUxMLCBwYXRoLCAiJXMi
LCBkcml2ZXJfcGF0aCkgPCAwICkgew0KPiAtICAgICAgICBMT0dFKFdBUk4sICJXcml0ZSBvZiAl
cyB0byBub2RlICVzIGZhaWxlZC4iLCBkcml2ZXJfcGF0aCwgcGF0aCk7DQo+ICsgICAgaWYgKCBs
aWJ4bF9feHNfcHJpbnRmKGdjLCBYQlRfTlVMTCwgcGF0aCwgIiVzIiwgdmFsKSA8IDAgKSB7DQo+
ICsgICAgICAgIExPR0UoV0FSTiwgIldyaXRlIG9mICVzIHRvIG5vZGUgJXMgZmFpbGVkLiIsIHZh
bCwgcGF0aCk7DQo+ICAgICAgIH0NCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgY2hhciAqIHBjaV9h
c3NpZ25hYmxlX2RyaXZlcl9wYXRoX3JlYWQobGlieGxfX2djICpnYywNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfcGNpICpwY2kp
DQo+ICtzdGF0aWMgY2hhciAqcGNpX2luZm9feHNfcmVhZChsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9k
ZXZpY2VfcGNpICpwY2ksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBj
aGFyICpub2RlKQ0KPiAgIHsNCj4gLSAgICByZXR1cm4gbGlieGxfX3hzX3JlYWQoZ2MsIFhCVF9O
VUxMLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBHQ1NQUklOVEYoDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICBQQ0lCQUNLX0lORk9fUEFUSCAiLyIgUENJX0JERl9YU1BBVEgg
Ii9kcml2ZXJfcGF0aCIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBwY2ktPmRvbWFp
biwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLA0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGNpLT5kZXYsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBwY2ktPmZ1bmMpKTsNCj4gKyAgICBjaGFyICpwYXRoID0gcGNpX2luZm9feHNfcGF0aChnYywg
cGNpLCBub2RlKTsNCj4gKw0KPiArICAgIHJldHVybiBsaWJ4bF9feHNfcmVhZChnYywgWEJUX05V
TEwsIHBhdGgpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIHBjaV9hc3NpZ25hYmxlX2Ry
aXZlcl9wYXRoX3JlbW92ZShsaWJ4bF9fZ2MgKmdjLA0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaSkNCj4gK3N0YXRp
YyB2b2lkIHBjaV9pbmZvX3hzX3JlbW92ZShsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9kZXZpY2VfcGNp
ICpwY2ksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbm9k
ZSkNCj4gICB7DQo+ICsgICAgY2hhciAqcGF0aCA9IHBjaV9pbmZvX3hzX3BhdGgoZ2MsIHBjaSwg
bm9kZSk7DQo+ICAgICAgIGxpYnhsX2N0eCAqY3R4ID0gbGlieGxfX2djX293bmVyKGdjKTsNCj4g
ICANCj4gICAgICAgLyogUmVtb3ZlIHRoZSB4ZW5zdG9yZSBlbnRyeSAqLw0KPiAtICAgIHhzX3Jt
KGN0eC0+eHNoLCBYQlRfTlVMTCwNCj4gLSAgICAgICAgICBHQ1NQUklOVEYoUENJQkFDS19JTkZP
X1BBVEggIi8iIFBDSV9CREZfWFNQQVRILA0KPiAtICAgICAgICAgICAgICAgICAgICBwY2ktPmRv
bWFpbiwNCj4gLSAgICAgICAgICAgICAgICAgICAgcGNpLT5idXMsDQo+IC0gICAgICAgICAgICAg
ICAgICAgIHBjaS0+ZGV2LA0KPiAtICAgICAgICAgICAgICAgICAgICBwY2ktPmZ1bmMpICk7DQo+
ICsgICAgeHNfcm0oY3R4LT54c2gsIFhCVF9OVUxMLCBwYXRoKTsNCj4gICB9DQo+ICAgDQo+ICAg
c3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3BjaV9hc3NpZ25hYmxlX2FkZChsaWJ4bF9fZ2MgKmdj
LA0KPiBAQCAtODI0LDkgKzgyMiw5IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RldmljZV9wY2lfYXNz
aWduYWJsZV9hZGQobGlieGxfX2djICpnYywNCj4gICAgICAgLyogU3RvcmUgZHJpdmVyX3BhdGgg
Zm9yIHJlYmluZGluZyB0byBkb20wICovDQo+ICAgICAgIGlmICggcmViaW5kICkgew0KPiAgICAg
ICAgICAgaWYgKCBkcml2ZXJfcGF0aCApIHsNCj4gLSAgICAgICAgICAgIHBjaV9hc3NpZ25hYmxl
X2RyaXZlcl9wYXRoX3dyaXRlKGdjLCBwY2ksIGRyaXZlcl9wYXRoKTsNCj4gKyAgICAgICAgICAg
IHBjaV9pbmZvX3hzX3dyaXRlKGdjLCBwY2ksICJkcml2ZXJfcGF0aCIsIGRyaXZlcl9wYXRoKTsN
Cj4gICAgICAgICAgIH0gZWxzZSBpZiAoIChkcml2ZXJfcGF0aCA9DQo+IC0gICAgICAgICAgICAg
ICAgICAgICBwY2lfYXNzaWduYWJsZV9kcml2ZXJfcGF0aF9yZWFkKGdjLCBwY2kpKSAhPSBOVUxM
ICkgew0KPiArICAgICAgICAgICAgICAgICAgICAgcGNpX2luZm9feHNfcmVhZChnYywgcGNpLCAi
ZHJpdmVyX3BhdGgiKSkgIT0gTlVMTCApIHsNCj4gICAgICAgICAgICAgICBMT0coSU5GTywgUENJ
X0JERiIgbm90IGJvdW5kIHRvIGEgZHJpdmVyLCB3aWxsIGJlIHJlYm91bmQgdG8gJXMiLA0KPiAg
ICAgICAgICAgICAgICAgICBkb20sIGJ1cywgZGV2LCBmdW5jLCBkcml2ZXJfcGF0aCk7DQo+ICAg
ICAgICAgICB9IGVsc2Ugew0KPiBAQCAtODM0LDcgKzgzMiw3IEBAIHN0YXRpYyBpbnQgbGlieGxf
X2RldmljZV9wY2lfYXNzaWduYWJsZV9hZGQobGlieGxfX2djICpnYywNCj4gICAgICAgICAgICAg
ICAgICAgZG9tLCBidXMsIGRldiwgZnVuYyk7DQo+ICAgICAgICAgICB9DQo+ICAgICAgIH0gZWxz
ZSB7DQo+IC0gICAgICAgIHBjaV9hc3NpZ25hYmxlX2RyaXZlcl9wYXRoX3JlbW92ZShnYywgcGNp
KTsNCj4gKyAgICAgICAgcGNpX2luZm9feHNfcmVtb3ZlKGdjLCBwY2ksICJkcml2ZXJfcGF0aCIp
Ow0KPiAgICAgICB9DQo+ICAgDQo+ICAgICAgIGlmICggcGNpYmFja19kZXZfYXNzaWduKGdjLCBw
Y2kpICkgew0KPiBAQCAtODg0LDcgKzg4Miw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RldmljZV9w
Y2lfYXNzaWduYWJsZV9yZW1vdmUobGlieGxfX2djICpnYywNCj4gICAgICAgfQ0KPiAgIA0KPiAg
ICAgICAvKiBSZWJpbmQgaWYgbmVjZXNzYXJ5ICovDQo+IC0gICAgZHJpdmVyX3BhdGggPSBwY2lf
YXNzaWduYWJsZV9kcml2ZXJfcGF0aF9yZWFkKGdjLCBwY2kpOw0KPiArICAgIGRyaXZlcl9wYXRo
ID0gcGNpX2luZm9feHNfcmVhZChnYywgcGNpLCAiZHJpdmVyX3BhdGgiKTsNCj4gICANCj4gICAg
ICAgaWYgKCBkcml2ZXJfcGF0aCApIHsNCj4gICAgICAgICAgIGlmICggcmViaW5kICkgew0KPiBA
QCAtODk3LDcgKzg5NSw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RldmljZV9wY2lfYXNzaWduYWJs
ZV9yZW1vdmUobGlieGxfX2djICpnYywNCj4gICAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOw0K
PiAgICAgICAgICAgICAgIH0NCj4gICANCj4gLSAgICAgICAgICAgIHBjaV9hc3NpZ25hYmxlX2Ry
aXZlcl9wYXRoX3JlbW92ZShnYywgcGNpKTsNCj4gKyAgICAgICAgICAgIHBjaV9pbmZvX3hzX3Jl
bW92ZShnYywgcGNpLCAiZHJpdmVyX3BhdGgiKTsNCj4gICAgICAgICAgIH0NCj4gICAgICAgfSBl
bHNlIHsNCj4gICAgICAgICAgIGlmICggcmViaW5kICkgew==

