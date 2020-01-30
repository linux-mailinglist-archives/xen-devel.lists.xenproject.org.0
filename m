Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E697314D9D4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:32:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix818-00007w-AO; Thu, 30 Jan 2020 11:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix817-00007m-1O
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:29:49 +0000
X-Inumbo-ID: d22db3ec-4353-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d22db3ec-4353-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 11:29:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2AC1AC9A;
 Thu, 30 Jan 2020 11:29:46 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa0a1473-f515-6522-2b90-9b84db5d42c8@suse.com>
Date: Thu, 30 Jan 2020 12:29:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-8-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 07/12] xen/build: run targets csopes,
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

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhvc2UgdGFyZ2V0
cyBtYWtlIHVzZSBvZiAkKGFsbF9zb3VyY2VzKSB3aGljaCBkZXBlbmRzIG9uIFRBUkdFVF9BUkNI
LAo+IHNvIHdlIGp1c3QgbmVlZCB0byBzZXQgVEFSR0VUX0FSQ0ggZWFybGllciBhbmQgb25jZS4K
PiAKPiBYRU5fVEFSR0VUX0FSQ0ggaXNuJ3QgZXhwZWN0ZWQgdG8gY2hhbmdlIGR1cmluZyB0aGUg
YnVpbGQsIHNvCj4gVEFSR0VUX1NVQkFSQ0ggYW5kIFRBUkdFVF9BUkNIIGFyZW4ndCBnb2luZyB0
byBjaGFuZ2UgZWl0aGVyLgoKSW4gcHJpbmNpcGxlIHllcywgYnV0IHRoZXJlJ3MgYW4gZXhjZXB0
aW9uIHdoaWNoIG1heSBiZSB3b3J0aAptZW50aW9uaW5nIGhlcmUgdGhhdCBpdCBkb2Vzbid0IGNv
bmZsaWN0OiBhcmNoL3g4Ni9ib290L2J1aWxkMzIubWsKb3ZlcnJpZGVzIFhFTl9UQVJHRVRfQVJD
SCAoYnV0IGRvZXNuJ3QgdXNlIHRoZSByZW1haW5pbmcgbWFrZQptYWNoaW5lcnkpLgoKPiAtLS0g
YS94ZW4vTWFrZWZpbGUKPiArKysgYi94ZW4vTWFrZWZpbGUKPiBAQCAtMzUsNiArMzUsMTEgQEAg
U1JDQVJDSD0kKHNoZWxsIGVjaG8gJChBUkNIKSB8IHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSBz
Jy9hcm1cKDMyXHw2NFwpL2FybS9nJykKPiAgIyB3ZSBuZWVkIFhFTl9UQVJHRVRfQVJDSCB0byBn
ZW5lcmF0ZSB0aGUgcHJvcGVyIGNvbmZpZwo+ICBpbmNsdWRlICQoWEVOX1JPT1QpL0NvbmZpZy5t
awo+ICAKPiArIyBTZXQgQVJDSC9TVUJBUkNIIGFwcHJvcHJpYXRlbHkuCj4gK2V4cG9ydCBUQVJH
RVRfU1VCQVJDSCAgOj0gJChYRU5fVEFSR0VUX0FSQ0gpCj4gK2V4cG9ydCBUQVJHRVRfQVJDSCAg
ICAgOj0gJChzaGVsbCBlY2hvICQoWEVOX1RBUkdFVF9BUkNIKSB8IFwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSBzJy9hcm1cKDMyXHw2NFwp
L2FybS9nJykKClNlZWluZyB0aGlzLCAuLi4KCj4gLS0tIGEveGVuL1J1bGVzLm1rCj4gKysrIGIv
eGVuL1J1bGVzLm1rCj4gQEAgLTI3LDExICsyNyw2IEBAIGlmbmVxICgkKG9yaWdpbiB2ZXJib3Nl
KSx1bmRlZmluZWQpCj4gICQoZXJyb3IgIllvdSBtdXN0IHVzZSAnbWFrZSBtZW51Y29uZmlnJyB0
byBlbmFibGUvZGlzYWJsZSB2ZXJib3NlIG5vdy4iKQo+ICBlbmRpZgo+ICAKPiAtIyBTZXQgQVJD
SC9TVUJBUkNIIGFwcHJvcHJpYXRlbHkuCj4gLW92ZXJyaWRlIFRBUkdFVF9TVUJBUkNIICA6PSAk
KFhFTl9UQVJHRVRfQVJDSCkKPiAtb3ZlcnJpZGUgVEFSR0VUX0FSQ0ggICAgIDo9ICQoc2hlbGwg
ZWNobyAkKFhFTl9UQVJHRVRfQVJDSCkgfCBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSBzJy9hcm1cKDMyXHw2NFwpL2FybS9nJykKCi4u
LiB3aGVyZSBkaWQgdGhlICJvdmVycmlkZSJzIGdvPwoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
