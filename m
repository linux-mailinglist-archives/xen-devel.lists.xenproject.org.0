Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C14109F5F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:40:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZb2X-0003ac-MO; Tue, 26 Nov 2019 13:38:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYem=ZS=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1iZb2W-0003aX-0S
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:38:00 +0000
X-Inumbo-ID: f5275112-1051-11ea-83b8-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f5275112-1051-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 13:37:59 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20191125205800.64602-1-jeff.kubascik@dornerworks.com>
 <750f31db-87d8-65ba-bf4d-eff3471d1143@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <38eb2dda-535b-0f49-45a1-4028e4597720@dornerworks.com>
Date: Tue, 26 Nov 2019 08:38:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <750f31db-87d8-65ba-bf4d-eff3471d1143@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.171]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: initialize vpl011 flag register
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjUvMjAxOSA1OjE3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MjUvMTEvMjAxOSAyMDo1OCwgSmVmZiBLdWJhc2NpayB3cm90ZToKPj4gVGhlIHR4L3J4IGZpZm8g
ZmxhZ3Mgd2VyZSBub3Qgc2V0IHdoZW4gdGhlIHZwbDAxMSBpcyBpbml0aWFsaXplZC4gVGhpcwo+
PiBpcyBhIHByb2JsZW0gZm9yIGNlcnRhaW4gZ3Vlc3RzIHRoYXQgYXJlIG9wZXJhdGluZyBpbiBw
b2xsZWQgbW9kZSwgYXMgYQo+PiBndWVzdCB3aWxsIGdlbmVyYWxseSBjaGVjayB0aGUgcnggZmlm
byBlbXB0eSBmbGFnIHRvIGRldGVybWluZSBpZiB0aGVyZQo+PiBpcyBkYXRhIGJlZm9yZSBkb2lu
ZyBhIHJlYWQuIFRoZSByZXN1bHQgaXMgYSBjb250aW51b3VzIHNwYW0gb2YgdGhlCj4+IG1lc3Nh
Z2UgInZwbDAxMTogVW5leHBlY3RlZCBJTiByaW5nIGJ1ZmZlciBlbXB0eSIgYmVmb3JlIHRoZSBm
aXJzdCB2YWxpZAo+PiBjaGFyYWN0ZXIgaXMgcmVjZWl2ZWQuIFRoaXMgaW5pdGlhbGl6ZXMgdGhl
IGZsYWcgc3RhdHVzIHJlZ2lzdGVyIHRvIHRoZQo+PiBkZWZhdWx0IHNwZWNpZmllZCBpbiB0aGUg
UEwwMTEgdGVjaG5pY2FsIHJlZmVyZW5jZSBtYW51YWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpl
ZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgo+IAo+IFlvdSBjb3Vs
ZCBoYXZlIHJldGFpbmVkIG15IGFja2VkLWJ5IGhlcmUgOikuCj4gCj4gQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpBcG9sb2dpZXMsIEknbSBzdGlsbCBnZXR0aW5nIHVz
ZWQgdG8gc3VibWl0dGluZyBwYXRjaGVzIGJ5IG1haWxpbmcgbGlzdC4KCj4gV2UgYXJlIGluIGxh
dGUgc3RhZ2UgZm9yIFhlbiA0LjEzIGFuZCBmcm9tIHdoYXQgeW91IHNheSB0aGlzIHdpbGwgb25s
eQo+IHNwYW0gdGhlIGNvbnNvbGUgKHRob3VnaCBpdCBpcyByYXRlLWxpbWl0ZWQpLiBTbyBJIGRv
bid0IGludGVuZCB0bwo+IHJlcXVlc3QgdG8gYmUgbWVyZ2VkIGluIFhlbiA0LjEzIChmZWVsIGZy
ZWUgdG8gcmVxdWVzdCBpdCBpZiB5b3UgdGhpbmsKPiBpdCBpcyB3b3J0aCBpdCkuCj4gCj4gSW5z
dGVhZCwgSSB3aWxsIHF1ZXVlIGl0IGZvciB0aGUgbmV4dCByZWxlYXNlIGluIG15IGJyYW5jaCBm
b3ItbmV4dC80LjE0LgoKU291bmRzIGdvb2QhCgo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIE1v
dmVkIHVhcnRmciBpbml0aWFsaXphdGlvbiB0byBsYXRlciBwb2ludCBpbiBmdW5jdGlvbiBhZnRl
ciBwb3RlbnRpYWwKPj4gcmV0dXJuL2ZhaWx1cmUgcG9pbnRzCj4gV2UgZG9uJ3QgY29tbWl0IHRo
ZSBjaGFuZ2Vsb2cuIFRvIGhlbHAgbWFraW5nIHRoZSBjb21taXR0ZXJzIGxpZmUKPiBib3Jpbmcs
IEkgd291bGQgcmVjb21tZW5kIHRvIGFkZCAtLS0gYmVmb3JlIGl0LiBnaXQgYW0gd2lsbCBzdHJp
cHBlZAo+IGFueXRoaW5nIGFmdGVyIGl0Lgo+IAo+PiAtLS0KPiAKPiBTaW1pbGFyIHRvIHRoaXMg
b25lLgo+IAo+PiAgIHhlbi9hcmNoL2FybS92cGwwMTEuYyB8IDIgKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnBs
MDExLmMgYi94ZW4vYXJjaC9hcm0vdnBsMDExLmMKPj4gaW5kZXggN2JjNWVlYjIwNy4uODk1ZjQz
NmNjNCAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwbDAxMS5jCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS92cGwwMTEuYwo+PiBAQCAtNjY4LDYgKzY2OCw4IEBAIGludCBkb21haW5fdnBsMDEx
X2luaXQoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZwbDAxMV9pbml0X2luZm8gKmluZm8pCj4+
ICAgICAgICAgICBnb3RvIG91dDI7Cj4+ICAgICAgIH0KPj4KPj4gKyAgICB2cGwwMTEtPnVhcnRm
ciA9IFRYRkUgfCBSWEZFOwo+PiArCj4+ICAgICAgIHNwaW5fbG9ja19pbml0KCZ2cGwwMTEtPmxv
Y2spOwo+Pgo+PiAgICAgICByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoZCwgJnZwbDAxMV9tbWlvX2hh
bmRsZXIsCj4+Cj4gCj4gLS0KPiBKdWxpZW4gR3JhbGwKPiAKCkdvb2QgdG8ga25vdywgSSB3aWxs
IGRvIHRoaXMgbmV4dCB0aW1lLgoKVGhhbmtzLApKZWZmIEt1YmFzY2lrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
