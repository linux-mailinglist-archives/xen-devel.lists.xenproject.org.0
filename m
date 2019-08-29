Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CEEA150B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Gon-0008AA-JI; Thu, 29 Aug 2019 09:34:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Gom-00089P-Nw
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:34:12 +0000
X-Inumbo-ID: 285ca40e-ca40-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 285ca40e-ca40-11e9-ac23-bc764e2007e4;
 Thu, 29 Aug 2019 09:34:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 15CE8B05C;
 Thu, 29 Aug 2019 09:33:11 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190829084918.89608-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b17ee631-4cd8-1cd1-746b-9652be42c6d8@suse.com>
Date: Thu, 29 Aug 2019 11:33:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829084918.89608-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Partially revert "x86/mm: Clean IOMMU
 flags from p2m-pt code"
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMDo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC02NDAsOSAr
NjcwLDE3IEBAIHAybV9wdF9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2ZuX3Qg
Z2ZuXywgbWZuX3QgbWZuLAo+ICAgICAgICAgICAmJiAoZ2ZuICsgKDFVTCA8PCBwYWdlX29yZGVy
KSAtIDEgPiBwMm0tPm1heF9tYXBwZWRfcGZuKSApCj4gICAgICAgICAgcDJtLT5tYXhfbWFwcGVk
X3BmbiA9IGdmbiArICgxVUwgPDwgcGFnZV9vcmRlcikgLSAxOwo+ICAKPiArICAgIGlmICggbmVl
ZF9pb21tdV9wdF9zeW5jKHAybS0+ZG9tYWluKSAmJgo+ICsgICAgICAgICAoaW9tbXVfb2xkX2Zs
YWdzICE9IGlvbW11X3B0ZV9mbGFncyB8fCBvbGRfbWZuICE9IG1mbl94KG1mbikpICkKPiArICAg
ICAgICAgICAgcmMgPSBpb21tdV9wdGVfZmxhZ3MgPwo+ICsgICAgICAgICAgICAgICAgaW9tbXVf
bGVnYWN5X21hcChkLCBfZGZuKGdmbiksIG1mbiwgcGFnZV9vcmRlciwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW9tbXVfcHRlX2ZsYWdzKSA6Cj4gKyAgICAgICAgICAgICAg
ICBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm4pLCBwYWdlX29yZGVyKTsKCkluZGVudGF0
aW9uIG9mIHRoZSBpZigpIGJvZHkgaXMgb25lIGxldmVsIHRvbyBkZWVwLiBXaXRoIHRoaXMKY29y
cmVjdGVkIChlYXN5IGVub3VnaCB0byBkbyB3aGlsZSBjb21taXR0aW5nKQpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
