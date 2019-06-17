Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEAE4871E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:29:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctXK-0006nl-A7; Mon, 17 Jun 2019 15:27:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUew=UQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hctXI-0006nf-L9
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:27:08 +0000
X-Inumbo-ID: 5c873358-9114-11e9-a164-9b5c8ddde109
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5c873358-9114-11e9-a164-9b5c8ddde109;
 Mon, 17 Jun 2019 15:27:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B44BB28;
 Mon, 17 Jun 2019 08:27:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CAC53F718;
 Mon, 17 Jun 2019 08:27:03 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D03BE5102000078002385FE@prv1-mh.provo.novell.com>
 <5D03BF8E020000780023861C@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <688a3c9e-6ee2-fb39-c4bf-bc39b41e18f8@arm.com>
Date: Mon, 17 Jun 2019 16:27:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D03BF8E020000780023861C@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] drop __get_cpu_var() and __get_cpu_ptr()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDYvMjAxOSAxNjozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gdGhpc19j
cHV7LF9wdHJ9KCkgYXJlIHNob3J0ZXIsIGFuZCBoYXZlIHByZXZpb3VzbHkgYmVlbiBtYXJrZWQg
YXMKPiBwcmVmZXJyZWQgaW4gWGVuIGFueXdheS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCj4gCj4gLS0tIGEveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCj4gKysrIGIv
eGVuL2NvbW1vbi9yY3VwZGF0ZS5jCj4gQEAgLTIyNSw3ICsyMjUsNyBAQCB2b2lkIGNhbGxfcmN1
KHN0cnVjdCByY3VfaGVhZCAqaGVhZCwKPiAgICAgICBoZWFkLT5mdW5jID0gZnVuYzsKPiAgICAg
ICBoZWFkLT5uZXh0ID0gTlVMTDsKPiAgICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7Cj4gLSAg
ICByZHAgPSAmX19nZXRfY3B1X3ZhcihyY3VfZGF0YSk7Cj4gKyAgICByZHAgPSAmdGhpc19jcHUo
cmN1X2RhdGEpOwo+ICAgICAgICpyZHAtPm54dHRhaWwgPSBoZWFkOwo+ICAgICAgIHJkcC0+bnh0
dGFpbCA9ICZoZWFkLT5uZXh0Owo+ICAgICAgIGlmICh1bmxpa2VseSgrK3JkcC0+cWxlbiA+IHFo
aW1hcmspKSB7Cj4gQEAgLTQwOSw3ICs0MDksNyBAQCBzdGF0aWMgdm9pZCBfX3JjdV9wcm9jZXNz
X2NhbGxiYWNrcyhzdHJ1Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHJjdV9wcm9jZXNzX2NhbGxiYWNr
cyh2b2lkKQo+ICAgewo+IC0gICAgX19yY3VfcHJvY2Vzc19jYWxsYmFja3MoJnJjdV9jdHJsYmxr
LCAmX19nZXRfY3B1X3ZhcihyY3VfZGF0YSkpOwo+ICsgICAgX19yY3VfcHJvY2Vzc19jYWxsYmFj
a3MoJnJjdV9jdHJsYmxrLCAmdGhpc19jcHUocmN1X2RhdGEpKTsKPiAgIH0KPiAgIAo+ICAgc3Rh
dGljIGludCBfX3JjdV9wZW5kaW5nKHN0cnVjdCByY3VfY3RybGJsayAqcmNwLCBzdHJ1Y3QgcmN1
X2RhdGEgKnJkcCkKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BlcmNwdS5oCj4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9wZXJjcHUuaAo+IEBAIC0xNywxMiArMTcsMTIgQEAgdm9pZCBw
ZXJjcHVfaW5pdF9hcmVhcyh2b2lkKTsKPiAgIAo+ICAgI2RlZmluZSBwZXJfY3B1KHZhciwgY3B1
KSAgXAo+ICAgICAgICgqUkVMT0NfSElERSgmcGVyX2NwdV9fIyN2YXIsIF9fcGVyX2NwdV9vZmZz
ZXRbY3B1XSkpCj4gLSNkZWZpbmUgX19nZXRfY3B1X3Zhcih2YXIpIFwKPiArI2RlZmluZSB0aGlz
X2NwdSh2YXIpIFwKPiAgICAgICAoKlJFTE9DX0hJREUoJnBlcl9jcHVfXyMjdmFyLCBSRUFEX1NZ
U1JFRyhUUElEUl9FTDIpKSkKPiAgIAo+ICAgI2RlZmluZSBwZXJfY3B1X3B0cih2YXIsIGNwdSkg
IFwKPiAgICAgICAoKlJFTE9DX0hJREUodmFyLCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0pKQo+IC0j
ZGVmaW5lIF9fZ2V0X2NwdV9wdHIodmFyKSBcCj4gKyNkZWZpbmUgdGhpc19jcHVfcHRyKHZhcikg
XAo+ICAgICAgICgqUkVMT0NfSElERSh2YXIsIFJFQURfU1lTUkVHKFRQSURSX0VMMikpKQo+ICAg
Cj4gICAjZGVmaW5lIERFQ0xBUkVfUEVSX0NQVSh0eXBlLCBuYW1lKSBleHRlcm4gX190eXBlb2Zf
Xyh0eXBlKSBwZXJfY3B1X18jI25hbWUKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BlcmNw
dS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wZXJjcHUuaAo+IEBAIC0xNSwxMiArMTUs
MTIgQEAgdm9pZCBwZXJjcHVfaW5pdF9hcmVhcyh2b2lkKTsKPiAgIC8qIHZhciBpcyBpbiBkaXNj
YXJkZWQgcmVnaW9uOiBvZmZzZXQgdG8gcGFydGljdWxhciBjb3B5IHdlIHdhbnQgKi8KPiAgICNk
ZWZpbmUgcGVyX2NwdSh2YXIsIGNwdSkgIFwKPiAgICAgICAoKlJFTE9DX0hJREUoJnBlcl9jcHVf
XyMjdmFyLCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0pKQo+IC0jZGVmaW5lIF9fZ2V0X2NwdV92YXIo
dmFyKSBcCj4gKyNkZWZpbmUgdGhpc19jcHUodmFyKSBcCj4gICAgICAgKCpSRUxPQ19ISURFKCZw
ZXJfY3B1X18jI3ZhciwgZ2V0X2NwdV9pbmZvKCktPnBlcl9jcHVfb2Zmc2V0KSkKPiAgIAo+ICAg
I2RlZmluZSBERUNMQVJFX1BFUl9DUFUodHlwZSwgbmFtZSkgZXh0ZXJuIF9fdHlwZW9mX18odHlw
ZSkgcGVyX2NwdV9fIyNuYW1lCj4gICAKPiAtI2RlZmluZSBfX2dldF9jcHVfcHRyKHZhcikgXAo+
ICsjZGVmaW5lIHRoaXNfY3B1X3B0cih2YXIpIFwKPiAgICAgICAoKlJFTE9DX0hJREUodmFyLCBn
ZXRfY3B1X2luZm8oKS0+cGVyX2NwdV9vZmZzZXQpKQo+ICAgCj4gICAjZGVmaW5lIHBlcl9jcHVf
cHRyKHZhciwgY3B1KSAgXAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaAo+IEBAIC0xMywxMSArMTMsNiBAQAo+ICAgI2RlZmlu
ZSBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh0eXBlLCBuYW1lKSBcCj4gICAJX19ERUZJTkVf
UEVSX0NQVSh0eXBlLCBfIyNuYW1lLCAucmVhZF9tb3N0bHkpCj4gICAKPiAtLyogUHJlZmVycmVk
IG9uIFhlbi4gQWxzbyBzZWUgYXJjaC1kZWZpbmVkIHBlcl9jcHUoKS4gKi8KPiAtI2RlZmluZSB0
aGlzX2NwdSh2YXIpICAgIF9fZ2V0X2NwdV92YXIodmFyKQo+IC0KPiAtI2RlZmluZSB0aGlzX2Nw
dV9wdHIocHRyKSAgICBfX2dldF9jcHVfcHRyKHB0cikKPiAtCj4gICAjZGVmaW5lIGdldF9wZXJf
Y3B1X3Zhcih2YXIpICAocGVyX2NwdV9fIyN2YXIpCj4gICAKPiAgIC8qIExpbnV4IGNvbXBhdGli
aWxpdHkuICovCj4gLS0tIGEveGVuL3hzbS9mbGFzay9hdmMuYwo+ICsrKyBiL3hlbi94c20vZmxh
c2svYXZjLmMKPiBAQCAtNTcsOSArNTcsOSBAQCBjb25zdCBzdHJ1Y3Qgc2VsaW51eF9jbGFzc19w
ZXJtIHNlbGludXhfCj4gICAjZGVmaW5lIEFWQ19DQUNIRV9SRUNMQUlNICAgICAgICAxNgo+ICAg
Cj4gICAjaWZkZWYgQ09ORklHX1hTTV9GTEFTS19BVkNfU1RBVFMKPiAtI2RlZmluZSBhdmNfY2Fj
aGVfc3RhdHNfaW5jcihmaWVsZCkgICAgICAgICAgICAgICAgIFwKPiAtZG8geyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgX19nZXRfY3B1X3ZhcihhdmNfY2FjaGVfc3Rh
dHMpLmZpZWxkKys7ICAgICAgICBcCj4gKyNkZWZpbmUgYXZjX2NhY2hlX3N0YXRzX2luY3IoZmll
bGQpICAgIFwKPiArZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgdGhpc19jcHUoYXZjX2NhY2hlX3N0YXRzKS5maWVsZCsrOyBcCj4gICB9IHdoaWxlICgwKQo+
ICAgI2Vsc2UKPiAgICNkZWZpbmUgYXZjX2NhY2hlX3N0YXRzX2luY3IoZmllbGQpICAgIGRvIHt9
IHdoaWxlICgwKQo+IAo+IAo+IAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
