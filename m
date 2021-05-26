Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B783913AA
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 11:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132421.247005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llppf-000502-S3; Wed, 26 May 2021 09:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132421.247005; Wed, 26 May 2021 09:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llppf-0004xU-Ns; Wed, 26 May 2021 09:28:07 +0000
Received: by outflank-mailman (input) for mailman id 132421;
 Wed, 26 May 2021 09:28:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8HVS=KV=epam.com=prvs=578065f5e4=sergiy_kibrik@srs-us1.protection.inumbo.net>)
 id 1llppd-0004xO-OT
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 09:28:05 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d17c8acb-a437-4d8b-853d-77b250743f15;
 Wed, 26 May 2021 09:28:04 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14Q9P4xf004133; Wed, 26 May 2021 09:28:03 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 38sk9803a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 09:28:02 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::8)
 by AM9PR03MB7009.eurprd03.prod.outlook.com (2603:10a6:20b:286::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 09:28:00 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135]) by AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 09:28:00 +0000
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
X-Inumbo-ID: d17c8acb-a437-4d8b-853d-77b250743f15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5dywmKZw7VnbbuGIocqC1NOHlHG4/BJRXA6PSgS3gFdu4op0czPb/7+FgQLJ6oirWKL7F2SsWbryrJ2XqKqsZLyrqUskXVEBhYW2VSJk9pYFWXUjazUOhO/KBN8BthyziMTKLoQFSXsMYGXCshWgFsnVqdcelS8c/LqFAua5EVNeiKO32SULyRPOu1VsE5wU82DomkXEu5m3X3vqt7Gc9hezNFUI1w1ZY36WtHgJWFP8Bgpfg8JpXOKFnulH8A1FanyT0mO2VaQULLHLI+toKZ82aXOhQ/BGOgP9xWJX74Jupoj5TChaYNZJDeZ9ng/iMqPDK2zh+6a7WiEvCUmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NffypTio3y26g9xeQCvUmpW46XRwRJGf2AwY7Bi4Ho0=;
 b=GSmQxXMEfFBt70wvuP/h1N9m5ok6XCfzTs2G+kGs9egMCeOE3GtMjlaOwC6+yv2eMf7USxhsIKVs9RTDzXqyAMA3kGI5jBGemjdFyCbe1Ype4g/XBaVTiKY+aiRJIp8L7Sf4BnbWebRrMDUE4oC3EBurnJ9QU6Ci0Sh2r8p0FdL32Gwtqa2fDHHZIbspBTM3AYV0zpxA3pmIpnGCiuquXjTUpTbzoLgDma7USCwkZW/TZRJZC2v6kjt4CMxtSHALYXTbFJJxpQ6z8On/yBr2ICSidcu72mEOU4f5NfSL/qlXUg0wq5ACjlI/cbv9WnZoiVlrumitN0YYxim5QBixgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NffypTio3y26g9xeQCvUmpW46XRwRJGf2AwY7Bi4Ho0=;
 b=pB+emSJMWtTDTBS0aWlvaSQB8lNfsZIqZ3XFujwiUOt+1LzevfBUUMlfg0dsdZ/BUSQfO2FoCz6w78pRnG0ZIYQlQEpB5CAqd0iYmor73gvYFhPpCiUN6AgC60GNMAyXYG5E3KQ1ckNkdE9NgJ3gWfxBEz+/GkhxWirWbqeRcwRrxeQABjSqPgxiAIj1R6v0JJydHV23xA3WyYIM4XQ7+x0tnovanDgwElCUZD3DgIyyH9R/TwhIIIoBfY4YMpqgxDCJy7zqZcia1Dqo4eIz6HJnybPXweiWVxirE/e22a2OI/F7uGUU04fcbrAcv2MeNxi/KUYHYMVz/Z7bqlxslQ==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v1] libxl/arm: provide guests with random seed
Thread-Topic: [XEN PATCH v1] libxl/arm: provide guests with random seed
Thread-Index: AQHXUJ0pDoWarWZCUEmrgeaODNENvKr1enfA
Date: Wed, 26 May 2021 09:28:00 +0000
Message-ID: 
 <AM9PR03MB6836B02970F4F1CAEEAEAD78F0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
References: <20210524080057.1773-1-Sergiy_Kibrik@epam.com>
 <a3c51dea-80e5-df92-3757-72809ad96434@xen.org>
