Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AE5293F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 12:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfiSq-0005xy-KX; Tue, 25 Jun 2019 10:14:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HbZU=UY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfiSp-0005xt-Ox
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 10:14:11 +0000
X-Inumbo-ID: f9849639-9731-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f9849639-9731-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 10:14:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BC8B360;
 Tue, 25 Jun 2019 03:14:10 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 725343F71E;
 Tue, 25 Jun 2019 03:14:09 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <a6616d8c-af45-c3d7-24e7-f4b513fdc008@citrix.com>
 <5D11EB9A020000780023ADEF@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e9debf0e-f9ad-63d4-7141-76cf67b52a9e@arm.com>
Date: Tue, 25 Jun 2019 11:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5D11EB9A020000780023ADEF@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] UBSAN report in find_next_bit()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjUvMDYvMjAxOSAxMDozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjQuMDYuMTkgYXQgMTg6MjQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4g
QVJNNjQncyBmaW5kX25leHRfYml0KCkgZXhwbGljaXRseSBjb3BlcyB3aXRoIG9mZnNldCA+PSBz
aXplLCBhbmQgd2hpbGUKPj4gSSBkb24ndCBzcGVhayBBUk0gYXNtIHdlbGwgZW5vdWdoIHRvIHdv
cmsgb3V0IHdoZXRoZXIKPj4gX2ZpbmRfZmlyc3RfYml0X2xlKCkgY29wZXMgd2l0aCBvZmZzZXQg
PT0gc2l6ZSwgdGhlIHZnaWMuYyBjb2RlCj4+IGRlZmluaXRlbHkgZXhwZWN0cyBpdCB0byBmdW5j
dGlvbiBpbiB0aGlzIHdheS4KPiAKPiAuLi4gQXJtMzIncyBfZmluZF9uZXh0eyxfemVyb31fYml0
X2xlLiBZb3UndmUgbmFtZWQgdGhlIGlzc3VlIHRoZSB4ODYKPiBsb2dpYyBoYXMuIEFybTMyJ3Ms
IGFmYWljdCwgd2lsbCByZWFkIG9uZSBieXRlIHBhc3QgdGhlIGFycmF5IHdoZW4gb2Zmc2V0Cj4g
YW5kIHNpemUgbWF0Y2ggYW5kIGFyZSBhIG11bHRpcGxlIG9mIDguCgpJdCB0b29rIG1lIGEgYml0
IHRvIGdldCBteSBoZWFkIGFyb3VuZCBhcyB0aGUgY29kZSBpcyBxdWl0ZSBjb252b2x1dGVkLiBC
dXQgSSAKYWdyZWUgd2l0aCB5b3UgaGVyZSwgYXJtMzIgZmluZF8qIGRvZXMgbm90IGNvcGUgd2l0
aCBvZmZzZXQgPT0gc2l6ZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
