Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147E7A50E9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:10:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hNn-0002Uh-E3; Mon, 02 Sep 2019 08:08:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4hNm-0002Uc-3r
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:08:14 +0000
X-Inumbo-ID: cee96cf6-cd58-11e9-ae9f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cee96cf6-cd58-11e9-ae9f-12813bfff9fa;
 Mon, 02 Sep 2019 08:08:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A45EFB008;
 Mon,  2 Sep 2019 08:08:11 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
 <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
 <b074bb1de3366dddbdde8e34703e35d9e6e1eab8.1567195654.git-series.lars.kurth@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <597fbb03-360d-7758-290e-278c6a341e04@suse.com>
Date: Mon, 2 Sep 2019 10:08:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b074bb1de3366dddbdde8e34703e35d9e6e1eab8.1567195654.git-series.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] Add logic to use V section entry in
 THE REST for identifying xen trees
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAyMjowOSwgTGFycyBLdXJ0aCB3cm90ZToKPiBTcGVjaWZpY2FsbHk6Cj4g
KiBNb3ZlIGNoZWNrIHVudGlsIGFmdGVyIHRoZSBNQUlOVEFJTkVSUyBmaWxlIGhhcyBiZWVuIHJl
YWQKPiAqIEFkZCBnZXRfeGVuX21haW50YWluZXJzX2ZpbGVfdmVyc2lvbigpIGZvciBjaGVjawo+
ICogUmVtb3ZlIHRvcF9vZl90cmVlIGFzIG5vdCBuZWVkZWQgYW55IG1vcmUKPiAqIEZhaXVsIHdp
dGggZXh0ZW5kZWQgZXJyb3IgbWVzc2FnZSB3aGVuIHVzZWQgb3V0IG9mIHRyZWUKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+CgpKdXN0IGEgY291
cGxlIG9mIG5pdHMgKG15IFBlcmwgaXMgZmFyIGZyb20gZ29vZCBlbm91Z2ggdG8gYWN0dWFsbHkK
Z2l2ZSBhbiBhY2spOgoKPiBAQCAtMzExLDYgKzMwNiwxNiBAQCB3aGlsZSAoPCRtYWludD4pIHsK
PiAgfQo+ICBjbG9zZSgkbWFpbnQpOwo+ICAKPiArIyBDaGVjayB3aGV0aGVyIHdlIGhhdmUgYSBW
IGVudHJ5IHVuZGVyIHRoZSBSRVNUCj4gKyMgaG5kIHVzZSBpdCB0byBnZXQgdGhlIGZpbGUncyB2
ZXJzaW9uIG51bWJlcgoKcy9obmQvYW5kLyAKCj4gQEAgLTU2NCw2ICs1NjksMzIgQEAgc3ViIHJh
bmdlX2hhc19tYWludGFpbmVyIHsKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdWIgZ2V0
X3hlbl9tYWludGFpbmVyc19maWxlX3ZlcnNpb24gewo+ICsgICAgbXkgJHR2aSA9IGZpbmRfZmly
c3Rfc2VjdGlvbigpOwo+ICsKPiArICAgIHdoaWxlICgkdHZpIDwgQHR5cGV2YWx1ZSkgewo+ICsg
ICAgICAgIG15ICRzdGFydCA9IGZpbmRfc3RhcnRpbmdfaW5kZXgoJHR2aSk7Cj4gKyAgICAgICAg
bXkgJGVuZCA9IGZpbmRfZW5kaW5nX2luZGV4KCR0dmkpOwo+ICsgICAgICAgIG15ICRpOwo+ICsK
PiArICAgICAgICBmb3IgKCRpID0gJHN0YXJ0OyAkaSA8ICRlbmQ7ICRpKyspIHsKPiArICAgICAg
ICAgICAgbXkgJGxpbmUgPSAkdHlwZXZhbHVlWyRpXTsKPiArCSAgICBpZiAoJGxpbmUgPX4gbS9e
VjpccyooLiopLykgewoKQSBoYXJkIHRhYiBsb29rcyB0byBoYXZlIHNsaXBwZWQgaW4gaGVyZS4K
Cj4gKyAgICAgICAgICAgICAgICBteSAkdHlwZSA9ICQxOwoKVGhpcyB2YXJpYWJsZSBsb29rcyB0
byBiZSB1bnVzZWQsIGJ1dCBwZXJoYXBzIGl0cyBkZWNsYXJhdGlvbgpoYXMgc29tZSBzaWRlIGVm
ZmVjdD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
