Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CA5BFB2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:24:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhy8P-0008EJ-5e; Mon, 01 Jul 2019 15:22:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhy8O-0008EB-1b
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:22:24 +0000
X-Inumbo-ID: 05891eee-9c14-11e9-a53d-d75a512a85b8
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05891eee-9c14-11e9-a53d-d75a512a85b8;
 Mon, 01 Jul 2019 15:22:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 15:22:16 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 15:19:30 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 15:19:30 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 15:19:29 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 15:19:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Ping: [PATCH] Config.mk: update OVMF to edk2-stable201905
Thread-Index: AQHVMB5rQTTlKtAlKkG4eOf1C6HAqaa14HEA
Date: Mon, 1 Jul 2019 15:19:29 +0000
Message-ID: <e65a329b-03e3-1beb-d91a-2724b9098fe9@suse.com>
References: <20190617161050.4684-1-anthony.perard@citrix.com>
 <20190701150443.GJ13449@perard.uk.xensource.com>
In-Reply-To: <20190701150443.GJ13449@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0006.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a8e70d7-ea25-43d8-8a1e-08d6fe3782f3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3170; 
x-ms-traffictypediagnostic: BY5PR18MB3170:
x-microsoft-antispam-prvs: <BY5PR18MB317075765305436DC8A88182B3F90@BY5PR18MB3170.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(189003)(199004)(229853002)(71200400001)(54906003)(86362001)(73956011)(26005)(66066001)(110136005)(316002)(2906002)(6436002)(71190400001)(478600001)(72206003)(53936002)(31696002)(15650500001)(256004)(446003)(7736002)(68736007)(305945005)(80792005)(186003)(11346002)(6116002)(3846002)(14444005)(6512007)(5660300002)(476003)(52116002)(8676002)(102836004)(76176011)(81156014)(36756003)(14454004)(81166006)(386003)(66446008)(6486002)(31686004)(66476007)(66556008)(64756008)(8936002)(53546011)(6246003)(6506007)(25786009)(99286004)(7416002)(4326008)(4744005)(2501003)(2616005)(486006)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3170;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b0fV009YChGHR9cJGOiu58P3GadNA8Yv5FAtfCegRrehwjP6oVms44NphmS7t0sUuI6z9vby9JibT0Fmp2q0PZBq7ZSl8NtMeAY/6+8fNNmRmhyRnMMDNfjN4of89UYIVUF3BlSCamIb41TUGhWrqXDGzqmyvxmcOBORz7kCeF/po6Fd+lnJpihYZrKpUmAkN0NxDA065cHQ7s8U93KI+7r7zA6Axei3bIOAKXK0ER35p66kmp8EajGzg0twAwfW2Uah9yJaMb3wr2Ftfj/GgmgY3eBYil56+j5/LjWH6P2ttvJr3sZfCszCYbhMFWwhWTUy+JLHOoWmiPTw7+HSRnXOy8vEhUcacxr8LG7VViqQLepiv7vRniEtQlg9TQYBaOBdDdGVmdeoob4y8fYaW6mzYilxlIlbO8Ie0Nimvaw=
Content-ID: <3E5A2C63B5D9954CBAE716FC60CB6635@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8e70d7-ea25-43d8-8a1e-08d6fe3782f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:19:29.5877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3170
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Ping: [PATCH] Config.mk: update OVMF to
 edk2-stable201905
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNzowNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIE1vbiwgSnVu
IDE3LCAyMDE5IGF0IDA1OjEwOjUwUE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4g
VXBkYXRlIHRvIHRoZSBsYXRlc3Qgc3RhYmxlIHRhZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gDQo+IENvdWxkIG9u
ZSBvZiB5b3UgY29tbWl0IHRoaXMgcGF0Y2g/DQoNCkkgd2FzIHdvbmRlcmluZyB3aGF0IHRoZSBw
b2xpY3kgaGVyZSBpcyAtIGRvIHN1Y2ggdXBkYXRlcyBnbyBpbg0Kd2l0aG91dCBhbnkgYWNrcz8N
Cg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
