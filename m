Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23782DBE90
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 09:41:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLMpZ-0006zo-DH; Fri, 18 Oct 2019 07:37:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0Ow=YL=gondor.apana.org.au=herbert@srs-us1.protection.inumbo.net>)
 id 1iLMpY-0006zj-91
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 07:37:48 +0000
X-Inumbo-ID: 2af4b9ca-f17a-11e9-bbab-bc764e2007e4
Received: from fornost.hmeau.com (unknown [216.24.177.18])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2af4b9ca-f17a-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 07:37:45 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1iLMoG-0004PG-JE; Fri, 18 Oct 2019 18:36:29 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 18 Oct 2019 18:36:16 +1100
Resent-From: Herbert Xu <herbert@gondor.apana.org.au>
Resent-Date: Fri, 18 Oct 2019 18:36:16 +1100
Resent-Message-ID: <20191018073616.GA17480@gondor.apana.org.au>
Resent-To: Borislav Petkov <bp@alien8.de>,
 "David S. Miller" <davem@davemloft.net>,
 Jiri Slaby <jslaby@suse.cz>, tglx@linutronix.de, mingo@redhat.com,
 hpa@zytor.com, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Matt Fleming <matt@codeblueprint.co.uk>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Juergen Gross <jgross@suse.com>, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-efi@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 18 Oct 2019 17:56:23 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Borislav Petkov <bp@alien8.de>
Message-ID: <20191018065623.GA15199@gondor.apana.org.au>
References: <20191011115108.12392-1-jslaby@suse.cz>
 <20191011115108.12392-25-jslaby@suse.cz>
 <20191016071230.GD1138@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016071230.GD1138@zn.tnic>
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
 Juergen Gross <jgross@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Matt Fleming <matt@codeblueprint.co.uk>,
 mingo@redhat.com, linux-crypto@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Jiri Slaby <jslaby@suse.cz>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDk6MTI6MzBBTSArMDIwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IEhpLAo+IAo+IE9uIEZyaSwgT2N0IDExLCAyMDE5IGF0IDAxOjUxOjA0UE0gKzAy
