Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D563B5CC58
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:06:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEhh-00049K-H3; Tue, 02 Jul 2019 09:03:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Sn/J=U7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hiEhg-00049E-07
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 09:03:56 +0000
X-Inumbo-ID: 516eae53-9ca8-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 516eae53-9ca8-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 09:03:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4CC69AD0B;
 Tue,  2 Jul 2019 09:03:54 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <29a1a8d8-0ec6-4e95-cb23-91fb2e50c83a@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6fd23005-5952-997c-17ba-83019b8c1880@suse.com>
Date: Tue, 2 Jul 2019 11:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <29a1a8d8-0ec6-4e95-cb23-91fb2e50c83a@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 15/60] xen/sched: add domain pointer to
 struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMTkgMTA6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI4LjA1LjE5IGF0
IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBAQCAtMjUzLDcgKzI1Myw3
IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NwaW5fdW5sb2NrX2RvdWJsZShzcGlubG9ja190ICpsb2Nr
MSwgc3BpbmxvY2tfdCAqbG9jazIsCj4+ICAgc3RhdGljIHZvaWQgc2NoZWRfZnJlZV91bml0KHN0
cnVjdCBzY2hlZF91bml0ICp1bml0KQo+PiAgIHsKPj4gICAgICAgc3RydWN0IHNjaGVkX3VuaXQg
KnByZXZfdW5pdDsKPj4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gdW5pdC0+dmNwdS0+ZG9tYWlu
Owo+PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSB1bml0LT5kb21haW47Cj4gCj4gQXMgc2FpZCBp
biByZXBseSB0byBwYXRjaCAxMywgSSB0aGluayB0aGUgZG9tYWluIHBvaW50ZXIgc2hvdWxkIGJl
Cj4gaW50cm9kdWNlZCByaWdodCBpbiBwYXRjaCA0LCB0byBhdm9pZCBjaGFuZ2VzIGxpa2UgdGhl
IGFib3ZlIG9uZSwKPiBhbmQgaW4gcGFydGljdWxhciB0byBhdm9pZCBtaXNzaW5nIGNoYW5nZXMg
bGlrZSB0aGUgb25lIHRoYXQgd291bGQKPiBiZSB3YW50ZWQgYWxzbyB0byBoYXNfc29mdF9hZmZp
bml0eSgpLgoKRmluZSB3aXRoIG1lLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
