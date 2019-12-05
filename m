Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EDE113C3E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 08:22:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iclQX-0004zk-5s; Thu, 05 Dec 2019 07:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iclQW-0004zf-Bh
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 07:19:52 +0000
X-Inumbo-ID: 9fcd66c2-172f-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fcd66c2-172f-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 07:19:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82630B199;
 Thu,  5 Dec 2019 07:19:49 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <fba262641f8233b4b9856cffeeb7a3ad0bad086a.1575477921.git.hongyxia@amazon.com>
 <a4cbdde29f9b879ed1e6fb212eb435c17ef7596e.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <646620da-a705-0ab5-79f9-bafeeba7f7ba@suse.com>
Date: Thu, 5 Dec 2019 08:20:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a4cbdde29f9b879ed1e6fb212eb435c17ef7596e.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxODo1NCwgWGlhLCBIb25neWFuIHdyb3RlOgo+PiBUaGVyZSdzIG5vIG5l
ZWQgZm9yIHRoZSBtYXAvdW5tYXAgZnVuY3Rpb25zIHRvIGhhdmUgYSBfbmV3Cj4+IHN1ZmZpeCwg
aXMgdGhlcmU/Cj4gCj4gSSB0aG91Z2h0IHRoaXMgd2FzIHdlaXJkIGF0IGZpcnN0IGFsc28sIGJ1
dCB3aGF0IEkgZmluZCByZWFsbHkgdXNlZnVsCj4gaXMgdGhhdCB3ZSBjYW4ganVzdCBjaGFuZ2Ug
YWxsIGNhbGwgc2l0ZXMgdG8gdGhlIG5ldyBBUEkgaW4gc21hbGwgc3RlcHMKPiB3aXRob3V0IGJy
ZWFraW5nLiBPdGhlcndpc2Ugd2UgaGF2ZSB0byBtZXJnZSBhIGh1Z2UgYmF0Y2ggb2YKPiBjaGFu
Z2VzIChhcm91bmQgNDAgcGF0Y2hlcykgYXQgb25jZS4KCkJ1dCBteSBjb21tZW50IHdhcyBvbiBm
dW5jdGlvbnMgX25vdF8gaGF2aW5nIGFuICJvbGQiCmVxdWl2YWxlbnQuIEhhdmluZyB0aGUgc3Vm
Zml4IHRoZXJlIGluaXRpYWxseSBtYWtlcyBmb3IgbW9yZQpjb2RlIGNodXJuIHRoYW4gbmVjZXNz
YXJ5IHdoZW4gZmluYWxseSBkcm9wcGluZyB0aGUgc3VmZml4ZXMuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
