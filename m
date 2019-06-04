Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF13420D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 10:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY4yb-00036j-5X; Tue, 04 Jun 2019 08:39:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rj+d=UD=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hY4ya-00036e-3A
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:39:24 +0000
X-Inumbo-ID: 39d14fca-86a4-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39d14fca-86a4-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 08:39:18 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 4 Jun
 2019 16:36:59 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <08d5ca37f0803dc7aa9906a9478407c3@sslemail.net>
 <5CF619640200007800234E6E@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <01f51119-2964-4b8f-0f97-d89cf38326bd@mxnavi.com>
Date: Tue, 4 Jun 2019 16:39:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF619640200007800234E6E@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH v1] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvNC8xOSAxNToxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDYuMTkgYXQg
MDI6NDQsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL3RyYWNlLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKPj4gQEAgLTIx
LDEyICsyMSwxNSBAQAo+PiAgICNpZm5kZWYgX19YRU5fVFJBQ0VfSF9fCj4+ICAgI2RlZmluZSBf
X1hFTl9UUkFDRV9IX18KPj4gICAKPj4gKyNpZmRlZiBDT05GSUdfVFJBQ0VCVUZGRVIKPj4gICBl
eHRlcm4gaW50IHRiX2luaXRfZG9uZTsKPj4gKyNlbmRpZgo+IElmIHRoaXMgaXMgdG8gc3RheSB1
cCBoZXJlICh3aGljaCBJJ20gc3RpbGwgbm90IHN1cmUgaXQgbmVlZHMgdG87IEkgaGFkCj4gbWVy
ZWx5IGluZGljYXRlZCB0aGF0IHRoZXJlIGxpa2VseSBpcyBhIHJlYXNvbiBmb3IgdGhpcyB3aXRo
b3V0IGFjdHVhbGx5Cj4ga25vd2luZyB3aGF0IHRoYXQgcmVhc29uIG1pZ2h0IGJlKSwgdGhlbiBJ
IHRoaW5rIHRoZSAjZGVmaW5lIG5lZWRzCj4gdG8gZ28gaGVyZSBhcyB3ZWxsLCBpbiBhbiAjZWxz
ZS4KClllcywgbmVlZCB0byBzdGF5IGhlcmUgYmVjYXVzZSAndGJfaW5pdF9kb25lJyB1c2VkIGlu
ICdhc20teDg2L3RyYWNlLmgnCgp3aGljaCBpbmNsdWRlZMKgIGJ5ICd4ZW4vdHJhY2UuaCfCoCBh
dCBsaW5lIDMyOiAjaW5jbHVkZSA8YXNtL3RyYWNlLmg+Cgp3aWxsIGJlIGZpeGVkIGluIG5leHQg
dmVyc2lvbi4KCj4KPj4gQEAgLTQ3LDYgKzUwLDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0cmFj
ZV92YXIodTMyIGV2ZW50LCBpbnQgY3ljbGVzLCBpbnQgZXh0cmEsCj4+ICAgdm9pZCBfX3RyYWNl
X2h5cGVyY2FsbCh1aW50MzJfdCBldmVudCwgdW5zaWduZWQgbG9uZyBvcCwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHhlbl91bG9uZ190ICphcmdzKTsKPj4gICAKPj4gKyNlbHNl
Cj4+ICsjZGVmaW5lIHRiX2luaXRfZG9uZSBmYWxzZQo+PiArc3RhdGljIGlubGluZSB2b2lkIGlu
aXRfdHJhY2VfYnVmcyh2b2lkKSB7fQo+PiArc3RhdGljIGlubGluZSBpbnQgdGJfY29udHJvbChz
dHJ1Y3QgeGVuX3N5c2N0bF90YnVmX29wICp0YmMpIHsgcmV0dXJuIC1FTk9TWVM7IH0KPiAtRU9Q
Tk9UU1VQUAo+Cj4gSmFuCj4KPgo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
