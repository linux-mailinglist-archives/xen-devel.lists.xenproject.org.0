Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA313DFC1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:16:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7m7-0001IG-DV; Thu, 16 Jan 2020 16:13:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOjP=3F=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1is7m6-0001IB-BH
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:13:38 +0000
X-Inumbo-ID: 250fec58-387b-11ea-8773-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 250fec58-387b-11ea-8773-12813bfff9fa;
 Thu, 16 Jan 2020 16:13:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579191215; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=RQKGuZWPRbYH4R2Xb2baaoEVxerCV0F9GA5q1vfy+Pg=;
 b=o1SFtNDU+tWvwGk/TOTX9r1HWK/AN+cD9AisG0xnSGZKmlDdPB3LWO+E0PEpDcnputukPdDM
 9Vp18z8mIhbpnsA2QDmOCeij0YxlJchpIIEgMyTyZ6rkclMeo+dhIkATO30M+7S9WWt8Kmxu
 G70iagfBOADrebRvhSdFL7lKtzU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5e208ba9.7f1499c23930-smtp-out-n02;
 Thu, 16 Jan 2020 16:13:29 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q10so19740241wrm.11
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:13:28 -0800 (PST)
X-Gm-Message-State: APjAAAV1h1WKK/1GusYVKmKLe8tjkU8dln5RjzdOJ3qsY4KvC6Ymy+WF
 QbD4Nr5q7tmtsBJ3ABHEFa7S4ERN0okNYM+EqNc=
X-Google-Smtp-Source: APXvYqwnyE8bCwPlU9BfB+83vbtZAitjkBBE38rJFDAP0BjZ93vCl/1CB3/JVqzg6Vk1rzq665m2vhQTHoYz4Fqn+Iw=
X-Received: by 2002:a5d:5381:: with SMTP id d1mr3817448wrv.259.1579191207575; 
 Thu, 16 Jan 2020 08:13:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <631aece1177fcd2326855f0ff4b53dadfcfc3680.1578503483.git.tamas.lengyel@intel.com>
 <1ea9f58b-5f86-7450-d0e3-d17252b94b20@suse.com>
In-Reply-To: <1ea9f58b-5f86-7450-d0e3-d17252b94b20@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Jan 2020 09:12:51 -0700
X-Gmail-Original-Message-ID: <CABfawhnxpuYsmidRtXY+o0B5Woj8OsbbsahHtWnsrqQk_1vOdw@mail.gmail.com>
Message-ID: <CABfawhnxpuYsmidRtXY+o0B5Woj8OsbbsahHtWnsrqQk_1vOdw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 11/18] x86/mem_sharing: ASSERT that
 p2m_set_entry succeeds
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgOTowNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGlu
dGVsLmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNDIg
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMKPiA+IGluZGV4IDkzZTc2MDU5MDAuLjNmMzZjZDZiYmMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9z
aGFyaW5nLmMKPiA+IEBAIC0xMTE3LDExICsxMTE3LDE5IEBAIGludCBhZGRfdG9fcGh5c21hcChz
dHJ1Y3QgZG9tYWluICpzZCwgdW5zaWduZWQgbG9uZyBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4g
PiAgICAgICAgICBnb3RvIGVycl91bmxvY2s7Cj4gPiAgICAgIH0KPiA+Cj4gPiArICAgIC8qCj4g
PiArICAgICAqIE11c3Qgc3VjY2VlZCwgd2UganVzdCByZWFkIHRoZSBlbnRyeSBhbmQgaG9sZCB0
aGUgcDJtIGxvY2sKPiA+ICsgICAgICogdmlhIGdldF90d29fZ2Zucy4KPiA+ICsgICAgICovCj4g
PiAgICAgIHJldCA9IHAybV9zZXRfZW50cnkocDJtLCBfZ2ZuKGNnZm4pLCBzbWZuLCBQQUdFX09S
REVSXzRLLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fc2hhcmVkLCBhKTsK
PiA+ICsgICAgQVNTRVJUKCFyZXQpOwo+Cj4gQW5kIHRoZXJlJ3Mgbm8gcmlzayBvZiAtRU5PTUVN
IGJlY2F1c2Ugb2YgbmVlZGluZyB0byBzcGxpdCBhCj4gbGFyZ2VyIG9yZGVyIHBhZ2U/IEF0IHRo
ZSB2ZXJ5IGxlYXN0IHRoZSByZWFzb25pbmcgaW4gdGhlCj4gY29tbWVudCB3b3VsZCBuZWVkIGZ1
cnRoZXIgZXh0ZW5kaW5nLgo+CgpObyBiZWNhdXNlIHdlIGFyZSBwbHVnZ2luZyBhIGhvbGUgaW4g
dGhlIGRvbWFpbi4gVGhlcmUgaXMgbm8gbGFyZ2VyCnBhZ2UgbWFwcGVkIGluIGhlcmUgdGhhdCB3
b3VsZCBuZWVkIHRvIGJlIGJyb2tlbiB1cC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
