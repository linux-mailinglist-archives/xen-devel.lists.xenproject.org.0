Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C1D5A5C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 06:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJrqr-0000EC-VS; Mon, 14 Oct 2019 04:20:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pF02=YG=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1iJgcf-0000jd-Sw
 for xen-devel@lists.xenproject.org; Sun, 13 Oct 2019 16:21:33 +0000
X-Inumbo-ID: 834e271c-edd5-11e9-9362-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 834e271c-edd5-11e9-9362-12813bfff9fa;
 Sun, 13 Oct 2019 16:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8E7DE173B;
 Sun, 13 Oct 2019 18:21:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvJG0oGLLRCH; Sun, 13 Oct 2019 18:21:28 +0200 (CEST)
Received: from function (lfbn-bor-1-306-163.w109-215.abo.wanadoo.fr
 [109.215.28.163])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id BB69816E2;
 Sun, 13 Oct 2019 18:21:28 +0200 (CEST)
Received: from samy by function with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iJgcZ-0002zv-VI; Sun, 13 Oct 2019 18:21:27 +0200
Date: Sun, 13 Oct 2019 18:21:27 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>
Message-ID: <20191013162127.2pdc6ho4oer5pnpr@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-2-olaf@aepfle.de>
 <20191013162039.hsylxvashc4rbo67@function>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013162039.hsylxvashc4rbo67@function>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Mailman-Approved-At: Mon, 14 Oct 2019 04:20:56 +0000
Subject: Re: [Xen-devel] [PATCH v2 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2FtdWVsIFRoaWJhdWx0LCBsZSBkaW0uIDEzIG9jdC4gMjAxOSAxODoyMDozOSArMDIwMCwgYSBl
Y3JpdDoKPiBPbGFmIEhlcmluZywgbGUgbWVyLiAwMiBvY3QuIDIwMTkgMTk6MDU6MzYgKzAyMDAs
IGEgZWNyaXQ6Cj4gPiBUaGUgZnVuY3Rpb24gcmVhZF92dHBtYmxrIHVzZXMgcHJpbnRmKDMpLCBi
dXQgc3RkaW8uaCBpcyBub3QgaW5jbHVkZWQKPiA+IGluIHRoaXMgZmlsZS4gVGhpcyByZXN1bHRz
IGluIGEgd2FybmluZyBmcm9tIGdjYy03Ogo+ID4gCj4gPiB2dHBtYmxrLmM6IEluIGZ1bmN0aW9u
ICdyZWFkX3Z0cG1ibGsnOgo+ID4gdnRwbWJsay5jOjMyMjo3OiB3YXJuaW5nOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncHJpbnRmJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KPiA+ICAgICAgICBwcmludGYoIkV4cGVjdGVkOiAiKTsKPiA+IHZ0cG1ibGsuYzoz
MjI6Nzogd2FybmluZzogaW5jb21wYXRpYmxlIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGJ1aWx0
LWluIGZ1bmN0aW9uICdwcmludGYnCj4gPiB2dHBtYmxrLmM6MzIyOjc6IG5vdGU6IGluY2x1ZGUg
JzxzdGRpby5oPicgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mICdwcmludGYnCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KPiA+IGNrZWQtYnk6
IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgoKTm90ZSB0aGF0IHlvdSBt
aXNzIGFuICdBJyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBsaW5lIHRoZXJlLgoKCgo+IFJldmll
d2VkLWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+Cj4g
Cj4gPiAtLS0KPiA+ICBzdHViZG9tL3Z0cG0vdnRwbWJsay5jIHwgMSArCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9zdHViZG9tL3Z0cG0v
dnRwbWJsay5jIGIvc3R1YmRvbS92dHBtL3Z0cG1ibGsuYwo+ID4gaW5kZXggZmU1MjlhYjVhYy4u
NjgxZjBjMDFiNiAxMDA2NDQKPiA+IC0tLSBhL3N0dWJkb20vdnRwbS92dHBtYmxrLmMKPiA+ICsr
KyBiL3N0dWJkb20vdnRwbS92dHBtYmxrLmMKPiA+IEBAIC0yMCw2ICsyMCw3IEBACj4gPiAgI2lu
Y2x1ZGUgPHVuaXN0ZC5oPgo+ID4gICNpbmNsdWRlIDxlcnJuby5oPgo+ID4gICNpbmNsdWRlIDxm
Y250bC5oPgo+ID4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ID4gIAo+ID4gIC8qRW5jcnlwdGlvbiBr
ZXkgYW5kIGJsb2NrIHNpemVzICovCj4gPiAgI2RlZmluZSBCTEtTWiAxNgo+ID4gCj4gCj4gLS0g
Cj4gU2FtdWVsCj4gPFA+IG1vbwo+IDxOPiBtb28gPwo+IDxEPiBQOiBrZXNraSB0J2Fycml2ZT8g
OikpCj4gPFA+IG1vb29vCj4gPE4+IG1vb29vb28gPwo+IDxQPiByaWVuIGxlIG5ldCBtYXJjaGUg
amUgc3VpcyBjb250ZW50IDopCj4gIC0rLSAjZW5zLW1pbSAtIGFjY3JvIGR1IG5ldCAtKy0KCi0t
IApTYW11ZWwKPkV2ZXIgaGVhcmQgb2YgLmNzaHJjPwpUaGF0J3MgYSBjaXR5IGluIEJvc25pYS4g
IFJpZ2h0PwooRGlzY3Vzc2lvbiBpbiBjb21wLm9zLmxpbnV4Lm1pc2Mgb24gdGhlIGludHVpdGl2
ZW5lc3Mgb2YgY29tbWFuZHMuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