MDAsIEppcmkgU2xhYnkgd3JvdGU6Cj4gPiBUaGVzZSBhcmUgYWxsIGZ1bmN0aW9ucyB3aGljaCBh
cmUgaW52b2tlZCBmcm9tIGVsc2V3aGVyZSwgc28gYW5ub3RhdGUKPiA+IHRoZW0gYXMgZ2xvYmFs
IHVzaW5nIHRoZSBuZXcgU1lNX0ZVTkNfU1RBUlQuIEFuZCB0aGVpciBFTkRQUk9DJ3MgYnkKPiA+
IFNZTV9GVU5DX0VORC4KPiA+IAo+ID4gQW5kIG1ha2Ugc3VyZSBFTlRSWS9FTkRQUk9DIGlzIG5v
dCBkZWZpbmVkIG9uIFg4Nl82NCwgZ2l2ZW4gdGhlc2Ugd2VyZQo+ID4gdGhlIGxhc3QgdXNlcnMu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEppcmkgU2xhYnkgPGpzbGFieUBzdXNlLmN6Pgo+ID4g
UmV2aWV3ZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNv
bT4gW2hpYmVybmF0ZV0KPiA+IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiBbeGVuIGJpdHNdCj4gPiBDYzogIkguIFBldGVyIEFudmluIiA8
aHBhQHp5dG9yLmNvbT4KPiA+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiA+
IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiA+IENjOiBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiA+IENjOiB4ODZAa2VybmVsLm9yZwo+ID4gQ2M6IEhl
cmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiA+IENjOiAiRGF2aWQgUy4g
TWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiA+IENjOiAiUmFmYWVsIEouIFd5c29ja2ki
IDxyandAcmp3eXNvY2tpLm5ldD4KPiA+IENjOiBMZW4gQnJvd24gPGxlbi5icm93bkBpbnRlbC5j
b20+Cj4gPiBDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gPiBDYzogTWF0dCBGbGVt
aW5nIDxtYXR0QGNvZGVibHVlcHJpbnQuY28udWs+Cj4gPiBDYzogQXJkIEJpZXNoZXV2ZWwgPGFy
ZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+Cj4gPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiA+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gPiBDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4LXBt
QHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4LWVmaUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+IC0tLQo+ID4gIGFyY2gveDg2L2Jv
b3QvY29tcHJlc3NlZC9lZmlfdGh1bmtfNjQuUyAgICAgIHwgIDQgKy0KPiA+ICBhcmNoL3g4Ni9i
b290L2NvbXByZXNzZWQvaGVhZF82NC5TICAgICAgICAgICB8IDE2ICsrKy0tLQo+ID4gIGFyY2gv
eDg2L2Jvb3QvY29tcHJlc3NlZC9tZW1fZW5jcnlwdC5TICAgICAgIHwgIDggKy0tCj4gPiAgYXJj
aC94ODYvY3J5cHRvL2FlZ2lzMTI4LWFlc25pLWFzbS5TICAgICAgICAgfCAyOCArKysrLS0tLS0K
PiA+ICBhcmNoL3g4Ni9jcnlwdG8vYWVzX2N0cmJ5OF9hdngteDg2XzY0LlMgICAgICB8IDEyICsr
LS0KPiA+ICBhcmNoL3g4Ni9jcnlwdG8vYWVzbmktaW50ZWxfYXNtLlMgICAgICAgICAgICB8IDYw
ICsrKysrKysrKystLS0tLS0tLS0tCj4gPiAgYXJjaC94ODYvY3J5cHRvL2Flc25pLWludGVsX2F2
eC14ODZfNjQuUyAgICAgfCAzMiArKysrKy0tLS0tLQo+ID4gIGFyY2gveDg2L2NyeXB0by9ibG93
ZmlzaC14ODZfNjQtYXNtXzY0LlMgICAgIHwgMTYgKysrLS0tCj4gPiAgYXJjaC94ODYvY3J5cHRv
L2NhbWVsbGlhLWFlc25pLWF2eC1hc21fNjQuUyAgfCAyNCArKysrLS0tLQo+ID4gIGFyY2gveDg2
L2NyeXB0by9jYW1lbGxpYS1hZXNuaS1hdngyLWFzbV82NC5TIHwgMjQgKysrKy0tLS0KPiA+ICBh
cmNoL3g4Ni9jcnlwdG8vY2FtZWxsaWEteDg2XzY0LWFzbV82NC5TICAgICB8IDE2ICsrKy0tLQo+
ID4gIGFyY2gveDg2L2NyeXB0by9jYXN0NS1hdngteDg2XzY0LWFzbV82NC5TICAgIHwgMTYgKysr
LS0tCj4gPiAgYXJjaC94ODYvY3J5cHRvL2Nhc3Q2LWF2eC14ODZfNjQtYXNtXzY0LlMgICAgfCAy
NCArKysrLS0tLQo+ID4gIGFyY2gveDg2L2NyeXB0by9jaGFjaGEtYXZ4Mi14ODZfNjQuUyAgICAg
ICAgIHwgMTIgKystLQo+ID4gIGFyY2gveDg2L2NyeXB0by9jaGFjaGEtYXZ4NTEydmwteDg2XzY0
LlMgICAgIHwgMTIgKystLQo+ID4gIGFyY2gveDg2L2NyeXB0by9jaGFjaGEtc3NzZTMteDg2XzY0
LlMgICAgICAgIHwgMTIgKystLQo+ID4gIGFyY2gveDg2L2NyeXB0by9jcmMzMi1wY2xtdWxfYXNt
LlMgICAgICAgICAgIHwgIDQgKy0KPiA+ICBhcmNoL3g4Ni9jcnlwdG8vY3JjMzJjLXBjbC1pbnRl
bC1hc21fNjQuUyAgICB8ICA0ICstCj4gPiAgYXJjaC94ODYvY3J5cHRvL2NyY3QxMGRpZi1wY2wt
YXNtXzY0LlMgICAgICAgfCAgNCArLQo+ID4gIGFyY2gveDg2L2NyeXB0by9kZXMzX2VkZS1hc21f
NjQuUyAgICAgICAgICAgIHwgIDggKy0tCj4gPiAgYXJjaC94ODYvY3J5cHRvL2doYXNoLWNsbXVs
bmktaW50ZWxfYXNtLlMgICAgfCAgOCArLS0KPiA+ICBhcmNoL3g4Ni9jcnlwdG8vbmgtYXZ4Mi14
ODZfNjQuUyAgICAgICAgICAgICB8ICA0ICstCj4gPiAgYXJjaC94ODYvY3J5cHRvL25oLXNzZTIt
eDg2XzY0LlMgICAgICAgICAgICAgfCAgNCArLQo+ID4gIGFyY2gveDg2L2NyeXB0by9wb2x5MTMw
NS1hdngyLXg4Nl82NC5TICAgICAgIHwgIDQgKy0KPiA+ICBhcmNoL3g4Ni9jcnlwdG8vcG9seTEz
MDUtc3NlMi14ODZfNjQuUyAgICAgICB8ICA4ICstLQo+ID4gIGFyY2gveDg2L2NyeXB0by9zZXJw
ZW50LWF2eC14ODZfNjQtYXNtXzY0LlMgIHwgMjQgKysrKy0tLS0KPiA+ICBhcmNoL3g4Ni9jcnlw
dG8vc2VycGVudC1hdngyLWFzbV82NC5TICAgICAgICB8IDI0ICsrKystLS0tCj4gPiAgYXJjaC94
ODYvY3J5cHRvL3NlcnBlbnQtc3NlMi14ODZfNjQtYXNtXzY0LlMgfCAgOCArLS0KPiA+ICBhcmNo
L3g4Ni9jcnlwdG8vc2hhMV9hdngyX3g4Nl82NF9hc20uUyAgICAgICB8ICA0ICstCj4gPiAgYXJj
aC94ODYvY3J5cHRvL3NoYTFfbmlfYXNtLlMgICAgICAgICAgICAgICAgfCAgNCArLQo+ID4gIGFy
Y2gveDg2L2NyeXB0by9zaGExX3Nzc2UzX2FzbS5TICAgICAgICAgICAgIHwgIDQgKy0KPiA+ICBh
cmNoL3g4Ni9jcnlwdG8vc2hhMjU2LWF2eC1hc20uUyAgICAgICAgICAgICB8ICA0ICstCj4gPiAg
YXJjaC94ODYvY3J5cHRvL3NoYTI1Ni1hdngyLWFzbS5TICAgICAgICAgICAgfCAgNCArLQo+ID4g
IGFyY2gveDg2L2NyeXB0by9zaGEyNTYtc3NzZTMtYXNtLlMgICAgICAgICAgIHwgIDQgKy0KPiA+
ICBhcmNoL3g4Ni9jcnlwdG8vc2hhMjU2X25pX2FzbS5TICAgICAgICAgICAgICB8ICA0ICstCj4g
PiAgYXJjaC94ODYvY3J5cHRvL3NoYTUxMi1hdngtYXNtLlMgICAgICAgICAgICAgfCAgNCArLQo+
ID4gIGFyY2gveDg2L2NyeXB0by9zaGE1MTItYXZ4Mi1hc20uUyAgICAgICAgICAgIHwgIDQgKy0K
PiA+ICBhcmNoL3g4Ni9jcnlwdG8vc2hhNTEyLXNzc2UzLWFzbS5TICAgICAgICAgICB8ICA0ICst
Cj4gPiAgYXJjaC94ODYvY3J5cHRvL3R3b2Zpc2gtYXZ4LXg4Nl82NC1hc21fNjQuUyAgfCAyNCAr
KysrLS0tLQo+ID4gIGFyY2gveDg2L2NyeXB0by90d29maXNoLXg4Nl82NC1hc21fNjQtM3dheS5T
IHwgIDggKy0tCj4gPiAgYXJjaC94ODYvY3J5cHRvL3R3b2Zpc2gteDg2XzY0LWFzbV82NC5TICAg
ICAgfCAgOCArLS0KPiAKPiBJIGNvdWxkIHVzZSBhbiBBQ0sgZm9yIHRoZSBjcnlwdG8gYml0cy4u
LgoKQWNrZWQtYnk6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KCkNo
ZWVycywKLS0gCkVtYWlsOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+
CkhvbWUgUGFnZTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJlcnQvClBHUCBLZXk6
IGh0dHA6Ly9nb25kb3IuYXBhbmEub3JnLmF1L35oZXJiZXJ0L3B1YmtleS50eHQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
