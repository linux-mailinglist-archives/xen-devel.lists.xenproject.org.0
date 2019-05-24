Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D529CFA
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 19:30:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUDyV-0002ya-6d; Fri, 24 May 2019 17:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWwb=TY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hUDyT-0002yV-Uj
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 17:27:21 +0000
X-Inumbo-ID: 2ce49042-7e49-11e9-a479-cfa2614be6c3
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ce49042-7e49-11e9-a479-cfa2614be6c3;
 Fri, 24 May 2019 17:27:16 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
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
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: kPdm1ZA2qmxs2ILl6T48r3Iwpe57WYs9Jdk603wIUT9TGJKr4YkdtN+9I1fz5Lo/VhtX+AWaM/
 BW0AC4OcIYjIZhM84VLtuib1x7vk0vTdoNRs6skkt4Q7SJRGAny9SY5RpJmOdhujH6PQHnLRbN
 OXJFJ5MrFaEvZWTTO49zgrA7OIbSQVbsRgyiywRqV+xeurc0D6lv09UoZFuCxWc3yHNyaT8V+a
 bAEUcbYILCtO9KqP70/D0KV+l/QyI1Pq0u3Btp/PEgEJitW44UnxTnTvGDE9WzqIw2jWffQcD3
 Dws=
X-SBRS: 2.7
X-MesageID: 891367
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="891367"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23784.10580.1233.680380@mariner.uk.xensource.com>
Date: Fri, 24 May 2019 18:26:44 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190524104545.7s7hi722qw7fobkv@Air-de-Roger>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-7-roger.pau@citrix.com>
 <23782.32437.361492.752289@mariner.uk.xensource.com>
 <20190524104545.7s7hi722qw7fobkv@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 6/6] osstest: use a locally built pkg
 repository for FreeBSD
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

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggNi82XSBvc3N0
ZXN0OiB1c2UgYSBsb2NhbGx5IGJ1aWx0IHBrZyByZXBvc2l0b3J5IGZvciBGcmVlQlNEIik6Cj4g
T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTI6MDY6MjlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gPiBJIHJlYWxpc2UgdGhpcyBpcyBhIGJpdCBsYXRlIHRvIGJlIHNheWluZyB0aGlzLCBi
dXQgaGFkIHlvdQo+ID4gY29uc2lkZXJlZCBtYWtpbmcgdGhlIHBhY2thZ2VzIGJ1aWxkIGEgZGlm
ZmVyZW50IHN0ZXAgaW4gdGhlIHNhbWUKPiA+IGpvYiA/ICBUaGF0IG1pZ2h0IG1ha2UgYSBsb3Qg
b2YgdGhpcyBnbyBhd2F5Li4uCj4gCj4gRG8geW91IG1lYW4gdG8gYnVpbGQgdGhlIHBhY2thZ2Vz
IGluIGJ1aWxkLXByZXAgaW5zdGVhZCBvZiByZWx5aW5nIG9uCj4gaGF2aW5nIGEgY3VzdG9tIGJp
bmFyeSByZXBvc2l0b3J5PwoKTm8uICBNYXliZSBJIGFtIGNvbmZ1c2VkLiAgSSB0aG91Z2h0IHlv
dXIgdXN1YWwgZmxpZ2h0IHdhcwogIDEgIGluc3RhbGwgYW5vaW50ZWQgZnJlZWJzZAogIDIgIGJ1
aWxkIHRoaXMgZnJlZWJzZAogIDMrIGJ1aWxkIHRoaXMgcGFja2FnZSByZXBvCiAgNCAgaW5zdGFs
bCB0aGlzIGZyZWVic2QgKGZyb20gc3RlcCAyKQogIDUgIHJlYnVpbGQgdGhpcyBmcmVlYnNkIChm
b3IgdGVzdGluZyB0aGF0IHRoZSBidWlsZCBkaWRuJ3QgYnJlYWspCiAgNiAgcmVidWlsZCB0aGlz
IHBhY2thZ2UgcmVwbyAoIikKICA3KyBpbnN0YWxsIHRoaXMgcGFja2FnZSByZXBvbwogIDgrIGJ1
aWxkIHhlbgoKTXkgcXVlc3Rpb24gaXMgd2h5IDIvMyBhbmQgNS82IGFyZSBkaWZmZXJlbnQgam9i
cy4gIElmIHlvdSBtYWRlIDIrMyBhCnNpbmdsZSBqb2IgKHdpdGggMiBhbmQgMyBiZWluZyBzZXBh
cmF0ZSBzdGVwcykgdGhlbiB0aGVyZSB3b3VsZCBvbmx5Cm5lZWQgdG8gYmUgYSBzaW5nbGUgYW5v
aW50bWVudC4KCj4gSUlSQyB0aGUgcGFja2FnZSBidWlsZGluZyBqb2IgdGFrZXMgYSBub24tdHJp
dmlhbCBhbW91bnQgb2YgdGltZSAoMi0zaAo+IElJUkMpLCBiZWNhdXNlIGl0IGhhcyB0byBidWls
ZCBnY2MgKGZvciBTZWFCSU9TKSBhbmQgcHl0aG9uLCBwZXJsLi4uCgpZb3UgY291bGQgbWFrZSB0
aGUgcGFja2FnZSBidWlsZGluZyBqb2Igb3B0aW9uYWwgaWYgeW91IG9ubHkgd2FudCB0bwpkbyBp
dCBzb21lIG9mIHRoZSB0aW1lLgoKPiA+ID4gKwkgICAgIyByZWZrZXk6IGZyZWVic2QgICAgICAg
ICAgam9iOiBidWlsZC08YXJjaD4tZnJlZWJzZAo+ID4gPiArCSAgICAjIHJlZmtleTogZnJlZWJz
ZC1wYWNrYWdlcyBqb2I6IGJ1aWxkLTxhcmNoPi1mcmVlYnNkLXBhY2thZ2VzCj4gPiA+ICsgICAg
ICAgICAgICBhbm9pbnQ9IiRhbm9pbnQgXCIkYW5vaW50ZWRcIiAkZmxpZ2h0IFwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgYnVpbGQtJGZyZWVic2RfYXJjaC0kZnJlZWJzZF9uYW1lIgo+ID4g
Cj4gPiBNYXliZSB1c2UgYW4gYXJyYXkgdmFyaWFibGUgZm9yIGFub3VudCwgYW5kIHRoZW4geW91
IGNhbiBhdm9pZCB0aGUKPiA+IHNoZWxsIFwiIHF1b3RpbmcuCj4gCj4gUGxlYXNlIGJlYXIgd2l0
aCBtZSwgYnV0IGNhbiB5b3UgZWxhYm9yYXRlIG9uIHRoaXM/CgpSb3VnaGx5LAoKICBhbm9pbnQ9
KCkKICAuLi4uCiAgICAgYW5vaW50Kz0oIiRhbm9pbnRlZCIgJGZsaWdodCBidWlsZC0uLikKICAu
Li4KICAuL21nLWFub2ludCAiJHthbm9pbnRbQF19IgoKTm90ZSB0aGF0IHRoZSBcIiBcIiBjb25z
dHJ1Y3QgaGFzIGdvbmUsIGJlY2F1c2UgdGhlcmUgaXMgbm93IG5vCmFkZGl0aW9uYWwgbGF5ZXIg
b2Ygc2hlbGwgZGVxdW90aW5nLgoKPiA+IFRoZXJlIHNlZW1zIGxpa2UgYSBsb3Qgb2YgcmVwZXRp
dGlvbiBoZXJlLiAgRm9yIGV4YW1wbGUsIEZSRUVCU0RfRElTVAo+ID4gb3ZlcnJpZGVzIEZyZWVC
U0REaXN0IGJ1dCAvJGFyY2ggaXMgYXBwZW5kZWQgaW4gdHdvIHBsYWNlcy4gIE1heWJlCj4gPiAk
e0ZSRUVCU0RfRElTVC0gLi4uIHNvbWV0aGluZyAuLi4gfSB3b3VsZCBiZSBiZXR0ZXIgPwo+IAo+
IE9LLCBsZXQgbWUgdHJ5IHRvIHJlbW92ZSBzb21lIG9mIHRoZSBkdXBsaWNhdGlvbiBoZXJlLgoK
VGhhbmtzLgoKQW5vdGhlciBzdWdnZXN0aW9uIEkgbWVudGlvbmVkIElSTCB3aGljaCBJIHdhbnRl
ZCB0byB3cml0ZSBkb3duIHdhczoKbWF5YmUgaGF2ZSBtZy1hbm9pbnQgaGF2ZSBhIHJlcG9ydGlu
ZyBtb2RlIHdoZXJlIGl0IHByaW50cyBzb21ldGhpbmcKc3VpdGFibGUgZm9yIHNoZWxsIGBldmFs
Jy4KCj4gPiBUaGlzIGZlZWxzIHZlcnkgc2ltaWxhciB0byB0aGUgY29kZSBhYm92ZSwgYWx0aG91
Z2ggaXQgbGFja3MgdGhlCj4gPiBzcGVjaWFsIGhhbmRsaW5nIGZvciB0aGUgdmVyc2lvbi4KPiAK
PiBNYXliZSBJIGNhbiBzZWUgYWJvdXQgZmFjdG9yaW5nIHNvbWUgb2YgdGhpcyBpbnRvIGEgaGVs
cGVyLCBidXQgdGhlcmUKPiBhcmUgc2xpZ2h0IGRpZmZlcmVuY2VzIGluIGJvdGggaWYgYnJhbmNo
ZXMgdGhhdCBJJ20gbm90IHN1cmUgY2FuIGJlCj4gZmFjdG9yZWQgb3V0LgoKTW1tbS4KCj4gV2h5
IEkgZG9uJ3Qgc3RhcnQgYnkgZml4aW5nIHRoZSByZXBldGl0aW9uIG9mOgo+IGZyZWVic2RfcnVu
dmFycz0iJGZyZWVic2RfcnVudmFycyBcLi4uIGFuZCB3ZSB0YWtlIGl0IGZyb20gdGhlcmU/CgpT
dXJlLCBsZXQncyBzZWUgd2hhdCB5b3UgY29tZSB1cCB3aXRoLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
