Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D46E78D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:49:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoUA7-0002dq-Qc; Fri, 19 Jul 2019 14:47:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoUA6-0002de-BL
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:47:06 +0000
X-Inumbo-ID: 12ed2a32-aa34-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 12ed2a32-aa34-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 14:47:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36780344;
 Fri, 19 Jul 2019 07:47:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE37A3F59C;
 Fri, 19 Jul 2019 07:47:01 -0700 (PDT)
To: Rich Persaud <persaur@gmail.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
 <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
 <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
 <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
 <0BAD4AC1-5181-48AA-98FE-DD64133194CB@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <905fee8d-4c85-6ab7-ba8a-b588ec7e20af@arm.com>
Date: Fri, 19 Jul 2019 15:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <0BAD4AC1-5181-48AA-98FE-DD64133194CB@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Jeff.Kubascik@dornerworks.com, Tim Deegan <tim@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUmljaCwKCk9uIDE5LzA3LzIwMTkgMTQ6NTAsIFJpY2ggUGVyc2F1ZCB3cm90ZToKPiBPbiBK
dWwgMTksIDIwMTksIGF0IDA5OjMxLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToKPj4+IE9uIDE5LzA3LzIwMTkgMTQ6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+
IEhpIFRhbWFzLAo+Pj4+IE9uIDE5LzA3LzIwMTkgMTQ6MTQsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPj4+Pj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoxMSBBTSBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4gSGkgVGFtYXMsCj4+Pj4+Cj4+
Pj4+PiBPbiAxOS8wNy8yMDE5IDE0OjAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+Pj4+Pj4g
T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMjo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IEhpIFRhbWFzLAo+Pj4+Pj4+Cj4+Pj4+
Pj4gT24gMTgvMDcvMjAxOSAxODo0OCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+Pj4+Pj4g
ICAgICAgIC0gTGluZSAxMDI1OiBUaGUgdG9vbHMgbmVlZHMgdG8gYmUgYWJsZSB0byBkZWFsIGZv
cl9lYWNoX3ZjcHUoLi4uKSAmIGNvLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGVzZSBjYW4gYmUgbWFk
ZSBPSyBieSBhZGRpbmcgYnJhY2VzLiBPdGhlciB0aGFuIHRoYXQgdGhlIG9ubHkgd2F5IEkKPj4+
Pj4+Pj4gZm91bmQgdG8gbWFrZSBpdCBub3QgY2hhbmdlIHRoZSBpbmRlbnRhdGlvbiBpcyB0byBh
ZGQgdGhlIGNvbW1lbnQgIi8qCj4+Pj4+Pj4+ICpJTkRFTlQtT0ZGKiAqLyIgYmVmb3JlIHRoZSBi
bG9jayBhbmQgIi8qICpJTkRFTlQtT04qICovIiBhZnRlcndhcmRzLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
Tm9uZSBvZiB0aGVtIGxvb2tzIHJlYWxseSBhcHBlYWxpbmcgYmVjYXVzZSBpdCBtZWFucyBhc3R5
bGUgd2lsbCBub3QgY29ycmVjdGx5Cj4+Pj4+Pj4gaW5kZW50IGlmIHRoZSB1c2VyIGRvZXMgbm90
IGFkZCBicmFjZXMgb3IgY29tbWVudHMuCj4+Pj4+Pj4KPj4+Pj4+PiBDb3VsZCBhc3R5bGUgYmUg
ZWFzaWx5IG1vZGlmaWVkIHRvIHJlY29nbml6ZSBmb3JlYWNoIG1hY3Jvcz8KPj4+Pj4+Cj4+Pj4+
PiBOb3QgdGhhdCBJJ20gYXdhcmUgb2YuIElmIHlvdSBkb24ndCB3YW50IHRvIG1hbnVhbGx5IGFu
bm90YXRlIGZpbGVzCj4+Pj4+PiB3aXRoIHVuc3VwcG9ydGVkIG1hY3JvcyB0aGVuIGp1c3QgZXhj
bHVkZSB0aG9zZSBmaWxlcyBmcm9tIGFzdHlsZS4gSQo+Pj4+Pj4gd291bGRuJ3QgcmVjb21tZW5k
IGFkZGluZyB0aGlzIHRvIHRoZSBDSSBmb3IgYWxsIGZpbGVzLCBvbmx5IGZvciB0aG9zZQo+Pj4+
Pj4gdGhhdCB0aGVpciByZXNwZWN0aXZlIG1haW50YWluZXJzIGhhdmUgY29uZmlybWVkIHRvIGNv
bmZvcm0gdG8gdGhlCj4+Pj4+PiBzdHlsZSBhbmQgd2FudCB0byBlbmZvcmNlIGl0IGdvaW5nIGZv
cndhcmQuCj4+Pj4+Cj4+Pj4+IFNvIGEgY291cGxlIHVzZSBvZiBhbiB1bnN1cHBvcnRlZCBtYWNy
b3Mgd291bGQgbWFrZSBpbXBvc3NpYmxlIHRvIGVuZm9yY2UgdGhlCj4+Pj4+IGNvZGluZyBzdHls
ZS4gVGhpcyBpcyBub3QgYSB2ZXJ5IGlkZWFsIHBvc2l0aW9uIHRvIGJlIGluLgo+Pj4+Pgo+Pj4+
PiBfaWZfIHdlIGFyZSBnb2luZyB0byBhZG9wdCBhc3R5bGUgdGhlbiB3ZSBuZWVkIHRvIGJlIGFi
bGUgdG8gZW5mb3JjZSBpdCBvbiBldmVyeQo+Pj4+PiBYZW4gZmlsZXMgbG9uZy10ZXJtLiBJZiBp
dCBpcyBub3QgcG9zc2libGUgdG8gZG8gaXQgd2l0aCBhc3R5bGUsIHRoZW4gbWF5YmUgdGhpcwo+
Pj4+PiBpcyBub3QgdGhlIHJpZ2h0IHRvb2wgdG8gdXNlLgo+Pj4+Pgo+Pj4+PiBGb3IgaW5zdGFu
Y2UsIEkga25vdyB0aGF0IHRvb2xzIHN1Y2ggYXMgY2xhbmctZm9ybWF0IGlzIGFibGUgdG8gZGVh
bCB3aXRoCj4+Pj4+IGZvcmVhY2ggbWFjcm9zLgo+Pj4+Cj4+Pj4gSWYgdGhlcmUgYXJlIGJldHRl
ciB0b29scyB0aGVuIHN1cmUsIEkgZG9uJ3QgcmVhbGx5IG1pbmQgdXNpbmcKPj4+PiBzb21ldGhp
bmcgZWxzZS4gSSBqdXN0IGRvbid0IGhhdmUgdGltZSB0byBkbyB0aGUgbWFudWFsIHN0eWxlIGNo
ZWNrCj4+Pj4gYmFjay1hbmQtZm9ydGggYW55bW9yZSwgc28gdGhlIHNvb25lciB3ZSBoYXZlIHNv
bWV0aGluZyBpbiBwbGFjZSB0aGUKPj4+PiBiZXR0ZXIuCj4+PiBJIHRvdGFsbHkgYWdyZWUgd2Ug
bmVlZCBhIHRvb2wgc28gdGhlIHJldmlld2VyIGNhbiBmcmVlLXVwIHNvbWUgdGltZSB0byBmb2N1
cyBvbiBtb3JlIGltcG9ydGFudCB0aGluZ3MuIEhvd2V2ZXIsIEkgdGhpbmsgd2Ugc2hvdWxkIGJl
IGNhcmVmdWwgb24gd2hhdCB3ZSBhZG9wdCBoZXJlLgo+Pj4gU2ltaWxhciB0byBBbmRyZXcsIEkg
YW0gb3BlbiB3aXRoIG1vZGlmeWluZyB0aGUgY29kaW5nIHN0eWxlIHRvIGhlbHAgdGhlIGF1dG9t
YXRpYyBzdHlsZSBjaGVjay4gQnV0IEkgYW0gbm90IGhhcHB5IHRvIGRpc2FibGUgYXV0b21hdGlj
IHN0eWxlIG9uIHBhcnQgKG9yIGVudGlyZSkgb2YgZmlsZXMgZm9yZXZlci4KPj4+IEF0IHRoZSBt
b21lbnQsIGNsYW5nLWZvcm1hdCBmZWVscyBtb3JlIHBvd2VyZnVsIGFuZCB0aGVyZSBhcmUgcGVv
cGxlIHdvcmtpbmcgb24gaXQuCj4+Cj4+IEZZSSwgYmVsb3cgYSBsaW5rIHRvIHRoZSBjbGFuZy1m
b3JtYXQgY2hhbmdlczoKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMvWGVuLUNs
YW5nLWZvcm1hdC9ibG9iL2RldmVsL2NsYW5nLWZvcm1hdC5wYXRjaAo+IAo+IFdlcmUgdGhlc2Ug
Y2xhbmctZm9ybWF0IGNoYW5nZXMgZG9uZSBmb3IgRnVTYSB3b3JrPyAgQXJlIHRoZXkgaW50ZW5k
ZWQgdG8gYmUgcnVuIHdpdGhpbiBPU1N0ZXN0IGFuZC9vciBYZW4ncyBHaXRsYWIgQ0ksIHdoaWNo
IGRvIG5vdCBjdXJyZW50bHkgc3VwcG9ydCBPcGVuRW1iZWRkZWQvWW9jdG8gYW5kIHhlbi10cm9v
cHM/CgpJdCB3YXMgb3JpZ2luYWxseSBzdGFydGVkIGJ5IEVQQU0gdG8gYWRkcmVzcyByZXZpZXcg
YnVyZGVuLiBJSVJDLCB0aGUgZ29hbCBpcyB0byAKaGF2ZSBhIHJvYm90IGNoZWNraW5nIGNvZGlu
ZyBzdHlsZSBiZWZvcmUgYW55IHJldmlldyBpcyBhY3R1YWxseSBkb25lLiBTbyAKcHJvYmFibHkg
cGFydCBvZiBYZW4ncyBHaXRsYWIuCgpJIGFtIG5vdCBzdXJlIHdoeSB5b3UgbWVudGlvbiBPcGVu
RW1iZWRkZWQvWW9jdG8gb3IgZXZlbiBFUEFNJ3MgWGVuLiBUaGUgcGF0Y2ggCmlzIGFnYWluc3Qg
Y2xhbmctZm9ybWF0IChmcm9tIExMVk0gcHJvamVjdCkgYW5kIGRvZXMgbm90IGhhdmUgYW55IGRl
cGVuZGVuY2llcyAKb24gYWxsIHRoZSByZXN0LgoKPiAKPiBJdCB3b3VsZCBiZSBoZWxwZnVsIHRv
IGhhdmUgYSB4ZW4tZGV2ZWwgdGhyZWFkIG9uIHRoZSBtb3RpdmF0aW9uIGZvciB0aGUgY2xhbmct
Zm9ybWF0IHdvcmssIHRoZSBzcGVjaWZpYyBzdHlsZSBiZWluZyBlbmZvcmNlZCAoaW5jbHVkaW5n
IHRoZSBudWFuY2VzIGRpc2N1c3NlZCBpbiB0aGlzIHRocmVhZCkgYW5kIGFkZGl0aW9uYWwgd29y
ayBuZWVkZWQgYmVmb3JlIGNsYW5nLWZvcm1hdCBjYW4gcGVyZm9ybSBhdXRvbWF0ZWQgc3R5bGUg
Y2hlY2tpbmcgdG8gYWRkcmVzcyAoYSkgZXhpc3RpbmcgWGVuL0xpbnV4IHN0eWxlIHJlcXVpcmVt
ZW50cywgKGIpIEZ1U2EgcmVxdWlyZW1lbnRzLgoKSSB3aWxsIGxlYXZlIHRoYXQgdG8gTGFycyBh
bmQgQXJ0ZW0uIFRoZXkgaGF2ZSBiZWVuIGZvbGxvd2luZyB0aGUgd29yayBtb3JlIGNsb3NlbHku
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
