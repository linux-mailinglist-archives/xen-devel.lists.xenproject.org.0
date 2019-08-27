Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DD9EF5F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2dgb-0008FO-80; Tue, 27 Aug 2019 15:47:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2dgZ-0008FE-Lf
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:47:07 +0000
X-Inumbo-ID: ec25ad64-c8e1-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec25ad64-c8e1-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 15:47:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E008B022;
 Tue, 27 Aug 2019 15:47:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
 <20190813105352.32412-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39da49e6-0806-2b9f-2d0f-c6004a487aad@suse.com>
Date: Tue, 27 Aug 2019 17:47:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813105352.32412-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: Drop XEN_DOMCTL_{get,
 set}_machine_address_size
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
Cc: Wei Liu <wl@xen.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDguMjAxOSAxMjo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGZ1bmN0aW9u
YWxpdHkgaXMgb2Jzb2xldGUuICBJdCB3YXMgaW50cm9kdWNlZCBieSBjL3MgNDEyOTYzMTdhMzEg
aW50bwo+IFhlbmQsIGJ1dCB3YXMgbmV2ZXIgZXhwb3NlZCBpbiBsaWJ4bC4KPiAKPiBOb3RoaW5n
IGxpbWl0cyB0aGlzIHRvIFBWIGd1ZXN0cywgYnV0IGl0IG1ha2VzIG5vIHNlbnNlIGZvciBIVk0g
Z3Vlc3RzLgo+IAo+IExvb2tpbmcgdGhyb3VnaCB0aGUgWGVuU2VydmVyIHRlbXBsYXRlcywgdGhp
cyB3YXMgdXNlZCB0byB3b3JrIGFyb3VuZCBidWdzIGluCj4gdGhlIDMyYml0IFJIRUwvQ2VudE9T
IDQuNyBhbmQgNC44IGtlcm5lbHMgKGZpeGVkIGluIDQuOSkgYW5kIFJIRUwvQ2VudE9TL09FTAo+
IDUuMiBhbmQgNS4zIGtlcm5lbHMgKGZpeGVkIGluIDUuNCkuICBSSEVMIDQgYXMgYSBtYWpvciB2
ZXJzaW9uIHdlbnQgb3V0IG9mCj4gc3VwcG9ydCBpbiAyMDE3LCB3aGVyZWFzIHRoZSA1LjIvNS4z
IGtlcm5lbHMgd2VudCBvdXQgb2Ygc3VwcG9ydCB3aGVuIDUuNCB3YXMKPiByZWxlYXNlZCBpbiAy
MDA5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpJIGZpbmQgaXQgYSBsaXR0bGUgc3VycHJpc2luZyB0aGF0IHdlJ3ZlIGdvdCBh
d2F5IHdpdGhvdXQgdGhpcwpiZWluZyBob29rZWQgdXAgaW4gbGlieGwuIEFueXdheSwgeDg2IGh5
cGVydmlzb3IgcGFydHMKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
