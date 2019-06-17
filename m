Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F91489F8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 19:22:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvHt-0001Rw-77; Mon, 17 Jun 2019 17:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JT4l=UQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hcvHr-0001Rr-E8
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 17:19:19 +0000
X-Inumbo-ID: 08cd1ccc-9124-11e9-acff-b75d414d2d60
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08cd1ccc-9124-11e9-acff-b75d414d2d60;
 Mon, 17 Jun 2019 17:19:17 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pdHl06SAmh40e4I4kyBj3BraFvL7Tdl2QadbR3LDgbxR9gMZ6HHuKt7YBEHje8h76QnhRzVIch
 jqB5vZ+CHHra0ZZFh/o55KaEyn0v/ZDzWbcXCvjpkFR2wUfRZ1qTCJkTDhd0NzsCNpcSWJvc5Q
 OZ3inPbSoX5gEKVoUXLMLnWSVl+9hTRUsPP5PgQSCl22azgPAF7liH0EdD7Xl45aTJCHgAYat3
 4tbWBQ5CcoqEdLa8d/w5slsn+no973lp8JFvc3HoAYoOkJgxfVqT5HXd6i5524x9aGKv/MvCku
 LVM=
X-SBRS: 2.7
X-MesageID: 1852643
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,386,1557201600"; 
   d="scan'208";a="1852643"
Date: Mon, 17 Jun 2019 18:19:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190617171913.GA15926@perard.uk.xensource.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
 <20190617164544.GA13449@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617164544.GA13449@perard.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6NDU6NDRQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6MTU6NTFQTSArMDEwMCwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+ID4gQUZBSUNUIHRoZSBvbmx5IHBsYWNlIChhcGFydCBmcm9tIGxlZ2Fj
eSBjb2RlIGluIHhlbl9jb21tb24uaCkgdGhhdAo+ID4gcGFyYW1zLmggaXMgbmVjZXNzYXJ5IGlz
IGluIHhlbl9zdXNwZW5kX25vdGlmaWVyKCkuIEkgd29uZGVyIHdoZXRoZXIKPiA+IHRoYXQgd291
bGQgYmUgYmV0dGVyIG1vdmVkIGludG8geGVuX2NvbW1vbi5oIHRvbyAoc2luY2UgaXQncyBqdXN0
IGEKPiA+IHdyYXBwZXIgcm91bmQgeGNfc2V0X2h2bV9wYXJhbSgpIGFuZCB0aGVuIHRoZSBpbmNs
dXNpb24gb2YgcGFyYW1zLmgKPiA+IGNhbiBiZSBtb3ZlZCB0aGVyZSBhcyB3ZWxsLgo+IAo+IDoo
LCBJIGRpZG4ndCByZWFsaXNlZCB0aGF0IHhlbl9jb21tb24uaCBuZWVkZWQgcGFyYW1zLmggdG9v
LiBUaGF0IHBhdGNoCj4gc2VyaWVzIG1pZ2h0IG5vdCBidWlsZCBvbiBvbGRlciB2ZXJzaW9uIG9m
IFhlbi4gSSdsbCBtb3ZlIHRoZSBpbmNsdXNpb24KPiBvZiBwYXJhbXMuaCB0byB4ZW5fY29tbW9u
LmgsIGFuZCBmaXggcGFyYW1zLmggdG8gaGF2ZSBhbGwgdGhlIG5lZWRlZAo+ICNkZWZpbmVzLgoK
QWN0dWFsbHksIGl0IHdvcmtzIGZpbmUgd2l0aG91dCBpbmNsdWRpbmcgaHZtL3BhcmFtcy5oIGlu
IHhlbl9jb21tb24uaApiZWNhdXNlIHhlbl9jb21tb24uaCBpbmNsdWRlcyB4ZW5jdHJsLmggd2hp
Y2ggaW5jbHVkZXMgaHZtL3BhcmFtcy5oLgoKU28gSSB0aGluayBpbnN0ZWFkIEknbGwgcmVtb3Zl
IGFsbCBpbmNsdWRlcyBvZiBwYXJhbXMuaCwgYmVjYXVzZQpIVk1fUEFSQU1fKiBhcmUgcGFyYW1l
dGVycyBmb3IgeGNfaHZtX3BhcmFtX3tnZXQsc2V0fSwgd2hpY2ggaXMgaW4gYQpsaWJyYXJ5IGFu
ZCBub3QgYW4gaW50ZXJmYWNlIHdpdGggYSBndWVzdC4gSW5jbHVkaW5nIHhlbmN0cmwuaCBzaG91
bGQgYmUKZW5vdWdoLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
