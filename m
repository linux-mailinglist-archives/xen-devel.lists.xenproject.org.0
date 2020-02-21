Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8F816896A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 22:38:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Fxn-0007FY-7e; Fri, 21 Feb 2020 21:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IZZ7=4J=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j5Fxl-0007FT-Jp
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 21:35:57 +0000
X-Inumbo-ID: 24b31f58-54f2-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24b31f58-54f2-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 21:35:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so3599476wrw.8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 13:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkoY7wx1Rw8voLy+C+OMpmw68MLGXcjZvyDPy/d/XZQ=;
 b=cQ0iGVFz8cxb3hPJ0q0V5B1AHx1IqcjwTZAqg/P+FrakqQasyZ1o9S3hYZinvREJyE
 0vJSMHA1LRU0ZPsApbI8K3eU7uPh6ti7BHADVbfVzzx0pZ5dFEMoQE6i9HZGufnq36Rv
 lSGx4Mqsngkfb/BYXmbrsU009JOKsofBK6l+VbXIRlmYej7rodu611HeKzlxhhM5o8GR
 xhFJIIPFGzbwDqGYv3Y502jvxiIPQfayieZbycdxCREosGoafKrylzFuANmCs2PgIp2H
 4vWudtPyS1W48OwxyhsrTS1jhFxbY3h7MuA9/oaNnEs5qYjzCj+IVGvW0g1di/uupZ1V
 qvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkoY7wx1Rw8voLy+C+OMpmw68MLGXcjZvyDPy/d/XZQ=;
 b=JEeHip3dSDwVuIu4O0tHFC3P9tz+dx+zXP7qA3iYT5PUDUYaEbtFmSKXavzq9OfKMz
 SgJ/J9UYhOC52a1yHSX7rrWdjMrCAVUikO8gFZnvFDLWK+bCU6QZLf4x1jCXQFgAPIcy
 xxe0QjxN+XsUS6kV0sbqa+UeOIHPT5KhjCZXcMtsyeU4pBTMbam/Gl6JgkVWQT35zdMv
 blNG2tkK8Ndpmj3pFSnCZZN/yJZ8TIv7xGpAANkG97fgLRfbnCMhtXoDh/vyQ0Jz9akU
 +ka+K/R8/BUDiBMlCIW7ieKC/hkpiTw/bDPHzXA6cZuC5ODQdx55p/3WZ8/Y22vNyrHJ
 u/3Q==
X-Gm-Message-State: APjAAAVrHtPf8USB8oz1xeiKIjI5VSN65YIt5W+PxHglucQoaZo5MSSD
 r8yhfjUWkTHuRU03rf1jed4e+aQYPC+cKwldxYI=
X-Google-Smtp-Source: APXvYqzc+KBnUExo2wW9dbbbLfgZpdxL0d8UXrjstK4MeWXpNrvXxQdtYMqceYGOXFw334njjYXubLNgsTRS1KWTNEo=
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr51315037wrx.386.1582320955784; 
 Fri, 21 Feb 2020 13:35:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
 <4b27cc09-8578-8fa1-2a7e-858d1767353a@xen.org>
