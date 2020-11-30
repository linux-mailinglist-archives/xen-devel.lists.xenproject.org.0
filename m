Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B802C91F5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 00:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41512.74710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjsDX-0004mi-N2; Mon, 30 Nov 2020 23:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41512.74710; Mon, 30 Nov 2020 23:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjsDX-0004mJ-Jg; Mon, 30 Nov 2020 23:04:23 +0000
Received: by outflank-mailman (input) for mailman id 41512;
 Mon, 30 Nov 2020 23:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjsDV-0004mE-QG
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 23:04:21 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8219f09-c044-4491-9347-4e7187a4a8fa;
 Mon, 30 Nov 2020 23:04:20 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUMufpP004133; Mon, 30 Nov 2020 23:04:16 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 353ejmx3u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 23:04:15 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4205.eurprd03.prod.outlook.com (2603:10a6:803:57::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 23:04:11 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 23:04:11 +0000
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
X-Inumbo-ID: f8219f09-c044-4491-9347-4e7187a4a8fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfxhZJdF6H7GHZy9u+aT6v+Hwqr0yijwGp/DrH8rc3hrUR3jfSJtPfmurXRVNKfF6QZ2Y8gT7Fci13MHiTZgnKF+WsAyOAnkCFy4rML0C+dxUAavCL4i5p3xQ93OBhcHNOR1CwV2nynO8B07GYXq/kXqtRIYNi0yNUBobvyDDVyLCZePv+TPWu71edk+lIjYj6R6T6Eb5VTMzq28R8j7ibml6aDj46CoCklrH0Vlu1K/eccXYSvC/dTFT0m/812KOE/2HgxgbsnSVigKfslDHOuAWNDUxyt7zEggTzpkRpvNADfiCVXE71OHEZeoS/R2zdiYDQTQEieSBATz4NeA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tzVg79mVUHo83Th6q8ZOxTYt3jNAhvCCF0EbqMBuFg=;
 b=RfeNPkOjKuKfiu2dUArLIFCwKEnORNfDqS0uJpm96XwIDz1fTf8pdIreSB26kgUU/y6pwh5Gg8+tgic0aZGkYeewpqPIatTH9mGDn6BGMsS/fgQVgOaUGyJCizH96HE+hkyVuXjaBwMICd/he/PmBLwJf5ENS1D31Mmb0+pPCLfeaLuRCc4CPOT8veCYZTGUq3IpUIdof49ahGyrareNCcKLV2hTW24Gfz7jWhXJO0Eo/6GxIafnSRMH4p6I08gw2kgweh5Qk/+5CJJ3ABNNb++86tChXw6BNXMQbDRzPtUmAayldvxjL9de/JfuF9KFhuZFvxIH6b9jRbz1KWrYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tzVg79mVUHo83Th6q8ZOxTYt3jNAhvCCF0EbqMBuFg=;
 b=Hb2WM6bSqT/rEtupZlO0EPlFQItKRSeVG1BiVnsD6PEYnN240CKBtacrCVke4ocKqa9ponTuD4ELk0KAiCF8CPtvez8iVOTFprr/8rpXkazp1s4IJ8nffhkXXxrejTV7LJ75bh27BR17PLevmBTazP1f1j/KU7ZtlW+f0DDtcDVXEzZ/jEX2qDlgvWsWwq8ZHb71rv0Sr56DYO+zBRtMcbhXphqdBocSMU1nKwzPEAGS2XwNZ17Qgg9Tz2mxXz160Sbnh7GhSHGUOySmKVFv+TGiV29FYzRogp0Jvnry93bwJjJ3u8lmSNbVjUUlM4ohXfnBxyQMl0cgnsLVS5cZ4w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jan
 Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq()
 in init_*_irq_data()
Thread-Topic: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq()
 in init_*_irq_data()
Thread-Index: AQHWxXrGmX4mPPsRQ02tfcrd+7CSaanhT0MA
Date: Mon, 30 Nov 2020 23:04:11 +0000
Message-ID: <874kl678gl.fsf@epam.com>
References: <20201128113642.8265-1-julien@xen.org>
In-Reply-To: <20201128113642.8265-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99cbd442-cf07-4e2e-1db3-08d895844022
x-ms-traffictypediagnostic: VI1PR03MB4205:
x-microsoft-antispam-prvs: 
 <VI1PR03MB420594E6E6A4DBE41441AD0EE6F50@VI1PR03MB4205.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qwMOCSkaC7givXqEN31CM4YALbPk63BT0qJ9b5bLA3hzy+XE7a5momNe3a9cHkQKi55/Oivu6RNBz+MNMfY0MTiT5Lfrw0nzyrD1SfPWC4V7W8AwGDmH8ehFnVN9DmkoWTn3CjLHrX3Ln0QcuRUEApn+lyIWDe5mVoLWF1Khva3D8dIrAyQsCuaE+nF+iIpO9eJY1V0zFIV4XkqETY9f2Hl84wSTnRDwUAvbHh3hjojprNIfGvjz7iNEmkoeG9eMWkSs+fRTGqUbjnQx7oLXbYUWCXOipI9vvRuqog1GdF0DDyreiCgE73rt+P6ky4Qyqc0jBRQI0vl92cxCWVrmrQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(86362001)(186003)(66556008)(5660300002)(6916009)(64756008)(478600001)(66476007)(2616005)(71200400001)(66946007)(76116006)(4326008)(91956017)(66446008)(2906002)(83380400001)(26005)(316002)(54906003)(8676002)(6506007)(8936002)(55236004)(6486002)(6512007)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?UlFXLzVpTW1XL2FBMkVsNGtFcFYzc2tWT3hrbUI4czlqbVFoYk80Mmhqdll0?=
 =?utf-8?B?Rm91T2tDN1pZNEZGWW5GU0xOL0VTLzB6KzVOTTc4cWZ5ZlVaNWY4MXlzS3BX?=
 =?utf-8?B?MUFSQmxWTWFwN0l4Vll4ZUdrOWQ4UlZQVzFCVHJmMy9KQWRwZXZFKzVtRkhx?=
 =?utf-8?B?TFdsYncwMWc3aWdWaDl2bzRrVGRkMWpRZDR4YnZac2YxdGYzU2U1SG9XeWVq?=
 =?utf-8?B?c2Zzcm1keHhCWmhzQkptOTdobXViMFMzcVZ3cDZoeFd3YTQwVjRTcFphMGs4?=
 =?utf-8?B?WFpwOFVQbVB6c0NyblVTd3Btbm44cXVUVWVGZzI0WjJNL0ppZ3pYVWFHbGFw?=
 =?utf-8?B?ZDBZMnI1MEU0cnZzVllQYmdNdGRWNTJvTWtaNDVWTHFUZFRVZkdmbXM4Z3Bo?=
 =?utf-8?B?NjIwbzZhWXRLQ0pGNUhrYjNNVTF5V1JlL2Q3NGRuc25OMmRtTEhZdFpMMms1?=
 =?utf-8?B?a3AydkpLcWc4UzdnZDU2MitvSDdpK0xKYXRrVGZ5UzFGRjIvMHowWjJaT0hB?=
 =?utf-8?B?ZXhzcVgvSGJtb2ovNDRETTdEb2ZHTkJpWDBZMUNKYjMraXZZdGMwY3ptVmhu?=
 =?utf-8?B?QlRMby9QMnlGVFNwWVA2dWlSK2U5dUx5R1hSdjVjZ2VwRE5qelk2SEFpemJt?=
 =?utf-8?B?MXlNNDcrVCtQT2R0ZFFmS1RQb3ZMeUtGMmlDa1B6T1FRWTNRT09yUXowczBn?=
 =?utf-8?B?TkxzQXhDSGVocDJtbTI1NDFkbVE2ZG1oVVZVUldEU3pKQVlqcFpiWmVpbXhZ?=
 =?utf-8?B?RXl0aDBLSjNGNDMvVkZuWk9PdSt0aGhrQk1HVkk1b3ltOFBRYU5ENnBHcnNE?=
 =?utf-8?B?UEFlMlRJbXo4ZXVtTkVoV3NKMFJmQ28wODRtUWRhOVRQVFI2Q21kcFlLaUpm?=
 =?utf-8?B?VVVhUW9CM0ZIeEhtTVM2K2VZbS9TY3ZIVDBHTkNEOWZhRnJPMzY5bmZiSFFn?=
 =?utf-8?B?U2RWRHJZd0FmMitDVVAvWVRmbkJ1SjNJQkplWUYzV1NFdEJiRXU5TFplRjcy?=
 =?utf-8?B?R2IxaHlGVmU0aXJDejdaeHJLSEVrWExFWDl6Qk5LZ3VxajJadE9GaEF0TEtn?=
 =?utf-8?B?ZmwvblpKZVF2OVk5Vy9BWjFzQk9SS1hvNUdKdFpFeFBqdHA1a0lod096dmMr?=
 =?utf-8?B?L0xCMElFNkZQNnhtL1dNS0gyOHRHV1pvcThLaXV4VlJxU1BSUmVDRGhZcGVp?=
 =?utf-8?B?Z3RSMDhMRUNHKzBBUHZhK1orY2tQNzBSaTJsTWoxZ2EzTnlHNHFpUVpwcXVy?=
 =?utf-8?B?azczMWtlVzIrK2ZocU5FWU9TektqU2FMTWNUUUpCVGJwc3JlMFdwLzNaR0E5?=
 =?utf-8?Q?fN9FvVg6oC2q55B/2bm32+fuquOCCk8uU7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC2A197D3DC742449A059868208A851B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cbd442-cf07-4e2e-1db3-08d895844022
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 23:04:11.6079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPGSF/xPMsDAqhUidSMCbQIGoOUrNxb6+DmxzpeVQDr4h4+4Ekls8kSoNrpAE6F1v3FLYFSbh5S4x3l2mCz4y0UzzwApMLq8ffjFVjDbSH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4205
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_12:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011300142

DQpIaSBKdWxpZW4sDQoNCkp1bGllbiBHcmFsbCB3cml0ZXM6DQoNCj4gRnJvbTogSnVsaWVuIEdy
YWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4NCj4gaW5pdF9vbmVfZGVzY19pcnEoKSBjYW4gcmV0
dXJuIGFuIGVycm9yIGlmIGl0IGlzIHVuYWJsZSB0byBhbGxvY2F0ZQ0KPiBtZW1vcnkuIFdoaWxl
IHRoaXMgaXMgdW5saWtlbHkgdG8gaGFwcGVuIGR1cmluZyBib290IChjYWxsZWQgZnJvbQ0KPiBp
bml0X3ssbG9jYWxffWlycV9kYXRhKCkpLCBpdCBpcyBiZXR0ZXIgdG8gaGFyZGVuIHRoZSBjb2Rl
IGJ5DQo+IHByb3BhZ3RpbmcgdGhlIHJldHVybiB2YWx1ZS4NCj4NCj4gU3BvdHRlZCBieSBjb3Zl
cml0eS4NCj4NCj4gQ0lEOiAxMDY1MjkNCj4NCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdWwgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2
b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCg0KRm9yIEFSTSBwYXJ0LCBvYnZpb3VzbHkuDQoN
Cj4NCj4gLS0tDQo+ICAgICBDaGFuZ2VzIGluIHYyOg0KPiAgICAgICAgIC0gQWRkIFJvZ2VyJ3Mg
cmV2aWV3ZWQtYnkgZm9yIHg4Ng0KPiAgICAgICAgIC0gSGFuZGxlDQo+IC0tLQ0KPiAgeGVuL2Fy
Y2gvYXJtL2lycS5jIHwgMTIgKysrKysrKysrKy0tDQo+ICB4ZW4vYXJjaC94ODYvaXJxLmMgfCAg
NyArKysrKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9h
cm0vaXJxLmMNCj4gaW5kZXggMzg3NzY1N2E1Mjc3Li5iNzFiMDk5ZTZmYTIgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vaXJxLmMNCj4gQEAg
LTg4LDcgKzg4LDExIEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRfaXJxX2RhdGEodm9pZCkNCj4g
ICAgICBmb3IgKCBpcnEgPSBOUl9MT0NBTF9JUlFTOyBpcnEgPCBOUl9JUlFTOyBpcnErKyApDQo+
ICAgICAgew0KPiAgICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhp
cnEpOw0KPiAtICAgICAgICBpbml0X29uZV9pcnFfZGVzYyhkZXNjKTsNCj4gKyAgICAgICAgaW50
IHJjID0gaW5pdF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQo+ICsNCj4gKyAgICAgICAgaWYgKCByYyAp
DQo+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+ICsNCj4gICAgICAgICAgZGVzYy0+aXJxID0g
aXJxOw0KPiAgICAgICAgICBkZXNjLT5hY3Rpb24gID0gTlVMTDsNCj4gICAgICB9DQo+IEBAIC0x
MDUsNyArMTA5LDExIEBAIHN0YXRpYyBpbnQgaW5pdF9sb2NhbF9pcnFfZGF0YSh2b2lkKQ0KPiAg
ICAgIGZvciAoIGlycSA9IDA7IGlycSA8IE5SX0xPQ0FMX0lSUVM7IGlycSsrICkNCj4gICAgICB7
DQo+ICAgICAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQo+
IC0gICAgICAgIGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KPiArICAgICAgICBpbnQgcmMgPSBp
bml0X29uZV9pcnFfZGVzYyhkZXNjKTsNCj4gKw0KPiArICAgICAgICBpZiAoIHJjICkNCj4gKyAg
ICAgICAgICAgIHJldHVybiByYzsNCj4gKw0KPiAgICAgICAgICBkZXNjLT5pcnEgPSBpcnE7DQo+
ICAgICAgICAgIGRlc2MtPmFjdGlvbiAgPSBOVUxMOw0KPiAgDQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvaXJxLmMgYi94ZW4vYXJjaC94ODYvaXJxLmMNCj4gaW5kZXggNDU5NjY5NDc5MTll
Li4zZWJkNjg0NDE1YWMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPiArKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMNCj4gQEAgLTQyOCw5ICs0MjgsMTQgQEAgaW50IF9faW5pdCBp
bml0X2lycV9kYXRhKHZvaWQpDQo+ICANCj4gICAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBucl9p
cnFzX2dzaTsgaXJxKysgKQ0KPiAgICAgIHsNCj4gKyAgICAgICAgaW50IHJjOw0KPiArDQo+ICAg
ICAgICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOw0KPiAgICAgICAgICBkZXNjLT5pcnEgPSBp
cnE7DQo+IC0gICAgICAgIGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KPiArDQo+ICsgICAgICAg
IHJjID0gaW5pdF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQo+ICsgICAgICAgIGlmICggcmMgKQ0KPiAr
ICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiAgICAgIH0NCj4gICAgICBmb3IgKCA7IGlycSA8IG5y
X2lycXM7IGlycSsrICkNCj4gICAgICAgICAgaXJxX3RvX2Rlc2MoaXJxKS0+aXJxID0gaXJxOw0K
DQoNCi0tIA0KVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQ==

