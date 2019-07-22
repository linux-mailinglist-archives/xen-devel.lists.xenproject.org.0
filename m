Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E697096B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 21:13:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpdhG-0008HL-1k; Mon, 22 Jul 2019 19:10:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V0js=VT=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hpdhE-00088l-SV
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 19:10:04 +0000
X-Inumbo-ID: 4eb47d7e-acb4-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4eb47d7e-acb4-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 19:10:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3050230821AE;
 Mon, 22 Jul 2019 19:10:02 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-23.ams2.redhat.com
 [10.36.117.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 668C41001B23;
 Mon, 22 Jul 2019 19:10:00 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <aafe1ed8-74e3-02b7-0156-5ff1b5589869@redhat.com>
 <20190719164223.GE1208@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a66c6f04-5d5e-4a03-215c-f89f26214631@redhat.com>
Date: Mon, 22 Jul 2019 21:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190719164223.GE1208@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 22 Jul 2019 19:10:02 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v3 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
 Andrew Cooper <andrew.cooper3@citrix.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMTkvMTkgMTg6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDA1
LCAyMDE5IGF0IDAyOjIxOjEzUE0gKzAyMDAsIExhc3psbyBFcnNlayB3cm90ZToKPj4gVGhlIHBh
dGNoZXMgb24gdGhlIGxpc3QgYXJlIG1hbGZvcm1lZC4gVGhleSBoYXZlCj4+Cj4+IENvbnRlbnQt
VHJhbnNmZXItRW5jb2Rpbmc6IHF1b3RlZC1wcmludGFibGUKPj4KPj4gd2hpY2ggaXMgZmluZSwg
aW4gaXRzZWxmOyBob3dldmVyLCB0aGV5IGhhdmUgQ1ItQ1ItTEYgbGluZSB0ZXJtaW5hdG9ycy4K
Pj4KPj4gRm9yIGV4YW1wbGUsIGZyb20gdGhlIGZpcnN0IHBhdGNoOgo+Pgo+PiBkaWZmIC0tZ2l0
IGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZiBiL092
bWZQa2cvTD0KPj4gaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZgo+PiBp
bmRleCA3YzQ0Zjk5YTVjLi4yZjI0ZGFjODdmIDEwMDY0NAo+PiAtLS0gYS9Pdm1mUGtnL0xpYnJh
cnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mCj4+ICsrKyBiL092bWZQa2cvTGli
cmFyeS9SZXNldFN5c3RlbUxpYi9SZXNldFN5c3RlbUxpYi5pbmYKPj4gQEAgLTMwLDQgKzMwLDUg
QEAgW1BhY2thZ2VzXQo+PiAgW0xpYnJhcnlDbGFzc2VzXT0wRD0wRAo+PiAgICBEZWJ1Z0xpYj0w
RD0wRAo+PiAgICBJb0xpYj0wRD0wRAo+PiArICBQY2lMaWI9MEQ9MEQKPj4gICAgVGltZXJMaWI9
MEQ9MEQKPj4KPj4gTm90ZSAiPTBEPTBEIi4KPj4KPj4gTm93LCBpZiBJIHRyeSB0byBhcHBseSB0
aGlzIGZ1bGwgc2V0IHdpdGggZ2l0LWFtIGxpa2UgdGhhdCwgdGhlIGZpcnN0Cj4+IHBhdGNoIGlu
IHRoZSBzZXJpZXMgYXBwbGllcywgYnV0IHRoZSBzZWNvbmQgc3RpbGwgZmFpbHM6Cj4+Cj4+PiBl
cnJvcjogY29ycnVwdCBwYXRjaCBhdCBsaW5lIDIzCj4+PiBQYXRjaCBmYWlsZWQgYXQgMDAwMiBP
dm1mUGtnOiBDcmVhdGUgcGxhdGZvcm0gT3ZtZlhlbgo+Pgo+PiBCYXNlZCBvbiB0aGUgZW1haWwg
aGVhZGVycywgdGhlICJpcGhteC5jb20iIHJlZmVyZW5jZXMgc3VnZ2VzdCAodmlhIGEKPj4gZ29v
Z2xlIHNlYXJjaCkgIkNpc2NvJ3MgSXJvbnBvcnQgQ2xvdWQgZW1haWwgc2VydmljZSIuCj4+Cj4+
IEkgdGhpbmsgdGhhdCBlbWFpbCBzZXJ2aWNlIChNVEEpIGlzIGJyb2tlbi4KPj4KPj4gSWYgeW91
IGNvdWxkIHVzZSBhIGRpZmZlcmVudCBNVEEgKG9yIGdldCB0aGUgY3VycmVudCBvbmUgZml4ZWQp
LCB0aGF0Cj4+IHdvdWxkIGJlIGhlbHBmdWwuIChZZXMsIHllczogaWYgdGhlIGVkazIgcHJvamVj
dCBkaWRuJ3QgdXNlIENSTEYgbGluZQo+PiB0ZXJtaW5hdG9ycywgdGhhdCB3b3VsZCBiZSAqZXZl
biBtb3JlKiBoZWxwZnVsLikKPiAKPiBJJ20gbm90IHN1cmUgdGhhdCB1c2luZyBhIGRpZmZlcmVu
dCBNVEEgaXMgZ29pbmcgdG8gaGVscC4gSSBkb24ndCB0aGluawo+IEkgY2FuIGZpbmQgYSBwYXRj
aCBvbiB0aGUgbGlzdCB0aGF0IEkgY2FuIGFwcGx5ICh3aXRob3V0IHVzaW5nIHVuaXgyZG9zKS4K
PiBJIGRpZCBzZW5kIGEgcGF0Y2ggdG8gbXkgZ21haWwgYWRkcmVzcywgYW5kIGl0IGxvb2tzIGZp
bmUgKD0wRCBpbiB0aGUKPiBleHBlY3RlZCBwbGFjZXMgYW5kIG5vd2hlcmUgZWxzZSkuIFNvIG1h
eWJlIHdoZW4gYSBwYXRjaCBpcyBzZW50IHRocm91Z2gKPiBhIG1haWxpbmcgbGlzdCwgc29tZSBt
b3JlIGZvcm1hdGluZyBpcyBkb25lPwo+IAo+IEFueXdheSwgY2FuIEkgdHJ5IHNlbmRpbmcgcGF0
Y2ggZW5jb2RlZCBpbiBiYXNlNjQgaW5zdGVhZCBvZgo+IHF1b3RlZC1wcmludGFibGU/IFRoYXQg
d291bGQgcHJvYmFibHkgd29yayBiZXR0ZXIuCj4gCj4gSSBmb3VuZCA8MjAxOTA3MDQwNDA3MzEu
NTMwMy0xLWdsaW5Ac3VzZS5jb20+IG9uIHRoZSBsaXN0IHRoYXQgaXMgYmFzZTY0Cj4gZW5jb2Rl
ZCwgdGhhdCBJIGNhbiBlYXNpbHkgYXBwbHkgYW5kIHBhdGNoZXcgdG9vLgoKVGhhdCBwYXRjaCAo
IltlZGsyLWRldmVsXSBbUEFUQ0ggdjJdIE92bWZQa2c6IHVzZSBEeGVUcG1NZWFzdXJlbWVudExp
YgppZiBhbmQgb25seSBpZiBUUE0yX0VOQUJMRSIpIHdvcmtlZCBmaW5lIGZvciBtZSBhcyB3ZWxs
LgoKSG93ZXZlciwgR2FyeSBjb25maXJtZWQgZWxzZXdoZXJlIHRoYXQgaGUgaGFkIHRvIHR3ZWFr
IHRoZSBwb3N0aW5nCnByb2Nlc3MgbWFudWFsbHksIGZvciB0aGF0IHBhdGNoOgoKaHR0cDovL21p
ZC5tYWlsLWFyY2hpdmUuY29tLzIwMTkwNzA0MDg1ODI2LkdEMzIzNDBAR2FyeVdvcmtzdGF0aW9u
CgpUaGFua3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
