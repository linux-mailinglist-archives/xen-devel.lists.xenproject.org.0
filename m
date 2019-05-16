Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED7207DE
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:20:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGGV-0005HC-8i; Thu, 16 May 2019 13:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YH6f=TQ=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hRGGU-0005H7-3I
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:17:42 +0000
X-Inumbo-ID: fb71d410-77dc-11e9-b166-f760d3dadc44
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fb71d410-77dc-11e9-b166-f760d3dadc44;
 Thu, 16 May 2019 13:17:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 619D71715;
 Thu, 16 May 2019 06:17:40 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 520003F703;
 Thu, 16 May 2019 06:17:39 -0700 (PDT)
Date: Thu, 16 May 2019 14:17:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Amit Tomer <amittomer25@gmail.com>
Message-ID: <20190516141736.486f8a06@donnerap.cambridge.arm.com>
In-Reply-To: <CABHD4K_DybrEQBeG2pn9D68pFoPH9e0ior17uy3A-_mXeSA+cQ@mail.gmail.com>
References: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
 <60d23898-7e91-bb59-5bc8-b36d06452f28@gmail.com>
 <CABHD4K_DybrEQBeG2pn9D68pFoPH9e0ior17uy3A-_mXeSA+cQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxNiBNYXkgMjAxOSAxNzoxNTozNiArMDUzMApBbWl0IFRvbWVyIDxhbWl0dG9tZXIy
