Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB73179227
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:17:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Un1-00030M-O5; Wed, 04 Mar 2020 14:14:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9Un0-00030C-1T
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:14:22 +0000
X-Inumbo-ID: 7140ebdc-5e22-11ea-a3ec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7140ebdc-5e22-11ea-a3ec-12813bfff9fa;
 Wed, 04 Mar 2020 14:14:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67E9AAF48;
 Wed,  4 Mar 2020 14:14:20 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
 <31725031-08eb-7cb5-b595-8f202c7441c9@suse.com>
Message-ID: <35053153-dd0d-86b1-b6dd-c0c5e09f1104@suse.com>
Date: Wed, 4 Mar 2020 15:14:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <31725031-08eb-7cb5-b595-8f202c7441c9@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxMDo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAx
MjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IC0tLSBhL3hlbi9SdWxlcy5tawo+PiArKysg
Yi94ZW4vUnVsZXMubWsKPj4gQEAgLTExMSwxNyArMTExLDE0IEBAIGRlZmluZSBnZW5kZXAKPj4g
IGVuZGVmCj4+ICAkKGZvcmVhY2ggbywkKGZpbHRlci1vdXQgJS8sJChvYmoteSkgJChvYmotYmlu
LXkpICQoZXh0cmEteSkpLCQoZXZhbCAkKGNhbGwgZ2VuZGVwLCQobykpKSkKPj4gIAo+PiAtIyBF
bnN1cmUgZWFjaCBzdWJkaXJlY3RvcnkgaGFzIGV4YWN0bHkgb25lIHRyYWlsaW5nIHNsYXNoLgo+
PiAtc3ViZGlyLW4gOj0gJChwYXRzdWJzdCAlLCUvLCQocGF0c3Vic3QgJS8sJSwkKHN1YmRpci1u
KSAkKHN1YmRpci0pKSkKPj4gLXN1YmRpci15IDo9ICQocGF0c3Vic3QgJSwlLywkKHBhdHN1YnN0
ICUvLCUsJChzdWJkaXIteSkpKQo+PiAtCj4+IC0jIEFkZCBleHBsaWNpdGx5IGRlY2xhcmVkIHN1
YmRpcmVjdG9yaWVzIHRvIHRoZSBvYmplY3QgbGlzdHMuCj4+IC1vYmoteSArPSAkKHBhdHN1YnN0
ICUvLCUvYnVpbHRfaW4ubywkKHN1YmRpci15KSkKPj4gLQo+PiAtIyBBZGQgaW1wbGljaXRseSBk
ZWNsYXJlZCBzdWJkaXJlY3RvcmllcyAoaW4gdGhlIG9iamVjdCBsaXN0cykgdG8gdGhlCj4+IC0j
IHN1YmRpcmVjdG9yeSBsaXN0LCBhbmQgcmV3cml0ZSB0aGUgb2JqZWN0LWxpc3QgZW50cnkuCj4+
IC1zdWJkaXIteSArPSAkKGZpbHRlciAlLywkKG9iai15KSkKPj4gLW9iai15ICAgIDo9ICQocGF0
c3Vic3QgJS8sJS9idWlsdC1pbi5vLCQob2JqLXkpKQo+PiArIyBIYW5kbGUgb2JqZWN0cyBpbiBz
dWJkaXJzCj4+ICsjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiArIyBvIGlmIHdlIGVuY291bnRlciBm
b28vIGluICQob2JqLXkpLCByZXBsYWNlIGl0IGJ5IGZvby9idWlsdF9pbi5vCj4+ICsjICAgYW5k
IGFkZCB0aGUgZGlyZWN0b3J5IHRvIHRoZSBsaXN0IG9mIGRpcnMgdG8gZGVzY2VuZCBpbnRvOiAk
KHN1YmRpci15KQo+PiArc3ViZGlyLXkgOj0gJChzdWJkaXIteSkgJChmaWx0ZXIgJS8sICQob2Jq
LXkpKQo+PiArb2JqLXkgICAgOj0gJChwYXRzdWJzdCAlLywgJS9idWlsdF9pbi5vLCAkKG9iai15
KSkKPj4gKwo+PiArc3ViZGlyLW4gICA6PSAkKHN1YmRpci1uKSAkKHN1YmRpci0pICQoZmlsdGVy
ICUvLCAkKG9iai1uKSAkKG9iai0pKQo+IAo+IEknbSBzbGlnaHRseSBwdXp6bGVkIGJ5IHRoZSBt
aXNtYXRjaCBpbiBibGFuayBwYWRkaW5nIG9uIHRoZSB0aHJlZQo+IGxpbmVzIGFib3ZlLiBJIGFz
c3VtZSB0aGUgbGFzdCBvbmUgaXMgdG8gbWF0Y2ggLi4uCj4gCj4+ICBzdWJkaXItYWxsIDo9ICQo
c3ViZGlyLXkpICQoc3ViZGlyLW4pCj4gCj4gLi4uIHRoaXMsIGJ1dCBJIHRoaW5rIGl0IHdvdWxk
IGJlIGJldHRlciBmb3IgYWxsIG9mIHRoZW0gdG8gbWF0Y2gsCj4gb3IgYXMgdGhlIDJuZCBiZXN0
IG9wdGlvbiwgZm9yIHN1YmRpci1uIHRvIG1hdGNoIHN1YmRpci15LiBFYXN5Cj4gZW5vdWdoIHRv
IGRvIHdoaWxlIGNvbW1pdHRpbmcgSSBndWVzcywgYnV0IHRoaXMgd291bGQgd2FudCB5b3VyCj4g
Y29uc2VudC4KCk9oLCB0aGVzZSB0d28gbGluZXMgZ28gYXdheSBhZ2FpbiBpbiBwYXRjaCA5LiBO
byBuZWVkIGZvciBhbnkKYWRqdXN0bWVudCB0aGVuLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
