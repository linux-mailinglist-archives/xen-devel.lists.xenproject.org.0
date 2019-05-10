Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260219A12
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 10:56:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP1Ht-0006QK-56; Fri, 10 May 2019 08:53:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP1Hs-0006QF-B7
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 08:53:52 +0000
X-Inumbo-ID: 1ff5c4e4-7301-11e9-9002-e3491dd4b7b7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ff5c4e4-7301-11e9-9002-e3491dd4b7b7;
 Fri, 10 May 2019 08:53:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 02:53:47 -0600
Message-Id: <5CD53C1C020000780022D706@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 02:53:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-46-jgross@suse.com>
 <5CCFF6F1020000780022C12B@suse.com>
 <ac57c420-a72e-7570-db8f-27e4693c2755@suse.com>
 <5CD005E7020000780022C1B5@prv1-mh.provo.novell.com>
 <f7692c11-ab14-4d7d-4b7a-72e9c58e8f30@suse.com>
In-Reply-To: <f7692c11-ab14-4d7d-4b7a-72e9c58e8f30@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE2OjM2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ni8wNS8yMDE5IDEyOjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkgYXQg
MTE6MjMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQW5kIHRoYXQgd2FzIG1lbnRpb25l
ZCBpbiB0aGUgY292ZXIgbGV0dGVyOiBjcHUgaG90cGx1ZyBpcyBub3QgeWV0Cj4+PiBoYW5kbGVk
IChoZW5jZSB0aGUgUkZDIHN0YXR1cyBvZiB0aGUgc2VyaWVzKS4KPj4+Cj4+PiBXaGVuIGNwdSBo
b3RwbHVnIGlzIGJlaW5nIGFkZGVkIGl0IG1pZ2h0IGJlIGFwcHJvcHJpYXRlIHRvIHN3aXRjaCB0
aGUKPj4+IHNjaGVtZSBhcyB5b3Ugc3VnZ2VzdGVkLiBSaWdodCBub3cgdGhlIGN1cnJlbnQgc29s
dXRpb24gaXMgbXVjaCBtb3JlCj4+PiBzaW1wbGUuCj4+IAo+PiBJIHNlZSAoSSBkaWQgbm90aWNl
IHRoZSBjb3ZlciBsZXR0ZXIgcmVtYXJrLCBidXQgbWFuYWdlZCB0byBub3QKPj4gaG9ub3IgaXQg
d2hlbiB3cml0aW5nIHRoZSByZXBseSksIGJ1dCBJJ20gdW5jb252aW5jZWQgaWYgaW5jdXJyaW5n
Cj4+IG1vcmUgY29kZSBjaHVybiBieSBub3QgZGVhbGluZyB3aXRoIHRoaW5ncyB0aGUgImR5bmFt
aWMiIHdheQo+PiByaWdodCBhd2F5IGlzIGluZGVlZCB0aGUgIm1vcmUgc2ltcGxlIiAob3ZlcmFs
bCkgc29sdXRpb24uCj4gCj4gSSBoYXZlIHN0YXJ0ZWQgdG8gYWRkcmVzcyBjcHUgb24vb2ZmbGlu
aW5nIG5vdy4KPiAKPiBUaGVyZSBhcmUgbXVsdGlwbGUgZGVzaWduIGRlY2lzaW9ucyB0byB0YWtl
Lgo+IAo+IDEuIEludGVyYWN0aW9uIGJldHdlZW4gc2NoZWQtZ3JhbiBhbmQgc210IGJvb3QgcGFy
YW1ldGVycwo+IDIuIEludGVyYWN0aW9uIGJldHdlZW4gc2NoZWQtZ3JhbiBhbmQgeGVuLWhwdG9v
bCBzbXQgc3dpdGNoaW5nCj4gMy4gSW50ZXJhY3Rpb24gYmV0d2VlbiBzY2hlZC1ncmFuIGFuZCBz
aW5nbGUgY3B1IG9uL29mZmxpbmluZwo+IAo+IFJpZ2h0IG5vdyBhbnkgZ3Vlc3Qgd29uJ3Qgc2Vl
IGEgZGlmZmVyZW5jZSByZWdhcmRpbmcgc2NoZWQtZ3Jhbgo+IHNlbGVjdGlvbi4gVGhpcyBtZWFu
cyB3ZSBkb24ndCBoYXZlIHRvIHRoaW5rIGFib3V0IHBvdGVudGlhbCBtaWdyYXRpb24KPiByZXN0
cmljdGlvbnMuIFRoaXMgbWlnaHQgY2hhbmdlIGluIGZ1dHVyZSB3aGVuIHdlIHdhbnQgdG8gZW5h
YmxlIHRoZQo+IGd1ZXN0IHRvIGUuZy4gdXNlIGNvcmUgc2NoZWR1bGluZyB0aGVtc2VsdmVzIGlu
IG9yZGVyIHRvIG1pdGlnYXRlCj4gYWdhaW5zdCBzaWRlIGNoYW5uZWwgYXR0YWNrcyB3aXRoaW4g
dGhlIGd1ZXN0Lgo+IAo+IFRoZSBtb3N0IHNpbXBsZSBzb2x1dGlvbiB3b3VsZCBiZSAoYW5kIEkn
ZCBsaWtlIHRvIHNlbmQgb3V0IFYxIG9mIG15Cj4gc2VyaWVzIHdpdGggdGhhdCBpbXBsZW1lbnRl
ZCk6Cj4gCj4gc2NoZWQtZ3Jhbj1jb3JlIGFuZCBzY2hlZC1ncmFuPXNvY2tldCBkb24ndCBhbGxv
dyBkeW5hbWljYWwgc3dpdGNoaW5nCj4gb2Ygc210IHZpYSB4ZW4taHB0b29sLgo+IAo+IFdpdGgg
c2NoZWQtZ3Jhbj1jb3JlIG9yIHNjaGVkLWdyYW49c29ja2V0IG9mZmxpbmluZyBhIHNpbmdsZSBj
cHUgcmVzdWx0cwo+IGluIG1vdmluZyB0aGUgY29tcGxldGUgY29yZSBvciBzb2NrZXQgdG8gY3B1
cG9vbF9mcmVlX2NwdXMgYW5kIHRoZW4KPiBvZmZsaW5pbmcgZnJvbSB0aGVyZS4gT25seSBjb21w
bGV0ZSBjb3Jlcy9zb2NrZXRzIGNhbiBiZSBtb3ZlZCB0byBhbnkKPiBjcHVwb29sLiBXaGVuIG9u
bGluaW5nIGEgY3B1IGl0IGlzIGFkZGVkIHRvIGNwdXBvb2xfZnJlZV9jcHVzIGFuZCBpZgo+IHRo
ZSBjb3JlL3NvY2tldCBpcyBjb21wbGV0ZWx5IG9ubGluZSBpdCB3aWxsIGF1dG9tYXRpY2FsbHkg
YmUgYWRkZWQgdG8KPiBQb29sLTAgKGFzIHRvZGF5IGFueSBzaW5nbGUgb25saW5lZCBjcHUpLgoK
V2VsbCwgdGhpcyBpcyBpbiBsaW5lIHdpdGggd2hhdCB3YXMgZGlzY3Vzc2VkIG9uIHRoZSBjYWxs
IHllc3RlcmRheSwgc28KSSB0aGluayBpdCdzIGFuIGFjY2VwdGFibGUgaW5pdGlhbCBzdGF0ZSB0
byBlbmQgdXAgaW4uIEFsYmVpdCwganVzdCBmb3IKY29tcGxldGVuZXNzLCBJJ20gbm90IGNvbnZp
bmNlZCB0aGVyZSdzIG5vIHVzZSBmb3IgInNtdC17ZGlzLGVufWFibGUiCmFueW1vcmUgd2l0aCBj
b3JlLWF3YXJlIHNjaGVkdWxpbmcgaW1wbGVtZW50ZWQganVzdCBpbiBYZW4gLSBpdAptYXkgc3Rp
bGwgYmUgY29uc2lkZXJlZCB1c2VmdWwgYXMgbG9uZyBhcyB3ZSBkb24ndCBleHBvc2UgcHJvcGVy
CnRvcG9sb2d5IHRvIGd1ZXN0cywgZm9yIHRoZW0gdG8gYmUgYWJsZSB0byBkbyBzb21ldGhpbmcg
c2ltaWxhci4KCj4gVGhlIG5leHQgc3RlcHMgKGZvciBmdXR1cmUgcGF0Y2hlcykgY291bGQgYmU6
Cj4gCj4gLSBwZXItY3B1cG9vbCBzbXQgc2V0dGluZ3MgKHN0YXRpYyBhdCBjcHVwb29sIGNyZWF0
aW9uLCBtb3ZpbmcgYSBkb21haW4KPiAgIGJldHdlZW4gY3B1cG9vbHMgd2l0aCBkaWZmZXJlbnQg
c210IHNldHRpbmdzIG5vdCBzdXBwb3J0ZWQpCj4gCj4gLSBzdXBwb3J0IG1vdmluZyBkb21haW5z
IGJldHdlZW4gY3B1cG9vbHMgd2l0aCBkaWZmZXJlbnQgc210IHNldHRpbmdzCj4gICAoYSBndWVz
dCBzdGFydGVkIHdpdGggc210PTAgd291bGQgb25seSBldmVyIHVzZSAxIHRocmVhZCBwZXIgY29y
ZSkKClllcywgaW4gaXRzIG1vc3QgZ2VuZXJhbCB0ZXJtczogU3VjaCBtb3ZlbWVudCBtYXkgYmUg
d2FzdGVmdWwsIGJ1dApzaG91bGQgYmUgcG9zc2libGUgdG8gYmUgY2FycmllZCBvdXQgc2FmZWx5
IGluIGFsbCBjYXNlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
