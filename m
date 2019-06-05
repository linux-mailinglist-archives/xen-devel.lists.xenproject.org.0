Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E235AA4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:46:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTOP-0006zy-G0; Wed, 05 Jun 2019 10:43:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYTOO-0006zp-NP
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:43:40 +0000
X-Inumbo-ID: c7745560-877e-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c7745560-877e-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:43:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 04:43:38 -0600
Message-Id: <5CF79CD8020000780023574C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 04:43:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-12-julien.grall@arm.com>
In-Reply-To: <20190603160350.29806-12-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 11/14] xen/x86: p2m: Remove duplicate
 error message in p2m_pt_audit_p2m()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IHAybV9wdF9hdWRpdF9wMm0oKSBoYXMgb25lIHBsYWNlIHdoZXJlIHRoZSBzYW1lIG1lc3NhZ2Ug
bWF5IGJlIHByaW50ZWQKPiB0d2ljZSB2aWEgcHJpbnRrIGFuZCBQMk1fUFJJTlRLLgo+IAo+IFJl
bW92ZSB0aGUgb25lIHByaW50ZWQgdXNpbmcgcHJpbnRrIHRvIHN0YXkgY29uc2lzdGVudCB3aXRo
IHRoZSByZXN0IG9mCj4gdGhlIGNvZGUuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVm
bG93IHRoZSBmb3JtYXQgb2YgUDJNX1BSSU5USy4KCkhtbSwgeWVzLCBidXQgLi4uCgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQu
Ywo+IEBAIC0xMDQxLDkgKzEwNDEsOCBAQCBsb25nIHAybV9wdF9hdWRpdF9wMm0oc3RydWN0IHAy
bV9kb21haW4gKnAybSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCBtMnBmbiAhPSAo
Z2ZuICsgaTIpICkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcG1iYWQrKzsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAy
TV9QUklOVEsoIm1pc21hdGNoOiBnZm4gJSNseCAtPiBtZm4gJSNseCIKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2ZuK2kyLCBtZm4r
aTIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG0ycGZuKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAyTV9QUklOVEsoIm1pc21hdGNoOiBnZm4gJSNs
eCAtPiBtZm4gJSNseCAtPiBnZm4gJSNseFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2ZuICsgaTIsIG1mbiArIGkyLCBtMnBmbik7CgouLi4geW91IHJlLWZs
b3cgYW4gdW5yZWxhdGVkIChidXQgc2ltaWxhcikgb25lIHdoaWxlIC4uLgoKPiBAQCAtMTEwOCw4
ICsxMTA3LDYgQEAgbG9uZyBwMm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBwMm1fZG9tYWluICpwMm0p
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIXAybV9pc19zaGFyZWQodHlwZSkgKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwbWJhZCsrOwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCJtaXNtYXRj
aDogZ2ZuICUjbHggLT4gbWZuICUjbHgiCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2ZuLCBtZm4sIG0ycGZuKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFAyTV9QUklOVEsoIm1pc21hdGNoOiBnZm4gJSNseCAtPiBtZm4gJSNs
eCIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNs
eFxuIiwgZ2ZuLCBtZm4sIG0ycGZuKTsKCi4uLiB5b3UgbGVhdmUgYWxvbmUgdGhpcyBvbmUuIEkg
ZG9uJ3QgbWluZCB0b3VjaGluZyB0aGUgb3RoZXIKb25lLCBidXQgdGhpcyBvbmUgc3VyZWx5IHdh
bnRzIHRvdWNoaW5nIHRoZW4gYXMgd2VsbC4gQW5kIGlmCnlvdSB0b3VjaCB0aGF0IG90aGVyIG9u
ZSwgdGhlbiBJIHRoaW5rIGZvciBjb25zaXN0ZW5jeSB5b3UKc2hvdWxkIGFsc28gdG91Y2ggdGhl
IDNyZCBvbmUgKGJldHdlZW4gdGhlIHR3bykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
