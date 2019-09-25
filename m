Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D16ABE190
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:44:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Pz-0000O4-DL; Wed, 25 Sep 2019 15:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD9Px-0000Nu-FV
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:41:25 +0000
X-Inumbo-ID: ed96b0dc-dfaa-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ed96b0dc-dfaa-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 15:41:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2857FACAA;
 Wed, 25 Sep 2019 15:41:23 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
 <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
 <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
 <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
 <1afcf0e569f68dbfe2c79668f17e1846a7dc3a1b.camel@suse.com>
 <96661f8e-31e4-8557-e29b-2350a74c586f@arm.com>
 <c55b7b2561cdaeb363b6fd757b0f0a0723d1e005.camel@suse.com>
 <bf8bafc2-01b4-2847-56f1-cd1121d181a8@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2cae8d55-beb6-1f39-a4d4-7b7a36cec0c1@suse.com>
Date: Wed, 25 Sep 2019 17:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bf8bafc2-01b4-2847-56f1-cd1121d181a8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTc6MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyNS8w
OS8yMDE5IDE2OjM0LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gT24gV2VkLCAyMDE5LTA5LTI1
IGF0IDE2OjE5ICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiAoK0p1ZXJnZW4pCj4+Pgo+
Pj4gSGkgRGFyaW8sCj4+Pgo+PiBIaSwKPj4KPj4+IE9uIDExLzA5LzIwMTkgMTQ6NTMsIERhcmlv
IEZhZ2dpb2xpIHdyb3RlOgo+Pj4+IE9uIEZyaSwgMjAxOS0wOC0yMyBhdCAxODoxNiAtMDcwMCwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+IE9rLCB0aGFua3MgYWdhaW4gZm9yIHRlc3Rp
bmcsIGFuZCBnb29kIHRvIGtub3cuCj4+Pj4KPj4+PiBJJ20gc3RpbGwgY2F0Y2hpbmcgdXAgYWZ0
ZXIgdmFjYXRpb25zLCBhbmQgSSdtIHRyYXZlbGluZyBuZXh0IHdlZWsuCj4+Pj4gQnV0Cj4+Pj4g
SSdsbCBzdWJtaXQgYSBwcm9wZXIgcGF0Y2ggYXMgc29vbiBhcyBJIGZpbmQgdGltZS4KPj4+Cj4+
PiBKdXN0IHdhbnRlZCB0byBmb2xsb3ctdXAgb24gdGhpcy4gRG8geW91IGhhdmUgYW4gdXBkYXRl
IGZvciB0aGUgZml4Pwo+Pj4KPj4+IEkgd291bGQgcmF0aGVyIG5vdCB3YW50IHRvIHNlZSBYZW4g
NC4xMyByZWxlYXNlZCB3aXRoIHRoaXMuIFNvIEkgaGF2ZQo+Pj4gQ0NlZAo+Pj4gSnVlcmdlbiB0
byBtYXJrIGl0IGFzIGEgYmxvY2tlci4KPj4+Cj4+IFllcCwgSSBzcG9rZSB3aXRoIEp1ZXJnZW4g
YWJvdXQgdGhpcyBsYXN0IHdlZWsgKGluIHBlcnNvbikuIEJhc2ljYWxseSwKPj4gc2luY2Ugd2Ug
ZGVjaWRlZCB0byB0cnkgdG8gcHVzaCBjb3JlLXNjaGVkdWxpbmcgaW4sIEknbSBmb2N1c2luZyBv
bgo+PiB0aGF0IHNlcmllcyByaWdodCBub3cuCj4+Cj4+IEluIGZhY3QsIHRoaXMgZml4IGNhbiBn
byBpbiBhZnRlciBjb2RlLWZyZWV6ZSBhcyB3ZWxsLCBzaW5jZSBpdCdzLAo+PiB3ZWxsLCBhIGZp
eC4gOi0pCj4+Cj4+IEFmdGVyIGNvZGUgZnJlZXplLCBJJ2xsIHByZXBhcmUgYW5kIHNlbmQgdGhl
IHBhdGNoIChhbmQgaWYgY29yZS0KPj4gc2NoZWR1bGluZyB3b3VsZCBoYXZlIGdvbmUgaW4sIEkn
bGwgcmViYXNlIGl0IG9uIHRvcCBvZiB0aGF0LCBvZgo+PiBjb3Vyc2UpLgo+IAo+IE1ha2Ugc2Vu
c2UuIEkganVzdCB3YW50ZWQgdG8gbWFrZSBzdXJlIHRoaXMgaXMgdHJhY2tlZCBieSBKdWVyZ2Vu
IDopLgoKSXQgaXMuIDotKQoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
