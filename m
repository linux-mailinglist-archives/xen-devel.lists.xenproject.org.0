Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B821F685
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 16:27:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQupw-0001Of-0V; Wed, 15 May 2019 14:24:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQupv-0001Oa-BR
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 14:24:51 +0000
X-Inumbo-ID: 31fe120c-771d-11e9-ae81-2fa833213028
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31fe120c-771d-11e9-ae81-2fa833213028;
 Wed, 15 May 2019 14:24:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 08:24:48 -0600
Message-Id: <5CDC212F020000780022F4D4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 08:24:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
In-Reply-To: <20190508132403.1454-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
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

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMKPiBAQCAtNDI3LDYgKzQyNyw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGNpX2RldiAqYWxsb2NfcGRldihzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgCj4gdTggYnVzLCB1OCBk
ZXZmbikKPiAgCj4gICAgICBjaGVja19wZGV2KHBkZXYpOwo+ICAgICAgYXBwbHlfcXVpcmtzKHBk
ZXYpOwo+ICsgICAgaW9tbXVfZ3JvdXBfYXNzaWduKHBkZXYpOwo+ICAKPiAgICAgIHJldHVybiBw
ZGV2Owo+ICB9Cj4gQEAgLTEwOTgsNiArMTA5OSw4IEBAIGludCBfX2luaXQgc2Nhbl9wY2lfZGV2
aWNlcyh2b2lkKQo+ICB7Cj4gICAgICBpbnQgcmV0Owo+ICAKPiArICAgIGlvbW11X2dyb3Vwc19p
bml0KCk7Cj4gKwo+ICAgICAgcGNpZGV2c19sb2NrKCk7Cj4gICAgICByZXQgPSBwY2lfc2VnbWVu
dHNfaXRlcmF0ZShfc2Nhbl9wY2lfZGV2aWNlcywgTlVMTCk7Cj4gICAgICBwY2lkZXZzX3VubG9j
aygpOwoKSW4gZnJlZV9wZGV2KCkgeW91IGFsc28gd2FudCB0byByZW1vdmUgYSBkZXZpY2UgZnJv
bSBpdHMgZ3JvdXAuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
