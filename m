Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7549BA1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 09:59:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd8yK-0007Rl-Vc; Tue, 18 Jun 2019 07:56:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6zAf=UR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hd8yJ-0007Rg-Is
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 07:56:03 +0000
X-Inumbo-ID: 81033774-919e-11e9-88a8-f77edd964432
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81033774-919e-11e9-88a8-f77edd964432;
 Tue, 18 Jun 2019 07:55:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g4xjIFtYDzVxljSqTv+EBv8/0unWDY7zahXCDuQvH6lAnfu0ouwIPaClIsGSx0GrhMoF5s2Qhc
 Q7cmH22F7STIpcqgJayZ8m0UGExgVD/HddT7tcMhK3f33uEcZjZ9kfyTb51xEoZqHCaqMoQmUL
 +7VsN3ZELke0hAdbE1O5ikfOKkVzo6eoxVq1+mkH/Afw2DIximZmbRIFcgooTzfcKXcJl8K0An
 4HKoBe8X/zifb9P6PEnXJQVs+nSa+CoDTTQ8jeX4z3jgh2sRvGqQ94bR6xqhBz2sV81qr9QfRO
 9XY=
X-SBRS: 2.7
X-MesageID: 1863943
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,388,1557201600"; 
   d="scan'208";a="1863943"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 3/4] xen: Import Xen public headers used by
 xen-hvm.c
Thread-Index: AQHVJSMVksnbyKoRC0SnNZiHFchLQ6agBEVg///oIwCAAAlbgIABFQIw
Date: Tue, 18 Jun 2019 07:55:53 +0000
Message-ID: <17fc272d31cc4e95baa3ec68a90557d1@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
 <20190617164544.GA13449@perard.uk.xensource.com>
 <20190617171913.GA15926@perard.uk.xensource.com>
In-Reply-To: <20190617171913.GA15926@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/4] xen: Import Xen public headers used by
 xen-hvm.c
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxNyBKdW5lIDIwMTkgMTg6MTkK
PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+OyBxZW11LWRldmVsQG5vbmdudS5vcmcKPiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIIDMvNF0geGVuOiBJbXBvcnQgWGVuIHB1YmxpYyBoZWFkZXJzIHVzZWQgYnkg
eGVuLWh2bS5jCj4gCj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6NDU6NDRQTSArMDEwMCwg
QW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwNToxNTo1
MVBNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IEFGQUlDVCB0aGUgb25seSBwbGFj
ZSAoYXBhcnQgZnJvbSBsZWdhY3kgY29kZSBpbiB4ZW5fY29tbW9uLmgpIHRoYXQKPiA+ID4gcGFy
YW1zLmggaXMgbmVjZXNzYXJ5IGlzIGluIHhlbl9zdXNwZW5kX25vdGlmaWVyKCkuIEkgd29uZGVy
IHdoZXRoZXIKPiA+ID4gdGhhdCB3b3VsZCBiZSBiZXR0ZXIgbW92ZWQgaW50byB4ZW5fY29tbW9u
LmggdG9vIChzaW5jZSBpdCdzIGp1c3QgYQo+ID4gPiB3cmFwcGVyIHJvdW5kIHhjX3NldF9odm1f
cGFyYW0oKSBhbmQgdGhlbiB0aGUgaW5jbHVzaW9uIG9mIHBhcmFtcy5oCj4gPiA+IGNhbiBiZSBt
b3ZlZCB0aGVyZSBhcyB3ZWxsLgo+ID4KPiA+IDooLCBJIGRpZG4ndCByZWFsaXNlZCB0aGF0IHhl
bl9jb21tb24uaCBuZWVkZWQgcGFyYW1zLmggdG9vLiBUaGF0IHBhdGNoCj4gPiBzZXJpZXMgbWln
aHQgbm90IGJ1aWxkIG9uIG9sZGVyIHZlcnNpb24gb2YgWGVuLiBJJ2xsIG1vdmUgdGhlIGluY2x1
c2lvbgo+ID4gb2YgcGFyYW1zLmggdG8geGVuX2NvbW1vbi5oLCBhbmQgZml4IHBhcmFtcy5oIHRv
IGhhdmUgYWxsIHRoZSBuZWVkZWQKPiA+ICNkZWZpbmVzLgo+IAo+IEFjdHVhbGx5LCBpdCB3b3Jr
cyBmaW5lIHdpdGhvdXQgaW5jbHVkaW5nIGh2bS9wYXJhbXMuaCBpbiB4ZW5fY29tbW9uLmgKPiBi
ZWNhdXNlIHhlbl9jb21tb24uaCBpbmNsdWRlcyB4ZW5jdHJsLmggd2hpY2ggaW5jbHVkZXMgaHZt
L3BhcmFtcy5oLgo+IAo+IFNvIEkgdGhpbmsgaW5zdGVhZCBJJ2xsIHJlbW92ZSBhbGwgaW5jbHVk
ZXMgb2YgcGFyYW1zLmgsIGJlY2F1c2UKPiBIVk1fUEFSQU1fKiBhcmUgcGFyYW1ldGVycyBmb3Ig
eGNfaHZtX3BhcmFtX3tnZXQsc2V0fSwgd2hpY2ggaXMgaW4gYQo+IGxpYnJhcnkgYW5kIG5vdCBh
biBpbnRlcmZhY2Ugd2l0aCBhIGd1ZXN0LiBJbmNsdWRpbmcgeGVuY3RybC5oIHNob3VsZCBiZQo+
IGVub3VnaC4KClRoZSBndWVzdC90b29scyBzZXBhcmF0aW9uIGlzIG1lc3N5LiBpb3JlcS5oIGlz
IGFsc28gYW4gaW50ZXJmYWNlIHdpdGggWGVuIGFuZCBub3Qgd2l0aCBhIGd1ZXN0LCBzbyByZWFs
bHkgSSB0aGluayBpdCBzaG91bGQgYmUgdHJlYXRlZCB0aGUgc2FtZSB3YXkgYXMgcGFyYW1zLmgu
IGU4MjAuaCBpcyByZWZlcnJpbmcgdG8gZ3Vlc3QgbWVtb3J5IGxheW91dCwgd2hpY2ggSU1PIHNo
b3VsZG4ndCByZWFsbHkgYmUgaGFyZGNvZGVkIGF0IGFsbC4KCiAgUGF1bAoKPiAKPiAtLQo+IEFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
