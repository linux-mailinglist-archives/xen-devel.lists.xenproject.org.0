Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B77E59E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:00:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7iv-0003dh-87; Mon, 29 Apr 2019 14:57:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL7it-0003db-GI
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 14:57:39 +0000
X-Inumbo-ID: 20babec2-6a8f-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20babec2-6a8f-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 14:57:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 08:57:37 -0600
Message-Id: <5CC710DC020000780022A102@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 08:57:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-3-tamas@tklengyel.com>
In-Reply-To: <20190426172138.14669-3-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 3/4] x86/mem_sharing: enable mem_share
 audit mode only in debug builds
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

Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCj4gQEAgLTI1LDcgKzI1LDkgQEAKPiAgI2luY2x1ZGUg
PHB1YmxpYy9tZW1vcnkuaD4KPiAgCj4gIC8qIEF1ZGl0aW5nIG9mIG1lbW9yeSBzaGFyaW5nIGNv
ZGU/ICovCj4gKyNpZm5kZWYgTkRFQlVHCj4gICNkZWZpbmUgTUVNX1NIQVJJTkdfQVVESVQgMQo+
ICsjZW5kaWYKClNpbmNlIGNvbnN1bWVycyB1c2UgI2lmIChub3QgI2lmZGVmKSwgSSB0aGluayBh
biAjZWxzZSB3b3VsZApiZSBvbiBvcmRlciBoZXJlLCBldmVuIGlmIChJIHRoaW5rKSBub3Qgc3Ry
aWN0bHkgbmVjZXNzYXJ5IHdpdGgKZ2NjLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
