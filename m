Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D1104892
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 03:35:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXcFG-00080z-EC; Thu, 21 Nov 2019 02:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R4Pf=ZN=kernel.org=krzk@srs-us1.protection.inumbo.net>)
 id 1iXcFE-00080u-K0
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 02:30:56 +0000
X-Inumbo-ID: f198ef78-0c06-11ea-b678-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f198ef78-0c06-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 02:30:55 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76FE720895
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 02:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574303454;
 bh=bjayYKI6tB4bYcrey6gcjI71vQErSkVfqxKMrb/YFTU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zkmt51GVdTcs4AvXlxnGSPT73ncqOfuKAUIad17KVY5jKdJqFmTT6LzedL/69IxlJ
 6ZNgtmeczkBwXIslq/5HzkjfNrn1YAYkcIYzm9D6CH5CawOl9YcNVOEgaWuWxyHe75
 4mZ2Odzm59jt4PedHdsVIu/wAajdBse8XEBwS8io=
Received: by mail-lj1-f174.google.com with SMTP id n5so1369739ljc.9
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 18:30:54 -0800 (PST)
X-Gm-Message-State: APjAAAXLPrfE1NMrHUh1U9aKYJzRJZ+LLM68V1p2oDCBL7kPkyflqMr2
 lJoVwOYg5MpvPcyxUDE2cTkB7BO55sT7Z2JIWFM=
X-Google-Smtp-Source: APXvYqxODvb1JLjSW+ODtE5/s3ywWEMbWQXd/v+wFKGd4b3thMSxY7bSIuvQMkQUwNDrzNuBUdreDH84NfX34hCFuRc=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr5139949ljj.93.1574303452599;
 Wed, 20 Nov 2019 18:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20191120133822.12909-1-krzk@kernel.org>
 <82f7c786-c240-66bd-895a-d71cd6977807@suse.com>
