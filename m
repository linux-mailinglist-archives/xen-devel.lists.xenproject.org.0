Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9360C945A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:29:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn4p-0001YN-Vu; Wed, 02 Oct 2019 22:26:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn4o-0001YI-Hq
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 22:26:30 +0000
X-Inumbo-ID: ae17946c-e563-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id ae17946c-e563-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 22:26:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3567B2133F;
 Wed,  2 Oct 2019 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055189;
 bh=ennRcql1p1t4aHL3MZjkZHxnLrnsORCsr3DFObEyIAg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lpugrAE3QLB8QisNSpwt6fI9H9uWmUS2tsDY+/JN+95cPZ6vkufsC1FHHn11UHKBj
 BzJGH8bjXNYQ/XTdKi0vWtjkVetMTA6dpi3xtT3FFlRcE8IQHvSju3H7UAyMGIpmwE
 jj9ubzjH/e12odEioeQd4Ye9ZP7LxVGutzVeDk6U=
Date: Wed, 2 Oct 2019 15:26:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191002180047.17144-5-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910021448480.2691@sstabellini-ThinkPad-T480s>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-5-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 4/6] xen/arm: cpufeature: Match
 register size with value size in cpus_have_const_cap
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ2xhbmcgaXMgcGlja2ll
ciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0YXRlbWVudC4gSXQKPiBl
eHBlY3RzIHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+IAo+IFRo
ZSBhc20gc3RhdGVtZW50IGV4cGVjdHMgYSAzMi1iaXQgKHJlc3AuIDY0LWJpdCkgdmFsdWUgb24g
QXJtMzIKPiAocmVzcC4gQXJtNjQpIHdoZXJlYXMgdGhlIHZhbHVlIGlzIGEgYm9vbGVhbiAoQ2xh
bmcgY29uc2lkZXIgdG8gYmUKPiAzMi1iaXQpLgo+IAo+IEl0IHdvdWxkIGJlIHBvc3NpYmxlIHRv
IGltcG9zZSAzMi1iaXQgcmVnaXN0ZXIgZm9yIGJvdGggYXJjaGl0ZWN0dXJlCj4gYnV0IHRoaXMg
cmVxdWlyZSB0aGUgY29kZSB0byB1c2UgX19PUDMyLiBIb3dldmVyLCBpdCBkb2VzIG5vIHJlYWxs
eQo+IGltcHJvdmUgdGhlIGFzc2VtYmx5IGdlbmVyYXRlZC4gSW5zdGVhZCwgcmVwbGFjZSBzd2l0
Y2ggdGhlIHZhcmlhYmxlIHRvCj4gdXNlIHJlZ2lzdGVyX3QuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCgpXaXRoIG9yIHdpdGhvdXQgISEg
Z2l2ZW4gdGhhdCBpdCdzIHBhcnQgb2YgdW5saWtlbHkuCgpBY2tlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4g
djI6Cj4gICAgICAgICAtIFVzZSAhISBwZXIgU3RlZmFubydzIHJlcXVlc3QKPiAtLS0KPiAgeGVu
L2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1
cmUuaAo+IGluZGV4IGMyYzhmMzQxN2MuLjRjNWZmNmU4YWMgMTAwNjQ0Cj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2Nw
dWZlYXR1cmUuaAo+IEBAIC02NywxNCArNjcsMTQgQEAgc3RhdGljIGlubGluZSBib29sIGNwdXNf
aGF2ZV9jYXAodW5zaWduZWQgaW50IG51bSkKPiAgCj4gIC8qIFN5c3RlbSBjYXBhYmlsaXR5IGNo
ZWNrIGZvciBjb25zdGFudCBjYXAgKi8KPiAgI2RlZmluZSBjcHVzX2hhdmVfY29uc3RfY2FwKG51
bSkgKHsgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICBib29sIF9fcmV0OyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICByZWdpc3Rlcl90IF9fcmV0OyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICBhc20gdm9sYXRpbGUgKEFMVEVSTkFU
SVZFKCJtb3YgJTAsICMwIiwgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJtb3YgJTAsICMxIiwgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG51bSkgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgIDogIj1yIiAo
X19yZXQpKTsgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICB1bmxpa2VseShfX3JldCk7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICB1bmxpa2VseSghIV9fcmV0KTsgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICB9KQo+ICAKPiAgc3RhdGljIGlubGlu
ZSB2b2lkIGNwdXNfc2V0X2NhcCh1bnNpZ25lZCBpbnQgbnVtKQo+IC0tIAo+IDIuMTEuMAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
