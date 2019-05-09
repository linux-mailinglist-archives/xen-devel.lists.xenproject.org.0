Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFCC18A83
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOj0k-00049f-Lz; Thu, 09 May 2019 13:22:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOj0j-00049Q-6f
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:22:57 +0000
X-Inumbo-ID: 8e138aac-725d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8e138aac-725d-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:22:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 07:22:54 -0600
Message-Id: <5CD429AD020000780022D2D1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 07:22:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415*1*jgross@suse.com>
 <20190506065644.7415*2*jgross@suse.com>
 <1d5f7b35*304c*6a86*5f24*67b79de447dc@citrix.com>
 <2ca22195*9bdb*b040*ce12*df5bb2416038@suse.com>
 <0ed82a64*58e7*7ce4*afd1*22f621c0d56d@citrix.com>
 <a3e3370b*a4a9*9654*368b*f8c13b7f9742@suse.com>
 <5CD4141D020000780022D1F5@prv1*mh.provo.novell.com>
 <5fba2297-128c-5015-abb3-7dedd768b8d2@suse.com>
 <5CD41D9C020000780022D259@suse.com>
 <99a2f5be-ac4e-5a2a-dc55-918e312b40e7@suse.com>
In-Reply-To: <99a2f5be-ac4e-5a2a-dc55-918e312b40e7@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA5LjA1LjE5IGF0IDE0OjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OS8wNS8yMDE5IDE0OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDkuMDUuMTkgYXQg
MTQ6MDMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gMDkvMDUvMjAxOSAxMzo1MCwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMDkuMDUuMTkgYXQgMTI6NTYsIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAwOS8wNS8yMDE5IDEyOjA0LCBHZW9yZ2UgRHVubGFw
IHdyb3RlOgo+Pj4+Pj4gT24gNS85LzE5IDY6MzIgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4+Pj4gT24gMDgvMDUvMjAxOSAxODoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4+Pj4g
T24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+PiBJbnN0ZWFk
IG9mIHVzaW5nIHRoZSBTQ0hFRF9PUCgpIG1hY3JvIHRvIGNhbGwgdGhlIGRpZmZlcmVudCBzY2hl
ZHVsZXIKPj4+Pj4+Pj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdyYXBwZXJzIGZv
ciB0aGF0IHB1cnBvc2UuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIHNlZW1zIGxp
a2UgYSBncmVhdCBpZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+
ICtzdGF0aWMgaW5saW5lIGludCBzY2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4+
Pj4+PiArewo+Pj4+Pj4+Pj4gKyAgICBBU1NFUlQocy0+aW5pdCk7Cj4+Pj4+Pj4+PiArICAgIHJl
dHVybiBzLT5pbml0KHMpOwo+Pj4+Pj4+Pj4gK30KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4+Pj4+
PiArewo+Pj4+Pj4+Pj4gKyAgICBBU1NFUlQocy0+ZGVpbml0KTsKPj4+Pj4+Pj4+ICsgICAgcy0+
ZGVpbml0KHMpOwo+Pj4+Pj4+Pj4gK30KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSB0aGluayB0aGVzZSB3
b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClzLiAgVGhlc2UgYXJlbid0IGhvdCBwYXRocywgYW5kIGlm
Cj4+Pj4+Pj4+IHdlIGRvIHNvbWVob3cgaGl0IHRoaXMgc2l0dWF0aW9uIGluIHByb2R1Y3Rpb24s
IDEpIGl0J3Mgc2FmZXIgdG8KPj4+Pj4+Pj4gQlVHX09OKCkgdGhhbiBkZXJlZmVyZW5jaW5nIE5V
TEwsIGFuZCAyKSB5b3UnbGwgZ2V0IGEgbW9yZSBoZWxwZnVsIGVycm9yCj4+Pj4+Pj4+IG1lc3Nh
Z2UuCj4+Pj4+Pj4KPj4+Pj4+PiBPbmx5IGZvciB0aG9zZSAyIGluc3RhbmNlcyBhYm92ZT8gT3Ig
d291bGQgeW91IGxpa2UgQlVHX09OKCkgaW5zdGVhZCBvZgo+Pj4+Pj4+IEFTU0VSVCgpIGluIHRo
ZSBvdGhlciBhZGRlZCBpbmxpbmVzLCB0b28gKG1heWJlIG5vdCBmb3IgcGlja19jcHUsIGJ1dAo+
Pj4+Pj4+IGUuZy4gdGhlIG9uZXMgaW4gZnJlZV8qKSA/Cj4+Pj4+Pgo+Pj4+Pj4gV2h5IG5vdCBm
b3IgcGlja19jcHUoKT8gIEl0J3MgdGhlIHNhbWUgYmFzaWMgbG9naWMgLS0gaW4gcHJvZHVjdGlv
biwgaWYKPj4+Pj4+IGl0ICppcyogTlVMTCwgdGhlbiB5b3UnbGwgZWl0aGVyIGNyYXNoIHdpdGgg
YSBzZWdmYXVsdCwgb3Igc3RhcnQKPj4+Pj4+IGV4ZWN1dGluZyBhbiBleHBsb2l0LiAgTXVjaCBi
ZXR0ZXIgdG8gQlVHX09OKCkuCj4+Pj4+Cj4+Pj4+IHBpY2tfY3B1IGlzIGNhbGxlZCByYXRoZXIg
b2Z0ZW4sIHNvIG1heWJlIHdlIHNob3VsZCBhdm9pZCBhZGRpdGlvbmFsCj4+Pj4+IHRlc3RzLgo+
Pj4+Pgo+Pj4+PiBIbW0sIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQ6IHdoeSBkb24ndCB3ZSBqdXN0
IGRyb3AgdGhvc2UgQVNTRVJUL0JVR19PTgo+Pj4+PiBmb3IgbWFuZGF0b3J5IGZ1bmN0aW9ucyBh
bmQgdGVzdCB0aGVtIHdoZW4gZG9pbmcgdGhlIGdsb2JhbF9pbml0KCkgbG9vcAo+Pj4+PiBvdmVy
IGFsbCBzY2hlZHVsZXJzLiBXZSBjb3VsZCBqdXN0IHJlamVjdCBzY2hlZHVsZXJzIHdpdGggbWlz
c2luZwo+Pj4+PiBmdW5jdGlvbnMuCj4+Pj4KPj4+PiBUaGlzIHdvdWxkIGltcGx5IHBvaW50ZXJz
IGNhbid0IGJlIHphcHBlZCBvZmYgdGhlIHN0cnVjdHVyZXMuCj4+Pj4gSU1PIHRoaXMgd291bGQg
cmVxdWlyZSwgYXMgbWluaW1hbCAobGFuZ3VhZ2UgbGV2ZWwpIHByb3RlY3Rpb24sCj4+Pj4gdGhh
dCBhbGwgaW5zdGFuY2VzIG9mIHN0cnVjdCBzY2hlZHVsZXIgYmUgY29uc3QsIHdoaWNoIGRvZXNu
J3QKPj4+PiBsb29rIGRvYWJsZSB3aXRob3V0IHNvbWUgZnVydGhlciByZXdvcmsKPj4+Cj4+PiBU
aGV5IGFyZSBjb25zdCBhbHJlYWR5Lgo+Pj4KPj4+IFRoZSBkZWZhdWx0IHNjaGVkdWxlcidzIHN0
cnVjdCBpcyBjb3BpZWQgdG8gYSBub24tY29uc3Qgc3RydWN0IHNjaGVkdWxlcgo+Pj4gaW4gc2No
ZWR1bGVyX2luaXQoKS4KPj4gCj4+IEV4YWN0bHksIGFuZCB0aGVuIHdlIGhhdmUgdGhpbmdzIGxp
a2UKPj4gCj4+IHN0YXRpYyBpbnQKPj4gcnRfaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCj4+
IHsKPj4gICAgIC4uLgo+PiAgICAgb3BzLT5zY2hlZF9kYXRhID0gcHJ2Owo+PiAKPj4gSS5lLiBp
dCB3b3VsZCBiZSBxdWl0ZSBlYXN5IGZvciBhIHNwZWNpZmljIHNjaGVkdWxlciB0byB6YXAgb25l
IG9yIG1vcmUKPj4gb2YgaXRzIHBvaW50ZXJzLgo+IAo+IFNvIHlvdSBzdWdnZXN0IHRvIEFTU0VS
VCBhbGwgcG9pbnRlcnMgYmVmb3JlIGRlcmVmZXJlbmNpbmcgdGhlbT8gV2h5Cj4gZG9uJ3Qgd2Ug
aGF2ZSBzdWNoIEFTU0VSVHMgaW4gcGxhY2VzIHdoZXJlIHdlIHVzZSBmdW5jdGlvbiB2ZWN0b3Jz
Cj4gaG9va2VkIHRvIGR5bmFtaWMgZGF0YSAoYW5kIEkgZG9uJ3QgbWVhbiB0aGUgc2luZ2xlIGZ1
bmN0aW9ucywgYnV0IHRoZQo+IHBvaW50ZXJzIHRvIHRoZSB2ZWN0b3IsIGUuZy4gZG9tYWluLT5h
cmNoLmN0eHRfc3dpdGNoKT8KCldoZXJlIGp1c3RpZmllZCBJJ20gY2VydGFpbmx5IGluIGZhdm9y
IG9mIG9taXR0aW5nIHN1Y2ggY2hlY2tzLCBidXQKd2l0aG91dCB0aGUgY29uc3RpZmljYXRpb24g
c3VnZ2VzdGVkIEknbSBub3QgY29udmluY2VkIHRoZXJlIGlzCnN1ZmZpY2llbnQganVzdGlmaWNh
dGlvbi4gQnV0IGhlcmUgaXQncyB0aGUgc2NoZWR1bGVyIG1haW50YWluZXIgdG8KanVkZ2UgYW55
d2F5IC0gSSd2ZSBtZXJlbHkgdm9pY2VkIGFuIG9waW5pb24uCgo+IFNlcmlvdXNseSwgdGhhdCB3
b3VsZCBiZSBhIG1ham9yIHByb2dyYW1taW5nIGJ1ZyBhbmQgSSBkb24ndCB0aGluawo+IHdlIG5l
ZWQgdG8gY2F0Y2ggdGhhdCBieSBkZWJ1ZyBjb2RlIHNwcmlua2xlZCBhcm91bmQgZXZlcnl3aGVy
ZS4KCkluIGZhY3Qgd2UndmUgYmVlbiBkaXNjdXNzaW5nIHRvIGdyYWR1YWxseSBhZGQgc3VjaCBj
aGVja3MsIGluCm9yZGVyIHRvIHRyYWRlIC0gYXMgZXhwbGFpbmVkIGJ5IEdlb3JnZSAtIHByaXZp
bGVnZSBlc2NhbGF0aW9ucyBmb3IKRG9TLWVzLgoKPiBBZnRlciBteSBjb3JlIHNjaGVkdWxpbmcg
c2VyaWVzIGlzIGZpbmlzaGVkIEknZCBsaWtlIHRvIGRvIGEgbWFqb3IKPiBzY2hlZHVsZXIgY2xl
YW51cCBzZXJpZXMuIE9uZSBhY3Rpb24gaXRlbSB3aWxsIGJlIHRvIGhhdmUgYSBzaW5nbGUKPiBp
bnN0YW5jZSBjb25zdCBzY2hlZHVsZXJfZnVuY3Mgc3RydWN0dXJlIGZvciBlYWNoIHNjaGVkdWxl
ciBhbmQgYQo+IHBlci1jcHVwb29sIHNjaGVkdWxlcl9kYXRhIHBvaW50ZXIuCgpUaGF0J3MgZ29v
ZCB0byBrbm93LCBiZWluZyBleGFjdGx5IHdoYXQgSSB3b3VsZCBoYXZlIGhvcGVkIHRoaW5ncwp3
b3VsZCBiZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