NUBnbWFpbC5jb20+IHdyb3RlOgoKSGksCgo+IFRoYW5rcyBmb3IgaGF2aW5nIGEgbG9vayBhdCBp
dC4KPiAKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMjoyNSBBTSBPbGVrc2FuZHIgPG9sZWtz
dHlzaEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiAwMy4wNS4xOSAyMDowMiwgQW1p
dCBTaW5naCBUb21hciB3cm90ZToKPiA+Cj4gPiBIaSwgQW1pdAo+ID4gIAo+ID4gPiBYRU4gc2hv
dWxkIG5vdCBmb3J3YXJkIFBQSXMgdG8gRG9tMCBhcyBpdCBvbmx5IHN1cHBvcnQgU1BJcy4KPiA+
ID4gT25lIG9mIHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBpcyB0byBza2lwIGFueSBkZXZpY2Ug
dGhhdAo+ID4gPiB1c2VzIFBQSSBzb3VyY2UgY29tcGxldGVseSB3aGlsZSBidWlsZGluZyBkb21h
aW4gaXRzZWxmLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGdvZXMgdGhyb3VnaCBhbGwgdGhlIGlu
dGVycnVwdCBzb3VyY2VzIG9mIGRldmljZSBhbmQgc2tpcCBpdAo+ID4gPiBpZiBvbmUgb2YgaW50
ZXJydXB0IHNvdXJjZSBpcyBQUEkuIEl0IGZpeGVzIFhFTiBib290IG9uIGkuTVg4TVEgYnkKPiA+
ID4gc2tpcHBpbmcgUE1VIG5vZGUuCj4gPiA+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogIEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFtaXQgU2lu
Z2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgICAgKiBU
aGlzIHJlcGxhY2VzIGZvbGxvd2luZyBwYXRjaC4KPiA+ID4gICAgICAgIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4OTk4ODEvCj4gPiA+IC0tLQo+ID4gPiAgIHhlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyB8IDE2ICsrKysrKysrKysrKysrKy0KPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCj4gPiA+IGluZGV4IGQ5ODM2NzcuLjhmNTQ0NzIgMTAwNjQ0Cj4gPiA+IC0tLSBh
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKPiA+ID4gQEAgLTEzNTMsNyArMTM1Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
Cj4gPiA+ICAgICAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sCj4gPiA+ICAgICAgIH07Cj4gPiA+
ICAgICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqY2hpbGQ7Cj4gPiA+IC0gICAgaW50IHJlczsK
PiA+ID4gKyAgICBpbnQgcmVzLCBpLCBuaXJxLCBpcnFfaWQ7Cj4gPiA+ICAgICAgIGNvbnN0IGNo
YXIgKm5hbWU7Cj4gPiA+ICAgICAgIGNvbnN0IGNoYXIgKnBhdGg7Cj4gPiA+Cj4gPiA+IEBAIC0x
Mzk5LDYgKzEzOTksMjAgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiA+ID4gICAgICAgICAgIHJldHVy
biAwOwo+ID4gPiAgICAgICB9Cj4gPiA+Cj4gPiA+ICsgICAgLyogU2tpcCB0aGUgbm9kZSwgdXNp
bmcgUFBJIHNvdXJjZSAqLwo+ID4gPiArICAgIG5pcnEgPSBkdF9udW1iZXJfb2ZfaXJxKG5vZGUp
Owo+ID4gPiArCj4gPiA+ICsgICAgZm9yICggaSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCj4gPiA+
ICsgICAgewo+ID4gPiArICAgICAgICBpcnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5vZGUsIGkp
OyAgCj4gPgo+ID4gRG8gd2UgbmVlZCB0byBkbyBzb21ldGhpbmcgaGVyZSBpZiBwbGF0Zm9ybV9n
ZXRfaXJxKCkgcmV0dXJucyAtMT8gIAo+IAo+IFllYWgsIEkgc2hvdWxkIGhhdmUgZG9uZSBpdC4g
c29tZSB0aGluayBsaWtlIGZvbGxvd2luZzoKPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj14ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM7aD1kOTgz
Njc3OWQxN2M5MGU4NGI5NGJhMzJlNGEyMGYwMjgxODlmYzViO2hiPUhFQUQjbDEyODQKCldoeSB3
b3VsZCB0aGF0IChvciBhbnkgYWN0dWFsIGNoZWNrIGFnYWluc3QgLTEpIGJlIG5lY2Vzc2FyeT8K
SWYgaXJxX2lkIGlzIDwgMCwgdGhlbiBpdCB3b3VsZCBzdXJlbHkgbm90IG1hdGNoIHRoZSBjb25k
aXRpb24gYmVsb3cgYW5kCipub3RoaW5nKiB3b3VsZCBoYXBwZW4uIFNvIEknZCBzYXk6IEtlZXAg
aXQgbGlrZSBpdCBpcywgbm8gYWN0aW9uIG5lY2Vzc2FyeS4KCj4gPiA+ICsKPiA+ID4gKyAgICAg
ICAgaWYgKCBpcnFfaWQgPj0gMTYgJiYgaXJxX2lkIDwgMzIgKQoKQW55IGNoYW5jZSB5b3UgY2Fu
IHB1dCBuYW1lcyB0aGVyZT8gT3IgYXQgbGVhc3QgYWRkIGEgY29tbWVudCB0aGF0IFBQSXMgcmFu
Z2UgZnJvbSAxNiB0byAzMT8KCj4gPiA+ICsgICAgICAgIHsKPiA+ID4gKyAgICAgICAgICAgIGR0
X2RwcmludGsoIiBTa2lwIG5vZGUgd2l0aCAoUFBJIHNvdXJjZSlcbiIpOwo+ID4gPiArICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiA+ICsgICAgICAgIH0KPiA+ID4gKyAgICB9Cj4gPiA+ICsKPiA+
ID4gICAgICAgLyoKPiA+ID4gICAgICAgICogWGVuIGlzIHVzaW5nIHNvbWUgcGF0aCBmb3IgaXRz
IG93biBwdXJwb3NlLiBXYXJuIGlmIGEgbm9kZQo+ID4gPiAgICAgICAgKiBhbHJlYWR5IGV4aXN0
cyB3aXRoIHRoZSBzYW1lIHBhdGguICAKPiA+Cj4gPiBQYXRjaCBsb29rcyBnb29kLiBBbHRob3Vn
aCBSLUNhciBIMyBzZWVtcyB0byBub3QgdXNlIFBQSXMgZm9yIFBNVSwgSQo+ID4gaGF2ZSB0ZXN0
ZWQgeW91ciBwYXRjaCBqdXN0IHRvIGJlIHN1cmUgaXQgd291bGRuJ3Qgc2tpcCBhbnl0aGluZyBi
eSBhCj4gPiBtaXN0YWtlKSAgCj4gCj4gT2ssIFRoYW5rcyBmb3IgdGVzdGluZyBpdC4gSSB3b3Vs
ZCByZXNlbmQgaXQgd2l0aCBlcnJvciBjb25kaXRpb24gY2hlY2suCgpQbGVhc2UgZG9uJ3QgOy0p
CgpDaGVlcnMsCkFuZHJlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
