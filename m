Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3760178E7A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:34:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RJF-00073a-QI; Wed, 04 Mar 2020 10:31:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9RJE-00073V-N6
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:31:24 +0000
X-Inumbo-ID: 4bcaca7c-5e03-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bcaca7c-5e03-11ea-b74d-bc764e2007e4;
 Wed, 04 Mar 2020 10:31:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3824CAEC7;
 Wed,  4 Mar 2020 10:31:23 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200304102523.52454-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8ae8dd4-5104-4108-0e5a-849c50fc270a@suse.com>
Date: Wed, 4 Mar 2020 11:31:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304102523.52454-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/dom0: improve PVH initrd and
 metadata placement
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxMToyNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IERvbid0IGFzc3Vt
ZSB0aGVyZSdzIGdvaW5nIHRvIGJlIGVub3VnaCBzcGFjZSBhdCB0aGUgdGFpbCBvZiB0aGUKPiBs
b2FkZWQga2VybmVsIGFuZCBpbnN0ZWFkIHRyeSB0byBmaW5kIGEgc3VpdGFibGUgbWVtb3J5IGFy
ZWEgd2hlcmUgdGhlCj4gaW5pdHJkIGFuZCBtZXRhZGF0YSBjYW4gYmUgbG9hZGVkLgo+IAo+IFJl
cG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KcHJlZmVyYWJseSB3aXRo
LCBhcyBBbmRyZXcgc3VnZ2VzdGVkLCAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20w
X2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+IEBAIC00OTAs
NiArNDkwLDQ1IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9wMm0oc3RydWN0IGRv
bWFpbiAqZCkKPiAgI3VuZGVmIE1CMV9QQUdFUwo+ICB9Cj4gIAo+ICtzdGF0aWMgcGFkZHJfdCBm
aW5kX21lbW9yeShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgZWxmX2JpbmFy
eSAqZWxmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSkKPiArewo+
ICsgICAgcGFkZHJfdCBrZXJuZWxfc3RhcnQgPSAocGFkZHJfdCllbGYtPmRlc3RfYmFzZSAmIFBB
R0VfTUFTSzsKPiArICAgIHBhZGRyX3Qga2VybmVsX2VuZCA9IFJPVU5EVVAoKHBhZGRyX3QpZWxm
LT5kZXN0X2Jhc2UgKyBlbGYtPmRlc3Rfc2l6ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUEFHRV9TSVpFKTsKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgIC8q
Cj4gKyAgICAgKiBUaGUgbWVtb3J5IG1hcCBpcyBzb3J0ZWQgYW5kIGFsbCBSQU0gcmVnaW9ucyBz
dGFydHMgYW5kIHNpemVzIGFyZQo+ICsgICAgICogYWxpZ25lZCB0byBwYWdlIGJvdW5kYXJpZXMu
Cj4gKyAgICAgKi8KPiArICAgIGZvciAoIGkgPSAwOyBpIDwgZC0+YXJjaC5ucl9lODIwOyBpKysg
KQo+ICsgICAgewo+ICsgICAgICAgIHBhZGRyX3Qgc3RhcnQsIGVuZCA9IGQtPmFyY2guZTgyMFtp
XS5hZGRyICsgZC0+YXJjaC5lODIwW2ldLnNpemU7Cj4gKwo+ICsgICAgICAgIC8qIERvbid0IHVz
ZSBtZW1vcnkgYmVsb3cgMU1CLCBhcyBpdCBjb3VsZCBvdmVyd3JpdGUgdGhlIEJEQS9FQkRBLiAq
LwoKLi4uIElCRlQgYWRkZWQgaGVyZSAoSSdtIG5vdCB3b3JyaWVkIHNvIG11Y2ggYWJvdXQgd2hl
dGhlciBCREEgcmVtYWlucwpoZXJlIG9yIGdldHMgZHJvcHBlZCkuIFRoaXMgY291bGQgb2YgY291
cnNlIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
