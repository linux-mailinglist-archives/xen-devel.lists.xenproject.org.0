Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF49FFF49
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 08:05:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWb4A-0005Er-Mh; Mon, 18 Nov 2019 07:03:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EeMw=ZK=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iWb48-0005Em-AA
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 07:03:16 +0000
X-Inumbo-ID: 7dc04574-09d1-11ea-adbe-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dc04574-09d1-11ea-adbe-bc764e2007e4;
 Mon, 18 Nov 2019 07:03:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b17so17428252wmj.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 Nov 2019 23:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CNxtfTMrWlyr7R1pWer2EoJ/texGiSQDb04Uz14AAYg=;
 b=YkGDKuCrcIkfxZYoCaahiwSRsPoL7YzRzq/i1KyURkoXqJXJcrwiHR3jmgaqsDzpRC
 PdsISjYgNAxJweU9+9RACMiduX9MU00Fp5U6K2s+SALg+YVp8+Uuw1rKPx+/NsFHSmqL
 MyBerl5DKzPskeQzfY154OI5wjI/3OL6BbZgd8Vfd+bcHKAH7J7EInOv1vER6ol1+YxS
 ycO8XMihFyZOKF5gQw0+VJT2PUQygVrOiBT/6pdzdp/iBI8ke7y5TcesG4sx62UWoLb7
 8IJqR+cchP4S/Vv2OCVjyc27NjYnd3i22yzuSBl4VzMtuyDjIDY31tMt4rJdt3ZbnEnF
 t3wQ==
X-Gm-Message-State: APjAAAU65UrE+ASzO2BjFk5CXu6yB8H0zUWZvPuowJnxF2ypaeWC3NoO
 I0g6DA098Zi/Ap4QsWEADew=
X-Google-Smtp-Source: APXvYqy3Mk2y8v1/w2F/KW7a7ZFQvCXEUA5RwVnykcpa5/JvCovcDdT9JPjPbW0X5GGwcsyvVrKDag==
X-Received: by 2002:a1c:2d4b:: with SMTP id t72mr29381138wmt.112.1574060594675; 
 Sun, 17 Nov 2019 23:03:14 -0800 (PST)
Received: from [192.168.1.155]
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id s9sm18294548wmj.22.2019.11.17.23.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Nov 2019 23:03:13 -0800 (PST)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-6-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111303040.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0OreBvHN9gdfBcQCG7qORo-XpReXz7MyTPEnguCTDYiQ@mail.gmail.com>
 <b8d7fcab-0751-b3a6-e196-b8e0c98050d4@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <110fe033-5b65-0d3a-6c71-1f919f342d37@xen.org>
