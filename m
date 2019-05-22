Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9425FC3
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 10:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTMs7-0001tZ-M7; Wed, 22 May 2019 08:45:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTMs5-0001tU-W6
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 08:45:14 +0000
X-Inumbo-ID: e7e46aa8-7c6d-11e9-8947-0755d393a407
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7e46aa8-7c6d-11e9-8947-0755d393a407;
 Wed, 22 May 2019 08:45:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 02:45:08 -0600
Message-Id: <5CE50C12020000780023137C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 02:45:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
In-Reply-To: <20190521212530.12706-2-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 tee-dev@lists.linaro.org, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDIzOjI1LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICB8ICAgNiArKwo+ICB4ZW4vYXJj
aC9hcm0vS2NvbmZpZyAgICAgICAgICB8ICAgNyArKysKPiAgeGVuL2FyY2gvYXJtL01ha2VmaWxl
ICAgICAgICAgfCAgIDEgKwo+ICB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICB8ICAxOCAr
KysrKysKPiAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgfCAgIDIgKwo+ICB4ZW4vYXJj
aC9hcm0vdGVlL01ha2VmaWxlICAgICB8ICAgMSArCj4gIHhlbi9hcmNoL2FybS90ZWUvdGVlLmMg
ICAgICAgIHwgIDkzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHhlbi9hcmNoL2Fy
bS92c21jLmMgICAgICAgICAgIHwgICA1ICsrCj4gIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAg
ICAgIHwgICA3ICsrKwo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAgMSArCj4g
IHhlbi9pbmNsdWRlL2FzbS1hcm0vdGVlL3RlZS5oIHwgMTA5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggfCAgIDMgKwo+
ICAxMiBmaWxlcyBjaGFuZ2VkLCAyNTMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gvYXJtL3RlZS9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Fy
Y2gvYXJtL3RlZS90ZWUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLWFy
bS90ZWUvdGVlLmgKCkkgZG9uJ3QgdGhpbmsgSSdtIGFza2luZyB0aGlzIGZvciB0aGUgZmlyc3Qg
dGltZTogV2h5IGFtIEkgYmVpbmcgQ2MtZWQKaGVyZT8gSXQncyBhbGwgQXJtIGNvZGUgdGhhdCBn
ZXRzIGNoYW5nZWQsIGFuZCB0aGUgTUFJTlRBSU5FUlMKYWRkaXRpb24gYWxvbmUgaW1vIGRvZXNu
J3Qgd2FycmFudCB3aWRlbmluZyB0aGUgQ2MgbGlzdC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
