Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7265486BE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:13:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctHa-0005NV-Lg; Mon, 17 Jun 2019 15:10:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hctHZ-0005NP-Hl
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:10:53 +0000
X-Inumbo-ID: 187f657b-9112-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 187f657b-9112-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 15:10:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 09:10:51 -0600
Message-Id: <5D07AD770200007800238D9E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 09:10:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-14-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-14-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 13/13] print: introduce a format
 specifier for pci_sbdf_t
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
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDExOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBuZXcgZm9ybWF0IHNwZWNpZmllciBpcyAnJXBwJywgYW5kIHByaW50cyBhIHBjaV9zYmRm
X3QgdXNpbmcgdGhlCj4gc2VnOmJ1czpkZXYuZnVuYyBmb3JtYXQuIFJlcGxhY2UgYWxsIFNCREZz
IHByaW50ZWQgdXNpbmcKPiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVzZSB0aGUgbmV3IGZvcm1h
dCBzcGVjaWZpZXIuCgpXZWxsLCBJIGNvbnRpbnVlIHRvIG5vdCBiZSBoYXBweSBhYm91dCB0aGUg
dXNlIG9mICVwIChyYXRoZXIgdGhhbiB0aGUKcHJvcG9zZWQgJW8pIGhlcmUuIEkgZG9uJ3Qgc3Vw
cG9zZSB5b3UndmUgYWN0dWFsbHkgdHJpZWQsIGFuZCBpdCBkaWRuJ3QKd29yayBvdXQ/Cgo+IC0t
LSBhL3hlbi9jb21tb24vdnNwcmludGYuYwo+ICsrKyBiL3hlbi9jb21tb24vdnNwcmludGYuYwo+
IEBAIC0zOTQsNiArMzk0LDIwIEBAIHN0YXRpYyBjaGFyICpwcmludF92Y3B1KGNoYXIgKnN0ciwg
Y29uc3QgY2hhciAqZW5kLCBjb25zdCBzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIHJldHVybiBudW1i
ZXIoc3RyICsgMSwgZW5kLCB2LT52Y3B1X2lkLCAxMCwgLTEsIC0xLCAwKTsKPiAgfQo+ICAKPiAr
c3RhdGljIGNoYXIgKnByaW50X3BjaV9hZGRyKGNoYXIgKnN0ciwgY29uc3QgY2hhciAqZW5kLCBj
b25zdCBwY2lfc2JkZl90ICpzYmRmKQo+ICt7Cj4gKyAgICBzdHIgPSBudW1iZXIoc3RyLCBlbmQs
IHNiZGYtPnNlZywgMTYsIDQsIC0xLCBaRVJPUEFEKTsKPiArICAgIGlmICggc3RyIDwgZW5kICkK
PiArICAgICAgICAqc3RyID0gJzonOwo+ICsgICAgc3RyID0gbnVtYmVyKHN0ciArIDEsIGVuZCwg
c2JkZi0+YnVzLCAxNiwgMiwgLTEsIFpFUk9QQUQpOwo+ICsgICAgaWYgKCBzdHIgPCBlbmQgKQo+
ICsgICAgICAgICpzdHIgPSAnOic7Cj4gKyAgICBzdHIgPSBudW1iZXIoc3RyICsgMSwgZW5kLCBz
YmRmLT5kZXYsIDE2LCAyLCAtMSwgWkVST1BBRCk7Cj4gKyAgICBpZiAoIHN0ciA8IGVuZCApCj4g
KyAgICAgICAgKnN0ciA9ICcuJzsKPiArICAgIHJldHVybiBudW1iZXIoc3RyICsgMSwgZW5kLCBz
YmRmLT5mbiwgOCwgLTEsIC0xLCAwKTsKCk5pdDogQmxhbmsgbGluZSBhYm92ZSBoZXJlIHBsZWFz
ZS4KCj4gK30KPiArCj4gIHN0YXRpYyBjaGFyICpwb2ludGVyKGNoYXIgKnN0ciwgY29uc3QgY2hh
ciAqZW5kLCBjb25zdCBjaGFyICoqZm10X3B0ciwKPiAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm9pZCAqYXJnLCBpbnQgZmllbGRfd2lkdGgsIGludCBwcmVjaXNpb24sCj4gICAgICAgICAg
ICAgICAgICAgICAgIGludCBmbGFncykKPiBAQCAtNDc2LDYgKzQ5MCwxMCBAQCBzdGF0aWMgY2hh
ciAqcG9pbnRlcihjaGFyICpzdHIsIGNvbnN0IGNoYXIgKmVuZCwgY29uc3QgY2hhciAqKmZtdF9w
dHIsCj4gICAgICAgICAgfQo+ICAgICAgfQo+ICAKPiArICAgIGNhc2UgJ3AnOiAvKiBQQ0kgU0JE
Ri4gKi8KCkFub3RoZXIgbml0OiBUaGUgZnVsbCBzdG9wIHdvdWxkIGltbyBiZXR0ZXIgYmUgb21p
dHRlZCBoZXJlLiBJIG5vdGljZSB0aGlzCmlzIGluY29uc2lzdGVudCBhdCBwcmVzZW50IGluIHRo
aXMgZnVuY3Rpb24sIGJ1dCBnZW5lcmFsbHkgSSB0aGluayBpdCdzIGJldHRlcgp0byBub3QgaGF2
ZSBpdCB3aGVuIGEgY29tbWVudCBpcyBub3QgcmVhbGx5IGEgc2VudGVuY2UuIFRoZSBzdHlsZQpn
dWlkZWxpbmVzIGV4cGxpY2l0bHkgcGVybWl0IG9taXR0aW5nIGl0IGlpcmMuCgo+ICsgICAgICAg
ICsrKmZtdF9wdHI7Cj4gKyAgICAgICAgcmV0dXJuIHByaW50X3BjaV9hZGRyKHN0ciwgZW5kLCBh
cmcpOwo+ICsKPiAgICAgIGNhc2UgJ3MnOiAvKiBTeW1ib2wgbmFtZSB3aXRoIG9mZnNldCBhbmQg
c2l6ZSAoaWZmIG9mZnNldCAhPSAwKSAqLwo+ICAgICAgY2FzZSAnUyc6IC8qIFN5bWJvbCBuYW1l
IHVuY29uZGl0aW9uYWxseSB3aXRoIG9mZnNldCBhbmQgc2l6ZSAqLwo+ICAgICAgewoKSW4gcHJp
bmNpcGxlIEknZCBleHBlY3QgdGhpcyB0byBub3QgZXZlbiBidWlsZCBvbiBBcm0sIGFzIHBjaV9z
YmRmX3Qgc2hvdWxkCm5vdCBiZSBkZWZpbmVkLiBJIGd1ZXNzIHlvdSBkaWQgYnVpbGQgdGVzdCBp
dCBhbmQgaXQgd29ya2VkLCBidXQgSSB0aGluayB0aGUKYWRkaXRpb25zIHNob3VsZCBzdGlsbCBn
byBpbiAjaWZkZWYgQ09ORklHX0hBU19QQ0kuCgpBbHNvIEknZCBsaWtlIHRvIHBvaW50IG91dCB0
aGF0IGFnYWluIHJldmlldyBhbmQgaW4gcGFydGljdWxhciBjb2xsZWN0aW9uIG9mCmFja3MgbWln
aHQgYmUgZWFzaWVyIGlmIHRoaXMgZ290IHNwbGl0IHVwIGEgbGl0dGxlLiBCdXQgSSdtIG5vdCBn
b2luZyB0byBpbnNpc3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
