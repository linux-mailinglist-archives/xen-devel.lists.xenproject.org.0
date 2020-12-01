Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED32CA451
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 14:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42063.75618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk64R-0007k1-GO; Tue, 01 Dec 2020 13:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42063.75618; Tue, 01 Dec 2020 13:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk64R-0007jc-DA; Tue, 01 Dec 2020 13:51:55 +0000
Received: by outflank-mailman (input) for mailman id 42063;
 Tue, 01 Dec 2020 13:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk64P-0007jX-GI
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 13:51:53 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bf253aa-426b-42ff-a0e8-2b1874e7a7e3;
 Tue, 01 Dec 2020 13:51:52 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1DkAAk022156; Tue, 1 Dec 2020 13:51:51 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 by mx0a-0039f301.pphosted.com with ESMTP id 355h93s8h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 13:51:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4754.eurprd03.prod.outlook.com (2603:10a6:208:cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 13:51:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 13:51:44 +0000
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
X-Inumbo-ID: 2bf253aa-426b-42ff-a0e8-2b1874e7a7e3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCOD3VQvecmyZ+jjaTMENwYLljYQm4sgm+tlMPmOoMpibBZTeXNy5BbHjSVQax/BA9OfMyRQtFuMqwa7JdGZtC0olbXq6B6sF31MlJECD+n8P/H6sDKwxQc9oDCJrORjhKhVP9Xstj9q9Prd1Yqcyu3KVJ2vVjUv6RhDPacKSiLMqYOlUk+iq0C+FJ4cZUVLD7I80eNAxYUBm9fm1wf9zv3I5+y3TPhKVHoIiKWrxs4TCBR+g559dOfpLO0dnYXnjycEtfFfjW1LCYv258PLckMs17pHZLh47BVgB4NY5py8YYIc77z7bVKaO/rzydf83knASv7DuqB6FL/M5jE7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7qEdFB+pb+3svKUzZSDr8+LbJ22z5hJ/xL4rLhctZU=;
 b=JkcnQ1MODOtSNuke69c3Pu5Idya7TgW7Z4bh3VmU+h4K4O3AoFGB2JLxWj9iRcC/GUAj0e8mS09DW6zyWa2/gZgTHN5QXDsYMFB+2Wyfjjv/fzDnhvf4Chkqkra64BFdhVRYgST8xnfz9tFZ1qyI+tPS7Khs+WKlBwodl2T8mMhXPUdp1+U42xFQbv/AmqF7J3J1wnYz1hna9T+/mVe6CxWHWdo7rmqYAT053x4Sn6dZcSZkZoeLYXfEX6wjczoKtg8r/AcY8jGgtj22ZigNbkPrKoylt+k26uCtA2DUVyqgj6okPujG93rRikgmz010pGiZmusYqvcEdwjThDcgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7qEdFB+pb+3svKUzZSDr8+LbJ22z5hJ/xL4rLhctZU=;
 b=QsBDEdNPuSqC5noyD2yJs6AhGHTpzNUZs24hgOHFz8vHS/ZUAD3jkeqYe3P3khOvWYTQTdCvJ70QsF1AIf+yjD91Fj52+TV9KdioIOz4LsFNVrWIGnXXTAf/xUvsZ0aKh+eLTiq2kCx44hOqkHnnlM3mTwDy7Fpy900zuDthTUZso0i7lbAUyd+xu0N7itOgvgMrC6RtOs/mQvRt/WPHQxQj83S0F+evGG02f1mktit3JdFdG37gUGr/2nlDI9go00ZKQKQo0C+7JQ85izdcvZmT2ReYs4UmHSGR4ew4V2c0AoCt5d+DKjds+XM857kc61RbcHx6A4ITymMmWmQ4dQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v4 09/23] libxl: remove unnecessary check from
 libxl__device_pci_add()
Thread-Topic: [PATCH v4 09/23] libxl: remove unnecessary check from
 libxl__device_pci_add()
