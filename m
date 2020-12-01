Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52C2CA2BA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 13:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41923.75453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4px-0007Ov-77; Tue, 01 Dec 2020 12:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41923.75453; Tue, 01 Dec 2020 12:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4px-0007OW-3Z; Tue, 01 Dec 2020 12:32:53 +0000
Received: by outflank-mailman (input) for mailman id 41923;
 Tue, 01 Dec 2020 12:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk4pv-0007OR-M7
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 12:32:51 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d6ace77-3758-4537-a20d-98aaf16088cd;
 Tue, 01 Dec 2020 12:32:50 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1CTdQX022284; Tue, 1 Dec 2020 12:32:48 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 355k5tgjem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 12:32:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3217.eurprd03.prod.outlook.com (2603:10a6:208:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 12:32:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 12:32:46 +0000
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
X-Inumbo-ID: 8d6ace77-3758-4537-a20d-98aaf16088cd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B17hIosFLe0HwpqDQ+0H/xMqDuk78BHFTYxx4NywcTn3LsZAloEFMZbZKKkCfWYLW6/7IZA9TN7rY7n1/APu1hK4fZR/dPxa4+DbBUgXw0s/0FAtPIr/xbj/hJkbzRd1JYWYXDCSO6Lt41MpYt8MSyNAAVcqMDicoFjUASTugLP4ebNzhg+2iCkxModN50lZ9qnyPvQGOY6JPxL+FHg0xTUi706pvqTh1madpffyF0Nr04Plabgqxqj29tH+fHsUZA2EZ2FzqxYmGoK974oc8NzK3wLNBOq7EP8EIpVeffZuuuawOh4uPdfl9CJqGzoFovl5x8b+RByE+07Zh8ispQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmlGrHfd9YgnaTOvCWi0PlJMwGuxD/a8aU+wUUro3gk=;
 b=P9UbpNwcOgCkxS9/fIX0boTv41phvAdA92HNcWMGgZAoWR3MHOxlBfLhXbjBHNsun86MP+iUxCMq6Ynq3P2IBpQ6jhBKLSuJmSw61UHY5xlCOV4I0zTU0upTzTKI0rfu8X0nuNq3136409sR7BNfW7Q0NH1+/woOx65heJMpwlZEQNH2s5/eEBkzKI7qxLjpNCJGGU1VzGvSz+4IMn3ocRYenHGK2i3G8O19ydBgevt0ib4rjiMmxcBWGqW8SQDjbbu0YiheAQeA8QpvntBHyGvFfOZcl4r6Y7qQ6jXjQAOP52mb9kG0ZHBoytq0nKEdB7Sb8Rrka6MRb39K3bOKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmlGrHfd9YgnaTOvCWi0PlJMwGuxD/a8aU+wUUro3gk=;
 b=qnF+Qss8DrTN9XkJQA0CegT8fxVUl7BFLlwXsH7bQw58WUJD63DyScz+u3ztPvmdpRSNCuT1AoUbn6gHAfCoZJc4XDT+u64bgyspqmqbunbmqFbj9QwvcI3BAycHOEGOmhmdbRMyzROxR/u+ditHvmpMQnr8Ur1EH8aJJDmxvOXH/bNeryKrxpcl7jCuaNbtZbaoVXXkkAhxDMmpf+orht3s5ReUs7ro6dI6oWeKWMuZqW0Wl/ovZQY48Ger4Ku596Dt5XFZMu5lvQtHP6GPtO5441L6K9wXARBj9T3BMB4Mu37tnmli5gxCJZFHYbsgQQEohdSv6PN8yQiFRmKb4w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 01/23] xl / libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
