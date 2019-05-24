Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694A29719
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 13:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU8HX-0005sL-7K; Fri, 24 May 2019 11:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWwb=TY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hU8HU-0005sG-Se
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 11:22:36 +0000
X-Inumbo-ID: 38ef5288-7e16-11e9-b3a2-b7fa93941475
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ef5288-7e16-11e9-b3a2-b7fa93941475;
 Fri, 24 May 2019 11:22:32 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: yCkm3kiZzH2oV0IokbElNsR/MxEX0DQQ6JtMlTl9gE0nEYDN1B5+dUr06fPpbHGDva93mLAwHX
 nwWHVNMWgduCGCaeIrJSCyulA+Ydld2uURnKMNMU4AbMBnOE+dLi+U9ZGmumBpMMnmxTIzrcfX
 s4vL1vC/l7UeNqjKCdwDYdDdsT68YopyIAfwqD6m7sagnrPuzQQkU43KEQOeqyODpLWslGQXJi
 Hie4OtyM0jTIAA7IxAQdwp7H1DXbzzFbpt6ANxAiQxOUjkORcvKsNfcDknpC0R2oqMTy2C0LWb
 wxU=
X-SBRS: 2.7
X-MesageID: 873823
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,506,1549947600"; 
   d="scan'208";a="873823"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23783.54226.449841.704825@mariner.uk.xensource.com>
