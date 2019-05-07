Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD4160F2
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 11:30:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNwOo-0007u0-RZ; Tue, 07 May 2019 09:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNwOn-0007tv-F1
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 09:28:33 +0000
X-Inumbo-ID: 740a2678-70aa-11e9-863d-c7e7fd7a030d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 740a2678-70aa-11e9-863d-c7e7fd7a030d;
 Tue, 07 May 2019 09:28:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 03:28:20 -0600
Message-Id: <5CD14FB0020000780022C681@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 03:28:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
 <20190503152142.icdzlax4arik3beg@Air-de-Roger>
 <5CD133A4020000780022C58D@prv1-mh.provo.novell.com>
 <20190507081259.j5odjv3t23ggjims@Air-de-Roger>
In-Reply-To: <20190507081259.j5odjv3t23ggjims@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/9] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDEwOjEyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDAxOjI4OjM2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDMuMDUuMTkgYXQgMTc6MjEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjM6MjBBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+IC0tLQo+PiA+PiBUQkQ6IFRoZSBwcm9wZXIgcmVjb3JkaW5n
IG9mIHRoZSBJUEkgZGVzdGluYXRpb25zIGFjdHVhbGx5IG1ha2VzIHRoZQo+PiA+PiAgICAgIG1v
dmVfY2xlYW51cF9jb3VudCBmaWVsZCByZWR1bmRhbnQuIERvIHdlIHdhbnQgdG8gZHJvcCBpdCwg
YXQgdGhlCj4+ID4+ICAgICAgcHJpY2Ugb2YgYSBmZXcgbW9yZSBDUFUtbWFzayBvcGVyYXRpb25z
Pwo+PiA+IAo+PiA+IEFGQUlDVCB0aGlzIGlzIG5vdCBhIGhvdCBwYXRoLCBzbyBJIHdvdWxkIHJl
bW92ZSB0aGUKPj4gPiBtb3ZlX2NsZWFudXBfY291bnQgZmllbGQgYW5kIGp1c3Qgd2VpZ2h0IHRo
ZSBjcHUgYml0bWFwIHdoZW4gbmVlZGVkLgo+PiAKPj4gRlRSOiBJdCdzIG5vdCBmdWxseSByZWR1
bmRhbnQgLSB0aGUgcGF0Y2ggcmVtb3ZpbmcgaXQgdGhhdCBJIGhhZAo+PiBhZGRlZCB3YXMgYWN0
dWFsbHkgdGhlIHJlYXNvbiBmb3Igc2VlaW5nIHRoZSBBU1NFUlQoKSB0cmlnZ2VyCj4+IHRoYXQg
eW91IGRpZCBhc2sgdG8gYWRkIGluIHBhdGNoIDEuIFRoZSByZWFzb24gaXMgdGhhdCB0aGUgZmll
bGQKPj4gc2VydmVzIGFzIGEgZmxhZyBmb3IgaXJxX21vdmVfY2xlYW51cF9pbnRlcnJ1cHQoKSB3
aGV0aGVyIHRvCj4+IGFjdCBvbiBhbiBJUlEgaW4gdGhlIGZpcnN0IHBsYWNlLiBXaXRob3V0IGl0
LCB0aGUgZnVuY3Rpb24gd2lsbAo+PiBwcmVtYXR1cmVseSBjbGVhbiB1cCB0aGUgdmVjdG9yLCB0
aHVzIGNvbmZ1c2luZyBzdWJzZXF1ZW50Cj4+IGNvZGUgdHJ5aW5nIHRvIGRvIHRoZSBjbGVhbnVw
IHdoZW4gaXQncyBhY3R1YWxseSBkdWUuCj4gCj4gU28gd2VpZ2hpbmcgZGVzYy0+YXJjaC5vbGRf
Y3B1X21hc2sgaXMgbm90IGVxdWl2YWxlbnQgdG8KPiBtb3ZlX2NsZWFudXBfY291bnQ/CgpOb3Qg
ZXhhY3RseSwgbm86IFdoaWxlIHRoZSBmaWVsZCBnZXRzIHNldCBmcm9tIHRoZSBjcHVtYXNrX3dl
aWdodCgpCnJlc3VsdCwgaXQgbWF0dGVyIF93aGVuXyB0aGF0IGhhcHBlbnMuIFByaW9yIHRvIHRo
YXQgcG9pbnQsIHdoYXQgYml0cwphcmUgc2V0IGluIHRoZSBtYXNrIGlzIG9mIG5vIGludGVyZXN0
IHRvIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0KCkuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
