Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE78488D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 11:24:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvI8Z-0007PK-3p; Wed, 07 Aug 2019 09:21:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvI8X-0007PF-LP
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:21:37 +0000
X-Inumbo-ID: c0abec4b-b8f4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0abec4b-b8f4-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 09:21:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01AECAC20;
 Wed,  7 Aug 2019 09:21:34 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-2-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25891f16-43ae-96c5-1016-672668a5b759@suse.com>
Date: Wed, 7 Aug 2019 11:21:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730134419.2739-2-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/6] domain: introduce XEN_DOMCTL_CDF_iommu
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNTo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwo+IEBAIC02NzMsOCAr
NjczLDcgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgCj4g
ICAgICAgQVNTRVJUKGNvbmZpZyAhPSBOVUxMKTsKPiAgIAo+IC0gICAgLyogcDJtX2luaXQgcmVs
aWVzIG9uIHNvbWUgdmFsdWUgaW5pdGlhbGl6ZWQgYnkgdGhlIElPTU1VIHN1YnN5c3RlbSAqLwo+
IC0gICAgaWYgKCAocmMgPSBpb21tdV9kb21haW5faW5pdChkKSkgIT0gMCApCj4gKyAgICBpZiAo
IGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgKHJjID0gaW9tbXVfZG9tYWluX2luaXQoZCkpICE9IDAg
KQo+ICAgICAgICAgICBnb3RvIGZhaWw7CgpJbnN0ZWFkIG9mIHRoaXMgYW5kIC4uLgoKPiAtLS0g
YS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBA
QCAtNjA0LDcgKzYwNCw3IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAq
ZCwKPiAgICAgICBpZiAoIChyYyA9IGluaXRfZG9tYWluX2lycV9tYXBwaW5nKGQpKSAhPSAwICkK
PiAgICAgICAgICAgZ290byBmYWlsOwo+ICAgCj4gLSAgICBpZiAoIChyYyA9IGlvbW11X2RvbWFp
bl9pbml0KGQpKSAhPSAwICkKPiArICAgIGlmICggaXNfaW9tbXVfZW5hYmxlZChkKSAmJiAocmMg
PSBpb21tdV9kb21haW5faW5pdChkKSkgIT0gMCApCj4gICAgICAgICAgIGdvdG8gZmFpbDsKCi4u
LiB0aGlzIChhbmQgYW55IGZ1cnRoZXIgY29waWVzIGluIGZ1dHVyZSBwb3J0cyksIHdvdWxkbid0
IGl0CmJlIGJldHRlciB0byBjZW50cmFsbHkgZG8gdGhpcyBpbiBpb21tdV9kb21haW5faW5pdCgp
IGl0c2VsZj8KCj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24v
ZG9tYWluLmMKPiBAQCAtMzAxLDcgKzMwMSw4IEBAIHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWlu
X2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX2hhcCB8Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3JpdHkgfAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfb29zX29mZiB8Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbikgKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl94c19kb21haW4gfAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9pb21tdSkgKQo+ICAgICAgIHsKPiAg
ICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlVua25vd24gQ0RGIGZsYWdzICUjeFxuIiwg
Y29uZmlnLT5mbGFncyk7Cj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKQWxzbyByZWZ1c2Ug
WEVOX0RPTUNUTF9DREZfaW9tbXUgd2hlbiAhaW9tbXVfZW5hYmxlZD8KCj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+IEBAIC05
ODEsNiArOTgxLDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc194ZW5zdG9yZV9kb21haW4oY29u
c3Qgc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgICByZXR1cm4gZC0+b3B0aW9ucyAmIFhFTl9ET01D
VExfQ0RGX3hzX2RvbWFpbjsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfaW9t
bXVfZW5hYmxlZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICByZXR1cm4gZC0+
b3B0aW9ucyAmIFhFTl9ET01DVExfQ0RGX2lvbW11Owo+ICt9CgpQZXJoYXBzIHdyYXAgaW4gZXZh
bHVhdGVfbm9zcGVjKCk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
