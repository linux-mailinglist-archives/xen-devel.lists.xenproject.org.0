Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A40D8930
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 09:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKdUD-0001Ij-AW; Wed, 16 Oct 2019 07:12:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WUIK=YJ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1iKdUA-0001Ie-Dt
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 07:12:43 +0000
X-Inumbo-ID: 5674116e-efe4-11e9-93aa-12813bfff9fa
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5674116e-efe4-11e9-93aa-12813bfff9fa;
 Wed, 16 Oct 2019 07:12:39 +0000 (UTC)
Received: from zn.tnic (p200300EC2F093900E460E23B12F7A6AE.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:3900:e460:e23b:12f7:a6ae])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A47CF1EC0CA8;
 Wed, 16 Oct 2019 09:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1571209958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=hCMIEpQo2zZVtw+c7T27PQGWxK9R4yH4oLgjyYmdmEs=;
 b=jBjaAwnWbMtQO5KJkx8Ds4V597Vk3RcnpH9z7AXPZBtVtzOME4gu6KPFZ3LOB+4xl79+Lj
 8kPodzuqb3NA7rSD0JFdUgz7ajO/9BH8XZe+Q1k900RYstacd4xK+1KOE2EULuWK9npP7U
 hYwBeygUc058xRGplSLnZm1PpMuZkH8=
Date: Wed, 16 Oct 2019 09:12:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Message-ID: <20191016071230.GD1138@zn.tnic>
References: <20191011115108.12392-1-jslaby@suse.cz>
 <20191011115108.12392-25-jslaby@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011115108.12392-25-jslaby@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v9 24/28] x86_64/asm: Change all
 ENTRY+ENDPROC to SYM_FUNC_*
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
Cc: linux-arch@vger.kernel.org, Len Brown <len.brown@intel.com>,
 linux-efi@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Matt Fleming <matt@codeblueprint.co.uk>, linux-pm@vger.kernel.org,
 x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Juergen Gross <jgross@suse.com>, mingo@redhat.com,
 linux-crypto@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com,
 xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Jiri Slaby <jslaby@suse.cz>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwMTo1MTowNFBNICswMjAwLCBKaXJpIFNsYWJ5
