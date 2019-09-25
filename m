Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D026BE187
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:42:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Nv-00082W-ER; Wed, 25 Sep 2019 15:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iD9Nt-00082R-Bo
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:39:17 +0000
X-Inumbo-ID: a19827e2-dfaa-11e9-9637-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id a19827e2-dfaa-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 15:39:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA3281570;
 Wed, 25 Sep 2019 08:39:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 249E53F59C;
 Wed, 25 Sep 2019 08:39:15 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bf8bafc2-01b4-2847-56f1-cd1121d181a8@arm.com>
Date: Wed, 25 Sep 2019 16:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c55b7b2561cdaeb363b6fd757b0f0a0723d1e005.camel@suse.com>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNS8wOS8yMDE5IDE2OjM0LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBPbiBXZWQs
IDIwMTktMDktMjUgYXQgMTY6MTkgKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gKCtKdWVy
Z2VuKQo+Pgo+PiBIaSBEYXJpbywKPj4KPiBIaSwKPiAKPj4gT24gMTEvMDkvMjAxOSAxNDo1Mywg
RGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+PiBPbiBGcmksIDIwMTktMDgtMjMgYXQgMTg6MTYgLTA3
MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9rLCB0aGFua3MgYWdhaW4gZm9yIHRl
c3RpbmcsIGFuZCBnb29kIHRvIGtub3cuCj4+Pgo+Pj4gSSdtIHN0aWxsIGNhdGNoaW5nIHVwIGFm
dGVyIHZhY2F0aW9ucywgYW5kIEknbSB0cmF2ZWxpbmcgbmV4dCB3ZWVrLgo+Pj4gQnV0Cj4+PiBJ
J2xsIHN1Ym1pdCBhIHByb3BlciBwYXRjaCBhcyBzb29uIGFzIEkgZmluZCB0aW1lLgo+Pgo+PiBK
dXN0IHdhbnRlZCB0byBmb2xsb3ctdXAgb24gdGhpcy4gRG8geW91IGhhdmUgYW4gdXBkYXRlIGZv
ciB0aGUgZml4Pwo+Pgo+PiBJIHdvdWxkIHJhdGhlciBub3Qgd2FudCB0byBzZWUgWGVuIDQuMTMg
cmVsZWFzZWQgd2l0aCB0aGlzLiBTbyBJIGhhdmUKPj4gQ0NlZAo+PiBKdWVyZ2VuIHRvIG1hcmsg
aXQgYXMgYSBibG9ja2VyLgo+Pgo+IFllcCwgSSBzcG9rZSB3aXRoIEp1ZXJnZW4gYWJvdXQgdGhp
cyBsYXN0IHdlZWsgKGluIHBlcnNvbikuIEJhc2ljYWxseSwKPiBzaW5jZSB3ZSBkZWNpZGVkIHRv
IHRyeSB0byBwdXNoIGNvcmUtc2NoZWR1bGluZyBpbiwgSSdtIGZvY3VzaW5nIG9uCj4gdGhhdCBz
ZXJpZXMgcmlnaHQgbm93Lgo+IAo+IEluIGZhY3QsIHRoaXMgZml4IGNhbiBnbyBpbiBhZnRlciBj
b2RlLWZyZWV6ZSBhcyB3ZWxsLCBzaW5jZSBpdCdzLAo+IHdlbGwsIGEgZml4LiA6LSkKPiAKPiBB
ZnRlciBjb2RlIGZyZWV6ZSwgSSdsbCBwcmVwYXJlIGFuZCBzZW5kIHRoZSBwYXRjaCAoYW5kIGlm
IGNvcmUtCj4gc2NoZWR1bGluZyB3b3VsZCBoYXZlIGdvbmUgaW4sIEknbGwgcmViYXNlIGl0IG9u
IHRvcCBvZiB0aGF0LCBvZgo+IGNvdXJzZSkuCgpNYWtlIHNlbnNlLiBJIGp1c3Qgd2FudGVkIHRv
IG1ha2Ugc3VyZSB0aGlzIGlzIHRyYWNrZWQgYnkgSnVlcmdlbiA6KS4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
