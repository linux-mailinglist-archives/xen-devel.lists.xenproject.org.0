Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8AE4352
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 08:11:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNsmZ-0000ii-5x; Fri, 25 Oct 2019 06:09:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AepH=YS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNsmX-0000iZ-1r
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 06:09:05 +0000
X-Inumbo-ID: f18fee2e-f6ed-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f18fee2e-f6ed-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 06:09:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5C05B544;
 Fri, 25 Oct 2019 06:09:02 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Andy Lutomirski <luto@kernel.org>
References: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
 <CALCETrWAALF7EgxHGs-rtZwk1Fxttr56QKXeB6QssXbyXDs+kA@mail.gmail.com>
 <4c4b0cdf-55e5-7be5-bf49-08fe8fd18dca@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <76fd94f0-cfc6-5ad5-673b-725f4d72a69b@suse.com>
Date: Fri, 25 Oct 2019 08:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4c4b0cdf-55e5-7be5-bf49-08fe8fd18dca@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/stackframe/32: repair 32-bit Xen PV
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
 X86 ML <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMTkgMDg6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjEwLjIwMTkgMTg6
MTEsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4gT24gTW9uLCBPY3QgNywgMjAxOSBhdCAzOjQx
IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT25jZSBh
Z2FpbiBSUEwgY2hlY2tzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHdoaWNoIGRvbid0IGFjY291bnQg
Zm9yIGEKPj4+IDMyLWJpdCBrZXJuZWwgbGl2aW5nIGluIHJpbmcgMSB3aGVuIHJ1bm5pbmcgaW4g
YSBQViBYZW4gZG9tYWluLiBUaGUKPj4+IGNhc2UgaW4gRklYVVBfRlJBTUUgaGFzIGJlZW4gcHJl
dmVudGluZyBib290OyBhZGp1c3QgQlVHX0lGX1dST05HX0NSMwo+Pj4gYXMgd2VsbCBqdXN0IGlu
IGNhc2UuCj4+Cj4+IEknbSBva2F5IHdpdGggdGhlIGdlbmVyYXRlZCBjb2RlLCBidXQgSU1PIHRo
ZSBtYWNybyBpcyB0b28gaW5kaXJlY3QKPj4gZm9yIHNvbWV0aGluZyB0aGF0J3MgdHJpdmlhbC4K
Pj4KPj4+Cj4+PiBGaXhlczogM2M4OGM2OTJjMjg3ICgieDg2L3N0YWNrZnJhbWUvMzI6IFByb3Zp
ZGUgY29uc2lzdGVudCBwdF9yZWdzIikKPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPj4+Cj4+PiAtLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5T
Cj4+PiArKysgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5TCj4+PiBAQCAtNDgsNiArNDgsMTcg
QEAKPj4+Cj4+PiAgICAjaW5jbHVkZSAiY2FsbGluZy5oIgo+Pj4KPj4+ICsjaWZuZGVmIENPTkZJ
R19YRU5fUFYKPj4+ICsjIGRlZmluZSBVU0VSX1NFR01FTlRfUlBMX01BU0sgU0VHTUVOVF9SUExf
TUFTSwo+Pj4gKyNlbHNlCj4+PiArLyoKPj4+ICsgKiBXaGVuIHJ1bm5pbmcgcGFyYXZpcnR1YWxp
emVkIG9uIFhlbiB0aGUga2VybmVsIHJ1bnMgaW4gcmluZyAxLCBhbmQgaGVuY2UKPj4+ICsgKiBz
aW1wbGUgbWFzayBiYXNlZCB0ZXN0cyAoaS5lLiBvbmVzIG5vdCBjb21wYXJpbmcgYWdhaW5zdCBV
U0VSX1JQTCkgaGF2ZSB0bwo+Pj4gKyAqIGlnbm9yZSBiaXQgMC4gU2VlIGFsc28gdGhlIEMtbGV2
ZWwgZ2V0X2tlcm5lbF9ycGwoKS4KPj4+ICsgKi8KPj4KPj4gSG93IGFib3V0Ogo+Pgo+PiAvKgo+
PiAgICAqIFdoZW4gcnVubmluZyBvbiBYZW4gUFYsIHRoZSBhY3R1YWwgJWNzIHJlZ2lzdGVyIGlu
IHRoZSBrZXJuZWwgaXMgMSwgbm90IDAuCj4+ICAgICogSWYgd2UgbmVlZCB0byBkaXN0aW5ndWlz
aCBiZXR3ZWVuIGEgJWNzIGZyb20ga2VybmVsIG1vZGUgYW5kIGEgJWNzIGZyb20KPj4gICAgKiB1
c2VyIG1vZGUsIHdlIGNhbiBkbyB0ZXN0ICQyIGluc3RlYWQgb2YgdGVzdCAkMy4KPj4gICAgKi8K
Pj4gI2RlZmluZSBVU0VSX1NFR01FTlRfUlBMX01BU0sgMgo+IAo+IEkuZS4geW91J3JlIGZpbmUg
dXNpbmcganVzdCB0aGUgc2luZ2xlIGJpdCBpbiBhbGwgY29uZmlndXJhdGlvbnM/Cj4gCj4+PiAr
IyBkZWZpbmUgVVNFUl9TRUdNRU5UX1JQTF9NQVNLIChTRUdNRU5UX1JQTF9NQVNLICYgfjEpCj4+
PiArI2VuZGlmCj4+PiArCj4+PiAgICAgICAgICAgLnNlY3Rpb24gLmVudHJ5LnRleHQsICJheCIK
Pj4+Cj4+PiAgICAvKgo+Pj4gQEAgLTE3Miw3ICsxODMsNyBAQAo+Pj4gICAgICAgICAgIEFMVEVS
TkFUSVZFICJqbXAgLkxlbmRfXEAiLCAiIiwgWDg2X0ZFQVRVUkVfUFRJCj4+PiAgICAgICAgICAg
LmlmIFxub191c2VyX2NoZWNrID09IDAKPj4+ICAgICAgICAgICAvKiBjb21pbmcgZnJvbSB1c2Vy
bW9kZT8gKi8KPj4+IC0gICAgICAgdGVzdGwgICAkU0VHTUVOVF9SUExfTUFTSywgUFRfQ1MoJWVz
cCkKPj4+ICsgICAgICAgdGVzdGwgICAkVVNFUl9TRUdNRU5UX1JQTF9NQVNLLCBQVF9DUyglZXNw
KQo+Pgo+PiBTaG91bGRuJ3QgUFRfQ1MoJWVzcCkgYmUgMCBpZiB3ZSBjYW1lIGZyb20gdGhlIGtl
cm5lbD8gIEknbSBndWVzc2luZwo+PiB0aGUgYWN0dWFsIGJ1ZyBpcyBpbiB3aGF0ZXZlciBjb2Rl
IHB1dCAxIGluIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pgo+PiBJbiBvdGhlciB3b3Jkcywg
SSdtIGhhdmluZyB0cm91YmxlIHVuZGVyc3RhbmRpbmcgd2h5IHRoZXJlIGlzIGFueQo+PiBjb250
ZXh0IGluIHdoaWNoIHNvbWUgdmFsdWUgd291bGQgYmUgMyBmb3IgdXNlciBtb2RlIGFuZCAxIGZv
ciBrZXJuZWwKPj4gbW9kZS4gIE9idmlvdXNseSBpZiB3ZSdyZSBtYW51YWxseSBJUkVUaW5nIHRv
IGtlcm5lbCBtb2RlLCB3ZSBuZWVkIHRvCj4+IHNldCBDUyB0byAxLCBidXQgaWYgd2UncmUgZmls
bGluZyBpbiBvdXIgb3duIFBUX0NTLCB3ZSBzaG91bGQganVzdAo+PiB3cml0ZSAwLgo+Pgo+PiBU
aGUgc3VwcG9zZWRseSBvZmZlbmRpbmcgY29tbWl0ICgiIng4Ni9zdGFja2ZyYW1lLzMyOiBQcm92
aWRlCj4+IGNvbnNpc3RlbnQgcHRfcmVncyIpIGxvb2tzIGNvcnJlY3QgdG8gbWUsIHNvIEkgc3Vz
cGVjdCB0aGF0IHRoZQo+PiBwcm9ibGVtIGlzIGVsc2V3aGVyZS4gIE9yIGlzIGl0IGludGVudGlv
bmFsIHRoYXQgWGVuIFBWJ3MgYXNtCj4+IChhcmNoL3g4Ni94ZW4vd2hhdGV2ZXIpIHN0aWNrcyAx
IGludG8gdGhlIENTIGZpZWxkIG9uIHRoZSBzdGFjaz8KPiAKPiBNYW51YWxseSBjcmVhdGVkIC8g
dXBkYXRlZCBmcmFtZXMgX2NvdWxkXyBpbiBwcmluY2lwbGUgbW9kaWZ5IHRoZQo+IFJQTCwgYnV0
IG9uZXMgY29taW5nIGZyb20gaGFyZHdhcmUgKG9sZCAzMi1iaXQgaHlwZXJ2aXNvcnMpIG9yIFhl
bgo+ICg2NC1iaXQgaHlwZXJ2aXNvcnMpIHdpbGwgaGF2ZSBhbiBSUEwgb2YgMSwgYXMgYWxyZWFk
eSBzYWlkIGJ5Cj4gQW5kcmV3LiBXZSBjb3VsZCBpbiBwcmluY2lwbGUgYWxzbyBhZGQgYSBWTSBh
c3Npc3QgZm9yIHRoZQo+IGh5cGVydmlzb3IgdG8gc3RvcmUgYW4gUlBMIG9mIDAsIGJ1dCBJJ2Qg
ZXhwZWN0IHRoaXMgdG8gcmVxdWlyZQo+IGZ1cnRoZXIga2VybmVsIGNoYW5nZXMsIGFuZCB0b2dl
dGhlciB3aXRoIHRoZSBvbGQgYmVoYXZpb3Igc3RpbGwKPiBiZWluZyByZXF1aXJlZCB0byBzdXBw
b3J0IEknbSB1bmNvbnZpbmNlZCB0aGlzIHdvdWxkIGJlIHdvcnRoIGl0Lgo+IAo+PiBBbHNvLCB3
aHkgYXJlIHdlIHN1cHBvcnRpbmcgMzItYml0IExpbnV4IFBWIGd1ZXN0cyBhdCBhbGw/ICBDYW4g
d2UKPj4ganVzdCBkZWxldGUgdGhpcyBjb2RlIGluc3RlYWQ/Cj4gCj4gVGhpcyB3YXMgYWxyZWFk
eSBzdWdnZXN0ZWQgYnkgSsO8cmdlbiAobm93IGFsc28gQ0MtZWQpLCBidXQgaW4gcmVwbHkKPiBp
dCB3YXMgcG9pbnRlZCBvdXQgdGhhdCB0aGUgcHJvY2VzcyB3b3VsZCBiZSB0byBmaXJzdCBkZXBy
ZWNhdGUgdGhlCj4gY29kZSwgYW5kIHJlbW92ZSBpdCBvbmx5IGEgY291cGxlIG9mIHJlbGVhc2Vz
IGxhdGVyIGlmIG5vLW9uZSBjb21lcwo+IHVwIHdpdGggYSByZWFzb24gdG8gcmV0YWluIGl0LgoK
VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuCgpJJ2xsIHNlbmQgYSBwYXRjaCB3aXRoIHRoZSBkZXBy
ZWNhdGlvbiB3YXJuaW5nIGZvciAzMi1iaXQgUFYuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
