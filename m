Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF85FB251
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:13:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtNR-0005vH-4K; Wed, 13 Nov 2019 14:12:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUtNP-0005v6-Sd
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:12:07 +0000
X-Inumbo-ID: 92f022f8-061f-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92f022f8-061f-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 14:12:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 25324ADBF;
 Wed, 13 Nov 2019 14:12:06 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
 <20191002112004.25793-6-jgross@suse.com>
 <0eb11745-5ddf-b562-3f15-bb1c4e6fba9c@suse.com>
 <d1d31f54-aa1b-ad87-b7e7-4d904072d3b8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb7f4895-41cd-5c95-24be-3090138eaf3b@suse.com>
Date: Wed, 13 Nov 2019 15:12:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d1d31f54-aa1b-ad87-b7e7-4d904072d3b8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] xen: add /buildinfo/config entry to
 hypervisor filesystem
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMjAxOSAxNzo0NSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMi4xMS4xOSAx
NToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAyLjEwLjIwMTkgMTM6MjAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtNzksMyArODAsMTEgQEAgc3ViZGlyLSQoQ09ORklHX1VCU0FO
KSArPSB1YnNhbgo+Pj4gICAKPj4+ICAgc3ViZGlyLSQoQ09ORklHX05FRURTX0xJQkVMRikgKz0g
bGliZWxmCj4+PiAgIHN1YmRpci0kKENPTkZJR19IQVNfREVWSUNFX1RSRUUpICs9IGxpYmZkdAo+
Pj4gKwo+Pj4gK2NvbmZpZ19kYXRhLmM6IC4uLy5jb25maWcKPj4+ICsJKCBlY2hvICJjaGFyIHhl
bl9jb25maWdfZGF0YVtdID0iOyBcCj4+PiArCSAgLi4vdG9vbHMvYmluMmMgPCQ8OyBcCj4+PiAr
CSAgZWNobyAiOyIgKSA+ICRACj4+Cj4+IEZ1cnRoZXJtb3JlIGlzIHRoZXJlIGEgcmVhc29uIHRv
IGV4cG9zZSB0aGlzIGFzIHBsYWluIHRleHQsIHdoZW4KPj4gTGludXggZXhwb3NlcyBhIGd6aXAt
ZWQgdmVyc2lvbiBpbiAvcHJvYz8gVGhlIGZpbGUgaXNuJ3QgdmVyeQo+PiBsYXJnZSBub3csIGJ1
dCB0aGlzIHdhcyBhbHNvIHRoZSBjYXNlIGZvciBMaW51eCBtYW55IHllYXJzIGFnby4KPiAKPiBn
emlwIGRhdGEgbWF5IGNvbnRhaW4gYnl0ZXMgd2l0aCAweDAwLiBTdXBwb3J0aW5nIHRoYXQgd291
bGQgcmVxdWlyZSBhCj4gZGlmZmVyZW50IGludGVyZmFjZSBhdCBhbGwgbGV2ZWxzLgoKVGhlbiBw
ZXJoYXBzIGJldHRlciBkbyBzbyBub3csIHdoZW4gdGhlIGNvZGUgaXMgc3RpbGwgaW4gZmx1eCwg
dGhhbgphZnRlciB0aGUgZmFjdCwgZXNwZWNpYWxseSBpZiAiYXQgYWxsIGxldmVscyIgaXMgbWVh
bnQgdG8gYWxzbwppbmNsdWRlIHRoZSBwdWJsaWMgaW50ZXJmYWNlPwoKPj4+IC0tLSBhL3hlbi9j
b21tb24vaHlwZnMuYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9oeXBmcy5jCj4+PiBAQCAtMjUsNiAr
MjUsMTAgQEAgc3RhdGljIHN0cnVjdCBoeXBmc19lbnRyeSBoeXBmc19yb290X2VudHJ5ID0gewo+
Pj4gICAgICAgLmRpciA9ICZoeXBmc19yb290LAo+Pj4gICB9Owo+Pj4gICAKPj4+ICtzdGF0aWMg
c3RydWN0IGh5cGZzX2RpciBoeXBmc19idWlsZGluZm8gPSB7Cj4+PiArICAgIC5saXN0ID0gTElT
VF9IRUFEX0lOSVQoaHlwZnNfYnVpbGRpbmZvLmxpc3QpLAo+Pj4gK307Cj4+PiArCj4+PiAgIHN0
YXRpYyBpbnQgaHlwZnNfYWRkX2VudHJ5KHN0cnVjdCBoeXBmc19kaXIgKnBhcmVudCwgc3RydWN0
IGh5cGZzX2VudHJ5ICpuZXcpCj4+PiAgIHsKPj4+ICAgICAgIGludCByZXQgPSAtRU5PRU5UOwo+
Pj4gQEAgLTMxNiwzICszMjAsMTYgQEAgbG9uZyBkb19oeXBmc19vcCh1bnNpZ25lZCBpbnQgY21k
LAo+Pj4gICAKPj4+ICAgICAgIHJldHVybiByZXQ7Cj4+PiAgIH0KPj4+ICsKPj4+ICtzdGF0aWMg
aW50IF9faW5pdCBoeXBmc19pbml0KHZvaWQpCj4+PiArewo+Pj4gKyAgICBpbnQgcmV0Owo+Pj4g
Kwo+Pj4gKyAgICByZXQgPSBoeXBmc19uZXdfZGlyKCZoeXBmc19yb290LCAiYnVpbGRpbmZvIiwg
Jmh5cGZzX2J1aWxkaW5mbyk7Cj4+PiArICAgIEJVR19PTihyZXQpOwo+Pj4gKyAgICByZXQgPSBo
eXBmc19uZXdfZW50cnlfc3RyaW5nKCZoeXBmc19idWlsZGluZm8sICJjb25maWciLCB4ZW5fY29u
ZmlnX2RhdGEpOwo+Pj4gKyAgICBCVUdfT04ocmV0KTsKPj4+ICsKPj4+ICsgICAgcmV0dXJuIDA7
Cj4+PiArfQo+Pj4gK19faW5pdGNhbGwoaHlwZnNfaW5pdCk7Cj4+Cj4+IEhtbSwgZG8geW91IHJl
YWxseSB3YW50IHRvIGNlbnRyYWxpemUgcG9wdWxhdGlvbiBvZiB0aGUgZmlsZSBzeXN0ZW0KPj4g
aGVyZSwgcmF0aGVyIHRoYW4gaGF2aW5nIHRoZSBpbmRpdmlkdWFsIGNvbXBvbmVudHMgdGFrZSBj
YXJlIG9mIGl0Pwo+IAo+IEkgY2FuIGFkZCBhIG5ldyBzb3VyY2UsIGUuZy4gY29tbW9uL2J1aWxk
aW5mby5jIGlmIHlvdSBsaWtlIHRoYXQgYmV0dGVyLgoKSSB3YXMgcmF0aGVyIHRoaW5raW5nIG9m
IG1vdmluZyB0aGlzIGludG8gY29tbW9uL2tlcm5lbC5jLCBuZXh0IHRvIHRoZQp2ZXJzaW9uIGh5
cGVyY2FsbCBoYW5kbGluZywgYW5kIHRvZ2V0aGVyIHdpdGggZXhwb3NpbmcgdGhlIHN1Z2dlc3Rl
ZAp2YWx1ZXMgaGVyZSBhaGVhZCBvZiBleHBvc2luZyAuY29uZmlnLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
