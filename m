Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E77256AE8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 15:40:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg86L-0005XF-J9; Wed, 26 Jun 2019 13:36:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3S3C=UZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hg86J-0005XA-QL
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:36:39 +0000
X-Inumbo-ID: 6b9e2c12-9817-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b9e2c12-9817-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 13:36:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 238D7AF7B;
 Wed, 26 Jun 2019 13:36:36 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
 <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
 <20190626122157.GA2885@gao-cwp>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
Date: Wed, 26 Jun 2019 15:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626122157.GA2885@gao-cwp>
Content-Language: de-DE
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

T24gMjYuMDYuMTkgMTQ6MjEsIENoYW8gR2FvIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5
IGF0IDA4OjE3OjUwQU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI0LjA2LjE5
IDIwOjQ3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiArIHhlbi1kZXZlbAo+Pj4KPj4+
IE9uIE1vbiwgMjQgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiBIaSBh
bGwsCj4+Pj4KPj4+PiBJIG1pZ2h0IGhhdmUgZm91bmQgYSBidWcgd2l0aCBQQ0kgcGFzc3Rocm91
Z2ggdG8gYSBMaW51eCBIVk0gZ3Vlc3Qgb24KPj4+PiB4ODYgd2l0aCBYZW4gNC4xMi4gSXQgaXMg
bm90IGVhc3kgZm9yIG1lIHRvIGdldCBhY2Nlc3MsIGFuZCBlc3BlY2lhbGx5Cj4+Pj4gY2hhbmdl
IGNvbXBvbmVudHMsIG9uIHRoaXMgcGFydGljdWxhciBzeXN0ZW0sIGFuZCBJIGRvbid0IGhhdmUg
YWNjZXNzIHRvCj4+Pj4gb3RoZXIgeDg2IGJveGVzIGF0IHRoZSBtb21lbnQsIHNvIGFwb2xvZ2ll
cyBmb3IgdGhlIHBhcnRpYWwgaW5mb3JtYXRpb24KPj4+PiByZXBvcnQuIFRoZSBzZXR1cCBpcyBh
cyBmb2xsb3c6Cj4+Pj4KPj4+PiAtIHR3byBQQ0kgZGV2aWNlcyBoYXZlIGJlZW4gYXNzaWduZWQg
dG8gYSBIVk0gZ3Vlc3QsIGV2ZXJ5dGhpbmcgaXMgZmluZQo+Pj4+IC0gcmVib290IHRoZSBndWVz
dCBmcm9tIGluc2lkZSwgaS5lLiBgcmVib290JyBpbiBMaW51eAo+Pj4+IC0gYWZ0ZXIgdGhlIHJl
Ym9vdCBjb21wbGV0ZXMsIG9ubHkgb25lIGRldmljZSBpcyBhc3NpZ25lZAo+Pj4+Cj4+Pj4gQmVm
b3JlIHRoZSByZWJvb3QsIEkgc2VlIGFsbCB0aGUgYXBwcm9wcmlhdGUgeGVuc3RvcmUgZW50cmll
cyBmb3IgYm90aAo+Pj4+IGRldmljZXMuIEV2ZXJ5dGhpbmcgaXMgZmluZS4gQWZ0ZXIgdGhlIHJl
Ym9vdCwgSSBjYW4gb25seSBzZWUgdGhlCj4+Pj4geGVuc3RvcmUgZW50cmllcyBvZiBvbmUgZGV2
aWNlLiBJdCBpcyBhcyBpZiB0aGUgb3RoZXIgZGV2aWNlCj4+Pj4gImRpc2FwcGVhcmVkIiB3aXRo
b3V0IHRocm93aW5nIGFueSBlcnJvcnMuCj4+Pj4KPj4+PiBIYXZlIHlvdSBzZWVuIHRoaXMgYmVm
b3JlPyBEbyB5b3Uga25vdyBpZiBpdCBoYXMgYmVlbiBmaXhlZCBpbiBzdGFnaW5nPwo+Pj4+IEkg
bm90aWNlZCB0aGlzIGZpeCB3aGljaCBzZWVtcyB0byBiZSB2ZXJ5IHJlbGV2YW50Ogo+Pj4+Cj4+
Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE4LTExL21zZzAxNjE2Lmh0bWwKPj4+Pgo+Pj4+IGJ1dCBpdCBpcyBhbHJlYWR5IGluY2x1ZGVk
IGluIDQuMTIuCj4+Cj4+IFN0ZWZhbm8sIGNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRoZSBhdHRhY2hl
ZCBwYXRjaD8gSXQgaXMgb25seSBjb21waWxlCj4+IHRlc3RlZCBmb3Igbm93Lgo+Pgo+Pgo+PiBK
dWVyZ2VuCj4gCj4+RnJvbSBlYTk1ZGNkZmM2MGE4OTVjYzQzYmFmMzRjOGUwZmIwODhlMTAwMDhk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+Cj4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gQ2M6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+PiBDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KPj4gRGF0ZTogV2VkLCAyNiBKdW4gMjAxOSAwODoxNToyOCArMDIwMAo+PiBTdWJq
ZWN0OiBbUEFUQ0hdIGxpYnhsOiBmaXggcGNpIGRldmljZSByZS1hc3NpZ25pbmcgYWZ0ZXIgZG9t
YWluIHJlYm9vdAo+Pgo+PiBBZnRlciBhIHJlYm9vdCBvZiBhIGd1ZXN0IG9ubHkgdGhlIGZpcnN0
IHBjaSBkZXZpY2UgY29uZmlndXJhdGlvbiB3aWxsCj4+IGJlIHJldHJpZXZlZCBmcm9tIFhlbnN0
b3JlIHJlc3VsdGluZyBpbiBsb3NzIG9mIGFueSBmdXJ0aGVyIGFzc2lnbmVkCj4+IHBhc3NlZCB0
aHJvdWdoIHBjaSBkZXZpY2VzLgo+Pgo+PiBUaGUgbWFpbiByZWFzb24gaXMgdGhhdCBhbGwgcGFz
c2VkIHRocm91Z2ggcGNpIGRldmljZXMgcmVzaWRlIHVuZGVyIGEKPj4gY29tbW9uIHJvb3QgZGV2
aWNlICIwIiBpbiBYZW5zdG9yZS4gU28gd2hlbiB0aGUgZGV2aWNlIGxpc3QgaXMgcmVidWlsdAo+
PmZyb20gWGVuc3RvcmUgYWZ0ZXIgYSByZWJvb3QgdGhlIHN1Yi1kZXZpY2VzIGJlbG93IHRoYXQg
cm9vdCBkZXZpY2UKPj4gbmVlZCB0byBiZSBzZWxlY3RlZCBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBy
b290IGRldmljZSBudW1iZXIgYXMgYQo+PiBzZWxlY3Rvci4KPj4KPj4gRml4IHRoYXQgYnkgYWRk
aW5nIGEgbmV3IG1lbWJlciB0byBzdHJ1Y3QgbGlieGxfZGV2aWNlX3R5cGUgd2hpY2ggd2hlbgo+
PiBzZXQgaXMgdXNlZCB0byBnZXQgdGhlIG51bWJlciBvZiBkZXZpY2VzLiBBZGQgc3VjaCBhIG1l
bWJlciBmb3IgcGNpIHRvCj4+IGdldCB0aGUgY29ycmVjdCBudW1iZXIgb2YgcGNpIGRldmljZXMg
aW5zdGVhZCBvZiBpbXBseWluZyBpdCBmcm9tIHRoZQo+PiBudW1iZXIgb2YgcGNpIHJvb3QgZGV2
aWNlcyAod2hpY2ggd2lsbCBhbHdheXMgYmUgMSkuCj4+Cj4+IFdoaWxlIGF0IGl0IGZpeCB0aGUg
dHlwZSBvZiBsaWJ4bF9fZGV2aWNlX3BjaV9mcm9tX3hzX2JlKCkgdG8gbWF0Y2gKPj4gdGhlIG9u
ZSBvZiB0aGUgLmZyb21feGVuc3RvcmUgbWVtYmVyIG9mIHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlw
ZS4gVGhpcwo+PiBmaXhlcyBhIGxhdGVudCBidWcgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBv
ZiBhIGZ1bmN0aW9uIHJldHVybmluZwo+PiB2b2lkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gVGVzdGVkLWJ5OiBDaGFvIEdhbyA8Y2hh
by5nYW9AaW50ZWwuY29tPgoKVGhhbmtzIQoKPiAKPiBOb3RlIHRoYXQgSSBqdXN0IHRlc3RlZCBp
dCBvbiBSRUxFQVNFLTQuMTIuMCwgbm90IHN0YWdpbmcuCj4gCj4gSSBhbHNvIGZvdW5kIFVTQiBk
ZXZpY2Ugd291bGQgbWlzcyBhY3Jvc3MgcmVib290LiBJcyB0aGVyZSBzb21lb25lCj4gd2lsbGlu
ZyB0byBmaXggaXQgdG9vPwoKSSdsbCBoYXZlIGEgbG9vay4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