In-Reply-To: <82f7c786-c240-66bd-895a-d71cd6977807@suse.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 21 Nov 2019 10:30:41 +0800
X-Gmail-Original-Message-ID: <CAJKOXPdLyhaLzseFfMd7-eYN9+cJb9xqX_1Avf11kPgUp2EUKg@mail.gmail.com>
Message-ID: <CAJKOXPdLyhaLzseFfMd7-eYN9+cJb9xqX_1Avf11kPgUp2EUKg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] xen: Fix Kconfig indentation
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMCBOb3YgMjAxOSBhdCAyMjowMiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPgo+IE9uIDIwLjExLjIwMTkgMTQ6MzgsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6Cj4gPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0aW9u
YWwgdHdvIHNwYWNlcykgYXMgaW4KPiA+IGNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToK
PiA+ICAgICAgICQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMveGVuL0tjb25maWcgfCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2Nv
bmZpZwo+ID4gaW5kZXggYjcxZjFhZDEwMTNjLi5jYmE5NDljMGY4YjMgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL3hlbi9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnCj4gPiBA
QCAtMTEwLDEyICsxMTAsMTIgQEAgY29uZmlnIFhFTl9DT01QQVRfWEVORlMKPiA+ICAgICAgICAg
ZGVwZW5kcyBvbiBYRU5GUwo+ID4gICAgICAgICBkZWZhdWx0IHkKPiA+ICAgICAgICAgaGVscAo+
ID4gLSAgICAgICAgIFRoZSBvbGQgeGVuc3RvcmUgdXNlcnNwYWNlIHRvb2xzIGV4cGVjdCB0byBm
aW5kICJ4ZW5idXMiCj4gPiAtICAgICAgICAgdW5kZXIgL3Byb2MveGVuLCBidXQgInhlbmJ1cyIg
aXMgbm93IGZvdW5kIGF0IHRoZSByb290IG9mIHRoZQo+ID4gLSAgICAgICAgIHhlbmZzIGZpbGVz
eXN0ZW0uICBTZWxlY3RpbmcgdGhpcyBjYXVzZXMgdGhlIGtlcm5lbCB0byBjcmVhdGUKPiA+IC0g
ICAgICAgICB0aGUgY29tcGF0aWJpbGl0eSBtb3VudCBwb2ludCAvcHJvYy94ZW4gaWYgaXQgaXMg
cnVubmluZyBvbgo+ID4gLSAgICAgICAgIGEgeGVuIHBsYXRmb3JtLgo+ID4gLSAgICAgICAgIElm
IGluIGRvdWJ0LCBzYXkgeWVzLgo+ID4gKyAgICAgIFRoZSBvbGQgeGVuc3RvcmUgdXNlcnNwYWNl
IHRvb2xzIGV4cGVjdCB0byBmaW5kICJ4ZW5idXMiCj4gPiArICAgICAgdW5kZXIgL3Byb2MveGVu
LCBidXQgInhlbmJ1cyIgaXMgbm93IGZvdW5kIGF0IHRoZSByb290IG9mIHRoZQo+ID4gKyAgICAg
IHhlbmZzIGZpbGVzeXN0ZW0uICBTZWxlY3RpbmcgdGhpcyBjYXVzZXMgdGhlIGtlcm5lbCB0byBj
cmVhdGUKPiA+ICsgICAgICB0aGUgY29tcGF0aWJpbGl0eSBtb3VudCBwb2ludCAvcHJvYy94ZW4g
aWYgaXQgaXMgcnVubmluZyBvbgo+ID4gKyAgICAgIGEgeGVuIHBsYXRmb3JtLgo+ID4gKyAgICAg
IElmIGluIGRvdWJ0LCBzYXkgeWVzLgo+Cj4gSGVyZSBhbmQgLi4uCj4KPiA+IEBAIC0xMjMsNyAr
MTIzLDcgQEAgY29uZmlnIFhFTl9TWVNfSFlQRVJWSVNPUgo+ID4gICAgICAgICBzZWxlY3QgU1lT
X0hZUEVSVklTT1IKPiA+ICAgICAgICAgZGVmYXVsdCB5Cj4gPiAgICAgICAgIGhlbHAKPiA+IC0g
ICAgICAgICBDcmVhdGUgZW50cmllcyB1bmRlciAvc3lzL2h5cGVydmlzb3IgZGVzY3JpYmluZyB0
aGUgWGVuCj4gPiArICAgICAgQ3JlYXRlIGVudHJpZXMgdW5kZXIgL3N5cy9oeXBlcnZpc29yIGRl
c2NyaWJpbmcgdGhlIFhlbgo+ID4gICAgICAgIGh5cGVydmlzb3IgZW52aXJvbm1lbnQuICBXaGVu
IHJ1bm5pbmcgbmF0aXZlIG9yIGluIGFub3RoZXIKPiA+ICAgICAgICB2aXJ0dWFsIGVudmlyb25t
ZW50LCAvc3lzL2h5cGVydmlzb3Igd2lsbCBzdGlsbCBiZSBwcmVzZW50LAo+ID4gICAgICAgIGJ1
dCB3aWxsIGhhdmUgbm8geGVuIGNvbnRlbnRzLgo+Cj4gLi4uIGhlcmUgeW91IGVuZCB1cCB3aXRo
IGEgdGFiIGFuZCBvbmUgc3BhY2UsIHdoZXJlYXMgLi4uCj4KPiA+IEBAIC0yNzEsNyArMjcxLDcg
QEAgY29uZmlnIFhFTl9BQ1BJX1BST0NFU1NPUgo+ID4gICAgICAgZGVwZW5kcyBvbiBYRU4gJiYg
WEVOX0RPTTAgJiYgWDg2ICYmIEFDUElfUFJPQ0VTU09SICYmIENQVV9GUkVRCj4gPiAgICAgICBk
ZWZhdWx0IG0KPiA+ICAgICAgIGhlbHAKPiA+IC0gICAgICAgICAgVGhpcyBBQ1BJIHByb2Nlc3Nv
ciB1cGxvYWRzIFBvd2VyIE1hbmFnZW1lbnQgaW5mb3JtYXRpb24gdG8gdGhlIFhlbgo+ID4gKyAg
ICAgICBUaGlzIEFDUEkgcHJvY2Vzc29yIHVwbG9hZHMgUG93ZXIgTWFuYWdlbWVudCBpbmZvcm1h
dGlvbiB0byB0aGUgWGVuCj4gPiAgICAgICAgIGh5cGVydmlzb3IuCj4gPgo+ID4gICAgICAgICBU
byBkbyB0aGF0IHRoZSBkcml2ZXIgcGFyc2VzIHRoZSBQb3dlciBNYW5hZ2VtZW50IGRhdGEgYW5k
IHVwbG9hZHMKPiA+IEBAIC0yODAsNyArMjgwLDcgQEAgY29uZmlnIFhFTl9BQ1BJX1BST0NFU1NP
Ugo+ID4gICAgICAgICBTTU0gc28gdGhhdCBvdGhlciBkcml2ZXJzIChzdWNoIGFzIEFDUEkgY3B1
ZnJlcSBzY2FsaW5nIGRyaXZlcikgd2lsbAo+ID4gICAgICAgICBub3QgbG9hZC4KPiA+Cj4gPiAt
ICAgICAgICAgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhl
cmU6IHRoZSBtb2R1bGUgd2lsbCBiZQo+ID4gKyAgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlIHdpbGwgYmUKPiA+ICAgICAg
ICAgY2FsbGVkIHhlbl9hY3BpX3Byb2Nlc3NvciAgSWYgeW91IGRvIG5vdCBrbm93IHdoYXQgdG8g
Y2hvb3NlLCBzZWxlY3QKPiA+ICAgICAgICAgTSBoZXJlLiBJZiB0aGUgQ1BVRlJFUSBkcml2ZXJz
IGFyZSBidWlsdCBpbiwgc2VsZWN0IFkgaGVyZS4KPiA+Cj4gPiBAQCAtMzEzLDggKzMxMyw4IEBA
IGNvbmZpZyBYRU5fU1lNUwo+ID4gICAgICAgICBkZXBlbmRzIG9uIFg4NiAmJiBYRU5fRE9NMCAm
JiBYRU5GUwo+ID4gICAgICAgICBkZWZhdWx0IHkgaWYgS0FMTFNZTVMKPiA+ICAgICAgICAgaGVs
cAo+ID4gLSAgICAgICAgICBFeHBvcnRzIGh5cGVydmlzb3Igc3ltYm9scyAoYWxvbmcgd2l0aCB0
aGVpciB0eXBlcyBhbmQgYWRkcmVzc2VzKSB2aWEKPiA+IC0gICAgICAgICAgL3Byb2MveGVuL3hl
bnN5bXMgZmlsZSwgc2ltaWxhciB0byAvcHJvYy9rYWxsc3ltcwo+ID4gKyAgICAgICBFeHBvcnRz
IGh5cGVydmlzb3Igc3ltYm9scyAoYWxvbmcgd2l0aCB0aGVpciB0eXBlcyBhbmQgYWRkcmVzc2Vz
KSB2aWEKPiA+ICsgICAgICAgL3Byb2MveGVuL3hlbnN5bXMgZmlsZSwgc2ltaWxhciB0byAvcHJv
Yy9rYWxsc3ltcwo+Cj4gLi4uIGV2ZXJ5d2hlcmUgZWxzZSB5b3UgaGF2ZSBhIHRhYiBhbmQgdHdv
IHNwYWNlcywgYXMgSSB3b3VsZAo+IGhhdmUgZXhwZWN0ZWQuCj4KPiBGdXJ0aGVybW9yZSBpbiB2
YXJpb3VzIGNhc2VzIHlvdSBsZWF2ZSBzcGFjZSBpbmRlbnRlZCB0aGUKPiBkaXJlY3RpdmVzIG90
aGVyIHRoYW4gImhlbHAiLiBXaXRoIGEgdGl0bGUgbGlrZSB0aGUgb25lIHRoaXMKPiBwYXRjaCBo
YXMgSSdkIGV4cGVjdCBhbGwgaW5kZW50YXRpb24gaXNzdWVzIHRvIGJlIHRha2VuIGNhcmUgb2Yu
CgpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4gSW5kZWVkIEkgZGlkIG5vdCBmaXggYWxsIHZp
b2xhdGlvbnMgLQpzb21ldGltZXMgdGhlcmUgYXJlIGFsc28gNyBzcGFjZXMsIG9yIHRhYit7MSwz
fSBzcGFjZXMuIEknbGwgc2VuZCBhCmZvbGxvdyB1cC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
