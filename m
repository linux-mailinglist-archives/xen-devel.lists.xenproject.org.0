Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464D56CBD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg9AM-0003cj-Dh; Wed, 26 Jun 2019 14:44:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3S3C=UZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hg9AK-0003ce-J1
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 14:44:52 +0000
X-Inumbo-ID: f3939bba-9820-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f3939bba-9820-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 14:44:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B715AAC58;
 Wed, 26 Jun 2019 14:44:49 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
 <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
 <20190626122157.GA2885@gao-cwp>
 <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
 <20190626143434.GA6903@gao-cwp>
From: Juergen Gross <jgross@suse.com>
Message-ID: <dd9f7b6d-d63b-5bd2-6c58-e97ba669a9e1@suse.com>
Date: Wed, 26 Jun 2019 16:44:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626143434.GA6903@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDYuMTkgMTY6MzQsIENoYW8gR2FvIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5
IGF0IDAzOjM2OjM1UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI2LjA2LjE5
IDE0OjIxLCBDaGFvIEdhbyB3cm90ZToKPj4+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDA4OjE3
OjUwQU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4gT24gMjQuMDYuMTkgMjA6NDcs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4gKyB4ZW4tZGV2ZWwKPj4+Pj4KPj4+Pj4g
T24gTW9uLCAyNCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+Pj4gSGkg
YWxsLAo+Pj4+Pj4KPj4+Pj4+IEkgbWlnaHQgaGF2ZSBmb3VuZCBhIGJ1ZyB3aXRoIFBDSSBwYXNz
dGhyb3VnaCB0byBhIExpbnV4IEhWTSBndWVzdCBvbgo+Pj4+Pj4geDg2IHdpdGggWGVuIDQuMTIu
IEl0IGlzIG5vdCBlYXN5IGZvciBtZSB0byBnZXQgYWNjZXNzLCBhbmQgZXNwZWNpYWxseQo+Pj4+
Pj4gY2hhbmdlIGNvbXBvbmVudHMsIG9uIHRoaXMgcGFydGljdWxhciBzeXN0ZW0sIGFuZCBJIGRv
bid0IGhhdmUgYWNjZXNzIHRvCj4+Pj4+PiBvdGhlciB4ODYgYm94ZXMgYXQgdGhlIG1vbWVudCwg
c28gYXBvbG9naWVzIGZvciB0aGUgcGFydGlhbCBpbmZvcm1hdGlvbgo+Pj4+Pj4gcmVwb3J0LiBU
aGUgc2V0dXAgaXMgYXMgZm9sbG93Ogo+Pj4+Pj4KPj4+Pj4+IC0gdHdvIFBDSSBkZXZpY2VzIGhh
dmUgYmVlbiBhc3NpZ25lZCB0byBhIEhWTSBndWVzdCwgZXZlcnl0aGluZyBpcyBmaW5lCj4+Pj4+
PiAtIHJlYm9vdCB0aGUgZ3Vlc3QgZnJvbSBpbnNpZGUsIGkuZS4gYHJlYm9vdCcgaW4gTGludXgK
Pj4+Pj4+IC0gYWZ0ZXIgdGhlIHJlYm9vdCBjb21wbGV0ZXMsIG9ubHkgb25lIGRldmljZSBpcyBh
c3NpZ25lZAo+Pj4+Pj4KPj4+Pj4+IEJlZm9yZSB0aGUgcmVib290LCBJIHNlZSBhbGwgdGhlIGFw
cHJvcHJpYXRlIHhlbnN0b3JlIGVudHJpZXMgZm9yIGJvdGgKPj4+Pj4+IGRldmljZXMuIEV2ZXJ5
dGhpbmcgaXMgZmluZS4gQWZ0ZXIgdGhlIHJlYm9vdCwgSSBjYW4gb25seSBzZWUgdGhlCj4+Pj4+
PiB4ZW5zdG9yZSBlbnRyaWVzIG9mIG9uZSBkZXZpY2UuIEl0IGlzIGFzIGlmIHRoZSBvdGhlciBk
ZXZpY2UKPj4+Pj4+ICJkaXNhcHBlYXJlZCIgd2l0aG91dCB0aHJvd2luZyBhbnkgZXJyb3JzLgo+
Pj4+Pj4KPj4+Pj4+IEhhdmUgeW91IHNlZW4gdGhpcyBiZWZvcmU/IERvIHlvdSBrbm93IGlmIGl0
IGhhcyBiZWVuIGZpeGVkIGluIHN0YWdpbmc/Cj4+Pj4+PiBJIG5vdGljZWQgdGhpcyBmaXggd2hp
Y2ggc2VlbXMgdG8gYmUgdmVyeSByZWxldmFudDoKPj4+Pj4+Cj4+Pj4+PiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTEvbXNnMDE2MTYu
aHRtbAo+Pj4+Pj4KPj4+Pj4+IGJ1dCBpdCBpcyBhbHJlYWR5IGluY2x1ZGVkIGluIDQuMTIuCj4+
Pj4KPj4+PiBTdGVmYW5vLCBjb3VsZCB5b3UgcGxlYXNlIHRyeSB0aGUgYXR0YWNoZWQgcGF0Y2g/
IEl0IGlzIG9ubHkgY29tcGlsZQo+Pj4+IHRlc3RlZCBmb3Igbm93Lgo+Pj4+Cj4+Pj4KPj4+PiBK
dWVyZ2VuCj4+Pgo+Pj4gPkZyb20gZWE5NWRjZGZjNjBhODk1Y2M0M2JhZjM0YzhlMGZiMDg4ZTEw
MDA4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4+PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4+Pj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
Pj4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPj4+PiBDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KPj4+PiBEYXRlOiBXZWQsIDI2IEp1biAyMDE5IDA4OjE1OjI4
ICswMjAwCj4+Pj4gU3ViamVjdDogW1BBVENIXSBsaWJ4bDogZml4IHBjaSBkZXZpY2UgcmUtYXNz
aWduaW5nIGFmdGVyIGRvbWFpbiByZWJvb3QKPj4+Pgo+Pj4+IEFmdGVyIGEgcmVib290IG9mIGEg
Z3Vlc3Qgb25seSB0aGUgZmlyc3QgcGNpIGRldmljZSBjb25maWd1cmF0aW9uIHdpbGwKPj4+PiBi
ZSByZXRyaWV2ZWQgZnJvbSBYZW5zdG9yZSByZXN1bHRpbmcgaW4gbG9zcyBvZiBhbnkgZnVydGhl
ciBhc3NpZ25lZAo+Pj4+IHBhc3NlZCB0aHJvdWdoIHBjaSBkZXZpY2VzLgo+Pj4+Cj4+Pj4gVGhl
IG1haW4gcmVhc29uIGlzIHRoYXQgYWxsIHBhc3NlZCB0aHJvdWdoIHBjaSBkZXZpY2VzIHJlc2lk
ZSB1bmRlciBhCj4+Pj4gY29tbW9uIHJvb3QgZGV2aWNlICIwIiBpbiBYZW5zdG9yZS4gU28gd2hl
biB0aGUgZGV2aWNlIGxpc3QgaXMgcmVidWlsdAo+Pj4gPmZyb20gWGVuc3RvcmUgYWZ0ZXIgYSBy
ZWJvb3QgdGhlIHN1Yi1kZXZpY2VzIGJlbG93IHRoYXQgcm9vdCBkZXZpY2UKPj4+PiBuZWVkIHRv
IGJlIHNlbGVjdGVkIGluc3RlYWQgb2YgdXNpbmcgdGhlIHJvb3QgZGV2aWNlIG51bWJlciBhcyBh
Cj4+Pj4gc2VsZWN0b3IuCj4+Pj4KPj4+PiBGaXggdGhhdCBieSBhZGRpbmcgYSBuZXcgbWVtYmVy
IHRvIHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlwZSB3aGljaCB3aGVuCj4+Pj4gc2V0IGlzIHVzZWQg
dG8gZ2V0IHRoZSBudW1iZXIgb2YgZGV2aWNlcy4gQWRkIHN1Y2ggYSBtZW1iZXIgZm9yIHBjaSB0
bwo+Pj4+IGdldCB0aGUgY29ycmVjdCBudW1iZXIgb2YgcGNpIGRldmljZXMgaW5zdGVhZCBvZiBp
bXBseWluZyBpdCBmcm9tIHRoZQo+Pj4+IG51bWJlciBvZiBwY2kgcm9vdCBkZXZpY2VzICh3aGlj
aCB3aWxsIGFsd2F5cyBiZSAxKS4KPj4+Pgo+Pj4+IFdoaWxlIGF0IGl0IGZpeCB0aGUgdHlwZSBv
ZiBsaWJ4bF9fZGV2aWNlX3BjaV9mcm9tX3hzX2JlKCkgdG8gbWF0Y2gKPj4+PiB0aGUgb25lIG9m
IHRoZSAuZnJvbV94ZW5zdG9yZSBtZW1iZXIgb2Ygc3RydWN0IGxpYnhsX2RldmljZV90eXBlLiBU
aGlzCj4+Pj4gZml4ZXMgYSBsYXRlbnQgYnVnIGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgb2Yg
YSBmdW5jdGlvbiByZXR1cm5pbmcKPj4+PiB2b2lkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4KPj4+IFRlc3RlZC1ieTogQ2hhbyBH
YW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPj4KPj4gVGhhbmtzIQo+Pgo+Pj4KPj4+IE5vdGUgdGhh
dCBJIGp1c3QgdGVzdGVkIGl0IG9uIFJFTEVBU0UtNC4xMi4wLCBub3Qgc3RhZ2luZy4KPj4+Cj4+
PiBJIGFsc28gZm91bmQgVVNCIGRldmljZSB3b3VsZCBtaXNzIGFjcm9zcyByZWJvb3QuIElzIHRo
ZXJlIHNvbWVvbmUKPj4+IHdpbGxpbmcgdG8gZml4IGl0IHRvbz8KPj4KPj4gSSdsbCBoYXZlIGEg
bG9vay4KPj4KPiAKPiBJbiBndWVzdCBjb25maWd1cmF0aW9uIGZpbGUsIGl0IGhhcyBmb2xsb3dp
bmcgdHdvIGxpbmVzOgo+IAo+IHVzYmN0cmw9Wyd0eXBlPWRldmljZW1vZGVsLHZlcnNpb249MSdd
Cj4gdXNiZGV2PVsndHlwZT1ob3N0ZGV2LGhvc3RidXM9MSxob3N0YWRkcj0zLGNvbnRyb2xsZXI9
MCxwb3J0PTEnXQo+IAo+IEF0dGFjaG1lbnRzIGFyZSBvdXRwdXQgb2YgJ3hlbnN0b3JlLWxzJyBi
ZWZvcmUgYW5kIGFmdGVyIHJlYm9vdAoKT2gsIHRoaXMgc2VlbXMgdG8gYmUgYW4gaXNzdWUgcmVs
YXRlZCB0byBxZW11IHBhcmFtZXRlcnMuIFRoZSBVU0IKZGV2aWNlIGlzIGNvbXBsZXRlbHkgZW11
bGF0ZWQgYnkgdGhlIGRldmljZSBtb2RlbCwgaXQgaXMgbm90IGEgUFYKZGV2aWNlLgoKTm90IG15
IGFyZWEgb2YgZXhwZXJ0aXNlLCBJIGd1ZXNzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
