Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737114812
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 12:03:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNaR7-0001jl-M2; Mon, 06 May 2019 10:01:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNaR6-0001je-A8
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 10:01:28 +0000
X-Inumbo-ID: e39c153e-6fe5-11e9-bc34-23012f251eb0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e39c153e-6fe5-11e9-bc34-23012f251eb0;
 Mon, 06 May 2019 10:01:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 04:01:16 -0600
Message-Id: <5CD005E7020000780022C1B5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 04:01:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-46-jgross@suse.com>
 <5CCFF6F1020000780022C12B@suse.com>
 <ac57c420-a72e-7570-db8f-27e4693c2755@suse.com>
In-Reply-To: <ac57c420-a72e-7570-db8f-27e4693c2755@suse.com>
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

Pj4+IE9uIDA2LjA1LjE5IGF0IDExOjIzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ni8wNS8yMDE5IDEwOjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkgYXQg
MDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gIHZvaWQgc2NoZWR1bGVyX3BlcmNw
dV9pbml0KHVuc2lnbmVkIGludCBjcHUpCj4+PiAgewo+Pj4gICAgICBzdHJ1Y3Qgc2NoZWR1bGVy
ICpzY2hlZCA9IHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpOwo+Pj4gICAgICBzdHJ1Y3Qgc2NoZWRf
cmVzb3VyY2UgKnNkID0gcGVyX2NwdShzY2hlZF9yZXMsIGNwdSk7Cj4+PiArICAgIGNvbnN0IGNw
dW1hc2tfdCAqbWFzazsKPj4+ICsgICAgdW5zaWduZWQgaW50IG1hc3Rlcl9jcHU7Cj4+PiArICAg
IHNwaW5sb2NrX3QgKmxvY2s7Cj4+PiArICAgIHN0cnVjdCBzY2hlZF9pdGVtICpvbGRfaXRlbSwg
Km1hc3Rlcl9pdGVtOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RB
VEVfcmVzdW1lICkKPj4+ICsgICAgICAgIHJldHVybjsKPj4+ICsKPj4+ICsgICAgc3dpdGNoICgg
b3B0X3NjaGVkX2dyYW51bGFyaXR5ICkKPj4+ICsgICAgewo+Pj4gKyAgICBjYXNlIFNDSEVEX0dS
QU5fY3B1Ogo+Pj4gKyAgICAgICAgbWFzayA9IGNwdW1hc2tfb2YoY3B1KTsKPj4+ICsgICAgICAg
IGJyZWFrOwo+Pj4gKyAgICBjYXNlIFNDSEVEX0dSQU5fY29yZToKPj4+ICsgICAgICAgIG1hc2sg
PSBwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSk7Cj4+PiArICAgICAgICBicmVhazsKPj4+
ICsgICAgY2FzZSBTQ0hFRF9HUkFOX3NvY2tldDoKPj4+ICsgICAgICAgIG1hc2sgPSBwZXJfY3B1
KGNwdV9jb3JlX21hc2ssIGNwdSk7Cj4+PiArICAgICAgICBicmVhazsKPj4+ICsgICAgZGVmYXVs
dDoKPj4+ICsgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+Pj4gKyAgICAgICAgcmV0dXJu
Owo+Pj4gKyAgICB9Cj4+PiAgCj4+PiAtICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFU
RV9yZXN1bWUgKQo+Pj4gKyAgICBpZiAoIGNwdSA9PSAwIHx8IGNwdW1hc2tfd2VpZ2h0KG1hc2sp
ID09IDEgKQo+PiAKPj4gQXQgbGVhc3Qgb3V0c2lkZSBvZiB4ODYgc3BlY2lmaWMgY29kZSBJIHRo
aW5rIHdlIHNob3VsZCBhdm9pZAo+PiBpbnRyb2R1Y2luZyAoZnVydGhlcj8pIGFzc3VtcHRpb25z
IHRoYXQgc2VlaW5nIENQVSAwIG9uIGEKPj4gQ1BVIGluaXRpYWxpemF0aW9uIHBhdGggaW1wbGll
cyB0aGlzIGJlaW5nIHdoaWxlIGJvb3RpbmcgdGhlCj4+IHN5c3RlbS4gSSB3b25kZXIgYW55d2F5
IHdoZXRoZXIgdGhlIHJpZ2h0IHNpZGUgb2YgdGhlIHx8Cj4+IGRvZXNuJ3QgcmVuZGVyIHRoZSBs
ZWZ0IHNpZGUgcmVkdW5kYW50Lgo+IAo+IE9uIHRoZSBib290IGNwdSB0aGlzIGZ1bmN0aW9uIGlz
IGNhbGxlZCBiZWZvcmUgZS5nLiBjcHVfc2libGluZ19tYXNrCj4gaXMgaW5pdGlhbGl6ZWQuIEkg
Y2FuIGhhdmUgYSB0cnkgdXNpbmc6Cj4gCj4gaWYgKCBjcHVtYXNrX3dlaWdodChtYXNrKSA8PSAx
ICkKCk9yIHJlLW9yZGVyIHRoaW5ncyBzdWNoIHRoYXQgaXQgZ2V0cyBzZXQgaW4gdGltZT8KCj4+
PiArc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgc2NoZWRfY2hlY2tfZ3JhbnVsYXJpdHkodm9p
ZCkKPj4+ICt7Cj4+PiArICAgIHVuc2lnbmVkIGludCBjcHU7Cj4+PiArICAgIHVuc2lnbmVkIGlu
dCBzaWJsaW5ncywgZ3JhbiA9IDA7Cj4+PiArCj4+PiArICAgIGZvcl9lYWNoX29ubGluZV9jcHUo
IGNwdSApCj4+IAo+PiBZb3Ugd2FudCB0byBkZWNpZGUgZm9yIG9uZSBvZiB0d28gcG9zc2libGUg
c3R5bGVzLCBidXQgbm90IGEgbWl4dHVyZQo+PiBvZiBib3RoOgo+PiAKPj4gICAgIGZvcl9lYWNo
X29ubGluZV9jcHUgKCBjcHUgKQo+PiAKPj4gb3IKPj4gCj4+ICAgICBmb3JfZWFjaF9vbmxpbmVf
Y3B1KGNwdSkKPiAKPiBTb3JyeSwgd2lsbCBjb3JyZWN0Lgo+IAo+PiAKPj4gLiBZZXQgdGhlbiBJ
J20gYSBsaXR0bGUgcHV6emxlZCBieSBpdHMgdXNlIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+
PiBHZW5lcmFsbHkgSSB0aGluayBmb3JfZWFjaF9jcHUoKSB1c2VzIGluIF9faW5pdCBmdW5jdGlv
bnMgYXJlCj4+IHByb2JsZW1hdGljLCBhcyB0aGV5IHRoZW4gcmVxdWlyZSBmdXJ0aGVyIGNvZGUg
ZWxzZXdoZXJlIHRvCj4+IGRlYWwgd2l0aCBob3Qtb25saW5pbmcuIEEgcHJlLVNNUC1pbml0Y2Fs
bCBwbHVzIHVzZSBvZiBDUFUKPj4gbm90aWZpZXJzIGlzIHR5cGljYWxseSBtb3JlIGFwcHJvcHJp
YXRlLgo+IAo+IEFuZCB0aGF0IHdhcyBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlcjogY3B1
IGhvdHBsdWcgaXMgbm90IHlldAo+IGhhbmRsZWQgKGhlbmNlIHRoZSBSRkMgc3RhdHVzIG9mIHRo
ZSBzZXJpZXMpLgo+IAo+IFdoZW4gY3B1IGhvdHBsdWcgaXMgYmVpbmcgYWRkZWQgaXQgbWlnaHQg
YmUgYXBwcm9wcmlhdGUgdG8gc3dpdGNoIHRoZQo+IHNjaGVtZSBhcyB5b3Ugc3VnZ2VzdGVkLiBS
aWdodCBub3cgdGhlIGN1cnJlbnQgc29sdXRpb24gaXMgbXVjaCBtb3JlCj4gc2ltcGxlLgoKSSBz
ZWUgKEkgZGlkIG5vdGljZSB0aGUgY292ZXIgbGV0dGVyIHJlbWFyaywgYnV0IG1hbmFnZWQgdG8g
bm90Cmhvbm9yIGl0IHdoZW4gd3JpdGluZyB0aGUgcmVwbHkpLCBidXQgSSdtIHVuY29udmluY2Vk
IGlmIGluY3VycmluZwptb3JlIGNvZGUgY2h1cm4gYnkgbm90IGRlYWxpbmcgd2l0aCB0aGluZ3Mg
dGhlICJkeW5hbWljIiB3YXkKcmlnaHQgYXdheSBpcyBpbmRlZWQgdGhlICJtb3JlIHNpbXBsZSIg
KG92ZXJhbGwpIHNvbHV0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
