Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E895A179229
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:19:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Upc-0003Bw-6z; Wed, 04 Mar 2020 14:17:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9Upb-0003Bq-87
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:17:03 +0000
X-Inumbo-ID: d13bd43e-5e22-11ea-a3ec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d13bd43e-5e22-11ea-a3ec-12813bfff9fa;
 Wed, 04 Mar 2020 14:17:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB63EB04C;
 Wed,  4 Mar 2020 14:17:01 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-11-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1dab093a-51ec-80b7-a566-f2b60f8754e1@suse.com>
Date: Wed, 4 Mar 2020 15:17:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-11-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 10/23] xen/build: run targets csopes,
 tags, .. without Rules.mk
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhvc2UgdGFyZ2V0
cyBtYWtlIHVzZSBvZiAkKGFsbF9zb3VyY2VzKSB3aGljaCBkZXBlbmRzIG9uIFRBUkdFVF9BUkNI
LAo+IHNvIHdlIGp1c3QgbmVlZCB0byBzZXQgVEFSR0VUX0FSQ0ggZWFybGllciBhbmQgb25jZS4K
PiAKPiBYRU5fVEFSR0VUX0FSQ0ggaXNuJ3QgZXhwZWN0ZWQgdG8gY2hhbmdlIGR1cmluZyB0aGUg
YnVpbGQsIHNvCj4gVEFSR0VUX1NVQkFSQ0ggYW5kIFRBUkdFVF9BUkNIIGFyZW4ndCBnb2luZyB0
byBjaGFuZ2UgZWl0aGVyLiBTZXQgdGhlbQo+IG9uY2UgYW5kIGZvciBhbGwgaW4gdGhlIFhlbiBy
b290IE1ha2VmaWxlLiBUaGlzIGFsbG93cyB0byBydW4gbW9yZQo+IHRhcmdldHMgd2l0aG91dCBS
dWxlcy5tay4KPiAKPiBYRU5fVEFSR0VUX0FSQ0ggaXMgYWN0dWFsbHkgY2hhbmdlZCBpbiBhcmNo
L3g4Ni9ib290L2J1aWxkMzIubWssIGJ1dAo+IGl0IGRvZXNuJ3QgdXNlIHRoZSBUQVJHRVRfeyxT
VUJ9QVJDSCB2YXJpYWJsZXMgZWl0aGVyLCBhbmQgZG9lc24ndCB1c2UKPiBSdWxlcy5tayAoaXQg
cmVwbGFjZXMgaXQpLgo+IAo+IFRBUkdFVF97LFNVQn1BUkNIIGFyZSBubyBsb25nZXIgb3ZlcnJp
ZGRlbiBiZWNhdXNlIHRoYXQgd291bGQgaGF2ZQo+IG5vIGVmZmVjdCBvbiB0aGUgdmFsdWVzIHRo
YXQgUnVsZXMubWsgd2lsbCB1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
