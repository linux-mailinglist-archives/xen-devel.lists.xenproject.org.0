Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773434B770
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZ7C-0007s5-Gs; Wed, 19 Jun 2019 11:50:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdZ7B-0007s0-2R
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:50:57 +0000
X-Inumbo-ID: 7f4377a4-9288-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f4377a4-9288-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 11:50:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 05:50:55 -0600
Message-Id: <5D0A219C0200007800239A00@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 05:50:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-2-roger.pau@citrix.com>
In-Reply-To: <20190619110250.18881-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] xz: use initconst for hypervisor build
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9yIGVsc2UgY2xhbmcgYWRkcyBhIC5pbml0LnJvZGF0YS5jc3Q4IHNlY3Rpb24gdG8gdGhlIHJl
c3VsdGluZyBvYmplY3QKPiBmaWxlLCB3aGljaCBpcyBub3QgaGFuZGxlZCBieSB0aGUgWGVuIGxp
bmtlciBzY3JpcHQgYW5kIGNhbiBlbmQgdXAKPiBiZWZvcmUgdGhlIHRleHQgc2VjdGlvbiB3aGlj
aCBjb250YWlucyB0aGUgaGVhZGVycywgdGh1cyByZXN1bHRpbmcgaW4KPiBhIG5vdCB1c2FibGUg
YmluYXJ5LgoKVG8gYmUgaG9uZXN0IEknZCBwcmVmZXIgaWYgd2Ugd2VudCB3aXRoIGp1c3QgdGhl
IGNoYW5nZSBzdWdnZXN0ZWQKYnkgQW5kcmV3LCBnZXR0aW5nIHRoZSBsaW5rZXIgc2NyaXB0IGJh
Y2sgaW4gbGluZSB3aXRoClNQRUNJQUxfREFUQV9TRUNUSU9OUy4gVGhlIHN0YXRpYyBjb25zdCBp
dGVtcyBpbiB0aGUKZGVjb21wcmVzc29ycyB3ZXJlIGxlZnQgdW4tYW5ub3RhdGVkIGludGVudGlv
bmFsbHksIHNpbmNlIHRoZQoucm9kYXRhLiogdGhpbmdpZXMgd2FudC9uZWVkIHRha2luZyBjYXJl
IG9mIGFueXdheS4gQWZ0ZXIgYWxsIHlvdQp3b24ndCAoSSBob3BlKSBzdWdnZXN0IGFsc28gYW5u
b3RhdGluZyB0aGUgdmFyaW91cyBzdHJpbmcgbGl0ZXJhbHMuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
