Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9E1F66B
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 16:20:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQujN-0000Vx-RW; Wed, 15 May 2019 14:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQujM-0000Vs-GJ
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 14:18:04 +0000
X-Inumbo-ID: 3e61e3bc-771c-11e9-bc98-0bad22623e23
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e61e3bc-771c-11e9-bc98-0bad22623e23;
 Wed, 15 May 2019 14:18:00 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 08:17:59 -0600
Message-Id: <5CDC1F96020000780022F4BF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 08:17:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
In-Reply-To: <20190508132403.1454-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gQEAgLTY1NSw2ICs2NTUsODIgQEAgc3RhdGljIHZv
aWQgaW9tbXVfZHVtcF9wMm1fdGFibGUodW5zaWduZWQgY2hhciBrZXkpCj4gICAgICB9Cj4gIH0K
PiAgCj4gKyNpZmRlZiBDT05GSUdfSEFTX1BDSQo+ICsKPiArc3RydWN0IGlvbW11X2dyb3VwIHsK
PiArICAgIHVuc2lnbmVkIGludCBpZDsKPiArICAgIHVuc2lnbmVkIGludCBpbmRleDsKPiArICAg
IHN0cnVjdCBsaXN0X2hlYWQgZGV2c19saXN0Owo+ICt9OwoKQ291bGQgdGhlc2UgYWRkaXRpb25z
IGFzIGEgd2hvbGUgZ28gaW50byBhIG5ldyBncm91cHMuYz8KCj4gK2ludCBpb21tdV9ncm91cF9h
c3NpZ24oc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gK3sKPiArICAgIGNvbnN0IHN0cnVjdCBpb21t
dV9vcHMgKm9wczsKPiArICAgIHVuc2lnbmVkIGludCBpZDsKPiArICAgIHN0cnVjdCBpb21tdV9n
cm91cCAqZ3JwOwo+ICsKPiArICAgIG9wcyA9IGlvbW11X2dldF9vcHMoKTsKPiArICAgIGlmICgg
IW9wcyB8fCAhb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkICkKClRoZSB3YXkgaW9tbXVfZ2V0X29w
cygpIHdvcmtzIHRoZSBsZWZ0IHNpZGUgb2YgdGhlIHx8IGlzIHBvaW50bGVzcy4KCj4gKyAgICAg
ICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgaWQgPSBvcHMtPmdldF9kZXZpY2VfZ3JvdXBfaWQocGRl
di0+c2VnLCBwZGV2LT5idXMsIHBkZXYtPmRldmZuKTsKPiArICAgIGdycCA9IGdldF9pb21tdV9n
cm91cChpZCk7CgpJIGRvbid0IHRoaW5rIHNvbGl0YXJ5IGRldmljZXMgc2hvdWxkIGJlIGFsbG9j
YXRlZCBhIGdyb3VwLiBBbHNvCnlvdSBkb24ndCBoYW5kbGUgZmFpbHVyZSBvZiBvcHMtPmdldF9k
ZXZpY2VfZ3JvdXBfaWQoKS4KCj4gKyAgICBpZiAoICEgZ3JwICkKCk5pdDogU3RyYXkgYmxhbmsu
Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9w
Y2kuaAo+IEBAIC03NSw2ICs3NSw5IEBAIHN0cnVjdCBwY2lfZGV2IHsKPiAgICAgIHN0cnVjdCBs
aXN0X2hlYWQgYWxsZGV2c19saXN0Owo+ICAgICAgc3RydWN0IGxpc3RfaGVhZCBkb21haW5fbGlz
dDsKPiAgCj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIGdycGRldnNfbGlzdDsKCkRvZXMgdGhpcyBz
ZXBhcmF0ZSBsaXN0IHByb3ZpZGUgbXVjaCB2YWx1ZT8gVGhlIGRldmljZXMgaW4gYSBncm91cAph
cmUgZ29pbmcgdG8gbW92ZSBiZXR3ZWVuIHR3byBkb21haW5fbGlzdC1zIGFsbCBpbiBvbmUgZ28s
IHNvCm9uY2UgeW91IGtub3cgdGhlIGRvbWFpbiBvZiBvbmUgeW91J2xsIGJlIGFibGUgdG8gZmlu
ZCB0aGUgcmVzdCBieQppdGVyYXRpbmcgdGhhdCBkb21haW4ncyBsaXN0LiBJcyB0aGUgZmVhciB0
aGF0IHN1Y2ggYW4gaXRlcmF0aW9uIG1heQpiZSB0ZW5zIG9mIHRob3VzYW5kcyBvZiBlbnRyaWVz
IGxvbmcsIGFuZCBoZW5jZSBiZWNvbWUgYW4gaXNzdWUKd2hlbiB0cmF2ZXJzZWQ/IEkgaGF2ZSBu
byBpZGVhIGhvdyBtYW55IFBDSSBkZXZpY2VzIHRoZSBiaWdnZXN0CnN5c3RlbXMgdG9kYXkgd291
bGQgaGF2ZSwgYnV0IGlmIHRyYXZlcnNhbCB3YXMgYW4gaXNzdWUsIHRoZW4gaXQKd291bGQgYWxy
ZWFkeSBiZSB3aXRoIHRoZSBjb2RlIHdlJ3ZlIGdvdCBub3cuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
