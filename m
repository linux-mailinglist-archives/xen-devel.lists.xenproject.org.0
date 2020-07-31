Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37B2345C9
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:27:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1U8C-0006DC-0O; Fri, 31 Jul 2020 12:27:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1U8A-0006D5-U8
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:27:22 +0000
X-Inumbo-ID: 2e45436b-d329-11ea-8e2c-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e45436b-d329-11ea-8e2c-bc764e2007e4;
 Fri, 31 Jul 2020 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596198442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NBzcklOp4UfUAL66oBP6JbSlN2WSKWlVtlvvVAPKoPU=;
 b=BIln1sWuqpBlVUuZLclbPksjw90SUugTVgKf958GtLI7p5w2NA9Gfena
 Z8ud/LWazVTtP8yldRjp7ihPU6pQRKvRDwWP4/JBmtVUUqraHXZm1yZp2
 WOVj4l8KZVbtBFznIgEcVsd839bCP8pbzVrwdv3XEtIzGU3B8jz5/EkLH M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CNA55Zc8AGjFXv5PoNVPW/UxgArtZ/lQBHB5b+qjiKt13ztSuW06M2i/aTkrhRUAO4e5tqgoFV
 62FL+yOV3X1fd+f7x1RhbCsaztv55U7dOX6abzvkUgAjtJ5Fkhv6pdI0dowI7EGEAxgtgM1hOP
 yNmRvKIq8vHRu1mEF111SttKBsXG3OvhiIv0XJkc5WG1CvKZZdqMgFKP2fFYDscFKlp4leIvdQ
 /1EPF+dSPKRsH+RHIdYgYUoCaydgLFc165KmwLVb6Oz7B78RTPyU754IW3Bkf6pXjV1T3vrek2
 XO8=
X-SBRS: 3.7
X-MesageID: 24498915
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="24498915"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
Thread-Topic: RESCHEDULED Call for agenda items for Community Call, August 13
 @ 15:00 UTC
Thread-Index: AQHWZoSNV69Oim50MkyA6CRuliqKJqkgITQAgAFbngCAAAB2gA==
Date: Fri, 31 Jul 2020 12:27:16 +0000
Message-ID: <047B12C2-71AA-459F-853C-DF1CD040D6C1@citrix.com>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
 <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
 <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
In-Reply-To: <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <9032569B6F620A4FB03AA7F5B98ADDEA@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>,
 Brian Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Olivier
 Lambert <olivier.lambert@vates.fr>, Matt Spencer <Matt.Spencer@arm.com>,
 Robert Townley <rob.townley@gmail.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Rian Quinn <rianquinn@gmail.com>, Varad Gautam <varadgautam@gmail.com>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Ji, John" <john.ji@intel.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDMxLCAyMDIwLCBhdCAxOjI1IFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAuMDcuMjAyMCAxNzo0MSwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+PiBPbiBKdWwgMzAsIDIwMjAsIGF0IDQ6MTcgUE0sIEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGV5IGFsbCwNCj4+
PiANCj4+PiBUaGUgY29tbXVuaXR5IGNhbGwgaXMgc2NoZWR1bGVkIGZvciBuZXh0IHdlZWssIDYg
QXVndXN0LiAgSSwgaG93ZXZlciwgd2lsbCBiZSBvbiBQVE8gdGhhdCB3ZWVrOyBJIHByb3Bvc2Ug
cmVzY2hlZHVsaW5nIGl0IGZvciB0aGUgZm9sbG93aW5nIHdlZWssIDEzIEF1Z3VzdCwgYXQgdGhl
IHNhbWUgdGltZS4NCj4+PiANCj4+PiBUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIFpaWiBhbmQg
eW91IGNhbiBlZGl0IHRvIGFkZCBpdGVtcy4gIEFsdGVybmF0aXZlbHksIHlvdSBjYW4gcmVwbHkg
dG8gdGhpcyBtYWlsIGRpcmVjdGx5Lg0KPj4gDQo+PiBTb3JyeSwgaW4gYWxsIG15IG1hbnVhbCB0
ZW1wbGF0aW5nIEkgc2VlbSB0byBoYXZlIG1pc3NlZCB0aGlzIG9uZS4gIEhlcmXigJlzIHRoZSBV
Ukw6DQo+PiANCj4+IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMy9wYWQvZWRpdC85YzU4OTkz
YTA4ZmU5NzQ1MWYwYTViNmM4YmI5MDZiMS8NCj4gDQo+IEkgZ2V0ICJUaGlzIGxpbmsgZG9lcyBu
b3QgZ2l2ZSB5b3UgYWNjZXNzIHRvIHRoZSBkb2N1bWVudCIuIE1heWJlIGENCj4gcGVybWlzc2lv
bnMgcHJvYmxlbT8gSSd2ZSBtZWFudCB0byBhZGQgYSAibWluaW11bSB0b29sY2hhaW4gdmVyc2lv
bnMiDQo+IHRvcGljIC4uLg0KDQpUcnkgdGhpcyBvbmU/DQoNCmh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9WbExkaml3N2lCbTBSLWVmT015Q1krS3MvDQoNClRoYXQgc291bmRz
IGxpa2UgYSBnb29kIHRvcGljLg0KDQogLUdlb3JnZQ==