In-Reply-To: <a3c51dea-80e5-df92-3757-72809ad96434@xen.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [95.67.114.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08d01ae5-7a1f-4e24-f4be-08d920288e65
x-ms-traffictypediagnostic: AM9PR03MB7009:
x-microsoft-antispam-prvs: 
 <AM9PR03MB7009A0FE67B669AC4F8ED51AF0249@AM9PR03MB7009.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 n83fb/TBZLp2QkIIs7kyDKBkDQv7opa4PGQY0y349hDwlOBN76E2jE1zQzah53fhme6iTa3NKlMZvNQT1HfKpIKEX2uRHH/wJFTX6bLQ75q6esgJo3jmSPEgnsUTtX3jHB4abR7IRsr3/pfEThaykyOqzsTddGZO1ZYXn9hkPYtkDrqbNiiBdLer/yycfqUQ4fDVWnwkh3iTknz82MiAe6OpenAHDnLLI6Ozp0K6MnB6An/FGO+vMIVH5q6AarA5xvk/4u70puhZmJen/m/fKLhdppAXlvBjAXYMIUHMYiUjAnoUGFa5wK/HvBzY4PgbLcECB47aH+y3PyTGya/FIeanbEsapoqBqIhkL1eHW+f1ICNT7Uk7EHzMQRID5koy4O217AKTOE9qPHRH9G2WYIdVxQELEByOhXZxrpDaFjm5TcC7/025HsmsCIRg8hzQJ0vGcAmw9xoqozh1VfYtpaHphH36sdNXWfoClPONiZRsyxa7ONfv0vLFkpkMzwchkGoOs9+dc4px+Z0bWM9gwddW5rMESi4peQPbiX6KOI5rZEg7qIPNU4yIJ8edmX6rLb2L7v3YXT0kEPivo0PW+lJUZWQ6Ci03H7BWG4YMQgE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6836.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(66476007)(66556008)(66446008)(64756008)(2906002)(8676002)(110136005)(83380400001)(54906003)(86362001)(122000001)(55016002)(33656002)(6506007)(7696005)(26005)(71200400001)(76116006)(66946007)(52536014)(8936002)(38100700002)(478600001)(4744005)(5660300002)(9686003)(186003)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aU9pd1B5K1M1ZW4wS003UzRXU2lOd3FxY0Q5NVJ3dE5iZGJJb3VCN2xNYUZm?=
 =?utf-8?B?VVlGbzVRbFJHT2daaHkyU2ZBSExsd2xsNVdSM25UamJpdnRkejFnV3hnVjBV?=
 =?utf-8?B?SldqY2VkV01UM25wdFFNWjBQYXdRdjFrQU5pSGE3MjBSYm1ZOHdNR0szaDBJ?=
 =?utf-8?B?N09LbUZsZGQwSHpwS1R2UndUWkZxaUJoQWVlTzJLVVlTNzVIUVFhd0tRUDVU?=
 =?utf-8?B?dTRPM2lTb3QwYmJDSUpFR2thYW1YUEdJQnNhcHdobmFsb0EzaHU0T0Q1ZlBk?=
 =?utf-8?B?Ly9id3NXWjhzSC9PTEpoWDJRN2NncEp2TEJaUVZ0bnV1VDlQTDIrMXE5UkxM?=
 =?utf-8?B?K1hXVnlmVnVpU3dGOE0vb3BYVFdGVFVSY25jbnpEY2Vya1l3Ukt1bWFLeTBt?=
 =?utf-8?B?blpReGNDWUN2QVB1LzlKOEQzNWpPZ3BuU3dPK3VmOXZYbWlZUGVxdHVRdTR1?=
 =?utf-8?B?ayt2dGgzMXh6UEltMERhN2VGc3FOUzladVduaWdUVlBWWDQ2d2R1YktRZmpi?=
 =?utf-8?B?a250dWRtZkF5N1BDL1RTK09HMzJYWmI2VGZGOFVlR2lnZ2EyR09GL3hqZm9y?=
 =?utf-8?B?R21MUVJlRURDTE9kZDAzamFNYjZ5WHd6MVM5dDh6aWxad0lQSVRPbiszZUdM?=
 =?utf-8?B?ZnlFNWFnajRjM3VGL3hGQWx1NlhkWGRZbVVqaUVzUDJlL3hVZWp3Y012dnRQ?=
 =?utf-8?B?OE5xT1F5RUhidHRKM3JGS1JhVHJ1dTE0d3ZvYUNRZ0ZUNFdwKzZtSndpTnVJ?=
 =?utf-8?B?RDR3NGI0VUZTTGF3azVIUEZUWmlWODhwYUVGd0Q1Y2prM0xFM3haQ2pxY1lP?=
 =?utf-8?B?bkdIREo4eDVBN3FqSW9kZXRVbXllNkc3dlhNdi81RnhtZ2QySjVuTHIzU0NF?=
 =?utf-8?B?ekdwaXBLcE5GLzNLUjR0UFhiV3pVY3lkYjVIN0YwWTZmZzU0YnlGMXNQMWpD?=
 =?utf-8?B?NUtxNS9VYTdmTzhrYkJ3T2RseXRWMHljMFNSRmQzd2wwTlh3NUI1WkxOYUNO?=
 =?utf-8?B?cVRXTERqQjJacFZCMEcrRXFMN2w4T2t6bmFLTkpLcWM0T1BxMHdSSlp1L1VI?=
 =?utf-8?B?a0NqZ1RkVWR1cS84bnFOcFNyNm5sV21NaWM0TVFIQVNRUEFQZ0ZEbEhvKzJr?=
 =?utf-8?B?MTJwZkhJTklraUd5bkNFNGM3LzJYYzhlOSt1RDRrVXRITVdqcmF1N0R1NTBr?=
 =?utf-8?B?dUMrYUcxUmNuSy9LakFZWnIyK2N4aXErL05yUDY1UjJKSkZWOHlucFF5Znd5?=
 =?utf-8?B?NVlEYWpUclcyRGs2c1RjbWl4bXdMMUp6cGwvanAwVjAwbW9BSzRCNExncU5V?=
 =?utf-8?B?T3dmYlZiM1hrWUovdU12QTVVUzlsWnJoVTRSZUdFeW1qNDMzeGtVclBiaWln?=
 =?utf-8?B?bzVFVmcxczFwdTdzZ3JEUWxZNWdRUHdiNnRlR1BaZkFJbVhpWUE1WkQxd2lO?=
 =?utf-8?B?b0xMREJQMUt2S0p1RGlKMFZDZHhpTmozK3RuN0V5dEROUXI2bkFtZTdLMFE4?=
 =?utf-8?B?ZVBTd0JCdDBacC9zWmJEWmRSenZBSEZsZ2VEZnF1d1k5YjlrMWRQMEZGRkor?=
 =?utf-8?B?NGhUcHZEQWRQSVFIQzc4NXRCVklZR1ZXN1JMZ3VoSUF1d2JsTmhwNXVZay83?=
 =?utf-8?B?QytWL2dGelpIKzc3OFg0d2xFV2NiQkxmU3h5UFVvc25PS3pzeGNISlpBQlNr?=
 =?utf-8?B?SlFkSFlhZjhZOFRZaSs4S3g1NzRuRlhCazVMdFRVZFEyTzQ2RjlhTUsxd3Y2?=
 =?utf-8?Q?AA2vHyKGyssisWZ/xI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6836.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d01ae5-7a1f-4e24-f4be-08d920288e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 09:28:00.8775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sftWuI4P52j79JNZOzYYikSMSEukSM8i2r8+PbR1s9UqxncPIxklQ0n3yY3P1IhampjLxlzWUWL5BwPRh57jbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7009
X-Proofpoint-GUID: D-14amPwqowJxZKN-rRg-L6nrWA7xwub
X-Proofpoint-ORIG-GUID: D-14amPwqowJxZKN-rRg-L6nrWA7xwub
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105260062

SGkgSnVsaWVuLA0KDQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jIGIv
dG9vbHMvbGlieGwvbGlieGxfYXJtLmMgaW5kZXgNCj4gPiAzNGY4YTI5MDU2Li4wNWM1OGE0Mjhj
IDEwMDY0NA0KPiA+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jDQo+ID4gKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfYXJtLmMNCj4gPiBAQCAtMzQyLDYgKzM0MiwxMiBAQCBzdGF0aWMgaW50
IG1ha2VfY2hvc2VuX25vZGUobGlieGxfX2djICpnYywgdm9pZA0KPiAqZmR0LCBib29sIHJhbWRp
c2ssDQo+ID4gICAgICAgICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+ID4gICAgICAgfQ0KPiA+
DQo+ID4gKyAgICB1aW50OF90IHNlZWRbMTI4XTsNCj4gDQo+IEkgY291bGRuJ3QgZmluZCBhbnkg
ZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHByb3BlcnR5IChhbHRob3VnaCwgSSBoYXZlIGZvdW5kDQo+
IGNvZGUgaW4gTGludXgpLiBDYW4geW91IGV4cGxhaW4gd2hlcmUgdGhlIDEyOCBjb21lIGZyb20/
DQogDQpJIGRpZG4ndCBmaW5kIGRvY3VtZW50YXRpb24gZWl0aGVyLCBwcm9iYWJseSB0aGF0IHBh
cnQgaXMgdW4tZG9jdW1lbnRlZCB5ZXQuDQpUaGlzIGlzIGtpbmQgb2YgdHJhZGVvZmYgYmV0d2Vl
biBDaGFDaGEyMCBrZXkgc2l6ZSBvZiAzMiAod2hpY2ggaXMgdXNlZCBpbiBndWVzdCBMaW51eCBD
Uk5HKSwgYW5kIGRhdGEgc2l6ZSB0aGF0IGhvc3QgaXMgZXhwZWN0ZWQgdG8gcHJvdmlkZSB3L28g
YmVpbmcgYmxvY2tlZCBvciBkZWxheWVkDQood2hpY2ggaXMgMjU2IGFjY29yZGluZyB0byBnZXRy
YW5kb20oKSBtYW4gcGFnZSkuIEluIGNhc2Ugb2YgMTI4LWJ5dGVzIHNlZWQgZWFjaCBieXRlIG9m
IENSTkcgc3RhdGUgd2lsbCBiZSBtaXhlZCA0IHRpbWVzIHVzaW5nIGJ5dGVzIGZyb20gdGhpcyBz
ZWVkLg0KDQo+IEFsc28sIGxvY2FsIHZhcmlhYmxlcyBzaG91bGQgYmUgZGVmaW5lZCBhdCB0aGUg
YmVnaW5uaW5nIG9mIHRoZSBmdW5jdGlvbi4NCj4gDQoNCldpbGwgZml4IHRoYXQuDQoNClRoYW5r
IHlvdSBmb3IgcmV2aWV3LA0KICBTZXJnaXkNCg==

