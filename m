Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BD46885C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 13:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmzV7-0000Ib-Fw; Mon, 15 Jul 2019 11:50:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Co6f=VM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hmzV6-0000IW-6x
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 11:50:36 +0000
X-Inumbo-ID: c105dbfb-a6f6-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c105dbfb-a6f6-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 11:50:34 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DdRCj0M+XVK9OiCLysORe0HWObonqjjRyq5I2Fc9KlTNqlsDxjVhKkaSeFAM1W3DhU0w1daaZQ
 etaDpF0PqlbujG2LlnSS/2oGemYOwcoqUaZ33TXD9lJxONJK0/0pRPnQY1esux076XaygSRWa+
 QQlm7USHRM3qoQSpNcBx4t5gV/JkHtdrO7McfVzPQpb9qdXJC3QTTvmgQ85EiDyz51wqNc4IrD
 +OVTDYLc/gczNp1weWDEKjGfxkHE/qEtAGCJIwf5m1ilkZ50iVhbHGdQFuhbVxV3AtGk3GKO8j
 YzQ=
X-SBRS: 2.7
X-MesageID: 3024354
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3024354"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Anthony PERARD
 <anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
 <20190715114657.kct664fsiupfbftf@MacBook-Air-de-Roger.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b330a32c-f63c-b66f-7406-7e72044f2f42@citrix.com>
Date: Mon, 15 Jul 2019 12:50:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715114657.kct664fsiupfbftf@MacBook-Air-de-Roger.local>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDcvMjAxOSAxMjo0NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gZGlmZiAtLWdp
dCBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbSBiL092bWZQa2cv
WGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwLi4yYTE3ZmVkNTJmCj4+IC0tLSAvZGV2L251bGwKPj4gKysr
IGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4+IEBAIC0wLDAg
KzEsNDkgQEAKPj4gKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKzsgQGZpbGUKPj4gKzsgQW4g
ZW50cnkgcG9pbnQgdXNlIGJ5IFhlbiB3aGVuIGEgZ3Vlc3QgaXMgc3RhcnRlZCBpbiBQVkggbW9k
ZS4KPj4gKzsKPj4gKzsgQ29weXJpZ2h0IChjKSAyMDE5LCBDaXRyaXggU3lzdGVtcywgSW5jLgo+
PiArOwo+PiArOyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlLVBhdGVudAo+
PiArOwo+PiArOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiArCj4+ICtCSVRTICAgIDMyCj4+ICsK
Pj4gK3hlblBWSE1haW46Cj4+ICsgICAgOwo+PiArICAgIDsgJ0JQJyB0byBpbmRpY2F0ZSBib290
LXN0cmFwIHByb2Nlc3Nvcgo+PiArICAgIDsKPj4gKyAgICBtb3YgICAgIGRpLCAnQlAnCj4+ICsK
Pj4gKyAgICA7Cj4+ICsgICAgOyBFU1Agd2lsbCBiZSB1c2VkIGFzIGluaXRpYWwgdmFsdWUgb2Yg
dGhlIEVBWCByZWdpc3Rlcgo+PiArICAgIDsgaW4gTWFpbi5hc20KPj4gKyAgICA7Cj4+ICsgICAg
eG9yICAgICBlc3AsIGVzcAo+PiArCj4+ICsgICAgbW92ICAgICBlYngsIEFERFJfT0YoZ2R0cikK
Pj4gKyAgICBsZ2R0ICAgIFtlYnhdCj4+ICsKPj4gKyAgICBtb3YgICAgIGVheCwgU0VDX0RFRkFV
TFRfQ1IwCj4+ICsgICAgbW92ICAgICBjcjAsIGVheAo+PiArCj4+ICsgICAgam1wICAgICBMSU5F
QVJfQ09ERV9TRUw6QUREUl9PRiguam1wVG9OZXdDb2RlU2VnKQo+PiArLmptcFRvTmV3Q29kZVNl
ZzoKPj4gKwo+PiArICAgIG1vdiAgICAgZWF4LCBTRUNfREVGQVVMVF9DUjQKPj4gKyAgICBtb3Yg
ICAgIGNyNCwgZWF4Cj4+ICsKPj4gKyAgICBtb3YgICAgIGF4LCBMSU5FQVJfU0VMCj4+ICsgICAg
bW92ICAgICBkcywgYXgKPj4gKyAgICBtb3YgICAgIGVzLCBheAo+PiArICAgIG1vdiAgICAgZnMs
IGF4Cj4+ICsgICAgbW92ICAgICBncywgYXgKPj4gKyAgICBtb3YgICAgIHNzLCBheAo+PiArCj4+
ICsgICAgOwo+PiArICAgIDsgSnVtcCB0byB0aGUgbWFpbiByb3V0aW5lIG9mIHRoZSBwcmUtU0VD
IGNvZGUKPj4gKyAgICA7IHNraXBpbmcgdGhlIDE2LWJpdCBwYXJ0IG9mIHRoZSByb3V0aW5lIGFu
ZAo+PiArICAgIDsgaW50byB0aGUgMzItYml0IGZsYXQgbW9kZSBwYXJ0Cj4+ICsgICAgOwo+PiAr
ICAgIE9uZVRpbWVDYWxsUmV0IFRyYW5zaXRpb25Gcm9tUmVhbDE2VG8zMkJpdEZsYXQKPiBTaW5j
ZSBQVkggYWxyZWFkeSBzdGFydHMgaW4gZmxhdCAzMmJpdCBtb2RlLCBJJ20gbm90IHN1cmUgSSBz
ZWUgdGhlCj4gcG9pbnQgb2YgdGhpcyByb3V0aW5lLCBzaW5jZSBpdCBzZWVtcyB0byBiZSB1c2Vk
IGV4Y2x1c2l2ZWx5IHRvIHN3aXRjaAo+IGZyb20gMTYgdG8gMzJiIGZsYXQgbW9kZS4gVGhlIGNv
bW1lbnQgbWVudGlvbnMgc2tpcHBpbmcgdGhhdCBwYXJ0LCBidXQKPiBJJ20gbm90IHN1cmUgSSBz
ZWUgaG93IHRoYXQncyBhY2hpZXZlZC4KCkl0cyBzb21lIE9WTUYgbG9jYWwgbWFnaWMuwqAgVGhp
cyBtZWFucyAiam1wCmVuZF9vZl9UcmFuc2l0aW9uRnJvbVJlYWwxNlRvMzJCaXRGbGF0Iiwgd2hp
Y2ggaXMgdGhlIGNvcnJlY3QgcGxhY2UgdG8KZ28sIGJ1dCB0aGUgY29kZSByZWFsbHkgaXMgbWlz
bGVhZGluZyB0byByZWFkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
