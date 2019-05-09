Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B1E1894A
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 13:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOhZh-0004nV-KR; Thu, 09 May 2019 11:50:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOhZg-0004nQ-Go
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 11:50:56 +0000
X-Inumbo-ID: b3884135-7250-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3884135-7250-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 11:50:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 05:50:54 -0600
Message-Id: <5CD4141D020000780022D1F5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 05:50:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
 <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
In-Reply-To: <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
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

Pj4+IE9uIDA5LjA1LjE5IGF0IDEyOjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OS8wNS8yMDE5IDEyOjA0LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiA1LzkvMTkgNjozMiBB
TSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDA4LzA1LzIwMTkgMTg6MjQsIEdlb3JnZSBE
dW5sYXAgd3JvdGU6Cj4+Pj4gT24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+Pj4+IEluc3RlYWQgb2YgdXNpbmcgdGhlIFNDSEVEX09QKCkgbWFjcm8gdG8gY2FsbCB0aGUg
ZGlmZmVyZW50IHNjaGVkdWxlcgo+Pj4+PiBzcGVjaWZpYyBmdW5jdGlvbnMgYWRkIGlubGluZSB3
cmFwcGVycyBmb3IgdGhhdCBwdXJwb3NlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4KPj4+PiBUaGlzIHNlZW1zIGxpa2UgYSBn
cmVhdCBpZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPj4+Pgo+Pj4+PiArc3RhdGljIGlubGlu
ZSBpbnQgc2NoZWRfaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpzKQo+Pj4+PiArewo+Pj4+PiArICAg
IEFTU0VSVChzLT5pbml0KTsKPj4+Pj4gKyAgICByZXR1cm4gcy0+aW5pdChzKTsKPj4+Pj4gK30K
Pj4+Pj4gKwo+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2RlaW5pdChzdHJ1Y3Qgc2No
ZWR1bGVyICpzKQo+Pj4+PiArewo+Pj4+PiArICAgIEFTU0VSVChzLT5kZWluaXQpOwo+Pj4+PiAr
ICAgIHMtPmRlaW5pdChzKTsKPj4+Pj4gK30KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhlc2Ugd291bGQg
YmV0dGVyIGFzIEJVR19PTigpcy4gIFRoZXNlIGFyZW4ndCBob3QgcGF0aHMsIGFuZCBpZgo+Pj4+
IHdlIGRvIHNvbWVob3cgaGl0IHRoaXMgc2l0dWF0aW9uIGluIHByb2R1Y3Rpb24sIDEpIGl0J3Mg
c2FmZXIgdG8KPj4+PiBCVUdfT04oKSB0aGFuIGRlcmVmZXJlbmNpbmcgTlVMTCwgYW5kIDIpIHlv
dSdsbCBnZXQgYSBtb3JlIGhlbHBmdWwgZXJyb3IKPj4+PiBtZXNzYWdlLgo+Pj4KPj4+IE9ubHkg
Zm9yIHRob3NlIDIgaW5zdGFuY2VzIGFib3ZlPyBPciB3b3VsZCB5b3UgbGlrZSBCVUdfT04oKSBp
bnN0ZWFkIG9mCj4+PiBBU1NFUlQoKSBpbiB0aGUgb3RoZXIgYWRkZWQgaW5saW5lcywgdG9vICht
YXliZSBub3QgZm9yIHBpY2tfY3B1LCBidXQKPj4+IGUuZy4gdGhlIG9uZXMgaW4gZnJlZV8qKSA/
Cj4+IAo+PiBXaHkgbm90IGZvciBwaWNrX2NwdSgpPyAgSXQncyB0aGUgc2FtZSBiYXNpYyBsb2dp
YyAtLSBpbiBwcm9kdWN0aW9uLCBpZgo+PiBpdCAqaXMqIE5VTEwsIHRoZW4geW91J2xsIGVpdGhl
ciBjcmFzaCB3aXRoIGEgc2VnZmF1bHQsIG9yIHN0YXJ0Cj4+IGV4ZWN1dGluZyBhbiBleHBsb2l0
LiAgTXVjaCBiZXR0ZXIgdG8gQlVHX09OKCkuCj4gCj4gcGlja19jcHUgaXMgY2FsbGVkIHJhdGhl
ciBvZnRlbiwgc28gbWF5YmUgd2Ugc2hvdWxkIGF2b2lkIGFkZGl0aW9uYWwKPiB0ZXN0cy4KPiAK
PiBIbW0sIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQ6IHdoeSBkb24ndCB3ZSBqdXN0IGRyb3AgdGhv
c2UgQVNTRVJUL0JVR19PTgo+IGZvciBtYW5kYXRvcnkgZnVuY3Rpb25zIGFuZCB0ZXN0IHRoZW0g
d2hlbiBkb2luZyB0aGUgZ2xvYmFsX2luaXQoKSBsb29wCj4gb3ZlciBhbGwgc2NoZWR1bGVycy4g
V2UgY291bGQganVzdCByZWplY3Qgc2NoZWR1bGVycyB3aXRoIG1pc3NpbmcKPiBmdW5jdGlvbnMu
CgpUaGlzIHdvdWxkIGltcGx5IHBvaW50ZXJzIGNhbid0IGJlIHphcHBlZCBvZmYgdGhlIHN0cnVj
dHVyZXMuCklNTyB0aGlzIHdvdWxkIHJlcXVpcmUsIGFzIG1pbmltYWwgKGxhbmd1YWdlIGxldmVs
KSBwcm90ZWN0aW9uLAp0aGF0IGFsbCBpbnN0YW5jZXMgb2Ygc3RydWN0IHNjaGVkdWxlciBiZSBj
b25zdCwgd2hpY2ggZG9lc24ndApsb29rIGRvYWJsZSB3aXRob3V0IHNvbWUgZnVydGhlciByZXdv
cmsKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
