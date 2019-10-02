Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72315C9034
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:49:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFihg-0003Q3-1m; Wed, 02 Oct 2019 17:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFihe-0003Py-2P
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:46:18 +0000
X-Inumbo-ID: 88725733-e53c-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 88725733-e53c-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 17:46:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73D3E1000;
 Wed,  2 Oct 2019 10:46:16 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E3E3F706;
 Wed,  2 Oct 2019 10:46:15 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190813213237.4819-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a4082fa0-0942-7b0a-3166-92260b47c5cc@arm.com>
Date: Wed, 2 Oct 2019 18:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813213237.4819-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/docs: arm: Update dom0less binding and
 example
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
Cc: viktor_mitin@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VudGxlIHBpbmcuCgpPbiA4LzEzLzE5IDEwOjMyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
VGhlIGJpbmRpbmcgZm9yIHRoZSBkb20wbGVzcyBtb2R1bGUgZG9lcyBub3QgbWF0Y2ggWGVuIGlt
cGxlbWVudGF0aW9uLgo+IEFueSBtb2R1bGUgc2hvdWxkIGNvbnRhaW4gdGhlIGNvbXBhdGlibGUg
Im11bHRpYm9vdCxtb2R1bGUiIHRvIGJlCj4gcmVjb2duaXplZC4KPiAKPiBUaGlzIHdhcyBjbGVh
cmx5IGFuIG92ZXJzaWdodCBhcyBvdGhlciBleGFtcGxlcyB3aXRoIFhlbiBjb2RlIGJhc2UKPiBw
cm92aWRlIHRoZSBjb21wYXRpYmxlICJtdWx0aWJvb3QsbW9kdWxlIi4KPiAKPiBTbyBmaXggdGhl
IGJpbmRpbmcgYW5kIHRoZSBleGFtcGxlIGFzc29jaWF0ZWQgdG8gaXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAKPiBD
YzogdmlrdG9yX21pdGluQGVwYW0uY29tCj4gCj4gICAgICBXZSBwcm9iYWJseSB3YW50IHRvIGNv
bnNvbGlkYXRlIGFsbCB0aGUgZG9tMGxlc3MgZG9jdW1lbnRhdGlvbiBpbgo+ICAgICAgb25lIHBs
YWNlIHJhdGhlciB0aGFuIGhhdmluZyB0byBmaXggZG9jdW1hdGlvbiBpc3N1ZXMgaW4gYSBtdWx0
aXBsZQo+ICAgICAgcGxhY2VzIG9uZSBieSBvbmUuCj4gLS0tCj4gICBkb2NzL21pc2MvYXJtL2Rl
dmljZS10cmVlL2Jvb3RpbmcudHh0IHwgMTIgKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kb2Nz
L21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IGIvZG9jcy9taXNjL2FybS9kZXZpY2Ut
dHJlZS9ib290aW5nLnR4dAo+IGluZGV4IDMxN2E5ZTk2MmEuLjBmYWZhMDFiNWQgMTAwNjQ0Cj4g
LS0tIGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dAo+ICsrKyBiL2RvY3Mv
bWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKPiBAQCAtMTYwLDcgKzE2MCw3IEBAIFRo
ZSBrZXJuZWwgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKPiAgIAo+ICAg
LSBjb21wYXRpYmxlCj4gICAKPiAtICAgICJtdWx0aWJvb3Qsa2VybmVsIgo+ICsgICAgIm11bHRp
Ym9vdCxrZXJuZWwiLCAibXVsdGlib290LG1vZHVsZSIKPiAgIAo+ICAgLSByZWcKPiAgIAo+IEBA
IC0xNzUsNyArMTc1LDcgQEAgVGhlIHJhbWRpc2sgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcg
cHJvcGVydGllczoKPiAgIAo+ICAgLSBjb21wYXRpYmxlCj4gICAKPiAtICAgICJtdWx0aWJvb3Qs
cmFtZGlzayIKPiArICAgICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJvb3QsbW9kdWxlIgo+
ICAgCj4gICAtIHJlZwo+ICAgCj4gQEAgLTE5NiwxMyArMTk2LDEzIEBAIGNob3NlbiB7Cj4gICAg
ICAgICAgIHZwbDAxMTsKPiAgIAo+ICAgICAgICAgICBtb2R1bGVAMHg0YTAwMDAwMCB7Cj4gLSAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCI7Cj4gKyAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9kdWxlIjsKPiAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0YTAwMDAwMCAweGZmZmZmZj47Cj4gICAgICAgICAg
ICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eUFNQTAgaW5pdD0vYmluL3NoIjsKPiAgICAgICAg
ICAgfTsKPiAgIAo+ICAgICAgICAgICBtb2R1bGVAMHg0YjAwMDAwMCB7Cj4gLSAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2siOwo+ICsgICAgICAgICAgICBjb21wYXRp
YmxlID0gIm11bHRpYm9vdCxyYW1kaXNrIiwgIm11bHRpYm9vdCxtb2R1bGUiOwo+ICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDRiMDAwMDAwIDB4ZmZmZmZmPjsKPiAgICAgICAgICAgfTsKPiAg
ICAgICB9Owo+IEBAIC0yMTUsMTMgKzIxNSwxMyBAQCBjaG9zZW4gewo+ICAgICAgICAgICBjcHVz
ID0gPDE+Owo+ICAgCj4gICAgICAgICAgIG1vZHVsZUAweDRjMDAwMDAwIHsKPiAtICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIjsKPiArICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxtb2R1bGUiOwo+ICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDRjMDAwMDAwIDB4ZmZmZmZmPjsKPiAgICAgICAgICAgICAgIGJv
b3RhcmdzID0gImNvbnNvbGU9dHR5QU1BMCBpbml0PS9iaW4vc2giOwo+ICAgICAgICAgICB9Owo+
ICAgCj4gICAgICAgICAgIG1vZHVsZUAweDRkMDAwMDAwIHsKPiAtICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayI7Cj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
bXVsdGlib290LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSI7Cj4gICAgICAgICAgICAgICBy
ZWcgPSA8MHgwIDB4NGQwMDAwMDAgMHhmZmZmZmY+Owo+ICAgICAgICAgICB9Owo+ICAgICAgIH07
Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
