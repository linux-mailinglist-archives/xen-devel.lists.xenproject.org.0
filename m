Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F111BC3
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCyt-0005AV-KV; Thu, 02 May 2019 14:46:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMCys-0005AQ-5A
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:46:38 +0000
X-Inumbo-ID: 1661350e-6ce9-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1661350e-6ce9-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:46:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 08:46:36 -0600
Message-Id: <5CCB02C7020000780022B53C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 08:46:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <20190409120324.13940-2-aisaila@bitdefender.com>
In-Reply-To: <20190409120324.13940-2-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/3] x86/mm: Introduce
 altp2m_set_entry_by_page_order
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjAzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX2FjY2Vzcy5jCj4gQEAgLTI3OSw3ICsyNzksNyBAQCBpbnQgcDJtX3NldF9hbHRw
Mm1fbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSwK
PiAgICAgICAgICBnZm5fdCBnZm4yID0gX2dmbihnZm5fbCAmIG1hc2spOwo+ICAgICAgICAgIG1m
bl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsKPiAgCj4gLSAgICAgICAgLyogTm90
ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRvIGEgc2hhcmVkIGVudHJ5ICov
Cj4gKwkvKiBOb3RlOiBjdXJyZW50bHkgaXQgaXMgbm90IHNhZmUgdG8gcmVtYXAgdG8gYSBzaGFy
ZWQgZW50cnkgKi8KClN0cmF5IGFuZCBiYWQgKGhhcmQgdGFiKSBjaGFuZ2UuIEJ1dCB5b3UndmUg
YmVlbiBtZWFuaW5nCnRvIHJlLXNlbmQgdGhpcyBhbnl3YXkuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
