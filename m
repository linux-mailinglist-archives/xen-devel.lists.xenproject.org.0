Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4B4E092
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:40:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heDBP-0000Ox-FO; Fri, 21 Jun 2019 06:37:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heDBN-0000Os-Tq
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:37:57 +0000
X-Inumbo-ID: 1855b21c-93ef-11e9-883b-7f7599cd8f48
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1855b21c-93ef-11e9-883b-7f7599cd8f48;
 Fri, 21 Jun 2019 06:37:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:37:52 -0600
Message-Id: <5D0C7B3B0200007800239F12@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:37:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
 <20190618172245.GA16087@amd.com>
 <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
 <20190619155447.GA20907@amd.com>
In-Reply-To: <20190619155447.GA20907@amd.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE3OjU0LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MjA6NDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxOC4wNi4xOSBhdCAxOToyMiwgPEJyaWFuLldvb2RzQGFtZC5jb20+IHdy
b3RlOgo+PiA+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA2OjQyOjMzQU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMTAuMDYuMTkgYXQgMTg6MjgsIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBPbiAyMy8wNS8yMDE5IDEzOjE4LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4gPj4gPj4gVEJEOiBDYW4gd2Ugc2V0IGxvY2FsX2FwaWNfdGltZXJf
YzJfb2sgdG8gdHJ1ZT8gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55Cj4+ID4+ID4+ICAgICAgc3Rh
dGVtZW50IGluIHRoZSBCS0RHIC8gUFBSIGFzIHRvIHdoZXRoZXIgdGhlIExBUElDIHRpbWVyIGNv
bnRpbnVlcwo+PiA+PiA+PiAgICAgIHJ1bm5pbmcgaW4gQ0M2Lgo+PiA+PiA+IAo+PiA+PiA+IFRo
aXMgb3VnaHQgdG8gYmUgZWFzeSB0byBkZXRlcm1pbmUuICBHaXZlbiB0aGUgZGVzY3JpcHRpb24g
b2YgQ0M2Cj4+ID4+ID4gZmx1c2hpbmcgdGhlIGNhY2hlIGFuZCBwb3dlciBnYXRpbmcgdGhlIGNv
cmUsIEknZCBzYXkgdGhlcmUgaXMgYQo+PiA+PiA+IHJlYXNvbmFibGUgY2hhbmNlIHRoYXQgdGhl
IExBUElDIHRpbWVyIHN0b3BzIGluIENDNi4KPj4gPj4gCj4+ID4+IEJ1dCAicmVhc29uYWJsZSBj
aGFuY2UiIGlzbid0IGVub3VnaCBmb3IgbXkgdGFzdGUgaGVyZS4gQW5kIGZyb20KPj4gPj4gd2hh
dCB5b3UgZGVkdWNlLCB0aGUgYW5zd2VyIHRvIHRoZSBxdWVzdGlvbiB3b3VsZCBiZSAibm8iLCBh
bmQKPj4gPj4gaGVuY2Ugc2ltcGx5IG5vIGNoYW5nZSB0byBiZSBtYWRlIGFueXdoZXJlLiAoSSBk
byB0aGluayB0aG91Z2gKPj4gPj4gdGhhdCBpdCdzIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0aGlz
LCBiZWNhdXNlIGlpcmMgbXVjaCBhbHNvIGRlcGVuZHMKPj4gPj4gb24gd2hhdCB0aGUgZmlybXdh
cmUgYWN0dWFsbHkgZG9lcy4pCj4+ID4gCj4+ID4gVGhlIExBUElDIHRpbWVyIG5ldmVyIHN0b3Bz
IG9uIHRoZSBjdXJyZW50bHkgcGxhdGZvcm1zIChOYXBsZXMgYW5kCj4+ID4gUm9tZSkuICBUaGlz
IGlzIGEga25vd2xlZGdhYmxlIEhXIGVuZ2luZWVyIHNvLgo+PiAKPj4gVGhhbmtzIC0gSSd2ZSB0
YWtlbiBub3RlIHRvIHNldCB0aGUgdmFyaWFibGUgYWNjb3JkaW5nbHkgdGhlbi4KPj4gCj4+ID4+
ID4+IFRCRDogV2UgbWF5IHdhbnQgdG8gdmVyaWZ5IHRoYXQgSExUIGluZGVlZCBpcyBjb25maWd1
cmVkIHRvIGVudGVyIENDNi4KPj4gPj4gPiAKPj4gPj4gPiBJIGNhbid0IGFjdHVhbGx5IHNwb3Qg
YW55dGhpbmcgd2hpY2ggdGFsa3MgYWJvdXQgSExUIGRpcmVjdGx5LiAgVGhlCj4+ID4+ID4gY2xv
c2VzdCBJIGNhbiBwb3N0IGlzIENGT0ggKGNhY2hlIGZsdXNoIG9uIGhhbHQpIHdoaWNoIGlzIGFu
Cj4+ID4+ID4gYXV0by10cmFuc2l0aW9uIGZyb20gQ0MxIHRvIENDNiBhZnRlciBhIHNwZWNpZmlj
IHRpbWVvdXQsIGJ1dCB0aGUKPj4gPj4gPiB3b3JkaW5nIHN1Z2dlc3RzIHRoYXQgbXdhaXQgd291
bGQgYWxzbyB0YWtlIHRoaXMgcGF0aC4KPj4gPj4gCj4+ID4+IFdlbGwsIEkgaGFkIGNvbWUgYWNy
b3NzIGEgc2VjdGlvbiBkZXNjcmliaW5nIGhvdyBITFQgY2FuIGJlCj4+ID4+IGNvbmZpZ3VyZWQg
dG8gYmUgdGhlIHNhbWUgYWN0aW9uIGFzIHRoZSBJL08gcG9ydCByZWFkIGZyb20gb25lCj4+ID4+
IG9mIHRoZSB0aHJlZSBwb3J0cyBpbnZvbHZlZCBpbiBDLXN0YXRlIG1hbmFnZW1lbnQKPj4gPj4g
KENTdGF0ZUJhc2VBZGRyKzAuLi4yKS4gQnV0IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIHRoaXMgYWdh
aW4uCj4+ID4+IAo+PiA+PiBBcyB0byBNV0FJVCBiZWhhdmluZyB0aGUgc2FtZSwgSSBkb24ndCB0
aGluayBJIGNhbiBzcG90IHByb29mCj4+ID4+IG9mIHlvdXIgaW50ZXJwcmV0YXRpb24gb3IgcHJv
b2Ygb2YgQnJpYW4ncy4KPj4gPiAKPj4gPiBJdCdzIG5vdCByZWFsbHkgZG9jdW1lbnRlZCBjbGVh
cmx5LiAgSSBnb3QgbXkgaW5mb3JtYXRpb24gZnJvbSB0aGUgSFcKPj4gPiBlbmdpbmVlcnMuICBJ
J3ZlIGFscmVhZHkgcG9zdGVkIHdoYXQgaW5mb3JtYXRpb24gSSBrbm93IHNvIEkgd29uJ3QKPj4g
PiByZXBlYXQgaXQuCj4+IAo+PiBBdCBsZWFzdCBhIHBvaW50ZXIgdG8gd2hlcmUgeW91IGhhZCBz
dGF0ZWQgdGhpcyB3b3VsZCBoYXZlIGJlZW4KPj4gbmljZS4gSWlyYyB0aGVyZSdzIG5vIHByb21v
dGlvbiBpbnRvIENDNiBpbiB0aGF0IGNhc2UsIGluIGNvbnRyYXN0Cj4+IHRvIEFuZHJldydzIHJl
YWRpbmcgb2YgdGhlIGRvYy4KPiAKPiAmbXdhaXRfdjFfcGF0Y2hzZXQKCkhtbSwgSSd2ZSBsb29r
ZWQgdGhyb3VnaCB0aGUgcGF0Y2ggZGVzY3JpcHRpb25zIHRoZXJlIGFnYWluLCBidXQgSQpjYW4n
dCBmaW5kIGFueSBleHBsaWNpdCBzdGF0ZW1lbnQgdG8gdGhlIGVmZmVjdCBvZiB0aGVyZSBiZWlu
ZyBubwpwcm9tb3Rpb24gaW50byBkZWVwZXIgc3RhdGVzIHdoZW4gdXNpbmcgTVdBSVQuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
