Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828508EA84
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 13:42:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyE5n-0007OK-Ad; Thu, 15 Aug 2019 11:38:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyE5l-0007OD-KN
 for xen-devel@lists.xen.org; Thu, 15 Aug 2019 11:38:53 +0000
X-Inumbo-ID: 40bb2ce0-bf51-11e9-8524-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 40bb2ce0-bf51-11e9-8524-bc764e2007e4;
 Thu, 15 Aug 2019 11:38:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D809528;
 Thu, 15 Aug 2019 04:38:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D59C3F694;
 Thu, 15 Aug 2019 04:38:49 -0700 (PDT)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org
References: <20190815112708.11474-1-wipawel@amazon.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
Date: Thu, 15 Aug 2019 12:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815112708.11474-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 mpohlack@amazon.de, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGFtIG5vdCBnb2luZyB0byBhbnN3ZXIgb24gdGhlIHBhdGNoIGl0c2VsZiBidXQgdGhl
IHByb2Nlc3MuCgpBbnkgc2VyaWVzIChpLmUgbW9yZSB0aGFuIG9uZSBwYXRjaCkgc2hvdWxkIGNv
bnRhaW4gYSBjb3ZlciBsZXR0ZXIgd2l0aCBhIHJvdWdoIApzdW1tYXJ5IG9mIHRoZSBnb2FsIG9m
IHRoZSBzZXJpZXMuCgpGdXJ0aGVybW9yZSwgdGhpcyAzIHBhdGNoZXMgc2VyaWVzIGhhcyBiZWVu
IHJlY2VpdmVkIGFzIDMgc2VwYXJhdGUgdGhyZWFkcyAoaS5lIAppbi1yZXBseS10byBpcyBtaXNz
aW5nKS4gVGhpcyBpcyBtYWtpbmcgZGlmZmljdWx0IHRvIGtub3cgdGhhdCBhbGwgdGhlIHBhdGNo
ZXMgCmJlbG9uZ3MgdG8gdGhlIHNhbWUgc2VyaWVzLiBJbiBnZW5lcmFsLCBhbGwgcGF0Y2hlcyBh
cmUgc2VuZCBhcyBpbi1yZXBseS10byB0aGUgCmNvdmVyIGxldHRlci4gU28gYWxsIHRoZSBwYXRj
aGVzIHN0aWNrcyB0b2dldGhlciBpbiBvbmUgdGhyZWFkLgoKVGhlIGNvdmVyIGxldHRlciBjYW4g
YmUgZ2VuZXJhdGVkIHZpYSBnaXQgZm9ybWF0LXBhdGNoIC0tY292ZXItbGV0dGVyLiBUaHJlYWRp
bmcgCmlzIGRvbmUgYXV0b21hdGljYWxseSB3aXRoIGdpdC1zZW5kLWVtYWlsIHdoZW4gYWxsIHRo
ZSBwYXRjaGVzIGFzIHBhc3NlZCBpbiAKYXJndW1lbnRzLgoKRm9yIG1vcmUgZGV0YWlscyBob3cg
dG8gZG8gaXQsIHlvdSBjYW4gcmVhZDoKCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtp
L1N1Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hlcyNTZW5kaW5nX2FfUGF0Y2hfU2VyaWVzCgpD
aGVlcnMsCgpPbiAxNS8wOC8yMDE5IDEyOjI3LCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToK
PiBUaGUgcGF5bG9hZHMnIG5hbWUgc3RyaW5ncyBjYW4gYmUgb2YgYXJiaXRyYXJ5IHNpemUgKHR5
cGljYWxseSBzbWFsbAo+IHdpdGggYW4gdXBwZXIgYm91bmQgb2YgWEVOX0xJVkVQQVRDSF9OQU1F
X1NJWkUpLgo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIGxpc3Qgb3BlcmF0aW9uIGlu
dGVyZmFjZSBhbGxvd3MgdG8gY29weQo+IG5hbWVzIGluIHRoZSBYRU5fTElWRVBBVENIX05BTUVf
U0laRSBjaHVua3MgcmVnYXJkbGVzcyBvZiBpdHMgYWN0dWFsCj4gc2l6ZSBhbmQgZW5mb3JjZXMg
c3BhY2UgYWxsb2NhdGlvbiByZXF1aXJlbWVudHMgb24gdXNlcmxhbmQgdG9vbHMuCj4gCj4gVG8g
dW5pZnkgYW5kIHNpbXBsaWZ5IHRoZSBpbnRlcmZhY2UsIGhhbmRsZSB0aGUgbmFtZSBzdHJpbmdz
IG9mCj4gYXJiaXRyYXJ5IHNpemUgYnkgY29weWluZyB0aGVtIGluIGFkaGVyaW5nIGNodW5rcyB0
byB0aGUgdXNlcmxhbmQuCj4gSW4gb3JkZXIgdG8gbGV0IHRoZSB1c2VybGFuZCBhbGxvY2F0ZSBl
bm91Z2ggc3BhY2UgZm9yIHRoZSBpbmNvbWluZwo+IGRhdGEgYWRkIGFuIGF1eGlsaWFyeSBpbnRl
cmZhY2UgeGNfbGl2ZXBhdGNoX2xpc3RfZ2V0X3NpemVzKCkgdGhhdAo+IHByb3ZpZGVzIHRoZSBj
dXJyZW50IG51bWJlciBvZiBwYXlsb2FkIGVudHJpZXMgYW5kIHRoZSB0b3RhbCBzaXplIG9mCj4g
YWxsIG5hbWUgc3RyaW5ncy4gVGhpcyBpcyBhY2hpZXZlZCBieSBleHRlbmRpbmcgdGhlIHN5c2N0
bCBsaXN0Cj4gaW50ZXJmYWNlIHdpdGggYW4gZXh0cmEgZmllbGRzOiBuYW1lX3RvdGFsX3NpemUu
Cj4gCj4gVGhlIHhjX2xpdmVwYXRjaF9saXN0X2dldF9zaXplcygpIGlzc3VlcyB0aGUgbGl2ZXBh
dGNoIHN5c2N0bCBsaXN0Cj4gb3BlcmF0aW9uIHdpdGggdGhlIG5yIGZpZWxkIHNldCB0byAwLiBJ
biB0aGlzIG1vZGUgdGhlIG9wZXJhdGlvbgo+IHJldHVybnMgdGhlIG51bWJlciBvZiBwYXlsb2Fk
IGVudHJpZXMgYW5kIGNhbGN1bGF0ZXMgdGhlIHRvdGFsIHNpemVzCj4gZm9yIGFsbCBwYXlsb2Fk
cycgbmFtZXMuCj4gV2hlbiB0aGUgc3lzY3RsIG9wZXJhdGlvbiBpcyBpc3N1ZWQgd2l0aCBhIG5v
bi16ZXJvIG5yIGZpZWxkIChmb3IKPiBpbnN0YW5jZSB3aXRoIGEgdmFsdWUgb2J0YWluZWQgZWFy
bGllciB3aXRoIHRoZSBwcmlvciBjYWxsIHRvIHRoZQo+IHhjX2xpdmVwYXRjaF9saXN0X2dldF9z
aXplcygpKSB0aGUgbmV3IGZpZWxkIG5hbWVfdG90YWxfc2l6ZSBwcm92aWRlcwo+IHRoZSB0b3Rh
bCBzaXplIG9mIGFjdHVhbGx5IGNvcGllZCBkYXRhLgo+IAo+IEV4dGVuZCB0aGUgbGlieGMgdG8g
aGFuZGxlIHRoZSBuYW1lIGJhY2stdG8tYmFjayBkYXRhIHRyYW5zZmVycy4KPiAKPiBUaGUgeGVu
LWxpdmVwYXRjaCB0b29sIGlzIG1vZGlmaWVkIHRvIHN0YXJ0IHRoZSBsaXN0IG9wZXJhdGlvbiB3
aXRoIGEKPiBjYWxsIHRvIHRoZSB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoKSB0byBvYnRh
aW4gdGhlIGFjdHVhbCBudW1iZXIKPiBvZiBwYXlsb2FkcyBhcyB3ZWxsIGFzIHRoZSBuZWNlc3Nh
cnkgc3BhY2UgZm9yIG5hbWVzLgo+IFRoZSB0b29sIG5vdyBhbHdheXMgcmVxdWVzdHMgdGhlIGFj
dHVhbCBudW1iZXIgb2YgZW50cmllcyBhbmQgbGVhdmVzCj4gdGhlIHByZWVtcHRpb24gaGFuZGxp
bmcgdG8gdGhlIGxpYnhjIHJvdXRpbmUuIFRoZSBsaWJ4YyBzdGlsbCByZXR1cm5zCj4gJ2RvbmUn
IGFuZCAnbGVmdCcgcGFyYW1ldGVycyB3aXRoIHRoZSBzYW1lIHNlbWFudGljIGFsbG93aW5nIHRo
ZSB0b29sCj4gdG8gZGV0ZWN0IGFub21hbGllcyBhbmQgcmVhY3QgdG8gdGhlbS4gQXQgdGhlIG1v
bWVudCBpdCBpcyBleHBlY3RlZAo+IHRoYXQgdGhlIHRvb2wgcmVjZWl2ZXMgdGhlIGV4YWN0IG51
bWJlciBvZiBlbnRpcmVzIGFzIHJlcXVlc3RlZC4KPiBUaGUgeGVuLWxpdmVwYXRjaCB0b29sIGhh
cyBiZWVuIGFsc28gbW9kaWZpZWQgdG8gaGFuZGxlIHRoZSBuYW1lCj4gYmFjay10by1iYWNrIHRy
YW5zZmVycyBjb3JyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2No
aXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRv
ZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0Bh
bWF6b24uZGU+Cj4gLS0tCj4gICB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCB8ICA0OSAr
KysrKysrKysrKystLS0tLS0KPiAgIHRvb2xzL2xpYnhjL3hjX21pc2MuYyAgICAgICAgIHwgMTAw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgIHRvb2xzL21pc2MveGVu
LWxpdmVwYXRjaC5jICAgIHwgMTEyICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAgeGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgICAgICAgfCAgMzEgKysrKysrKysr
LS0tCj4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICB8ICAxNSArKystLS0KPiAgIDUg
ZmlsZXMgY2hhbmdlZCwgMjA0IGluc2VydGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9p
bmNsdWRlL3hlbmN0cmwuaAo+IGluZGV4IDcyNTY5N2MxMzIuLmUwZWJiNTg2YjYgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKPiArKysgYi90b29scy9saWJ4Yy9p
bmNsdWRlL3hlbmN0cmwuaAo+IEBAIC0yNTYwLDcgKzI1NjAsMjUgQEAgaW50IHhjX2xpdmVwYXRj
aF9nZXQoeGNfaW50ZXJmYWNlICp4Y2gsCj4gICAgICAgICAgICAgICAgICAgICAgICB4ZW5fbGl2
ZXBhdGNoX3N0YXR1c190ICpzdGF0dXMpOwo+ICAgCj4gICAvKgo+IC0gKiBUaGUgaGVhcnQgb2Yg
dGhpcyBmdW5jdGlvbiBpcyB0byBnZXQgYW4gYXJyYXkgb2YgeGVuX2xpdmVwYXRjaF9zdGF0dXNf
dC4KPiArICogR2V0IGEgbnVtYmVyIG9mIGF2YWlsYWJsZSBwYXlsb2FkcyBhbmQgZ2V0IGFjdHVh
bCB0b3RhbCBzaXplIG9mCj4gKyAqIHRoZSBwYXlsb2FkcycgbmFtZSBhcnJheS4KPiArICoKPiAr
ICogVGhpcyBmdW5jdGlvbnMgaXMgdHlwaWNhbGx5IGV4ZWN1dGVkIGZpcnN0IGJlZm9yZSB0aGUg
eGNfbGl2ZXBhdGNoX2xpc3QoKQo+ICsgKiB0byBvYnRhaW4gdGhlIHNpemVzIGFuZCBjb3JyZWN0
bHkgYWxsb2NhdGUgYWxsIG5lY2Vzc2FyeSBkYXRhIHJlc291cmNlcy4KPiArICoKPiArICogVGhl
IHJldHVybiB2YWx1ZSBpcyB6ZXJvIGlmIHRoZSBoeXBlcmNhbGwgY29tcGxldGVkIHN1Y2Nlc3Nm
dWxseS4KPiArICoKPiArICogSWYgdGhlcmUgd2FzIGFuIGVycm9yIHBlcmZvcm1pbmcgdGhlIHN5
c2N0bCBvcGVyYXRpb24sIHRoZSByZXR1cm4gdmFsdWUKPiArICogd2lsbCBjb250YWluIHRoZSBo
eXBlcmNhbGwgZXJyb3IgY29kZSB2YWx1ZS4KPiArICovCj4gK2ludCB4Y19saXZlcGF0Y2hfbGlz
dF9nZXRfc2l6ZXMoeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkIGludCAqbnIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKm5hbWVfdG90YWxfc2l6ZSk7Cj4g
Kwo+ICsvKgoKZ2l0LXNlbmQtZW1haWwgY2FuIGRvIHRoYXQgZm9yIHlvdS4KCgogICAgIDEpIEFu
eSBzZXJpZXMgKGkuZSBtb3JlIHRoYW4gb25lIHBhdGNoKSBzaG91bGQgY29udGFpbiBhIGNvdmVy
IGxldHRlcgogICAgIDIpCgo+ICsgKiBUaGUgaGVhcnQgb2YgdGhpcyBmdW5jdGlvbiBpcyB0byBn
ZXQgYW4gYXJyYXkgb2YgdGhlIGZvbGxvd2luZyBvYmplY3RzOgo+ICsgKiAgIC0geGVuX2xpdmVw
YXRjaF9zdGF0dXNfdDogc3RhdGVzIGFuZCByZXR1cm4gY29kZXMgb2YgcGF5bG9hZHMKPiArICog
ICAtIG5hbWU6IG5hbWVzIG9mIHBheWxvYWRzCj4gKyAqICAgLSBsZW46IGxlbmd0aHMgb2YgY29y
cmVzcG9uZGluZyBwYXlsb2FkcycgbmFtZXMKPiAgICAqCj4gICAgKiBIb3dldmVyIGl0IGlzIGNv
bXBsZXggYmVjYXVzZSBpdCBoYXMgdG8gZGVhbCB3aXRoIHRoZSBoeXBlcnZpc29yCj4gICAgKiBy
ZXR1cm5pbmcgc29tZSBvZiB0aGUgcmVxdWVzdGVkIGRhdGEgb3IgZGF0YSBiZWluZyBzdGFsZQo+
IEBAIC0yNTcxLDIxICsyNTg5LDIwIEBAIGludCB4Y19saXZlcGF0Y2hfZ2V0KHhjX2ludGVyZmFj
ZSAqeGNoLAo+ICAgICogJ2xlZnQnIGFyZSBhbHNvIHVwZGF0ZWQgd2l0aCB0aGUgbnVtYmVyIG9m
IGVudHJpZXMgZmlsbGVkIG91dAo+ICAgICogYW5kIHJlc3BlY3RpdmVseSB0aGUgbnVtYmVyIG9m
IGVudHJpZXMgbGVmdCB0byBnZXQgZnJvbSBoeXBlcnZpc29yLgo+ICAgICoKPiAtICogSXQgaXMg
ZXhwZWN0ZWQgdGhhdCB0aGUgY2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24gd2lsbCB0YWtlIHRoZQo+
IC0gKiAnbGVmdCcgYW5kIHVzZSB0aGUgdmFsdWUgZm9yICdzdGFydCcuIFRoaXMgd2F5IHdlIGhh
dmUgYW4KPiAtICogY3Vyc29yIGluIHRoZSBhcnJheS4gTm90ZSB0aGF0IHRoZSAnaW5mbycsJ25h
bWUnLCBhbmQgJ2xlbicgd2lsbAo+IC0gKiBiZSB1cGRhdGVkIGF0IHRoZSBzdWJzZXF1ZW50IGNh
bGxzLgo+ICsgKiBJdCBpcyBleHBlY3RlZCB0aGF0IHRoZSBjYWxsZXIgb2YgdGhpcyBmdW5jdGlv
biB3aWxsIGZpcnN0IGlzc3VlIHRoZQo+ICsgKiB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMo
KSBpbiBvcmRlciB0byBvYnRhaW4gdG90YWwgc2l6ZXMgb2YgbmFtZXMKPiArICogYXMgd2VsbCBh
cyB0aGUgY3VycmVudCBudW1iZXIgb2YgcGF5bG9hZCBlbnRyaWVzLgo+ICsgKiBUaGUgdG90YWwg
c2l6ZXMgYXJlIHJlcXVpcmVkIGFuZCBzdXBwbGllZCB2aWEgdGhlICduYW1lX3RvdGFsX3NpemUn
Cj4gKyAqIHBhcmFtZXRlci4KPiAgICAqCj4gLSAqIFRoZSAnbWF4JyBpcyB0byBiZSBwcm92aWRl
ZCBieSB0aGUgY2FsbGVyIHdpdGggdGhlIG1heGltdW0KPiAtICogbnVtYmVyIG9mIGVudHJpZXMg
dGhhdCAnaW5mbycsICduYW1lJywgYW5kICdsZW4nIGFycmF5cyBjYW4KPiAtICogYmUgZmlsbGVk
IHVwIHdpdGguCj4gLSAqCj4gLSAqIEVhY2ggZW50cnkgaW4gdGhlICduYW1lJyBhcnJheSBpcyBl
eHBlY3RlZCB0byBiZSBvZiBYRU5fTElWRVBBVENIX05BTUVfU0laRQo+IC0gKiBsZW5ndGguCj4g
KyAqIFRoZSAnbWF4JyBpcyB0byBiZSBwcm92aWRlZCBieSB0aGUgY2FsbGVyIHdpdGggdGhlIG1h
eGltdW0gbnVtYmVyIG9mCj4gKyAqIGVudHJpZXMgdGhhdCAnaW5mbycsICduYW1lJywgJ2xlbicg
YXJyYXlzIGNhbiBiZSBmaWxsZWQgdXAgd2l0aC4KPiAgICAqCj4gICAgKiBFYWNoIGVudHJ5IGlu
IHRoZSAnaW5mbycgYXJyYXkgaXMgZXhwZWN0ZWQgdG8gYmUgb2YgeGVuX2xpdmVwYXRjaF9zdGF0
dXNfdAo+ICAgICogc3RydWN0dXJlIHNpemUuCj4gICAgKgo+ICsgKiBFYWNoIGVudHJ5IGluIHRo
ZSAnbmFtZScgYXJyYXkgbWF5IGhhdmUgYW4gYXJiaXRyYXJ5IHNpemUuCj4gKyAqCj4gICAgKiBF
YWNoIGVudHJ5IGluIHRoZSAnbGVuJyBhcnJheSBpcyBleHBlY3RlZCB0byBiZSBvZiB1aW50MzJf
dCBzaXplLgo+ICAgICoKPiAgICAqIFRoZSByZXR1cm4gdmFsdWUgaXMgemVybyBpZiB0aGUgaHlw
ZXJjYWxsIGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCj4gQEAgLTI1OTcsMTAgKzI2MTQsMTIgQEAg
aW50IHhjX2xpdmVwYXRjaF9nZXQoeGNfaW50ZXJmYWNlICp4Y2gsCj4gICAgKiB3aWxsIGNvbnRh
aW4gdGhlIG51bWJlciBvZiBlbnRyaWVzIHRoYXQgaGFkIGJlZW4gc3VjY2VzZnVsbHkKPiAgICAq
IHJldHJpZXZlZCAoaWYgYW55KS4KPiAgICAqLwo+IC1pbnQgeGNfbGl2ZXBhdGNoX2xpc3QoeGNf
aW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkIGludCBtYXgsIHVuc2lnbmVkIGludCBzdGFydCwKPiAt
ICAgICAgICAgICAgICAgICAgICAgIHhlbl9saXZlcGF0Y2hfc3RhdHVzX3QgKmluZm8sIGNoYXIg
Km5hbWUsCj4gLSAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqbGVuLCB1bnNpZ25lZCBp
bnQgKmRvbmUsCj4gLSAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmxlZnQpOwo+
ICtpbnQgeGNfbGl2ZXBhdGNoX2xpc3QoeGNfaW50ZXJmYWNlICp4Y2gsIGNvbnN0IHVuc2lnbmVk
IGludCBtYXgsCj4gKyAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgc3Rh
cnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2xpdmVwYXRjaF9zdGF0dXMg
KmluZm8sCj4gKyAgICAgICAgICAgICAgICAgICAgICBjaGFyICpuYW1lLCB1aW50MzJfdCAqbGVu
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDY0X3QgbmFtZV90b3RhbF9zaXpl
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpkb25lLCB1bnNpZ25lZCBp
bnQgKmxlZnQpOwo+ICAgCj4gICAvKgo+ICAgICogVGhlIG9wZXJhdGlvbnMgYXJlIGFzeW5jaHJv
bm91cyBhbmQgdGhlIGh5cGVydmlzb3IgbWF5IHRha2UgYSB3aGlsZQo+IGRpZmYgLS1naXQgYS90
b29scy9saWJ4Yy94Y19taXNjLmMgYi90b29scy9saWJ4Yy94Y19taXNjLmMKPiBpbmRleCBhOGU5
ZTdkMWUyLi5kNzg3ZjNmMjlmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX21pc2MuYwo+
ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX21pc2MuYwo+IEBAIC02NjIsNyArNjYyLDQ4IEBAIGludCB4
Y19saXZlcGF0Y2hfZ2V0KHhjX2ludGVyZmFjZSAqeGNoLAo+ICAgfQo+ICAgCj4gICAvKgo+IC0g
KiBUaGUgaGVhcnQgb2YgdGhpcyBmdW5jdGlvbiBpcyB0byBnZXQgYW4gYXJyYXkgb2YgeGVuX2xp
dmVwYXRjaF9zdGF0dXNfdC4KPiArICogR2V0IGEgbnVtYmVyIG9mIGF2YWlsYWJsZSBwYXlsb2Fk
cyBhbmQgZ2V0IGFjdHVhbCB0b3RhbCBzaXplIG9mCj4gKyAqIHRoZSBwYXlsb2FkcycgbmFtZSBh
cnJheS4KPiArICoKPiArICogVGhpcyBmdW5jdGlvbnMgaXMgdHlwaWNhbGx5IGV4ZWN1dGVkIGZp
cnN0IGJlZm9yZSB0aGUgeGNfbGl2ZXBhdGNoX2xpc3QoKQo+ICsgKiB0byBvYnRhaW4gdGhlIHNp
emVzIGFuZCBjb3JyZWN0bHkgYWxsb2NhdGUgYWxsIG5lY2Vzc2FyeSBkYXRhIHJlc291cmNlcy4K
PiArICoKPiArICogVGhlIHJldHVybiB2YWx1ZSBpcyB6ZXJvIGlmIHRoZSBoeXBlcmNhbGwgY29t
cGxldGVkIHN1Y2Nlc3NmdWxseS4KPiArICoKPiArICogSWYgdGhlcmUgd2FzIGFuIGVycm9yIHBl
cmZvcm1pbmcgdGhlIHN5c2N0bCBvcGVyYXRpb24sIHRoZSByZXR1cm4gdmFsdWUKPiArICogd2ls
bCBjb250YWluIHRoZSBoeXBlcmNhbGwgZXJyb3IgY29kZSB2YWx1ZS4KPiArICovCj4gK2ludCB4
Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVkIGlu
dCAqbnIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKm5hbWVf
dG90YWxfc2l6ZSkKPiArewo+ICsgICAgREVDTEFSRV9TWVNDVEw7Cj4gKyAgICBpbnQgcmM7Cj4g
Kwo+ICsgICAgaWYgKCAhbnIgfHwgIW5hbWVfdG90YWxfc2l6ZSApCj4gKyAgICB7Cj4gKyAgICAg
ICAgZXJybm8gPSBFSU5WQUw7Cj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgfQo+ICsKPiAr
ICAgIG1lbXNldCgmc3lzY3RsLCAwLCBzaXplb2Yoc3lzY3RsKSk7Cj4gKyAgICBzeXNjdGwuY21k
ID0gWEVOX1NZU0NUTF9saXZlcGF0Y2hfb3A7Cj4gKyAgICBzeXNjdGwudS5saXZlcGF0Y2guY21k
ID0gWEVOX1NZU0NUTF9MSVZFUEFUQ0hfTElTVDsKPiArCj4gKyAgICByYyA9IGRvX3N5c2N0bCh4
Y2gsICZzeXNjdGwpOwo+ICsgICAgaWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+ICsK
PiArICAgICpuciA9IHN5c2N0bC51LmxpdmVwYXRjaC51Lmxpc3QubnI7Cj4gKyAgICAqbmFtZV90
b3RhbF9zaXplID0gc3lzY3RsLnUubGl2ZXBhdGNoLnUubGlzdC5uYW1lX3RvdGFsX3NpemU7Cj4g
Kwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gKy8qCj4gKyAqIFRoZSBoZWFydCBvZiB0aGlz
IGZ1bmN0aW9uIGlzIHRvIGdldCBhbiBhcnJheSBvZiB0aGUgZm9sbG93aW5nIG9iamVjdHM6Cj4g
KyAqICAgLSB4ZW5fbGl2ZXBhdGNoX3N0YXR1c190OiBzdGF0ZXMgYW5kIHJldHVybiBjb2RlcyBv
ZiBwYXlsb2Fkcwo+ICsgKiAgIC0gbmFtZTogbmFtZXMgb2YgcGF5bG9hZHMKPiArICogICAtIGxl
bjogbGVuZ3RocyBvZiBjb3JyZXNwb25kaW5nIHBheWxvYWRzJyBuYW1lcwo+ICAgICoKPiAgICAq
IEhvd2V2ZXIgaXQgaXMgY29tcGxleCBiZWNhdXNlIGl0IGhhcyB0byBkZWFsIHdpdGggdGhlIGh5
cGVydmlzb3IKPiAgICAqIHJldHVybmluZyBzb21lIG9mIHRoZSByZXF1ZXN0ZWQgZGF0YSBvciBk
YXRhIGJlaW5nIHN0YWxlCj4gQEAgLTY3MywyMSArNzE0LDIwIEBAIGludCB4Y19saXZlcGF0Y2hf
Z2V0KHhjX2ludGVyZmFjZSAqeGNoLAo+ICAgICogJ2xlZnQnIGFyZSBhbHNvIHVwZGF0ZWQgd2l0
aCB0aGUgbnVtYmVyIG9mIGVudHJpZXMgZmlsbGVkIG91dAo+ICAgICogYW5kIHJlc3BlY3RpdmVs
eSB0aGUgbnVtYmVyIG9mIGVudHJpZXMgbGVmdCB0byBnZXQgZnJvbSBoeXBlcnZpc29yLgo+ICAg
ICoKPiAtICogSXQgaXMgZXhwZWN0ZWQgdGhhdCB0aGUgY2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24g
d2lsbCB0YWtlIHRoZQo+IC0gKiAnbGVmdCcgYW5kIHVzZSB0aGUgdmFsdWUgZm9yICdzdGFydCcu
IFRoaXMgd2F5IHdlIGhhdmUgYW4KPiAtICogY3Vyc29yIGluIHRoZSBhcnJheS4gTm90ZSB0aGF0
IHRoZSAnaW5mbycsJ25hbWUnLCBhbmQgJ2xlbicgd2lsbAo+IC0gKiBiZSB1cGRhdGVkIGF0IHRo
ZSBzdWJzZXF1ZW50IGNhbGxzLgo+ICsgKiBJdCBpcyBleHBlY3RlZCB0aGF0IHRoZSBjYWxsZXIg
b2YgdGhpcyBmdW5jdGlvbiB3aWxsIGZpcnN0IGlzc3VlIHRoZQo+ICsgKiB4Y19saXZlcGF0Y2hf
bGlzdF9nZXRfc2l6ZXMoKSBpbiBvcmRlciB0byBvYnRhaW4gdG90YWwgc2l6ZXMgb2YgbmFtZXMK
PiArICogYXMgd2VsbCBhcyB0aGUgY3VycmVudCBudW1iZXIgb2YgcGF5bG9hZCBlbnRyaWVzLgo+
ICsgKiBUaGUgdG90YWwgc2l6ZXMgYXJlIHJlcXVpcmVkIGFuZCBzdXBwbGllZCB2aWEgdGhlICdu
YW1lX3RvdGFsX3NpemUnCj4gKyAqIHBhcmFtZXRlci4KPiAgICAqCj4gLSAqIFRoZSAnbWF4JyBp
cyB0byBiZSBwcm92aWRlZCBieSB0aGUgY2FsbGVyIHdpdGggdGhlIG1heGltdW0KPiAtICogbnVt
YmVyIG9mIGVudHJpZXMgdGhhdCAnaW5mbycsICduYW1lJywgYW5kICdsZW4nIGFycmF5cyBjYW4K
PiAtICogYmUgZmlsbGVkIHVwIHdpdGguCj4gLSAqCj4gLSAqIEVhY2ggZW50cnkgaW4gdGhlICdu
YW1lJyBhcnJheSBpcyBleHBlY3RlZCB0byBiZSBvZiBYRU5fTElWRVBBVENIX05BTUVfU0laRQo+
IC0gKiBsZW5ndGguCj4gKyAqIFRoZSAnbWF4JyBpcyB0byBiZSBwcm92aWRlZCBieSB0aGUgY2Fs
bGVyIHdpdGggdGhlIG1heGltdW0gbnVtYmVyIG9mCj4gKyAqIGVudHJpZXMgdGhhdCAnaW5mbycs
ICduYW1lJywgJ2xlbicgYXJyYXlzIGNhbiBiZSBmaWxsZWQgdXAgd2l0aC4KPiAgICAqCj4gICAg
KiBFYWNoIGVudHJ5IGluIHRoZSAnaW5mbycgYXJyYXkgaXMgZXhwZWN0ZWQgdG8gYmUgb2YgeGVu
X2xpdmVwYXRjaF9zdGF0dXNfdAo+ICAgICogc3RydWN0dXJlIHNpemUuCj4gICAgKgo+ICsgKiBF
YWNoIGVudHJ5IGluIHRoZSAnbmFtZScgYXJyYXkgbWF5IGhhdmUgYW4gYXJiaXRyYXJ5IHNpemUu
Cj4gKyAqCj4gICAgKiBFYWNoIGVudHJ5IGluIHRoZSAnbGVuJyBhcnJheSBpcyBleHBlY3RlZCB0
byBiZSBvZiB1aW50MzJfdCBzaXplLgo+ICAgICoKPiAgICAqIFRoZSByZXR1cm4gdmFsdWUgaXMg
emVybyBpZiB0aGUgaHlwZXJjYWxsIGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCj4gQEAgLTY5OSwx
MSArNzM5LDEyIEBAIGludCB4Y19saXZlcGF0Y2hfZ2V0KHhjX2ludGVyZmFjZSAqeGNoLAo+ICAg
ICogd2lsbCBjb250YWluIHRoZSBudW1iZXIgb2YgZW50cmllcyB0aGF0IGhhZCBiZWVuIHN1Y2Nl
c2Z1bGx5Cj4gICAgKiByZXRyaWV2ZWQgKGlmIGFueSkuCj4gICAgKi8KPiAtaW50IHhjX2xpdmVw
YXRjaF9saXN0KHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBpbnQgbWF4LCB1bnNpZ25lZCBp
bnQgc3RhcnQsCj4gK2ludCB4Y19saXZlcGF0Y2hfbGlzdCh4Y19pbnRlcmZhY2UgKnhjaCwgY29u
c3QgdW5zaWduZWQgaW50IG1heCwKPiArICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2ln
bmVkIGludCBzdGFydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2xpdmVw
YXRjaF9zdGF0dXMgKmluZm8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqbmFtZSwg
dWludDMyX3QgKmxlbiwKPiAtICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZG9u
ZSwKPiAtICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqbGVmdCkKPiArICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQ2NF90IG5hbWVfdG90YWxfc2l6ZSwKPiArICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZG9uZSwgdW5zaWduZWQgaW50ICpsZWZ0KQo+
ICAgewo+ICAgICAgIGludCByYzsKPiAgICAgICBERUNMQVJFX1NZU0NUTDsKPiBAQCAtNzE0LDI3
ICs3NTUsMzMgQEAgaW50IHhjX2xpdmVwYXRjaF9saXN0KHhjX2ludGVyZmFjZSAqeGNoLCB1bnNp
Z25lZCBpbnQgbWF4LCB1bnNpZ25lZCBpbnQgc3RhcnQsCj4gICAgICAgdWludDMyX3QgbWF4X2Jh
dGNoX3N6LCBucjsKPiAgICAgICB1aW50MzJfdCB2ZXJzaW9uID0gMCwgcmV0cmllcyA9IDA7Cj4g
ICAgICAgdWludDMyX3QgYWRqdXN0ID0gMDsKPiAtICAgIHNzaXplX3Qgc3o7Cj4gKyAgICBvZmZf
dCBuYW1lX29mZiA9IDA7Cj4gKyAgICB1aW50NjRfdCBuYW1lX3N6Owo+ICAgCj4gLSAgICBpZiAo
ICFtYXggfHwgIWluZm8gfHwgIW5hbWUgfHwgIWxlbiApCj4gKyAgICBpZiAoICFtYXggfHwgIWlu
Zm8gfHwgIW5hbWUgfHwgIWxlbiB8fCAhZG9uZSB8fCAhbGVmdCApCj4gICAgICAgewo+ICAgICAg
ICAgICBlcnJubyA9IEVJTlZBTDsKPiAgICAgICAgICAgcmV0dXJuIC0xOwo+ICAgICAgIH0KPiAg
IAo+ICsgICAgaWYgKCBuYW1lX3RvdGFsX3NpemUgPT0gMCApCj4gKyAgICB7Cj4gKyAgICAgICAg
ZXJybm8gPSBFTk9FTlQ7Cj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgfQo+ICsKPiArICAg
IG1lbXNldCgmc3lzY3RsLCAwLCBzaXplb2Yoc3lzY3RsKSk7Cj4gICAgICAgc3lzY3RsLmNtZCA9
IFhFTl9TWVNDVExfbGl2ZXBhdGNoX29wOwo+ICAgICAgIHN5c2N0bC51LmxpdmVwYXRjaC5jbWQg
PSBYRU5fU1lTQ1RMX0xJVkVQQVRDSF9MSVNUOwo+IC0gICAgc3lzY3RsLnUubGl2ZXBhdGNoLnBh
ZCA9IDA7Cj4gLSAgICBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0LnZlcnNpb24gPSAwOwo+ICAg
ICAgIHN5c2N0bC51LmxpdmVwYXRjaC51Lmxpc3QuaWR4ID0gc3RhcnQ7Cj4gLSAgICBzeXNjdGwu
dS5saXZlcGF0Y2gudS5saXN0LnBhZCA9IDA7Cj4gICAKPiAgICAgICBtYXhfYmF0Y2hfc3ogPSBt
YXg7Cj4gLSAgICAvKiBDb252aWVuY2UgdmFsdWUuICovCj4gLSAgICBzeiA9IHNpemVvZigqbmFt
ZSkgKiBYRU5fTElWRVBBVENIX05BTUVfU0laRTsKPiArICAgIG5hbWVfc3ogPSBuYW1lX3RvdGFs
X3NpemU7Cj4gICAgICAgKmRvbmUgPSAwOwo+ICAgICAgICpsZWZ0ID0gMDsKPiAgICAgICBkbyB7
Cj4gKyAgICAgICAgdWludDY0X3QgX25hbWVfc3o7Cj4gKwo+ICAgICAgICAgICAvKgo+ICAgICAg
ICAgICAgKiBUaGUgZmlyc3QgdGltZSB3ZSBnbyBpbiB0aGlzIGxvb3Agb3VyICdtYXgnIG1heSBi
ZSBiaWdnZXIKPiAgICAgICAgICAgICogdGhhbiB3aGF0IHRoZSBoeXBlcnZpc29yIGlzIGNvbWZv
cnRhYmxlIHdpdGggLSBoZW5jZSB0aGUgZmlyc3QKPiBAQCAtNzU0LDExICs4MDEsMTEgQEAgaW50
IHhjX2xpdmVwYXRjaF9saXN0KHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBpbnQgbWF4LCB1
bnNpZ25lZCBpbnQgc3RhcnQsCj4gICAgICAgICAgIHN5c2N0bC51LmxpdmVwYXRjaC51Lmxpc3Qu
bnIgPSBucjsKPiAgICAgICAgICAgLyogRml4IHRoZSBzaXplIChtYXkgdmFyeSBiZXR3ZWVuIGh5
cGVyY2FsbHMpLiAqLwo+ICAgICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKGluZm8s
IG5yICogc2l6ZW9mKCppbmZvKSk7Cj4gLSAgICAgICAgSFlQRVJDQUxMX0JPVU5DRV9TRVRfU0la
RShuYW1lLCBuciAqIG5yKTsKPiArICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKG5h
bWUsIG5hbWVfc3opOwo+ICAgICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKGxlbiwg
bnIgKiBzaXplb2YoKmxlbikpOwo+ICAgICAgICAgICAvKiBNb3ZlIHRoZSBwb2ludGVyIHRvIHBy
b3BlciBvZmZzZXQgaW50byAnaW5mbycuICovCj4gICAgICAgICAgIChIWVBFUkNBTExfQlVGRkVS
KGluZm8pKS0+dWJ1ZiA9IGluZm8gKyAqZG9uZTsKPiAtICAgICAgICAoSFlQRVJDQUxMX0JVRkZF
UihuYW1lKSktPnVidWYgPSBuYW1lICsgKHN6ICogKmRvbmUpOwo+ICsgICAgICAgIChIWVBFUkNB
TExfQlVGRkVSKG5hbWUpKS0+dWJ1ZiA9IG5hbWUgKyBuYW1lX29mZjsKPiAgICAgICAgICAgKEhZ
UEVSQ0FMTF9CVUZGRVIobGVuKSktPnVidWYgPSBsZW4gKyAqZG9uZTsKPiAgICAgICAgICAgLyog
QWxsb2NhdGUgbWVtb3J5LiAqLwo+ICAgICAgICAgICByYyA9IHhjX2h5cGVyY2FsbF9ib3VuY2Vf
cHJlKHhjaCwgaW5mbyk7Cj4gQEAgLTgyNywxNCArODc0LDE5IEBAIGludCB4Y19saXZlcGF0Y2hf
bGlzdCh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IG1heCwgdW5zaWduZWQgaW50IHN0
YXJ0LAo+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgIH0KPiAgICAgICAgICAgKmxl
ZnQgPSBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0Lm5yOyAvKiBUb3RhbCByZW1haW5pbmcgY291
bnQuICovCj4gKyAgICAgICAgX25hbWVfc3ogPSBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0Lm5h
bWVfdG90YWxfc2l6ZTsgLyogVG90YWwgcmVjZWl2ZWQgbmFtZSBzaXplLiAqLwo+ICAgICAgICAg
ICAvKiBDb3B5IG9ubHkgdXAgJ3JjJyBvZiBkYXRhJyAtIHdlIGNvdWxkIGFkZCAnbWluKHJjLG5y
KSBpZiBkZXNpcmVkLiAqLwo+ICAgICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKGlu
Zm8sIChyYyAqIHNpemVvZigqaW5mbykpKTsKPiAtICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NF
VF9TSVpFKG5hbWUsIChyYyAqIHN6KSk7Cj4gKyAgICAgICAgSFlQRVJDQUxMX0JPVU5DRV9TRVRf
U0laRShuYW1lLCBfbmFtZV9zeik7Cj4gICAgICAgICAgIEhZUEVSQ0FMTF9CT1VOQ0VfU0VUX1NJ
WkUobGVuLCAocmMgKiBzaXplb2YoKmxlbikpKTsKPiAgICAgICAgICAgLyogQm91bmNlIHRoZSBk
YXRhIGFuZCBmcmVlIHRoZSBib3VuY2UgYnVmZmVyLiAqLwo+ICAgICAgICAgICB4Y19oeXBlcmNh
bGxfYm91bmNlX3Bvc3QoeGNoLCBpbmZvKTsKPiAgICAgICAgICAgeGNfaHlwZXJjYWxsX2JvdW5j
ZV9wb3N0KHhjaCwgbmFtZSk7Cj4gICAgICAgICAgIHhjX2h5cGVyY2FsbF9ib3VuY2VfcG9zdCh4
Y2gsIGxlbik7Cj4gKwo+ICsgICAgICAgIG5hbWVfc3ogLT0gX25hbWVfc3o7Cj4gKyAgICAgICAg
bmFtZV9vZmYgKz0gX25hbWVfc3o7Cj4gKwo+ICAgICAgICAgICAvKiBBbmQgdXBkYXRlIGhvdyBt
YW55IGVsZW1lbnRzIG9mIGluZm8gd2UgaGF2ZSBjb3BpZWQgaW50by4gKi8KPiAgICAgICAgICAg
KmRvbmUgKz0gcmM7Cj4gICAgICAgICAgIC8qIFVwZGF0ZSBpZHguICovCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL21pc2MveGVuLWxpdmVwYXRjaC5jIGIvdG9vbHMvbWlzYy94ZW4tbGl2ZXBhdGNoLmMK
PiBpbmRleCBhMzdiMjQ1N2ZmLi44YWMzZDU2N2ZjIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL21pc2Mv
eGVuLWxpdmVwYXRjaC5jCj4gKysrIGIvdG9vbHMvbWlzYy94ZW4tbGl2ZXBhdGNoLmMKPiBAQCAt
NjQsMTQgKzY0LDE0IEBAIHN0YXRpYyBjb25zdCBjaGFyICpzdGF0ZTJzdHIodW5zaWduZWQgaW50
IHN0YXRlKQo+ICAgICAgIHJldHVybiBuYW1lc1tzdGF0ZV07Cj4gICB9Cj4gICAKPiAtLyogVGhp
cyB2YWx1ZSB3YXMgY2hvb3NlbiBhZGhvYy4gSXQgY291bGQgYmUgNDIgdG9vLiAqLwo+IC0jZGVm
aW5lIE1BWF9MRU4gMTEKPiAgIHN0YXRpYyBpbnQgbGlzdF9mdW5jKGludCBhcmdjLCBjaGFyICph
cmd2W10pCj4gICB7Cj4gLSAgICB1bnNpZ25lZCBpbnQgaWR4LCBkb25lLCBsZWZ0LCBpOwo+ICsg
ICAgdW5zaWduZWQgaW50IG5yLCBkb25lLCBsZWZ0LCBpOwo+ICAgICAgIHhlbl9saXZlcGF0Y2hf
c3RhdHVzX3QgKmluZm8gPSBOVUxMOwo+ICAgICAgIGNoYXIgKm5hbWUgPSBOVUxMOwo+ICAgICAg
IHVpbnQzMl90ICpsZW4gPSBOVUxMOwo+ICsgICAgdWludDY0X3QgbmFtZV90b3RhbF9zaXplOwo+
ICsgICAgb2ZmX3QgbmFtZV9vZmY7Cj4gICAgICAgaW50IHJjID0gRU5PTUVNOwo+ICAgCj4gICAg
ICAgaWYgKCBhcmdjICkKPiBAQCAtNzksNjUgKzc5LDczIEBAIHN0YXRpYyBpbnQgbGlzdF9mdW5j
KGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICAgICAgICAgIHNob3dfaGVscCgpOwo+ICAgICAg
ICAgICByZXR1cm4gLTE7Cj4gICAgICAgfQo+IC0gICAgaWR4ID0gbGVmdCA9IDA7Cj4gLSAgICBp
bmZvID0gbWFsbG9jKHNpemVvZigqaW5mbykgKiBNQVhfTEVOKTsKPiAtICAgIGlmICggIWluZm8g
KQo+IC0gICAgICAgIHJldHVybiByYzsKPiAtICAgIG5hbWUgPSBtYWxsb2Moc2l6ZW9mKCpuYW1l
KSAqIFhFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFICogTUFYX0xFTik7Cj4gLSAgICBpZiAoICFuYW1l
ICkKPiArICAgIGRvbmUgPSBsZWZ0ID0gMDsKPiArCj4gKyAgICByYyA9IHhjX2xpdmVwYXRjaF9s
aXN0X2dldF9zaXplcyh4Y2gsICZuciwgJm5hbWVfdG90YWxfc2l6ZSk7Cj4gKyAgICBpZiAoIHJj
ICkKPiAgICAgICB7Cj4gLSAgICAgICAgZnJlZShpbmZvKTsKPiArICAgICAgICByYyA9IGVycm5v
Owo+ICsgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIGdldCBsaXN0IHNpemVzLlxu
Igo+ICsgICAgICAgICAgICAgICAgIkVycm9yICVkOiAlc1xuIiwKPiArICAgICAgICAgICAgICAg
IHJjLCBzdHJlcnJvcihyYykpOwo+ICAgICAgICAgICByZXR1cm4gcmM7Cj4gICAgICAgfQo+IC0g
ICAgbGVuID0gbWFsbG9jKHNpemVvZigqbGVuKSAqIE1BWF9MRU4pOwo+IC0gICAgaWYgKCAhbGVu
ICkgewo+IC0gICAgICAgIGZyZWUobmFtZSk7Cj4gLSAgICAgICAgZnJlZShpbmZvKTsKPiArCj4g
KyAgICBpZiAoIG5yID09IDAgKQo+ICsgICAgewo+ICsgICAgICAgIGZwcmludGYoc3Rkb3V0LCAi
Tm90aGluZyB0byBsaXN0XG4iKTsKPiArICAgICAgICByZXR1cm4gMDsKPiArICAgIH0KPiArCj4g
KyAgICBpbmZvID0gbWFsbG9jKG5yICogc2l6ZW9mKCppbmZvKSk7Cj4gKyAgICBpZiAoICFpbmZv
ICkKPiAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgIG5hbWUgPSBtYWxsb2MobmFtZV90
b3RhbF9zaXplICogc2l6ZW9mKCpuYW1lKSk7Cj4gKyAgICBpZiAoICFuYW1lICkKPiArICAgICAg
ICBnb3RvIGVycm9yX25hbWU7Cj4gKwo+ICsgICAgbGVuID0gbWFsbG9jKG5yICogc2l6ZW9mKCps
ZW4pKTsKPiArICAgIGlmICggIWxlbiApCj4gKyAgICAgICAgZ290byBlcnJvcl9sZW47Cj4gKwo+
ICsgICAgbWVtc2V0KGluZm8sICdBJywgbnIgKiBzaXplb2YoKmluZm8pKTsKPiArICAgIG1lbXNl
dChuYW1lLCAnQicsIG5hbWVfdG90YWxfc2l6ZSAqIHNpemVvZigqbmFtZSkpOwo+ICsgICAgbWVt
c2V0KGxlbiwgJ0MnLCBuciAqIHNpemVvZigqbGVuKSk7Cj4gKyAgICBuYW1lX29mZiA9IDA7Cj4g
Kwo+ICsgICAgcmMgPSB4Y19saXZlcGF0Y2hfbGlzdCh4Y2gsIG5yLCAwLCBpbmZvLCBuYW1lLCBs
ZW4sIG5hbWVfdG90YWxfc2l6ZSwgJmRvbmUsICZsZWZ0KTsKPiArICAgIGlmICggcmMgfHwgZG9u
ZSAhPSBuciB8fCBsZWZ0ID4gMCkKPiArICAgIHsKPiArICAgICAgICByYyA9IGVycm5vOwo+ICsg
ICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIGxpc3QgJWQvJWQuXG4iCj4gKyAgICAg
ICAgICAgICAgICAiRXJyb3IgJWQ6ICVzXG4iLAo+ICsgICAgICAgICAgICAgICAgbGVmdCwgbnIs
IHJjLCBzdHJlcnJvcihyYykpOwo+ICsgICAgICAgIGdvdG8gZXJyb3I7Cj4gICAgICAgfQo+ICAg
Cj4gLSAgICBkbyB7Cj4gLSAgICAgICAgZG9uZSA9IDA7Cj4gLSAgICAgICAgLyogVGhlIG1lbXNl
dCBpcyBkb25lIHRvIGNhdGNoIGVycm9ycy4gKi8KPiAtICAgICAgICBtZW1zZXQoaW5mbywgJ0En
LCBzaXplb2YoKmluZm8pICogTUFYX0xFTik7Cj4gLSAgICAgICAgbWVtc2V0KG5hbWUsICdCJywg
c2l6ZW9mKCpuYW1lKSAqIE1BWF9MRU4gKiBYRU5fTElWRVBBVENIX05BTUVfU0laRSk7Cj4gLSAg
ICAgICAgbWVtc2V0KGxlbiwgJ0MnLCBzaXplb2YoKmxlbikgKiBNQVhfTEVOKTsKPiAtICAgICAg
ICByYyA9IHhjX2xpdmVwYXRjaF9saXN0KHhjaCwgTUFYX0xFTiwgaWR4LCBpbmZvLCBuYW1lLCBs
ZW4sICZkb25lLCAmbGVmdCk7Cj4gLSAgICAgICAgaWYgKCByYyApCj4gLSAgICAgICAgewo+IC0g
ICAgICAgICAgICByYyA9IGVycm5vOwo+IC0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkZh
aWxlZCB0byBsaXN0ICVkLyVkLlxuIgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIkVy
cm9yICVkOiAlc1xuIiwKPiAtICAgICAgICAgICAgICAgICAgICBpZHgsIGxlZnQsIHJjLCBzdHJl
cnJvcihyYykpOwo+IC0gICAgICAgICAgICBicmVhazsKPiAtICAgICAgICB9Cj4gLSAgICAgICAg
aWYgKCAhaWR4ICkKPiAtICAgICAgICAgICAgZnByaW50ZihzdGRvdXQsIiBJRCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IHN0YXR1c1xuIgo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS1cbiIpOwo+ICsgICAgZnByaW50ZihzdGRvdXQsIiBJRCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IHN0YXR1c1xuIgo+ICsgICAgICAgICAgICAgICAgICAgIi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tXG4iKTsK
PiAgIAo+IC0gICAgICAgIGZvciAoIGkgPSAwOyBpIDwgZG9uZTsgaSsrICkKPiAtICAgICAgICB7
Cj4gLSAgICAgICAgICAgIHVuc2lnbmVkIGludCBqOwo+IC0gICAgICAgICAgICB1aW50MzJfdCBz
ejsKPiAtICAgICAgICAgICAgY2hhciAqc3RyOwo+IC0KPiAtICAgICAgICAgICAgc3ogPSBsZW5b
aV07Cj4gLSAgICAgICAgICAgIHN0ciA9IG5hbWUgKyAoaSAqIFhFTl9MSVZFUEFUQ0hfTkFNRV9T
SVpFKTsKPiAtICAgICAgICAgICAgZm9yICggaiA9IHN6OyBqIDwgWEVOX0xJVkVQQVRDSF9OQU1F
X1NJWkU7IGorKyApCj4gLSAgICAgICAgICAgICAgICBzdHJbal0gPSAnXDAnOwo+IC0KPiAtICAg
ICAgICAgICAgcHJpbnRmKCIlLTQwc3wgJXMiLCBzdHIsIHN0YXRlMnN0cihpbmZvW2ldLnN0YXRl
KSk7Cj4gLSAgICAgICAgICAgIGlmICggaW5mb1tpXS5yYyApCj4gLSAgICAgICAgICAgICAgICBw
cmludGYoIiAoJWQsICVzKVxuIiwgLWluZm9baV0ucmMsIHN0cmVycm9yKC1pbmZvW2ldLnJjKSk7
Cj4gLSAgICAgICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAgIHB1dHMoIiIpOwo+IC0gICAg
ICAgIH0KPiAtICAgICAgICBpZHggKz0gZG9uZTsKPiAtICAgIH0gd2hpbGUgKCBsZWZ0ICk7Cj4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IGRvbmU7IGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgY2hh
ciAqbmFtZV9zdHIgPSBuYW1lICsgbmFtZV9vZmY7Cj4gKwo+ICsgICAgICAgIHByaW50ZigiJS00
MC4qc3wgJXMiLCBsZW5baV0sIG5hbWVfc3RyLCBzdGF0ZTJzdHIoaW5mb1tpXS5zdGF0ZSkpOwo+
ICsgICAgICAgIGlmICggaW5mb1tpXS5yYyApCj4gKyAgICAgICAgICAgIHByaW50ZigiICglZCwg
JXMpXG4iLCAtaW5mb1tpXS5yYywgc3RyZXJyb3IoLWluZm9baV0ucmMpKTsKPiArICAgICAgICBl
bHNlCj4gKyAgICAgICAgICAgIHB1dHMoIiIpOwo+ICsKPiArICAgICAgICBuYW1lX29mZiArPSBs
ZW5baV07Cj4gKyAgICB9Cj4gICAKPiArZXJyb3I6Cj4gKyAgICBmcmVlKGxlbik7Cj4gK2Vycm9y
X2xlbjoKPiAgICAgICBmcmVlKG5hbWUpOwo+ICtlcnJvcl9uYW1lOgo+ICAgICAgIGZyZWUoaW5m
byk7Cj4gLSAgICBmcmVlKGxlbik7Cj4gICAgICAgcmV0dXJuIHJjOwo+ICAgfQo+ICAgI3VuZGVm
IE1BWF9MRU4KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21t
b24vbGl2ZXBhdGNoLmMKPiBpbmRleCBmODhjZjNiYzczLi5mNDg2Y2IzMDIxIDEwMDY0NAo+IC0t
LSBhL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKPiArKysgYi94ZW4vY29tbW9uL2xpdmVwYXRjaC5j
Cj4gQEAgLTExNjMsNyArMTE2Myw2IEBAIHN0YXRpYyBpbnQgbGl2ZXBhdGNoX2xpc3Qoc3RydWN0
IHhlbl9zeXNjdGxfbGl2ZXBhdGNoX2xpc3QgKmxpc3QpCj4gICAKPiAgICAgICBpZiAoIGxpc3Qt
Pm5yICYmCj4gICAgICAgICAgICAoIWd1ZXN0X2hhbmRsZV9va2F5KGxpc3QtPnN0YXR1cywgbGlz
dC0+bnIpIHx8Cj4gLSAgICAgICAgICAhZ3Vlc3RfaGFuZGxlX29rYXkobGlzdC0+bmFtZSwgWEVO
X0xJVkVQQVRDSF9OQU1FX1NJWkUgKiBsaXN0LT5ucikgfHwKPiAgICAgICAgICAgICAhZ3Vlc3Rf
aGFuZGxlX29rYXkobGlzdC0+bGVuLCBsaXN0LT5ucikpICkKPiAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gICAKPiBAQCAtMTE3NCwyMyArMTE3MywzNSBAQCBzdGF0aWMgaW50IGxpdmVwYXRj
aF9saXN0KHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9saXN0ICpsaXN0KQo+ICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiAgICAgICB9Cj4gICAKPiArICAgIGxpc3QtPm5hbWVfdG90YWxf
c2l6ZSA9IDA7Cj4gICAgICAgaWYgKCBsaXN0LT5uciApCj4gICAgICAgewo+ICsgICAgICAgIHVp
bnQ2NF90IG5hbWVfb2Zmc2V0ID0gMDsKPiArCj4gICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50
cnkoIGRhdGEsICZwYXlsb2FkX2xpc3QsIGxpc3QgKQo+ICAgICAgICAgICB7Cj4gLSAgICAgICAg
ICAgIHVpbnQzMl90IGxlbjsKPiArICAgICAgICAgICAgdWludDMyX3QgbmFtZV9sZW47Cj4gICAK
PiAgICAgICAgICAgICAgIGlmICggbGlzdC0+aWR4ID4gaSsrICkKPiAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKPiAgIAo+ICAgICAgICAgICAgICAgc3RhdHVzLnN0YXRlID0gZGF0YS0+c3Rh
dGU7Cj4gICAgICAgICAgICAgICBzdGF0dXMucmMgPSBkYXRhLT5yYzsKPiAtICAgICAgICAgICAg
bGVuID0gc3RybGVuKGRhdGEtPm5hbWUpICsgMTsKPiArCj4gKyAgICAgICAgICAgIG5hbWVfbGVu
ID0gc3RybGVuKGRhdGEtPm5hbWUpICsgMTsKPiArICAgICAgICAgICAgbGlzdC0+bmFtZV90b3Rh
bF9zaXplICs9IG5hbWVfbGVuOwo+ICsKPiArICAgICAgICAgICAgaWYgKCAhZ3Vlc3RfaGFuZGxl
X3N1YnJhbmdlX29rYXkobGlzdC0+bmFtZSwgbmFtZV9vZmZzZXQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbWVfb2Zmc2V0ICsgbmFtZV9sZW4gLSAx
KSApCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiAr
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICB9Cj4gICAKPiAgICAgICAgICAg
ICAgIC8qIE4uQi4gJ2lkeCcgIT0gJ2knLiAqLwo+IC0gICAgICAgICAgICBpZiAoIF9fY29weV90
b19ndWVzdF9vZmZzZXQobGlzdC0+bmFtZSwgaWR4ICogWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkUs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT5uYW1lLCBs
ZW4pIHx8Cj4gLSAgICAgICAgICAgICAgICBfX2NvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KGxpc3QtPmxl
biwgaWR4LCAmbGVuLCAxKSB8fAo+ICsgICAgICAgICAgICBpZiAoIF9fY29weV90b19ndWVzdF9v
ZmZzZXQobGlzdC0+bmFtZSwgbmFtZV9vZmZzZXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkYXRhLT5uYW1lLCBuYW1lX2xlbikgfHwKPiArICAgICAgICAgICAg
ICAgIF9fY29weV90b19ndWVzdF9vZmZzZXQobGlzdC0+bGVuLCBpZHgsICZuYW1lX2xlbiwgMSkg
fHwKPiAgICAgICAgICAgICAgICAgICBfX2NvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KGxpc3QtPnN0YXR1
cywgaWR4LCAmc3RhdHVzLCAxKSApCj4gICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAg
ICAgcmMgPSAtRUZBVUxUOwo+IEBAIC0xMTk4LDExICsxMjA5LDE5IEBAIHN0YXRpYyBpbnQgbGl2
ZXBhdGNoX2xpc3Qoc3RydWN0IHhlbl9zeXNjdGxfbGl2ZXBhdGNoX2xpc3QgKmxpc3QpCj4gICAg
ICAgICAgICAgICB9Cj4gICAKPiAgICAgICAgICAgICAgIGlkeCsrOwo+ICsgICAgICAgICAgICBu
YW1lX29mZnNldCArPSBuYW1lX2xlbjsKPiAgIAo+ICAgICAgICAgICAgICAgaWYgKCAoaWR4ID49
IGxpc3QtPm5yKSB8fCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkKPiAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgICAgfQo+ICAgICAgIH0KPiArICAgIGVsc2UKPiArICAgIHsK
PiArICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KCBkYXRhLCAmcGF5bG9hZF9saXN0LCBsaXN0
ICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGxpc3QtPm5hbWVfdG90YWxfc2l6ZSArPSBz
dHJsZW4oZGF0YS0+bmFtZSkgKyAxOwo+ICsgICAgICAgIH0KPiArICAgIH0KPiAgICAgICBsaXN0
LT5uciA9IHBheWxvYWRfY250IC0gaTsgLyogUmVtYWluaW5nIGFtb3VudC4gKi8KPiAgICAgICBs
aXN0LT52ZXJzaW9uID0gcGF5bG9hZF92ZXJzaW9uOwo+ICAgICAgIHNwaW5fdW5sb2NrKCZwYXls
b2FkX2xvY2spOwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94
ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiBpbmRleCAzMzVlMTkzNzEyLi5iODY4MDRiN2E2
IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+IEBAIC05MjYsMTAgKzkyNiwxMSBAQCBzdHJ1Y3QgeGVu
X3N5c2N0bF9saXZlcGF0Y2hfZ2V0IHsKPiAgICAqCj4gICAgKiBJZiB0aGUgaHlwZXJjYWxsIHJl
dHVybnMgYW4gcG9zaXRpdmUgbnVtYmVyLCBpdCBpcyB0aGUgbnVtYmVyICh1cCB0byBgbnJgKQo+
ICAgICogb2YgdGhlIHBheWxvYWRzIHJldHVybmVkLCBhbG9uZyB3aXRoIGBucmAgdXBkYXRlZCB3
aXRoIHRoZSBudW1iZXIgb2YgcmVtYWluaW5nCj4gLSAqIHBheWxvYWRzLCBgdmVyc2lvbmAgdXBk
YXRlZCAoaXQgbWF5IGJlIHRoZSBzYW1lIGFjcm9zcyBoeXBlcmNhbGxzLiBJZiBpdAo+IC0gKiB2
YXJpZXMgdGhlIGRhdGEgaXMgc3RhbGUgYW5kIGZ1cnRoZXIgY2FsbHMgY291bGQgZmFpbCkuIFRo
ZSBgc3RhdHVzYCwKPiAtICogYG5hbWVgLCBhbmQgYGxlbmAnIGFyZSB1cGRhdGVkIGF0IHRoZWly
IGRlc2lnbmVkIGluZGV4IHZhbHVlIChgaWR4YCkgd2l0aAo+IC0gKiB0aGUgcmV0dXJuZWQgdmFs
dWUgb2YgZGF0YS4KPiArICogcGF5bG9hZHMsIGB2ZXJzaW9uYCB1cGRhdGVkIChpdCBtYXkgYmUg
dGhlIHNhbWUgYWNyb3NzIGh5cGVyY2FsbHMuIElmIGl0IHZhcmllcwo+ICsgKiB0aGUgZGF0YSBp
cyBzdGFsZSBhbmQgZnVydGhlciBjYWxscyBjb3VsZCBmYWlsKSBhbmQgdGhlIG5hbWVfdG90YWxf
c2l6ZQo+ICsgKiBjb250YWluaW5nIHRvdGFsIHNpemUgb2YgdHJhbnNmZXJlZCBkYXRhIGZvciB0
aGUgYXJyYXkuCj4gKyAqIFRoZSBgc3RhdHVzYCwgYG5hbWVgLCBgbGVuYCBhcmUgdXBkYXRlZCBh
dCB0aGVpciBkZXNpZ25lZCBpbmRleCB2YWx1ZSAoYGlkeGApCj4gKyAqIHdpdGggdGhlIHJldHVy
bmVkIHZhbHVlIG9mIGRhdGEuCj4gICAgKgo+ICAgICogSWYgdGhlIGh5cGVyY2FsbCByZXR1cm5z
IEUyQklHIHRoZSBgbnJgIGlzIHRvbyBiaWcgYW5kIHNob3VsZCBiZQo+ICAgICogbG93ZXJlZC4g
VGhlIHVwcGVyIGxpbWl0IG9mIGBucmAgaXMgbGVmdCB0byB0aGUgaW1wbGVtZW50aW9uLgo+IEBA
IC05NTIsMTEgKzk1MywxMyBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfbGlzdCB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtb3VudCBv
ZiBwYXlsb2FkcyBhbmQgdmVyc2lvbi4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgT1VUOiBIb3cgbWFueSBwYXlsb2FkcyBsZWZ0LiAqLwo+ICAgICAg
IHVpbnQzMl90IHBhZDsgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBJTjogTXVzdCBiZSB6
ZXJvLiAqLwo+ICsgICAgdWludDY0X3QgbmFtZV90b3RhbF9zaXplOyAgICAgICAgICAgICAgIC8q
IE9VVDogVG90YWwgc2l6ZSBvZiBhbGwgdHJhbnNmZXIgbmFtZXMgKi8KPiAgICAgICBYRU5fR1VF
U1RfSEFORExFXzY0KHhlbl9saXZlcGF0Y2hfc3RhdHVzX3QpIHN0YXR1czsgIC8qIE9VVC4gTXVz
dCBoYXZlIGVub3VnaAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzcGFjZSBhbGxvY2F0ZSBmb3IgbnIgb2YgdGhlbS4gKi8KPiAgICAgICBYRU5fR1VF
U1RfSEFORExFXzY0KGNoYXIpIG5hbWU7ICAgICAgICAgLyogT1VUOiBBcnJheSBvZiBuYW1lcy4g
RWFjaCBtZW1iZXIKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBNVVNUIFhFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFIGluIHNpemUuCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVzdCBoYXZlIG5yIG9mIHRoZW0u
ICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF5
IGhhdmUgYW4gYXJiaXRyYXJ5IGxlbmd0aCB1cCB0bwo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFIGJ5dGVzLiBN
dXN0IGhhdmUKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBuciBvZiB0aGVtLiAqLwo+ICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQodWludDMyKSBsZW47
ICAgICAgICAvKiBPVVQ6IEFycmF5IG9mIGxlbmd0aHMgb2YgbmFtZSdzLgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNdXN0IGhhdmUgbnIgb2YgdGhl
bS4gKi8KPiAgIH07Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
