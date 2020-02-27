Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748A17144D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Fi0-0008Dk-Ph; Thu, 27 Feb 2020 09:43:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7Fhy-0008Df-EG
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:43:54 +0000
X-Inumbo-ID: a9adf399-5945-11ea-9620-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9adf399-5945-11ea-9620-12813bfff9fa;
 Thu, 27 Feb 2020 09:43:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 603DEAFD7;
 Thu, 27 Feb 2020 09:43:51 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31725031-08eb-7cb5-b595-8f202c7441c9@suse.com>
Date: Thu, 27 Feb 2020 10:43:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-8-anthony.perard@citrix.com>
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

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL1J1
bGVzLm1rCj4gKysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTExMSwxNyArMTExLDE0IEBAIGRlZmlu
ZSBnZW5kZXAKPiAgZW5kZWYKPiAgJChmb3JlYWNoIG8sJChmaWx0ZXItb3V0ICUvLCQob2JqLXkp
ICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKSwkKGV2YWwgJChjYWxsIGdlbmRlcCwkKG8pKSkpCj4g
IAo+IC0jIEVuc3VyZSBlYWNoIHN1YmRpcmVjdG9yeSBoYXMgZXhhY3RseSBvbmUgdHJhaWxpbmcg
c2xhc2guCj4gLXN1YmRpci1uIDo9ICQocGF0c3Vic3QgJSwlLywkKHBhdHN1YnN0ICUvLCUsJChz
dWJkaXItbikgJChzdWJkaXItKSkpCj4gLXN1YmRpci15IDo9ICQocGF0c3Vic3QgJSwlLywkKHBh
dHN1YnN0ICUvLCUsJChzdWJkaXIteSkpKQo+IC0KPiAtIyBBZGQgZXhwbGljaXRseSBkZWNsYXJl
ZCBzdWJkaXJlY3RvcmllcyB0byB0aGUgb2JqZWN0IGxpc3RzLgo+IC1vYmoteSArPSAkKHBhdHN1
YnN0ICUvLCUvYnVpbHRfaW4ubywkKHN1YmRpci15KSkKPiAtCj4gLSMgQWRkIGltcGxpY2l0bHkg
ZGVjbGFyZWQgc3ViZGlyZWN0b3JpZXMgKGluIHRoZSBvYmplY3QgbGlzdHMpIHRvIHRoZQo+IC0j
IHN1YmRpcmVjdG9yeSBsaXN0LCBhbmQgcmV3cml0ZSB0aGUgb2JqZWN0LWxpc3QgZW50cnkuCj4g
LXN1YmRpci15ICs9ICQoZmlsdGVyICUvLCQob2JqLXkpKQo+IC1vYmoteSAgICA6PSAkKHBhdHN1
YnN0ICUvLCUvYnVpbHQtaW4ubywkKG9iai15KSkKPiArIyBIYW5kbGUgb2JqZWN0cyBpbiBzdWJk
aXJzCj4gKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKyMgbyBpZiB3ZSBlbmNvdW50ZXIgZm9vLyBp
biAkKG9iai15KSwgcmVwbGFjZSBpdCBieSBmb28vYnVpbHRfaW4ubwo+ICsjICAgYW5kIGFkZCB0
aGUgZGlyZWN0b3J5IHRvIHRoZSBsaXN0IG9mIGRpcnMgdG8gZGVzY2VuZCBpbnRvOiAkKHN1YmRp
ci15KQo+ICtzdWJkaXIteSA6PSAkKHN1YmRpci15KSAkKGZpbHRlciAlLywgJChvYmoteSkpCj4g
K29iai15ICAgIDo9ICQocGF0c3Vic3QgJS8sICUvYnVpbHRfaW4ubywgJChvYmoteSkpCj4gKwo+
ICtzdWJkaXItbiAgIDo9ICQoc3ViZGlyLW4pICQoc3ViZGlyLSkgJChmaWx0ZXIgJS8sICQob2Jq
LW4pICQob2JqLSkpCgpJJ20gc2xpZ2h0bHkgcHV6emxlZCBieSB0aGUgbWlzbWF0Y2ggaW4gYmxh
bmsgcGFkZGluZyBvbiB0aGUgdGhyZWUKbGluZXMgYWJvdmUuIEkgYXNzdW1lIHRoZSBsYXN0IG9u
ZSBpcyB0byBtYXRjaCAuLi4KCj4gIHN1YmRpci1hbGwgOj0gJChzdWJkaXIteSkgJChzdWJkaXIt
bikKCi4uLiB0aGlzLCBidXQgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgZm9yIGFsbCBvZiB0
aGVtIHRvIG1hdGNoLApvciBhcyB0aGUgMm5kIGJlc3Qgb3B0aW9uLCBmb3Igc3ViZGlyLW4gdG8g
bWF0Y2ggc3ViZGlyLXkuIEVhc3kKZW5vdWdoIHRvIGRvIHdoaWxlIGNvbW1pdHRpbmcgSSBndWVz
cywgYnV0IHRoaXMgd291bGQgd2FudCB5b3VyCmNvbnNlbnQuCgpBcHBsaWNhYmxlIHBhcnRzCgpB
Y2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
