Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE3109D18
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 12:41:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZ9p-0007i1-Be; Tue, 26 Nov 2019 11:37:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZZ9o-0007h8-BE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 11:37:24 +0000
X-Inumbo-ID: 1c58d5d2-1041-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c58d5d2-1041-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 11:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7538AB418;
 Tue, 26 Nov 2019 11:37:21 +0000 (UTC)
To: Paul Durrant <pdurrant@gmail.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191113135330.1209-1-pdurrant@amazon.com>
 <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61bf7695-dc31-b3ea-181a-0ed3c7591526@suse.com>
Date: Tue, 26 Nov 2019 12:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMTkgMTI6MzAsIFBhdWwgRHVycmFudCB3cm90ZToKPiBPbiBXZWQsIDEzIE5vdiAy
MDE5IGF0IDEzOjU1LCBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+IHdyb3RlOgo+
Pgo+PiAuLi53aGVuIHRoZWlyIHZhbHVlcyBhcmUgbGFyZ2VyIHRoYW4gdGhlIHBlci1kb21haW4g
Y29uZmlndXJlZCBsaW1pdHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT4KPj4gLS0tCj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+PiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tPgo+PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Cj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IENjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgo+PiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPgo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgo+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4KPj4gQWZ0ZXIgbWluaW5n
IHRocm91Z2ggY29tbWl0cyBpdCBpcyBzdGlsbCB1bmNsZWFyIHRvIG1lIGV4YWN0bHkgd2hlbiBY
ZW4KPj4gc3RvcHBlZCBob25vdXJpbmcgdGhlIGdsb2JhbCB2YWx1ZXMsIGJ1dCBJIHJlYWxseSB0
aGluayB0aGlzIGNvbW1pdCBzaG91bGQKPj4gYmUgYmFjay1wb3J0ZWQgdG8gc3RhYmxlIHRyZWVz
IGFzIGl0IHdhcyBhIGJlaGF2aW91cmFsIGNoYW5nZSB0aGF0IGNhbgo+PiBjYXVzZSBkb21VcyB0
byBmYWlsIGluIG5vbi1vYnZpb3VzIHdheXMuCj4gCj4gQW55IG90aGVyIG9waW5pb25zIG9uIHRo
aXM/IEFGQUlDVCBxdWVzdGlvbnMgaXMgc3RpbGwgb3BlbjoKPiAKPiAtIERvIHdlIGNvbnNpZGVy
IG5vdCBob25vdXJpbmcgdGhlIGNvbW1hbmQgbGluZSB2YWx1ZXMgdG8gYmUgYQo+IHJlZ3Jlc3Np
b24gKHNpbmNlIGRvbVVzIHRoYXQgd291bGQgaGF2ZSB3b3JrZWQgYmVmb3JlIHdpbGwgbm8gbG9u
Z2VyCj4gd29yayBhZnRlciBhIGJhc2ljIHVwZ3JhZGUgb2YgWGVuKT8KPiAKPiAgICBQYXVsCj4g
Cj4+IC0tLQo+PiAgIHhlbi9jb21tb24vZG9tYWluLmMgfCAxNCArKysrKysrKysrKystLQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKPj4g
aW5kZXggNjExMTE2YzdmYy4uYWFkNmQ1NWI4MiAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9k
b21haW4uYwo+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4+IEBAIC0zMzUsNiArMzM1LDcg
QEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAo+PiAgICAgICBl
bnVtIHsgSU5JVF93YXRjaGRvZyA9IDF1PDwxLAo+PiAgICAgICAgICAgICAgSU5JVF9ldnRjaG4g
PSAxdTw8MywgSU5JVF9nbnR0YWIgPSAxdTw8NCwgSU5JVF9hcmNoID0gMXU8PDUgfTsKPj4gICAg
ICAgaW50IGVyciwgaW5pdF9zdGF0dXMgPSAwOwo+PiArICAgIHVuc2lnbmVkIGludCBtYXhfZ3Jh
bnRfZnJhbWVzLCBtYXhfbWFwdHJhY2tfZnJhbWVzOwo+Pgo+PiAgICAgICBpZiAoIGNvbmZpZyAm
JiAoZXJyID0gc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhjb25maWcpKSApCj4+ICAgICAgICAgICBy
ZXR1cm4gRVJSX1BUUihlcnIpOwo+PiBAQCAtNDU2LDggKzQ1NywxNyBAQCBzdHJ1Y3QgZG9tYWlu
ICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCj4+ICAgICAgICAgICAgICAgZ290byBmYWls
Owo+PiAgICAgICAgICAgaW5pdF9zdGF0dXMgfD0gSU5JVF9ldnRjaG47Cj4+Cj4+IC0gICAgICAg
IGlmICggKGVyciA9IGdyYW50X3RhYmxlX2luaXQoZCwgY29uZmlnLT5tYXhfZ3JhbnRfZnJhbWVz
LAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZpZy0+bWF4X21h
cHRyYWNrX2ZyYW1lcykpICE9IDAgKQo+PiArICAgICAgICAvKgo+PiArICAgICAgICAgKiBNYWtl
IHN1cmUgdGhhdCB0aGUgY29uZmlndXJlZCB2YWx1ZXMgZG9uJ3QgcmVkdWNlIGFueQo+PiArICAg
ICAgICAgKiBnbG9iYWwgY29tbWFuZCBsaW5lIG92ZXJyaWRlLgo+PiArICAgICAgICAgKi8KPj4g
KyAgICAgICAgbWF4X2dyYW50X2ZyYW1lcyA9IG1heChjb25maWctPm1heF9ncmFudF9mcmFtZXMs
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0X21heF9ncmFudF9mcmFtZXMp
Owo+PiArICAgICAgICBtYXhfbWFwdHJhY2tfZnJhbWVzID0gbWF4KGNvbmZpZy0+bWF4X21hcHRy
YWNrX2ZyYW1lcywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRfbWF4
X21hcHRyYWNrX2ZyYW1lcyk7Cj4+ICsKPj4gKyAgICAgICAgaWYgKCAoZXJyID0gZ3JhbnRfdGFi
bGVfaW5pdChkLCBtYXhfZ3JhbnRfZnJhbWVzLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1heF9tYXB0cmFja19mcmFtZXMpKSAhPSAwICkKClNvIGJhc2ljYWxseSB0
aGUgcGVyLWRvbWFpbiBzZXR0aW5ncyBhcmUgaWdub3JlZC4KClRoZXkgYXJlIG5vdCBhbGxvd2Vk
IHRvIGJlIHNtYWxsZXIgdGhhbiB0aGUgZ2xvYmFsIGxpbWl0cyAoZHVlIHRvCnVzaW5nIG1heCgp
KS4KClRoZXkgYXJlIG5vdCBhbGxvd2VkIHRvIGJlIGxhcmdlciB0aGFuIHRoZSBnbG9iYWwgbGlt
aXRzIChkdWUgdG8gdGhlCnRlc3QgaW4gZ3JhbnRfdGFibGVfaW5pdCgpLgoKVGhhdCBpcyBfbm90
XyB0aGUgcHVycG9zZSBvZiBiZWluZyBhYmxlIHRvIGNvbnRyb2wgdGhlIHNldHRpbmdzIHBlcgpk
b21haW4uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
