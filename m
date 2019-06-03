Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C1432AAE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 10:23:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXiDE-0004DK-OZ; Mon, 03 Jun 2019 08:21:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXiDD-0004DF-Ef
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:20:59 +0000
X-Inumbo-ID: 80c4fa76-85d8-11e9-85ff-9379be4bb426
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80c4fa76-85d8-11e9-85ff-9379be4bb426;
 Mon, 03 Jun 2019 08:20:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 02:20:52 -0600
Message-Id: <5CF4D85E02000078002346C3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 02:20:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <ce4543b6-d8d0-aa62-cc80-1aebb01abcd7@citrix.com>
In-Reply-To: <ce4543b6-d8d0-aa62-cc80-1aebb01abcd7@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDE5OjEzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEEgY291cGxl
IG9mIGFkanVzdG1lbnRzIGFyZSBuZWVkZWQgdG8gY29kZSBjaGVja2luZyBmb3IgZG9tX2Nvdywg
YnV0Cj4+IHNpbmNlIHRoZXJlIGFyZSBwcmV0dHkgZmV3IGl0IGlzIHByb2JhYmx5IGJldHRlciB0
byBhZGp1c3QgdGhvc2UgdGhhbgo+PiB0byBzZXQgdXAgYW5kIGtlZXAgYXJvdW5kIGEgbmV2ZXIg
dXNlZCBkb21haW4uCj4+Cj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCB0aWdodGVuIGEgQlVH
X09OKCkgaW4gZW11bC1wcml2LW9wLmM6cmVhZF9jcigpLgo+PiAoQXJndWFibHkgdGhpcyBwZXJo
YXBzIHNob3VsZG4ndCBiZSBhIEJVR19PTigpIGluIHRoZSBmaXJzdCBwbGFjZS4pCj4gCj4gWWVz
IC0gaXQgc2hvdWxkIGJlIEFTU0VSVF9VTlJFQUNIQUJMRSgpL2RvbWFpbl9jcmFzaCgpCj4gCj4g
SSdtIG5vdCBmdXNzZWQgaWYgdGhpcyBkb25lIGFzIHBhcnQgb2YgdGhpcyBwYXRjaCwgb3Igc3Bs
aXQgb3V0Cj4gc2VwYXJhdGVseS4gIEl0IGFsbW9zdCBkb2Vzbid0IHNlZW0gd29ydGggc3BsaXR0
aW5nIG91dC4KCldlbGwsIHRvIGRvIGJvdGggY2hhbmdlcyBhdCB0aGUgc2FtZSB0aW1lLCBJJ2xs
IHJlYWxseSBzcGxpdCB0aGlzIG91dAppbnRvIGEgcHJlcmVxIHBhdGNoLgoKPj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL21tLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPj4gQEAgLTY0
NCw2ICs2NDQsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmlsdGVyZWRfZmx1c2hfdGxiX21hCj4+
ICAKPj4gIC8qIFByaXZhdGUgZG9tYWluIHN0cnVjdHMgZm9yIERPTUlEX1hFTiwgRE9NSURfSU8s
IGV0Yy4gKi8KPj4gIGV4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9tX2lvLCAqZG9t
X2NvdzsKPj4gKyNpZm5kZWYgQ09ORklHX0hBU19NRU1fU0hBUklORwo+PiArIyBkZWZpbmUgZG9t
X2NvdyBOVUxMCj4+ICsjZW5kaWYKPj4gIAo+PiAgZW51bSBYRU5TSEFSRV9mbGFncyB7Cj4+ICAg
ICAgU0hBUkVfcncsCj4gCj4gV2hhdCBpcyB3cm9uZyB3aXRoCj4gCj4gI2lmZGVmIENPTkZJR19I
QVNfTUVNX1NIQVJJTkcKPiBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX2NvdzsKPiAjZWxzZQo+
ICMgZGVmaW5lIGRvbV9jb3cgTlVMTAo+ICNlbmRpZgo+IAo+IHdoaWNoIGlzIGhvdyB3ZSB1c3Vh
bGx5IGV4cHJlc3MgdGhpbmdzIGxpa2UgdGhpcz8gIFN1cmUsIGl0cyBhIHRpbnkgYml0Cj4gbG9u
Z2VyIHRvIHdyaXRlLCBidXQgaXQgaXMgZWFzaWVyIHRvIGZvbGxvdy4KCldlbGwsIHNpbmNlIHlv
dSdyZSB0aGUgc2Vjb25kIG9uZSB0byBhc2ssIEknbGwgc3dpdGNoLCBkZXNwaXRlIG5vdCBhZ3Jl
ZWluZwp3aXRoIHRoaXMuIFlldCBhZ2FpbiBzb21lIHVzZSBvZiB0aGUgQyBsYW5ndWFnZSB0aGF0
IGFwcGFyZW50bHkgbmVlZHMKdG8gYmUgbGlzdGVkIGluIC4vQ09ESU5HX1NUWUxFIGFzIHVud2Fu
dGVkIC8gZm9yYmlkZGVuLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
