Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF12CD687
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43471.78137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoX5-0002Le-4x; Thu, 03 Dec 2020 13:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43471.78137; Thu, 03 Dec 2020 13:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoX5-0002LF-1m; Thu, 03 Dec 2020 13:20:27 +0000
Received: by outflank-mailman (input) for mailman id 43471;
 Thu, 03 Dec 2020 13:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1si/=FH=epam.com=prvs=0606d307f8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kkoX2-0002LA-Q6
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:20:25 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 206478a7-7516-45ea-a9f2-1a3a78fb640b;
 Thu, 03 Dec 2020 13:20:23 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B3DJwSI000461; Thu, 3 Dec 2020 13:20:21 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 355vrqd6fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 13:20:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6065.eurprd03.prod.outlook.com (2603:10a6:208:15c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 13:20:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3632.018; Thu, 3 Dec 2020
 13:20:18 +0000
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
X-Inumbo-ID: 206478a7-7516-45ea-a9f2-1a3a78fb640b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ3k8hysJyNOsM7A4KoDaf0sEzuERIfpE03WxYl9PwL/0uo07gvSxslH9XhEHaAEmIS54Ye4u73Jdd26JiwRuso4iW061p87ylqyUtlQQZXqwjUCblMEDyoluwCDHD50oL3jCyHJBAhn8ppyzMq6r/4aMpYsj4p3ucfYZzCrT4ABdRZhWJpGZDAwwP+joFjl1prgSU8k64WI8Jj28Jj7/PkzpZBlJzXuN6uIfNuuM2CXysGRap91TVbpxhUgd09ZsiGUJELgyjPcJ2UAea+z8rc+z8VpWxwsM0LBkLeZEx43N5X9ByAdnT7eORQIuXaFQh8cQJYlIjw48zKs+w2/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUwRy5/vE/PKCVxGZpC6aHaCa0X0v8XsvbChM7sHiM8=;
 b=H9UVYebyWCx8PnvvBLC6ywTathOzwXg0ke8kuFauSrZiCnJg2rpt21/a+ldKIX0X/rtd+7w2Dc8ax2XsPKmxc/AToLD3eReQBpn37pfmnpS9UrG169vis4kLcPkziZjvCAMJBUdxIpxCoinaUwWbTmLbFecBVzpYv9PV55uiwJXbi8MVEeVXxlkTC7i8vWAMdKmngNCMvVx1Z8vmHNL0GiO7ijlholbBRYzGR3E1PxBxb80q+BgR7ArpnYJW9mNnotfQ++hpHmA0gUSMnb9iEMUMxb7vlziCMPJnefQQXrxXzPDkctfT0AItxr5Bv8tUJXQwhDVB14AxaNXrHEcMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUwRy5/vE/PKCVxGZpC6aHaCa0X0v8XsvbChM7sHiM8=;
 b=dnsbzit6oMjpR+Opn3K1V0zpjnDlDDRAiK0Q0MmV/sAxferONYTlLW6e4G9c6psbsuPNI4phrkIGq9zpmdYt24jGOJqDxte9YtywX3oqiIzdbt/I0Xmscz60ukmlkdHMrDasI9hzdNg8lUqbGjjJ0R/f13Zj0Mo3GC4bq9QvPP+vTW843NpSuQ0S22sExAnhVkStnHXL59lX6iYSX6E8roXdOxVwo3VWNIf+EnKJMvd/iQ1cRdjWUGOS9kYbBIinfgMpdGI5OM05O83KVt+359Hlrp6tTqAtcmg1LL5k9Jv76xts2dFkAx0vlbju3AaA2aachij5Mi2scWKkQSD8LQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "paul@xen.org" <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: 'Paul Durrant' <pdurrant@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
        'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 03/23] libxl: Make sure devices added by pci-attach are
 reflected in the config
Thread-Topic: [PATCH v4 03/23] libxl: Make sure devices added by pci-attach
 are reflected in the config
Thread-Index: AQHWx+OabtYotvRU7E6Ior0bjSGKzKnlXZAAgAAAvYA=
Date: Thu, 3 Dec 2020 13:20:18 +0000
Message-ID: <2c30b442-5dba-3d87-11b2-ba2bfd521a8f@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-4-paul@xen.org>
 <d16e33d7-a4af-8686-c639-b4f591caf77c@epam.com>
 <00a701d6c976$ac403020$04c09060$@xen.org>
In-Reply-To: <00a701d6c976$ac403020$04c09060$@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e73ad96b-5222-41e9-b263-08d8978e2dca
x-ms-traffictypediagnostic: AM0PR03MB6065:
x-microsoft-antispam-prvs: 
 <AM0PR03MB60650F3289921A7E52C1C64EE7F20@AM0PR03MB6065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hFwYjUnRKLLZ+0o9W0AjmqwiIlOPVccicVLHMiAZ0K5MCM36Pccjg5HKkLRkF+qINA3TbuL7nVsOTR/h14Cj0/FFl8HZofy27h1Sciycw6TMqI0WOa5LvM/CNW8Q201ckGF3akLaZfVll9pR2WFFhFVa8tDB0PQcDh8d6xv7v/lIaB5iAmp36keG/vwa8XiKRMUS2MAGXEkX72IZcCIB56GTXngX2gcPi68RotqtrWh2rNBl94WQayLjd7hx9N6LiLlR1YBnHgyq0BwHWu5wkn5+uieYKM0SANVpenOvewaAWHPp3IOP1Nl6mccBidwIVPcAURuYyBckEcThL7xWZ0VoHexWq0/agzxxD7t6W9iQ6YU6Qdju3/Qm4Y1oIfiZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(2616005)(8676002)(6486002)(54906003)(316002)(53546011)(2906002)(110136005)(6506007)(26005)(186003)(36756003)(31686004)(8936002)(4326008)(6512007)(76116006)(86362001)(66946007)(66446008)(478600001)(5660300002)(31696002)(64756008)(66476007)(91956017)(66556008)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?OEtaeUEyeTBCNk9Bcnk2S1Z4TSswaG1EN3Jxb0N5ZkdON2lnOEZzTGlPUHM5?=
 =?utf-8?B?TDIrQnUvZ0MwVEhxMWVSV2xmNWE1ZWtmWFVhVGpBNlZiZExKK0dCNVJsVkZC?=
 =?utf-8?B?ZFAxM3NCSXpINlRjM0FsY2NKeFg0NENlTXgxSVF3ZENUS3lpdVB2a3kxUGFQ?=
 =?utf-8?B?cS8wMTdjQUphNk1mRHpmZzU2eGhiRzhYQ2ZUT1pZeEFNM2tPUmRnUzdMQVFa?=
 =?utf-8?B?dG5nUFgwVUNKWU1GejFRcDFacVk1OFRaZEQ3Mmx1cHFBUnFrREthODhEUEMv?=
 =?utf-8?B?MWF4RFE4Z3RZWndEQ0RGc0lZRld4ZXIxL01CMVRtUXVTR0lzQkFBWWVZMTYr?=
 =?utf-8?B?YTRIVHBWMHNPQ2lUOHVBU2ZpaHpGUk96QjVGZHJCamQ4eEhQZW4wRkJ0Y29D?=
 =?utf-8?B?cGJtZXY4WXh6Y2VCRjR3MUFUUHZRQ0ovQmZyY3kyOFNUejkxRHhBajUyR3RJ?=
 =?utf-8?B?akFxd0k2bU5qV0lld0FvdjI4M3BINGh1UlVOcW83N012TWMyNzdiRU5KaUM3?=
 =?utf-8?B?WVlpLzZkTFloSmFJcEhKZXZ3UEIvckVJclcwdWRRTGk5Y2kxWDVTQUFOZWxp?=
 =?utf-8?B?MDF1UFNSTzFzb0tZa1QyaDJ1Y2daYUNrMndkTlo0dXdBSEFhb1ZCZ2lPeWtM?=
 =?utf-8?B?UWZEMWFvN2V6MGl0VFZ4dVBHQWh1YUt3RjhEU3d2R2MvY1VXMk4wL2E5THhR?=
 =?utf-8?B?Tkx3Qkh0aVRjbFFtUE1Lb1VwUVFVQUZUTjlxTUZEZWp1ZjJyUjZWdnlEYnFD?=
 =?utf-8?B?aTRISEM4MW5uekdWTzFtU2JRaFJXb1VZMmhpRVl6NDBPdTV3TkJmdStOSHRT?=
 =?utf-8?B?a2xzYWhHZmk2WUJDZG5hVHZhTG40SW9DYkliSEQvWm9xVTY3UENZVDdPQ2Za?=
 =?utf-8?B?Sm9DdFNhNGpDek1GSkxVdmVLSElWaloyU3JHUDMyanQrVjdhS3ppMWZ0dCtx?=
 =?utf-8?B?ZkJXaTBpRFB2bXpsaXJOZm85ZjJkYk83aTJqZ25lczhkUGxydzhJT2VwcU90?=
 =?utf-8?B?dmxNQ216cFZVcUc5Q2MzbTdHNzBucUNDVzNuUDFvUjIrQkx5MjIrWTBVaGY5?=
 =?utf-8?B?UVZpMEVSOWFpUUhncnFXaEIvV3FmRXVGdmVLL3JTdDJiUjcwQmwzQTNOSUxZ?=
 =?utf-8?B?N0NmSEMvUS9VT21CeEpFSkxkMDR1UVNJQ0hRNlFETExZdm9XcEFlSzJEczNs?=
 =?utf-8?B?RFhOeDFjSmU2eXFwRkR4eDVlWUxXOGJ1OXlJVFRPYjZPZkNFckh3UzFtRkhi?=
 =?utf-8?B?bFBLVXd2K1NNY3htUCtsaEY3dUgwdGxPa3ptNmZENDlNayt6WTZmRmc4R1RB?=
 =?utf-8?Q?a6kJ5g7ndNsEOAdIgtRZjsqRY8fG2T8jcH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <25884EF5136DC249956B90901F9B070F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73ad96b-5222-41e9-b263-08d8978e2dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 13:20:18.1487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vD74w71gzTsiwJa2YVfB1qLjiEI6cl17EiSkwOWixejrph44vn62+/TXDoRCbq7v1o/7t/tUaCkpoTGzmJFy5n1G/xrHELJjpblTSMqviQO4wI/PoXBe+7acylL/Hjpv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6065
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-03_07:2020-12-03,2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030080

DQpPbiAxMi8zLzIwIDM6MTcgUE0sIFBhdWwgRHVycmFudCB3cm90ZToNCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8T2xla3Nh
bmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiBTZW50OiAwMSBEZWNlbWJlciAyMDIwIDEz
OjEyDQo+PiBUbzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4+IENjOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
OyBJYW4gSmFja3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
DQo+PiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjQgMDMvMjNdIGxpYnhsOiBNYWtlIHN1cmUgZGV2aWNlcyBhZGRlZCBi
eSBwY2ktYXR0YWNoIGFyZSByZWZsZWN0ZWQgaW4gdGhlIGNvbmZpZw0KPj4NCj4+IEhpLCBQYXVs
IQ0KPj4NCj4+IE9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+Pj4g
RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPj4+DQo+Pj4gQ3VycmVu
dGx5IGxpYnhsX19kZXZpY2VfcGNpX2FkZF94ZW5zdG9yZSgpIGlzIGJyb2tlbiBpbiB0aGF0IGRv
ZXMgbm90DQo+Pj4gdXBkYXRlIHRoZSBkb21haW4ncyBjb25maWd1cmF0aW9uIGZvciB0aGUgZmly
c3QgZGV2aWNlIGFkZGVkICh3aGljaCBjYXVzZXMNCj4+PiBjcmVhdGlvbiBvZiB0aGUgb3ZlcmFs
bCBiYWNrZW5kIGFyZWEgaW4geGVuc3RvcmUpLiBUaGlzIGNhbiBiZSBlYXNpbHkgb2JzZXJ2ZWQN
Cj4+PiBieSBydW5uaW5nICd4bCBsaXN0IC1sJyBhZnRlciBhZGRpbmcgYSBzaW5nbGUgZGV2aWNl
OiB0aGUgZGV2aWNlIHdpbGwgYmUNCj4+PiBtaXNzaW5nLg0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgcHJvYmxlbSBhbmQgYWRkcyBhIERFQlVHIGxvZyBsaW5lIHRvIGFsbG93IGVhc3kN
Cj4+PiB2ZXJpZmljYXRpb24gdGhhdCB0aGUgZG9tYWluIGNvbmZpZ3VyYXRpb24gaXMgYmVpbmcg
bW9kaWZpZWQuIEFsc28sIHRoZSB1c2UNCj4+PiBvZiBsaWJ4bF9fZGV2aWNlX2dlbmVyaWNfYWRk
KCkgaXMgZHJvcHBlZCBhcyBpdCBsZWFkcyB0byBhIGNvbmZ1c2luZyBzaXR1YXRpb24NCj4+PiB3
aGVyZSBvbmx5IHBhcnRpYWwgYmFja2VuZCBpbmZvcm1hdGlvbiBpcyB3cml0dGVuIHVuZGVyIHRo
ZSB4ZW5zdG9yZQ0KPj4+ICcvbGlieGwnIHBhdGguIEZvciBMSUJYTF9fREVWSUNFX0tJTkRfUENJ
IGRldmljZXMgdGhlIG9ubHkgZGVmaW5pdGl2ZQ0KPj4+IGluZm9ybWF0aW9uIGluIHhlbnN0b3Jl
IGlzIHVuZGVyICcvbG9jYWwvZG9tYWluLzAvYmFja2VuZCcgKHRoZSAnMCcgYmVpbmcNCj4+PiBo
YXJkLWNvZGVkKS4NCj4+Pg0KPj4+IE5PVEU6IFRoaXMgcGF0Y2ggaW5jbHVkZXMgYSB3aGl0ZXNw
YWNlIGluIGFkZF9wY2lzX2RvbmUoKS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4+PiAtLS0NCj4+PiBDYzogSWFuIEphY2tzb24g
PGl3akB4ZW5wcm9qZWN0Lm9yZz4NCj4+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+PiBD
YzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+Pj4NCj4+PiB2
MjoNCj4+PiAgICAtIEF2b2lkIGhhdmluZyB0d28gY29tcGxldGVseSBkaWZmZXJlbnQgd2F5cyBv
ZiBhZGRpbmcgZGV2aWNlcyBpbnRvIHhlbnN0b3JlDQo+Pj4NCj4+PiB2MzoNCj4+PiAgICAtIFJl
dmVydCBzb21lIGNoYW5nZXMgZm9ybSB2MiBhcyB0aGVyZSBpcyBjb25mdXNpb24gb3ZlciB1c2Ug
b2YgdGhlIGxpYnhsDQo+Pj4gICAgICBhbmQgYmFja2VuZCB4ZW5zdG9yZSBwYXRocyB3aGljaCBu
ZWVkcyB0byBiZSBmaXhlZA0KPj4+IC0tLQ0KPj4+ICAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxf
cGNpLmMgfCA4NyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4+IGluZGV4IDlkNDRiMjhmMGEuLmRhMDFjNzdi
YTIgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4+ICsr
KyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+PiBAQCAtNzksMzkgKzc5LDU1IEBA
IHN0YXRpYyB2b2lkIGxpYnhsX19kZXZpY2VfZnJvbV9wY2kobGlieGxfX2djICpnYywgdWludDMy
X3QgZG9taWQsDQo+Pj4gICAgICAgIGRldmljZS0+a2luZCA9IExJQlhMX19ERVZJQ0VfS0lORF9Q
Q0k7DQo+Pj4gICAgfQ0KPj4+DQo+Pj4gLXN0YXRpYyBpbnQgbGlieGxfX2NyZWF0ZV9wY2lfYmFj
a2VuZChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwNCj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2RldmljZV9wY2kgKnBjaSwNCj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBudW0pDQo+Pj4gK3N0YXRp
YyB2b2lkIGxpYnhsX19jcmVhdGVfcGNpX2JhY2tlbmQobGlieGxfX2djICpnYywgeHNfdHJhbnNh
Y3Rpb25fdCB0LA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGRvbWlkLCBjb25zdCBsaWJ4bF9kZXZpY2VfcGNpICpwY2kpDQo+Pj4gICAgew0KPj4+
IC0gICAgZmxleGFycmF5X3QgKmZyb250ID0gTlVMTDsNCj4+PiAtICAgIGZsZXhhcnJheV90ICpi
YWNrID0gTlVMTDsNCj4+PiAtICAgIGxpYnhsX19kZXZpY2UgZGV2aWNlOw0KPj4+IC0gICAgaW50
IGk7DQo+Pj4gKyAgICBsaWJ4bF9jdHggKmN0eCA9IGxpYnhsX19nY19vd25lcihnYyk7DQo+Pj4g
KyAgICBmbGV4YXJyYXlfdCAqZnJvbnQsICpiYWNrOw0KPj4+ICsgICAgY2hhciAqZmVfcGF0aCwg
KmJlX3BhdGg7DQo+Pj4gKyAgICBzdHJ1Y3QgeHNfcGVybWlzc2lvbnMgZmVfcGVybXNbMl0sIGJl
X3Blcm1zWzJdOw0KPj4+ICsNCj4+PiArICAgIExPR0QoREVCVUcsIGRvbWlkLCAiQ3JlYXRpbmcg
cGNpIGJhY2tlbmQiKTsNCj4+Pg0KPj4+ICAgICAgICBmcm9udCA9IGZsZXhhcnJheV9tYWtlKGdj
LCAxNiwgMSk7DQo+Pj4gICAgICAgIGJhY2sgPSBmbGV4YXJyYXlfbWFrZShnYywgMTYsIDEpOw0K
Pj4+DQo+Pj4gLSAgICBMT0dEKERFQlVHLCBkb21pZCwgIkNyZWF0aW5nIHBjaSBiYWNrZW5kIik7
DQo+Pj4gLQ0KPj4+IC0gICAgLyogYWRkIHBjaSBkZXZpY2UgKi8NCj4+PiAtICAgIGxpYnhsX19k
ZXZpY2VfZnJvbV9wY2koZ2MsIGRvbWlkLCBwY2ksICZkZXZpY2UpOw0KPj4+ICsgICAgZmVfcGF0
aCA9IGxpYnhsX19kb21haW5fZGV2aWNlX2Zyb250ZW5kX3BhdGgoZ2MsIGRvbWlkLCAwLA0KPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTElCWExf
X0RFVklDRV9LSU5EX1BDSSk7DQo+Pj4gKyAgICBiZV9wYXRoID0gbGlieGxfX2RvbWFpbl9kZXZp
Y2VfYmFja2VuZF9wYXRoKGdjLCAwLCBkb21pZCwgMCwNCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTElCWExfX0RFVklDRV9LSU5EX1BDSSk7DQo+
Pj4NCj4+PiArICAgIGZsZXhhcnJheV9hcHBlbmRfcGFpcihiYWNrLCAiZnJvbnRlbmQiLCBmZV9w
YXRoKTsNCj4+PiAgICAgICAgZmxleGFycmF5X2FwcGVuZF9wYWlyKGJhY2ssICJmcm9udGVuZC1p
ZCIsIEdDU1BSSU5URigiJWQiLCBkb21pZCkpOw0KPj4+IC0gICAgZmxleGFycmF5X2FwcGVuZF9w
YWlyKGJhY2ssICJvbmxpbmUiLCAiMSIpOw0KPj4+ICsgICAgZmxleGFycmF5X2FwcGVuZF9wYWly
KGJhY2ssICJvbmxpbmUiLCBHQ1NQUklOVEYoIiVkIiwgMSkpOw0KPj4+ICAgICAgICBmbGV4YXJy
YXlfYXBwZW5kX3BhaXIoYmFjaywgInN0YXRlIiwgR0NTUFJJTlRGKCIlZCIsIFhlbmJ1c1N0YXRl
SW5pdGlhbGlzaW5nKSk7DQo+Pj4gICAgICAgIGZsZXhhcnJheV9hcHBlbmRfcGFpcihiYWNrLCAi
ZG9tYWluIiwgbGlieGxfX2RvbWlkX3RvX25hbWUoZ2MsIGRvbWlkKSk7DQo+Pj4NCj4+PiAtICAg
IGZvciAoaSA9IDA7IGkgPCBudW07IGkrKywgcGNpKyspDQo+Pj4gLSAgICAgICAgbGlieGxfY3Jl
YXRlX3BjaV9iYWNrZW5kX2RldmljZShnYywgYmFjaywgaSwgcGNpKTsNCj4+PiArICAgIGJlX3Bl
cm1zWzBdLmlkID0gMDsNCj4+IFRoZXJlIHdhcyBhIGRpc2N1c3Npb24gWzFdIG9uIFBDSSBvbiBB
Uk0gYW5kIG9uZSBvZiB0aGUgcXVlc3Rpb24gd2FzIHRoYXQgaXQgaXMgcG9zc2libGUNCj4+DQo+
PiB0aGF0IHdlIGhhdmUgdGhlIHBjaSBiYWNrZW5kIHJ1bm5pbmcgaW4gYSBsYXRlIGhhcmR3YXJl
IGRvbWFpbi9kcml2ZXIgZG9tYWluLCB3aGljaCBtYXkNCj4+DQo+PiBub3QgYmUgRG9tYWluLTAu
IERvIHlvdSB0aGluayB3ZSBjYW4gYXZvaWQgdXNpbmcgMCBoZXJlIGFuZCBnZXQgc29tZSBjbHVl
IG9mIHRoZSBkb21haW4NCj4+DQo+PiBmcm9tICIqYmFja2VuZD1kb21haW4taWQiPyBJZiBub3Qg
c2V0IGl0IHdpbGwgcmV0dXJuIERvbWFpbi0wJ3MgSUQgYW5kIHdvbid0IGJyZWFrIGFueXRoaW5n
Kg0KPiBOb3Qgc3VyZSB3aGF0IHlvdSdyZSBhc2tpbmcgZm9yIHNpbmNlLi4uDQoNCk15IGJhZCwg
cGxlYXNlIGlnbm9yZQ0KDQpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5k
cg0KDQo+DQo+PiAqVGhhbmsgeW91LCoNCj4+DQo+PiAqT2xla3NhbmRyDQo+PiAqDQo+Pg0KPj4+
ICsgICAgYmVfcGVybXNbMF0ucGVybXMgPSBYU19QRVJNX05PTkU7DQo+Pj4gKyAgICBiZV9wZXJt
c1sxXS5pZCA9IGRvbWlkOw0KPj4+ICsgICAgYmVfcGVybXNbMV0ucGVybXMgPSBYU19QRVJNX1JF
QUQ7DQo+Pj4gKw0KPj4+ICsgICAgeHNfcm0oY3R4LT54c2gsIHQsIGJlX3BhdGgpOw0KPj4+ICsg
ICAgeHNfbWtkaXIoY3R4LT54c2gsIHQsIGJlX3BhdGgpOw0KPj4+ICsgICAgeHNfc2V0X3Blcm1p
c3Npb25zKGN0eC0+eHNoLCB0LCBiZV9wYXRoLCBiZV9wZXJtcywNCj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICBBUlJBWV9TSVpFKGJlX3Blcm1zKSk7DQo+Pj4gKyAgICBsaWJ4bF9feHNfd3Jp
dGV2KGdjLCB0LCBiZV9wYXRoLCBsaWJ4bF9feHNfa3ZzX29mX2ZsZXhhcnJheShnYywgYmFjaykp
Ow0KPj4+DQo+Pj4gLSAgICBmbGV4YXJyYXlfYXBwZW5kX3BhaXIoYmFjaywgIm51bV9kZXZzIiwg
R0NTUFJJTlRGKCIlZCIsIG51bSkpOw0KPj4+ICsgICAgZmxleGFycmF5X2FwcGVuZF9wYWlyKGZy
b250LCAiYmFja2VuZCIsIGJlX3BhdGgpOw0KPj4+ICAgICAgICBmbGV4YXJyYXlfYXBwZW5kX3Bh
aXIoZnJvbnQsICJiYWNrZW5kLWlkIiwgR0NTUFJJTlRGKCIlZCIsIDApKTsNCj4gLi4uIGJhY2tl
bmQtaWQgaXMgd3JpdHRlbiBoZXJlLg0KPg0KPiAgICBQYXVsDQo+DQo+

