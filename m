Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F114B45C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwQAt-0000RG-3H; Tue, 28 Jan 2020 12:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwQAr-0000R6-V4
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 12:40:57 +0000
X-Inumbo-ID: 6e58f87e-41cb-11ea-ad98-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e58f87e-41cb-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 12:40:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwQAp-0007gU-Fs; Tue, 28 Jan 2020 12:40:55 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwQAp-00055Q-5T; Tue, 28 Jan 2020 12:40:55 +0000
Date: Tue, 28 Jan 2020 12:40:51 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200128124051.oyve4k3jx4yowroh@debian>
References: <20200127164547.5993-1-ian.jackson@eu.citrix.com>
 <7d8076d81f53462999e109fff47ad38d@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d8076d81f53462999e109fff47ad38d@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] docs: Fix StudlyCaps in
 libxc-migration-stream.pandoc and xl.1.pod
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDQ6NTc6NTdQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDI3IEphbnVhcnkgMjAyMCAx
Njo0Ngo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IElhbiBKYWNrc29uCj4gPiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVy
Cj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5E
dW5sYXBAZXUuY2l0cml4LmNvbT47Cj4gPiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkCj4gPiBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+ID4gPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiBTdWJqZWN0OiBbUEFUQ0hdIGRvY3M6IEZpeCBTdHVkbHlD
YXBzIGluIGxpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jIGFuZAo+ID4geGwuMS5wb2QKPiA+
IAo+ID4gJCBnaXQtZ3JlcCBsaWJ4ZW5jdHJsIHwgd2MgLWwKPiA+IDk5Cj4gPiAkIGdpdC1ncmVw
IGxpYnhjIHwgd2MgLWwKPiA+IDIwNgo+ID4gJCBnaXQtZ3JlcCBsaWJ4ZW5saWdodCB8IHdjIC1s
Cj4gPiA0OAo+ID4gJCBnaXQtZ3JlcCBsaWJ4bCB8IHdjIC1sCj4gPiAxMzQzMwo+ID4gJCBnaXQt
Z3JlcCBMaWJYZW4gfCB3YyAtbAo+ID4gMgo+ID4gJAo+ID4gCj4gPiBSZXBvcnRlZC1ieTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICBkb2NzL21hbi94
bC4xLnBvZC5pbiAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIGRvY3Mvc3BlY3MvbGli
eGMtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MgfCAyICstCj4gCj4gV2hhdCBhYm91dCBkb2NzL3Nw
ZWNzL2xpYnhsLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jPyBJdCBjb3VsZCB1c2UgYSBzaW1pbGFy
IGZpeCB3aGlsZSB5b3UncmUgYXQgaXQuCgpQYXRjaCBzZW50LgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