Thread-Topic: [PATCH v4 01/23] xl / libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
Thread-Index: AQHWx94RQn6N+bgvwE2dBHmo2TdzxQ==
Date: Tue, 1 Dec 2020 12:32:46 +0000
Message-ID: <43e4db29-744e-89b6-462d-b6d129fdcb08@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-2-paul@xen.org>
In-Reply-To: <20201124080159.11912-2-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 773a59e1-cde0-40f5-8e7b-08d895f534fe
x-ms-traffictypediagnostic: AM0PR0302MB3217:
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3217C1B8405CFD2034359BCAE7F40@AM0PR0302MB3217.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KXb4LfuOF+D/EYSOmRZ3gDxgv4IYx84wb8kRqlAZ6GcaOJjmjlZetYj2ylyV/X+MKDpLjQpWiYuQeeg6ub4p0gIkafVWS5PR4vI5NVLmra78wtxyofv9tw3WUSk8ly0fzxQQojaxhWBdg5RA7foOwF79YvY4Y5psdfbVreAW92lepOn7uPe22I1hbShENgLW3xY3q6imeJurytc0ijCggGonfUyKe0aocrga7+YiBTFvlofwCvN/g5l+6WMojIGj/g0OLWwvs7lKX2gHiwx82hEjrkCfxC11LbTGUHYH+2VSthJKIBYrpmccHqXsugu94NGHCNz574r6WS4lA8jDKA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6486002)(53546011)(6506007)(31686004)(110136005)(54906003)(316002)(2906002)(36756003)(26005)(4326008)(6512007)(8936002)(186003)(66946007)(86362001)(478600001)(2616005)(8676002)(31696002)(5660300002)(66476007)(76116006)(66446008)(64756008)(83380400001)(71200400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aldpNVA4Vyt0WHFrS1N3NHFWNUlXdEJSMDBiTmlaUHNuU21GZjN6bUEyTmZC?=
 =?utf-8?B?MFhRV1FNTTZocWJpU00wSmd4OHhGc0NJeUVKT3JPTWcvRnQrMFd3MXBiWFgw?=
 =?utf-8?B?RFNUUm5rZ1NuU3NrQk90SkFRZEhTRzIvbmZGRXhPY0ZZK2RmL1kvRUJHRkIv?=
 =?utf-8?B?c29xWHRqUTRpdndYU3A0dXEvRHZCNTMxR09admxBRUZSQlduZmd6Szh2SU9a?=
 =?utf-8?B?bjV1cnJ3czg3ZkR4dGxqUmttVDVPbXJXZHc5UUhpQ3o3TmxPaGVsODh1cFBR?=
 =?utf-8?B?VTg5MnFsaDNZWlpMbUVoYU44dVN6elRQbWRjRmxYRGM4QVJUdnZEMzNMSmJK?=
 =?utf-8?B?QXFrUlpTdHlSY0x3MFpPNzQxZVE1bllQak1NMXhXcXczcmRUc0I0eDZDQ0hp?=
 =?utf-8?B?Y3dmZ3JoQnFPb3loQTNybGN3S1liL2pWZEN2dGVCNTVXb0xScGRWYmk1enhH?=
 =?utf-8?B?MUV5akdIaXhiSW1QMDV1ZC92Vk5BampZdnJsS3RNZWhrUjEzam00Mjh5Y3dP?=
 =?utf-8?B?dTBFUHB3TkpZT0g1TkFVNkwzREYzYml5eFcweERZSldDTzF0RzkvSDJqVEpY?=
 =?utf-8?B?eGdiUkwyTlk1TVZkd094K0daMUFzRmhFNERyWnRQZFpiTmVuSitWa3c0NGNp?=
 =?utf-8?B?VFRVMkhicWp0RjJnSnovZDdZa1lkRnNHL2xIT2NSU2dJYkdkck9yTklUL2Vy?=
 =?utf-8?B?dVZLNTRxcUVmWXJYNEhtTm1mRVpQSFd5NE9oZXlPajNkOFM5RUV5V3JjNlI3?=
 =?utf-8?B?WEYvTWJpZVpLVWdRUzhQQWlFc1dwMjV4K1BZeUQ2REZCWFJwLzFuWjl3cnVk?=
 =?utf-8?B?eldsY1Z2WlRma3BrWmJ2ZHdoMUlhVUxkdWp0UXRIOC9xTmxSODRIUXVuWHZI?=
 =?utf-8?B?SDdWTHc2WEJML0s4aEZXSlFaWlZVMlZaSnA5RDREcnZ6dVZYZXBSdllVbmJs?=
 =?utf-8?B?Wi9reVF6WERFeWZSLzE1UEk4cW9wQ3h0OGF0K0tCSWIyYTh5ZVRNTythaFNi?=
 =?utf-8?B?bUV0b1hmL1prRHpWNkVOdm82WVpHemxFdytOU3ZmVzREZzFKR3dhTVlzTXFO?=
 =?utf-8?B?LzVhd0lJU0lId2JwSFlaMjAyNUdoRTcwVU9ZRUVIekUySzdvR012OTBXUWVa?=
 =?utf-8?B?QXlCb0ZlUC9VR1Z2Q3dxeHFIQ1Uxd3czekpQVjY3QlVySml0QzhZdFQ0clQw?=
 =?utf-8?B?VEljREpHMU5sSmU4WGNHQlVaSzZZMnU5OTdUUWFkVjd3ZDY4V296Zm1pbHk4?=
 =?utf-8?B?RVJ4aFJrck5XUTZVYU1pN2pFWEN0WndicHUvNHNPU2FLbWpwWEVlL1ZTNElj?=
 =?utf-8?Q?/6FUaJ3Tx4XBfEt1s5Bgst5qgubECfYmNC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AF413306DF9C44089371DC299E559F7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773a59e1-cde0-40f5-8e7b-08d895f534fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 12:32:46.0364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bvKWrh3i/ruDoMRujomRicnmsLpEBbF8/1/A/is1SOMXVzSchnSdZDJXe8jzvzBCoUF1w4YZGIxMciLXBDhzLyBSWjxJmINARfDB0P+fxcE6OxqTnSHhzM/3eDdp9hQF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3217
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_04:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010081

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gVGhlIHNlZW1p
bmdseSBhcmJpdHJhcnkgdXNlIG9mICdwY2knIGFuZCAncGNpZGV2JyBpbiB0aGUgY29kZSBpbiBs
aWJ4bF9wY2kuYw0KPiBpcyBjb25mdXNpbmcgYW5kIGFsc28gY29tcHJvbWlzZXMgdXNlIG9mIHNv
bWUgbWFjcm9zIHVzZWQgZm9yIG90aGVyIGRldmljZQ0KPiB0eXBlcy4gSW5kZWVkIGl0IHNlZW1z
IHRoYXQgREVGSU5FX0RFVklDRV9UWVBFX1NUUlVDVF9YIGV4aXN0cyBzb2xlbHkgYmVjYXVzZQ0K
PiBvZiB0aGlzIGR1YWxpdHkuDQo+DQo+IFRoaXMgcGF0Y2ggcHVyZ2VzIHVzZSBvZiAncGNpZGV2
JyBmcm9tIHRoZSBsaWJ4bCBjb2RlLCBhbGxvd2luZyBldmFsdWF0aW9uIG9mDQo+IERFRklORV9E
RVZJQ0VfVFlQRV9TVFJVQ1RfWCB0byBiZSByZXBsYWNlZCB3aXRoIERFRklORV9ERVZJQ0VfVFlQ
RV9TVFJVQ1QsDQo+IGhlbmNlIGFsbG93aW5nIHJlbW92YWwgb2YgdGhlIGZvcm1lci4NCj4NCj4g
Rm9yIGNvbnNpc3RlbmN5IHRoZSB4bCBhbmQgbGlicy91dGlsIGNvZGUgaXMgYWxzbyBtb2RpZmll
ZCwgYnV0IGluIHRoaXMgY2FzZQ0KPiBpdCBpcyBwdXJlbHkgY29zbWV0aWMuDQo+DQo+IE5PVEU6
IFNvbWUgb2YgdGhlIG1vcmUgZ3Jvc3MgZm9ybWF0dGluZyBlcnJvcnMgKHN1Y2ggYXMgbGFjayBv
ZiBzcGFjZXMgYWZ0ZXINCj4gICAgICAgIGtleXdvcmRzKSB0aGF0IGNhbWUgaW50byBjb250ZXh0
IGhhdmUgYmVlbiBmaXhlZCBpbiBsaWJ4bF9wY2kuYy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiAtLS0NCj4gQ2M6IElhbiBKYWNrc29u
IDxpd2pAeGVucHJvamVjdC5vcmc+DQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBDYzog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgIHRv
b2xzL2luY2x1ZGUvbGlieGwuaCAgICAgICAgICAgICB8ICAxNyArLQ0KPiAgIHRvb2xzL2xpYnMv
bGlnaHQvbGlieGxfY3JlYXRlLmMgICB8ICAgNiArLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGli
eGxfZG0uYyAgICAgICB8ICAxOCArLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfaW50ZXJu
YWwuaCB8ICA0NSArKy0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jICAgICAgfCA1
ODIgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICB0b29scy9saWJz
L2xpZ2h0L2xpYnhsX3R5cGVzLmlkbCAgfCAgIDIgKy0NCj4gICB0b29scy9saWJzL3V0aWwvbGli
eGx1X3BjaS5jICAgICAgfCAgMzYgKy0tDQo+ICAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAg
ICAgICAgIHwgIDI4ICstDQo+ICAgdG9vbHMveGwveGxfcGNpLmMgICAgICAgICAgICAgICAgIHwg
IDY4ICsrLS0tDQo+ICAgdG9vbHMveGwveGxfc3hwLmMgICAgICAgICAgICAgICAgIHwgIDEyICst
DQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwgNDA5IGluc2VydGlvbnMoKyksIDQwNSBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbGlieGwuaCBiL3Rvb2xzL2luY2x1
ZGUvbGlieGwuaA0KPiBpbmRleCAxZWE1YjRmNDQ2Li5mYmU0YzgxYmE1IDEwMDY0NA0KPiAtLS0g
YS90b29scy9pbmNsdWRlL2xpYnhsLmgNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS9saWJ4bC5oDQo+
IEBAIC00NDUsNiArNDQ1LDEzIEBADQo+ICAgI2RlZmluZSBMSUJYTF9IQVZFX0RJU0tfU0FGRV9S
RU1PVkUgMQ0KPiAgIA0KW3NuaXBdDQo+IC0vKiBTY2FuIHRocm91Z2ggL3N5cy8uLi4vcGNpYmFj
ay9zbG90cyBsb29raW5nIGZvciBwY2lkZXYncyBCREYgKi8NCj4gLXN0YXRpYyBpbnQgcGNpYmFj
a19kZXZfaGFzX3Nsb3QobGlieGxfX2djICpnYywgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KQ0K
PiArLyogU2NhbiB0aHJvdWdoIC9zeXMvLi4uL3BjaWJhY2svc2xvdHMgbG9va2luZyBmb3IgcGNp
J3MgQkRGICovDQo+ICtzdGF0aWMgaW50IHBjaWJhY2tfZGV2X2hhc19zbG90KGxpYnhsX19nYyAq
Z2MsIGxpYnhsX2RldmljZV9wY2kgKnBjaSkNCj4gICB7DQo+ICAgICAgIEZJTEUgKmY7DQo+ICAg
ICAgIGludCByYyA9IDA7DQo+IEBAIC02MzUsMTEgKzYzNSwxMSBAQCBzdGF0aWMgaW50IHBjaWJh
Y2tfZGV2X2hhc19zbG90KGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldikN
Cj4gICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPiAgICAgICB9DQo+ICAgDQo+IC0gICAg
d2hpbGUoZnNjYW5mKGYsICIleDoleDoleC4lZFxuIiwgJmRvbSwgJmJ1cywgJmRldiwgJmZ1bmMp
PT00KSB7DQo+IC0gICAgICAgIGlmKGRvbSA9PSBwY2lkZXYtPmRvbWFpbg0KPiAtICAgICAgICAg
ICAmJiBidXMgPT0gcGNpZGV2LT5idXMNCj4gLSAgICAgICAgICAgJiYgZGV2ID09IHBjaWRldi0+
ZGV2DQo+IC0gICAgICAgICAgICYmIGZ1bmMgPT0gcGNpZGV2LT5mdW5jKSB7DQo+ICsgICAgd2hp
bGUgKGZzY2FuZihmLCAiJXg6JXg6JXguJWRcbiIsICZkb20sICZidXMsICZkZXYsICZmdW5jKT09
NCkgew0KU28sIHRoZW4geW91IGNhbiBwcm9iYWJseSBwdXQgc3BhY2VzIGFyb3VuZCAiNCIgaWYg
dG91Y2hpbmcgdGhpcyBsaW5lDQo+ICsgICAgICAgIGlmIChkb20gPT0gcGNpLT5kb21haW4NCj4g
KyAgICAgICAgICAgICYmIGJ1cyA9PSBwY2ktPmJ1cw0KPiArICAgICAgICAgICAgJiYgZGV2ID09
IHBjaS0+ZGV2DQo+ICsgICAgICAgICAgICAmJiBmdW5jID09IHBjaS0+ZnVuYykgew0KPiAgICAg
ICAgICAgICAgIHJjID0gMTsNCj4gICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gICAgICAgICAg
IH0NCj4gQEAgLTY0OSw3ICs2NDksNyBAQCBvdXQ6DQo+ICAgICAgIHJldHVybiByYzsNCj4gICB9
DQo+ICAgDQoNClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