Date: Mon, 18 Nov 2019 07:03:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b8d7fcab-0751-b3a6-e196-b8e0c98050d4@gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC 5/7] WIP:arm64:armds: Build XEN with ARM
 Compiler 6.6
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMTQvMTEvMjAxOSAxMTozMSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAxMy4xMS4xOSAwNzo1MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUbyBiZSBob25l
c3QsIEkgZG9uJ3QgdGhpbmsgdGhpcyBmaWxlIHNob3VsZCBldmVuIGV4aXN0LiBUaGlzIGxvb2tz
IAo+PiBsaWtlIGEgY29weSBvZiB4ZW4ubGRzLlMgd2l0aCBhIGRpZmZlcmVudCBzeW50YXguCj4g
Cj4gQW5kIGxhY2tpbmcgZmVhdHVyZXMgbGlrZSBzeW1ib2xzIGRlZmluaXRpb24sIGN1cnJlbnQg
YWRkcmVzcyBzZXR1cCwgZXRjLgoKVGhhdCdzIGZpbmUsIHlvdSBjYW4gaW50cm9kdWNlIG1hY3Jv
IHRoYXQgd2lsbCBqdXN0IGJlIGEgTk9QIGZvciAKYXJtbGlua2VyIGFuZCBpbXBsZW1lbnRlZCBm
b3IgbGQuCgo+IAo+PiBGdXJ0aGVybW9yZSwgdGhlIGNvbW1lbnRzIGZyb20gU3RlZmFubyBzaG93
cyB0aGF0IGlzIGdvaW5nIHRvIGJlIGhhcmQgCj4+IHRvIG1haW50YWluL2NoZWNrIGV2ZXJ5dGhp
bmcgaGFzIGJlZW4gd3JpdHRlbiBjb3JyZWN0bHkuCj4gCj4gSXQgd2lsbCBiZSB0ZXJyaWJseSBo
YXJkLgo+IAo+PiBTbyBob3cgYWJvdXQgdHJ5aW5nIHRvIGFic3RyYWN0IHhlbi5sZHMuUz8KPiAK
PiBJIGZhaWxlZCB0byBmaW5kIHRoZSBjb21tb24gZ3JvdW5kIGZvciB0aGVtLgo+IFlvdSBhcmUg
dmVyeSB3ZWxjb21lZCB0byBzdWdnZXN0IHRoYXQgcGllY2Ugb2YgY29kZS4KCkkgZG9uJ3QgaGF2
ZSB0aW1lIHRvIHdvcmsgb24gdGhlIGZ1bGwgZmVhdHVyZSwgYnV0IEkgY2FuIHByb3ZpZGUgYSBm
ZXcgCmlkZWFzIHNvIHlvdSBjYW4gaW1wbGVtZW50IGl0LgoKSWYgd2UgbG9vayBhdCB0aGUgLnRl
eHQgc2VjdGlvbi4gRm9yIHRoZSBHTlUgbGlua2VyIHNjcmlwdCwgaXQgaXM6CgogICBfc3RhcnQg
PSAuOwogICAudGV4dCA6IHsKICAgICAgICAgX3N0ZXh0ID0gLjsgICAgICAgICAgICAvKiBUZXh0
IHNlY3Rpb24gKi8KICAgICAgICAqKC50ZXh0KQogICAgICAgICooLnRleHQuY29sZCkKICAgICAg
ICAqKC50ZXh0LnVubGlrZWx5KQogICAgICAgICooLmZpeHVwKQogICAgICAgICooLmdudS53YXJu
aW5nKQogICAgICAgIF9ldGV4dCA9IC47ICAgICAgICAgICAgIC8qIEVuZCBvZiB0ZXh0IHNlY3Rp
b24gKi8KICAgfSA6dGV4dCA9IDB4OTA5MAoKRm9yIGFybWRzLCB5b3UgaW1wbGVtZW50IGFzCgo7
X3N0YXJ0Cjtfc3RleHQKICAgX3RleHQgQWxpZ25FeHByKCswLCBQQUdFX1NJWkUpIFBBRFZBTFVF
IDB4OTA5MAogICB7CiAgICAgKigudGV4dCopCiAgICAgKigudGV4dC5jb2xkKQogICAgICooLnRl
eHQudW5saWtlbHkpCiAgICAgKiguZml4dXApCiAgICAgKiguZ251Lndhcm5pbmcpCiAgIH0KO19l
dGV4dAoKWW91IGNvdWxkIGltYWdpbmUgdGhlIGZvbGxvd2luZyBhYnN0cmFjdGlvbjoKClNZTUJP
TChfc3RhcnQpClNFQ1RJT04oX3RleHQpCiAgIFNZTUJPTChfc3RleHQpCiAgICooLnRleHQpCiAg
ICooLnRleHQuY29sZCkKICAgKigudGV4dC51bmxpa2VseSkKICAgKiguZml4dXApCiAgICooLmdu
dS53YXJuaW5nKQogICBTWU1CT0woX2V0ZXh0KQpFU0VDVElPTih0ZXh0KQoKRm9yIEdOVSBsaW5r
ZXIgc2NyaXB0cywgdGhlIG1hY3JvcyB3b3VsZCBiZSBpbXBsZW1lbnRlZCBhcwoKI2RlZmluZSBT
WU1CT0woc3ltKSBzeW0gOj0gLjsKI2RlZmluZSBTRUNUSU9OKHNlY3QpIHNlY3QgOiB7CiNkZWZp
bmUgRVNFQ1RJT04ocGhkcikgfSA6cGhkciA9IDB4OTA5MAoKCkZvciB0aGUgQXJtIHNjYXR0ZXIg
ZmlsZSwgdGhlIG1hY3JvcyB3b3VsZCBiZSBpbXBsZW1lbnRlZCBhcwoKLyogU3ltYm9scyBhcmUg
bm90IGRlY2xhcmVkIGluIHRoZSBzY2F0dGVyIGZpbGUgKi8KI2RlZmluZSBTWU1CT0woc3ltKSA7
c3ltCiNkZWZpbmUgU0VDVElPTihzZWN0KSBzZWN0IEFsaWduRXhwcigrMCwgUEFHRV9TSVpFKSBQ
QURWQUxVRSAweDkwOTAgewojZGVmaW5lIEVTRUNUSU9OKHBoZHIpIH0KCkEgZmV3IGNhdmVhdHM6
CiAgICAtIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2h5IHdlIHNwZWNpZmljIHRoZSBwYWRpbmcg
dmFsdWUgb25seSBmb3IgCi50ZXh0IGFuZCBub3QgdGhlIG90aGVyLiBJIGFsc28gZG9uJ3QgdW5k
ZXJzdGFuZCB0aGUgMHg5MDkwIHZhbHVlLiAKU3RlZmFubz8gSXQgbWF5IGJlIHBvc3NpYmxlIHRv
IHJlbW92ZSB0aGlzIGNvbXBsZXRlbHkuCiAgICAtIFRoZSBhbGlnbm1lbnQgY291bGQgYmUgcGFz
c2VkIGFzIGEgcGFyYW1ldGVyIGZvciB0aGUgbWFjcm8KICAgIC0gVGhlIGxpbmtlciBzY3JpcHQg
bWF5IG5lZWQgc29tZSByZXNodWZmbGUgaW4gb3JkZXIgdG8gbWFrZSBpdCBnZW5lcmljLgoKT24g
YSBzaWRlIG5vdGUsIEkgbm90aWNlZCB0aGF0IHlvdSBhcmUgdXNpbmcgKigudGV4dCopLCByYXRo
ZXIgdGhhbiAKKigudGV4dCkuIENvdWxkIHlvdSBleHBsYWluIHdoeT8KCj4gCj4gCj4+IMKgwqDC
oMKgID4gKy8qCj4+IMKgwqDCoMKgID4gKyAqIGFybWxpbmsgZG9lcyBub3QgdW5kZXJzdGFuZCBz
aGlmdHMgaW4gc2NhdCBmaWxlIGV4cHJlc3Npb25zCj4+IMKgwqDCoMKgID4gKyAqIHNvIGhhcmRj
b2RlIG5lZWRlZCB2YWx1ZXMKPj4gwqDCoMKgwqAgPiArICovCj4+Cj4+Cj4+IFBsZWFzZSBnaXZl
IGEgcG9pbnRlciB0byB0aGUgZG9jIG9mIHRoZSBhcm1saW5rIGluIHRoZSBjb21taXQgbWVzc2Fn
ZS4gCj4+IFNvIHdlIGNhbiBlYXNpbHkgY3Jvc3MtY2hlY2sgd2hhdCdzIGhhcHBlbmluZy4KPiAK
PiBUaGUgYmVzdCBjcm9zcy1jaGVjayB3b3VsZCBiZSBydW5uaW5nIHRoZSBjb21waWxlci4gWWV0
LCB0aGlzIHBhcnRpY3VsYXIgCj4gdGhpbmcgaXMgc29tZWhvdyBkb2N1bWVudGVkIFsxXS4KPiAK
Pj4gSW4gdGhpcyBjYXNlLCBJIGRvbid0IHBhcnRpY3VsYXJseSBsaWtlIHRoZSByZS1kZWZpbml0
aW9uIG9mIHRoZSAKPj4gZGVmaW5lcyBvdXRzaWRlIG9mIHRoZWlyIGhlYWRlci4gVGhpcyBpcyBn
b2luZyB0byBtYWtlIG1vcmUgZGlmZmljdWx0IAo+PiBpZiB3ZSBoYXZlIHRvIHVwZGF0ZSB0aGVt
IGluIHRoZSBmdXR1cmUuCj4+Cj4+IEkgY2FuIHNlZSBhIGZldyB3YXlzIHRvIGRvIGl0Ogo+Pgo+
PiDCoMKgLSBBdm9pZCB1c2luZyBzaGlmdHMgaW4gdGhlIGRlZmluaXRpb25zCj4+IMKgwqAtIEZp
bmQgYSB3YXkgdG8gZXZhbHVhdGUgdGhlIHZhbHVlIChtYXliZSBzaW1pbGFyIHRvIGFzbi1vZmZz
ZXQpIAo+PiBiZWZvcmUgdXNpbmcgdGhlbS4KPj4KPj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0
aGUgbGF0dGVyIGJ1dCBJIGNvdWxkIGJlIGNvbnZpbmNlZCBmb3IgdGhlIAo+PiBmb3JtZXIuCj4g
Cj4gVGhlIGZpcnN0IG9wdGlvbiBpcyBub3QgcmVhbGlzdGljLiBJIHN1Z2dlc3RlZCBBUk0gdG8g
Y29uc2lkZXIgc2hpZnRzIAo+IHN1cHBvcnQgYXMgYW4gaW1wcm92ZW1lbnQgZm9yIHRoZWlyIGNv
bXBpbGVyLgo+IEknZCBiZSB2ZXJ5IGhhcHB5IHRvIGFkb3B0IHRoZSBzZWNvbmQgb3B0aW9uLiBE
byB5b3UgaGF2ZSBhbnkgY29kZSAKPiBleGFtcGxlcyBvciBoaW50cyBob3cgdG8gZXZhbHVhdGUg
ZXhwcmVzc2lvbnMgb24gdGhlIHByZS1wcm9jZXNzaW5nIHN0YWdlPwpJIHdhc24ndCB0aGlua2lu
ZyB0byBkbyBpdCBhIHByZS1wcm9jZXNzaW5nIHN0YXRlIGJ1dCByYXRoZXIgZ2VuZXJhdGluZyAK
YW4gaGVhZGVyIHRoYXQgd2lsbCBoYXZlIHRoZSB2YWx1ZSBhbHJlYWR5IGNvbXB1dGVkLgoKSGF2
ZSBhIGxvb2sgYXQgaG93IHdlIGdlbmVyYXRlIGRlZmluaW5pdGlvbiBmb3IgYXNzZW1ibHkgKHNl
ZSAKYXJjaC9hcm0zMi9hc20tb2Zmc2V0cy5jKS4KCkxvb2tpbmcgYXQgdGhlIGxpbmsgeW91IHBy
b3ZpZGVkLCBJIG5vdGljZWQgdGhhdCAqIGlzIHN1cHBvcnRlZCBieSB0aGUgCnNjYXR0ZXIgZmls
ZS4gU28gaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gaW50cm9kdWNlIGEgbWFjcm8gTFNISUZUKGEs
IGIpIAp0aGF0IHdpbGwgYmUgaW1wbGVtZW50ZWQgYXMgYSA8PCBiIG9yIChhICogYSAqIGEgLi4u
KSBkZXBlbmRpbmcgb24gdGhlIAp1c2Vycy4gVGhlIG1ham9yIGRpZmZpY3VsdHkgaGVyZSB3b3Vs
ZCBiZSB0byBmaW5kIGEgd2F5IHRvIGdlbmVyYXRlIGEgKiAKYSAqIGEuLi4gbmljZWx5IGR1cmlu
ZyBwcmUtcHJvY2Vzc2luZy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
