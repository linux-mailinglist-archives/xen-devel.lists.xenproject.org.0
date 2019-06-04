Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0189343AD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 12:05:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY6H8-0003jc-Go; Tue, 04 Jun 2019 10:02:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY6H7-0003jV-HG
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 10:02:37 +0000
X-Inumbo-ID: dfe06f72-86af-11e9-b283-eb64f28c02d0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfe06f72-86af-11e9-b283-eb64f28c02d0;
 Tue, 04 Jun 2019 10:02:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 04:02:33 -0600
Message-Id: <5CF641B70200007800234F64@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 04:02:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <5CF637250200007800234EFB@prv1-mh.provo.novell.com>
 <05b9bd00-8202-38e4-3207-883d3d1d5c10@arm.com>
In-Reply-To: <05b9bd00-8202-38e4-3207-883d3d1d5c10@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDExOjU3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgoK
PiAKPiBPbiA2LzQvMTkgMTA6MTcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4w
Ni4xOSBhdCAxMTowMSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDYvNC8x
OSA4OjA2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAwMy4wNi4xOSBhdCAxOTox
NSwgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBJdCB0dXJucyBvdXQg
dGhhdCB0aGUgZmlyc3QgY29tbWl0IHRoYXQgZmFpbHMgdG8gYm9vdCBvbiByb2NoZXN0ZXIgaXMK
Pj4+Pj4gICAgIGUyMDJmZWI3MTMgeGVuL2NtZGxpbmU6IEZpeCBidWdneSBzdHJuY21wKHMsIExJ
VEVSQUwsIHNzIC0gcykgY29uc3RydWN0Cj4+Pj4+IChldmVuIHdpdGggdGhlICJlYjhhY2JhODJh
IHhlbjogRml4IGJhY2twb3J0IG9mIC4uIiBhcHBsaWVkKQo+Pj4+Cj4+Pj4gTm93IHRoYXQncyBw
YXJ0aWN1bGFybHkgb2RkIGEgcmVncmVzc2lvbiBjYW5kaWRhdGUuIEl0IGRvZXNuJ3QKPj4+PiB0
b3VjaCBhbnkgQXJtIGNvZGUgYXQgYWxsIChub3IgZG9lcyB0aGUgZml4dXAgY29tbWl0KS4gQW5k
IHRoZQo+Pj4+IGNvbW1vbiBjb2RlIGNoYW5nZXMgZG9uJ3QgbG9vayAicmlza3kiIGVpdGhlcjsg
dGhlIG9uZSB0aGluZyB0aGF0Cj4+Pj4ganVtcHMgb3V0IGFzIHRoZSBtb3N0IGxpa2VseSBvZiBh
bGwgdGhlIHVubGlrZWx5IGNhbmRpZGF0ZXMgd291bGQKPj4+PiBzZWVtIHRvIGJlIHRoZSB4ZW4v
Y29tbW9uL2VmaS9ib290LmMgY2hhbmdlLCBidXQgaWYgdGhlcmUgd2FzCj4+Pj4gYSBwcm9ibGVt
IHRoZXJlIHRoZW4gdGhlIEVGSSBib290IG9uIEFybSB3b3VsZCBiZSBsYXRlbnRseQo+Pj4+IGJy
b2tlbiBpbiBvdGhlciB3YXlzIGFzIHdlbGwuIFBsdXMsIG9mIGNvdXJzZSwgeW91IHNheSB0aGF0
IHRoZQo+Pj4+IHNhbWUgY2hhbmdlIGlzIG5vIHByb2JsZW0gb24gNC4xMi4KPj4+Pgo+Pj4+IE9m
IGNvdXJzZSB0aGUgY29tbWl0IGl0c2VsZiBjb3VsZCBiZSBmdXJ0aGVyICJiaXNlY3RlZCIgLSBh
bGwKPj4+PiBjaGFuZ2VzIG90aGVyIHRoYW4gdGhlIGludHJvZHVjdGlvbiBvZiBjbWRsaW5lX3N0
cmNtcCgpIGFyZQo+Pj4+IGNvbXBsZXRlbHkgaW5kZXBlbmRlbnQgb2Ygb25lIGFub3RoZXIuCj4+
Pgo+Pj4gSSB0aGluayB0aGlzIGlzIGp1c3QgYSByZWQtaGVycmluZy4gVGhlIGNvbW1pdCBpcyBw
cm9iYWJseSBtb2RpZnlpbmcKPj4+IGVub3VnaCB0aGUgbGF5b3V0IG9mIFhlbiB0aGF0IFRMQiBj
b25mbGljdCB3aWxsIGFwcGVhci4KPj4+Cj4+PiBBbnRob255IHNhaWQgYmFja3BvcnRpbmcgMDBj
OTZkNzc0MiAieGVuL2FybTogbW06IFNldC11cCBwYWdlIHBlcm1pc3Npb24KPj4+IGZvciBYZW4g
bWFwcGluZ3MgZWFybGllciBvbiIgbWFrZXMgc3RhZ2luZy00LjExIGJvb3RzLiBUaGlzIHBhdGNo
Cj4+PiByZW1vdmVzIHNvbWUgb2YgdGhlIHBvdGVudGlhbCBjYXVzZSBvZiBUTEIgY29uZmxpY3Qu
Cj4+Pgo+Pj4gSSBoYXZlbid0IHN1Z2dlc3RlZCBhIGJhY2twb3J0IG9mIHRoaXMgcGF0Y2ggc28g
ZmFyLCBiZWNhdXNlIHRoZXJlIGFyZQo+Pj4gc3RpbGwgVExCIGNvbmZsaWN0IHBvc3NpYmxlIHdp
dGhpbiB0aGUgZnVuY3Rpb24gbW9kaWZpZWQuIEl0IG1pZ2h0IGFsc28KPj4+IGJlIHBvc3NpYmxl
IHRoYXQgaXQgZXhwb3NlcyBtb3JlIG9mIFRMQiBjb25mbGljdCBhcyBtb3JlIHdvcmsgaW4gWGVu
IGlzCj4+PiBuZWVkZWQgKHNlZSBteSBNTS1QQVJUbiBzZXJpZXMpLgo+Pj4KPj4+IEkgZG9uJ3Qg
a25vdyB3aGV0aGVyIGJhY2twb3J0aW5nIHRoaXMgcGF0Y2ggaXMgd29ydGggaXQgY29tcGFyZSB0
byB0aGUKPj4+IHJpc2sgaXQgaW50cm9kdWNlcy4KPj4gCj4+IFdlbGwsIGlmIHlvdSBkb24ndCBi
YWNrcG9ydCB0aGlzLCB3aGF0J3MgdGhlIGFsdGVybmF0aXZlIHJvYWQgdG93YXJkcyBhCj4+IHNv
bHV0aW9uIGhlcmU/IEknbSBhZnJhaWQgdGhlIHR3byBvZiB5b3Ugd2lsbCBuZWVkIHRvIGRlY2lk
ZSBvbmUgd2F5IG9yCj4+IGFub3RoZXIuCj4gCj4gVGhlICJ0d28iIGJlaW5nPwoKWW91IGFuZCBT
dGVmYW5vLCBhcyB3YXMgcmVmbGVjdGVkIGJ5IHRoZSBUbzogbGlzdCBvZiBteSBlYXJsaWVyIHJl
cGx5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
