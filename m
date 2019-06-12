Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640441E78
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 10:01:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hay9i-0004G9-Ql; Wed, 12 Jun 2019 07:58:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hay9h-0004G4-4F
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 07:58:49 +0000
X-Inumbo-ID: e5cb73d0-8ce7-11e9-a647-93cd77e1b9ae
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5cb73d0-8ce7-11e9-a647-93cd77e1b9ae;
 Wed, 12 Jun 2019 07:58:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 01:58:42 -0600
Message-Id: <5D00B0AF020000780023757D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 01:58:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <5942544893366d8ff51fdf603fd13f18@sslemail.net>
 <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
 <492c0277-7413-d306-b350-58167a526486@mxnavi.com>
 <5D009CE602000078002374B3@prv1-mh.provo.novell.com>
 <4deea016-0fa9-0bf1-f570-9c0dd6679761@mxnavi.com>
In-Reply-To: <4deea016-0fa9-0bf1-f570-9c0dd6679761@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDA5OjM2LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cgo+IE9uIDYvMTIvMTkgMTQ6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMi4wNi4x
OSBhdCAwMjoyMywgPGNoZW5iYW9kb25nQG14bmF2aS5jb20+IHdyb3RlOgo+Pj4gT24gNi8xMS8x
OSAyMjowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTEuMDYuMTkgYXQgMDg6MDIs
IDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L3hlbi5sZHMuUwo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+Pj4+IEBAIC0y
NDAsMTIgKzI0MCwxNCBAQCBTRUNUSU9OUwo+Pj4+PiAgICAgICAgICAgICooLmFsdGluc3RydWN0
aW9ucykKPj4+Pj4gICAgICAgICAgICBfX2FsdF9pbnN0cnVjdGlvbnNfZW5kID0gLjsKPj4+Pj4g
ICAgCj4+Pj4+ICsjaWYgZGVmaW5lZChDT05GSUdfQ09WRVJBR0UpCj4+Pj4+ICAgICAgICAgICAu
ID0gQUxJR04oOCk7Cj4+Pj4+ICAgICAgICAgICBfX2N0b3JzX3N0YXJ0ID0gLjsKPj4+Pj4gICAg
ICAgICAgICooLmN0b3JzKQo+Pj4+PiAgICAgICAgICAgKiguaW5pdF9hcnJheSkKPj4+Pj4gICAg
ICAgICAgICooU09SVCguaW5pdF9hcnJheS4qKSkKPj4+Pj4gICAgICAgICAgIF9fY3RvcnNfZW5k
ID0gLjsKPj4+Pj4gKyNlbmRpZgo+Pj4+IEhvdyBpcyB0aGlzIChvbmx5KSBjb3ZlcmFnZSByZWxh
dGVkPyBBbmQgaG93IGlzIG1ha2luZyB0aGlzIGNvbmRpdGlvbmFsCj4+Pj4gZ29pbmcgdG8gaGVs
cCBpbiBhbnkgd2F5Pwo+Pj4gSGVsbG8gSmFuLAo+Pj4KPj4+IFdoZW4gaSByZWFkIHRoZSBjb2Rl
ICdpbml0X2NvbnN0cnVjdG9ycygpJywgaSB3YW50IHRvIHVuZGVyc3RhbmQgd2hlbgo+Pj4gaXQn
cyB1c2VkLgo+Pj4KPj4+IEkgY2FuIG5vdCBmaW5kIGFueSBoZWxwZXIgbWFjcm9zIGxpa2UgJ19f
aW5pdCcgaW4gaW5pdC5oLCBwdXQgdGhpbmdzIGluCj4+PiB0aGlzIHNlY3Rpb24uCj4+Pgo+Pj4g
QWxzbyBydW4gdW5kZXIgYXJtIGZvdW5kYXRpb24gcGxhdGZvcm0sIHRoZSBzZWN0aW9uIGlzIGVt
cHR5Lgo+Pj4KPj4+IFNvIGkgY2hlY2sgY29tbWl0IGhpc3RvcnkgYW5kIGZvdW5kIGl0J3MgY29t
bWl0IGxvZ3M6IGl0IGlzIGNvdmVyYWdlCj4+PiByZWxhdGVkLgo+Pj4KPj4+IEFuZCBjb21waWxl
ZCB3aXRoIENPTkZJR19DT1ZFUkFHRSBlbmFibGVkLCB0aGlzIHNlY3Rpb24gaXMgbm90IGVtcHR5
Cj4+PiBhbnltb3JlLgo+Pj4KPj4+IFNvIHRoZSBwYXRjaCBtYWlubHkgd2FudCB0byBjbGFyaWZ5
IHRoZSBjb2RlIGlzIGNvdmVyYWdlIHJlbGF0ZWQsCj4+Pgo+Pj4gd2hpY2ggd2FudCB0byBoZWxw
IG5ld2NvbWVyIGVhc2lseSB1bmRlcnN0YW5kIHRoaXMgY29kZS4KPj4+Cj4+PiBBbSBpIG1pc3Vu
ZGVyc3RhbmRpbmcgaGVyZT8KPj4gVGhlIGNvZGUgbWF5IGhhdmUgYmVlbiBfaW50cm9kdWNlZF8g
Zm9yIGNvdmVyYWdlLCBidXQgYXJlIHlvdQo+PiB3aWxsaW5nIHRvIGd1YXJhbnRlZSBpdCdzIGNv
dmVyYWdlLW9ubHk/IFBsdXMgLSB3aGF0IGRvZXMgcmVtb3ZpbmcKPj4gYW4gZW1wdHkgc2VjdGlv
biBidXkgeW91Pwo+IAo+IEN1cnJlbnRseSBzZWVtcyB0cnVlLCBidXQgbm90IHN1cmUgYWJvdXQg
dGhlIGZ1dHVyZSwgY2FuIG5vdCBndWFyYW50ZWUuCj4gCj4gUGVyc29uYWxseSBndWVzcyB0aGlz
IHNob3VsZCBub3QgYmUgdXNlZCBieSB4ZW4sIGJ1dCB1c2UgX19pbml0X2NhbGwoZm4pIAo+IGxp
a2UgaW4gaW5pdC5oLgo+IAo+IE15IHB1cnBvc2UgaXMgdG8gY2xhcmlmeSB0aGUgY29kZSBpcyBj
b3ZlcmFnZSByZWxhdGVkKGF0IGxlYXN0IGN1cnJlbnRseSAKPiBpcykuCj4gCj4gSWYgeW91IGFy
ZSB1bmhhcHB5IHdpdGggaXQgdGhpcyB3YXksIGhvdyBhYm91dCBqdXN0IGFkZCBhIGNvbW1lbnQs
IAo+IHNvbWV0aGluZyBsaWtlOgo+IAo+ICsvKiBjdXJyZW50bHkgb25seSB1c2VkIGJ5IGNvZGUg
Y292ZXJhZ2UgKi8KPiAgICB2b2lkIF9faW5pdCBpbml0X2NvbnN0cnVjdG9ycyh2b2lkKQoKSSdk
IHByZWZlciBpZiB0aGUgZW50aXJlIHBhdGNoIHdhcyBkcm9wcGVkLCB1bmxlc3MgdGhlcmUgcmVh
bGx5IHdhcwphIGNsZWFyIChhbmQgY2xlYXJseSBzcGVsbGVkIG91dCkgZ2Fpbi4gQWRkaW5nIGEg
Y29tbWVudCBsaWtlIHlvdQpzdWdnZXN0IG9ubHkgY2FsbHMgZm9yIGl0IGdvaW5nIHN0YWxlIGF0
IHNvbWUgcG9pbnQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
