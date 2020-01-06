Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92868131611
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:31:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVFG-00088c-O1; Mon, 06 Jan 2020 16:28:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioVFF-00088T-G1
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:28:45 +0000
X-Inumbo-ID: 964ae6e8-30a1-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 964ae6e8-30a1-11ea-a914-bc764e2007e4;
 Mon, 06 Jan 2020 16:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C50BABE9;
 Mon,  6 Jan 2020 16:28:35 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191209112954.124169-1-george.dunlap@citrix.com>
 <194245a0-fd02-25d6-289e-251c12b7532a@suse.com>
 <44621429-b626-1f01-010a-04e65ae63f3b@citrix.com>
 <49c55a7a-af65-9b1c-c5db-1664571a4393@suse.com>
 <500f6dd1-b36f-c600-78c3-60d0f94123a0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80b06dd8-f91b-bf98-d27e-7397b7665438@suse.com>
Date: Mon, 6 Jan 2020 17:29:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <500f6dd1-b36f-c600-78c3-60d0f94123a0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] CODING_STYLE: Document how to handle
 unexpected conditions
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNzoxOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi8xMC8xOSAx
OjQ2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMTIuMjAxOSAxMTo1NiwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDEyLzkvMTkgMTo1MCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+Pj4gT24gMDkuMTIuMjAxOSAxMjoyOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4gLS0t
IGEvQ09ESU5HX1NUWUxFCj4+Pj4+ICsrKyBiL0NPRElOR19TVFlMRQo+Pj4+PiBAQCAtMTMzLDMg
KzEzMyw5NyBAQCB0aGUgZW5kIG9mIGZpbGVzLiAgSXQgc2hvdWxkIGJlOgo+Pj4+PiAgICogaW5k
ZW50LXRhYnMtbW9kZTogbmlsCj4+Pj4+ICAgKiBFbmQ6Cj4+Pj4+ICAgKi8KPj4+Pj4gKwo+Pj4+
PiArSGFuZGxpbmcgdW5leHBlY3RlZCBjb25kaXRpb25zCj4+Pj4+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4+Pj4gKwo+Pj4+PiArR1VJREVMSU5FUzoKPj4+Pj4gKwo+Pj4+PiAr
UGFzc2luZyBlcnJvcnMgdXAgdGhlIHN0YWNrIHNob3VsZCBiZSB1c2VkIHdoZW4gdGhlIGNhbGxl
ciBpcyBhbHJlYWR5Cj4+Pj4+ICtleHBlY3RpbmcgdG8gaGFuZGxlIGVycm9ycywgYW5kIHRoZSBz
dGF0ZSB3aGVuIHRoZSBlcnJvciB3YXMKPj4+Pj4gK2Rpc2NvdmVyZWQgaXNu4oCZdCBicm9rZW4s
IG9yIGlzbid0IHRvbyBoYXJkIHRvIGZpeC4KPj4+Pj4gKwo+Pj4+PiArZG9tYWluX2NyYXNoKCkg
c2hvdWxkIGJlIHVzZWQgd2hlbiBwYXNzaW5nIGVycm9ycyB1cCB0aGUgc3RhY2sgaXMgdG9vCj4+
Pj4+ICtkaWZmaWN1bHQsIGFuZC9vciB3aGVuIGZpeGluZyB1cCBzdGF0ZSBvZiBhIGd1ZXN0IGlz
IGltcHJhY3RpY2FsLCBidXQKPj4+Pj4gK3doZXJlIGZpeGluZyB1cCB0aGUgc3RhdGUgb2YgWGVu
IHdpbGwgYWxsb3cgWGVuIHRvIGNvbnRpbnVlIHJ1bm5pbmcuCj4+Pj4+ICtUaGlzIGlzIHBhcnRp
Y3VsYXJseSBhcHByb3ByaWF0ZSB3aGVuIHRoZSBndWVzdCBpcyBleGhpYml0aW5nIGJlaGF2aW9y
Cj4+Pj4+ICt3ZWxsLWJlaGF2ZWQgZ3Vlc3Qgc2hvdWxkLgo+Pj4+Cj4+Pj4gRFlNICJzaG91bGRu
J3QiPwo+Pj4KPj4+IEluZGVlZC4KPj4KPj4gKEJ0dywgbm90aWNpbmcgb25seSBub3cgLSB0aGVy
ZSdzIGFsc28gZWl0aGVyIGFuICJhIiBtaXNzaW5nLCBvciBpdAo+PiB3YW50cyB0byBiZSAiZ3Vl
c3RzIi4pCj4+Cj4+Pj4+ICstIGRvbWFpbl9jcmFzaCgpIGlzIHNpbWlsYXIgdG8gQlVHX09OKCks
IGJ1dCB3aXRoIGEgbW9yZSBsaW1pdGVkCj4+Pj4+ICtlZmZlY3Q6IGl0IHN0b3BzIHRoYXQgZG9t
YWluIGltbWVkaWF0ZWx5LiAgSW4gc2l0dWF0aW9ucyB3aGVyZQo+Pj4+PiArY29udGludWluZyBt
aWdodCBjYXVzZSBndWVzdCBvciBoeXBlcnZpc29yIGNvcnJ1cHRpb24sIGJ1dCBkZXN0cm95aW5n
Cj4+Pj4+ICt0aGUgZ3Vlc3QgYWxsb3dzIHRoZSBoeXBlcnZpc29yIHRvIGNvbnRpbnVlLCB0aGlz
IGNhbiBjaGFuZ2UgYSBtb3JlCj4+Pj4+ICtzZXJpb3VzIGJ1ZyBpbnRvIGEgZ3Vlc3QgZGVuaWFs
LW9mLXNlcnZpY2UuICBCdXQgaW4gc2l0dWF0aW9ucyB3aGVyZQo+Pj4+PiArcmV0dXJuaW5nIGFu
IGVycm9yIG1pZ2h0IGJlIHNhZmUsIHRoZW4gZG9tYWluX2NyYXNoKCkgY2FuIGNoYW5nZSBhCj4+
Pj4+ICtiZW5pZ24gZmFpbHVyZSBpbnRvIGEgZ3Vlc3QgZGVuaWFsLW9mLXNlcnZpY2UuCj4+Pj4K
Pj4+PiBQZXJoYXBzIGZ1cnRoZXIgcHV0IGVtcGhhc2lzIG9uIHRoZSBjYWxsIHRyZWUgc3RpbGwg
Z2V0dGluZyB1bndvdW5kCj4+Pj4gbm9ybWFsbHksIHdoaWNoIG1heSBpbXBseSBmdXJ0aGVyIGFj
dGlvbnMgb24gdGhlIChub3cgZHlpbmcpIGRvbWFpbgo+Pj4+IHRha2VuLiBVbmZvcnR1bmF0ZWx5
IGl0J3Mgbm90IHVudXN1YWwgZm9yIHBlb3BsZSB0byBmb3JnZXQgdGhpczsgSQo+Pj4+IHRoaW5r
IHRoZSBJT01NVSBjb2RlIGluIHBhcnRpY3VsYXIgd2FzIChob3BlZnVsbHkgaXNuJ3Qgc28gbXVj
aAo+Pj4+IGFueW1vcmUpIGEgImdvb2QiIGV4YW1wbGUgb2YgdGhpcy4KPj4+Cj4+PiBDYW4geW91
IGV4cGFuZCBvbiB0aGlzPyAgRG8geW91IG1lYW4gdG8gYWR2aXNlIHRoYXQgY2FyZSBzaG91bGQg
YmUgdGFrZW4KPj4+IHdoZW4gcmV0dXJuaW5nIHVwIHRoZSBjYWxsc3RhY2sgdGhhdCB0aGUgZG9t
YWluIHdoaWNoIHdhcyBydW5uaW5nIGJlZm9yZQo+Pj4gbWF5IG5vdyBiZSBkeWluZywgYW5kIHRv
IGJlaGF2ZSBhcHByb3ByaWF0ZWx5Pwo+Pgo+PiBPbmUgaXNzdWUgaXMgd2l0aCBmdW5jdGlvbnMg
cmV0dXJuaW5nIHZvaWQsIHdoZXJlIHRoZSBjYWxsZXIgd29uJ3QKPj4gZXZlbiBrbm93IHRoYXQg
c29tZXRoaW5nIG1heSBoYXZlIGdvbmUgd3JvbmcuIEFub3RoZXIgaXMgdGhhdAo+PiB0eXBpY2Fs
bHkgZXJyb3IgcGF0aHMgYXJlIGxlc3MgY29tbW9ubHkgdXNlZCwgYW5kIGNyYXNoaW5nIGEKPj4g
ZG9tYWluIHdvdWxkIHR5cGljYWxseSBiZSBhY2NvbXBhbmllZCBieSBpbmRpY2F0aW5nIGFuIGVy
cm9yIHRvCj4+IHRoZSB1cHBlciBsYXllcnMuIEhlbmNlIHN1Y2ggY3Jhc2hpbmcgbWF5IHRyaWdn
ZXIgdW5yZWxhdGVkIGJ1Z3MuCj4+IEEgdGhpcmQgYXNwZWN0IGlzIHRoYXQsIGluZGVlZCwgZHlp
bmcgZ3Vlc3RzIG1heSBuZWVkIHNwZWNpYWwKPj4gdHJlYXRtZW50IChzZWUgdGhlIGFscmVhZHkg
ZXhpc3RpbmcgLT5pc19keWluZyBjaGVja3Mgd2UgaGF2ZSkuCj4+Cj4+IEkgbWVudGlvbmVkIHRo
ZSBjYWxsIHRyZWUgdW53aW5kaW5nIGluIHBhcnRpY3VsYXIgYmVjYXVzZSBlYXJsaWVyCj4+IG9u
IHdlIGhhZCBkb21haW5fY3Jhc2hfc3luY2hyb25vdXMoKSwgd2hpY2ggd2FzIHRoZXJlIHNwZWNp
ZmljYWxseQo+PiB0byBhdm9pZCBpc3N1ZXMgd2l0aCBlcnJvcnMgKGFuZCB0aGUgY2hhbmdlZCBz
dGF0ZSkgYnViYmxpbmcgYmFjawo+PiB1cC4gQnV0IHRoaXMgbW9kZWwgaGFkIG90aGVyIGlzc3Vl
cywgaGVuY2Ugb3VyIG1vdmVtZW50IGF3YXkgZnJvbQo+PiBpdC4KPiAKPiBIb3cgYWJvdXQgYSBw
YXJhZ3JhcGggbGlrZSB0aGlzOgo+IAo+IC0tLQo+IE5vdGUgaG93ZXZlciB0aGF0IGRvbWFpbl9j
cmFzaCgpIGhhcyBpdHMgb3duIHRyYXBzOiBjYWxsZXJzIGZhciB1cCB0aGUKPiBjYWxsIHN0YWNr
IG1heSBub3QgcmVhbGl6ZSB0aGF0IHRoZSBkb21haW4gaXMgbm93IGR5aW5nIGFzIGEgcmVzdWx0
IG9mCj4gYW4gaW5ub2N1b3VzLWxvb2tpbmcgb3BlcmF0aW9uLCBwYXJ0aWN1bGFybHkgaWYgc29t
ZXdoZXJlIGJldHdlZW4gdGhlCj4gZmFpbHVyZSBhbmQgdGhlIG9wZXJhdGlvbiwgbm8gZXJyb3Ig
aXMgcmV0dXJuZWQuICBVc2luZyBpdCByZXF1aXJlcwo+IGNhcmVmdWwgaW5zcGVjdGlvbiBhbmQg
ZG9jdW1lbnRhdGlvbiBvZiB0aGUgY29kZSB0byBtYWtlIHN1cmUgYWxsCj4gY2FsbGVycyBhdCB0
aGUgc3RhY2sgaGFuZGxlIGEgbmV3bHktZGVhZCBkb21haW4gZ3JhY2VmdWxseS4KPiAtLS0KClNv
dW5kcyBnb29kLCB0aGFua3MuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
