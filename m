Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99012D6FB
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 09:52:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVtKz-0006l1-4W; Wed, 29 May 2019 07:49:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVtKx-0006jW-QO
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 07:49:27 +0000
X-Inumbo-ID: 45989c78-81e6-11e9-84e3-8f411ec680bb
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45989c78-81e6-11e9-84e3-8f411ec680bb;
 Wed, 29 May 2019 07:49:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 01:49:21 -0600
Message-Id: <5CEE397F02000078002334C9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 01:49:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
 <23789.37660.726217.578999@mariner.uk.xensource.com>
In-Reply-To: <23789.37660.726217.578999@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Stable trees (4.6 and 4.7), building on stretch,
 osstest, redux
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
 xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Juergen Gross <jgross@suse.com>, WeiLiu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDIxOjU5LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIFNUQUJMRV0gdG9vbHMvZmlybXdhcmU6IHVw
ZGF0ZSBPVk1GIE1ha2VmaWxlLCAKPiB3aGVuIG5lY2Vzc2FyeSIpOgo+PiBOb3cgZG9uZSwgaW5j
bHVkaW5nIGZvciBzdGFnaW5nLTQuNi4gIDQuNiBpcyBvdXQgb2Ygc2VjdXJpdHkgc3VwcG9ydCwK
Pj4gYnV0IG9zc3Rlc3Qgd2FudHMgdG8gYmUgYWJsZSB0byBidWlsZCA0LjYgc28gdGhhdCBpdCBj
YW4gdGVzdAo+PiBtaWdyYXRpb24gZnJvbSA0LjYgdG8gNC43LCBhbmQgNC43ICppcyogc3RpbGwg
KGp1c3QgYWJvdXQpIGluIHNlY3VyaXR5Cj4+IHN1cHBvcnQuCj4+IAo+PiBJIGV4cGVjdCB0aGUg
NC42IHB1c2ggZ2F0ZSB0byBmYWlsIGFuZCB0byBoYXZlIHRvIGZvcmNlIHB1c2ggaXQuCj4+IAo+
PiBJdCBpcyBhbHNvIHBvc3NpYmxlIHRoYXQgd2Ugd2lsbCBleHBlcmllbmNlIG90aGVyIGJ1aWxk
IGZhbGxvdXQuCj4gCj4gSSBhbSBzdGlsbCBzdHJ1Z2dsaW5nIHdpdGggdGhpcy4gIDQuNyBhbmQg
NC42IHN0aWxsIGRvIG5vdCBidWlsZC4KPiBSaWdodCBub3cgdGhlcmUgYXJlIHR3byBwcm9ibGVt
cyB0aGF0IG5lZWQgdGhvdWdodDoKPiAKPiAKPiAxLiBUaGF0IG9sZCBpcHhlIGlzIGp1c3QgdG9v
IGJhZGx5IGJyb2tlbi4gIEkgc3BlbnQgYSBsb25nIHdoaWxlCj4gdHJ5aW5nIHRvIGJhY2twb3J0
IGNvbXBpbGVyIGZpeGVzIGJ1dCBpdCBpcyB0b3RhbGx5IHJpZGljdWxvdXMuICBJTU8KPiBvdXIg
b25seSBzZW5zaWJsZSBvcHRpb24gaXMgdG8gdXBkYXRlIGF0IGxlYXN0IG9zc3Rlc3QncyBidWls
ZHN4IHRvIGEKPiBtdWNoIG5ld2VyIGlweGUuCj4gCj4gVGhpcyBjb3VsZCBiZSBkb25lIGJ5IGNo
ZXJyeSBwaWNraW5nCj4gICAgICAzOGFiOTliMjZiZjQyOThhMzMxMDVlYzY2ZjNmNmEzZjdlMDVh
MzI2Cj4gICAgICAgIGlweGU6IHVwZGF0ZSB0byBuZXdlciBjb21taXQKPiAod2hpY2ggaXMgZnJv
bSB4ZW4gNC44IGlzaCkgb250byBvdXIgNC43IGFuZCA0LjYgYnJhbmNoZXMuCj4gCj4gSWYgdGhp
cyBpcyBmZWx0IHRvbyBpbnRydXNpdmUsIHRoZW4gSSBjb3VsZCBzb21laG93IG1ha2UgaXQKPiBj
b25kaXRpb25hbCBhbmQgaGF2ZSBvc3N0ZXN0IHVzZSBpdC4gIFRoaXMgaXMgbm90IGVudGlyZWx5
IHRyaXZpYWwKPiBiZWNhdXNlIHdlIGhhdmUgYW4gYWQgaG9jIHBhdGNoIGFwcGxpY2F0aW9uIHRo
aW5nLgoKU2luY2UgdGhlIG5ldyBpcHhlIHNob3VsZCBoYXZlIGJlZW4gcHJvdmVuIHN0YWJsZSBl
bm91Z2ggaW4KdGhlIG5ld2VyIHRyZWVzLCBJIHRoaW5rIGNoZXJyeS1waWNraW5nIHNhaWQgY29t
bWl0IHNob3VsZCBiZQpmaW5lLgoKPiAyLiBodm1sb2FkZXIgZmFpbHMgdG8gYnVpbGQsIEkgdGhp
bmsgYmVjYXVzZSB3ZSBuZWVkCj4gICAgIDc4MjVhZTEyZGYxZjZkNDhjNGQwMDljYmJkZjVhNTVh
ZmYyNzI5MWIKPiAgICAgICBlcnJubzogaW50cm9kdWNlIEVJU0RJUi9FUk9GUy9FTk9URU1QVFkg
dG8gdGhlIEFCSQo+ICAgICAwMzcyMGVhNTQxMzgyYTNjYTgwZWFhZWMyYWExMTkzMmIwM2FhY2Fm
Cj4gICAgICAgZXJybm86IGRlY2xhcmUgYWxpYXNlcyB1c2luZyBYRU5fRVJSTk8oKQo+ICAgICA2
Nzc5MDIwNWRmMjZlN2MzZGZlZWY4YjhlNjQxOTRlYmMyNzkyMjBkCj4gICAgICAgcHVibGljL2Vy
cm5vOiBSZWR1Y2UgY29tcGxleGl0eSBvZiBpbmNsdXNpb24KPiAgICAgMzA1ZTk1N2ZmZWU5NGZj
MDZjNGJhNTNlZjU1NjJmMWI4YzFjNmIwMgo+ICAgICAgIGh2bWxvYWRlcjogdXNlIHhlbi9lcnJu
by5oIHJhdGhlciB0aGFuIHRoZSBob3N0IHN5c3RlbXMgZXJybm8uaAo+IAo+IElzIGJhY2twb3J0
aW5nIHRoYXQgbG90IE9LID8KCkkgdGhpbmsgc28sIHllcywgYWxiZWl0IEknbSBwdXp6bGVkIGhv
dyB0aGV5IHdvdWxkIGVuZCB1cCBiZWluZwpuZWVkZWQuCgo+IFRoZXJlIGFyZSBhbHNvIHNvbWUg
c2ltcGxlIGJhY2twb3J0cyB3ZSBuZWVkOgo+ICAgIGMyYTE3ODY5ZDVkY2Q4NDVkNjQ2YmY0ZGIx
MjJjYWQ3MzU5NmEyYmUKPiAgICAgIGxpYmZzaW1hZ2U6IHJlcGxhY2UgZGVwcmVjYXRlZCByZWFk
ZGlyX3IoKSB3aXRoIHJlYWRkaXIoKQo+ICAgIGI5ZGFmZjlkODExMjg1ZjFlNDA2NjliYzYyMWMy
MjQxNzkzZjdhOTUKPiAgICAgIGxpYnhsOiByZXBsYWNlIGRlcHJlY2F0ZWQgcmVhZGRpcl9yKCkg
d2l0aCByZWFkZGlyKCkKPiAgICA2NjhlNGVkZjkyZmNmN2NiOTI5ZWVkMjIxMDU5YTNlZWIwMjcy
MmMzCj4gICAgICBzdHViZG9tOiBtYWtlIEdNUCBhd2FyZSB0aGF0IGl0J3MgYmVpbmcgY3Jvc3Mt
Y29tcGlsZWQKPiAgICAyZjllYjczYzJlMmQ3ZmRkYThlMjU4NmMyMGY3ZGJkODU2MDAyZWJhCj4g
ICAgICAgc3R1YmRvbTogZml4IHN0dWJkb20tdnRwbSBidWlsZAo+IAo+IAo+IFdpdGggYWxsIG9m
IHRoZSBhYm92ZSwgNC42IGJ1aWxkcyBhZ2Fpbi4gIEkgZ3Vlc3MgNC43IHdpbGwgdG9vLgo+IAo+
IEZpeGluZyB0aGF0IHdpbGwgYWxzbyBwcm9iYWJseSBlbmFibGUgdGhlIDQuOCBwdXNoIGdhdGUg
dG8gcGFzcy4gIEl0Cj4gaXMgY3VycmVudGx5IGJsb2NrZWQgYmVjYXVzZSBpdCB3YW50cyB0byB0
ZXN0IDQuNy0+NC44IG1pZ3JhdGlvbiBhbmQKPiBjYW4ndCBidWlsZCA0LjcuCgpBbmQgc2ltaWxh
cmx5IGluIHR1cm4gZm9yIDQuOSdzIG5lZWQgdG8gaGF2ZSBhIGJ1aWxkaW5nIDQuOCBiYXNlbGlu
ZSwKYWZhaWN0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
