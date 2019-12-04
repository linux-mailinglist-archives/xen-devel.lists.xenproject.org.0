Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E911293F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 11:26:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icRpe-0008H4-5A; Wed, 04 Dec 2019 10:24:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icRpc-0008Gw-R4
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:24:28 +0000
X-Inumbo-ID: 3fc977ca-1680-11ea-aea8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fc977ca-1680-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 10:24:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C18DAE8D;
 Wed,  4 Dec 2019 10:24:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d347b3a-7b2e-d28a-59d0-2206bc215206@suse.com>
Date: Wed, 4 Dec 2019 11:24:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204094335.24603-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/svm: Use named (bit)fields for task
 switch exit info
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJbnRyb2R1Y2Ugdm1j
Yi5lMS4qIGFuZCB2bWNiLmUyLiogdG8gcHJvdmlkZSBuYW1lcyB0byBmaWVsZHMgaW4gZXhpdGlu
Zm97MSwyfQo+IHJlc3BlY3RpdmVseS4gIEltcGxlbWVudCB0aGUgdGFzayBzd2l0Y2ggbmFtZXMg
Zm9yIG5vdywgYW5kIGNsZWFuIHVwIHRoZQo+IFRBU0tfU1dJVENIIGhhbmRsZXIuCgoiZTEiIGFu
ZCAiZTIiIGxvb2sgb3Zlcmx5IHNob3J0IC0gYW5kIGhlbmNlIHBvc3NpYmx5IGFtYmlndW91cyAt
CnRvIG1lLiBNYWtlIHRoZW0gcGVyaGFwcyAiZWkxIiBhbmQgImVpMiI/IEZ1cnRoZXJtb3JlLCBz
ZWVpbmcgLi4uCgo+IEBAIC0yNzk1LDE5ICsyNzkyLDEyIEBAIHZvaWQgc3ZtX3ZtZXhpdF9oYW5k
bGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+ICAgICAgICAgIGlmICggaW5zbl9sZW4g
PCAwICYmIChpbnNuX2xlbiA9IHN2bV9nZXRfdGFza19zd2l0Y2hfaW5zbl9sZW4oKSkgPT0gMCAp
Cj4gICAgICAgICAgICAgIGdvdG8gY3Jhc2hfb3JfZmF1bHQ7Cj4gIAo+IC0gICAgICAgIGlmICgg
KHZtY2ItPmV4aXRpbmZvMiA+PiAzNikgJiAxICkKPiAtICAgICAgICAgICAgcmVhc29uID0gVFNX
X2lyZXQ7Cj4gLSAgICAgICAgZWxzZSBpZiAoICh2bWNiLT5leGl0aW5mbzIgPj4gMzgpICYgMSAp
Cj4gLSAgICAgICAgICAgIHJlYXNvbiA9IFRTV19qbXA7Cj4gLSAgICAgICAgZWxzZQo+IC0gICAg
ICAgICAgICByZWFzb24gPSBUU1dfY2FsbF9vcl9pbnQ7Cj4gLSAgICAgICAgaWYgKCAodm1jYi0+
ZXhpdGluZm8yID4+IDQ0KSAmIDEgKQo+IC0gICAgICAgICAgICBlcnJjb2RlID0gKHVpbnQzMl90
KXZtY2ItPmV4aXRpbmZvMjsKPiAtCj4gLSAgICAgICAgaHZtX3Rhc2tfc3dpdGNoKHZtY2ItPmV4
aXRpbmZvMSwgcmVhc29uLCBlcnJjb2RlLCBpbnNuX2xlbiwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgKHZtY2ItPmV4aXRpbmZvMiAmICgxdWwgPDwgNDgpKSA/IFg4Nl9FRkxBR1NfUkYgOiAw
KTsKPiArICAgICAgICBodm1fdGFza19zd2l0Y2godm1jYi0+ZTEudGFza19zd2l0Y2guc2VsLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICB2bWNiLT5lMi50YXNrX3N3aXRjaC5pcmV0ID8gVFNX
X2lyZXQgOgo+ICsgICAgICAgICAgICAgICAgICAgICAgICB2bWNiLT5lMi50YXNrX3N3aXRjaC5q
bXAgID8gVFNXX2ptcCA6IFRTV19jYWxsX29yX2ludCwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgdm1jYi0+ZTIudGFza19zd2l0Y2guZXYgPyB2bWNiLT5lMi50YXNrX3N3aXRjaC5lYyA6IC0x
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBpbnNuX2xlbiwgdm1jYi0+ZTIudGFza19zd2l0
Y2gucmYgPyBYODZfRUZMQUdTX1JGIDogMCk7CgouLi4gdGhpcywgd291bGRuJ3QgaXQgbWFrZSBz
ZW5zZSB0byBzaW1wbHkgaGF2ZSAiZWkiIGNvdmVyaW5nIGJvdGgKcGFydHMsIG5vIGxvbmdlciBt
YWtpbmcgaXQgYSByZXF1aXJlbWVudCB0byB1c2UgKGFuZCBoZW5jZSBsb29rIHVwKQp0aGUgbnVt
ZXJpYyBzdWZmaXhlcyBhdCB1c2Ugc2l0ZXM/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL3N2bS92bWNiLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vdm1jYi5o
Cj4gQEAgLTQxOCw4ICs0MTgsMzAgQEAgc3RydWN0IHZtY2Jfc3RydWN0IHsKPiAgICAgIHZpbnRy
X3QgX3ZpbnRyOyAgICAgICAgICAgICAvKiBvZmZzZXQgMHg2MCAtIGNsZWFuYml0IDMgKi8KPiAg
ICAgIHU2NCBpbnRlcnJ1cHRfc2hhZG93OyAgICAgICAvKiBvZmZzZXQgMHg2OCAqLwo+ICAgICAg
dTY0IGV4aXRjb2RlOyAgICAgICAgICAgICAgIC8qIG9mZnNldCAweDcwICovCj4gLSAgICB1NjQg
ZXhpdGluZm8xOyAgICAgICAgICAgICAgLyogb2Zmc2V0IDB4NzggKi8KPiAtICAgIHU2NCBleGl0
aW5mbzI7ICAgICAgICAgICAgICAvKiBvZmZzZXQgMHg4MCAqLwo+ICsgICAgdW5pb24gewo+ICsg
ICAgICAgIHU2NCBleGl0aW5mbzE7ICAgICAgICAgIC8qIG9mZnNldCAweDc4ICovCgp1aW50NjRf
dCAoYWxzbyBiZWxvdyk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
