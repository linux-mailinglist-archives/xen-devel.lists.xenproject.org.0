Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FD114011
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 12:27:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icpF5-0002Gg-E2; Thu, 05 Dec 2019 11:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icpF3-0002Gb-4V
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 11:24:17 +0000
X-Inumbo-ID: c5059b36-1751-11ea-826c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5059b36-1751-11ea-826c-bc764e2007e4;
 Thu, 05 Dec 2019 11:24:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFB28AEC5;
 Thu,  5 Dec 2019 11:24:14 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190802092227.43058-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <921593c4-0848-b22f-3695-dee94fc60900@suse.com>
Date: Thu, 5 Dec 2019 12:24:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20190802092227.43058-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAxMToyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFN3aXRjaCBybXJy
X2lkZW50aXR5X21hcHBpbmcgdG8gdXNlIGlvbW11X3t1bn1tYXAgaW4gb3JkZXIgdG8KPiBlc3Rh
Ymxpc2ggUk1SUiBtYXBwaW5ncyBmb3IgUFYgZG9tYWlucywgbGlrZSBpdCdzIGRvbmUgaW4KPiBh
cmNoX2lvbW11X2h3ZG9tX2luaXQuIFRoaXMgc29sdmVzIHRoZSBpc3N1ZSBvZiBhIFBWIGhhcmR3
YXJlIGRvbWFpbgo+IG5vdCBnZXR0aW5nIFJNUlIgbWFwcGluZ3MgYmVjYXVzZSB7c2V0L2NsZWFy
fV9pZGVudGl0eV9wMm1fZW50cnkgd2FzCj4gbm90IHByb3Blcmx5IHVwZGF0aW5nIHRoZSBpb21t
dSBwYWdlIHRhYmxlcy4KCkFpdWkgd2Ugc3RpbGwgZGlkbid0IGdldCB0byB0aGUgYm90dG9tIG9m
IHRoaXMuIFRvZ2V0aGVyIHdpdGgKbXkgKG11Y2gpIGVhcmxpZXIgcmVwbHkgSSB0aGluayBJJ2xs
IGRyb3AgdGhpcyBmcm9tIG15IGxpc3QKb2YgcGVuZGluZyBwYXRjaGVzLCB1bmxlc3MgeW91IGlu
ZGljYXRlIG90aGVyd2lzZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
