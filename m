Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248041876F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 11:08:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOf0H-0007Xq-JM; Thu, 09 May 2019 09:06:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOf0G-0007Xl-6a
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 09:06:12 +0000
X-Inumbo-ID: aef8a468-7239-11e9-861b-2b3d4fc4cb19
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aef8a468-7239-11e9-861b-2b3d4fc4cb19;
 Thu, 09 May 2019 09:06:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 03:06:07 -0600
Message-Id: <5CD3ED7E020000780022D0C9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 03:06:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190206125314.10869-1-aisaila@bitdefender.com>
 <20190206125314.10869-2-aisaila@bitdefender.com>
 <5CAB69AB0200007800225785@prv1-mh.provo.novell.com>
 <7b325d79-dc03-6927-9430-29bace6be040@bitdefender.com>
In-Reply-To: <7b325d79-dc03-6927-9430-29bace6be040@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC v3 2/2] x86/emulate: Send vm_event from
 emulate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE3OjQyLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+Pj4gQEAgLTEyMjQsNyArMTI5MywzNSBAQCBpbnQgaHZtZW11bF9pbnNuX2ZldGNoKAo+Pj4g
ICAgICAgICAgIGNvbnRhaW5lcl9vZihjdHh0LCBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCwgY3R4
dCk7Cj4+PiAgICAgICAvKiBDYXJlZnVsLCBhcyBvZmZzZXQgY2FuIHdyYXAgb3IgdHJ1bmNhdGUg
V1JUIGluc25fYnVmX2VpcC4gKi8KPj4+ICAgICAgIHVpbnQ4X3QgaW5zbl9vZmYgPSBvZmZzZXQg
LSBodm1lbXVsX2N0eHQtPmluc25fYnVmX2VpcDsKPj4+ICsgICAgcGFkZHJfdCBncGE7Cj4+PiAr
ICAgIHVpbnQzMl90IHBmZWMgPSBQRkVDX3BhZ2VfcHJlc2VudCB8IFBGRUNfaW5zbl9mZXRjaDsK
Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBhZGRyLCByZXBzID0gMTsKPj4+ICsgICAgaW50IHJjOwo+
Pj4gKyAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCBvbGQ7Cj4+PiArCj4+PiArICAgIHJjID0g
aHZtZW11bF92aXJ0dWFsX3RvX2xpbmVhcihzZWcsIG9mZnNldCwgYnl0ZXMsICZyZXBzLAo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHZtX2FjY2Vzc19pbnNuX2ZldGNo
LCBodm1lbXVsX2N0eHQsICZhZGRyKTsKPj4gCj4+IFRoZSBkb3VibGUgdHJhbnNsYXRpb24gaXMg
YXMgcHJvYmxlbWF0aWMgaGVyZSwgYnV0IHdoYXQncyB3b3JzZToKPj4gCj4+PiArICAgIGlmICgg
cmMgPT0gWDg2RU1VTF9FWENFUFRJT04gKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICB4ODZfZW11
bF9yZXNldF9ldmVudChjdHh0KTsKPj4+ICsgICAgICAgIHJjID0gWDg2RU1VTF9PS0FZOwo+Pj4g
KyAgICB9Cj4+IAo+PiBZb3UgemFwIGFuIGVycm9yIGhlcmUsIGJ1dCAuLi4KPiAKPiBJbiB0aGlz
IGNhc2UgaHZtZW11bF92aXJ0dWFsX3RvX2xpbmVhcigpIGNhbiBjYWxsCj4geDg2X2VtdWxfaHdf
ZXhjZXB0aW9uKCkgYW5kIHRoZW4gc2lnbmFscyB0aGUgY2FsbGVyIHRvIGluamVjdCB0aGUgCj4g
ZXhjZXB0aW9uLiBJIGRvbjt0IHdhbnQgdG8gaW5qZWN0IGEgbm9uLXVzZXIgc2VnbWVudCBoZXJl
IGFuZCBzbyBJIGxlYXZlIAo+IHRoZSBjdHh0IGFzIGl0IHdhcyBiZWZvcmUuCj4gCj4+IAo+Pj4g
KyAgICBpZiAoIGh2bWVtdWxfY3R4dC0+c2VnX3JlZ1t4ODZfc2VnX3NzXS5kcGwgPT0gMyApCj4+
PiArICAgICAgICBwZmVjIHw9IFBGRUNfdXNlcl9tb2RlOwo+Pj4gKwo+Pj4gKyAgICBvbGQgPSAq
aHZtZW11bF9jdHh0Owo+Pj4gKyAgICByYyA9IGh2bWVtdWxfbGluZWFyX3RvX3BoeXMoYWRkciwg
JmdwYSwgYnl0ZXMsICZyZXBzLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGZlYywgaHZtZW11bF9jdHh0KTsKPj4gCj4+IC4uLiB5b3UgaGFwcGlseSB1c2UgImFkZHIiIGhl
cmUgYW55d2F5Lgo+IAo+IFRoZSBhZGRyZXNzIGhlcmUgaXMgb2sgdG8gYmUgdXNlZCBvciBtYXli
ZSBhIGlmICggcmMgIT0gWDg2RU1VTF9PS0FZICkgCj4gY2hlY2sgY2FuIGJlIHB1dCBhZnRlciBn
ZXR0aW5nIHRoZSBhZGRyZXNzLgoKYWRkciBpcyBkZWZpbml0ZWx5IG5vdCBva2F5IHRvIGJlIHVz
ZWQgaWYgaXQgd2Fzbid0IGluaXRpYWxpemVkLgoKPj4+ICsgICAgaWYgKCByYyA9PSBYODZFTVVM
X0VYQ0VQVElPTiApCj4+PiArICAgIHsKPj4+ICsgICAgICAgICpodm1lbXVsX2N0eHQgPSBvbGQ7
Cj4+PiArICAgICAgICByYyA9IFg4NkVNVUxfT0tBWTsKPj4+ICsgICAgfQo+Pj4gICAKPj4+ICsg
ICAgaWYgKCBncGEgJiYgaHZtZW11bF9zZW5kX3ZtX2V2ZW50KGdwYSwgYWRkciwgZ2FkZHJfdG9f
Z2ZuKGdwYSksCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZmVj
LCBodm1lbXVsX2N0eHQpICkKPj4+ICsgICAgICAgIHJldHVybiBYODZFTVVMX0FDQ0VTU19FWENF
UFRJT047Cj4+IAo+PiBJcyB0aGVyZSBhbnl0aGluZyByZW5kZXJpbmcgZ3BhIGJlaW5nIHplcm8g
YW4gaW52YWxpZCAvIGltcG9zc2libGUKPj4gc2l0dWF0aW9uPwo+IAo+IEluIHRlc3RzIEkgY2Ft
ZSBhY3Jvc3MgZ3BhID09IDAgc28gdGhhdCBpcyB3aHkgdGhlIGNoZWNrIHdhcyB0aGVyZSBJIAo+
IHdpbGwgaGF2ZSB0byB0ZXN0IGlzIHRoaXMgY2FuIGJlIHNvbHZlZCB3aXRoIHRoZSBYODZFTVVM
X09LQVkgY2hlY2sgZnJvbSAKPiBhYm92ZS4KCkV2ZW4gaWYgeW91IGNhbWUgYWNyb3NzIGdwYSAw
IHdoaWxlIHRlc3RpbmcsIHRoZSBzb2x1dGlvbiB0byBhdm9pZAppdCAoaW4gY2FzZSB5b3VyIHBv
c3NpYmxlIHNvbHV0aW9uIHR1cm5zIG91dCB0byBub3Qgd29yaykgY2Fubm90IGJlCnRvIG1ha2Ug
aXQgc3BlY2lhbCBpbiBhbnkgd2F5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
