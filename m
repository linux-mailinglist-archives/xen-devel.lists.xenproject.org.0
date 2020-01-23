Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F2146D44
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuefn-0001rm-9d; Thu, 23 Jan 2020 15:45:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuefl-0001re-Kt
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:45:33 +0000
X-Inumbo-ID: 6399ee84-3df7-11ea-be6e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6399ee84-3df7-11ea-be6e-12813bfff9fa;
 Thu, 23 Jan 2020 15:45:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3FC7B1DD;
 Thu, 23 Jan 2020 15:45:31 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-6-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e72f37cf-63cb-9c10-00e2-96f946208265@suse.com>
Date: Thu, 23 Jan 2020 16:45:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122202343.5703-6-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 5/7] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwo+IEBAIC0yNyw3ICsyNywxMCBAQAo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVy
di10bGZzLmg+Cj4gICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gIAo+ICsjaW5jbHVkZSAi
cHJpdmF0ZS5oIgo+ICsKPiAgc3RydWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNf
aHlwZXJ2Owo+ICtERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3BjcHVfaW5w
dXRfYXJnKTsKCldvdWxkIGl0IHBlcmhhcHMgYmUgaGVscGZ1bCB0byBtYWtlIHJlY29nbml6YWJs
ZSB0aGF0IHRoaXMgY2FuIGhvbGQKdXAgdG8gYSBwYWdlJ3Mgd29ydGggb2YgZGF0YSwgZWl0aGVy
IGJ5IGl0cyB0eXBlIG9yIGJ5IGEgc2xpZ2h0bHkKZGlmZmVyZW50IG5hbWU/Cgo+IEBAIC0xMTks
MTQgKzEyMiwzNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9p
ZCkKPiAgICAgIH0KPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVf
YXJnKHZvaWQpCj4gK3sKPiArICAgIHZvaWQgKm1hcHBpbmc7Cj4gKwo+ICsgICAgaWYgKCB0aGlz
X2NwdShodl9wY3B1X2lucHV0X2FyZykgKQo+ICsgICAgICAgIHJldHVybjsKPiArCj4gKyAgICBt
YXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4gKyAgICBpZiAoICFtYXBwaW5nICkKPiAr
ICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIGh5cGVyY2FsbCBpbnB1dCBwYWdlIGZv
ciBDUFUldVxuIiwKPiArICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwoKcGFuaWMo
KSBpcyBsaWtlbHkgZmluZSBmb3IgdGhlIEJTUCwgYnV0IEkgZG9uJ3QgdGhpbmsgYW55IEFQIHNo
b3VsZApiZSBhYmxlIHRvIGJyaW5nIGRvd24gdGhlIHN5c3RlbSBiZWNhdXNlIG9mIG1lbW9yeSBz
aG9ydGFnZS4gU3VjaAphbiBBUCBzaG91bGQgc2ltcGx5IG5vdCBjb21lIG9ubGluZS4gKEV2ZW4g
Zm9yIHRoZSBCU1AgdGhlIHF1ZXN0aW9uCmlzIHdoZXRoZXIgWGVuIHdvdWxkIGJlIGFibGUgdG8g
cnVuIGRlc3BpdGUgZmFpbHVyZSBoZXJlLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
