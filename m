Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690C9C422C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 23:00:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFPDA-0003fd-3Z; Tue, 01 Oct 2019 20:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFPD8-0003fX-Iy
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 20:57:30 +0000
X-Inumbo-ID: 14aee15c-e48e-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 14aee15c-e48e-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 20:57:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A323215EA;
 Tue,  1 Oct 2019 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569963449;
 bh=fqpvqWc+p1i06Z8j+u3qFZCAXjORC6hlyz0QHw207RU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XSJTjX1GUyz6T8k9LOAJgEDRO997hwaHNRgC0iTBjh17+2ExU7E19pY7IkY6bD3gn
 16GjJh5f6wPvnRXIIpv1APigM+VH0HSXJPbDX2X/jKJlHVjzTOhtjn2oNm7F7lNJ/E
 eIPJ6vNIxLgk16htYGVKs5arC7c7gsOCtAJPhaAE=
Date: Tue, 1 Oct 2019 13:57:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-7-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011357091.20899@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-7-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 06/10] xen/arm: Move
 ARCH_PATCH_INSN_SIZE out of the header livepatch.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, andrii.anisov@gmail.com,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIGlzIGRlZmluZWQgaW4gdGhlIGhlYWRlcgo+IGxpdmVwYXRj
aC5oLiBIb3dldmVyLCB0aGlzIGlzIGFsc28gdXNlZCBpbiB0aGUgYWx0ZXJuYXRpdmUgY29kZS4K
PiAKPiBSYXRoZXIgdGhhbiBpbmNsdWRpbmcgbGl2ZXBhdGNoLmgganVzdCBmb3IgdXNpbmcgdGhl
IGRlZmluZSwgbW92ZSBpdCBpbgo+IHRoZSBoZWFkZXIgaW5zbi5oIHdoaWNoIHNlZW1zIG1vcmUg
c3VpdGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMgICAgICB8IDIgLS0K
PiAgeGVuL2luY2x1ZGUvYXNtLWFybS9pbnNuLmggICAgICB8IDMgKysrCj4gIHhlbi9pbmNsdWRl
L2FzbS1hcm0vbGl2ZXBhdGNoLmggfCA0ICstLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
bHRlcm5hdGl2ZS5jIGIveGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMKPiBpbmRleCA1MmVkN2Vk
ZjY5Li4yMzdjNGU1NjQyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hbHRlcm5hdGl2ZS5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMKPiBAQCAtMzAsOCArMzAsNiBAQAo+
ICAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUu
aD4KPiAgI2luY2x1ZGUgPGFzbS9pbnNuLmg+Cj4gLS8qIFhYWDogTW92ZSBBUkNIX1BBVENIX0lO
U05fU0laRSBvdXQgb2YgbGl2ZXBhdGNoLmggKi8KPiAtI2luY2x1ZGUgPGFzbS9saXZlcGF0Y2gu
aD4KPiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gIAo+ICAvKiBPdmVycmlkZSBtYWNyb3MgZnJv
bSBhc20vcGFnZS5oIHRvIG1ha2UgdGhlbSB3b3JrIHdpdGggbWZuX3QgKi8KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9pbnNuLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24u
aAo+IGluZGV4IDM0ODkxNzk4MjYuLjE5Mjc3MjEyZTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLWFybS9pbnNuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaAo+IEBA
IC0xMSw2ICsxMSw5IEBACj4gICMgZXJyb3IgInVua25vd24gQVJNIHZhcmlhbnQiCj4gICNlbmRp
Zgo+ICAKPiArLyogT24gQVJNMzIsNjQgaW5zdHJ1Y3Rpb25zIGFyZSBhbHdheXMgNCBieXRlcyBs
b25nLiAqLwo+ICsjZGVmaW5lIEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIDQKPiArCj4gICNlbmRpZiAv
KiAhX19BUkNIX0FSTV9JTlNOICovCj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9saXZlcGF0Y2guaCBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vbGl2ZXBhdGNoLmgKPiBpbmRleCA2YmNhNzlkZWI5Li4wMjZhZjVlN2RjIDEwMDY0NAo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbGl2ZXBhdGNoLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL2xpdmVwYXRjaC5oCj4gQEAgLTcsOSArNyw3IEBACj4gICNkZWZpbmUgX19YRU5f
QVJNX0xJVkVQQVRDSF9IX18KPiAgCj4gICNpbmNsdWRlIDx4ZW4vc2l6ZXMuaD4gLyogRm9yIFNa
XyogbWFjcm9zLiAqLwo+IC0KPiAtLyogT24gQVJNMzIsNjQgaW5zdHJ1Y3Rpb25zIGFyZSBhbHdh
eXMgNCBieXRlcyBsb25nLiAqLwo+IC0jZGVmaW5lIEFSQ0hfUEFUQ0hfSU5TTl9TSVpFIDQKPiAr
I2luY2x1ZGUgPGFzbS9pbnNuLmg+Cj4gIAo+ICAvKgo+ICAgKiBUaGUgdmEgb2YgdGhlIGh5cGVy
dmlzb3IgLnRleHQgcmVnaW9uLiBXZSBuZWVkIHRoaXMgYXMgdGhlCj4gLS0gCj4gMi4xMS4wCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
