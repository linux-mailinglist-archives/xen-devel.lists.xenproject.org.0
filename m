Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F1A6879
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57jv-0003vz-IS; Tue, 03 Sep 2019 12:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57jt-0003vu-No
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:16:49 +0000
X-Inumbo-ID: b3ee8192-ce44-11e9-8853-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3ee8192-ce44-11e9-8853-bc764e2007e4;
 Tue, 03 Sep 2019 12:16:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0EA4AD3C;
 Tue,  3 Sep 2019 12:16:47 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190903101428.3543-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <275b3560-2191-364a-96d8-214d6bdcac0d@suse.com>
Date: Tue, 3 Sep 2019 14:16:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903101428.3543-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] vpci: honor read-only devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxMjoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IERvbid0IGFsbG93
IHRoZSBoYXJkd2FyZSBkb21haW4gd3JpdGUgYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlIG9m
Cj4gZGV2aWNlcyBtYXJrZWQgYXMgcmVhZC1vbmx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2Ug
djI6Cj4gIC0gRml4IHRlc3QgaGFybmVzcy4KPiAgLSBEbyB0aGUgUk8gY2hlY2sgYmVmb3JlIHRo
ZSBvd25lcnNoaXAgb25lLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gQ2hhbmdlIHRoZSBh
cHByb2FjaCBhbmQgYWxsb3cgZnVsbCByZWFkIGFjY2Vzcywgd2hpbGUgbGltaXRpbmcKPiAgICB3
cml0ZSBhY2Nlc3MgdG8gZGV2aWNlcyBtYXJrZWQgUk8uCj4gLS0tCj4gIHRvb2xzL3Rlc3RzL3Zw
Y2kvZW11bC5oIHwgMyArKysKPiAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCA1ICsrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3RzL3ZwY2kvZW11bC5oIGIvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKPiBpbmRleCA1ZDQ3
NTQ0YmY3Li4yZTFkMzA1N2M5IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3RzL3ZwY2kvZW11bC5o
Cj4gKysrIGIvdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmgKPiBAQCAtOTIsNiArOTIsOSBAQCB0eXBl
ZGVmIHVuaW9uIHsKPiAgI2RlZmluZSB4ZnJlZShwKSBmcmVlKHApCj4gIAo+ICAjZGVmaW5lIHBj
aV9nZXRfcGRldl9ieV9kb21haW4oLi4uKSAmdGVzdF9wZGV2Cj4gKyNkZWZpbmUgcGNpX2dldF9y
b19tYXAoLi4uKSBOVUxMCj4gKwo+ICsjZGVmaW5lIHRlc3RfYml0KC4uLikgZmFsc2UKClRoZSBs
YXR0ZXIgc2VlbXMgcmF0aGVyIGRhbmdlcm91cyB0byBtZSwgYXMgYSBmdXJ0aGVyIGFkZGl0aW9u
IG9mCnRlc3RfYml0KCkgd291bGQgc2lsZW50bHkgYnVpbGQgZmluZSwgYnV0IHBvc3NpYmx5IHBy
b2R1Y2UgYSBub24tCndvcmtpbmcgYmluYXJ5LiBCdXQgeW91J3JlIHRoZSBkZWZhY3RvIG1haW50
YWluZXIgb2YgdGhpcwpoYXJuZXNzLCBzbyBpZiB5b3UgYmVsaWV2ZSBpdCdzIGZpbmUgc28gYmUg
aXQuIChJZiBldmVuCnhlbnBhZ2luZyBpcyBjb25zaWRlcmVkICJmaW5lIiB0byBpbmNsdWRlIHhj
X2JpdG9wcy5oLCBJIHdvbmRlcgppZiB0aGlzIGhhcm5lc3MgY291bGRuJ3QgZG8gc28gdG9vLiBB
bmQgdGhlbiB0aGVyZSBhcmUgdGhyZWUKdGVzdF9iaXQoKSBkZWZpbml0aW9ucyBvdmVyYWxsIHVu
ZGVyIHRvb2xzLyAtIEkgd29uZGVyIGlmIHRob3NlCmNvdWxkbid0IGJlIGNvbnNvbGlkYXRlZCBp
bnRvIGEgc2luZ2xlLCB1bml2ZXJzYWxseSB1c2FibGUgb25lLikKCj4gLS0tIGEveGVuL2RyaXZl
cnMvdnBjaS92cGNpLmMKPiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwo+IEBAIC00MTEs
NiArNDExLDcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50
IHJlZywgdW5zaWduZWQgaW50IHNpemUsCj4gICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
djsKPiAgICAgIGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyOwo+ICAgICAgdW5zaWduZWQg
aW50IGRhdGFfb2Zmc2V0ID0gMDsKPiArICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKnJvX21hcCA9
IHBjaV9nZXRfcm9fbWFwKHNiZGYuc2VnKTsKPiAgCj4gICAgICBpZiAoICFzaXplICkKPiAgICAg
IHsKPiBAQCAtNDE4LDYgKzQxOSwxMCBAQCB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRm
LCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPiAgICAgICAgICByZXR1cm47
Cj4gICAgICB9Cj4gIAo+ICsgICAgaWYgKCByb19tYXAgJiYgdGVzdF9iaXQoc2JkZi5iZGYsIHJv
X21hcCkgKQo+ICsgICAgICAgIC8qIElnbm9yZSB3cml0ZXMgdG8gcmVhZC1vbmx5IGRldmljZXMu
ICovCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAgIC8qCj4gICAgICAgKiBGaW5kIHRoZSBQ
Q0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLgo+ICAgICAgICogUGFzc3Rocm91Z2ggZXZlcnl0
aGluZyB0aGF0J3Mgbm90IHRyYXBwZWQuCj4gCgpUaGlzIHBhcnQKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
