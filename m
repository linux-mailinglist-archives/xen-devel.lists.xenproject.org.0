Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3011B1C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:16:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCSX-0001Po-0x; Thu, 02 May 2019 14:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hMCSW-0001Pj-1q
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:13:12 +0000
X-Inumbo-ID: 60ca29e2-6ce4-11e9-8f1f-8773a26b89d8
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60ca29e2-6ce4-11e9-8f1f-8773a26b89d8;
 Thu, 02 May 2019 14:12:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89574815"
To: Jan Beulich <JBeulich@suse.com>
References: <1556803627-22855-1-git-send-email-andrew.cooper3@citrix.com>
 <5CCAF5BE020000780022B485@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <42eb12cb-9525-7c65-f574-25e57c6146e1@citrix.com>
Date: Thu, 2 May 2019 15:08:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCAF5BE020000780022B485@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Annotate the Real Mode entry
 points
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
Cc: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDUvMjAxOSAxNDo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDUuMTkg
YXQgMTU6MjcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L3Ry
YW1wb2xpbmUuUwo+PiBAQCAtMzgsNiArMzgsMTIgQEAKPj4gIAo+PiAgICAgICAgICAuY29kZTE2
Cj4+ICAKPj4gKy8qCj4+ICsgKiBkb19ib290X2NwdSgpIHByb2dyYW1zIHRoZSBTdGFydHVwLUlQ
SSB0byBwb2ludCBoZXJlLiAgRHVlIHRvIHRoZSBTSVBJCj4+ICsgKiBmb3JtYXQsIHRoZSByZWxv
Y2F0ZWQgZW50cnlwb2ludCBtdXN0IGJlIDRrIGFsaWduZWQuCj4+ICsgKgo+PiArICogSXQgaXMg
ZW50ZXJlZCBpbiBSZWFsIE1vZGUsIHdpdGggJWNzID0gd2FrZXVwX3N0YXJ0ID4+IDQgYW5kICVp
cCA9IDAuCj4+ICsgKi8KPj4gIEdMT0JBTCh0cmFtcG9saW5lX3JlYWxtb2RlX2VudHJ5KQo+IFRo
ZSByZWZlcmVuY2UgdG8gd2FrZXVwX3N0YXJ0IGxvb2tzIHRvIGJlIGEgY29weS1hbmQtcGFzdGUK
PiAob3IgYWxpa2UpIG1pc3Rha2UgaGVyZS4KCk9vcHMsIGluZGVlZC7CoCBGaXhlZC4KCj4KPj4g
LS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCj4+IEBAIC01NDgsOSArNTQ4LDEyIEBAIHN0YXRpYyBpbnQgZG9fYm9vdF9jcHUoaW50IGFw
aWNpZCwgaW50IGNwdSkKPj4gIAo+PiAgICAgIGJvb3RpbmdfY3B1ID0gY3B1Owo+PiAgCj4+IC0g
ICAgLyogc3RhcnRfZWlwIGhhZCBiZXR0ZXIgYmUgcGFnZS1hbGlnbmVkISAqLwo+PiAgICAgIHN0
YXJ0X2VpcCA9IHNldHVwX3RyYW1wb2xpbmUoKTsKPj4gIAo+PiArICAgIC8qIHN0YXJ0X2VpcCBu
ZWVkcyBiZSBwYWdlIGFsaWduZWQsIGFuZCBiZWxvdyB0aGUgMU0gYm91bmRhcnkuICovCj4+ICsg
ICAgaWYgKCBzdGFydF9laXAgJiB+MHhmZjAwMCApCj4+ICsgICAgICAgIHBhbmljKCJBUCB0cmFt
cG9saW5lICUjbHggbm90IHN1aXRhYmx5IHBvc2l0aW9uZWRcbiIsIHN0YXJ0X2VpcCk7Cj4gU2Vl
aW5nIHdoYXQgc2V0dXBfdHJhbXBvbGluZSgpIHJlYWxseSBkb2VzLCBJJ20gbm90Cj4gY29udmlu
Y2VkIGEgcGFuaWMoKSBpcyBvZiBtdWNoIHZhbHVlLiBUaGUgcGFnZS1hbGlnbm1lbnQKPiBzaG91
bGQgYmUgcG9zc2libGUgdG8gY2hlY2sgYXQgYnVpbGQgdGltZSwgYW5kIHRoZSBiZWxvdy0xTQo+
IHJlcXVpcmVtZW50IHNob3VsZCBiZSBndWFyYW50ZWVkIGJ5IHVzIGFsbG9jYXRpbmcgbG93Cj4g
bWVtb3J5IHNwYWNlIGluIHRoZSBmaXJzdCBwbGFjZS4KClNhZGx5IGl0IGNhbnQuCgpXZSBoYXZl
IGEgbnVtYmVyIG9mIGFsaWdubWVudCBpc3N1ZXMgKHdlbGwgLSBjb25mdXNpb25zIGF0IGxlYXN0
KSwgbW9zdApvYnZpb3VzbHkgdGhhdCB0cmFtcG9saW5lX3tzdGFydCxlbmR9IGluIHRoZSBsaW5r
ZWQgWGVuIGltYWdlIGhhcyBubwpwYXJ0aWN1bGFyIGFsaWdubWVudCwgYnV0IHRoZSByZWxvY2F0
ZWQgdHJhbXBvbGluZV9zdGFydCBoYXMgYSA0awpyZXF1aXJlbWVudCBhcyBhIGNvbnNlcXVlbmNl
IG9mIGl0cyBhbGlhcyB3aXRoIHRyYW1wb2xpbmVfcmVhbG1vZGVfZW50cnkuCgpBbGwgaXQgdGFr
ZXMgaXMgb25lIGVycm9yIGluIHRoZSAzMmJpdCBhc20gd2hpY2ggcmVsb2NhdGVzIHRoZQp0cmFt
cG9saW5lIGFuZCB0aGlzIGVuZHMgdXAgZXhwbG9kaW5nIGluIGEgd2F5IHdoaWNoIGNhbiBvbmx5
IGJlCmRldGVjdGVkIGF0IHJ1bnRpbWUuCgo+ICBOZXZlcnRoZWxlc3MgSSB3b24ndCBpbnNpc3Qs
Cj4gc28gd2l0aCB0aGUgZWFybGllciBjb21tZW50IGNvcnJlY3RlZAo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGFua3MsCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
