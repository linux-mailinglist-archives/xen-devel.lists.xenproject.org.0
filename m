Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA445F74A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 13:42:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj03m-0002lw-Mp; Thu, 04 Jul 2019 11:37:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj03k-0002ln-Kb
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 11:37:52 +0000
X-Inumbo-ID: 27042d40-9e50-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27042d40-9e50-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 11:37:50 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 11:37:43 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 11:37:17 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 11:37:17 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3121.namprd18.prod.outlook.com (10.255.136.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Thu, 4 Jul 2019 11:37:15 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 11:37:15 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Thread-Topic: Xen 4.10.4 released
Thread-Index: AQHVMlzUvW0qNOhyc0yTabkGhR3Z2w==
Date: Thu, 4 Jul 2019 11:37:15 +0000
Message-ID: <0e57693f-bd07-6e54-9766-4952bb1d2466@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0022.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::32) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ea743ec-b4d3-4a43-c3c2-08d70073f682
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3121; 
x-ms-traffictypediagnostic: BY5PR18MB3121:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR18MB312183946D75829711B5ABC5B3FA0@BY5PR18MB3121.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(31686004)(66066001)(25786009)(450100002)(14444005)(86362001)(256004)(31696002)(7736002)(26005)(7116003)(8936002)(2351001)(71200400001)(71190400001)(6506007)(386003)(81166006)(6916009)(81156014)(8676002)(52116002)(102836004)(68736007)(99286004)(4326008)(2906002)(305945005)(80792005)(6116002)(3846002)(6512007)(6306002)(5640700003)(72206003)(2501003)(73956011)(6486002)(53936002)(966005)(478600001)(6436002)(316002)(66556008)(5660300002)(14454004)(4744005)(66446008)(2616005)(64756008)(66946007)(476003)(486006)(186003)(66476007)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3121;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I0O/0BZR2/T8g/nYhdPneQp0a4qMfiMY9hCDDkt0rHbl1Y/4p8MbUaLaC4FEO7bJjyH2AUwJyYZoKIpdDgIv4+0XBMbk864tLuZ85sY+ZXby81Lg2LEs6gfCcUtToUSoT0UJgjAOftIUfOt10sKEQZH7IZAZBDAWIVa8qSq/UpVxDMVI9MPvC1CHuvNpcFMpj6nJ8Xx7bMcYb9HsIy1pM8PQktVAutCQgWWx/yyVdfTHU2Cah1raMvSlvsaIeBSDu8SnAArsUMfclUaeod32ONEcgKKOst2CDmrVsdl3OtHE8NJJ2hyKIlgbyyvxzgZ42ROngv+gBo3aov4riykT5WClTkCBqpIpuysRQEJk39J4EzxC9ldUmzE2hZCdOxl4ze2n7gEKncq8KOEY5w/QeCYxZUkFepVRP0fHsPgBv/0=
Content-ID: <EF0B476EB53E31419E7E4CF37137DEF2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea743ec-b4d3-4a43-c3c2-08d70073f682
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 11:37:15.6576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3121
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Xen 4.10.4 released
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLA0KDQpJIGFtIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2Ugb2YgWGVuIDQuMTAu
NC4gVGhpcyBpcyBhdmFpbGFibGUNCmltbWVkaWF0ZWx5IGZyb20gaXRzIGdpdCByZXBvc2l0b3J5
DQpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2c7aD1y
ZWZzL2hlYWRzL3N0YWJsZS00LjEwDQoodGFnIFJFTEVBU0UtNC4xMC40KSBvciBmcm9tIHRoZSBY
ZW5Qcm9qZWN0IGRvd25sb2FkIHBhZ2UNCmh0dHBzOi8veGVucHJvamVjdC5vcmcvZG93bmxvYWRz
L3hlbi1wcm9qZWN0LWFyY2hpdmVzL3hlbi1wcm9qZWN0LTQtMTAtc2VyaWVzL3hlbi1wcm9qZWN0
LTQtMTAtNC8NCih3aGVyZSBhIGxpc3Qgb2YgY2hhbmdlcyBjYW4gYWxzbyBiZSBmb3VuZCkuDQoN
CldlIHJlY29tbWVuZCBhbGwgdXNlcnMgb2YgdGhlIDQuMTAgc3RhYmxlIHNlcmllcyB0byB1cGRh
dGUgdG8gdGhpcw0KbGF0ZXN0IHBvaW50IHJlbGVhc2UuIFBsZWFzZSBub3RlIHRoYXQgdGhpcyBp
cyB0aGUgbGFzdCBYZW5Qcm9qZWN0DQpjb29yZGluYXRlZCByZWxlYXNlIGZyb20gdGhpcyBicmFu
Y2gsIHdoaWNoIHdpbGwgbW92ZSBpbnRvIHNlY3VyaXR5DQpvbmx5IG1haW50ZW5hbmNlIG1vZGUg
bm93Lg0KDQpSZWdhcmRzLCBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
