Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48634FD74
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVGZ-0007zA-Ok; Tue, 30 Apr 2019 16:05:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rCO=TA=citrix.com=prvs=016a9660e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hLVGY-0007yN-Nn
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:05:58 +0000
X-Inumbo-ID: d60d6338-6b61-11e9-95fe-cf21b7ab42e3
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d60d6338-6b61-11e9-95fe-cf21b7ab42e3;
 Tue, 30 Apr 2019 16:05:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,414,1549929600"; d="scan'208";a="89479099"
Date: Tue, 30 Apr 2019 17:55:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
 <23752.23708.661076.214573@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23752.23708.661076.214573@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MzM6MDBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIGxpbnV4IDQuMTkgeGVu
c3RvcmUgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSBSZTogW2xpbnV4LTQuMTkgdGVzdF0gMTM1
NDIwOiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiA+IE9uIDMwLjA0LjE5IGF0IDE1OjAyLCA8aWFu
LmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+IElTVE0gdGhhdCB0aGVyZSBhcmUgKnR3
byogYnVncyBoZXJlOgo+ID4gPiAKPiA+ID4gIDEuIFdoYXRldmVyIGNhdXNlZCB0aGUgbWVtb3J5
IGFsbG9jYXRpb24gZmFpbHVyZQo+ID4gCj4gPiBBbiBvcmRlci01IGFsbG9jYXRpb24gaXMgc2V0
IHRvIGZhaWwgYXQgYW55IHRpbWUgKGFmYWljdCkuIEkgZmluZCBpdAo+ID4gc3VycHJpc2luZyB0
aGF0IHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gaW5zdGFuY2VzIChldmVuIGFycmF5cwo+ID4g
b2YgdGhlbSB3aGVuIHVzaW5nIG11bHRpcGxlIHJpbmdzKSBnZXQgYWxsb2NhdGVkIHVzaW5nIGtj
YWxsb2MoKQo+ID4gcmF0aGVyIHRoYW4ga3ZjYWxsb2MoKSwgY29uc2lkZXJpbmcgdGhlIHNpemUg
b2YgdGhlIHN0cnVjdHVyZQo+ID4gKDB4MTQwRTAgYWNjb3JkaW5nIHRvIHRoZSBkaXNhc3NlbWJs
eSBvZiB0aGUgNS4wLjEgZHJpdmVyIEkKPiA+IGhhZCB0byBoYW5kKS4KPiAKPiBJIHdpbGwgbGVh
dmUgYW5zd2VyaW5nIHRoaXMgdG8gdGhlIGJsa2Zyb250L2xpbnV4IGZvbGtzLi4uCgpJIHRoaW5r
IHRob3NlIGFsbG9jYXRpb25zIHVzZWQgdG8gYmUgc21hbGwgZW5vdWdoIHRoYXQga2NhbGxvYyB3
YXMKbGlrZWx5IGZpbmUuIE5vdyB3aXRoIG11bHRpcGxlIHJpbmdzLCBhbmQgbXVsdGlwbGUgcGFn
ZXMgcGVyIHJpbmcKdGhvc2UgaGF2ZSBncm93biB0byBhIHBvaW50IHdoZXJlIGtjYWxsb2MgaXMg
bm90IGZpbmUgYW55bW9yZS4gSSB3aWxsCnByZXBhcmUgYSBwYXRjaCB0byBzd2l0Y2ggdG8ga3Zj
YWxsb2MuCgo+ID4gPiAgMi4gVGhhdCBhIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgY2FuIGNh
dXNlIHBlcm1hbmVudCBsb3NzIG9mIGEKPiA+ID4gICAgICB4ZW5zdG9yZSB3YXRjaCBldmVudAo+
ID4gCj4gPiBXZWxsLCBpc24ndCBpdCBzb3J0IG9mIGV4cGVjdGVkIHRoYXQgYW4gYWxsb2NhdGlv
biBmYWlsdXJlIHdpbGwgbGVhZAo+ID4gdG8gZnVydGhlciBwcm9ibGVtcz8KPiAKPiBJIHdvdWxk
IGhhdmUgaG9wZWQgdGhhdCBpdCB3b3VsZCByZXN1bHQgaW4gc29tZXRoaW5nIG90aGVyIHRoYW4g
YQo+IGhhbmcuICBBdCB3b3JzdCwgYmxrZnJvbnQgb3VnaHQgdG8gZ28gaW50byBhIHN0YXRlIHdo
ZXJlIGl0ICprbm93cyoKPiB0aGF0IGl0IGlzIHV0dGVybHkgYnJva2VuIGFuZCByZXBvcnRzIHRo
aXMgcHJvcGVybHkuCgpJIGhhdmVuJ3QgeWV0IGNoZWNrZWQgYWxsIHRoZSBwb3NzaWJsZSBlcnJv
ciBwYXRocywgYnV0IHRoZSBvbmVzIEkndmUKbG9va2VkIGF0IHVzZSB4ZW5idXNfZGV2X2ZhdGFs
IHdoaWNoIHN3aXRjaGVzIHRoZSBkZXZpY2Ugc3RhdGUgdG8KY2xvc2luZyBhbmQgd3JpdGVzIHRo
ZSBlcnJvciBtZXNzYWdlIGludG8geGVuc3RvcmUuIEhvd2V2ZXIgY2xvc2luZwpzdGF0ZSBpcyBu
b3QgYW4gZXJyb3Igc3RhdGUsIGFuZCBjYW4gYmUgdXNlZCBhcyBwYXJ0IG9mIHRoZSBub3JtYWwK
ZmxvdyBvZiBhIFBWIGRldmljZSAoZm9yIGV4YW1wbGUgaW4gb3JkZXIgdG8gZm9yY2UgYSByZWNv
bm5lY3Rpb24pLgoKSSBkb24ndCB0aGluayB0aGVyZSdzIGEgZG9jdW1lbnRlZCB3YXkgb2YgcmVw
b3J0aW5nIGFuIHVucmVjb3ZlcmFibGUKUFYgZnJvbnRlbmQgZXJyb3IsIGJ1dCBJIG1pZ2h0IGJl
IG1pc3Rha2VuLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
