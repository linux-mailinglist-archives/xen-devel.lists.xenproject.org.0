Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C5124622
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:51:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXpJ-0002XD-5V; Wed, 18 Dec 2019 11:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihXpG-0002X5-Vf
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:49:11 +0000
X-Inumbo-ID: 66bc3721-218c-11ea-9065-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66bc3721-218c-11ea-9065-12813bfff9fa;
 Wed, 18 Dec 2019 11:49:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8780CB2D4;
 Wed, 18 Dec 2019 11:49:08 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
Date: Wed, 18 Dec 2019 12:49:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAwMjozMiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gRGVjb3VwbGUgdGhl
IG1pY3JvY29kZSByZWZlcmVuY2luZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVCIHRvIHRoYXQK
PiB3aGVuIHVzaW5nIEVGSS4gVGhpcyBhbGxvd3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmll
ZCBlZmZlY3QiIG9mCj4gdXNpbmcgYDxpbnRlZ2VyPiB8IHNjYW5gIGFsb25nIHhlbi5lZmkuCgpJ
IGd1ZXNzICJ1bnNwZWNpZmllZCBlZmZlY3QiIGluIHRoZSBkb2Mgd2FzIHByZXR0eSBwb2ludGxl
c3MgLSBzdWNoCm9wdGlvbnMgaGF2ZSBiZWVuIGlnbm9yZWQgYmVmb3JlOyBpbiBmYWN0IC4uLgoK
PiBXaXRoIHRoYXQsIFhlbiBjYW4gZXhwbGljaXRseQo+IGlnbm9yZSB0aG9zZSBuYW1lZCBvcHRp
b25zIHdoZW4gdXNpbmcgRUZJLgoKLi4uIEkgZG9uJ3Qgc2VlIHRoaW5ncyBiZWNvbWluZyBhbnkg
bW9yZSBleHBsaWNpdCAobm90IGV2ZW4gcGFyc2luZwp0aGUgb3B0aW9ucyB3YXMgcXVpdGUgZXhw
bGljaXQgdG8gbWUpLgoKPiBBcyBhbiBhZGRlZCBiZW5lZml0LAo+IHdlIGdldCBhIHN0cmFpZ2h0
Zm93YXJkIHBhcnNpbmcgb2YgdGhlIHVjb2RlIHBhcmFtZXRlci4KCkl0J3MgYSBzaW5nbGUgaWYo
KSB5b3UgZWxpbWluYXRlIC0gZm9yIG1lIHRoaXMgZG9lc24ndCBtYWtlIGl0Cm1lYW5pbmdmdWxs
eSBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4KCj4gLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gQEAg
LTIxMjgsNyArMjEyOCwxMyBAQCBsb2dpYyBhcHBsaWVzOgo+ICAjIyMgdWNvZGUgKHg4NikKPiAg
PiBgPSBMaXN0IG9mIFsgPGludGVnZXI+IHwgc2Nhbj08Ym9vbD4sIG5taT08Ym9vbD4gXWAKPiAg
Cj4gLVNwZWNpZnkgaG93IGFuZCB3aGVyZSB0byBmaW5kIENQVSBtaWNyb2NvZGUgdXBkYXRlIGJs
b2IuCj4gKyAgICBBcHBsaWNhYmlsaXR5OiB4ODYKPiArICAgIERlZmF1bHQ6IGBubWlgCj4gKwo+
ICtDb250cm9scyBmb3IgQ1BVIG1pY3JvY29kZSBsb2FkaW5nLiBGb3IgZWFybHkgbG9hZGluZywg
dGhpcyBwYXJhbWV0ZXIgY2FuCj4gK3NwZWNpZnkgaG93IGFuZCB3aGVyZSB0byBmaW5kIHRoZSBt
aWNyb2NvZGUgdXBkYXRlIGJsb2IuIEZvciBsYXRlIGxvYWRpbmcsCj4gK3RoaXMgcGFyYW1ldGVy
IHNwZWNpZmllcyBpZiB0aGUgdXBkYXRlIGhhcHBlbnMgd2l0aGluIGEgTk1JIGhhbmRsZXIgb3Ig
aW4KPiArYSBzdG9wX21hY2hpbmUgY29udGV4dC4KCkl0J3MgYWx3YXlzIHN0b3BfbWFjaGluZSBj
b250ZXh0LCBpc24ndCBpdD8gSSBhbHNvIGRvbid0IHRoaW5rIHRoaXMKaW1wbGVtZW50YXRpb24g
ZGV0YWlsIGJlbG9uZ3MgaGVyZS4KCj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gQEAgLTYwLDcgKzYwLDcgQEAKPiAgCj4g
IHN0YXRpYyBtb2R1bGVfdCBfX2luaXRkYXRhIHVjb2RlX21vZDsKPiAgc3RhdGljIHNpZ25lZCBp
bnQgX19pbml0ZGF0YSB1Y29kZV9tb2RfaWR4Owo+IC1zdGF0aWMgYm9vbF90IF9faW5pdGRhdGEg
dWNvZGVfbW9kX2ZvcmNlZDsKPiArc3RhdGljIHNpZ25lZCBpbnQgX19pbml0ZGF0YSB1Y29kZV9t
b2RfZWZpX2lkeDsKCkkgZG9uJ3Qgc2VlIGFueXRoaW5nIG5lZ2F0aXZlIGJlIHB1dCBpbnRvIGhl
cmUgLSBzaG91bGQgYmUgdW5zaWduZWQKaW50IHRoZW4uCgo+IEBAIC0xMDUsMTYgKzEwNSwxMCBA
QCBzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX2NhY2hlOwo+ICAKPiAg
dm9pZCBfX2luaXQgbWljcm9jb2RlX3NldF9tb2R1bGUodW5zaWduZWQgaW50IGlkeCkKPiAgewo+
IC0gICAgdWNvZGVfbW9kX2lkeCA9IGlkeDsKPiAtICAgIHVjb2RlX21vZF9mb3JjZWQgPSAxOwo+
ICsgICAgdWNvZGVfbW9kX2VmaV9pZHggPSBpZHg7CgpJcyBpdCBndWFyYW50ZWVkIChub3cgYW5k
IGZvcmV2ZXIpIHRoYXQgdGhlIGluZGV4IHBhc3NlZCBpbiBpcwpub24temVybz8gWW91IGNoYW5n
ZXMgdG8gbWljcm9jb2RlX2dyYWJfbW9kdWxlKCkgaW1wbHkgc28sIGJ1dApqdXN0IGxvb2tpbmcg
YXQgdGhlIGNhbGwgc2l0ZSBvZiB0aGUgZnVuY3Rpb24gSSBjYW4ndCBjb252aW5jZQpteXNlbGYg
dGhpcyBpcyB0aGUgY2FzZS4gX0lmXyBpdCBpcyAodGhvdWdodCB0byBiZSkgZ3VhcmFudGVlZCwK
dGhlbiBJIHRoaW5rIHlvdSBhdCBsZWFzdCB3YW50IHRvIEFTU0VSVCgpIGhlcmUsIHBlcmhhcHMg
d2l0aAphIGNvbW1lbnQuCgo+ICB9Cj4gIAo+IC0vKgo+IC0gKiBUaGUgZm9ybWF0IGlzICdbPGlu
dGVnZXI+fHNjYW49PGJvb2w+LCBubWk9PGJvb2w+XScuIEJvdGggb3B0aW9ucyBhcmUKPiAtICog
b3B0aW9uYWwuIElmIHRoZSBFRkkgaGFzIGZvcmNlZCB3aGljaCBvZiB0aGUgbXVsdGlib290IHBh
eWxvYWRzIGlzIHRvIGJlCj4gLSAqIHVzZWQsIG9ubHkgbm1pPTxib29sPiBpcyBwYXJzZWQuCj4g
LSAqLwo+IC1zdGF0aWMgaW50IF9faW5pdCBwYXJzZV91Y29kZShjb25zdCBjaGFyICpzKQo+ICtz
dGF0aWMgaW50IF9faW5pdCBwYXJzZV91Y29kZV9wYXJhbShjb25zdCBjaGFyICpzKQoKQW55IHBh
cnRpY3VsYXIgcmVhc29uIGZvciB0aGUgcmVuYW1pbmc/IFRoZSBmdW5jdGlvbiBuYW1lIHdhcyBx
dWl0ZQpmaW5lIGltby4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
