Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49087B33C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 21:26:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsXhT-0008Pd-GK; Tue, 30 Jul 2019 19:22:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsXhR-0008PY-R9
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 19:22:17 +0000
X-Inumbo-ID: 572631cc-b2ff-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 572631cc-b2ff-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 19:22:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CB9B2067D;
 Tue, 30 Jul 2019 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564514535;
 bh=Bcb+FBOJ6m9lOAEtXvI/qC1e0ITei69pGRyxmMHgsqM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sjwr3rEI2GFLY2y+ro7EQRqEU70DCNZGbGxsLbh/7pC4DQvH9OP7bS3p0aO0Sgy1E
 N7Gzx53xQ/Jl9DbkgCiLILTeY/0upjugIweI1lblBHSWATxBZsZOYcgPF2z38wDDYc
 DtScSWik6cbprHfN8P+KGVjd38I0LK+uY+3wbMKU=
Date: Tue, 30 Jul 2019 12:22:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-21-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301222080.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-21-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 20/35] xen/arm32: head: Mark the end of
 subroutines with ENDPROC
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHB1dG4oKSBhbmQgcHV0
cygpIGFyZSB0d28gc3Vicm91dGluZXMuIEFkZCBFTkRQUk9DIGZvciB0aGUgYmVuZWZpdHMgb2YK
PiBzdGF0aWMgYW5hbHlzaXMgdG9vbHMgYW5kIHRoZSByZWFkZXIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdl
cyBpbiB2MjoKPiAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUwo+IGluZGV4IDk5ZjRhZjE4ZDguLjhiNGM4YTQ3MTQgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKPiBAQCAtNTE4LDYgKzUxOCw3IEBAIHB1dHM6Cj4gICAgICAgICAgbW92ZXEgcGMsIGxyCj4g
ICAgICAgICAgZWFybHlfdWFydF90cmFuc21pdCByMTEsIHIxCj4gICAgICAgICAgYiBwdXRzCj4g
K0VORFBST0MocHV0cykKPiAgCj4gIC8qCj4gICAqIFByaW50IGEgMzItYml0IG51bWJlciBpbiBo
ZXguICBTcGVjaWZpYyB0byB0aGUgUEwwMTEgVUFSVC4KPiBAQCAtNTM3LDYgKzUzOCw3IEBAIHB1
dG46Cj4gICAgICAgICAgc3VicyAgcjMsIHIzLCAjMQo+ICAgICAgICAgIGJuZSAgIDFiCj4gICAg
ICAgICAgbW92ICAgcGMsIGxyCj4gK0VORFBST0MocHV0bikKPiAgCj4gIGhleDogICAgLmFzY2lp
ICIwMTIzNDU2Nzg5YWJjZGVmIgo+ICAgICAgICAgIC5hbGlnbiAyCj4gLS0gCj4gMi4xMS4wCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
