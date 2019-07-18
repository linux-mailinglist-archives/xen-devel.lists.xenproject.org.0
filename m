Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1106CF04
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:41:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6bv-0001P9-4N; Thu, 18 Jul 2019 13:38:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho6bt-0001P0-Ei
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:38:13 +0000
X-Inumbo-ID: 482e7884-a961-11e9-a7d1-a79721aaa318
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 482e7884-a961-11e9-a7d1-a79721aaa318;
 Thu, 18 Jul 2019 13:38:10 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5tiJvRZJyRNv5NZB/8JnGRhGQdBoMlUT4SdkcqELPx300y+3S39jcfJ3h0B9MNjq/m5/swFI/L
 b4983DKLy7xuttss+vyASjVauYPm+5zMJwImnba76cg5PpAizmbZovT9AqbEwKjNf22refxfub
 6UHKn+gS0fgTEZaUccT16k/DLnW1E0hAstVszg9XbdNOtYmp0xJo8DiAKjr2JRw+F5I6qEsaVI
 Zsg4rk3pYwmTK4Exnm+Es/NZy/c7iy2dqPBOnQACs6RC2rNN4YPy/0KYyCmsOGjENwdmcNZ8f1
 7/s=
X-SBRS: 2.7
X-MesageID: 3232079
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3232079"
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c6f154b8-34a5-9b23-6761-1a10680dc486@citrix.com>
Date: Thu, 18 Jul 2019 14:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Andrii
 Anisov <andrii_anisov@epam.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxNDoyMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBbmRyaWkg
QW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Cj4gQWZ0ZXIgY2hhbmdlcyBpbnRyb2R1
Y2VkIGJ5IDljYzA2MTggd2UgYXJlIGFibGUgdG8gdm1hcC92dW5tYXAKPiBwYWdlIGFsaWduZWQg
YWRkcmVzc2VzIG9ubHkuCj4gU28gaWYgd2UgYWRkIGEgcGFnZSBhZGRyZXNzIHJlbWFpbmRlciB0
byB0aGUgbWFwcGVkIHZpcnR1YWwgYWRkcmVzcywKPiB3ZSBoYXZlIHRvIG1hc2sgaXQgb3V0IGJl
Zm9yZSB1bm1hcHBpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlf
YW5pc292QGVwYW0uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBiL3hlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYwo+IGluZGV4IDg5MDQ5MzkuLjZmNDgzYjIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L2NwdWVycmF0YS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCj4gQEAgLTc1LDcg
Kzc1LDcgQEAgc3RhdGljIGJvb2wgY29weV9oeXBfdmVjdF9icGkodW5zaWduZWQgaW50IHNsb3Qs
IGNvbnN0IGNoYXIgKmh5cF92ZWNfc3RhcnQsCj4gICAgICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2Uo
ZHN0X3JlbWFwcGVkLCBWRUNUT1JfVEFCTEVfU0laRSk7Cj4gICAgICBpbnZhbGlkYXRlX2ljYWNo
ZSgpOwo+ICAKPiAtICAgIHZ1bm1hcChkc3RfcmVtYXBwZWQpOwo+ICsgICAgdnVubWFwKCh2b2lk
ICopKCh2YWRkcl90KWRzdF9yZW1hcHBlZCAmIFBBR0VfTUFTSykpOwoKVGhpcyByZWFsbHkgb3Vn
aHQgdG8gYmUgdnVubWFwKCkgcGVyZm9ybWluZyB0aGUgcm91bmRpbmcsIHdoaWNoIG1ha2VzIGl0
CmNvbnNpc3RlbnQgd2l0aCBob3cgeyx1bn1tYXBfZG9tYWluX3BhZ2UoKSBjdXJyZW50bHkgd29y
a3MuCgpIb3dldmVyIChmcm9tIGluc3BlY3Rpb24pLCB0aGVyZSBpcyBhIHJlYWwgYnVnIGluIHRo
aXMgY29kZSwgc28gaXQgbmVlZHMKZml4aW5nIGFzIHdlbGwuwqAgZHN0X3JlbWFwcGVkIHdpbGwg
YmUgdGhlIHdyb25nIHBhZ2Ugd2hlbiBpdCBmaWxscyB0aGUKZmluYWwgc2xvdCBpbiB0aGUgcGFn
ZSwgd2hpY2ggbG9va3MgdG8gYmUgZXZlcnkgb3RoZXIgc2xvdCwgZ2l2ZW4gdGhhdAp0aGUgc2l6
ZSBpcyAyay4KCkEgYmV0dGVyIG9wdGlvbiB3b3VsZCBiZSB0byBrZWVwIHRoZSBiYXNlIHBvaW50
ZXIgYXJvdW5kIGFuZCB2dW5tYXAoKQp0aGF0LCBhbmQgYWNjb3VudCBmb3Igc2xvdCBpbiBhIGRp
ZmZlcmVudCB2YXJpYWJsZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
