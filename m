Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F9832A2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:22:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzNg-0005M1-3g; Tue, 06 Aug 2019 13:20:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huzNf-0005Lr-Ea
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:19:59 +0000
X-Inumbo-ID: e2dab280-b84c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e2dab280-b84c-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 13:19:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0289AB11B;
 Tue,  6 Aug 2019 13:19:56 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
 <20190806094601.GG1250@mail-itl>
 <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
 <20190806105317.GH1250@mail-itl>
 <d9021dde-efa3-1ba8-bb63-98e99d424a32@suse.com>
 <20190806124349.GI1250@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6286ad1-4c11-8d86-c932-090f4c4fd13a@suse.com>
Date: Tue, 6 Aug 2019 15:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806124349.GI1250@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAxNDo0MywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMjowNTo0OFBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDYuMDguMjAxOSAxMjo1MywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDEyOjMzOjM5UE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjA4LjIwMTkgMTE6NDYsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDA3OjU2
OjM5QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDUuMDguMjAxOSAxNTo0
NCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToKPj4+Pj4+PiBJJ20gdHJ5aW5n
IHRvIGdldCBpdCB3b3JraW5nIGFuZCBpdCBpc24ndCBjbGVhciB0byBtZSB3aGF0IHNob3VsZCBJ
Cj4+Pj4+Pj4gY2hlY2sgZm9yICJJTlR4IGlzIGFsc28gZW5hYmxlZCIuIEkgYXNzdW1lZCBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEUKPj4+Pj4+PiBiaXQsIGJ1dCBpdCBsb29rcyBsaWtlIGd1ZXN0
IGhhcyBubyBjb250cm9sIG92ZXIgdGhpcyBiaXQsIGV2ZW4gaW4KPj4+Pj4+PiBwZXJtaXNzaXZl
IG1vZGUuICBUaGlzIG1lYW5zIGVuYWJsaW5nIE1TSSgtWCkgYWx3YXlzIGZhaWxzIGJlY2F1c2Ug
Z3Vlc3QKPj4+Pj4+PiBoYXMgbm8gd2F5IHRvIHNldCBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUg
Yml0IGJlZm9yZS4KPj4+Pj4+Cj4+Pj4+PiBXZWxsLCB0aGUgZ3Vlc3QgaGFzIG5vIGNvbnRyb2ws
IGJ1dCBpbiBvcmRlciB0byBlbmFibGUgTVNJeywtWH0gSSdkCj4+Pj4+PiBoYXZlIGV4cGVjdGVk
IHFlbXUgb3IgdGhlIERvbTAga2VybmVsIHRvIHNldCB0aGlzIGJpdCB1cCBmcm9udC4KPj4+Pj4K
Pj4+Pj4gcWVtdSB3b3VsZCBkbyB0aGF0LCB3aGVuIHJ1bm5pbmcgaW4gZG9tMC4gQnV0IGluIFBW
IHN0dWJkb21haW4gaXQgdGFsa3MKPj4+Pj4gdG8gcGNpYmFjaywgd2hpY2ggZmlsdGVycyBpdCBv
dXQuCj4+Pj4KPj4+PiBGaWx0ZXJpbmcgb3V0IHRoZSBndWVzdCBhdHRlbXB0IGlzIGZpbmUsIGJ1
dCBpdCBzaG91bGQgdGhlbiBzZXQgdGhlCj4+Pj4gYml0IHdoaWxlIHByZXBhcmluZyBNU0kvTVNJ
LVggZm9yIHRoZSBndWVzdC4gKEknbSBub3Qgc3VyZSBpdCB3b3VsZAo+Pj4+IG5lZWQgdG8gZG8g
c28gZXhwbGljaXRseSwgb3Igd2hldGhlciBpdCBjb3VsZG4ndCByZWx5IG9uIGNvZGUKPj4+PiBl
bHNld2hlcmUgaW4gdGhlIGtlcm5lbCBkb2luZyBzby4pCj4+PiAuLi4KPj4+PiBXZWxsLCBJIHRo
aW5rIEkndmUgbWFkZSBteSBwb3NpdGlvbiBjbGVhcjogU28gZmFyIHdlIHVzZSBwY2lfaW50eCgp
Cj4+Pj4gb25seSBvbiBkZXZpY2VzIHVzZWQgYnkgWGVuIGl0c2VsZi4gSSB0aGluayB0aGlzIHNo
b3VsZCByZW1haW4gdG8gYmUKPj4+PiB0aGF0IHdheS4gRGV2aWNlcyBpbiBwb3NzZXNzaW9uIG9m
IGRvbWFpbnMgKGluY2x1ZGluZyBEb20wKSBzaG91bGQKPj4+PiBiZSB1bmRlciBEb20wJ3MgY29u
dHJvbCBpbiB0aGlzIHJlZ2FyZC4KPj4+Cj4+PiBUaGUgdGhpbmcgaXMsIGluIGNhc2Ugb2YgdXNp
bmcgc3R1YmRvbWFpbiwgaXQncyBtb3N0bHkgc3R1YmRvbWFpbgo+Pj4gaGFuZGxpbmcgaXQuIEVz
cGVjaWFsbHkgYWxsIHRoZSBjb25maWcgc3BhY2UgaW50ZXJjZXB0aW9uIGFuZCBhcHBseWluZwo+
Pj4gbG9naWMgdG8gaXQgaXMgZG9uZSBieSBxZW11IGluIHN0dWJkb21haW4uIERvIHlvdSBzdWdn
ZXN0IGR1cGxpY2F0aW5nIC8KPj4+IG1vdmluZyB0aGF0IHBhcnQgdG8gZG9tMCBpbnN0ZWFkPyBX
aGF0IHdvdWxkIGJlIHRoZSBwb2ludCBmb3Igc3R1YmRvbWFpbgo+Pj4gdGhlbj8KPj4KPj4gTm90
aGluZyBzaG91bGQgYmUgbW92ZWQgYmV0d2VlbiBjb21wb25lbnRzIGlmIHBvc3NpYmxlIChhbmQg
aWYgcGxhY2VkCj4+IHNlbnNpYmx5KS4gQnV0IGlzbid0IHN0dWJkb20gKGJlaW5nIGEgUFYgRG9t
VSkgcmVseWluZyBvbiBwY2liYWNrIGluCj4+IERvbTAgYW55d2F5PyBBbmQgaGVuY2UgZG9lc24n
dCB0aGUgZmxvdyBvZiBldmVudHMgaW5jbHVkZQo+PiBwY2lfZW5hYmxlX21zaXsseH0oKSBpbnZv
a2VkIGJ5IHBjaWJhY2s/IEknZCBoYXZlIGV4cGVjdGVkIHRoYXQgdG8KPj4gKGFsc28pIHRha2Ug
Y2FyZSBvZiBJTlR4Lgo+IAo+IFRoaXMgd2FzIGRpc2N1c3NlZCBpbiB2MiBvZiB0aGlzIHNlcmll
c1sxXSwgd2hlcmUgeW91IGFsc28gcmVzcG9uZGVkLgo+IFJlbGV2YW50IHBhcnQgb2YgUm9nZXIn
cyBlbWFpbDoKPiAKPiAgICAgIE9oIGdyZWF0LCB0aGF0J3MgdW5mb3J0dW5hdGUuIEJvdGggcGNp
YmFjayBmdW5jdGlvbnMgZW5kIHVwIGNhbGxpbmcKPiAgICAgIGludG8gbXNpX2NhcGFiaWxpdHlf
aW5pdCBpbiB0aGUgTGludXgga2VybmVsLCB3aGljaCBkb2VzIGluZGVlZCBtb3JlCj4gICAgICB0
aGFuIGp1c3QgdG9nZ2xpbmcgdGhlIFBDSSBjb25maWcgc3BhY2UgZW5hYmxlIGJpdC4KPiAKPiAg
ICAgIE9UT0ggYWRkaW5nIGEgYnlwYXNzIHRvIHBjaWJhY2sgc28gdGhlIHN0dWJkb20gaXMgYWJs
ZSB0byB3cml0ZSB0byB0aGUKPiAgICAgIFBDSSByZWdpc3RlciBpbiBvcmRlciB0byB0b2dnbGUg
dGhlIGVuYWJsZSBiaXQgc2VlbXMgcXVpdGUgY2x1bXN5LiBOb3QKPiAgICAgIHRvIG1lbnRpb24g
dGhhdCB5b3Ugd291bGQgYmUgcmVxdWlyZWQgdG8gdXBkYXRlIERvbTAga2VybmVsIGluIG9yZGVy
IHRvCj4gICAgICBmaXggdGhlIGlzc3VlLgo+IAo+ICAgICAgRG8geW91IHRoaW5rIGl0IG1ha2Vz
IHNlbnNlIHRvIGFkZCBhIGRvbWN0bCB0byBlbmFibGUvZGlzYWJsZSBNU0koWCk/Cj4gCj4gICAg
ICBUaGlzIHdheSB0aGUgYnVnIGNvdWxkIGJlIGZpeGVkIGJ5IGp1c3QgdXBkYXRpbmcgWGVuIChh
bmQgdGhlCj4gICAgICBzdHViZG9tYWluKS4KPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTAxL21zZzAxMjcxLmh0bWwKCkht
bSwgcmlnaHQuIEJ1dCB1cyBoYXZpbmcgY2xvc2VkIGEgY2lyY2xlIHRoaXMgd2F5IChhcyBpdCBz
ZWVtcykKc3VnZ2VzdHMgdG8gbWUgdGhhdCBieXBhc3NpbmcgRG9tMCBtYXkgbm90IGhhdmUgYmVl
biB0aGUgcmlnaHQKaWRlYSBoZXJlIGFmdGVyIGFsbCAoaS5lLiBpcywgYXMgUm9nZXIgc2FpZCwg
Y2x1bXN5KS4gQWxzbyBtYXkgSQphc2sgd2hldGhlciB0aGUgcXVvdGVkIHRoZXJlICJzbyB0aGlz
IG1vc3QgbGlrZWx5IHdvbuKAmXQgd29yawpjb3JyZWN0bHkiIGhhcyBhY3R1YWxseSBiZWVuIHBy
b3ZlbiB0byBub3Qgd29yaywgYW5kIG5vdCBiZQpwb3NzaWJsZSB0byBtYWtlIHdvcms/CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
