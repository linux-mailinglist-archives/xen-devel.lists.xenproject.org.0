Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9442075E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFsQ-00037u-3Y; Thu, 16 May 2019 12:52:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRFsO-00037K-DZ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:52:48 +0000
X-Inumbo-ID: 80918dc4-77d9-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80918dc4-77d9-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:52:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D0BDAF68;
 Thu, 16 May 2019 12:52:45 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-37-jgross@suse.com> <5CDD57DB020000780022FA5E@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3cbc2ca3-2aaf-d5ed-ab8b-0334485eb4f7@suse.com>
Date: Thu, 16 May 2019 14:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD57DB020000780022FA5E@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 36/45] x86: make loading of GDT at
 context switch more modular
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
ZG9tYWluLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IEBAIC0xNjE5LDYgKzE2
MTksMzcgQEAgc3RhdGljIGlubGluZSBib29sIG5lZWRfZnVsbF9nZHQoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkKPj4gICAgICByZXR1cm4gaXNfcHZfZG9tYWluKGQpICYmICFpc19pZGxlX2RvbWFp
bihkKTsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX2Z1bGxfZ2R0X3B0
ZXMoc2VnX2Rlc2NfdCAqZ2R0LCBzdHJ1Y3QgdmNwdSAqdikKPj4gK3sKPj4gKyAgICB1bnNpZ25l
ZCBsb25nIG1mbiA9IHZpcnRfdG9fbWZuKGdkdCk7Cj4+ICsgICAgbDFfcGdlbnRyeV90ICpwbDFl
ID0gcHZfZ2R0X3B0ZXModik7Cj4+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4+ICsKPj4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IE5SX1JFU0VSVkVEX0dEVF9QQUdFUzsgaSsrICkKPj4gKyAgICAgICAg
bDFlX3dyaXRlKHBsMWUgKyBGSVJTVF9SRVNFUlZFRF9HRFRfUEFHRSArIGksCj4+ICsgICAgICAg
ICAgICAgICAgICBsMWVfZnJvbV9wZm4obWZuICsgaSwgX19QQUdFX0hZUEVSVklTT1JfUlcpKTsK
Pj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSB2b2lkIGxvYWRfZnVsbF9nZHQoc3RydWN0IHZj
cHUgKnYsIHVuc2lnbmVkIGludCBjcHUpCj4+ICt7Cj4+ICsgICAgc3RydWN0IGRlc2NfcHRyIGdk
dF9kZXNjOwo+PiArCj4+ICsgICAgZ2R0X2Rlc2MubGltaXQgPSBMQVNUX1JFU0VSVkVEX0dEVF9C
WVRFOwo+PiArICAgIGdkdF9kZXNjLmJhc2UgPSBHRFRfVklSVF9TVEFSVCh2KTsKPiAKPiBNYWtl
IHRoaXMgYW5kIC4uLgo+IAo+PiArICAgIGxnZHQoJmdkdF9kZXNjKTsKPj4gK30KPj4gKwo+PiAr
c3RhdGljIGlubGluZSB2b2lkIGxvYWRfZGVmYXVsdF9nZHQoc2VnX2Rlc2NfdCAqZ2R0LCB1bnNp
Z25lZCBpbnQgY3B1KQo+PiArewo+PiArICAgIHN0cnVjdCBkZXNjX3B0ciBnZHRfZGVzYzsKPj4g
Kwo+PiArICAgIGdkdF9kZXNjLmxpbWl0ID0gTEFTVF9SRVNFUlZFRF9HRFRfQllURTsKPj4gKyAg
ICBnZHRfZGVzYy5iYXNlICA9ICh1bnNpZ25lZCBsb25nKShnZHQgLSBGSVJTVF9SRVNFUlZFRF9H
RFRfRU5UUlkpOwo+IAo+IC4uLiB0aGUgdmFyaWFibGVzJyBpbml0aWFsaXplcnM/IFdpdGggdGhp
cyBhbmQgd2l0aCBjb25zdCBzdWl0YWJseQo+IGFwcGxpZWQgdG8gYWxsIGZ1bmN0aW9uIHBhcmFt
ZXRlcnMgd2hlcmUgdGhpcyBpcyBwb3NzaWJsZQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpUaGFua3MsIHdpbGwgZG8uCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