IHdyb3RlOgo+IFRoZXNlIGFyZSBhbGwgZnVuY3Rpb25zIHdoaWNoIGFyZSBpbnZva2VkIGZyb20g
ZWxzZXdoZXJlLCBzbyBhbm5vdGF0ZQo+IHRoZW0gYXMgZ2xvYmFsIHVzaW5nIHRoZSBuZXcgU1lN
X0ZVTkNfU1RBUlQuIEFuZCB0aGVpciBFTkRQUk9DJ3MgYnkKPiBTWU1fRlVOQ19FTkQuCj4gCj4g
QW5kIG1ha2Ugc3VyZSBFTlRSWS9FTkRQUk9DIGlzIG5vdCBkZWZpbmVkIG9uIFg4Nl82NCwgZ2l2
ZW4gdGhlc2Ugd2VyZQo+IHRoZSBsYXN0IHVzZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppcmkg
U2xhYnkgPGpzbGFieUBzdXNlLmN6Pgo+IFJldmlld2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8
cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+IFtoaWJlcm5hdGVdCj4gUmV2aWV3ZWQtYnk6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IFt4ZW4gYml0c10KPiBD
YzogIkguIFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4KPiBDYzogQm9yaXNsYXYgUGV0a292
IDxicEBhbGllbjguZGU+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRl
Pgo+IENjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiBDYzogeDg2QGtlcm5lbC5v
cmcKPiBDYzogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1Pgo+IENjOiAi
RGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBDYzogIlJhZmFlbCBKLiBX
eXNvY2tpIiA8cmp3QHJqd3lzb2NraS5uZXQ+Cj4gQ2M6IExlbiBCcm93biA8bGVuLmJyb3duQGlu
dGVsLmNvbT4KPiBDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gQ2M6IE1hdHQgRmxl
bWluZyA8bWF0dEBjb2RlYmx1ZXByaW50LmNvLnVrPgo+IENjOiBBcmQgQmllc2hldXZlbCA8YXJk
LmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
IENjOiBsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXBtQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW51eC1lZmlAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IC0tLQo+ICBhcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvZWZp
X3RodW5rXzY0LlMgICAgICB8ICA0ICstCj4gIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9oZWFk
XzY0LlMgICAgICAgICAgIHwgMTYgKysrLS0tCj4gIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9t
ZW1fZW5jcnlwdC5TICAgICAgIHwgIDggKy0tCj4gIGFyY2gveDg2L2NyeXB0by9hZWdpczEyOC1h
ZXNuaS1hc20uUyAgICAgICAgIHwgMjggKysrKy0tLS0tCj4gIGFyY2gveDg2L2NyeXB0by9hZXNf
Y3RyYnk4X2F2eC14ODZfNjQuUyAgICAgIHwgMTIgKystLQo+ICBhcmNoL3g4Ni9jcnlwdG8vYWVz
bmktaW50ZWxfYXNtLlMgICAgICAgICAgICB8IDYwICsrKysrKysrKystLS0tLS0tLS0tCj4gIGFy
Y2gveDg2L2NyeXB0by9hZXNuaS1pbnRlbF9hdngteDg2XzY0LlMgICAgIHwgMzIgKysrKystLS0t
LS0KPiAgYXJjaC94ODYvY3J5cHRvL2Jsb3dmaXNoLXg4Nl82NC1hc21fNjQuUyAgICAgfCAxNiAr
KystLS0KPiAgYXJjaC94ODYvY3J5cHRvL2NhbWVsbGlhLWFlc25pLWF2eC1hc21fNjQuUyAgfCAy
NCArKysrLS0tLQo+ICBhcmNoL3g4Ni9jcnlwdG8vY2FtZWxsaWEtYWVzbmktYXZ4Mi1hc21fNjQu
UyB8IDI0ICsrKystLS0tCj4gIGFyY2gveDg2L2NyeXB0by9jYW1lbGxpYS14ODZfNjQtYXNtXzY0
LlMgICAgIHwgMTYgKysrLS0tCj4gIGFyY2gveDg2L2NyeXB0by9jYXN0NS1hdngteDg2XzY0LWFz
bV82NC5TICAgIHwgMTYgKysrLS0tCj4gIGFyY2gveDg2L2NyeXB0by9jYXN0Ni1hdngteDg2XzY0
LWFzbV82NC5TICAgIHwgMjQgKysrKy0tLS0KPiAgYXJjaC94ODYvY3J5cHRvL2NoYWNoYS1hdngy
LXg4Nl82NC5TICAgICAgICAgfCAxMiArKy0tCj4gIGFyY2gveDg2L2NyeXB0by9jaGFjaGEtYXZ4
NTEydmwteDg2XzY0LlMgICAgIHwgMTIgKystLQo+ICBhcmNoL3g4Ni9jcnlwdG8vY2hhY2hhLXNz
c2UzLXg4Nl82NC5TICAgICAgICB8IDEyICsrLS0KPiAgYXJjaC94ODYvY3J5cHRvL2NyYzMyLXBj
bG11bF9hc20uUyAgICAgICAgICAgfCAgNCArLQo+ICBhcmNoL3g4Ni9jcnlwdG8vY3JjMzJjLXBj
bC1pbnRlbC1hc21fNjQuUyAgICB8ICA0ICstCj4gIGFyY2gveDg2L2NyeXB0by9jcmN0MTBkaWYt
cGNsLWFzbV82NC5TICAgICAgIHwgIDQgKy0KPiAgYXJjaC94ODYvY3J5cHRvL2RlczNfZWRlLWFz
bV82NC5TICAgICAgICAgICAgfCAgOCArLS0KPiAgYXJjaC94ODYvY3J5cHRvL2doYXNoLWNsbXVs
bmktaW50ZWxfYXNtLlMgICAgfCAgOCArLS0KPiAgYXJjaC94ODYvY3J5cHRvL25oLWF2eDIteDg2
XzY0LlMgICAgICAgICAgICAgfCAgNCArLQo+ICBhcmNoL3g4Ni9jcnlwdG8vbmgtc3NlMi14ODZf
NjQuUyAgICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gveDg2L2NyeXB0by9wb2x5MTMwNS1hdngy
LXg4Nl82NC5TICAgICAgIHwgIDQgKy0KPiAgYXJjaC94ODYvY3J5cHRvL3BvbHkxMzA1LXNzZTIt
eDg2XzY0LlMgICAgICAgfCAgOCArLS0KPiAgYXJjaC94ODYvY3J5cHRvL3NlcnBlbnQtYXZ4LXg4
Nl82NC1hc21fNjQuUyAgfCAyNCArKysrLS0tLQo+ICBhcmNoL3g4Ni9jcnlwdG8vc2VycGVudC1h
dngyLWFzbV82NC5TICAgICAgICB8IDI0ICsrKystLS0tCj4gIGFyY2gveDg2L2NyeXB0by9zZXJw
ZW50LXNzZTIteDg2XzY0LWFzbV82NC5TIHwgIDggKy0tCj4gIGFyY2gveDg2L2NyeXB0by9zaGEx
X2F2eDJfeDg2XzY0X2FzbS5TICAgICAgIHwgIDQgKy0KPiAgYXJjaC94ODYvY3J5cHRvL3NoYTFf
bmlfYXNtLlMgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBhcmNoL3g4Ni9jcnlwdG8vc2hhMV9z
c3NlM19hc20uUyAgICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gveDg2L2NyeXB0by9zaGEyNTYt
YXZ4LWFzbS5TICAgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC94ODYvY3J5cHRvL3NoYTI1Ni1h
dngyLWFzbS5TICAgICAgICAgICAgfCAgNCArLQo+ICBhcmNoL3g4Ni9jcnlwdG8vc2hhMjU2LXNz
c2UzLWFzbS5TICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gveDg2L2NyeXB0by9zaGEyNTZfbmlf
YXNtLlMgICAgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC94ODYvY3J5cHRvL3NoYTUxMi1hdngt
YXNtLlMgICAgICAgICAgICAgfCAgNCArLQo+ICBhcmNoL3g4Ni9jcnlwdG8vc2hhNTEyLWF2eDIt
YXNtLlMgICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gveDg2L2NyeXB0by9zaGE1MTItc3NzZTMt
YXNtLlMgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC94ODYvY3J5cHRvL3R3b2Zpc2gtYXZ4LXg4
Nl82NC1hc21fNjQuUyAgfCAyNCArKysrLS0tLQo+ICBhcmNoL3g4Ni9jcnlwdG8vdHdvZmlzaC14
ODZfNjQtYXNtXzY0LTN3YXkuUyB8ICA4ICstLQo+ICBhcmNoL3g4Ni9jcnlwdG8vdHdvZmlzaC14
ODZfNjQtYXNtXzY0LlMgICAgICB8ICA4ICstLQoKSSBjb3VsZCB1c2UgYW4gQUNLIGZvciB0aGUg
Y3J5cHRvIGJpdHMuLi4KClRoeC4KCi0tIApSZWdhcmRzL0dydXNzLAogICAgQm9yaXMuCgpodHRw
czovL3Blb3BsZS5rZXJuZWwub3JnL3RnbHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
