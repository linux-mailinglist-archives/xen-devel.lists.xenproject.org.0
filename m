Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3D91230CD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:48:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihF24-0003OG-5Q; Tue, 17 Dec 2019 15:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zezb=2H=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ihF21-0003O9-HR
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:45:06 +0000
X-Inumbo-ID: 2e106e9e-20e4-11ea-88e7-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e106e9e-20e4-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 15:45:00 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:687b:c909:9c42:5397])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 9CF76200129;
 Wed, 18 Dec 2019 02:44:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1576597494; bh=kEI2i9WuXeHfjiOGaK6GYtFg+wvUGUcTpyyX2wOXldY=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=v5Xk75MSalbRV8EiKZFmnq8IesimptEFvySXKlNdVrII7ETexb9r6/D83vwUcx41J
 4J/pQ6rabJgnrUQvnfmxKtfxAkiCksnzPmJ8bG1DWmYEq7ZTlou2Bmx7m3mNF5jjYh
 qPBfslXEtBHm6s9ui3Ly38sOMiw4UdypviRzxPDQ=
Date: Wed, 18 Dec 2019 02:44:51 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: Wei Liu <wl@xen.org>
Message-Id: <1576597491.2697.0@crc.id.au>
In-Reply-To: <20191217141330.etqf332fddplsbb4@debian>
References: <cover.1576209614.git.netwiz@crc.id.au>
 <aa2b7e60d0e20ffe1e83b10f327efbb6dacd3358.1576209614.git.netwiz@crc.id.au>
 <20191217141330.etqf332fddplsbb4@debian>
X-Mailer: geary/3.34.2
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] Tidy up whitespace and formatting in
	file to be	consistent.
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2ssIGlmIGl0cyBnb2luZyB0byBiZSA0IHNwYWNlcyBmb3IgZWFjaCBmaWxlLCBJIGNhbiBiYXRj
aCBjb252ZXJ0ICYgCnRpZHkgc3R1ZmYgdXAuLi4KClRoZSBmaWxlIEkgY2hhbmdlZCBoYWQgYm90
aCB0eXBlcywgc28gSSB3ZW50IHdpdGggbXkgb3duIHByZWZlcmVuY2UgOikKCklmIGl0IG1pZ2h0
IGJlIGEgYmV0dGVyIGFwcHJvYWNoLCBJJ2xsIHNvcnQgb3V0IHRoZSBtYWpvcml0eSBvZiBzY3Jp
cHRzIAppbiB0aGF0IGRpcmVjdG9yeSAtIGFuZCBkbyBubyBmdW5jdGlvbiBjaGFuZ2VzIGFuZCBw
b3N0IGEgc2VyaWVzIHRoYXQgCmRvZXMgbm90aGluZyBidXQgY2xlYW51cCAtIHRoZW4gZG8gdGhl
IGJyY3RsIC8gaXAgY2hhbmdlcyBvbiB0b3Agb2YgCnRoYXQgaW4gYSBkaWZmZXJlbnQgcGF0Y2gu
CgpJIG1pZ2h0IGFzIHdlbGwgZG8gdGhlbSBhbGwgLSBhbmQgaXQgbWFrZXMgc2Vuc2UgdG8gZG8g
bm90aGluZyBidXQgCmNsZWFudXAsIHRoZW4gZnVuY3Rpb25hbCBjaGFuZ2VzIGJhc2VkIG9uIHRo
ZSBjbGVhbmVkIHVwIGNvZGUuClN0ZXZlbiBIYWlnaAoK8J+TpyBuZXR3aXpAY3JjLmlkLmF1ICAg
ICDwn5K7IGh0dHBzOi8vd3d3LmNyYy5pZC5hdQoKCk9uIFR1ZSwgRGVjIDE3LCAyMDE5IGF0IDE0
OjEzLCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3cm90ZToKPiBPbiBGcmksIERlYyAxMywgMjAxOSBh
dCAwMzowODozNFBNICsxMTAwLCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cj4+ICBTaWduZWQtb2ZmLWJ5
OiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Cj4gCj4gSSB3aWxsIG5lZWQgdG8gYWRkIHRvb2xzL2hvdHBsdWcgdG8gdGhl
IHN1YmplY3QgbGluZSBhbmQgdGhlIGZvbGxvd2luZwo+IGNvbW1pdCBtZXNzYWdlOgo+IAo+ICAg
IFVzZSA0IHNwYWNlcyBmb3IgaW5kZW50YXRpb24gdGhyb3VnaG91dCB0aGUgZmlsZS4gTm8gZnVu
Y3Rpb25hbAo+ICAgIGNoYW5nZS4KPiAKPiBXZWkuCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
