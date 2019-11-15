Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E922FE022
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:32:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVccD-0005qj-W4; Fri, 15 Nov 2019 14:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVccC-0005qc-HR
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:30:24 +0000
X-Inumbo-ID: 74620a04-07b4-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74620a04-07b4-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 14:30:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14B45B2C2;
 Fri, 15 Nov 2019 14:30:21 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andy Lutomirski <luto@kernel.org>
References: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
Message-ID: <6da403e5-cb52-a5d5-0cbe-fd7c2e8a22ef@suse.com>
Date: Fri, 15 Nov 2019 15:30:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH v2] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5keSwKCk9uIDI5LjEwLjIwMTkgMTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uY2UgYWdh
aW4gUlBMIGNoZWNrcyBoYXZlIGJlZW4gaW50cm9kdWNlZCB3aGljaCBkb24ndCBhY2NvdW50IGZv
ciBhCj4gMzItYml0IGtlcm5lbCBsaXZpbmcgaW4gcmluZyAxIHdoZW4gcnVubmluZyBpbiBhIFBW
IFhlbiBkb21haW4uIFRoZQo+IGNhc2UgaW4gRklYVVBfRlJBTUUgaGFzIGJlZW4gcHJldmVudGlu
ZyBib290OyBhZGp1c3QgQlVHX0lGX1dST05HX0NSMwo+IGFzIHdlbGwganVzdCBpbiBjYXNlLgo+
IAo+IEZpeGVzOiAzYzg4YzY5MmMyODcgKCJ4ODYvc3RhY2tmcmFtZS8zMjogUHJvdmlkZSBjb25z
aXN0ZW50IHB0X3JlZ3MiKQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCndvdWxkIHlvdSBtaW5kIGNsYXJpZnlpbmcgd2hldGhlciBJIHNob3VsZCBmb2xs
b3cgVGhvbWFzJyByZXF1ZXN0LApvdmVycmlkaW5nIHdoYXQgeW91IGhhZCBhc2tlZCBmb3IgYW4g
SSBkaWQgY2Fycnkgb3V0IGZvciB2Mj8gSSBkb24ndAp0aGluayB0aGlzIHJlZ3Jlc3Npb24gc2hv
dWxkIGJlIGxlZnQgdW5maXhlZCBmb3IgbXVjaCBsb25nZXIgKGFzCm11Y2ggYXMgdGhlIG90aGVy
IHBhcnQgb2YgaXQsIGFkZHJlc3NlZCBieSBhIGxhdGVyIDItcGF0Y2ggc2VyaWVzKS4KClRoYW5r
cywgSmFuCgo+IC0tLQo+IHYyOiBBdm9pZCAjaWZkZWYgYW5kIGFsdGVyIGNvbW1lbnQgYWxvbmcg
dGhlIGxpbmVzIG9mIEFuZHkncyBzdWdnZXN0aW9uLgo+IAo+IC0tLSBhL2FyY2gveDg2L2VudHJ5
L2VudHJ5XzMyLlMKPiArKysgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5TCj4gQEAgLTQ4LDYg
KzQ4LDEzIEBACj4gIAo+ICAjaW5jbHVkZSAiY2FsbGluZy5oIgo+ICAKPiArLyoKPiArICogV2hl
biBydW5uaW5nIG9uIFhlbiBQViwgdGhlIGFjdHVhbCAlY3MgcmVnaXN0ZXIncyBSUEwgaW4gdGhl
IGtlcm5lbCBpcyAxLAo+ICsgKiBub3QgMC4gSWYgd2UgbmVlZCB0byBkaXN0aW5ndWlzaCBiZXR3
ZWVuIGEgJWNzIGZyb20ga2VybmVsIG1vZGUgYW5kIGEgJWNzCj4gKyAqIGZyb20gdXNlciBtb2Rl
LCB3ZSBjYW4gZG8gdGVzdCAkMiBpbnN0ZWFkIG9mIHRlc3QgJDMuCj4gKyAqLwo+ICsjZGVmaW5l
IFVTRVJfU0VHTUVOVF9SUExfTUFTSyAyCj4gKwo+ICAJLnNlY3Rpb24gLmVudHJ5LnRleHQsICJh
eCIKPiAgCj4gIC8qCj4gQEAgLTE3Miw3ICsxNzksNyBAQAo+ICAJQUxURVJOQVRJVkUgImptcCAu
TGVuZF9cQCIsICIiLCBYODZfRkVBVFVSRV9QVEkKPiAgCS5pZiBcbm9fdXNlcl9jaGVjayA9PSAw
Cj4gIAkvKiBjb21pbmcgZnJvbSB1c2VybW9kZT8gKi8KPiAtCXRlc3RsCSRTRUdNRU5UX1JQTF9N
QVNLLCBQVF9DUyglZXNwKQo+ICsJdGVzdGwJJFVTRVJfU0VHTUVOVF9SUExfTUFTSywgUFRfQ1Mo
JWVzcCkKPiAgCWp6CS5MZW5kX1xACj4gIAkuZW5kaWYKPiAgCS8qIE9uIHVzZXItY3IzPyAqLwo+
IEBAIC0yMTcsNyArMjI0LDcgQEAKPiAgCXRlc3RsCSRYODZfRUZMQUdTX1ZNLCA0KjQoJWVzcCkK
PiAgCWpuegkuTGZyb21fdXNlcm1vZGVfbm9fZml4dXBfXEAKPiAgI2VuZGlmCj4gLQl0ZXN0bAkk
U0VHTUVOVF9SUExfTUFTSywgMyo0KCVlc3ApCj4gKwl0ZXN0bAkkVVNFUl9TRUdNRU5UX1JQTF9N
QVNLLCAzKjQoJWVzcCkKPiAgCWpuegkuTGZyb21fdXNlcm1vZGVfbm9fZml4dXBfXEAKPiAgCj4g
IAlvcmwJJENTX0ZST01fS0VSTkVMLCAzKjQoJWVzcCkKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
