Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FF52DC14
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVwwj-0002aC-B1; Wed, 29 May 2019 11:40:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QpgD=T5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hVwwi-0002a4-K6
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:40:40 +0000
X-Inumbo-ID: 94aea59f-8206-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::624])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94aea59f-8206-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5Aw3TQB9OZ+JJ1X7Ujc82G8jWRZ1eZmSVJSfBO5lZM=;
 b=G2RO4OBMa/+RgSzO2/JS9rBoVZpGZyool1NMWZNpqxiFRDCE0851gOs3DXy/OqccRgufeS/kwlGUtZVEZw3DPA587mLP5Fgzw3bSBAvdAYYEhBrLsudLgAVnEOV3ymwy5bV8Xnml987sV9nDy6Lejejg/nQOOrd/SZGgWOc/x3c40W+ywyndFtroaRoakefRCXNjOVnp3dKkg8+K9C8GmML+ofKpU9+HofvNEZ6vtPWhv4tRtH5u/JxxSrr7SvZKuTEMObDjHxnxVlRahF6p6rmXOgMxmBYbntg9k3LdyUmtjrC4sWDO7yT7nNof5t5A8OQOwDZ3MFG73DabLMpqPw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4673.eurprd03.prod.outlook.com (20.176.214.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.19; Wed, 29 May 2019 11:40:37 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 11:40:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 2/2] arm: rename tiny64.conf to tiny64_defconfig
Thread-Index: AQHVC+yMHILNn8cZtESyMQqnzza/oKZ0AF4AgAALHoCAAA4AAIAAB3EAgAyqF4CAAUPLgA==
Date: Wed, 29 May 2019 11:40:37 +0000
Message-ID: <875zpt8p58.fsf@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <1ca603c5-2e97-9529-963a-f381b04c727f@arm.com> <87a7fh8cr4.fsf@epam.com>
 <25b160f5-2f7d-40d9-8feb-9ea63a8a153f@arm.com> <878sv18977.fsf@epam.com>
 <2b392d1c-0837-4395-8ddc-f0cc04bbea83@arm.com>
