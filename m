Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F851B9C6
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:20:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCiC-00076P-Jn; Mon, 13 May 2019 15:17:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CZq+=TN=citrix.com=prvs=029e45453=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQCiB-00076K-4a
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:17:55 +0000
X-Inumbo-ID: 4727fa6c-7592-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4727fa6c-7592-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:17:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89709692"
To: Jan Beulich <JBeulich@suse.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-4-git-send-email-andrew.cooper3@citrix.com>
 <5CD986B4020000780022E394@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6f460a8e-d78d-425b-b7f1-0f667a1b42be@citrix.com>
Date: Mon, 13 May 2019 16:17:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD986B4020000780022E394@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] xen/watchdog: Drop all locked
 operations on the watchdog_inuse_map
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDUvMjAxOSAxNjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDUuMTkg
YXQgMjA6MjgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gQWxsIG1vZGlm
aWNhdGlvbnMgdG8gdGhlIHdhdGNoZG9nX2ludXNlX21hcCBoYXBwZW4gd2l0aCBkLT53YXRjaGRv
Z19sb2NrIGhlbGQsCj4+IHNvIHRoZXJlIGFyZSBubyBjb25jdXJyZW5jeSBwcm9ibGVtcyB0byBk
ZWFsIHdpdGguCj4gQnV0IGNvbmN1cnJlbmN5IHByb2JsZW1zIGNhbiBhbHNvIG9jY3VyIGZvciBy
ZWFkZXJzLiBXaGlsZQo+IG5vdCBhIHByb2JsZW0gYWZhaWN0LCBkdW1wX2RvbWFpbnMoKSBhY3R1
YWxseSBoYXMgc3VjaCBhbgo+IGV4YW1wbGUgKGFuZCBoZW5jZSBtaWdodCBiZSB3b3J0aCBtZW50
aW9uaW5nIGhlcmUpLgoKSXRzIG9ubHkgZGVidWdnaW5nLCBhbmQgd291bGQgbmVlZCB0byB0YWtl
IHRoZSBzcGlubG9jayBhbnl3YXkgdG8gYXZvaWQKYSBUT0NUT1UgcmFjZSBiZXR3ZWVuIHdhdGNo
ZG9nX2ludXNlX21hcCBhbmQgZC0+d2F0Y2hkb2dfdGltZXJbaV0uZXhwaXJlcwoKPj4gLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBA
QCAtMTA2OCwxNyArMTA2OCwxNSBAQCBzdGF0aWMgbG9uZyBkb21haW5fd2F0Y2hkb2coc3RydWN0
IGRvbWFpbiAqZCwgdWludDMyX3QgaWQsIHVpbnQzMl90IHRpbWVvdXQpCj4+ICAgICAgfQo+PiAg
ICAgIGVsc2UgLyogQWxsb2NhdGUgdGhlIG5leHQgYXZhaWxhYmxlIHRpbWVyLiAqLwo+PiAgICAg
IHsKPj4gLSAgICAgICAgZm9yICggaWQgPSAwOyBpZCA8IE5SX0RPTUFJTl9XQVRDSERPR19USU1F
UlM7IGlkKysgKQo+PiAtICAgICAgICB7Cj4+IC0gICAgICAgICAgICBpZiAoIHRlc3RfYW5kX3Nl
dF9iaXQoaWQsICZkLT53YXRjaGRvZ19pbnVzZV9tYXApICkKPj4gLSAgICAgICAgICAgICAgICBj
b250aW51ZTsKPj4gLSAgICAgICAgICAgIGJyZWFrOwo+PiAtICAgICAgICB9Cj4+IC0gICAgICAg
IGlmICggaWQgPT0gTlJfRE9NQUlOX1dBVENIRE9HX1RJTUVSUyApCj4+ICsgICAgICAgIGlkID0g
ZmZzKH5kLT53YXRjaGRvZ19pbnVzZV9tYXApIC0gMTsKPiBJJ20gc3VycHJpc2VkIHdlIGhhdmUg
bm8gKHVuaXZlcnNhbGx5IGF2YWlsYWJsZSkgZmZ6KCkuIEkgd29uZGVyCj4gdGhvdWdoIHdoZXRo
ZXIgZmluZF9maXJzdF96ZXJvX2JpdCgpIHdvdWxkbid0IGJlIHRoZSBiZXR0ZXIKPiBjaG9pY2Ug
aGVyZSBhbnl3YXksIGFzIHRoZSByZXN1bHQgd291bGRuJ3QgYmUgdW5kZWZpbmVkIGluCj4gY2Fz
ZSBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJTIGdyZXcgdG8gMzIuCgpTYWRseSBubyAtIGZpbmRf
Zmlyc3RfemVyb19iaXQoKSB0YWtlcyB1bnNpZ25lZCBsb25nICosIHNvIGl0cyB1c2UgaGVyZQph
KSByZXF1aXJlcyBhICh2b2lkICopIGNhc3QgdG8gY29tcGlsZSwgYW5kIGIpIGlzIGRlZmluaXRl
bHkgVUIuCgpJIGRpZG4ndCBmYW5jeSBleHRlbmRpbmcgZC0+d2F0Y2hkb2dfaW51c2VfbWFwIHRv
IHVuc2lnbmVkIGxvbmcganVzdCB0bwptYWtlIHRoaXMgd29yaywgbm9yIGRvIEkgdGhpbmsgaXQg
aXMgbGlrZWx5IGZvciB0aGlzIGludGVyZmFjZSB0byBnYWluCm1vcmUgdGltZXJzLsKgIEZyb20g
YSB1c2FiaWxpdHkgcG9pbnQgb2YgdmlldywgaXQgaXMgcmF0aGVyIHRlcnJpYmxlLgoKQSBmYXIg
bW9yZSB1c2VmdWwgaW50ZXJmYWNlIChmcm9tIGEgZ3Vlc3RzIHBvaW50IG9mIHZpZXcpIHdvdWxk
IGJlIGEKbWVjaGFuaXNtIHdpdGggYSBwZXItdmNwdSB0aW1lciB3aGljaCBpbmplY3RzIGFuIE5N
SSBvbiB0aW1lb3V0LCB3aGljaApwZXJtaXRzIHRoZSBndWVzdCBmYXIgbW9yZSBmbGV4aWJpbGl0
eSBhYm91dCBob3cgdG8gaGFuZGxlIHRoZSB0aW1lb3V0LAp3aGljaCBtaWdodCBpbmNsdWRpbmcg
ZHVtcGluZyBzdGF0ZSBvciBzZW5kaW5nIG91dCBhIHBvc2l0aXZlICJJJ20KZmVuY2luZyIgYnJv
YWRjYXN0LsKgIEZvciBzb21lIEhBIHNjZW5hcmlvcywgdGhpcyBpcyBwcmVmZXJhYmxlIHRvCmZv
cmNpbmcgZXZlcnlvbmUgZWxzZSB0byB3YWl0IGZvciB0aGUgc3lzdGVtIHRpbWVvdXQgYmVmb3Jl
IGRlY2xhcmluZwp0aGUgZGVhZCBlbnRpdHkgdG8gaGF2ZSBmZW5jZWQuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
