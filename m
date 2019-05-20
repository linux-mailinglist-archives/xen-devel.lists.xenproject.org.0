Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCA243D1
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 00:59:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSrD4-0005Qr-Hk; Mon, 20 May 2019 22:56:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSrD3-0005QZ-9X
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 22:56:45 +0000
X-Inumbo-ID: 89c8b927-7b52-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 89c8b927-7b52-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 22:56:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9689921479;
 Mon, 20 May 2019 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558393003;
 bh=IPq9dJTZgVA/smNyEgsVJ17Sjn+z5swpZAyvcDeE97A=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hj7uvqtsNF7EwOugnhI8g5Jsk6l0HryLXicyLjK0hJq7t7CiMCSRNjQPMf1pXJipJ
 ACNyoTHk/+ilZNkKEKWMW4H1O8lr6T5w/I9fngvw+MrFN3Y/oyDjcVok8vOymUj5c6
 /L9LkU4XUwzLaRQsngySHJvfb2eLbGJCoqJQeOFI=
Date: Mon, 20 May 2019 15:56:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-10-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201553120.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-10-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 09/19] xen/arm64: head:
 Correctly report the HW CPU ID
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
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZXJlIGFyZSBubyBy
ZWFzb24gdG8gY29uc2lkZXIgdGhlIEhXIENQVSBJRCB3aWxsIGJlIDAgd2hlbiB0aGUKPiBwcm9j
ZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJlc3QsIHRoaXMgd2ls
bCByZXN1bHQgdG8KPiBjb25mbGljdGluZyBvdXRwdXQgYXMgdGhlIHJlc3Qgb2YgWGVuIHVzZSB0
aGUgdmFsdWUgZGlyZWN0bHkgcmVhZCBmcm9tCj4gTVBJRFJfRUwxLgo+IAo+IFNvIHJlbW92ZSB0
aGUgemVyb2luZyBhbmQgbG9naWMgdG8gY2hlY2sgaWYgdGhlIENQVSBpcyBwYXJ0IG9mIGEKPiB1
bmlwcm9jZXNzb3Igc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAt
IEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVh
ZC5TIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4gaW5kZXggYjk1N2ViOTBmYi4uMDgwOTRhMjczZSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+
IEBAIC0yNzcsMTUgKzI3Nyw5IEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKPiAgICAgICAgICBt
b3YgICB4MjYsICMxICAgICAgICAgICAgICAgIC8qIFgyNiA6PSBza2lwX3plcm9fYnNzICovCj4g
IAo+ICBjb21tb25fc3RhcnQ6Cj4gLSAgICAgICAgbW92ICAgeDI0LCAjMCAgICAgICAgICAgICAg
ICAvKiB4MjQgOj0gQ1BVIElELiBJbml0aWFseSB6ZXJvIHVudGlsIHdlCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmaW5kIHRoYXQgbXVsdGlwcm9jZXNzb3IgZXh0
ZW5zaW9ucyBhcmUKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIHBy
ZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICAqLwo+ICAgICAgICAgIG1ycyAgIHgwLCBtcGlk
cl9lbDEKPiAtICAgICAgICB0Ym56ICB4MCwgX01QSURSX1VQLCAxZiAgICAgIC8qIFVuaXByb2Nl
c3NvciBzeXN0ZW0/ICovCj4gLQo+ICAgICAgICAgIGxkciAgIHgxMywgPSh+TVBJRFJfSFdJRF9N
QVNLKQo+ICAgICAgICAgIGJpYyAgIHgyNCwgeDAsIHgxMyAgICAgICAgICAgLyogTWFzayBvdXQg
ZmxhZ3MgdG8gZ2V0IENQVSBJRCAqLwo+IC0xOgo+ICAKPiAgICAgICAgICAvKiBOb24tYm9vdCBD
UFVzIHdhaXQgaGVyZSB1bnRpbCBfX2NwdV91cCBpcyByZWFkeSBmb3IgdGhlbSAqLwo+ICAgICAg
ICAgIGNieiAgIHgyMiwgMWYKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