Thread-Index: AQHWx+kbix++NRxo5UGrslXglzQVrA==
Date: Tue, 1 Dec 2020 13:51:44 +0000
Message-ID: <42fea377-76e7-2315-0868-96d758d9e4fa@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-10-paul@xen.org>
In-Reply-To: <20201124080159.11912-10-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f87d7f3a-253e-4fe4-792c-08d896003d8e
x-ms-traffictypediagnostic: AM0PR03MB4754:
x-microsoft-antispam-prvs: 
 <AM0PR03MB475451D3060EF0B5C02A9E20E7F40@AM0PR03MB4754.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kLC5KqLRjttBfFg8Mwcfr65n/KsFTl5xFzboxHezi3MGJ2u1FwFnD/6nY2cNiMPBkqlVmVsRVDEEcdiqkvF37rzasH6GTLTif9lbjCw+CcA67deVCTAAZ7YC1j9yDKjl9obb5alRW9PcwLB58rXjWLJAsY5BdaDrA6HcqcnPfoU28YWKWCIaxmkRm8r+vCX6PxJ9EWmMO1yD8HLG+1vA19n+jgS6KYxBoXQYtDRydh5bmyiMbM94PQ3/dD+E9XgY0eNKK0ICC9KwoDkNoz4MlG7V9+mrOGyHDZsnueOJKNVghFALjylAs/G9VslGxclAi2uiilGd+tSCqvNRRtHPD3bLUA+2ffpaQ3VpjmQ+SzbqCT2xANxMrCsMLj0gxOnz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(76116006)(31696002)(64756008)(66446008)(66946007)(4326008)(66556008)(66476007)(8936002)(2906002)(5660300002)(8676002)(71200400001)(6486002)(6512007)(2616005)(26005)(478600001)(186003)(83380400001)(6506007)(53546011)(36756003)(86362001)(110136005)(54906003)(31686004)(316002)(101420200001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?WTRlRlRFMTk3TUY3cFBldDh3VlZ3RWY5c1hvZ1ptbmNNL0FJNFNyZmFRckJo?=
 =?utf-8?B?Q0ovckRjR0xqU0EwSG04UEFZeEVnSmR1MVNFTzJXaklkWDZWcGZNUXVJRE5v?=
 =?utf-8?B?SHlzWER0OHJtTHBLQUhiYjJ4cnVWdmUvU25PT0p5cEVyLzZoS1NLbmd6VWVo?=
 =?utf-8?B?YjdLbVovZXRnemRzdTJteE92WndaTHkzNEx6NUdUZi9SUXF2cUNWNU5vajJj?=
 =?utf-8?B?MU1DVCs4QkJsbEhmeG1HWVNPY2xTTEVjVU0rc1BWR1JpVS8yUVN3TWd6akFy?=
 =?utf-8?B?VzcwMDhEa2Y3SGoyeXB0TVlYMDBBWVRJS01OeGRxYzVGVVVPSUQ3OFVsWVRG?=
 =?utf-8?B?aFpGOGUxOGl2Z0d5dTlhTXd1Um1rMTRjRXZ1KzZkVjJ6MlkyV1d6cEsxZzQ3?=
 =?utf-8?B?ejV1ZVlFekJEYjN1SHNkaUF3NzUxWVpoM1JFTFBZTmM2Z20zMVlxVi9vN3o3?=
 =?utf-8?B?cGhrcFJoL1pUSVB3VSswVTVZb0hlS1ZoWUVFeVVQM0tBSjh2NDQ5ckJTUmpx?=
 =?utf-8?B?TkVoS1V0UzhHMUZZOGxVVEhRdXcvZGFQVFpYbVlKYnFtNHNIQXh4TFlkc1dr?=
 =?utf-8?B?U2RhQ1ArTm1IbGxZUDlzVlI3SGJhbzJEenZUR0Zsa3ZzeVF0dmx2NkJ6MXY2?=
 =?utf-8?B?Wld2T3dMekNPcU85a3R2VGhwdlhtRVVOcGJla2RpLzMrM2ZQelc4ZkROVTI3?=
 =?utf-8?B?ZUZzbktER3p1ZkZVbW5ONzh3RC9NelBaVFFadjdkbjFsYXozSG12YzdTaXVh?=
 =?utf-8?B?V2I3Y0VPWnk0eUpBSTU4QWd5SzZvbjIzUXlFYXl4VllnSGxJZ3FuUEEzdUIz?=
 =?utf-8?B?WW0zbHgwcHRQTGZXS3plOFFHbVgyekZwNDBob3lPYksrY1ZET0NMNzlsVTJI?=
 =?utf-8?B?ZzVlQnJsN3hHSGZCcDNMWUJyS3hyZGNtTklqOFI2UkV4TkltQXNqYklDeVZr?=
 =?utf-8?B?a0F2YVJMYlRZeW9LbytHM0h6NjFpZ3QxVE9PSVBHZitndEJpbkdKbUxtWURu?=
 =?utf-8?B?aTZkNDE0ZnZ3Qmd1ekJrUFliNUFCQko2UU56VFU1bTV3TExkTHpVYitQNjZq?=
 =?utf-8?B?Und3VUpETEZrbEpabnY1NFRSR1hXcnFCRlFkY0dtdHpFVnBRK0VNRzA4d3pp?=
 =?utf-8?B?QytpMEU0VStjakk5NlNsNEpndmo3RDdZaitoV01hOGIwMDJRQ0F5MDJnY212?=
 =?utf-8?B?bHZoQjhZTjlvSXRPSVBPRFU4NjZla3g1ZFJPOFBWVEFkZ1hBMFJIaWtNbDY1?=
 =?utf-8?B?WDVkU1VSc0tTK1FxNlFMWU5WbERibjdDN1paai9sMkJ0N0JRdFRIRDFkWkV3?=
 =?utf-8?Q?1UGengFDN6FvKusxMGpIi9+bss6hThF8Wd?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B66EE5A209296448A04C8494ADC460B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87d7f3a-253e-4fe4-792c-08d896003d8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 13:51:44.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDNN68v1MnsBDiyiDcULsy+/OY0L7zzpalKffq8x0+d7EG73HD6VrYtYvWx5Eu0rBvbM+mowV0w0+6sqFr/ok85knXEhjPhFARqqDeO3G8Q8XHdL8NH/gIsRCM+rL9Yu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4754
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_05:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010089

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gVGhlIGNvZGUg
Y3VycmVudGx5IGNoZWNrcyBleHBsaWNpdGx5IHdoZXRoZXIgdGhlIGRldmljZSBpcyBhbHJlYWR5
IGFzc2lnbmVkLA0KPiBidXQgdGhpcyBpcyBhY3R1YWxseSB1bm5lY2Vzc2FyeSBhcyBhc3NpZ25l
ZCBkZXZpY2VzIGRvIG5vdCBmb3JtIHBhcnQgb2YNCj4gdGhlIGxpc3QgcmV0dXJuZWQgYnkgbGli
eGxfZGV2aWNlX3BjaV9hc3NpZ25hYmxlX2xpc3QoKSBhbmQgaGVuY2UgdGhlDQo+IGxpYnhsX3Bj
aV9hc3NpZ25hYmxlKCkgdGVzdCB3b3VsZCBoYXZlIGFscmVhZHkgZmFpbGVkLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNClJldmlld2Vk
LWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQoNCj4gLS0tDQo+IENjOiBJYW4gSmFj
a3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4g
LS0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyB8IDE2ICstLS0tLS0tLS0tLS0t
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xp
YnMvbGlnaHQvbGlieGxfcGNpLmMNCj4gaW5kZXggYTVkNWQyZTc4Yi4uZWMxMDFmMjU1ZiAxMDA2
NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPiArKysgYi90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+IEBAIC0xNTU1LDggKzE1NTUsNyBAQCB2b2lkIGxpYnhs
X19kZXZpY2VfcGNpX2FkZChsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLA0KPiAgIHsN
Cj4gICAgICAgU1RBVEVfQU9fR0MoYW9kZXYtPmFvKTsNCj4gICAgICAgbGlieGxfY3R4ICpjdHgg
PSBsaWJ4bF9fZ2Nfb3duZXIoZ2MpOw0KPiAtICAgIGxpYnhsX2RldmljZV9wY2kgKmFzc2lnbmVk
Ow0KPiAtICAgIGludCBudW1fYXNzaWduZWQsIHJjOw0KPiArICAgIGludCByYzsNCj4gICAgICAg
aW50IHN0dWJkb21pZCA9IDA7DQo+ICAgICAgIHBjaV9hZGRfc3RhdGUgKnBhczsNCj4gICANCj4g
QEAgLTE1OTUsMTkgKzE1OTQsNiBAQCB2b2lkIGxpYnhsX19kZXZpY2VfcGNpX2FkZChsaWJ4bF9f
ZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICAgICAgZ290byBvdXQ7DQo+ICAgICAg
IH0NCj4gICANCj4gLSAgICByYyA9IGdldF9hbGxfYXNzaWduZWRfZGV2aWNlcyhnYywgJmFzc2ln
bmVkLCAmbnVtX2Fzc2lnbmVkKTsNCj4gLSAgICBpZiAoIHJjICkgew0KPiAtICAgICAgICBMT0dE
KEVSUk9SLCBkb21pZCwNCj4gLSAgICAgICAgICAgICAiY2Fubm90IGRldGVybWluZSBpZiBkZXZp
Y2UgaXMgYXNzaWduZWQsIHJlZnVzaW5nIHRvIGNvbnRpbnVlIik7DQo+IC0gICAgICAgIGdvdG8g
b3V0Ow0KPiAtICAgIH0NCj4gLSAgICBpZiAoIGlzX3BjaV9pbl9hcnJheShhc3NpZ25lZCwgbnVt
X2Fzc2lnbmVkLCBwY2ktPmRvbWFpbiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICBwY2kt
PmJ1cywgcGNpLT5kZXYsIHBjaS0+ZnVuYykgKSB7DQo+IC0gICAgICAgIExPR0QoRVJST1IsIGRv
bWlkLCAiUENJIGRldmljZSBhbHJlYWR5IGF0dGFjaGVkIHRvIGEgZG9tYWluIik7DQo+IC0gICAg
ICAgIHJjID0gRVJST1JfRkFJTDsNCj4gLSAgICAgICAgZ290byBvdXQ7DQo+IC0gICAgfQ0KPiAt
DQo+ICAgICAgIGxpYnhsX19kZXZpY2VfcGNpX3Jlc2V0KGdjLCBwY2ktPmRvbWFpbiwgcGNpLT5i
dXMsIHBjaS0+ZGV2LCBwY2ktPmZ1bmMpOw0KPiAgIA0KPiAgICAgICBzdHViZG9taWQgPSBsaWJ4
bF9nZXRfc3R1YmRvbV9pZChjdHgsIGRvbWlkKTs=