In-Reply-To: <4b27cc09-8578-8fa1-2a7e-858d1767353a@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 21 Feb 2020 14:35:19 -0700
Message-ID: <CABfawhmN=93bF3-qz-b7r7U6xuq9=OOFFzJ88PcM4dwXJpkL=g@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v9 2/5] xen: add parent_domid field to
 createdomain domctl
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMjowMyBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IEhpIFRhbWFzLAo+Cj4gT24gMjEvMDIvMjAyMCAxODo0OSwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4gV2hlbiBjcmVhdGluZyBhIGRvbWFpbiB0aGF0IHdpbGwgYmUg
dXNlZCBhcyBhIFZNIGZvcmsgc29tZSBpbmZvcm1hdGlvbiBpcwo+ID4gcmVxdWlyZWQgdG8gc2V0
IHRoaW5ncyB1cCBwcm9wZXJseSwgbGlrZSB0aGUgbWF4X3ZjcHVzIGNvdW50LiBJbnN0ZWFkIG9m
IHRoZQo+ID4gdG9vbHN0YWNrIGhhdmluZyB0byBnYXRoZXIgdGhpcyBpbmZvcm1hdGlvbiBmb3Ig
ZWFjaCBmb3JrIGluIGEgc2VwYXJhdGUKPiA+IGh5cGVyY2FsbCB3ZSBjYW4ganVzdCBpbmNsdWRl
IHRoZSBwYXJlbnQgZG9tYWluJ3MgaWQgaW4gdGhlIGNyZWF0ZWRvbWFpbiBkb21jdGwKPiA+IHNv
IHRoYXQgWGVuIGNhbiBjb3B5IHRoZSBzZXR0aW5nIHdpdGhvdXQgdGhlIGV4dHJhIHRvb2xzdGFj
ayBxdWVyaWVzLgo+Cj4gSXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHdoeSB5b3Ugb25seSB3YW50
IHRvIGNvcHkgbWF4X3ZjcHVzLiBGcm9tIG15Cj4gdW5kZXJzdGFuZGluZywgIHdoZW4geW91IGFy
ZSBnb2luZyB0byBmb3JrIGEgZG9tYWluIHlvdSB3aWxsIHdhbnQgdGhlCj4gZG9tYWluIHRvIGJl
IG5lYXJseSBpZGVudGljYWwuIFNvIGhvdyBkbyB5b3UgZGVjaWRlIHdoYXQgdG8gY29weT8KCkFs
bCBwYXJhbWV0ZXJzIG9mIHRoZSBwYXJlbnQgZG9tYWluIG5lZWQgdG8gYmUgY29waWVkLCBidXQg
ZHVyaW5nCmNyZWF0ZWRvbWFpbiBkb21jdGwgb25seSBtYXhfdmNwdXMgaXMgcmVxdWlyZWQuIFRo
ZSByZXN0IGFyZSBjb3BpZWQKZHVyaW5nIFhFTk1FTV9zaGFyaW5nX29wX2ZvcmsuCgo+Cj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNv
bT4KPiA+IC0tLQo+ID4gICB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgfCAxNCArKysrKysr
KysrKysrKwo+ID4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggfCAgMyArKy0KPiA+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jCj4g
PiBpbmRleCBhNjliM2I1OWE4Li4yMmFjZWIzODYwIDEwMDY0NAo+ID4gLS0tIGEveGVuL2NvbW1v
bi9kb21jdGwuYwo+ID4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwo+ID4gQEAgLTQ4OSw2ICs0
ODksNyBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxf
dCkgdV9kb21jdGwpCj4gPiAgICAgICBjYXNlIFhFTl9ET01DVExfY3JlYXRlZG9tYWluOgo+ID4g
ICAgICAgewo+ID4gICAgICAgICAgIGRvbWlkX3QgICAgICAgIGRvbTsKPiA+ICsgICAgICAgIGRv
bWlkX3QgICAgICAgIHBhcmVudF9kb207Cj4gPiAgICAgICAgICAgc3RhdGljIGRvbWlkX3Qgcm92
ZXIgPSAwOwo+ID4KPiA+ICAgICAgICAgICBkb20gPSBvcC0+ZG9tYWluOwo+ID4gQEAgLTUxNSw2
ICs1MTYsMTkgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9t
Y3RsX3QpIHVfZG9tY3RsKQo+ID4gICAgICAgICAgICAgICByb3ZlciA9IGRvbTsKPiA+ICAgICAg
ICAgICB9Cj4gPgo+ID4gKyAgICAgICAgcGFyZW50X2RvbSA9IG9wLT51LmNyZWF0ZWRvbWFpbi5w
YXJlbnRfZG9taWQ7Cj4gPiArICAgICAgICBpZiAoIHBhcmVudF9kb20gKQo+Cj4gSSB3b3VsZCBy
YXRoZXIgYXZvaWQgdG8gYXNzdW1lIHRoYXQgcGFyZW50X2RvbSB3aWxsIG5vdCBiZSAwIGZvciBh
IGZldwo+IHJlYXNvbnM6Cj4gICAgIDEpIE1vc3Qgb2YgWGVuIChpZiBub3QgYWxsKSBub3cgYXZv
aWQgdG8gYXNzdW1lIHRoYXQgZG9tMC0+ZG9tYWluX2lkCj4gPT0gMC4KPiAgICAgMikgSSBjYW4g
c2VlIHVzZWNhc2VzIHdoZXJlIGl0IHdlIG1heSB3YW50IHRvIHJlY3JlYXRlIGRvbTAgc2V0dXAu
CgpUaGF0J3MgYW4gaW50ZXJlc3RpbmcgdGhvdWdodCwgSSBkb24ndCBleHBlY3QgdGhhdCB3aWxs
IGJlIGEgdXNlY2FzZQpidXQgaXQncyBpbnRlcmVzdGluZy4gQ3VycmVudGx5IEkgZG9uJ3QgdGhp
bmsgaXQgd291bGQgd29yaywgc28gSQpjb25zaWRlciB0aGF0IHRvIGJlIG91dC1vZi1zY29wZS4K
Cj4KPiBTbyB3ZSBzaG91bGQgY29uc2lkZXIgYSBkaWZmZXJlbnQgdmFsdWUgdG8gaW5kaWNhdGUg
d2hldGhlciB3ZSB3YW50IHRvCj4gY2xvbmUgZnJvbSBhIGRvbWFpbi4gTWF5YmUgYnkgc2V0dGlu
ZyBiaXQgMTYgb2YgdGhlIHBhcmVudF9kb21pZD8KCkkgY2FuIGFkZCBhIFhFTl9ET01DVExfQ0RG
X2ZvcmsgZmxhZywgYnV0IEkgdGhpbmsgdGhhdCdzIGFuIG92ZXJraWxsLgoKPgo+ID4gKyAgICAg
ICAgewo+ID4gKyAgICAgICAgICAgIHN0cnVjdCBkb21haW4gKnBkID0gcmN1X2xvY2tfZG9tYWlu
X2J5X2lkKHBhcmVudF9kb20pOwo+ID4gKwo+ID4gKyAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7
Cj4gPiArICAgICAgICAgICAgaWYgKCAhcGQgKQo+ID4gKyAgICAgICAgICAgICAgICBicmVhazsK
PiA+ICsKPiA+ICsgICAgICAgICAgICBvcC0+dS5jcmVhdGVkb21haW4ubWF4X3ZjcHVzID0gcGQt
Pm1heF92Y3B1czsKPiA+ICsgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihwZCk7Cj4gPiAr
ICAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgICAgZCA9IGRvbWFpbl9jcmVhdGUoZG9tLCAmb3At
PnUuY3JlYXRlZG9tYWluLCBmYWxzZSk7Cj4gPiAgICAgICAgICAgaWYgKCBJU19FUlIoZCkgKQo+
ID4gICAgICAgICAgIHsKPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiA+IGluZGV4IGZlYzZmNmZkZDEuLjI1
MWNjNDBlZjYgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiA+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ID4gQEAgLTM4LDcgKzM4LDcgQEAK
PiA+ICAgI2luY2x1ZGUgImh2bS9zYXZlLmgiCj4gPiAgICNpbmNsdWRlICJtZW1vcnkuaCIKPiA+
Cj4gPiAtI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMTIKPiA+
ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMwo+ID4KPiA+
ICAgLyoKPiA+ICAgICogTkIuIHhlbl9kb21jdGwuZG9tYWluIGlzIGFuIElOL09VVCBwYXJhbWV0
ZXIgZm9yIHRoaXMgb3BlcmF0aW9uLgo+ID4gQEAgLTkyLDYgKzkyLDcgQEAgc3RydWN0IHhlbl9k
b21jdGxfY3JlYXRlZG9tYWluIHsKPiA+ICAgICAgIHVpbnQzMl90IG1heF9ldnRjaG5fcG9ydDsK
PiA+ICAgICAgIGludDMyX3QgbWF4X2dyYW50X2ZyYW1lczsKPiA+ICAgICAgIGludDMyX3QgbWF4
X21hcHRyYWNrX2ZyYW1lczsKPiA+ICsgICAgZG9taWRfdCBwYXJlbnRfZG9taWQ7Cj4KPiBCeSBq
dXN0IGxvb2tpbmcgYXQgdGhlIG5hbWUsIGl0IGlzIG5vdCBjbGVhciB3aGF0IHRoZSBmaWVsZCBp
cyBmb3IuIEl0Cj4gYWxzbyBzdWdnZXN0IHRoYXQgb25lIGRvbWFpbiB3aWxsIGJlIGxpbmtlZCB0
byB0aGUgb3RoZXIuIEJ1dCB0aGlzIGlzCj4gbm90IHRoZSBjYXNlIGhlcmUuIEkgd291bGQgcmVj
b21tZW5kIHRvIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyBob3cKPiB0aGlzIGlzIHVzZWQgYnkg
WGVuLgoKTm8sIGR1cmluZyBjcmVhdGVkb21haW4gdGhlIGRvbWFpbnMgd29uJ3QgZ2V0IGxpbmtl
ZC4gT25seSBvbmNlIHRoZQpYRU5NRU1fc2hhcmluZ19vcF9mb3JrIGZpbmlzaGVzIGRvIHRoZSBk
b21haW5zIGdldCBsaW5rZWQuIEkgZXhwbGFpbgp0aGlzIGluIHRoZSBwYXRjaCBtZXNzYWdlLCBJ
IGNhbiBjb3B5IHRoYXQgYXMgYSBjb21tZW50IGludG8gdGhlCmhlYWRlciBpZiB5b3UgcHJlZmVy
LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
