Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F219C85
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 13:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP3bm-0001TF-Ma; Fri, 10 May 2019 11:22:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hP3bk-0001TA-Hw
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 11:22:32 +0000
X-Inumbo-ID: e5f772ad-7315-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5f772ad-7315-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 11:22:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7ADB1AEC6;
 Fri, 10 May 2019 11:22:29 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?B?Y29tPiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/vTQ277+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5CCFF6F1020000780022C12B=40suse=2ecom=3e_=3cac57c420?=
 =?UTF-8?B?77+9YTcyZe+/vTc1NzDvv71kYjhm77+9MjdlNDY5M2MyNzU1QHN1c2UuY29tPiA8?=
 =?UTF-8?Q?5CD005E7020000780022C1B5=40prv1=ef=bf=bdmh=2eprovo=2enovell=2ecom?=
 =?UTF-8?Q?=3e_=3cf7692c11-ab14-4d7d-4b7a-72e9c58e8f30=40suse=2ecom=3e_=3c5C?=
 =?UTF-8?Q?D53C1C020000780022D706=40suse=2ecom=3e_=3c46968660-ea39-1ee0-2aee?=
 =?UTF-8?Q?-c4a22f135ddb=40suse=2ecom=3e_=3c4426eec2811962e9acd1808579bd3ccd?=
 =?UTF-8?Q?6ba52769=2ecamel=40suse=2ecom=3e?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2537b1f3-5047-56b2-5884-581ea71ccf58@suse.com>
Date: Fri, 10 May 2019 13:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDUvMjAxOSAxMjoyOSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTA1LTEwIGF0IDExOjAwICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxMC8wNS8y
MDE5IDEwOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjA1LjE5IGF0IDE2OjM2
LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IFdpdGggc2NoZWQtZ3Jhbj1jb3Jl
IG9yIHNjaGVkLWdyYW49c29ja2V0IG9mZmxpbmluZyBhIHNpbmdsZSBjcHUKPj4+PiByZXN1bHRz
Cj4+Pj4gaW4gbW92aW5nIHRoZSBjb21wbGV0ZSBjb3JlIG9yIHNvY2tldCB0byBjcHVwb29sX2Zy
ZWVfY3B1cyBhbmQKPj4+PiB0aGVuCj4+Pj4gb2ZmbGluaW5nIGZyb20gdGhlcmUuIE9ubHkgY29t
cGxldGUgY29yZXMvc29ja2V0cyBjYW4gYmUgbW92ZWQgdG8KPj4+PiBhbnkKPj4+PiBjcHVwb29s
LiBXaGVuIG9ubGluaW5nIGEgY3B1IGl0IGlzIGFkZGVkIHRvIGNwdXBvb2xfZnJlZV9jcHVzIGFu
ZAo+Pj4+IGlmCj4+Pj4gdGhlIGNvcmUvc29ja2V0IGlzIGNvbXBsZXRlbHkgb25saW5lIGl0IHdp
bGwgYXV0b21hdGljYWxseSBiZQo+Pj4+IGFkZGVkIHRvCj4+Pj4gUG9vbC0wIChhcyB0b2RheSBh
bnkgc2luZ2xlIG9ubGluZWQgY3B1KS4KPj4+Cj4+PiBXZWxsLCB0aGlzIGlzIGluIGxpbmUgd2l0
aCB3aGF0IHdhcyBkaXNjdXNzZWQgb24gdGhlIGNhbGwKPj4+IHllc3RlcmRheSwgc28KPj4+IEkg
dGhpbmsgaXQncyBhbiBhY2NlcHRhYmxlIGluaXRpYWwgc3RhdGUgdG8gZW5kIHVwIGluLiBBbGJl
aXQsIGp1c3QKPj4+IGZvcgo+Pj4gY29tcGxldGVuZXNzLCBJJ20gbm90IGNvbnZpbmNlZCB0aGVy
ZSdzIG5vIHVzZSBmb3IgInNtdC0KPj4+IHtkaXMsZW59YWJsZSIKPj4+IGFueW1vcmUgd2l0aCBj
b3JlLWF3YXJlIHNjaGVkdWxpbmcgaW1wbGVtZW50ZWQganVzdCBpbiBYZW4gLSBpdAo+Pj4gbWF5
IHN0aWxsIGJlIGNvbnNpZGVyZWQgdXNlZnVsIGFzIGxvbmcgYXMgd2UgZG9uJ3QgZXhwb3NlIHBy
b3Blcgo+Pj4gdG9wb2xvZ3kgdG8gZ3Vlc3RzLCBmb3IgdGhlbSB0byBiZSBhYmxlIHRvIGRvIHNv
bWV0aGluZyBzaW1pbGFyLgo+Pgo+PiBBcyB0aGUgZXh0cmEgY29tcGxleGl0eSBmb3Igc3VwcG9y
dGluZyB0aGF0IGlzIHNpZ25pZmljYW50IEknZCBsaWtlCj4+IHRvCj4+IGF0IGxlYXN0IHBvc3Rw
b25lIGl0LiBBbmQgd2l0aCB0aGUgKGxhdGVyKSBpbnRyb2R1Y3Rpb24gb2YgcGVyLQo+PiBjcHVw
b29sCj4+IHNtdCBvbi9vZmYgSSBndWVzcyB0aGlzIHdvdWxkIGJlIGV2ZW4gbGVzcyBpbXBvcnRh
bnQuCj4+Cj4gSSBhZ3JlZS4KPiAKPiBJc24ndCBpdCB0aGUgY2FzZSB0aGF0IChidXQgbm90ZSB0
aGF0IEknbSBqdXN0IHRoaW5raW5nIG91dCBsb3VkIGhlcmUpLAo+IGlmIHdlIG1ha2Ugc210PSBh
bmQgc2NoZWQtZ3Jhbj0gcGVyLWNwdXBvb2wsIHRoZSB1c2VyIGdhaW5zIHRoZSBjaGFuY2UKPiB0
byB1c2UgYm90aCwgaWYgaGUvc2hlIHdhbnRzIChlLmcuLCBmb3IgdGVzdGluZyk/CgpZZXMuCgo+
IElmIHllcywgaXMgc3VjaCBhIHRoaW5nIHZhbHVhYmxlIGVub3VnaCB0aGF0IGl0J2QgaXQgbWFr
ZSBzZW5zZSB0byB3b3JrCj4gb24gdGhhdCwgYXMgYSBmaXJzdCB0aGluZywgSSBtZWFuPwoKTXkg
cGxhbm5lZCByb2FkbWFwIGlzOgoKMS4gdGhpcyBzZXJpZXMKMi4gc2NoZWR1bGVyIGNsZWFuLXVw
CjMuIHBlci1jcHVwb29sIHNtdCBhbmQgZ3JhbnVsYXJpdHkKCj4gV2UnZCBzdGlsbCBmb3JiaWQg
bW92aW5nIHRoaW5ncyBmcm9tIHBvb2xzIHdpdGggZGlmZmVyZW50Cj4gY29uZmlndXJhdGlvbiwg
YXQgbGVhc3QgYXQgdGhlIGJlZ2lubmluZywgb2YgY291cnNlLgoKUmlnaHQsIGFsbG93aW5nIHRo
YXQgd291bGQgYmUgNC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
