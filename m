Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F155F1FA57
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 21:10:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQzG2-0006S1-PC; Wed, 15 May 2019 19:08:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UN9r=TP=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hQzG1-0006Rw-43
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 19:08:05 +0000
X-Inumbo-ID: c2fffb86-7744-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::626])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2fffb86-7744-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OFYcO4MrV2ndGZPvpercgQsK8LzAvERAe6uej0neHI=;
 b=pfMLOQ9g8e1pb8/a+afBRFGlZrgTB3I3dD/Wy2rEsCJZOgz3paNqxNxxr30+wBCcTt/uJ9hGrt1QRdUwE0oNgCN8XBZdVDYAmH0DoDeeyS+P7hqlDoG9dkQ4beK0n6cpaAl5oWVqYvOPH6Jp3zxOwtECvArohvFUXtddqYK0QnKEsSqP3ze4Db8ekT/h+BwfT5sHQEOs+Zh8nlS0MsJQh98tAC0cSZ4HUreH/SptEzIZd0vgtWT9SfhYrjcIvX31AFvFHyCPfTwIYsyzhJIjcZFMUcCC44/4XTdd+FZvXIwYd4p+0zogdZNpSHc97z9sucPkE+6AW0O1Ld4aBCCbSg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4514.eurprd03.prod.outlook.com (20.177.42.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 19:07:57 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 19:07:57 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v1 1/2] makefile: add support for *_defconfig targets
Thread-Index: AQHVCoVEjf6vgXECMECEMZlXX+Yh6aZryXaAgADEgQA=
Date: Wed, 15 May 2019 19:07:57 +0000
Message-ID: <87bm038rjn.fsf@epam.com>
References: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
 <5CDBBEB5020000780022F176@prv1-mh.provo.novell.com>
In-Reply-To: <5CDBBEB5020000780022F176@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a609850-314b-4a51-b9ec-08d6d968a47e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB4514; 
x-ms-traffictypediagnostic: AM0PR03MB4514:
x-microsoft-antispam-prvs: <AM0PR03MB451464C41002CA1E31B652E4E6090@AM0PR03MB4514.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(366004)(376002)(189003)(199004)(186003)(80792005)(486006)(256004)(66066001)(76176011)(8936002)(14444005)(446003)(6506007)(68736007)(3846002)(8676002)(71200400001)(71190400001)(6116002)(81156014)(81166006)(53936002)(6916009)(99286004)(4326008)(11346002)(36756003)(26005)(54906003)(6246003)(102836004)(2616005)(2906002)(25786009)(55236004)(476003)(53546011)(66446008)(508600001)(66556008)(7416002)(6436002)(7736002)(305945005)(6486002)(76116006)(14454004)(5660300002)(316002)(86362001)(64756008)(66946007)(66476007)(73956011)(6512007)(229853002)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4514;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NNRLv3pSqheu3YjeLHISWPpKBOvcU/BpZihbKnuBFhOfaKuQ6WNLZE3B9jo6ik4oCyarpi1U2IlHQcpH+9DSFigeRrJyJzBiN4buxIxBTlzhWv2xcaB610psR+JZB0N6Vf/WkEvbbmwC1ijf73jsR4PlCCy9rMrC+VXmRTRbpNxuvi7dSxBbetA2swC7mcSWcbe5PUglqQxhoWRb1EZ77cWZAA0nR+/8zSLwL9xw95HAOTc5UEASVAFYNJe4QokOtKaGv2A0S3jebIwJ7S9G1x61DDc17bNMQEoK2EgBAQsOQTx6ngate1UuTbtptF74z6ainfHDImacmMlDupEd2QphGKDcDbTEPS7UJR+Ls49GYBuz8sCzWSgywzzr6CPpIOp60pbV5wan2YbGqIRpL5sq/xjtXHhhwTFHzjL59k8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a609850-314b-4a51-b9ec-08d6d968a47e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 19:07:57.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4514
Subject: Re: [Xen-devel] [PATCH v1 1/2] makefile: add support for
 *_defconfig targets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvIEphbiwKCkphbiBCZXVsaWNoIHdyaXRlczoKCj4+Pj4gT24gMTQuMDUuMTkgYXQgMjA6
NDUsIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9NYWtl
ZmlsZQo+PiArKysgYi94ZW4vTWFrZWZpbGUKPj4gQEAgLTI2OSw2ICsyNjksOSBAQCBrY29uZmln
IDo9IHNpbGVudG9sZGNvbmZpZyBvbGRjb25maWcgY29uZmlnIG1lbnVjb25maWcgZGVmY29uZmln
IFwKPj4gICQoa2NvbmZpZyk6Cj4+ICAJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25m
aWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RD
Qz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiAkQAo+Cj4gU28gdGhlIHJ1bGUgeW91
IGFkZCBtYXRjaGVzIHRoaXMgb25lLiBJcyB0aGVyZSBhIHJlYXNvbiAuLi4KPgo+PiArJV9kZWZj
b25maWc6Cj4KPiAuLi4gd2h5IHlvdSBjYW4ndCBzaW1wbHkgYWRkIHRoaXMgdG8gdGhlIGtjb25m
aWcgdmFyaWFibGUgc2V0IGEgZmV3Cj4gbGluZXMgdXA/IE9oIC0gbmV3ZXIgbWFrZSBkb2Vzbid0
IGxpa2UgbWl4aW5nIHBhdHRlcm4gYW5kCj4gbm9uLXBhdHRlcm4gcnVsZXMuClllcywgbXkgZmly
c3QgaW50ZW50aW9uIHdhcyB0byBhZGQgdGhpcyBydWxlIHRvIHRoZSBrY29uZmlnIHZhcmlhYmxl
LgpTYWRseSBtYWtlIGRvZXMgbm90IGFsbG93cyB0aGlzCgo+IFBlcmhhcHMgd29ydGggYSBicmll
ZiBjb21tZW50LCB0byBqdXN0aWZ5IHRoZQo+IHJlZHVuZGFuY3k/ClN1cmUsIHdpbGwgYWRkIGlu
IHRoZSBuZXh0IHZlcnNpb24uCgo+IE9yIGFsdGVybmF0aXZlbHksIGhvdyBhYm91dCB1c2luZyAk
KHdpbGRjYXJkICkKPiBpbnN0ZWFkIG9mIGEgcGF0dGVybiBydWxlLCB0aHVzIHJlamVjdGluZyBp
bnZhbGlkIHRhcmdldHMgcmlnaHQgYXdheSwKPiByYXRoZXIgdGhhbiBkZWZlcnJpbmcgdG8gdGhl
IHJlY3Vyc2l2ZSBtYWtlIHRvIG5vdGljZSB0aGUgZXJyb3I/CkkgY29uc2lkZXJlZCB0aGlzLCBi
dXQgSSBjYW4ndCBzZWUgaG93ICQod2lsZGNhcmQgKSBjYW4gYmUgdXNlZC4KQUZBSUssICQod2ls
ZGNhcmQgKSBleHBlY3RzIHRvIGZpbmQgYSBmaWxlLCBtYXRjaGluZyB0aGUgd2lsZGNhcmQuCkJ1
dCAlX2RlZmNvbmZpZyBpcyB0aGUgcGhvbnkgcnVsZSwgc28gSSBjYW4ndCBpbWFnaW5lIGhvdyB0
byB1c2UKJCh3aWxkY2FyZCApIGluIHRoaXMgY2FzZS4KCk9uIG90aGVyIGhhbmQsIGZvbGxvd2lu
ZyBydWxlIGNoZWNrcyB0aGUgcHJlc2VuY2Ugb2YgcmVxdWlyZWQgX2RlZmNvbmZpZyBmaWxlOgoK
JV9kZWZjb25maWc6IGFyY2gvJChTUkNBUkNIKS9jb25maWdzLyVfZGVmY29uZmlnCgpTbywgSSBj
YW4gZG8gaW4gdGhpcyB3YXkgaWYgeW91IHdpc2guCgpCVFcsIEknbGwgYWRkIC5QSE9OWTogJV9k
ZWZjb25maWcgaW4gdGhlIG5leHQgdmVyc2lvbi4KCi0tCkJlc3QgcmVnYXJkcywgVm9sb2R5bXly
IEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
