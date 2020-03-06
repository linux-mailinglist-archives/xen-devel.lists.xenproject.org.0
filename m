Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4E17BF9D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:54:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADOt-000743-7c; Fri, 06 Mar 2020 13:52:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jADOs-00073y-2P
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:52:26 +0000
X-Inumbo-ID: b567d2cc-5fb1-11ea-a7d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b567d2cc-5fb1-11ea-a7d9-12813bfff9fa;
 Fri, 06 Mar 2020 13:52:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14B92ABD1;
 Fri,  6 Mar 2020 13:52:24 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
 <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
 <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
 <001201d5f3bd$ebd549d0$c37fdd70$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f864b32c-57c7-757d-94cd-d8e8b6d6a8e0@suse.com>
Date: Fri, 6 Mar 2020 14:52:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001201d5f3bd$ebd549d0$c37fdd70$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDo0OCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTM6NDQKPj4gVG86IFBhdWwgRHVycmFudCA8eGFkaW1nbmlr
QGdtYWlsLmNvbT4KPj4gQ2M6IHBkdXJyYW50QGFtem4uY29tOyAnU3RlZmFubyBTdGFiZWxsaW5p
JyA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47ICdKdWxpZW4gR3JhbGwnIDxqdWxpZW5AeGVuLm9y
Zz47Cj4+ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz47ICdLb25yYWQgUnplc3p1dGVrIFdpbGsnIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPjsgJ0FuZHJldyBDb29wZXInCj4+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgJ0lh
biBKYWNrc29uJwo+PiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47ICdHZW9yZ2UgRHVubGFw
JyA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgJ1RpbSBEZWVnYW4nIDx0aW1AeGVuLm9yZz47
Cj4+ICdUYW1hcyBLIExlbmd5ZWwnIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyAnUm9nZXIgUGF1IE1vbm7DqScKPj4gPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvNl0gbW06IGFkZCAnaXNfc3BlY2lh
bF9wYWdlJyBtYWNyby4uLgo+Pgo+PiBPbiAwNi4wMy4yMDIwIDEzOjM1LCBQYXVsIER1cnJhbnQg
d3JvdGU6Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2Yg
SmFuIEJldWxpY2gKPj4+PiBTZW50OiAwNiBNYXJjaCAyMDIwIDEyOjIwCj4+Pj4gVG86IHBkdXJy
YW50QGFtem4uY29tCj4+Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1Cj4+IDx3bEB4
ZW4ub3JnPjsKPj4+PiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUGF1bAo+Pj4+
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPj4+PiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+OyB4ZW4tCj4+Pj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4+IFN1YmplY3Q6IFJlOiBbWGVu
LWRldmVsXSBbUEFUQ0ggdjMgNS82XSBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIG1hY3JvLi4u
Cj4+Pj4KPj4+PiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVycmFudEBhbXpuLmNvbSB3cm90ZToK
Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+Pj4+PiArKysgYi94
ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+Pj4+IEBAIC0yMDg3LDE5ICsyMDg3LDIy
IEBAIHN0YXRpYyBpbnQgc2hfcmVtb3ZlX2FsbF9tYXBwaW5ncyhzdHJ1Y3QgZG9tYWluICpkLCBt
Zm5fdCBnbWZuLCBnZm5fdCBnZm4pCj4+Pj4+ICAgICAgICAgICAqIFRoZSBxZW11IGhlbHBlciBw
cm9jZXNzIGhhcyBhbiB1bnR5cGVkIG1hcHBpbmcgb2YgdGhpcyBkb20ncyBSQU0KPj4+Pj4gICAg
ICAgICAgICogYW5kIHRoZSBIVk0gcmVzdG9yZSBwcm9ncmFtIHRha2VzIGFub3RoZXIuCj4+Pj4+
ICAgICAgICAgICAqIEFsc28gYWxsb3cgb25lIHR5cGVkIHJlZmNvdW50IGZvcgo+Pj4+PiAtICAg
ICAgICAgKiAtIFhlbiBoZWFwIHBhZ2VzLCB0byBtYXRjaCBzaGFyZV94ZW5fcGFnZV93aXRoX2d1
ZXN0KCksCj4+Pj4+IC0gICAgICAgICAqIC0gaW9yZXEgc2VydmVyIHBhZ2VzLCB0byBtYXRjaCBw
cmVwYXJlX3JpbmdfZm9yX2hlbHBlcigpLgo+Pj4+PiArICAgICAgICAgKiAtIHNwZWNpYWwgcGFn
ZXMsIHdoaWNoIGFyZSBleHBsaWNpdGx5IHJlZmVyZW5jZWQgYW5kIG1hcHBlZCBieQo+Pj4+PiAr
ICAgICAgICAgKiAgIFhlbi4KPj4+Pj4gKyAgICAgICAgICogLSBpb3JlcSBzZXJ2ZXIgcGFnZXMs
IHdoaWNoIG1heSBiZSBzcGVjaWFsIHBhZ2VzIG9yIG5vcm1hbAo+Pj4+PiArICAgICAgICAgKiAg
IGd1ZXN0IHBhZ2VzIHdpdGggYW4gZXh0cmEgcmVmZXJlbmNlIHRha2VuIGJ5Cj4+Pj4+ICsgICAg
ICAgICAqICAgcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPj4+Pj4gICAgICAgICAgICovCj4+
Pj4+ICAgICAgICAgIGlmICggIShzaGFkb3dfbW9kZV9leHRlcm5hbChkKQo+Pj4+PiAgICAgICAg
ICAgICAgICAgJiYgKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPD0gMwo+Pj4+
PiAgICAgICAgICAgICAgICAgJiYgKChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9jb3Vu
dF9tYXNrKQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgID09IChpc194ZW5faGVhcF9wYWdlKHBh
Z2UpIHx8Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgPT0gKGlzX3NwZWNpYWxfcGFnZShwYWdl
KSB8fAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAoaXNfaHZtX2RvbWFpbihkKSAmJiBp
c19pb3JlcV9zZXJ2ZXJfcGFnZShkLCBwYWdlKSkpKSkgKQo+Pj4+Cj4+Pj4gU2hvdWxkbid0IHlv
dSBkZWxldGUgbW9zdCBvZiB0aGlzIGxpbmUsIGFmdGVyIHRoZSBwcmV2aW91cyBwYXRjaAo+Pj4+
IGNvbnZlcnRlZCB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIHRvIFBHQ19leHRyYSBvbmVzPwo+Pj4K
Pj4+IEkgdGhvdWdodCB0aGF0IHRvbyBvcmlnaW5hbGx5IGJ1dCB0aGVuIEkgcmVhbGlzZSB3ZSBz
dGlsbCBoYXZlIHRvCj4+PiBjYXRlciBmb3IgdGhlICdsZWdhY3knIGVtdWxhdG9ycyB0aGF0IHN0
aWxsIHJlcXVpcmUgSU9SRVEgc2VydmVyCj4+PiBwYWdlcyB0byBiZSBtYXBwZWQgdGhyb3VnaCB0
aGUgcDJtLCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBub3QKPj4+IGJlIFBHQ19leHRyYSBwYWdl
cy4KPj4KPj4gT2gsIGluZGVlZC4gKEkgZG9uJ3Qgc3VwcG9zZSB3ZSBjYW4gZXZlciBkbyBhd2F5
IHdpdGggdGhpcyBsZWdhY3kKPj4gbWVjaGFuaXNtPykKPiAKPiBJdCdzIHRyaWNreSBiZWNhdXNl
IGl0IHdvdWxkIGVpdGhlciBtZWFuIGJyZWFraW5nIG9sZGVyIChwcmUKPiByZXNvdXJjZS1tYXBw
aW5nKSBRRU1VcywKCkRpZG4ndCBldmVuIHFlbXUtdHJhZCBnZXQgc3dpdGNoZWQ/IChBbnl3YXks
IG5vdCBhIGJpZyBkZWFsIGhlcmUsCmp1c3Qgd291bGQgaGF2ZSBiZWVuIG5pY2UgaWYgdGhpcyBs
YXJnZSBjb25kaXRpb25hbCBjb3VsZCBoYXZlCmJlZW4gc2hydW5rIGEgbGl0dGxlIGluIHNpemUu
KQoKPiBvciBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGFsbG9jYXRlIHRoZSAnc3BlY2lhbCcg
cGFnZXMgd2l0aAo+IGFuIGV4dHJhIGZsYWcgdG8gbWFrZSB0aGVtIFBHQ19leHRyYS4KCkRvZXNu
J3Qgc291bmQgaW1wb3NzaWJsZSwgYnV0IGFsc28gbm90IHNvbWV0aGluZyB3ZSB3YW50IHRvIGVh
Z2VybHkKZ28gZm9yLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
