Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE85C1F5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 19:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hi02F-0002AZ-Q5; Mon, 01 Jul 2019 17:24:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uHYc=U6=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hi02E-0002AU-25
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 17:24:10 +0000
X-Inumbo-ID: 07c32e9a-9c25-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.46]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07c32e9a-9c25-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maQaAbP8CES7aAckR0Xd76h9XwkIB8UrVk5ygmOWJkA=;
 b=lb1DPDjXSJwyYmOJw+oDtBfApvohNYh/6akmCtok9dwZ96U+Lis10923/Nq2ebkyjHEcf4TBv42Le4KkdGl5DYh/ME3Yubgx+pHnwYeXTDJidMHTPRnCzb5AMfXH657Ow0hwXcJSyu1ekOYCNY3TEpVq4niSojuWqVfT/B+elJWdlpRnLf4pOReHGqXu2CteVCficHq1EryyPgDIIUkYgFpSsFMk0RfnCsV6Y8O3d87pb4lMz5o1JtujraaFJp0OWYuPZM6szy02wJ9IdXQFCgiWmsWAc2+afv1oYbRwyf7NWRODs3QccjnCOoAmgCAuesiApmTcBkUExXn5e1srTQ==
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.32.75) by
 AM6PR03MB4311.eurprd03.prod.outlook.com (20.177.33.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 17:24:02 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::24cd:dc66:cc1b:ac70]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::24cd:dc66:cc1b:ac70%3]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 17:24:02 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgross@suse.com" <jgross@suse.com>
Thread-Topic: [ANNOUNCE] Xen 4.13 Development Update
Thread-Index: AQHVMAEbSSvAiHpfBk+QlQHrupdvZaa2A4mA
Date: Mon, 1 Jul 2019 17:24:02 +0000
Message-ID: <87woh1sm6m.fsf@epam.com>
References: <20190701113534.10553-1-jgross@suse.com>
In-Reply-To: <20190701113534.10553-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd6b6431-a6dc-429e-8592-08d6fe48e942
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4311; 
x-ms-traffictypediagnostic: AM6PR03MB4311:
x-microsoft-antispam-prvs: <AM6PR03MB4311198BD08951077FF2D390E6F90@AM6PR03MB4311.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(25786009)(186003)(99286004)(6512007)(6116002)(26005)(11346002)(446003)(486006)(14454004)(3846002)(66066001)(476003)(2616005)(6486002)(229853002)(6506007)(102836004)(6436002)(4326008)(66446008)(256004)(76116006)(2501003)(71190400001)(71200400001)(4744005)(55236004)(76176011)(80792005)(73956011)(66476007)(66556008)(66946007)(54906003)(2906002)(110136005)(305945005)(36756003)(6246003)(107886003)(72206003)(7736002)(7416002)(81156014)(81166006)(478600001)(68736007)(8936002)(8676002)(86362001)(5660300002)(316002)(64756008)(53936002)(581094002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4311;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /gF4GtWcmv4eGj2aoa5qO9Fg/nBPaau3dqHjBhN/axizFRVOXRzAAj505KGW4Xev0jS7JSd8tS/wThDFZVgst2V2F/KS1tgg2CLgB9ilcG5hrVQVqFfnSDScrBdtAw3E8fXSJ4CNQ/xxzFVxhY4+Jen0wk53j1Xm3TgPaob2YJ8ehzKctocxL0g+8z+QRf+En/l+t2I3Pwabrm8PW2rZgRC4eV72ZCuHe8BckNiphcVRYEtEPJy6teGPDV2N6IniRzOiMDi9kN2BdwExsWaG0T1Lw/5EPlusS+vZwh8XrF3lKe1RexR+EV8syA4PpZzrjyAHNzYW79GLioNo6QJdN+QHLxNqu9aCAcYMuzu7wmil9LOmTb8BMXh30e21IDP02avEk50hf5VtUnu3apsK8c+M8IajAqbKaIYfYESAzCw=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6b6431-a6dc-429e-8592-08d6fe48e942
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 17:24:02.3205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4311
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: "luwei.kang@intel.com" <luwei.kang@intel.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>, "puwen@hygon.cn" <puwen@hygon.cn>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "chao.gao@intel.com" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1ZXJnZW4sCgpKdWVyZ2VuIEdyb3NzIHdyaXRlczoKCj4gVGhpcyBlbWFpbCBvbmx5IHRy
YWNrcyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNlIHJlcGx5IGZvciBpdGVtcyB5
b3UKPiB3b3VsZCBsaWtlIHRvIHNlZSBpbiA0LjEzIHNvIHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRl
YSB3aGF0IGlzIGdvaW5nIG9uIGFuZAo+IHByaW9yaXRpc2UgYWNjb3JkaW5nbHkuCj4KWy4uLl0K
Pgo+ID09IENvbXBsZXRlZCA9PQo+Cj4gKiAgRHJvcCB0bWVtCj4gICAtICBXZWkgTGl1Cj4KPiAq
ICBBZGQgc3VwcG9ydCBmb3IgSHlnb24gRGh5YW5hIEZhbWlseSAxOGggcHJvY2Vzc29yCj4gICAt
ICBQdSBXZW4KPgo+ICogIFRFRSBtZWRpYXRvciAoYW5kIE9QLVRFRSkgc3VwcG9ydCBpbiBYRU4K
PiAgIC0gIFZvbG9keW15ciBCYWJjaHVrCgpPUC1URUUgaXMgbm90IGNvbXBsZXRlbHkgY29tcGxl
dGVkLiBPbmx5IHBhdGNoZXMgdG8gaHlwZXJ2aXNvciB3ZXJlCm1lcmdlZC4gVGhlcmUgYXJlIHBh
dGNoZXMgZm9yIHRvb2xzdGFjayBhbmQgZG9jdW1lbnRhdGlvbiBzdGlsbCB1bmRlcgpyZXZpZXcu
CgotLQpCZXN0IHJlZ2FyZHMsVm9sb2R5bXlyIEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
