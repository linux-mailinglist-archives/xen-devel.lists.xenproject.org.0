Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D42DDEC
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 15:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVyQK-0002cU-0e; Wed, 29 May 2019 13:15:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVyQJ-0002cP-9q
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:15:19 +0000
X-Inumbo-ID: cd99f5b1-8213-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd99f5b1-8213-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 13:15:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 07:15:17 -0600
Message-Id: <5CEE85E3020000780023371C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 07:15:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84C5020000780021F242@prv1-mh.provo.novell.com>
 <d516dd65-ed3c-0817-26ec-873315fecce3@citrix.com>
In-Reply-To: <d516dd65-ed3c-0817-26ec-873315fecce3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 28/50] x86emul: support AVX512F floating
 point manipulation insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDE0OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC05Njgx
LDYgKzk2OTYsMjEgQEAgeDg2X2VtdWxhdGUoCj4+ICAgICAgICAgIG9wX2J5dGVzID0gNDsKPj4g
ICAgICAgICAgZ290byBzaW1kX2ltbThfem1tOwo+PiAgCj4+ICsgICAgY2FzZSBYODZFTVVMX09Q
Q19FVkVYXzY2KDB4MGYzYSwgMHgyNik6IC8qIHZnZXRtYW50cHtzLGR9ICRpbW04LFt4eXpdbW0v
bWVtLFt4eXpdbW17a30gKi8KPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNh
LCAweDU0KTogLyogdmZpeHVwaW1tcHtzLGR9ICRpbW04LFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5
el1tbXtrfSAqLwo+PiArICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJmKTsK
Pj4gKyAgICAgICAgaWYgKCBlYS50eXBlICE9IE9QX1JFRyB8fCAhZXZleC5icnMgKQo+PiArICAg
ICAgICAgICAgYXZ4NTEyX3ZsZW5fY2hlY2soZmFsc2UpOwo+PiArICAgICAgICBnb3RvIHNpbWRf
aW1tOF96bW07Cj4+ICsKPj4gKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjNhLCAw
eDI3KTogLyogdmdldG1hbnRze3MsZH0gJGltbTgseG1tL21lbSx4bW0seG1te2t9ICovCj4+ICsg
ICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzYSwgMHg1NSk6IC8qIHZmaXh1cGltbXN7
cyxkfSAkaW1tOCx4bW0vbWVtLHhtbSx4bW17a30gKi8KPj4gKyAgICAgICAgaG9zdF9hbmRfdmNw
dV9tdXN0X2hhdmUoYXZ4NTEyZik7Cj4+ICsgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihl
YS50eXBlICE9IE9QX1JFRyAmJiBldmV4LmJycywgRVhDX1VEKTsKPiAKPiBXaHkgdGhlIGVhLnR5
cGUgIT0gT1BfUkVHIHJlc3RyaWN0aW9uPyAgVGhlc2UgZm91ciBpbnN0cnVjdGlvbnMgZG8gdGFr
ZQo+IG1lbW9yeSBvcGVyYW5kcy4KCkRpZCB5b3UgcGVyaGFwcyByZWFkIHRoZSAmJiBhcyB8fCA/
IFNjYWxhciBvcGVyYXRpb25zIChub3QganVzdCB0aGUKb25lcyBoZXJlKSBkb24ndCBzdXBwb3J0
IGJyb2FkY2FzdCAod2l0aCBhIG1lbW9yeSBvcGVyYW5kKSwgYnV0Cm1heSBzdXBwb3J0IGVtYmVk
ZGVkIHJvdW5kaW5nIChvciwgbGlrZSBoZXJlLCBqdXN0IFNBRTsgd2l0aCBhCnJlZ2lzdGVyIG9w
ZXJhbmQpLiBUaGUgZXhhY3Qgc2FtZSBjb25zdHJ1Y3QgZXhpc3RzIGUuZy4gYXQgdGhlCnNpbWRf
em1tX3NjYWxhcl9zYWUgbGFiZWwgKGFuZCB0aGUgYmxvY2sgb2YgY2FzZSBsYWJlbHMgYWhlYWQg
b2YKaXQgYWN0dWFsbHkgYWxzbyBnZXRzIGFkZGVkIHRvIGJ5IHRoZSBwYXRjaCBoZXJlKS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
