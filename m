Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D02CA6CF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 16:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42164.75818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7PS-0008Mv-Jn; Tue, 01 Dec 2020 15:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42164.75818; Tue, 01 Dec 2020 15:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk7PS-0008MW-GW; Tue, 01 Dec 2020 15:17:42 +0000
Received: by outflank-mailman (input) for mailman id 42164;
 Tue, 01 Dec 2020 15:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk7PR-0008Ln-3D
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 15:17:41 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1745e2f-162b-4d21-8b1c-ea6f4ed8ce2b;
 Tue, 01 Dec 2020 15:17:40 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1FG3vq031500; Tue, 1 Dec 2020 15:17:36 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 355q3mgctr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 15:17:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4305.eurprd03.prod.outlook.com (2603:10a6:208:c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 15:17:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 15:17:33 +0000
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
X-Inumbo-ID: f1745e2f-162b-4d21-8b1c-ea6f4ed8ce2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjCzCyFXBVNdrgP/GmxHq5IT53g256WQTH2C9R3SnsAanIcFRl6O//8/+iwES6pH4FOmhPXP/5Z34lcPnphExF1hoAaXo80rLH7CjtL6a8toQR9BNV0H1TS0reQBoxBZgA664knBpWkdgX0+Shaq6236qsWajKZOuK+eAvTyl7d4zHn+G6+1SN+8hOCQn2bAmWjXqWs1lBCUm14jMEyqkTaNOGa3Mi035aKXB56XqXI9BrNHZbgQA+CyvzECwzdl5m95tTTKbS+KDwg18+LDOaUndE91t9OpTjFjX3jf3040hvBpeS5KBFAg8qe6rx/fJLogXR87yEgqccz/3nVlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5rorWJok3bx4+CjDQu16nOqvt1L2HhYMKH2whDILIQ=;
 b=VdiIQdm3/u6WxD5j51N5t/2o0Ix03egx1hfIBWG6vZ9C5/UlWmDc8nHLw3L8MP1G6PskcAWopT+0Foj2PnkdD7tWj76qDQHaXv6eyUAwPYIxuZO4xnO4OJ13waRBAnZUgzMN/5JGdvBdLbqJxz1FwmZ0Ss8QXm0Lp8hYfHVfmRMGFnry6CHfprhYGPAFEzjgaMrivbVKrKvSKxFDWVoDFxPPpMJbtU0IhLlvC3W1SHrzOiQhG6x7kuSuRS0L6r6d765iulhs9Z8hn1V8IcEzGfoiDL96+k/plOtEuURVwMEYQVoBPk/WPHGmjr8WC+oMrjNRIIUr80c10rrLF3NvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5rorWJok3bx4+CjDQu16nOqvt1L2HhYMKH2whDILIQ=;
 b=XAkcuw1Whdy4JxTcqnueduZ0AbpzT72pOiVns4y/8qxylaIaovWiD2M1+UeihkDVof4KRUc/gjmsTSvAP+M3xDzd6tMil3tffn/SNR6sAzcA+KvaaPiNORGdjg3kpqa8KNJWQsUrmmErYdaGtBbbCX0dvd44JDYG6t9gZEx5gTJAptb1Djxg5X/oLXQq0XTlTkF6RSXAEvsBsHkdyJu9mCo+uwmRVsa1wOZvBYTvdwl1FKz/4HFhPCuYm+MEF5cj4nWkRvrvCJgnTQdewLCw4UoVlkHkd1dgyqXul2BsLFiZ3kaJ6ClIeJ3aWJM6jHGg/FFTd/N9tUiOoskBrL/5sQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>,
        David Scott
	<dave@recoil.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 12/23] libxl: add
 libxl_device_pci_assignable_list_free()...
Thread-Topic: [PATCH v4 12/23] libxl: add
 libxl_device_pci_assignable_list_free()...
