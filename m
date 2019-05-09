Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8051942F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 23:14:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOqJb-0006GJ-K1; Thu, 09 May 2019 21:10:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IWQu=TJ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hOqJZ-0006GE-Ln
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 21:10:53 +0000
X-Inumbo-ID: ec1ea7ec-729e-11e9-8836-b7c2b81fa7e0
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec1ea7ec-729e-11e9-8836-b7c2b81fa7e0;
 Thu, 09 May 2019 21:10:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 740A63031ED5; Fri, 10 May 2019 00:10:49 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.176.211])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 46E17306E477;
 Fri, 10 May 2019 00:10:49 +0300 (EEST)
To: Mathieu Tarral <mathieu.tarral@protonmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
Date: Fri, 10 May 2019 00:10:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS85LzE5IDExOjU3IFBNLCBNYXRoaWV1IFRhcnJhbCB3cm90ZToKPiBIaSwKPiAKPiBmb2xs
b3dpbmcgYSBwcmV2aW91cyBjb252ZXJzYXRpb24sIGkgd291bGQgbGlrZSB0byBjYXRjaCBNT1Yt
VE8tRFJ4IFZNSSBldmVudHMgdG8gcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSBkaXNhYmxpbmcgbXkg
aGFyZHdhcmUgYnJlYWtwb2ludHMuCj4gCj4gQFRhbWFzIHBvaW50ZWQgbWUgdG8gdGhpcyBoZWFk
ZXI6Cj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9
eGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50Lmg7aD1iMmJhZmMwZDc3Zjk3NThlNDJiMGQ1M2Mw
NWE3ZTZiYjg2Yzg2Njg2O2hiPUhFQUQjbDE1NAo+IAo+IEFuZCwgYXMgZmFyIGFzIEkgY2FuIHRl
bGwsIEkgaGF2ZSB0bwo+IC0gYWRkIGEgbmV3IFJFQVNPTgo+ICNkZWZpbmUgVk1fRVZFTlRfUkVB
U09OX1dSSVRFX0RFQlVHUkVHICAgICAgMTUKPiAKPiAtIGFkZCBhIG5ldyBzdHJ1Y3QKPiBzdHJ1
Y3Qgdm1fZXZlbnRfd3JpdGVfZGVidWdyZWcgewo+ICAgICB1aW50MzJfdCBpbmRleDsKPiAgICAg
dWludDMyX3QgX3BhZDsKPiAgICAgdWludDY0X3QgbmV3X3ZhbHVlOwo+ICAgICB1aW50NjRfdCBv
bGRfdmFsdWU7Cj4gfTsKPiAKPiAtIGluc2VydCBpdCBpbnRvIHRoZSB2bV9ldmVudF9zdCB1bmlv
bgo+IAo+IENhbiB5b3UgZ2l2ZSBtZSBtb3JlIHBvaW50ZXIgYW5kIGd1aWRhbmNlIGhvdyB0byBp
bXBsZW1lbnQgdGhpcyBpbnRvIFhlbiA/CgpZb3UgcHJvYmFibHkgd2FudCB0byBjaGFuZ2UgdGhl
IHdyaXRlX2RlYnVncmVnKCkgbWFjcm8gaW50byBhIGZ1bmN0aW9uCnRoYXQgZG9lcyB3aGF0J3Mg
Y3VycmVudGx5IGJlaW5nIGRvbmUgKyBzZW5kIG91dCB0aGUgdm1fZXZlbnQuIFlvdSBhbHNvCnBy
b2JhYmx5IG5lZWQgdG8gdGhpbmsgYWJvdXQgd2hldGhlciB5b3Ugd2FudCB0aGUgd3JpdGUgdG8g
YmUKcHJlZW1wdGFibGUgb3Igbm90IChJJ20gZ3Vlc3NpbmcgeW91IGRvbid0LCBpbiB3aGljaCBj
YXNlIGl0J3MgYWxsIHNpbXBsZXIpLgoKPiBJIGhhdmUgbmV2ZXIgc3VibWl0dGVkIGEgcGF0Y2gs
IG5vciBsb29rZWQgaW50byBYZW4gc291cmNlIGNvZGUuCgpodHRwczovL3dpa2kueGVucHJvamVj
dC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMKCj4gU2hvdWxkIHdlIGNy
ZWF0ZSBhIHNpbmdsZSBldmVudCBmb3IgTU9WLVRPLVJFR3ggVk1JIGV2ZW50cyA/Cj4gSXQgd291
bGQgdm9pZCBjb3B5IHBhc3RpbmcgYW5kIGR1cGxpY2F0aW5nIGNvZGUuCgpJIGRvbid0IHVuZGVy
c3RhbmQgdGhpcyBxdWVzdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
