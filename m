Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01E7D96E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:33:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht8Lw-0004br-Gz; Thu, 01 Aug 2019 10:30:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gEk7=V5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ht8Lu-0004bm-Ie
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:30:30 +0000
X-Inumbo-ID: 60baf044-b447-11e9-aed6-dfb425e59ca8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60baf044-b447-11e9-aed6-dfb425e59ca8;
 Thu, 01 Aug 2019 10:30:27 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qovk8w6SOymynp/Mp9gXjKtXGdAcxV1Eh1PIcciZ190OoPtccpWbTyZR/+F5oi9f0yt3C/zYA8
 newDNUi/WG/p4AJDlS/hqwJd7rIgUWr5N/kj5SaQqLCBpthUF9cqNctaaXNENkibTgXtZyhNHF
 VnMTy8E7a1Yx/qL9pGtjXCj8CPcRqvtTW5HkHWZQ0McCcovKwzKp4mxIdBh7168HtREfEM1QkF
 PNY7Jlb3JjiFYpa4j5RkrxNYNgJhc0wKXPQvCx4UEEJG7uIXT4vm4zR1G4Thnwg0KI9+DdnyNp
 PzU=
X-SBRS: 2.7
X-MesageID: 3834022
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,333,1559534400"; 
   d="scan'208";a="3834022"
Date: Thu, 1 Aug 2019 11:30:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190801103019.GC5791@perard.uk.xensource.com>
References: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [BUG] Assertion failed: !blk->legacy_dev
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDE6MTE6MjJQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBIaSEKCkhpIFJvbWFuLAoKVGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydCEKClRo
YXQgYnVnICh0ZWNobmljYWwgZGVidCByZWFsbHkpIHdhcyBmaXhlZCBpbiBRRU1VIDQuMCAoc28g
d2lsbCBiZSBmaXhlZAppbiBYZW4gNC4xMykuIEl0J3MgYSBzZXJpZXMgb2YgcGF0Y2ggd2l0aCB0
aGUgbGFzdCBvbmUgYmVlbiBkYjlmZjQ2IGlmCnlvdSB3YW50IHRvIGhhdmUgYSBsb29rLgoKPiBB
bmRyZXcgcmVtaW5kZWQgbWUgdGhhdCBFVkUgaGFzIGEgd2VpcmQgaW4tdHJlZSBwYXRjaCBmb3Ig
WGVuJ3MgcWVtdQo+IHRvIGRlYWwgd2l0aCBhbiBpc3N1ZSB3ZSBjYW4ndCBxdWl0ZSBleHBsYWlu
Ogo+ICAgICBodHRwczovL2dpdGh1Yi5jb20vbGYtZWRnZS9ldmUvYmxvYi9tYXN0ZXIvcGtnL3hl
bi10b29scy9wYXRjaGVzLTQuMTIuMC8wMS1yZW1vdmUtYXNzZXJ0LnBhdGNoCj4gCj4gVGhlIHdh
eSB0aGlzIHByb2JsZW0gbWFuaWZlc3RzIGl0c2VsZiBpcyAqc29tZXRpbWUgYWZ0ZXIqIGFuIEhW
TSBkb21haW4KPiB3aXRoIGEgcWNvdzIgZGlzayBhdHRhY2hlZCBnZXQgc3RhcnRlZCB3ZSBnZXQg
UUVNVSBmYWlsaW5nIHdpdGg6Cj4gICAgIEFzc2VydGlvbiBmYWlsZWQ6ICFibGstPmxlZ2FjeV9k
ZXYKPiAoL3hlbi90b29scy9xZW11LXhlbi9ibG9jay9ibG9jay1iYWNrZW5kLmM6IGJsa19nZXRf
YXR0YWNoZWRfZGV2X2lkOgo+IDkwMykKCkkgY2FuIHRlbGwgeW91IG1vcmUgYWJvdXQgaG93IHRv
IHRyaWdnZXIgdGhlIGFzc2VydGlvbiBmYWlsdXJlLiBTaW1wbHkKcnVubmluZyBgeGVudG9wJyB3
aWxsIHRyaWdnZXIgdGhlIGJ1Zy4gVGhhdCB0b29sIHJ1biB0aGUgUU1QIGNvbW1hbmQKInF1ZXJ5
LWJsb2NrIiB3aGljaCB3aWxsIHRyaWdnZXIgdGhlIGJ1ZywgdGhlcmUgYXJlIHByb2JhYmx5IG90
aGVyIFFNUApjb21tYW5kIG9yIEhNUCBvciBtb25pdG9yIGNvbW1hbmQgd2hpY2ggd291bGQgZG8g
dGhlIHNhbWUgaWYgeW91IHVzZSBhCmRpZmZlcmVudCBtb25pdG9yaW5nIHNvZnR3YXJlLgoKU28g
eW91IGNvdWxkIHJ1biB3aXRoIGEgbmV3ZXIgdmVyc2lvbiBvZiBRRU1VIG9yIGtlZXAgdGhlIHBh
dGNoIHRoYXQKcmVtb3ZlcyB0aGUgYXNzZXJ0LgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