Thread-Index: AQHWx/UXQdVidg9hUkmTJ/tMtrHCAA==
Date: Tue, 1 Dec 2020 15:17:33 +0000
Message-ID: <a4135498-f536-a76a-82c3-20f618f7b502@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-13-paul@xen.org>
In-Reply-To: <20201124080159.11912-13-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b03b731-041a-4f61-c052-08d8960c3a1b
x-ms-traffictypediagnostic: AM0PR03MB4305:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4305EB97085F2ABE65ADC5A3E7F40@AM0PR03MB4305.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z7dkVT4P3zPbeQg41QCo9Bbz4O9s8BLcZ9p8z29llh9xvNZbkF9kCVe7kV6rgUZTfSrCMvi2stKLuQmly8a7Y+WwPzvkppnJmIWI6EyWJEj7g2HrfgdgYcEBzKUoXQijlNc2AF4V6+XQ+M5HotM3pvF881tkIbivm08xQP146WZhCLUQfJcXjHrPjqOcgi/GFbGw+8vN3I1xGMr4xBbMGyLW/nTNIhem8f1HvL4syfkKf6KteCf0uMQd8JgQAmaO1jztt8+uPVNWyGRSNxxmJ8He1+kPCxuXH73S5fVaFC2AvfEwMR2dqeq/rzoe+S3dyqespfeaFWR5yHmokQ6zUA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(8936002)(6506007)(498600001)(8676002)(71200400001)(83380400001)(64756008)(26005)(53546011)(6486002)(76116006)(66946007)(186003)(110136005)(66556008)(5660300002)(66446008)(31696002)(2906002)(54906003)(66476007)(2616005)(31686004)(86362001)(36756003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?UnFSRW12VFBsUXZCM2ZxV1BxVHJ3dTF4ZlZjSFBHbFdGNEw2NnVGNmZobkdL?=
 =?utf-8?B?UGxCN3JWRFhjQUE2ODAvNWpkVkU4RGgrSW9qaExhUDR1eTBsVnZkRGx5aWtj?=
 =?utf-8?B?UUNiczI2STZwNUI3NElNRXVZWkhkMWpwTEVHbDZwRG5XUTdNMzUxVnZydnFl?=
 =?utf-8?B?c2xIL0VTbndON0p3WG1JVDRmdnZ1UVRvTEhhajFmTnhCc2VxZ2RTUmJQQkdZ?=
 =?utf-8?B?YXVzMGl6U2hPYzd1SHdBdUpJL2U4c051dXMvTVlQSGJmcXdvL2Y0b3NsSm9s?=
 =?utf-8?B?RkFCS1hMZHI2U1RGbzhKOWpXaSt3VmgwTWN0WS9qMGc0WHhyRzk5VHV5aDYx?=
 =?utf-8?B?aHliK1pUSU1YR0RVVHV6cDRvZE1qL1RXR0hEVU80VytmUldTUDFEeGFPaWJB?=
 =?utf-8?B?b2xQa1Y0QUM2YjVaSnRqTHlBampyNlczcUYyMkpQRnE1UmJTV3JwZEdmOTMv?=
 =?utf-8?B?VWh3elI4NFNLdTlzZGZSSlQ5eDF5aVg1L3IvTEtjeWNNMkhpVWJ1V3d2eEhU?=
 =?utf-8?B?NnVuRng2ZkQzUCtYL2NnM2o2bmNWQlhyWHlwNDl4aURpNWJuS205aW1SQWtN?=
 =?utf-8?B?NVpMc2ZjTXBwMmJ2a2N4SFF0ZWxDcGdlWC9JZWxUUytoU2RhcTM0TXhuZjBz?=
 =?utf-8?B?S2E3Qk1sMjN4VFFucytpcnBYN29Mc1pFWCtyTVNLR3lDeGtieXg1a29Vcmln?=
 =?utf-8?B?dmJTRUI3djllQ1NJU2RoUTdZNTZWOEVjTlRweHYySGxTWTMvbHoyWWc5WHdN?=
 =?utf-8?B?VE5tRXRTcCtZRlNmMnh2eTgzSitrZGxZQVVjWklMMGg4bjU1eC9YRWZsLzRY?=
 =?utf-8?B?STlkaVZNVC9BQ1huSU1RdmEzNm1LS0NoRFhXTll4bUtZT0tnRk13MXVRakFE?=
 =?utf-8?B?d0RuTjJ2NnJSR1lxekZ0RHFXaURFRHUxeXhFS0RmWWp1UnZYU0xDRXFWVkVN?=
 =?utf-8?B?Ym12Z2dkQlgvSzFrZkJWd1NwaC8vTnVPVXBMRkpZdFR0UHZObnlsV1NjbW5v?=
 =?utf-8?B?RG1rR2xGT3h3K1d3d1ZJZllhOG1oTEF2TWxlWmQ2YUdCU1pMRnVGRGVuZVFG?=
 =?utf-8?B?dmRyVWlTbG1TZlFzeDR3NWN5SmRUS2ZveHJCTEdTTFREU25LWkZpSlIwV1J3?=
 =?utf-8?B?OGRFbkNqdkU3WDdqNyt0NzRWTFYwSk0yZGUzSG9TMGhnZkg0aXYxcGJ1SHBE?=
 =?utf-8?B?R1g1N050SFdOT1VXQmU3OUhtL0g5UTJQaDhHTXRFZmNOY2lMc3RaajNhaHZQ?=
 =?utf-8?B?QnBMK1czZ2Rtc3pPV2FiMmh3ZmViUnNpeFQ2V0wrdUc0Y01YQ2k0WFA5UmVN?=
 =?utf-8?Q?RAfz0EZpVcsnGYAvkIUXssZd3ucWi4/IS9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <52A19BCDA4102B4DA5FEEA5BFED035A4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b03b731-041a-4f61-c052-08d8960c3a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 15:17:33.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fDpuwnZcnC+0xf+gc2nl9GRfceik0aer5+NFk2lsOLODXYd5bR/pmMQW8cxJ0D2kS/a+CeejB/tHNFyZo+ewbEFXoejSqKgeClSDHtu8R9TBFIaY7Usku96x+ox2qORX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4305
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_07:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010098

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gLi4uIHRvIGJl
IHVzZWQgYnkgY2FsbGVycyBvZiBsaWJ4bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVfbGlzdCgpLg0K
Pg0KPiBDdXJyZW50bHkgdGhlcmUgaXMgbm8gQVBJIGZvciBjYWxsZXJzIG9mIGxpYnhsX2Rldmlj
ZV9wY2lfYXNzaWduYWJsZV9saXN0KCkNCj4gdG8gZnJlZSB0aGUgbGlzdC4gVGhlIHhsIGZ1bmN0
aW9uIHBjaWFzc2lnbmFibGVfbGlzdCgpIGNhbGxzDQo+IGxpYnhsX2RldmljZV9wY2lfZGlzcG9z
ZSgpIG9uIGVhY2ggZWxlbWVudCBvZiB0aGUgcmV0dXJuZWQgbGlzdCwgYnV0DQo+IGxpYnhsX3Bj
aV9hc3NpZ25hYmxlKCkgaW4gbGlieGxfcGNpLmMgZG9lcyBub3QuIE5laXRoZXIgZG9lcyB0aGUg
aW1wbGVtZW50YXRpb24NCj4gb2YgbGlieGxfZGV2aWNlX3BjaV9hc3NpZ25hYmxlX2xpc3QoKSBj
YWxsIGxpYnhsX2RldmljZV9wY2lfaW5pdCgpLg0KPg0KPiBUaGlzIHBhdGNoIGFkZHMgdGhlIG5l
dyBBUEkgZnVuY3Rpb24sIG1ha2VzIHN1cmUgaXQgaXMgdXNlZCBldmVyeXdoZXJlIGFuZA0KPiBh
bHNvIG1vZGlmaWVzIGxpYnhsX2RldmljZV9wY2lfYXNzaWduYWJsZV9saXN0KCkgdG8gaW5pdGlh
bGl6ZSBsaXN0DQo+IGVudHJpZXMgcmF0aGVyIHRoYW4ganVzdCB6ZXJvaW5nIHRoZW0uDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NClJldmll
d2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+DQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQoNCj4gLS0tDQo+IENjOiBJYW4g
SmFja3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4gQ2M6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4g
Q2M6IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+DQo+IENjOiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvaW5jbHVkZS9saWJ4
bC5oICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKw0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGli
eGxfcGNpLmMgICAgICAgICB8IDE0ICsrKysrKysrKysrKy0tDQo+ICAgdG9vbHMvb2NhbWwvbGli
cy94bC94ZW5saWdodF9zdHVicy5jIHwgIDMgKy0tDQo+ICAgdG9vbHMveGwveGxfcGNpLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKy0tDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9s
aWJ4bC5oIGIvdG9vbHMvaW5jbHVkZS9saWJ4bC5oDQo+IGluZGV4IGVlNTJkM2NmN2UuLjgyMjU4
MDlkOTQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2luY2x1ZGUvbGlieGwuaA0KPiArKysgYi90b29s
cy9pbmNsdWRlL2xpYnhsLmgNCj4gQEAgLTQ1OCw2ICs0NTgsMTIgQEANCj4gICAjZGVmaW5lIExJ
QlhMX0hBVkVfREVWSUNFX1BDSV9MSVNUX0ZSRUUgMQ0KPiAgIA0KPiAgIC8qDQo+ICsgKiBMSUJY
TF9IQVZFX0RFVklDRV9QQ0lfQVNTSUdOQUJMRV9MSVNUX0ZSRUUgaW5kaWNhdGVzIHRoYXQgdGhl
DQo+ICsgKiBsaWJ4bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVfbGlzdF9mcmVlKCkgZnVuY3Rpb24g
aXMgZGVmaW5lZC4NCj4gKyAqLw0KPiArI2RlZmluZSBMSUJYTF9IQVZFX0RFVklDRV9QQ0lfQVNT
SUdOQUJMRV9MSVNUX0ZSRUUgMQ0KPiArDQo+ICsvKg0KPiAgICAqIGxpYnhsIEFCSSBjb21wYXRp
YmlsaXR5DQo+ICAgICoNCj4gICAgKiBUaGUgb25seSBndWFyYW50ZWUgd2hpY2ggbGlieGwgbWFr
ZXMgcmVnYXJkaW5nIEFCSSBjb21wYXRpYmlsaXR5DQo+IEBAIC0yMzY5LDYgKzIzNzUsNyBAQCBp
bnQgbGlieGxfZGV2aWNlX2V2ZW50c19oYW5kbGVyKGxpYnhsX2N0eCAqY3R4LA0KPiAgIGludCBs
aWJ4bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVfYWRkKGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9kZXZp
Y2VfcGNpICpwY2ksIGludCByZWJpbmQpOw0KPiAgIGludCBsaWJ4bF9kZXZpY2VfcGNpX2Fzc2ln
bmFibGVfcmVtb3ZlKGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9kZXZpY2VfcGNpICpwY2ksIGludCBy
ZWJpbmQpOw0KPiAgIGxpYnhsX2RldmljZV9wY2kgKmxpYnhsX2RldmljZV9wY2lfYXNzaWduYWJs
ZV9saXN0KGxpYnhsX2N0eCAqY3R4LCBpbnQgKm51bSk7DQo+ICt2b2lkIGxpYnhsX2RldmljZV9w
Y2lfYXNzaWduYWJsZV9saXN0X2ZyZWUobGlieGxfZGV2aWNlX3BjaSAqbGlzdCwgaW50IG51bSk7
DQo+ICAgDQo+ICAgLyogQ1BVSUQgaGFuZGxpbmcgKi8NCj4gICBpbnQgbGlieGxfY3B1aWRfcGFy
c2VfY29uZmlnKGxpYnhsX2NwdWlkX3BvbGljeV9saXN0ICpjcHVpZCwgY29uc3QgY2hhciogc3Ry
KTsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+IGluZGV4IDBmNDE5MzlkMWYuLjVhMzM1MmMyZWMgMTAw
NjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4gKysrIGIvdG9vbHMv
bGlicy9saWdodC9saWJ4bF9wY2kuYw0KPiBAQCAtNDU3LDcgKzQ1Nyw3IEBAIGxpYnhsX2Rldmlj
ZV9wY2kgKmxpYnhsX2RldmljZV9wY2lfYXNzaWduYWJsZV9saXN0KGxpYnhsX2N0eCAqY3R4LCBp
bnQgKm51bSkNCj4gICAgICAgICAgIHBjaXMgPSBuZXc7DQo+ICAgICAgICAgICBuZXcgPSBwY2lz
ICsgKm51bTsNCj4gICANCj4gLSAgICAgICAgbWVtc2V0KG5ldywgMCwgc2l6ZW9mKCpuZXcpKTsN
Cj4gKyAgICAgICAgbGlieGxfZGV2aWNlX3BjaV9pbml0KG5ldyk7DQo+ICAgICAgICAgICBwY2lf
c3RydWN0X2ZpbGwobmV3LCBkb20sIGJ1cywgZGV2LCBmdW5jLCAwKTsNCj4gICANCj4gICAgICAg
ICAgIGlmIChwY2lfaW5mb194c19yZWFkKGdjLCBuZXcsICJkb21pZCIpKSAvKiBhbHJlYWR5IGFz
c2lnbmVkICovDQo+IEBAIC00NzIsNiArNDcyLDE2IEBAIG91dDoNCj4gICAgICAgcmV0dXJuIHBj
aXM7DQo+ICAgfQ0KPiAgIA0KPiArdm9pZCBsaWJ4bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVfbGlz
dF9mcmVlKGxpYnhsX2RldmljZV9wY2kgKmxpc3QsIGludCBudW0pDQo+ICt7DQo+ICsgICAgaW50
IGk7DQo+ICsNCj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspDQo+ICsgICAgICAgIGxp
YnhsX2RldmljZV9wY2lfZGlzcG9zZSgmbGlzdFtpXSk7DQo+ICsNCj4gKyAgICBmcmVlKGxpc3Qp
Ow0KPiArfQ0KPiArDQo+ICAgLyogVW5iaW5kIGRldmljZSBmcm9tIGl0cyBjdXJyZW50IGRyaXZl
ciwgaWYgYW55LiAgSWYgZHJpdmVyX3BhdGggaXMgbm9uLU5VTEwsDQo+ICAgICogc3RvcmUgdGhl
IHBhdGggdG8gdGhlIG9yaWdpbmFsIGRyaXZlciBpbiBpdC4gKi8NCj4gICBzdGF0aWMgaW50IHN5
c2ZzX2Rldl91bmJpbmQobGlieGxfX2djICpnYywgbGlieGxfZGV2aWNlX3BjaSAqcGNpLA0KPiBA
QCAtMTQ5MCw3ICsxNTAwLDcgQEAgc3RhdGljIGludCBsaWJ4bF9wY2lfYXNzaWduYWJsZShsaWJ4
bF9jdHggKmN0eCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpKQ0KPiAgICAgICAgICAgICAgIHBjaXNb
aV0uZnVuYyA9PSBwY2ktPmZ1bmMpDQo+ICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIH0N
Cj4gLSAgICBmcmVlKHBjaXMpOw0KPiArICAgIGxpYnhsX2RldmljZV9wY2lfYXNzaWduYWJsZV9s
aXN0X2ZyZWUocGNpcywgbnVtKTsNCj4gICAgICAgcmV0dXJuIGkgIT0gbnVtOw0KPiAgIH0NCj4g
ICANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGwveGVubGlnaHRfc3R1YnMuYyBi
L3Rvb2xzL29jYW1sL2xpYnMveGwveGVubGlnaHRfc3R1YnMuYw0KPiBpbmRleCAxMTgxOTcxZGE0
Li4zNTJhMDAxMzRkIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hsL3hlbmxpZ2h0
X3N0dWJzLmMNCj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94bC94ZW5saWdodF9zdHVicy5jDQo+
IEBAIC04OTQsOSArODk0LDggQEAgdmFsdWUgc3R1Yl94bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVf
bGlzdCh2YWx1ZSBjdHgpDQo+ICAgCQlGaWVsZChsaXN0LCAxKSA9IHRlbXA7DQo+ICAgCQl0ZW1w
ID0gbGlzdDsNCj4gICAJCVN0b3JlX2ZpZWxkKGxpc3QsIDAsIFZhbF9kZXZpY2VfcGNpKCZjX2xp
c3RbaV0pKTsNCj4gLQkJbGlieGxfZGV2aWNlX3BjaV9kaXNwb3NlKCZjX2xpc3RbaV0pOw0KPiAg
IAl9DQo+IC0JZnJlZShjX2xpc3QpOw0KPiArCWxpYnhsX2RldmljZV9wY2lfYXNzaWduYWJsZV9s
aXN0X2ZyZWUoY19saXN0LCBuYik7DQo+ICAgDQo+ICAgCUNBTUxyZXR1cm4obGlzdCk7DQo+ICAg
fQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGNpLmMgYi90b29scy94bC94bF9wY2kuYw0K
PiBpbmRleCA3YzBmMTAyYWM3Li5mNzE0OThjYmI1IDEwMDY0NA0KPiAtLS0gYS90b29scy94bC94
bF9wY2kuYw0KPiArKysgYi90b29scy94bC94bF9wY2kuYw0KPiBAQCAtMTY0LDkgKzE2NCw4IEBA
IHN0YXRpYyB2b2lkIHBjaWFzc2lnbmFibGVfbGlzdCh2b2lkKQ0KPiAgICAgICBmb3IgKGkgPSAw
OyBpIDwgbnVtOyBpKyspIHsNCj4gICAgICAgICAgIHByaW50ZigiJTA0eDolMDJ4OiUwMnguJTAx
eFxuIiwNCj4gICAgICAgICAgICAgICAgICBwY2lzW2ldLmRvbWFpbiwgcGNpc1tpXS5idXMsIHBj
aXNbaV0uZGV2LCBwY2lzW2ldLmZ1bmMpOw0KPiAtICAgICAgICBsaWJ4bF9kZXZpY2VfcGNpX2Rp
c3Bvc2UoJnBjaXNbaV0pOw0KPiAgICAgICB9DQo+IC0gICAgZnJlZShwY2lzKTsNCj4gKyAgICBs
aWJ4bF9kZXZpY2VfcGNpX2Fzc2lnbmFibGVfbGlzdF9mcmVlKHBjaXMsIG51bSk7DQo+ICAgfQ0K
PiAgIA0KPiAgIGludCBtYWluX3BjaWFzc2lnbmFibGVfbGlzdChpbnQgYXJnYywgY2hhciAqKmFy
Z3Yp

