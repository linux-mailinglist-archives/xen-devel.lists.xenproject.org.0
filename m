Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED3FDF61
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:54:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc0Q-00009l-G8; Fri, 15 Nov 2019 13:51:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UCxP=ZH=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iVc0O-00009f-Sz
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:51:21 +0000
X-Inumbo-ID: 005664d4-07af-11ea-a26f-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 005664d4-07af-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VsDUoxBbmC8zDHfc7bVMm+kLPbnAkTW+eMVTIpAhTYA=; b=d6gK4PMGNVfkXHJ8Qixx0WWTeF
 2alGbFkdk3e6PwMakSXSwyY/w8zhjRWX06URKnSEl+wcYNot9Fp9WVQ+dJu6YMNiefVBfbdsp2clk
 vdAUoHnd/KKov7UEDM3AItVgVxQ5/XB+0EGiDuo3zgaPgfcnyHzb8ngVS9o+Ip2onC3M=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:28379
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iVc1B-0001Ct-Kp; Fri, 15 Nov 2019 14:52:09 +0100
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <cc10107e-ce08-44ee-1dc0-695020396b11@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <dc06f24a-0db3-ec91-7195-771752ca48e3@eikelenboom.it>
Date: Fri, 15 Nov 2019 14:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cc10107e-ce08-44ee-1dc0-695020396b11@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/6] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTEvMjAxOSAwNzowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAzMC4xMC4xOSAx
OTowNiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4g
dGhpcyBnaXQgYnJhbmNoOgo+PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9w
bGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmZpeC1ldl9xbXAtbXVsdGktY29ubmVjdC12
Mgo+Pgo+PiBIaSwKPj4KPj4gUUVNVSdzIFFNUCBzb2NrZXQgZG9lc24ndCBhbGxvdyBtdWx0aXBs
ZSBjb25jdXJyZW50IGNvbm5lY3Rpb24uIEFsc28sIGl0Cj4+IGxpc3RlbigpIG9uIHRoZSBzb2Nr
ZXQgd2l0aCBhIGBiYWNrbG9nJyBvZiBvbmx5IDEuIE9uIExpbnV4IGF0IGxlYXN0LCBvbmNlIHRo
YXQKPj4gYmFja2xvZyBpcyBmaWxsZWQgY29ubmVjdCgpIHdpbGwgcmV0dXJuIEVBR0FJTiBpZiB0
aGUgc29ja2V0IGZkIGlzCj4+IG5vbi1ibG9ja2luZy4gbGlieGwgbWF5IGF0dGVtcHQgbWFueSBj
b25jdXJyZW50IGNvbm5lY3QoKSBhdHRlbXB0IGlmIGZvcgo+PiBleGFtcGxlIGEgZ3Vlc3QgaXMg
c3RhcnRlZCB3aXRoIHNldmVyYWwgUENJIHBhc3N0aHJvdWdoIGRldmljZXMsIGFuZCBhCj4+IGNv
bm5lY3QoKSBmYWlsdXJlIGxlYWQgdG8gYSBmYWlsdXJlIHRvIHN0YXJ0IHRoZSBndWVzdC4KPj4K
Pj4gU2luY2Ugd2UgY2FuJ3QgY2hhbmdlIHRoZSBsaXN0ZW4oKSdzIGBiYWNrbG9nJyB0aGF0IFFF
TVUgdXNlLCB3ZSBuZWVkIG90aGVyCj4+IHdheXMgdG8gd29ya2Fyb3VuZCB0aGUgaXNzdWUuIFRo
aXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZSBhIGxvY2sgdG8gYWNxdWlyZQo+PiBiZWZvcmUgYXR0
ZW1wdGluZyB0byBjb25uZWN0KCkgdG8gdGhlIFFNUCBzb2NrZXQuIFNpbmNlIHRoZSBsb2NrIG1p
Z2h0IGJlIGhlbGQKPj4gZm9yIHRvIGxvbmcsIHRoZSBzZXJpZXMgYWxzbyBpbnRyb2R1Y2UgYSB3
YXkgdG8gY2FuY2VsIHRoZSBhY3F1aXNpdGlvbiBvZiB0aGUKPj4gbG9jaywgdGhpcyBtZWFucyBr
aWxsaW5nIHRoZSBwcm9jZXNzIHRoYXQgdHJpZXMgdG8gZ2V0IHRoZSBsb2NrLgo+Pgo+PiBTZWUg
dGhyZWFkWzFdIGZvciBkaXNjdXNzZWQgYWx0ZXJuYXRpdmUuCj4+IFsxXSBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE4MTUu
aHRtbAo+Pgo+PiBDaGVlcnMsCj4+Cj4+IEFudGhvbnkgUEVSQVJEICg2KToKPj4gICAgbGlieGw6
IEludHJvZHVjZSBsaWJ4bF9fZXZfY2hpbGRfa2lsbF9kZXJlZ2lzdGVyCj4+ICAgIGxpYnhsOiBN
b3ZlIGxpYnhsX19ldl9kZXZsb2NrIGRlY2xhcmF0aW9uCj4+ICAgIGxpYnhsOiBSZW5hbWUgZXZf
ZGV2bG9jayB0byBldl9zbG93bG9jawo+PiAgICBsaWJ4bDogSW50cm9kdWNlIGxpYnhsX19ldl9z
bG93bG9ja19kaXNwb3NlCj4+ICAgIGxpYnhsOiBsaWJ4bF9fZXZfcW1wX3NlbmQgbm93IHRha2Vz
IGFuIGVnYwo+PiAgICBsaWJ4bF9xbXA6IEhhdmUgYSBsb2NrIGZvciBRTVAgc29ja2V0IGFjY2Vz
cwo+Pgo+PiAgIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAgICAgfCAgMTYgKystLQo+PiAg
IHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgICAgfCAgIDggKy0KPj4gICB0b29scy9saWJ4
bC9saWJ4bF9kb21fc2F2ZS5jICAgIHwgICAyICstCj4+ICAgdG9vbHMvbGlieGwvbGlieGxfZG9t
X3N1c3BlbmQuYyB8ICAgMiArLQo+PiAgIHRvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jICAgICAg
fCAgMTggKystLS0KPj4gICB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jICAgICAgIHwgICA2ICst
Cj4+ICAgdG9vbHMvbGlieGwvbGlieGxfZm9yay5jICAgICAgICB8ICA0OCArKysrKysrKysrKysK
Pj4gICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jICAgIHwgIDQxICsrKysrKystLS0KPj4g
ICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgIHwgMTMwICsrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tCj4+ICAgdG9vbHMvbGlieGwvbGlieGxfcGNpLmMgICAgICAgICB8ICAg
OCArLQo+PiAgIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgICAgfCAxMTkgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0KPj4gICB0b29scy9saWJ4bC9saWJ4bF91c2IuYyAgICAgICAg
IHwgIDI4ICsrKystLS0KPj4gICAxMiBmaWxlcyBjaGFuZ2VkLCAzMDEgaW5zZXJ0aW9ucygrKSwg
MTI1IGRlbGV0aW9ucygtKQo+Pgo+IAo+IEZvciB0aGUgc2VyaWVzOgo+IAo+IFJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiAKPiBKdWVyZ2VuCgpI
aSBKdWVyZ2VuLAoKU2luY2UgYSBsb3QgbW9yZSByZWNlbnQgcGF0Y2hlcyBoYXZlIGJlZW4gY29t
bWl0dGVkLCBidXQgdGhlc2UgZG9uJ3Qgc2VlbSB0by4KSSB3YXMgd29uZGVyaW5nIGlmIHRoZXNl
IGZlbGwgdGhyb3VnaCB0aGUgY3JhY2tzLgoKLS0KU2FuZGVyCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
