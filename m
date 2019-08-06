Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3D83131
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 14:11:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huyDy-0007fG-4U; Tue, 06 Aug 2019 12:05:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huyDw-0007fB-Qk
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 12:05:52 +0000
X-Inumbo-ID: 879e0d8c-b842-11e9-8011-93c05da16114
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 879e0d8c-b842-11e9-8011-93c05da16114;
 Tue, 06 Aug 2019 12:05:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA21CABE3;
 Tue,  6 Aug 2019 12:05:48 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
 <20190806094601.GG1250@mail-itl>
 <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
 <20190806105317.GH1250@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9021dde-efa3-1ba8-bb63-98e99d424a32@suse.com>
Date: Tue, 6 Aug 2019 14:05:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806105317.GH1250@mail-itl>
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

T24gMDYuMDguMjAxOSAxMjo1MywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAxMjozMzozOVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDYuMDguMjAxOSAxMTo0NiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDA3OjU2OjM5QU0gKzAwMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjA4LjIwMTkgMTU6NDQsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAgd3JvdGU6Cj4+Pj4+IEknbSB0cnlpbmcgdG8gZ2V0IGl0IHdvcmtpbmcg
YW5kIGl0IGlzbid0IGNsZWFyIHRvIG1lIHdoYXQgc2hvdWxkIEkKPj4+Pj4gY2hlY2sgZm9yICJJ
TlR4IGlzIGFsc28gZW5hYmxlZCIuIEkgYXNzdW1lZCBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUK
Pj4+Pj4gYml0LCBidXQgaXQgbG9va3MgbGlrZSBndWVzdCBoYXMgbm8gY29udHJvbCBvdmVyIHRo
aXMgYml0LCBldmVuIGluCj4+Pj4+IHBlcm1pc3NpdmUgbW9kZS4gIFRoaXMgbWVhbnMgZW5hYmxp
bmcgTVNJKC1YKSBhbHdheXMgZmFpbHMgYmVjYXVzZSBndWVzdAo+Pj4+PiBoYXMgbm8gd2F5IHRv
IHNldCBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgYml0IGJlZm9yZS4KPj4+Pgo+Pj4+IFdlbGws
IHRoZSBndWVzdCBoYXMgbm8gY29udHJvbCwgYnV0IGluIG9yZGVyIHRvIGVuYWJsZSBNU0l7LC1Y
fSBJJ2QKPj4+PiBoYXZlIGV4cGVjdGVkIHFlbXUgb3IgdGhlIERvbTAga2VybmVsIHRvIHNldCB0
aGlzIGJpdCB1cCBmcm9udC4KPj4+Cj4+PiBxZW11IHdvdWxkIGRvIHRoYXQsIHdoZW4gcnVubmlu
ZyBpbiBkb20wLiBCdXQgaW4gUFYgc3R1YmRvbWFpbiBpdCB0YWxrcwo+Pj4gdG8gcGNpYmFjaywg
d2hpY2ggZmlsdGVycyBpdCBvdXQuCj4+Cj4+IEZpbHRlcmluZyBvdXQgdGhlIGd1ZXN0IGF0dGVt
cHQgaXMgZmluZSwgYnV0IGl0IHNob3VsZCB0aGVuIHNldCB0aGUKPj4gYml0IHdoaWxlIHByZXBh
cmluZyBNU0kvTVNJLVggZm9yIHRoZSBndWVzdC4gKEknbSBub3Qgc3VyZSBpdCB3b3VsZAo+PiBu
ZWVkIHRvIGRvIHNvIGV4cGxpY2l0bHksIG9yIHdoZXRoZXIgaXQgY291bGRuJ3QgcmVseSBvbiBj
b2RlCj4+IGVsc2V3aGVyZSBpbiB0aGUga2VybmVsIGRvaW5nIHNvLikKPiAuLi4KPj4gV2VsbCwg
SSB0aGluayBJJ3ZlIG1hZGUgbXkgcG9zaXRpb24gY2xlYXI6IFNvIGZhciB3ZSB1c2UgcGNpX2lu
dHgoKQo+PiBvbmx5IG9uIGRldmljZXMgdXNlZCBieSBYZW4gaXRzZWxmLiBJIHRoaW5rIHRoaXMg
c2hvdWxkIHJlbWFpbiB0byBiZQo+PiB0aGF0IHdheS4gRGV2aWNlcyBpbiBwb3NzZXNzaW9uIG9m
IGRvbWFpbnMgKGluY2x1ZGluZyBEb20wKSBzaG91bGQKPj4gYmUgdW5kZXIgRG9tMCdzIGNvbnRy
b2wgaW4gdGhpcyByZWdhcmQuCj4gCj4gVGhlIHRoaW5nIGlzLCBpbiBjYXNlIG9mIHVzaW5nIHN0
dWJkb21haW4sIGl0J3MgbW9zdGx5IHN0dWJkb21haW4KPiBoYW5kbGluZyBpdC4gRXNwZWNpYWxs
eSBhbGwgdGhlIGNvbmZpZyBzcGFjZSBpbnRlcmNlcHRpb24gYW5kIGFwcGx5aW5nCj4gbG9naWMg
dG8gaXQgaXMgZG9uZSBieSBxZW11IGluIHN0dWJkb21haW4uIERvIHlvdSBzdWdnZXN0IGR1cGxp
Y2F0aW5nIC8KPiBtb3ZpbmcgdGhhdCBwYXJ0IHRvIGRvbTAgaW5zdGVhZD8gV2hhdCB3b3VsZCBi
ZSB0aGUgcG9pbnQgZm9yIHN0dWJkb21haW4KPiB0aGVuPwoKTm90aGluZyBzaG91bGQgYmUgbW92
ZWQgYmV0d2VlbiBjb21wb25lbnRzIGlmIHBvc3NpYmxlIChhbmQgaWYgcGxhY2VkCnNlbnNpYmx5
KS4gQnV0IGlzbid0IHN0dWJkb20gKGJlaW5nIGEgUFYgRG9tVSkgcmVseWluZyBvbiBwY2liYWNr
IGluCkRvbTAgYW55d2F5PyBBbmQgaGVuY2UgZG9lc24ndCB0aGUgZmxvdyBvZiBldmVudHMgaW5j
bHVkZQpwY2lfZW5hYmxlX21zaXsseH0oKSBpbnZva2VkIGJ5IHBjaWJhY2s/IEknZCBoYXZlIGV4
cGVjdGVkIHRoYXQgdG8KKGFsc28pIHRha2UgY2FyZSBvZiBJTlR4LgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
