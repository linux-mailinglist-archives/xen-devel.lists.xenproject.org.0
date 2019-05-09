Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316618972
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 14:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOhmA-0005kB-3T; Thu, 09 May 2019 12:03:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOhm8-0005k6-JL
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:03:48 +0000
X-Inumbo-ID: 7f8deb64-7252-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f8deb64-7252-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 12:03:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2899AC5C;
 Thu,  9 May 2019 12:03:45 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
 <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
 <5CD4141D020000780022D1F5@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5fba2297-128c-5015-abb3-7dedd768b8d2@suse.com>
Date: Thu, 9 May 2019 14:03:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD4141D020000780022D1F5@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAxMzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDUuMTkg
YXQgMTI6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwOS8wNS8yMDE5IDEyOjA0
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gNS85LzE5IDY6MzIgQU0sIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6Cj4+Pj4gT24gMDgvMDUvMjAxOSAxODoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+Pj4gT24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBJbnN0
ZWFkIG9mIHVzaW5nIHRoZSBTQ0hFRF9PUCgpIG1hY3JvIHRvIGNhbGwgdGhlIGRpZmZlcmVudCBz
Y2hlZHVsZXIKPj4+Pj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdyYXBwZXJzIGZv
ciB0aGF0IHB1cnBvc2UuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+Pgo+Pj4+PiBUaGlzIHNlZW1zIGxpa2UgYSBncmVhdCBp
ZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPj4+Pj4KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIGlu
dCBzY2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBB
U1NFUlQocy0+aW5pdCk7Cj4+Pj4+PiArICAgIHJldHVybiBzLT5pbml0KHMpOwo+Pj4+Pj4gK30K
Pj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBz
Y2hlZHVsZXIgKnMpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBBU1NFUlQocy0+ZGVpbml0KTsKPj4+
Pj4+ICsgICAgcy0+ZGVpbml0KHMpOwo+Pj4+Pj4gK30KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGVz
ZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClzLiAgVGhlc2UgYXJlbid0IGhvdCBwYXRocywgYW5k
IGlmCj4+Pj4+IHdlIGRvIHNvbWVob3cgaGl0IHRoaXMgc2l0dWF0aW9uIGluIHByb2R1Y3Rpb24s
IDEpIGl0J3Mgc2FmZXIgdG8KPj4+Pj4gQlVHX09OKCkgdGhhbiBkZXJlZmVyZW5jaW5nIE5VTEws
IGFuZCAyKSB5b3UnbGwgZ2V0IGEgbW9yZSBoZWxwZnVsIGVycm9yCj4+Pj4+IG1lc3NhZ2UuCj4+
Pj4KPj4+PiBPbmx5IGZvciB0aG9zZSAyIGluc3RhbmNlcyBhYm92ZT8gT3Igd291bGQgeW91IGxp
a2UgQlVHX09OKCkgaW5zdGVhZCBvZgo+Pj4+IEFTU0VSVCgpIGluIHRoZSBvdGhlciBhZGRlZCBp
bmxpbmVzLCB0b28gKG1heWJlIG5vdCBmb3IgcGlja19jcHUsIGJ1dAo+Pj4+IGUuZy4gdGhlIG9u
ZXMgaW4gZnJlZV8qKSA/Cj4+Pgo+Pj4gV2h5IG5vdCBmb3IgcGlja19jcHUoKT8gIEl0J3MgdGhl
IHNhbWUgYmFzaWMgbG9naWMgLS0gaW4gcHJvZHVjdGlvbiwgaWYKPj4+IGl0ICppcyogTlVMTCwg
dGhlbiB5b3UnbGwgZWl0aGVyIGNyYXNoIHdpdGggYSBzZWdmYXVsdCwgb3Igc3RhcnQKPj4+IGV4
ZWN1dGluZyBhbiBleHBsb2l0LiAgTXVjaCBiZXR0ZXIgdG8gQlVHX09OKCkuCj4+Cj4+IHBpY2tf
Y3B1IGlzIGNhbGxlZCByYXRoZXIgb2Z0ZW4sIHNvIG1heWJlIHdlIHNob3VsZCBhdm9pZCBhZGRp
dGlvbmFsCj4+IHRlc3RzLgo+Pgo+PiBIbW0sIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQ6IHdoeSBk
b24ndCB3ZSBqdXN0IGRyb3AgdGhvc2UgQVNTRVJUL0JVR19PTgo+PiBmb3IgbWFuZGF0b3J5IGZ1
bmN0aW9ucyBhbmQgdGVzdCB0aGVtIHdoZW4gZG9pbmcgdGhlIGdsb2JhbF9pbml0KCkgbG9vcAo+
PiBvdmVyIGFsbCBzY2hlZHVsZXJzLiBXZSBjb3VsZCBqdXN0IHJlamVjdCBzY2hlZHVsZXJzIHdp
dGggbWlzc2luZwo+PiBmdW5jdGlvbnMuCj4gCj4gVGhpcyB3b3VsZCBpbXBseSBwb2ludGVycyBj
YW4ndCBiZSB6YXBwZWQgb2ZmIHRoZSBzdHJ1Y3R1cmVzLgo+IElNTyB0aGlzIHdvdWxkIHJlcXVp
cmUsIGFzIG1pbmltYWwgKGxhbmd1YWdlIGxldmVsKSBwcm90ZWN0aW9uLAo+IHRoYXQgYWxsIGlu
c3RhbmNlcyBvZiBzdHJ1Y3Qgc2NoZWR1bGVyIGJlIGNvbnN0LCB3aGljaCBkb2Vzbid0Cj4gbG9v
ayBkb2FibGUgd2l0aG91dCBzb21lIGZ1cnRoZXIgcmV3b3JrCgpUaGV5IGFyZSBjb25zdCBhbHJl
YWR5LgoKVGhlIGRlZmF1bHQgc2NoZWR1bGVyJ3Mgc3RydWN0IGlzIGNvcGllZCB0byBhIG5vbi1j
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyCmluIHNjaGVkdWxlcl9pbml0KCkuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
