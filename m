Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D258A7E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 20:59:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgZYh-0004gW-IM; Thu, 27 Jun 2019 18:55:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgZYf-0004gQ-QS
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 18:55:45 +0000
X-Inumbo-ID: 2a8bb45f-990d-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a8bb45f-990d-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 18:55:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FD6F20645;
 Thu, 27 Jun 2019 18:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561661743;
 bh=orx6vlmW64h4GoXOeA61r6fqfgVqIxRZ9iLZc9hR2a0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=J24qGBAwQE1qnhAglnLRd+Rzk8BKwJEQpSdY2T2Y6xRqCPsJhBSSvB8hEOHxDeYey
 PJ8gFhMenfahGaYks4LPukIZEitOW4dxYUQ7T9qi9aw04Po7Pw3ZjMfcyP2VrEUEtq
 36QQ78i/eKp1Dz0hloPlfV9FFDrrhqedTVlTWUYQ=
Date: Thu, 27 Jun 2019 11:55:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-15-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906271135340.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBJRCBtYXAgbWF5
IGNsYXNoIHdpdGggb3RoZXIgcGFydHMgb2YgdGhlIFhlbiB2aXJ0dWFsIG1lbW9yeSBsYXlvdXQu
Cj4gQXQgdGhlIG1vbWVudCwgWGVuIGlzIGhhbmRsaW5nIHRoZSBjbGFzaCBieSBvbmx5IGNyZWF0
aW5nIGEgbWFwcGluZyB0bwo+IHRoZSBydW50aW1lIHZpcnR1YWwgYWRkcmVzcyBiZWZvcmUgZW5h
YmxpbmcgdGhlIE1NVS4KPiAKPiBUaGUgcmVzdCBvZiB0aGUgbWFwcGluZ3MgKHN1Y2ggYXMgdGhl
IGZpeG1hcCkgd2lsbCBiZSBtYXBwZWQgYWZ0ZXIgdGhlCj4gTU1VIGlzIGVuYWJsZWQuIEhvd2V2
ZXIsIHRoZSBjb2RlIGRvaW5nIHRoZSBtYXBwaW5nIGlzIG5vdCBzYWZlIGFzIGl0Cj4gcmVwbGFj
ZSBtYXBwaW5nIHdpdGhvdXQgdXNpbmcgdGhlIEJyZWFrLUJlZm9yZS1NYWtlIHNlcXVlbmNlLgo+
IAo+IEFzIHRoZSBJRCBtYXAgY2FuIGJlIGFueXdoZXJlIGluIHRoZSBtZW1vcnksIGl0IGlzIGVh
c2llciB0byByZW1vdmUgYWxsCj4gdGhlIGVudHJpZXMgYWRkZWQgYXMgc29vbiBhcyB0aGUgSUQg
bWFwIGlzIG5vdCB1c2VkIHJhdGhlciB0aGFuIGFkZGluZwo+IHRoZSBCcmVhay1CZWZvcmUtTWFr
ZSBzZXF1ZW5jZSBldmVyeXdoZXJlLgo+IAo+IEl0IGlzIGRpZmZpY3VsdCB0byB0cmFjayB3aGVy
ZSBleGFjdGx5IHRoZSBJRCBtYXAgd2FzIGNyZWF0ZWQgd2l0aG91dCBhCj4gZnVsbCByZXdvcmsg
b2YgY3JlYXRlX3BhZ2VfdGFibGVzKCkuIEluc3RlYWQsIGludHJvZHVjZSBhIG5ldyBmdW5jdGlv
bgo+IHJlbW92ZV9pZF9tYXAoKSB3aWxsIGxvb2sgd2hlcmUgaXMgdGhlIHRvcC1sZXZlbCBlbnRy
eSBmb3IgdGhlIElEIG1hcAo+IGFuZCByZW1vdmUgaXQuCj4gCj4gVGhlIG5ldyBmdW5jdGlvbiBp
cyBvbmx5IGNhbGxlZCBmb3IgdGhlIGJvb3QgQ1BVLiBTZWNvbmRhcnkgQ1BVcyB3aWxsCj4gc3dp
dGNoIGRpcmVjdGx5IHRvIHRoZSBydW50aW1lIHBhZ2UtdGFibGVzIHNvIHRoZXJlIGFyZSBubyBu
ZWVkIHRvCj4gcmVtb3ZlIHRoZSBJRCBtYXBwaW5nLiBOb3RlIHRoYXQgdGhpcyBzdGlsbCBkb2Vz
bid0IG1ha2UgdGhlIFNlY29uZGFyeQo+IENQVXMgcGF0aCBzYWZlIGJ1dCBpdCBpcyBub3QgbWFr
aW5nIGl0IHdvcnN0Lgo+IAo+IC0tLQo+ICAgICBOb3RlIHRoYXQgdGhlIGNvbW1lbnQgcmVmZXJz
IHRvIHRoZSBwYXRjaCAgInhlbi9hcm06IHRsYmZsdXNoOiBSZXdvcmsKPiAgICAgVExCIGhlbHBl
cnMiIHVuZGVyIHJldmlldyAoc2VlIFsxXSkuCj4gCj4gICAgIEZ1cnRoZXJtb3JlLCBpdCBpcyB2
ZXJ5IGxpa2VseSB3ZSB3aWxsIG5lZWQgdG8gcmUtaW50cm9kdWNlIHRoZSBJRAo+ICAgICBtYXAg
dG8gY2F0ZXIgc2Vjb25kYXJ5IENQVXMgYm9vdCBhbmQgc3VzcGVuZC9yZXN1bWUuIEZvciBub3cs
IHRoZQo+ICAgICBhdHRlbXB0IGlzIHRvIG1ha2UgYm9vdCBDUFUgcGF0aCBmdWxseSBBcm0gQXJt
IGNvbXBsaWFudC4KPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21zZzAxMTM0Lmh0bWwKPiAtLS0KPiAgeGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyB8IDg2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCAxOTJhZjNlOGEyLi45NmU4NWY4ODM0IDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gQEAgLTMwMCw2ICszMDAsMTMgQEAgcmVhbF9zdGFydF9lZmk6Cj4g
ICAgICAgICAgbGRyICAgeDAsID1wcmltYXJ5X3N3aXRjaGVkCj4gICAgICAgICAgYnIgICAgeDAK
PiAgcHJpbWFyeV9zd2l0Y2hlZDoKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFRoZSBJRCBt
YXAgbWF5IGNsYXNoIHdpdGggb3RoZXIgcGFydHMgb2YgdGhlIFhlbiB2aXJ0dWFsIG1lbW9yeQo+
ICsgICAgICAgICAqIGxheW91dC4gQXMgaXQgaXMgbm90IHVzZWQgYW55bW9yZSwgcmVtb3ZlIGl0
IGNvbXBsZXRlbHkgdG8KPiArICAgICAgICAgKiBhdm9pZCBoYXZpbmcgdG8gd29ycnkgYWJvdXQg
cmVwbGFjaW5nIGV4aXN0aW5nIG1hcHBpbmcKPiArICAgICAgICAgKiBhZnRlcndhcmRzLgo+ICsg
ICAgICAgICAqLwo+ICsgICAgICAgIGJsICAgIHJlbW92ZV9pZF9tYXAKPiAgICAgICAgICBibCAg
ICBzZXR1cF9maXhtYXAKPiAgI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsKPiAgICAgICAgICAv
KiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLwo+IEBAIC02MzIs
MTAgKzYzOSw2OCBAQCBlbmFibGVfbW11Ogo+ICAgICAgICAgIHJldAo+ICBFTkRQUk9DKGVuYWJs
ZV9tbXUpCj4gIAo+ICsvKgo+ICsgKiBSZW1vdmUgdGhlIElEIG1hcCBmb3IgdGhlIHBhZ2UtdGFi
bGVzLiBJdCBpcyBub3QgZWFzeSB0byBrZWVwIHRyYWNrCj4gKyAqIHdoZXJlIHRoZSBJRCBtYXAg
d2FzIG1hcHBlZCwgc28gd2Ugd2lsbCBsb29rIGZvciB0aGUgdG9wLWxldmVsIGVudHJ5Cj4gKyAq
IGV4Y2x1c2l2ZSB0byB0aGUgSUQgTWFwIGFuZCByZW1vdmUgaXQuCj4gKyAqCj4gKyAqIElucHV0
czoKPiArICogICB4MTk6IHBhZGRyKHN0YXJ0KQo+ICsgKgo+ICsgKiBDbG9iYmVycyB4MCAtIHgx
Cj4gKyAqLwo+ICtyZW1vdmVfaWRfbWFwOgo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogRmlu
ZCB0aGUgemVyb2V0aCBzbG90IHVzZWQuIFJlbW92ZSB0aGUgZW50cnkgZnJvbSB6ZXJvZXRoCj4g
KyAgICAgICAgICogdGFibGUgaWYgdGhlIHNsb3QgaXMgbm90IDAuIEZvciBzbG90IDAsIHRoZSBJ
RCBtYXAgd2FzIGVpdGhlcgo+ICsgICAgICAgICAqIGRvbmUgaW4gZmlyc3Qgb3Igc2Vjb25kIHRh
YmxlLgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGxzciAgIHgxLCB4MTksICNaRVJPRVRIX1NI
SUZUICAgLyogeDEgOj0gemVyb2V0aCBzbG90ICovCj4gKyAgICAgICAgY2J6ICAgeDEsIDFmCj4g
KyAgICAgICAgLyogSXQgaXMgbm90IGluIHNsb3QgMCwgcmVtb3ZlIHRoZSBlbnRyeSAqLwo+ICsg
ICAgICAgIGxkciAgIHgwLCA9Ym9vdF9wZ3RhYmxlICAgICAgICAgLyogeDAgOj0gcm9vdCB0YWJs
ZSAqLwo+ICsgICAgICAgIHN0ciAgIHh6ciwgW3gwLCB4MSwgbHNsICMzXQo+ICsgICAgICAgIGIg
ICAgIGlkX21hcF9yZW1vdmVkCj4gKwo+ICsxOgo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICog
RmluZCB0aGUgZmlyc3Qgc2xvdCB1c2VkLiBSZW1vdmUgdGhlIGVudHJ5IGZvciB0aGUgZmlyc3QK
PiArICAgICAgICAgKiB0YWJsZSBpZiB0aGUgc2xvdCBpcyBub3QgMC4gRm9yIHNsb3QgMCwgdGhl
IElEIG1hcCB3YXMgZG9uZQo+ICsgICAgICAgICAqIGluIHRoZSBzZWNvbmQgdGFibGUuCj4gKyAg
ICAgICAgICovCj4gKyAgICAgICAgbHNyICAgeDEsIHgxOSwgI0ZJUlNUX1NISUZUCj4gKyAgICAg
ICAgYW5kICAgeDEsIHgxLCAjTFBBRV9FTlRSWV9NQVNLICAvKiB4MSA6PSBmaXJzdCBzbG90ICov
Cj4gKyAgICAgICAgY2J6ICAgeDEsIDFmCj4gKyAgICAgICAgLyogSXQgaXMgbm90IGluIHNsb3Qg
MCwgcmVtb3ZlIHRoZSBlbnRyeSAqLwo+ICsgICAgICAgIGxkciAgIHgwLCA9Ym9vdF9maXJzdCAg
ICAgICAgICAgLyogeDAgOj0gZmlyc3QgdGFibGUgKi8KPiArICAgICAgICBzdHIgICB4enIsIFt4
MCwgeDEsIGxzbCAjM10KPiArICAgICAgICBiICAgICBpZF9tYXBfcmVtb3ZlZAo+ICsKPiArMToK
PiArICAgICAgICAvKgo+ICsgICAgICAgICAqIEZpbmQgdGhlIHNlY29uZCBzbG90IHVzZWQuIFJl
bW92ZSB0aGUgZW50cnkgZm9yIHRoZSBmaXJzdAo+ICsgICAgICAgICAqIHRhYmxlIGlmIHRoZSBz
bG90IGlzIG5vdCAxIChydW50aW1lIFhlbiBtYXBwaW5nIGlzIDJNIC0gNE0pLgo+ICsgICAgICAg
ICAqIEZvciBzbG90IDEsIGl0IG1lYW5zIHRoZSBJRCBtYXAgd2FzIG5vdCBjcmVhdGVkLgo+ICsg
ICAgICAgICAqLwo+ICsgICAgICAgIGxzciAgIHgxLCB4MTksICNTRUNPTkRfU0hJRlQKPiArICAg
ICAgICBhbmQgICB4MSwgeDEsICNMUEFFX0VOVFJZX01BU0sgIC8qIHgxIDo9IGZpcnN0IHNsb3Qg
Ki8KPiArICAgICAgICBjbXAgICB4MSwgIzEKPiArICAgICAgICBiZXEgICBpZF9tYXBfcmVtb3Zl
ZAo+ICsgICAgICAgIC8qIEl0IGlzIG5vdCBpbiBzbG90IDEsIHJlbW92ZSB0aGUgZW50cnkgKi8K
PiArICAgICAgICBsZHIgICB4MCwgPWJvb3Rfc2Vjb25kICAgICAgICAgIC8qIHgwIDo9IHNlY29u
ZCB0YWJsZSAqLwo+ICsgICAgICAgIHN0ciAgIHh6ciwgW3gwLCB4MSwgbHNsICMzXQoKV291bGRu
J3QgaXQgYmUgYSBiaXQgbW9yZSByZWxpYWJsZSBpZiB3ZSBjaGVja2VkIHdoZXRoZXIgdGhlIHNs
b3QgaW4KcXVlc3Rpb24gZm9yIHgxOSAod2hldGhlciB6ZXJvLCBmaXJzdCwgc2Vjb25kKSBpcyBh
IHBhZ2V0YWJsZSBwb2ludGVyIG9yCnNlY3Rpb24gbWFwLCB0aGVuIHplcm8gaXQgaWYgaXQgaXMg
YSBzZWN0aW9uIG1hcCwgb3RoZXJ3aXNlIGdvIGRvd24gb25lCmxldmVsPyBJZiB3ZSBkaWQgaXQg
dGhpcyB3YXkgaXQgd291bGQgYmUgaW5kZXBlbmRlbnQgZnJvbSB0aGUgd2F5CmNyZWF0ZV9wYWdl
X3RhYmxlcyBpcyB3cml0dGVuLgoKV2l0aCB0aGUgY3VycmVudCBjb2RlLCB3ZSBhcmUgc29tZXdo
YXQgcmVsaWFudCBvbiB0aGUgYmVoYXZpb3Igb2YKY3JlYXRlX3BhZ2VfdGFibGVzLCBiZWNhdXNl
IHdlIHJlbHkgb24gdGhlIHBvc2l0aW9uIG9mIHRoZSBzbG90IGZvcgp0aGUgSUQgbWFwPyBXaGVy
ZSB0aGUgYXNzdW1wdGlvbiBmb3IgaW5zdGFuY2UgaXMgdGhhdCBhdCBsZXZlbCBvbmUsIGlmCnRo
ZSBzbG90IGlzIHplcm8sIHRoZW4gd2UgbmVlZCB0byBnbyBkb3duIGEgbGV2ZWwsIGV0Yy4gSW5z
dGVhZCwgaWYgd2UKY2hlY2tlZCBpZiB0aGUgc2xvdCBpcyBhIHNlY3Rpb24gbWFwLCB3ZSBjb3Vs
ZCByZW1vdmUgaXQgaW1tZWRpYXRlbHksIGlmCml0IGlzIGEgcGFnZXRhYmxlIHBvaW50ZXIsIHdl
IHByb2NlZWQuIFRoZSBjb2RlIHNob3VsZCBiZSBzaW1pbGFyIGluCmNvbXBsZXhpdHkgYW5kIExP
QywgYnV0IGl0IHdvdWxkIGJlIG1vcmUgcm9idXN0LgoKU29tZXRoaW5nIGxpa2UgdGhlIGZvbGxv
d2luZywgaW4gcHNldWRvLXVuY29tcGlsZWQgYXNzZW1ibHk6CgogICAgIGxzciAgIHgxLCB4MTks
ICNGSVJTVF9TSElGVAogICAgIGxkciAgIHgwLCA9Ym9vdF9maXJzdCAgICAgICAgICAgLyogeDAg
Oj0gZmlyc3QgdGFibGUgKi8KICAgICBsZHIgICB4MiwgW3gwLCB4MSwgbHNsICMzXQogICAgICMg
Y2hlY2sgeDIgYWdhaW5zdCAjUFRfTUVNCiAgICAgY2J6ICAgeDIsIDFmCiAgICAgc3RyICAgeHpy
LCBbeDAsIHgxLCBsc2wgIzNdCiAgICAgYiAgICAgaWRfbWFwX3JlbW92ZWQKCgo+ICtpZF9tYXBf
cmVtb3ZlZDoKPiArICAgICAgICAvKiBTZWUgYXNtLWFybS9hcm02NC9mbHVzaHRsYi5oIGZvciB0
aGUgZXhwbGFuYXRpb24gb2YgdGhlIHNlcXVlbmNlLiAqLwoKRG8geW91IG1lYW4geGVuL2luY2x1
ZGUvYXNtLWFybS9hcm02NC9mbHVzaHRsYi5oPyBJIGNhbid0IGZpbmQgdGhlCmV4cGxhbmF0aW9u
IHlvdSBhcmUgcmVmZXJyaW5nIHRvLgoKCj4gKyAgICAgICAgZHNiICAgbnNoc3QKPiArICAgICAg
ICB0bGJpICBhbGxlMgo+ICsgICAgICAgIGRzYiAgIG5zaAo+ICsgICAgICAgIGlzYgo+ICsKPiAr
ICAgICAgICByZXQKPiArRU5EUFJPQyhyZW1vdmVfaWRfbWFwKQo+ICsKPiAgc2V0dXBfZml4bWFw
Ogo+IC0gICAgICAgIC8qIE5vdyB3ZSBjYW4gaW5zdGFsbCB0aGUgZml4bWFwIGFuZCBkdGIgbWFw
cGluZ3MsIHNpbmNlIHdlCj4gLSAgICAgICAgICogZG9uJ3QgbmVlZCB0aGUgMToxIG1hcCBhbnkg
bW9yZSAqLwo+IC0gICAgICAgIGRzYiAgIHN5Cj4gICNpZiBkZWZpbmVkKENPTkZJR19FQVJMWV9Q
UklOVEspIC8qIEZpeG1hcCBpcyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRrICovCj4gICAgICAg
ICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0YWJsZSAqLwo+ICAgICAgICAgIGxkciAgIHgx
LCA9eGVuX2ZpeG1hcCAgICAgICAgLyogeDEgOj0gdmFkZHIgKHhlbl9maXhtYXApICovCj4gQEAg
LTY1MywxOSArNzE4LDEwIEBAIHNldHVwX2ZpeG1hcDoKPiAgICAgICAgICBsZHIgICB4MSwgPUZJ
WE1BUF9BRERSKDApCj4gICAgICAgICAgbHNyICAgeDEsIHgxLCAjKFNFQ09ORF9TSElGVCAtIDMp
ICAgLyogeDEgOj0gU2xvdCBmb3IgRklYTUFQKDApICovCj4gICAgICAgICAgc3RyICAgeDIsIFt4
NCwgeDFdICAgICAgICAgICAvKiBNYXAgaXQgaW4gdGhlIGZpeG1hcCdzIHNsb3QgKi8KPiAtI2Vu
ZGlmCj4gIAo+IC0gICAgICAgIC8qCj4gLSAgICAgICAgICogRmx1c2ggdGhlIFRMQiBpbiBjYXNl
IHRoZSAxOjEgbWFwcGluZyBoYXBwZW5zIHRvIGNsYXNoIHdpdGgKPiAtICAgICAgICAgKiB0aGUg
dmlydHVhbCBhZGRyZXNzZXMgdXNlZCBieSB0aGUgZml4bWFwIG9yIERUQi4KPiAtICAgICAgICAg
Ki8KPiAtICAgICAgICBkc2IgICBzeSAgICAgICAgICAgICAgICAgICAgIC8qIEVuc3VyZSBhbnkg
cGFnZSB0YWJsZSB1cGRhdGVzIG1hZGUgYWJvdmUKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqIGhhdmUgb2NjdXJyZWQuICovCj4gLQo+IC0gICAgICAgIGlzYgo+IC0g
ICAgICAgIHRsYmkgIGFsbGUyCj4gLSAgICAgICAgZHNiICAgc3kgICAgICAgICAgICAgICAgICAg
ICAvKiBFbnN1cmUgY29tcGxldGlvbiBvZiBUTEIgZmx1c2ggKi8KPiAtICAgICAgICBpc2IKPiAr
ICAgICAgICAvKiBFbnN1cmUgYW55IHBhZ2UgdGFibGUgdXBkYXRlcyBtYWRlIGFib3ZlIGhhdmUg
b2NjdXJyZWQgKi8KPiArICAgICAgICBkc2IgICBuc2hzdAo+ICsjZW5kaWYKPiAgICAgICAgICBy
ZXQKPiAgRU5EUFJPQyhzZXR1cF9maXhtYXApCj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
