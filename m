Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4C30FD0
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 16:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWiHs-0005IY-EM; Fri, 31 May 2019 14:13:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWiHq-0005IP-IC
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:13:38 +0000
X-Inumbo-ID: 46e8478a-83ae-11e9-8dee-3f250ea1ac65
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46e8478a-83ae-11e9-8dee-3f250ea1ac65;
 Fri, 31 May 2019 14:13:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 08:13:34 -0600
Message-Id: <5CF1368C02000078002340B4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 08:13:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
 <5CDC1F96020000780022F4BF@prv1-mh.provo.novell.com>
 <cb3fd070fa6748148dd4af032a7b6edc@AMSPEX02CL03.citrite.net>
In-Reply-To: <cb3fd070fa6748148dd4af032a7b6edc@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDE1OjU1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxNSBNYXkgMjAxOSAxNToxOAo+PiAKPj4gPj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+ICsgICAgaWQgPSBvcHMtPmdldF9kZXZp
Y2VfZ3JvdXBfaWQocGRldi0+c2VnLCBwZGV2LT5idXMsIHBkZXYtPmRldmZuKTsKPj4gPiArICAg
IGdycCA9IGdldF9pb21tdV9ncm91cChpZCk7Cj4+IAo+PiBJIGRvbid0IHRoaW5rIHNvbGl0YXJ5
IGRldmljZXMgc2hvdWxkIGJlIGFsbG9jYXRlZCBhIGdyb3VwLiBBbHNvCj4+IHlvdSBkb24ndCBo
YW5kbGUgZmFpbHVyZSBvZiBvcHMtPmdldF9kZXZpY2VfZ3JvdXBfaWQoKS4KPiAKPiBUcnVlLCBp
dCBjYW4gZmFpbCBpbiB0aGUgVlQtZCBjYXNlLiBOb3QgY2xlYXIgd2hhdCB0byBkbyBpbiB0aGF0
IGNhc2UgdGhvdWdoOyAKPiBJIGd1ZXNzIGFzc3VtZSAtIGZvciBub3cgLSB0aGF0IHRoZSBkZXZp
Y2UgZ2V0cyBpdHMgb3duIGdyb3VwLgo+IEkgdGhpbmsgYWxsIGRldmljZXMgc2hvdWxkIGdldCBh
IGdyb3VwLiBUaGUgZ3JvdXAgd2lsbCB1bHRpbWF0ZWx5IGJlIHRoZSAKPiB1bml0IG9mIGFzc2ln
bm1lbnQgdG8gYSBWTSBhbmQsIGluIHRoZSBiZXN0IGNhc2UsIHdlICpleHBlY3QqIGVhY2ggZGV2
aWNlIHRvIAo+IGhhdmUgaXRzIG93biBncm91cC4uLiBpdCdzIG9ubHkgd2hlbiB0aGVyZSBhcmUg
cXVpcmtzLCBsZWdhY3kgYnJpZGdlcyBldGMuIAo+IHRoYXQgbXVsdGlwbGUgZGV2aWNlcyBzaG91
bGQgZW5kIHVwIGluIHRoZSBzYW1lIGdyb3VwLiBUaGlzIGlzIGNvbnNpc3RlbnQgCj4gd2l0aCBM
aW51eCdzIElPTU1VIGdyb3Vwcy4KCldlbGwsIEknbSBub3Qgd29ycmllZCBtdWNoIGFib3V0IGNv
bnNpc3RlbmN5IHdpdGggTGludXggaGVyZSwgYXMKeW91J3JlIG5vdCBjbG9uaW5nIHRoZWlyIGlt
cGxlbWVudGF0aW9uIGFueXdheSAoYWZhaWN0KS4gVG8gbWUgYXQKdGhpcyBwb2ludCB3cmFwcGlu
ZyBpbmRpdmlkdWFsIGRldmljZXMgaW4gZ3JvdXBzIGxvb2tzIGxpa2UganVzdCBleHRyYQpvdmVy
aGVhZCB3aXRoIG5vIHJlYWwgZ2Fpbi4gQnV0LCBncmFudGVkLCB0aGUgZ2FpbiBtYXkgYXBwZWFy
CmxhdGVyLgoKPj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPj4gPiArKysgYi94ZW4v
aW5jbHVkZS94ZW4vcGNpLmgKPj4gPiBAQCAtNzUsNiArNzUsOSBAQCBzdHJ1Y3QgcGNpX2RldiB7
Cj4+ID4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGFsbGRldnNfbGlzdDsKPj4gPiAgICAgIHN0cnVj
dCBsaXN0X2hlYWQgZG9tYWluX2xpc3Q7Cj4+ID4KPj4gPiArICAgIHN0cnVjdCBsaXN0X2hlYWQg
Z3JwZGV2c19saXN0Owo+PiAKPj4gRG9lcyB0aGlzIHNlcGFyYXRlIGxpc3QgcHJvdmlkZSBtdWNo
IHZhbHVlPyBUaGUgZGV2aWNlcyBpbiBhIGdyb3VwCj4+IGFyZSBnb2luZyB0byBtb3ZlIGJldHdl
ZW4gdHdvIGRvbWFpbl9saXN0LXMgYWxsIGluIG9uZSBnbywgc28KPj4gb25jZSB5b3Uga25vdyB0
aGUgZG9tYWluIG9mIG9uZSB5b3UnbGwgYmUgYWJsZSB0byBmaW5kIHRoZSByZXN0IGJ5Cj4+IGl0
ZXJhdGluZyB0aGF0IGRvbWFpbidzIGxpc3QuIElzIHRoZSBmZWFyIHRoYXQgc3VjaCBhbiBpdGVy
YXRpb24gbWF5Cj4+IGJlIHRlbnMgb2YgdGhvdXNhbmRzIG9mIGVudHJpZXMgbG9uZywgYW5kIGhl
bmNlIGJlY29tZSBhbiBpc3N1ZQo+PiB3aGVuIHRyYXZlcnNlZD8gSSBoYXZlIG5vIGlkZWEgaG93
IG1hbnkgUENJIGRldmljZXMgdGhlIGJpZ2dlc3QKPj4gc3lzdGVtcyB0b2RheSB3b3VsZCBoYXZl
LCBidXQgaWYgdHJhdmVyc2FsIHdhcyBhbiBpc3N1ZSwgdGhlbiBpdAo+PiB3b3VsZCBhbHJlYWR5
IGJlIHdpdGggdGhlIGNvZGUgd2UndmUgZ290IG5vdy4KPiAKPiBJJ2QgcHJlZmVyIHRvIGtlZXAg
aXQuLi4gSXQgbWFrZXMgdGhlIHJlLWltcGxlbWVudGF0aW9uIG9mIHRoZSBkb21jdGwgaW4gdGhl
IAo+IG5leHQgcGF0Y2ggbW9yZSBzdHJhaWdodGZvcndhcmQuCgpJIGNhbiBhY2NlcHQgdGhpcyBh
cyB0aGUgcG9zaXRpdmUgc2lkZS4gQnV0IHRoZXJlJ3MgZXh0cmEgc3RvcmFnZQpuZWVkZWQgKG5v
dCBtdWNoLCBidXQgYW55d2F5KSwgYW5kIHRoZSBtb3JlIChpbmRlcGVuZGVudCkKbGlzdHMgd2Ug
aGF2ZSB0aGF0IGRldmljZXMgY2FuIGJlIG9uLCB0aGUgbW9yZSBsaWtlbHkgaXQnbGwgYmUgdGhh
dApvbmUgb2YgdGhlbSBnZXRzIHNjcmV3ZWQgdXAgYXQgc29tZSBwb2ludCAoZS5nLiBieSBmb3Jn
ZXR0aW5nCnRvIHJlbW92ZSBhIGRldmljZSBmcm9tIG9uZSBvZiB0aGVtIHByaW9yIHRvIGRlLWFs
bG9jYXRpb24pLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
