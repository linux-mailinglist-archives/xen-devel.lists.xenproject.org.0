Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3782BEAF2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 05:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDKgY-0003BS-UR; Thu, 26 Sep 2019 03:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDKgX-0003BC-0t
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 03:43:17 +0000
X-Inumbo-ID: c5cf004e-e00f-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c5cf004e-e00f-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 03:43:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1119B207FF;
 Thu, 26 Sep 2019 03:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569469395;
 bh=04eDvXdNnmbUjkJZLjbtA0GlvcWs6rm6Vpea8GBHlek=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=h1CBHBQCVyHijgbBEyCHJfQoIZPQgNaV64AZXJOactQ/ImSl+klIqvtZS8icem/9J
 e+eQZWRd/OxQckoto/sxu4bn1yPsJ8LtNf8L+B/qfs1D4Bm1bSZ2JFEF+mrYfR0u7y
 CTpo5XE/0MI0fz5r6fPtBPSit97SEy5H+2ndsbx4=
Date: Wed, 25 Sep 2019 20:43:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <6236073a-9930-4704-8f73-3a4956e37f58@arm.com>
Message-ID: <alpine.DEB.2.21.1909252042540.14358@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-3-sstabellini@kernel.org>
 <6236073a-9930-4704-8f73-3a4956e37f58@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen/arm: introduce
 kinfo->guest_phandle_gic
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI1
LzA5LzIwMTkgMTk6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IEluc3RlYWQgb2Yg
YWx3YXlzIGhhcmQtY29kaW5nIHRoZSBHSUMgcGhhbmRsZSAoR1VFU1RfUEhBTkRMRV9HSUMpLCBz
dG9yZQo+ID4gaXQgaW4gYSB2YXJpYWJsZSB1bmRlciBraW5mby4gVGhpcyB3YXkgaXQgY2FuIGJl
IGR5bmFtaWNhbGx5IGNob3NlbiBwZXIKPiA+IGRvbWFpbi4gUmVtb3ZlIHRoZSBmZHQgcG9pbnRl
ciBhcmd1bWVudCB0byB0aGUgbWFrZV8qX2RvbVVfbm9kZQo+ID4gZnVuY3Rpb25zIGFuZCBvYXNz
IGEgc3RydWN0IGtlcm5lbF9pbmZvICogaW5zdGVhZC4gVGhlIGZkdCBwb2ludGVyIGNhbgo+ID4g
YmUgYWNjZXNzZWQgZnJvbSBraW5mby0+ZmR0LiBSZW1vdmUgdGhlIHN0cnVjdCBkb21haW4gKmQg
cGFyYW1ldGVyIHRvCj4gPiB0aGUgbWFrZV8qX2RvbVVfbm9kZSBmdW5jdGlvbnMgYmVjYXVzZSBp
dCBiZWNvbWVzIHVudXNlZC4KPiA+IAo+ID4gSW5pdGlhbGl6ZSBndWVzdF9waGFuZGxlX2dpYyB0
byBHVUVTVF9QSEFORExFX0dJQyBhdCB0aGUgYmVnaW5uaW5nIG9mCj4gPiBwcmVwYXJlX2R0Yl9k
b21VLiBMYXRlciBwYXRjaGVzIHdpbGwgY2hhbmdlIHRoZSB2YWx1ZSBvZgo+ID4gZ3Vlc3RfcGhh
bmRsZV9naWMgZGVwZW5kaW5nIG9uIHVzZXIgcHJvdmlkZWQgaW5mb3JtYXRpb24uCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4K
PiA+IAo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHY1Ogo+ID4gLSBpbXByb3ZlIGNvbW1pdCBtZXNz
YWdlCj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gLSBuZXcgcGF0Y2gKPiA+IC0tLQo+ID4gICB4ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmggfCAgMyArKysKPiA+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwo+ID4gaW5kZXggMjE5ODU2MjhmMC4uMzJmODVjZDk1OSAxMDA2
NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBAQCAtNjI3LDcgKzYyNyw4IEBAIHN0YXRpYyBpbnQg
X19pbml0IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAq
a2luZm8sCj4gPiAgIHsKPiA+ICAgICAgIGludCByZXM7Cj4gPiAgICAgICB1aW50MzJfdCBwaGFu
ZGxlID0gaXNfaGFyZHdhcmVfZG9tYWluKGtpbmZvLT5kKSA/Cj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBkdF9pbnRlcnJ1cHRfY29udHJvbGxlci0+cGhhbmRsZSA6IEdVRVNUX1BIQU5ETEVf
R0lDOwo+IAo+IFNvcnJ5LCBJIG9ubHkgcmVhbGl6ZWQgaXQgbm93LiBCdXQgaXMgdGhlcmUgYW55
IHJlYXNvbiB0byBub3Qgc2V0IAo+IGd1ZXN0X3BoYW5kbGVfZ2ljIGZvciB0aGUgaHdkb20gYWxz
bz8KClllcywgSSBjYW4gZG8gdGhhdCBmb3IgZG9tMCB0b28KCgo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5lbC5o
Cj4gPiBpbmRleCAzM2YzZTcyYjExLi43NjA0MzQzNjliIDEwMDY0NAo+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9rZXJuZWwuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9rZXJu
ZWwuaAo+ID4gQEAgLTM2LDYgKzM2LDkgQEAgc3RydWN0IGtlcm5lbF9pbmZvIHsKPiA+ICAgICAg
IC8qIEVuYWJsZSBwbDAxMSBlbXVsYXRpb24gKi8KPiA+ICAgICAgIGJvb2wgdnBsMDExOwo+ID4g
ICAKPiA+ICsgICAgLyogR0lDIHBoYW5kbGUgKi8KPiA+ICsgICAgdWludDMyX3QgZ3Vlc3RfcGhh
bmRsZV9naWM7Cj4gCj4gVGhpcyB3b3VsZCBhbHNvIGFsbG93IHRvIGRyb3AgdGhlIGd1ZXN0XyBw
cmVmaXguCj4gCj4gPiArCj4gPiAgICAgICAvKiBsb2FkZXIgdG8gdXNlIGZvciB0aGlzIGtlcm5l
bCAqLwo+ID4gICAgICAgdm9pZCAoKmxvYWQpKHN0cnVjdCBrZXJuZWxfaW5mbyAqaW5mbyk7Cj4g
PiAgICAgICAvKiBsb2FkZXIgc3BlY2lmaWMgc3RhdGUgKi8KPiA+IAo+IAo+IENoZWVycywKPiAK
PiAtLSAKPiBKdWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