In-Reply-To: <2b392d1c-0837-4395-8ddc-f0cc04bbea83@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e12ab14-a049-4e22-f49a-08d6e42a7810
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4673; 
x-ms-traffictypediagnostic: AM0PR03MB4673:
x-microsoft-antispam-prvs: <AM0PR03MB46736A1D058D0EA9649DDB58E61F0@AM0PR03MB4673.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(5660300002)(76116006)(478600001)(14454004)(66066001)(72206003)(66446008)(71200400001)(316002)(36756003)(54906003)(25786009)(91956017)(66946007)(73956011)(8936002)(6246003)(71190400001)(4326008)(66556008)(66476007)(68736007)(64756008)(80792005)(53936002)(6506007)(86362001)(14444005)(256004)(229853002)(446003)(6436002)(81166006)(26005)(6486002)(186003)(6916009)(476003)(2616005)(81156014)(99286004)(76176011)(305945005)(2906002)(102836004)(486006)(53546011)(6512007)(7736002)(8676002)(55236004)(11346002)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4673;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CQYgFjYKzaMSjIFB1cx/4Mw9i+ZOC028cqFhNxZfdYrNIKmBTtilKlkjV6oyV+GYc2JX0nXzahSRJ6JEn/dl/NazWslZXmibA3xmUaBCjKjgd6NJ02JxpO6Jy7CwUH5HqcyOQn446aLK1RI1NwENf+QEUbM09O+v3G+ak1NJgumWjrinO5HBheloFiJcwUixArLNB1YjFi4bfdXZgzh9ZW4K8xGY1ffh2AxustgK4gyGrrmi9Ta7FfPMovyqoi7Ozc+KbHlNewLDuD4dxHdtQVDCWYxmiEd9GLvMhZovpcB27SkNA10Z1/meX3JnlsZH47cCkFCl4GRdaTZML0nunWZa6X/ihQKcWbbtGrkcl1FJzPmRgm1zDRtNp/h3FlDFkB2TQz0gbMgTcMhs8Md+hRWQSaJoKDmmx5v56X88zAA=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e12ab14-a049-4e22-f49a-08d6e42a7810
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 11:40:37.2043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4673
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IFNv
cnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KSXQncyBva2F5LCBubyB3b3JyaWVzLgoKPiBPbiA1LzIw
LzE5IDM6NTcgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pgo+PiBKdWxpZW4gR3JhbGwg
d3JpdGVzOgo+Pgo+Pj4gSGksCj4+Pgo+Pj4gT24gMjAvMDUvMjAxOSAxNDo0MSwgVm9sb2R5bXly
IEJhYmNodWsgd3JvdGU6Cj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+Pgo+Pj4+PiBIaSwK
Pj4+Pj4KPj4+Pj4gRmlyc3Qgb2YgYWxsLCBwbGVhc2UgYWRkIGEgY292ZXIgbGV0dGVyIHdoZW4g
eW91IHNlbmQgYSBzZXJpZXMuIFRoaXMKPj4+Pj4gaGVscCBmb3IgdGhyZWFkaW5nIGFuZCBhbHNv
IGEgcGxhY2UgdG8gY29tbWVuZCBvbiBnZW5lcmFsIGZlZWRiYWNrLgo+Pj4+IE9oLCBva2F5LiBU
aGF0IHdhcyBxdWl0ZSBzaW1wbGUgY2hhbmdlIGFuZCBJIGRpZG4ndCB3YW50ZWQgdG8gc3BhbSB3
aXRoCj4+Pj4gZXh0cmEgZW1haWxzLiBJIHdpbGwgaW5jbHVkZSBjb3ZlciBsZXR0ZXIgbmV4dCB0
aW1lLgo+Pj4+Cj4+Pj4+IEZ1cnRoZXJtb3JlLCBwbGVhc2UgdXNlIHNjcmlwdHMve2FkZCwgZ2V0
fV9tYWludGFpbmVycy5wbCB0byBmaW5kIHRoZQo+Pj4+PiBjb3JyZWN0IG1haW50YWluZXJzLiBX
aGlsZSBJIGFncmVlIHRoYXQgQ0NpbmcgUkVTVCBpcyBhIGdvb2QgaWRlYSwgeW91Cj4+Pj4+IGhh
dmVuJ3QgQ0NlZCBhbGwgb2YgdGhlbS4KPj4+PiBQcm9ibGVtIGlzIHRoYXQgSSB1c2VkIHRoaXMg
c2NyaXB0Ogo+Pj4+Cj4+Pj4gJCAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgZGVmY29u
ZmlnX3YyL3YyLTAwMDItYXJtLXJlbmFtZS10aW55NjQuY29uZi10by10aW55NjRfZGVmY29uZmln
LnBhdGNoClsuLi5dCj4+Cj4+IENvbnRlbnRzIG9mIHRoZSBwYXRjaCBpcyB0aGUgZXhhY3RseSB0
aGUgc2FtZSBhcyBpbiBteSBvcmlnaW5hbAo+PiBlbWFpbC4gWW91IGNhbiBmaW5kIGJvdGggcGF0
Y2hlcyBhdCBbMV0uCj4KPiBJdCBsb29rcyBsaWtlIHRoZSBwcm9ibGVtIGlzIGJlY2F1c2UgdGhl
IHNlY29uZCBwYXRjaCBvbmx5IGNvbnRhaW5zCj4gcmVuYW1pbmcuIExpbnV4IHJlY2VudGx5IGZp
eGVkIGl0IHdpdGggdGhlIGZvbGxvd2luZyBjb21taXQ6Cj4KPiAwNDU1Yzc0Nzg4ZmQgImdldF9t
YWludGFpbmVyOiBpbXByb3ZlIHBhdGNoIHJlY29nbml0aW9uIgo+Cj4gSSBndWVzcyB3ZSBuZWVk
IHRvIHBvcnQgdGhlIHBhdGNoIGluIFhlbi4gVm9sb2R5bXlyLCB3b3VsZCB5b3UgbWluZCB0bwo+
IHNlbmQgYSBwYXRjaCBmb3IgaXQ/ClllcywgSSBoYXZlIHNlbnQgaXQuIEl0IGlzIHRoZSBmaXJz
dCB0aW1lIEknbSBzZW5kaW5nIHBvcnRlZCBwYXRjaGVzLiBJCmhvcGUsIEkgZGlkIGl0IGluIHRo
ZSByaWdodCB3YXkgOikKCgpbLi4uXQo+Pj4+Cj4+Pj4gYW5kCj4+Pj4KPj4+PiAjIG1ha2UgdGlu
eTY0X2RlZmNvbmZpZwo+Pj4KPj4+IC4uLiB0aGlzIG9uZSB3aWxsIGhpZGUgdGhlIHF1ZXN0aW9u
cy4KPj4+Cj4+Pj4KPj4+PiBBbnl3YXlzLCBpdCBpcyB1cCB0byB5b3UgdG8gYWNjZXB0IG9yIGRl
Y2xpbmUgdGhpcyBwYXJ0aWN1bGFyIHBhdGNoLiBJCj4+Pj4gbW9zdGx5IGludGVyZXN0ZWQgaW4g
dGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMsIGJlY2F1c2Ugb3VyIGJ1aWxkCj4+Pj4gc3lz
dGVtIGRlcGVuZHMgb24gaXQuIFRoaXMgdmVyeSBwYXRjaCBJIHNlbnQgb3V0IG9ubHkgYmVjYXVz
ZSBJIHdhbnRlZAo+Pj4+IHRvIHRpZHkgdXAgdGhpbmdzIGEgYml0LiBCdXQgaWYgeW91IGFyZSBz
YXlpbmcgdGhhdCBpdCBpcyBpbnRlbmRlZCB0bwo+Pj4+IHN0b3JlIG1pbmltYWwgY29uZmlnIGlu
IHRoaXMgd2F5LCBJJ20gb2theSB3aXRoIGl0Lgo+Pj4KPj4+IFRoZSBwb2ludCBvZiByZXZpZXcg
aXMgdG8gZGlzY3VzcyBvbiB0aGUgYXBwcm9hY2ggYW5kIGZpbmQgYSBjb21tb24gYWdyZWVtZW50
Lgo+Pj4KPj4+IElmIHlvdSByZWFkIG15IHByZXZpb3VzIGUtbWFpbCwgSSBkaWRuJ3QgY29tcGxl
dGVseSByZWplY3QgdGhlCj4+PiBhcHByb2FjaCBpbiBteSBwcmV2aW91cyBlLW1haWwuIEkgcG9p
bnRlZCBvdXQgdGhhdCB0aGUgdXNlciBtYXkgYmUKPj4+IG1pc2xlZCBvZiB0aGUgbmFtZSBhbmQg
aGVuY2UgZG9jdW1lbnRhdGlvbiB3b3VsZCBiZSB1c2VmdWwuCj4+Cj4+IEknbSBva2F5IHdpdGgg
dGhpcy4gQW55IGlkZWFzIGhvdyB0byBkb2N1bWVudCBpdD8KPgo+IFdlIGRvbid0IHNlZW0gdG8g
aGF2ZSBhIHBsYWNlIHRvZGF5IHdoZXJlIHdlIGRvY3VtZW50IHRoZSBkZWZjb25maWcuIEkKPiBh
bSB0aGlua2luZyB0byBwdXQgdGhhdCBpbiBkb2NzL21pc2MvYXJtLgo+Cj4gSSB3b3VsZCBkb2N1
bWVudCB0aGUgcHVycG9zZSBvZiBlYWNoIGNvbmZpZy4gVGhlIGRvY3VtZW50YXRpb24gY291bGQK
PiBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgpPa2F5LiBXaWxsIGl0IGJlIG9rYXksIGlmIEknbGwg
c2VuZCBpdCBhcyBhIHNlcGFyYXRlIHBhdGNoPyBZb3UgY2FuCmNvbW1pdCBhbGwgdGhyZWUgcGF0
Y2hlcyBpbiBhIHJvdy4gT3Igc2hvdWxkIEkgc2VudCBhbm90aGVyIHZlcnNpb24gd2l0aAphbGwg
dGhyZWUgcGF0Y2hlcz8KCi0tIApCZXN0IHJlZ2FyZHMsVm9sb2R5bXlyIEJhYmNodWsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