Date: Fri, 24 May 2019 12:21:54 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190524101343.2rerk7u5jf5shtsi@Air-de-Roger>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-6-roger.pau@citrix.com>
 <23782.30785.859446.290967@mariner.uk.xensource.com>
 <20190524101343.2rerk7u5jf5shtsi@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 5/6] osstest: introduce a script to build a
 FreeBSD package repository
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

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggNS82XSBvc3N0
ZXN0OiBpbnRyb2R1Y2UgYSBzY3JpcHQgdG8gYnVpbGQgYSBGcmVlQlNEIHBhY2thZ2UgcmVwb3Np
dG9yeSIpOgo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDExOjM4OjU3QU0gKzAxMDAsIElhbiBK
YWNrc29uIHdyb3RlOgo+ID4gSSBub3RpY2UgdGhhdCBub25lIG9mIHlvdXIgZnJlZWJzZCBidWls
ZCBqb2JzIHBhc3MgYW55IHNoYXJlLSBob3N0ZmxhZwo+ID4gc28gdGhleSBhbHdheXMgdXNlIGEg
ZnJlc2ggaW5zdGFsbGF0aW9uLiAgSXMgdGhhdCBuZWNlc3NhcnkgPwo+IAo+IEhtLCBJIGRvbid0
IHRoaW5rIHNvLiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCBhbmQKPiBidWlsZC1hbWQ2NC1mcmVl
YnNkLWFnYWluIGNvdWxkIHNoYXJlIGEgaG9zdC4gSSBuZWVkIHRvIHRha2UgYSBsb29rIGF0Cj4g
aG93IHRvIGRvIHRoaXMsIEkgY291bGQgc2VuZCB0aGlzIGFzIGEgc2VwYXJhdGUgZml4IGZvciB0
aGUgZXhpc3RpbmcKPiBqb2JzLgoKU3VyZS4gIEl0J3MgYWNoaWV2ZWQgYnkgcHV0dGluZyBzaGFy
ZS1TT01FVEhJTkcgaW4gKGFueSBvZikgdGhlCmhvc3RmbGFncyBydW52YXJzLiAgU09NRVRISU5H
IG5lZWRzIHRvIGluY2x1ZGUgdGhlIHZhbHVlIG9mIGV2ZXJ5CnNldHRpbmcgd2hpY2ggbWFrZXMg
YSBkaWZmZXJlbmNlLCBleGNlcHQgdGhlIG9zc3Rlc3QgcmV2aXNpb24gKHdoaWNoCmlzIGFkZGVk
IGltcGxpY3RseSkuICBKb2JzIHdpdGggaWRlbnRpY2FsIFNPTUVUSElORyBjYW4gc2hhcmUuCgo+
ID4gPiArIyBDb25zdW1lcyB0aGUgZm9sbG93aW5nIGlucHV0IHJ1bnZhcnM6Cj4gPiA+ICsjIHN2
bnJldmlzaW9uX2ZyZWVic2Rwb3J0czogcG9ydHMgc3ZuIHJldmlzaW9uIGlkIHRvIHVzZS4KPiA+
ID4gKyMgc3ZudHJlZV9mcmVlYnNkcG9ydHMgcG9ydHMgc3ZuIHRyZWUgdG8gZmV0Y2ggdGhlIHNv
dXJjZSBjb2RlIGZyb20uCj4gPiAKPiA+IE1vcmUgcmVndWxhciBpbiBvc3N0ZXN0IHRlcm1zIHdv
dWxkIGJlCj4gPiAgIHRyZWVfZnJlZWJzZHBvcnRzCj4gPiAgIHJldmlzaW9uX2ZyZWVic2Rwb3J0
cwo+ID4gICB0cmVldmNzX2ZyZWVic2Rwb3J0cz1zdm4KPiA+IEJ1dCBJIGd1ZXNzIHN2biBpcyBz
dWZmaWNpZW50bHkgdW5saWtlIHdoYXQgb3NzdGVzdCBleHBlY3RzIG91dCBvZiBhCj4gPiB2Y3Mg
dGhhdCB0aGlzIGlzIG5vdCBmZWFzaWJsZSwgYW5kIGl0IGlzIGJldHRlciB0byBkbyBpdCB0aGlz
IHdheS4KPiAKPiBJIGRvbid0IHJlYWxseSBoYXZlIGFuIG9waW5pb24sIEkgc29tZWhvdyBhc3N1
bWVkIHRoYXQgdXNpbmcgdGhlIHNhbWUKPiBmb3JtYXQgbWlnaHQgaW50ZXJmZXJlIHdpdGggdGhp
bmdzIGxpa2UgYmlzZWN0aW9uLCBzbyBJJ3ZlIGRlY2lkZWQgdG8KPiBwYXNzIHRoZSBnaXQgcmV2
aXNpb24gdXNpbmcgdHJlZV9mcmVlYnNkcG9ydHMgJmMgYW5kIHRoZSBzdm4gcmV2aXNpb24KPiB1
c2luZyB0aGUgbmV3bHkgaW50cm9kdWNlZCBmbGFncy4KCldlbGwsIHN2biBpcyBhd2t3YXJkIHRv
IGNhY2hlIGFuZCB0byB1c2UgYW5kIHByb2JhYmx5IHdlIGNvdWxkbid0IGdldAp0aGUgYmlzZWN0
b3IgdG8gd29yayB3aXRoIGl0LCBpbmRlZWQuICBTbyBlcnIgSSBndWVzcyBJJ20gc2F5aW5nIGxl
YXZlCml0IGFzIGl0IGlzLgoKPiA+ID4gK3N1YiBjcmVhdGVfamFpbCgpIHsKPiA+ID4gKyAgICBt
eSAkc3JjX3ByZWZpeCA9ICRyeyJmcmVlYnNkX2Rpc3RwYXRoIn0gfHwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGdldF9zdGFzaGVkKCJwYXRoX2ZyZWVic2RkaXN0IiwgJHJ7ImZyZWVic2Ri
dWlsZGpvYiJ9KTsKPiA+ID4gKyAgICBteSAkZHN0X3ByZWZpeCA9ICIvcm9vdC9zZXRzIjsKPiA+
IAo+ID4gRG8gd2UgbmVlZCBhIGphaWwgZm9yIHRoaXMgPyAgV2UgaGF2ZSBhIHdob2xlIGJhcmVt
ZXRhbCBPUyBpbnN0YWxsCj4gPiB3aG9zZSBlbnRpcmUgcHVycG9zZSBpcyB0byBkbyB0aGlzIGJ1
aWxkIC4uLgo+IAo+IFllcywgdGhhdCdzIGhvdyB0aGUgcmVwb3NpdG9yeSBwYWNrYWdlIGJ1aWxk
ZXIgKHBvdWRyaWVyZSkgd29ya3MsIGl0Cj4gcmVxdWlyZXMgYSBqYWlsIHRvIGRvIHRoZSBwYWNr
YWdlIGJ1aWxkaW5nLiBJbiBvdXIgY2FzZSBpdCdzIG5vdCBzbwo+IGltcG9ydGFudCwgYnV0IEkg
YXNzdW1lIHRoaXMgaXMgbW9zdGx5IGRvbmUgdG8gYWx3YXlzIHVzZSBhIGNsZWFuCj4gaW5zdGFs
bCwgc28gdGhhdCBjdXJyZW50bHkgaW5zdGFsbGVkIHBhY2thZ2VzIG9uIHRoZSBzeXN0ZW0gZG9u
J3QKPiBpbnRlcmZlcmUgd2l0aCBwYWNrYWdlIGJ1aWxkaW5nLgoKRmFpciBlbm91Z2guCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
