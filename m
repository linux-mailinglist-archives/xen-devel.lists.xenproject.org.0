Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7E108F6
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 16:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLq5c-0002RW-Qu; Wed, 01 May 2019 14:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WEFG=TB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hLq5b-0002Jz-Dt
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 14:20:03 +0000
X-Inumbo-ID: 34467d8a-6c1c-11e9-af59-979ba7eb2bf7
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34467d8a-6c1c-11e9-af59-979ba7eb2bf7;
 Wed, 01 May 2019 14:20:01 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EE6803011FC3; Wed,  1 May 2019 17:19:59 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.181.74])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A8D7C306E4AC;
 Wed,  1 May 2019 17:19:59 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
Date: Wed, 1 May 2019 17:19:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow
 value
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xLzE5IDQ6NTggUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IEl0IG1pZ2h0IGJl
IHdvcnRoIGludHJvZHVjaW5nIGEgInN5bmMgc3RhdGUgZnJvbSBodyIgaG9vayB3aGljaCBjb2xs
ZWN0cwo+Pj4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRvIHRoZSBpbnRyb3NwZWN0
aW9uIGFnZW50Lgo+Pgo+PiBZb3UgbWVhbiBhZGRpbmcgYW5vdGhlciBodm0gaG9vaz8KPiAKPiBB
Y3R1YWxseSwgaW5zdGVhZCBvZiBhbm90aGVyIGhvb2sgSSB0aGluayB3aGF0IHdvdWxkIG1ha2Ug
c2Vuc2UgaXQgdG8KPiBqdXN0IHVwZGF0ZSB2bXhfc2F2ZV92bWNzX2N0eHQgdG8gYXV0b21hdGlj
YWxseSByZWZyZXNoIHRoZSBjYWNoZWQKPiByZWdpc3RlciB2YWx1ZXMgd2hlbiBpdCdzIGNhbGxl
ZCB3aXRoICJ2ID09IGN1cnJlbnQiLiBUaG91Z2h0cz8KClRoYXQncyBwcm9iYWJseSB0aGUgYmV0
dGVyIHdheSB0byBnbyBhYm91dCBpdCwgc2luY2Ugb3RoZXJ3aXNlIHRoZQp4Y19odm1fZ2V0Y29u
dGV4dF9wYXJ0aWFsKCkgaHlwZXJjYWxsIHdpbGwgc3VmZmVyIGZyb20gdGhlIHNhbWUgcHJvYmxl
bS4KKHRoZXJlIGFyZSB0d28gd2F5cyBvZiBnZXR0aW5nIGd1ZXN0IHN0YXRlOiBvbmUgaXMgdmlh
IHRoZSB2bV9ldmVudApjYWNoZWQgdmFsdWVzLCB0aGUgb3RoZXIgaXMgdmlhIHRoZSBhZm9yZW1l
bnRpb25lZCBoeXBlcmNhbGwpLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
