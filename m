Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC149528D1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 11:59:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfiBO-0004CC-6o; Tue, 25 Jun 2019 09:56:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfiBN-0004C7-D2
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 09:56:09 +0000
X-Inumbo-ID: 743c04c9-972f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 743c04c9-972f-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 09:56:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 03:56:07 -0600
Message-Id: <5D11EFB5020000780023AE25@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 03:56:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190624101723.23291-1-andrew.cooper3@citrix.com>
 <20190624101723.23291-3-andrew.cooper3@citrix.com>
In-Reply-To: <20190624101723.23291-3-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] xen/ubsan: Support for
 -fsanitise=builtin
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA2LjE5IGF0IDEyOjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBmaXhlcyB0aGUgVUJTQU4gYnVpbGQgZm9yIEdDQyA4IGFuZCBsYXRlci4gIFRo
ZSBzYW5pdGlzZXIgY2hlY2tzIGZvcgo+IHBhc3NpbmcgMCB0byB0aGUgY3R6KCkvY2x6KCkgYnVp
bHRpbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KCkZ1bmRhbWVudGFsbHkKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkhvd2V2ZXIsCgo+IC0tLSBhL3hlbi9jb21tb24vdWJzYW4vdWJzYW4uYwo+
ICsrKyBiL3hlbi9jb21tb24vdWJzYW4vdWJzYW4uYwo+IEBAIC01MTgsMyArNTE4LDI0IEBAIHZv
aWQgX191YnNhbl9oYW5kbGVfcG9pbnRlcl9vdmVyZmxvdyhzdHJ1Y3QgcG9pbnRlcl9vdmVyZmxv
d19kYXRhICpkYXRhLAo+ICAKPiAgCXVic2FuX2VwaWxvZ3VlKCZmbGFncyk7Cj4gIH0KPiArCj4g
K3ZvaWQgX191YnNhbl9oYW5kbGVfaW52YWxpZF9idWlsdGluKHN0cnVjdCBpbnZhbGlkX2J1aWx0
aW5fZGF0YSAqZGF0YSkKPiArewo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCWNvbnN0IGNo
YXIgKmZuOwo+ICsKPiArCWlmIChzdXBwcmVzc19yZXBvcnQoJmRhdGEtPmxvY2F0aW9uKSkKPiAr
CQlyZXR1cm47Cj4gKwo+ICsJdWJzYW5fcHJvbG9ndWUoJmRhdGEtPmxvY2F0aW9uLCAmZmxhZ3Mp
Owo+ICsKPiArCXN3aXRjaCAoZGF0YS0+a2luZCkgewo+ICsJY2FzZSBraW5kX2N0ejogZm4gPSAi
Y3R6IjsgYnJlYWs7Cj4gKwljYXNlIGtpbmRfY2x6OiBmbiA9ICJjbHoiOyBicmVhazsKPiArCWRl
ZmF1bHQ6IGZuID0gIjxVTktOT1dOPiI7IGJyZWFrOwo+ICsJfQo+ICsKPiArCXByX2VycigicGFz
c2luZyB6ZXJvIHRvICVzKCksIHdoaWNoIGlzIG5vdCBhIHZhbGlkIGFyZ3VtZW50XG4iLCBmbik7
CgouLi4gbG9nZ2luZyB0aGUgdW5rbm93biBlbnVtZXJhdG9yIHZhbHVlIG1pZ2h0IHR1cm4gb3V0
IGhlbHBmdWwKZG93biB0aGUgcm9hZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
