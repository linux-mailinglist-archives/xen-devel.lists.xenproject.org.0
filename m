Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D53243CA
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 00:58:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSrCy-0005Oe-5p; Mon, 20 May 2019 22:56:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSrCx-0005OO-Bc
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 22:56:39 +0000
X-Inumbo-ID: 86404694-7b52-11e9-a650-dbdbc9e9c1a9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86404694-7b52-11e9-a650-dbdbc9e9c1a9;
 Mon, 20 May 2019 22:56:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 975BF21479;
 Mon, 20 May 2019 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558392997;
 bh=OJAZvYhOlmOs6Ze54kwhiIcooGDrWFM95JqZmZYL7pY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=B+R2lq7dXTufDKjqTjB+ZkVM/5TRynVayC65x1nyaKRLxDhhAzm+RF4ZRemxN7Gar
 cLbAvtmuV5htpblGujYKuD/j2suQY0JrtbTtBq42r5SGzCGyk2oft9aHvnFlZgFR1h
 Unrx41wIbJk3KOXXdy3Q6WnjPNKGq/4Lij/8y5NU=
Date: Mon, 20 May 2019 15:56:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-9-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201540500.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-9-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 08/19] xen/arm64: head:
 Move earlyprintk messages in .rodata.str
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBlYXJseXByaW50ayBtZXNzYWdlcyBhcmUgaW50ZXJsZWF2ZWQgd2l0aCB0aGUKPiBpbnN0
cnVjdGlvbnMuIFRoaXMgbWFrZXMgbW9yZSBkaWZmaWN1bHQgdG8gcmVhZCB0aGUgb2JqZHVtcCBv
dXRwdXQuCj4gCj4gSW50cm9kdWNlIGEgbmV3IG1hY3JvIHRvIGFkZCBhIHN0cmluZyBpbiAucm9k
YXRhLnN0ciBhbmQgdXNlIGl0IGZvciBhbGwKPiB0aGUgZWFybHlwcmludGsgbWVzc2FnZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFja2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0K
PiAKPiBJIGhhdmVuJ3QgZG9uZSBhIHNpbWlsYXIgY2hhbmdlIGluIGFybTMyIHlldCBiZWNhdXNl
IHRoZSBjb21waWxlciB3aWxsCj4gdGhyb3cgYW4gZXJyb3Igd2hlbiB1c2luZyAnYWRyJyB3aGVu
IGxvYWQgYW4gYWRkcmVzcyBmcm9tIGEgZGlmZmVyZW50Cj4gc2VjdGlvbiAoc2VlIEE1LTIwMCBp
biBBUk0gRERJIDA0MDZDLmEgZm9yIHRoZSB0ZWNobmljYWwgcmVhc29uKS4KPiBUaGUgY2hhbmdl
IGlzIGxpa2VseSB0byBiZSBtb3JlIGVsYWJvcmF0ZS4KPiAKPiAgICAgQ2hhbmdlcyBpbiB2MjoK
PiAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMgICAgICAgfCAxNCArKysrKy0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9h
c20tYXJtL2FzbV9kZWZucy5oIHwgIDUgKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4IGFkNDQ2ZTcz
NDUuLmI5NTdlYjkwZmIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtODEsMTMgKzgxLDEwIEBACj4g
IC8qIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRvIHRoZSBVQVJULCBpZiB0aGVyZSBpcyBvbmUu
Cj4gICAqIENsb2JiZXJzIHgwLXgzLiAqLwo+ICAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwo+
IC0jZGVmaW5lIFBSSU5UKF9zKSAgICAgICBcCj4gLSAgICAgICAgYWRyICAgeDAsIDk4ZiA7IFwK
PiAtICAgICAgICBibCAgICBwdXRzICAgIDsgXAo+IC0gICAgICAgIGIgICAgIDk5ZiAgICAgOyBc
Cj4gLTk4OiAgICAgLmFzY2l6IF9zICAgICA7IFwKPiAtICAgICAgICAuYWxpZ24gMiAgICAgIDsg
XAo+IC05OToKPiArI2RlZmluZSBQUklOVChfcykgICAgICAgICAgIFwKPiArICAgICAgICBhZHIg
ICB4MCwgOThmIDsgICAgIFwKPiArICAgICAgICBibCAgICBwdXRzICAgIDsgICAgIFwKPiArICAg
ICAgICBST0RBVEFfU1RSKDk4LCBfcykKPiAgI2Vsc2UgLyogQ09ORklHX0VBUkxZX1BSSU5USyAq
Lwo+ICAjZGVmaW5lIFBSSU5UKHMpCj4gICNlbmRpZiAvKiAhQ09ORklHX0VBUkxZX1BSSU5USyAq
Lwo+IEBAIC02MzMsOCArNjMwLDcgQEAgaW5pdF91YXJ0Ogo+ICAjZW5kaWYKPiAgICAgICAgICBh
ZHIgICB4MCwgMWYKPiAgICAgICAgICBiICAgICBwdXRzCj4gLTE6ICAgICAgLmFzY2l6ICItIFVB
UlQgZW5hYmxlZCAtXHJcbiIKPiAtICAgICAgICAuYWxpZ24gNAo+ICtST0RBVEFfU1RSKDEsICIt
IFVBUlQgZW5hYmxlZCAtXHJcbiIpCj4gIAo+ICAvKiBQcmludCBlYXJseSBkZWJ1ZyBtZXNzYWdl
cy4KPiAgICogeDA6IE51bC10ZXJtaW5hdGVkIHN0cmluZyB0byBwcmludC4KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hc21fZGVmbnMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
YXNtX2RlZm5zLmgKPiBpbmRleCAwMmJlODNlMmIzLi4zZjIxZGVmMGFiIDEwMDY0NAo+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vYXNtX2RlZm5zLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL2FzbV9kZWZucy5oCj4gQEAgLTE2LDYgKzE2LDExIEBACj4gICMgZXJyb3IgInVua25vd24g
QVJNIHZhcmlhbnQiCj4gICNlbmRpZgo+ICAKPiArI2RlZmluZSBST0RBVEFfU1RSKGxhYmVsLCBt
c2cpICAgICAgICAgICAgICAgICAgXAo+ICsucHVzaHNlY3Rpb24gLnJvZGF0YS5zdHIsICJhTVMi
LCAlcHJvZ2JpdHMsIDEgOyBcCj4gK2xhYmVsOiAgLmFzY2l6IG1zZzsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArLnBvcHNlY3Rpb24KPiArCj4gICNlbmRpZiAvKiBfX0FSTV9BU01f
REVGTlNfSF9fICovCj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKPiAtLSAKPiAyLjExLjAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
