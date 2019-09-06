Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180BABC2B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:21:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6G00-00062S-Q9; Fri, 06 Sep 2019 15:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6Fzz-00062N-ED
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:18:07 +0000
X-Inumbo-ID: 86632a76-d0b9-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86632a76-d0b9-11e9-b76c-bc764e2007e4;
 Fri, 06 Sep 2019 15:18:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E57F8AD69;
 Fri,  6 Sep 2019 15:18:04 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190905194909.6811-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7787fb5-02ea-61a0-b503-21b21c2961aa@suse.com>
Date: Fri, 6 Sep 2019 17:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905194909.6811-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpuid: Extend the cpuid= option to
 support all named features
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

T24gMDUuMDkuMjAxOSAyMTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1aWQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jCj4gQEAgLTIxLDQ1ICsy
MSw2MiBAQCBzdGF0aWMgY29uc3QgdWludDMyX3QgZGVlcF9mZWF0dXJlc1tdID0gSU5JVF9ERUVQ
X0ZFQVRVUkVTOwo+ICAKPiAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfeGVuX2NwdWlkKGNvbnN0
IGNoYXIgKnMpCj4gIHsKPiArICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmVhdHVyZSB7Cj4gKyAg
ICAgICAgY29uc3QgY2hhciAqbmFtZTsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgYml0Owo+ICsg
ICAgfSBmZWF0dXJlc1tdIF9faW5pdGNvbnN0ID0gSU5JVF9GRUFUVVJFX05BTUVTLCAqbGhzLCAq
bWlkLCAqcmhzOwoKVGhlIHBvaW50ZXIgZmllbGQgd2FudCB0aGlzIHRvIHVzZSBfX2luaXRjb25z
dHJlbC4gQW5kIEkgZG9uJ3QgdGhpbmsKeW91IG1lYW4gbGhzLCBtaWQsIGFuZCByaHMgdG8gYWxz
byBiZSBzdGF0aWM/IEFsYmVpdCAuLi4KCj4gICAgICBjb25zdCBjaGFyICpzczsKPiAgICAgIGlu
dCB2YWwsIHJjID0gMDsKPiAgCj4gICAgICBkbyB7Cj4gKyAgICAgICAgY29uc3QgY2hhciAqZmVh
dDsKPiArCj4gICAgICAgICAgc3MgPSBzdHJjaHIocywgJywnKTsKPiAgICAgICAgICBpZiAoICFz
cyApCj4gICAgICAgICAgICAgIHNzID0gc3RyY2hyKHMsICdcMCcpOwo+ICAKPiAtICAgICAgICBp
ZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJtZC1jbGVhciIsIHMsIHNzKSkgPj0gMCApCj4gLSAg
ICAgICAgewo+IC0gICAgICAgICAgICBpZiAoICF2YWwgKQo+IC0gICAgICAgICAgICAgICAgc2V0
dXBfY2xlYXJfY3B1X2NhcChYODZfRkVBVFVSRV9NRF9DTEVBUik7Cj4gLSAgICAgICAgfQo+IC0g
ICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigiaWJwYiIsIHMsIHNzKSkgPj0g
MCApCj4gLSAgICAgICAgewo+IC0gICAgICAgICAgICBpZiAoICF2YWwgKQo+IC0gICAgICAgICAg
ICAgICAgc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVBVFVSRV9JQlBCKTsKPiAtICAgICAgICB9
Cj4gLSAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJpYnJzYiIsIHMsIHNz
KSkgPj0gMCApCj4gLSAgICAgICAgewo+IC0gICAgICAgICAgICBpZiAoICF2YWwgKQo+IC0gICAg
ICAgICAgICAgICAgc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVBVFVSRV9JQlJTQik7Cj4gLSAg
ICAgICAgfQo+IC0gICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigic3RpYnAi
LCBzLCBzcykpID49IDAgKQo+IC0gICAgICAgIHsKPiAtICAgICAgICAgICAgaWYgKCAhdmFsICkK
PiAtICAgICAgICAgICAgICAgIHNldHVwX2NsZWFyX2NwdV9jYXAoWDg2X0ZFQVRVUkVfU1RJQlAp
Owo+IC0gICAgICAgIH0KPiAtICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4o
ImwxZC1mbHVzaCIsIHMsIHNzKSkgPj0gMCApCj4gLSAgICAgICAgewo+IC0gICAgICAgICAgICBp
ZiAoICF2YWwgKQo+IC0gICAgICAgICAgICAgICAgc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVB
VFVSRV9MMURfRkxVU0gpOwo+IC0gICAgICAgIH0KPiAtICAgICAgICBlbHNlIGlmICggKHZhbCA9
IHBhcnNlX2Jvb2xlYW4oInNzYmQiLCBzLCBzcykpID49IDAgKQo+ICsgICAgICAgIC8qIFNraXAg
dGhlICduby0nIHByZWZpeCBmb3IgbmFtZSBjb21wYXJpc29ucy4gKi8KPiArICAgICAgICBmZWF0
ID0gczsKPiArICAgICAgICBpZiAoIHN0cm5jbXAocywgIm5vLSIsIDMpID09IDAgKQo+ICsgICAg
ICAgICAgICBmZWF0ICs9IDM7Cj4gKwo+ICsgICAgICAgIC8qIChSZSlpbml0YWxpc2UgbGhzIGFu
ZCByaHMgZm9yIGJpbmFyeSBzZWFyY2guICovCj4gKyAgICAgICAgbGhzID0gZmVhdHVyZXM7Cj4g
KyAgICAgICAgcmhzID0gZmVhdHVyZXMgKyBBUlJBWV9TSVpFKGZlYXR1cmVzKTsKCi4uLiB0aGUg
Y29tbWVudCBoZXJlIHN1Z2dlc3RzIHlvdSBkbywgYnV0IEkgZG9uJ3QgY3VycmVudGx5IHNlZSB3
aHkuCkknZCBsaWtlIHRvIHVuZGVyc3RhbmQgdGhpcyB0aG91Z2ggYmVmb3JlIGdpdmluZyBhbiBh
Y2suCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
