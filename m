Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264442B146
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:27:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVBs9-0001vs-C4; Mon, 27 May 2019 09:24:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVBs7-0001vn-KJ
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:24:47 +0000
X-Inumbo-ID: 43b7ac5a-8061-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 43b7ac5a-8061-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 09:24:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:24:44 -0600
Message-Id: <5CEBACD80200007800232B44@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:24:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
 <5C53012902000000001030F5@prv1-mh.provo.novell.com>
 <5C53012902000078002328D1@prv1-mh.provo.novell.com>
In-Reply-To: <5C53012902000078002328D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH 0/4] x86: further L1TF / XSA-289 guards
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nmanthey@amazon.de, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjAxLjE5IGF0IDE1OjA3LCAgd3JvdGU6Cj4gVGhpcyBnb2VzIGFsb25nc2lkZSBO
b3JiZXJ0J3Mgc2VyaWVzLCBkZWFsaW5nIHdpdGggYSBmZXcgbW9yZQo+IHBsYWNlcyB3aGVyZSBJ
IGhhcHBlbmVkIHRvIGtub3cgKHdpdGhvdXQgYW55IGFuYWx5c2lzIHRvb2xzKQo+IGd1ZXN0IGNv
bnRyb2xsZWQgYXJyYXkgYWNjZXNzZXMgc2l0LiBJJ3ZlIGFkZGl0aW9uYWxseSBhbHNvCj4gY2hl
Y2tlZCBlbXVsLWk4MjU0LmMsIGFuZCBJIHRoaW5rIG5vIGFkanVzdG1lbnRzIGFyZSBuZWVkZWQK
PiB0aGVyZSAodGhlcmUgYXJlIGEgZmV3IHBvc3NpYmxlIG92ZXJydW5zIGJ5IG9uZSwgYnV0IGp1
c3QgbGlrZQo+IGlzIHRoZSBjYXNlIGluIHBhdGNoIDIgSSBkb24ndCB0aGluayB0aGV5IGFyZSBh
Y3R1YWwgaXNzdWVzKS4KPiAKPiAxOiB4ODZlbXVsOiBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQgb2Yg
Ym91bmRzIGFjY2Vzc2VzCgpUaGVyZSB3YXMgYSB2MiBvZiB0aGlzIHNlbnQgc2VwYXJhdGVseS4K
CkphbgoKPiAyOiB4ODYvdk1TSTogYXZvaWQgc3BlY3VsYXRpdmUgb3V0IG9mIGJvdW5kcyBhY2Nl
c3Nlcwo+IDM6IHg4Ni92UElDOiBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQgb2YgYm91bmRzIGFjY2Vz
c2VzCj4gNDogeDg2L3ZMQVBJQzogYXZvaWQgc3BlY3VsYXRpdmUgb3V0IG9mIGJvdW5kcyBhY2Nl
c3Nlcwo+IAo+IErDvHJnZW4sIEkndmUgY29waWVkIHlvdSBhbnl3YXksIGJ1dCBJIGFzc3VtZSB5
b3VyIGdlbmVyYWwKPiBSYWItdW50aWwtUkMzIHdvdWxkIGFwcGx5IHRvIHRoaXMgc2VyaWVzIChh
bmQgcGVyaGFwcyB0bwo+IGZ1cnRoZXIgb25lcywgc2hvdWxkIGFueW9uZSBmaW5kIHRpbWUpIGFz
IG11Y2ggYXMgdG8gTm9yYmVydCdzLgo+IAo+IEphbgo+IAo+IAoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
