Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD0C0468
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:31:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoPx-0006c1-Bo; Fri, 27 Sep 2019 11:28:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDoPw-0006bv-Ao
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:28:08 +0000
X-Inumbo-ID: e031e810-e119-11e9-9675-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e031e810-e119-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 11:28:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE49AAD4E;
 Fri, 27 Sep 2019 11:28:05 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190927104858.43325-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f048d04-380f-a0e7-468e-1ccf0c7407ca@suse.com>
Date: Fri, 27 Sep 2019 13:28:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927104858.43325-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/iommu: improve logging message
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <Paul.Durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxMjo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFN3aXRjaCB0byB1
c2luZyBwZCBhbmQgYWxzbyBwcmludCB0aGUgcGZuIHRoYXQgZmFpbGVkLgo+IAo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCk5ldmVydGhlbGVzcywgLi4uCgo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2
L2lvbW11LmMKPiBAQCAtMjAwLDggKzIwMCw4IEBAIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9t
bXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUsICZmbHVzaF9mbGFncyk7Cj4g
IAo+ICAgICAgICAgIGlmICggcmMgKQo+IC0gICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5J
TkcgIiBkJWQ6IElPTU1VIG1hcHBpbmcgZmFpbGVkOiAlZFxuIiwKPiAtICAgICAgICAgICAgICAg
ICAgIGQtPmRvbWFpbl9pZCwgcmMpOwo+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5J
TkcgIiVwZDogaWRlbnRpdHkgJXNtYXBwaW5nIG9mICVseCBmYWlsZWQ6ICVkXG4iLAo+ICsgICAg
ICAgICAgICAgICAgICAgZCwgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSA/ICJJT01NVSAiIDog
IiIsIHBmbiwgcmMpOwoKLi4uIGhhdmUgeW91IG9ic2VydmVkIHRoaXMgZ2V0dGluZyBsb2dnZWQ/
IElmIHNvLCBob3cgbWFueSBvZiB0aGVtCmRpZCB5b3Ugc2VlPyBJT1cgSSB3b25kZXIgd2hldGhl
ciBsb2dnaW5nIGV2ZXJ5IG9jY3VycmVuY2Ugb2YgdGhpcwptYXkgYmUgb3Zlcmx5IHZlcmJvc2Uu
CgpBcyBhbiBhc2lkZSBJIGFsc28gdGhpbmsgdGhhdCB3ZSBuZWVkIHRvIHVyZ2VudGx5IG1ha2Ug
dGhpcyB1c2UKbGFyZ2VyIHBhZ2Ugc2l6ZXMgd2hlcmUgc3VpdGFibGUuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
