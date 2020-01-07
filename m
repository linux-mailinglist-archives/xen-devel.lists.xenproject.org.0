Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C500E1329BF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:14:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqWq-0007Cg-3A; Tue, 07 Jan 2020 15:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXEJ=24=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ioqWn-0007Cb-VA
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 15:12:17 +0000
X-Inumbo-ID: 1750d824-3160-11ea-ac34-12813bfff9fa
Received: from mail-wm1-f45.google.com (unknown [209.85.128.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1750d824-3160-11ea-ac34-12813bfff9fa;
 Tue, 07 Jan 2020 15:12:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id d73so19335669wmd.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 07:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DutudvM+g+adv7/rQAmvZtqvcm7f/oy+OHk4EWoQLps=;
 b=e79EaQNc5SI4zVa0wwAM0qsmdz5Qlx8Qa51yxbcYc3pAije8LLohEkIx1zoYmR4FHv
 8+RmVF6yd5IeHXuaKjtmc/wGo/yvurTnf94IM+WpsMqZVWQalKzfEYFenT9jj/iExcrY
 HSf6yJ8RLtVy5opBddsMvuJ5BJhNlahLIy2iQtqUS5WsILdKHW2iTj1M2vhcJ3v1ca6u
 YksnGGOjwJeeB+vrhJeOCh19clFC0nF2LOssn2p/KzlV7AU1XpzzK/Qty4REgY4OKTKc
 MLvO18JnNMrEPe/pSFyi7oR53v0f0fBUPxvHEyf1HTcjxzblvkUVWME12yrORWEEVqze
 o9zQ==
X-Gm-Message-State: APjAAAW/Z9sswd0Dau446eGsZlIznQlNrI6ZzGcpoPfE1fSlIjDyVjow
 9dpZ+t9CrerRyaAvDPEy2kc=
X-Google-Smtp-Source: APXvYqwjwAeSLDrZuLRrRenD5zLCTTidr598rXrtOk6oVfIWSHrAfxHtLDB0bJxqTWzx5cCWlgKN/w==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr39953180wmb.81.1578409936223; 
 Tue, 07 Jan 2020 07:12:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id c2sm150701wrp.46.2020.01.07.07.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 07:12:15 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org> <5E1453F5.50704@hisilicon.com>
 <94aa0896-b6cf-01b4-7bde-2a4870fa37ff@xen.org>
 <5E147FA8.1000401@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <79e63299-ce00-b417-5002-aff6d4f6bb2e@xen.org>
Date: Tue, 7 Jan 2020 15:12:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5E147FA8.1000401@hisilicon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, prime.zeng@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNy8wMS8yMDIwIDEyOjU1LCBXZWkgWHUgd3JvdGU6Cj4gSGkgSnVsaWVuLAo+PiBBcyBv
bmx5IG9uZSBlbnRpdHkgc2hvdWxkIG1hbmFnZSB0aGUgVUFSVCAoaS5lIFhlbiBvciBEb20wKSwg
d2UgdG9kYXkgCj4+IGFzc3VtZSB0aGlzIHdpbGwgYmUgbWFuYWdlZCBieSBYZW4uIFhlbiBzaG91
bGQgZXhwb3NlIGEgcGFydGlhbCAKPj4gdmlydHVhbCBVQVJUIChvbmx5IGEgZmV3IHJlZ2lzdGVy
cyBhcmUgZW11bGF0aW5nKSB0byBkb20wIGluIHJlcGxhY2VtZW50Lgo+Pgo+PiBUaGlzIGlzIHVz
dWFsbHkgZG9uZSBieSB0aGUgVUFSVCBkcml2ZXIuIExvb2tpbmcgYXQgdGhlIGxvZyB5b3UgcGFz
dGVkIAo+PiBpbiBhIHNlcGFyYXRlIGUtbWFpbDoKPj4KPj4gKFhFTikgUGxhdGZvcm06IEdlbmVy
aWMgU3lzdGVtCj4+IChYRU4pIFVuYWJsZSB0byBpbml0aWFsaXplIGFjcGkgdWFydDogLTkKPj4g
KFhFTikgQmFkIGNvbnNvbGU9IG9wdGlvbiAnZHR1YXJ0Jwo+Pgo+PiBTbyBYZW4gZGlkbid0IG1h
bmFnZSB0byBpbml0aWFsaXplIHRoZSB1YXJ0LiBUaGUgLTkgc3VnZ2VzdHMsIFhlbiAKPj4gZGlk
bid0IGZpbmQgYSBkcml2ZXIgZm9yIHlvdXIgVUFSVC4gQXQgdGhlIG1vbWVudCwgWGVuIGlzIG9u
bHkgYWJsZSB0byAKPj4gZGV0ZWN0IHBsMDExLCBzYnNhLCBzYnNhMzIgVUFSVCBmb3IgQUNQSS4g
V2hhdCBpcyB0aGUgdHlwZSBvZiB0aGUgVUFSVCAKPj4gdXNlZCBvbiB5b3VyIHBsYXRmb3JtPwo+
Pgo+IAo+IFRoYW5rcyEKPiBHb3QgaXQuCj4gT3VyIFVBUlQgaXMgODI1MC4KCllvdSB3b3VsZCBu
ZWVkIHRvIHRlYWNoIHRoZSA4MjUwIGRyaXZlciBob3cgdG8gaW5pdGlhbGl6ZSB0aGUgVUFSVCB3
aXRoIApBQ1BJLiBJdCBpcyBub3QgdmVyeSBkaWZmaWN1bHQgdG8gZG8gaXQsIGhhdmUgYSBsb29r
IGF0IHRoZSBwbDAxMSB2ZXJzaW9uLgoKPiAKPiBUaGFua3MhCj4gSXQgaXMgbm90IHdvcmtpbmcg
ZXZlbiBJIGNoYW5nZWQgdGhlIGNvbmRpdGlvbiB0byAiIGlmICggYWNwaV9kaXNhYmxlZCApICIu
CgpEb2gsIHRoYW5rIHlvdSBmb3Igc3BvdHRpbmcgdGhlIGV4dHJhICEuCgo+IE15IGdydWIgMi4w
NCBjb25maWd1cmF0aW9uIGlzIGFzIGJlbG93Ogo+IAo+ICDCoMKgwqAgeGVuX2h5cGVydmlzb3Ig
L3hlbiBkb20wX21lbT00RyBhY3BpPWZvcmNlIGxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbAo+
ICDCoMKgwqAgeGVuX21vZHVsZSAvSW1hZ2UgcmRpbml0PS9pbml0wqAgYWNwaT1mb3JjZSBub2lu
aXRyZCByb290PS9kZXYvc2RiMSBydwo+IAo+IFRoZSBsb2cgd2l0aCB0aGUgY29uZGl0aW9uICIg
aWYgKCBhY3BpX2Rpc2FibGVkICkgIiBpcyBhcyBmb2xsb3dpbmc6Cj4gCj4gIMKgwqDCoCAoWEVO
KSBBZGRpbmcgY3B1IDEyNiB0byBydW5xdWV1ZSAwCj4gIMKgwqDCoCAoWEVOKSBBZGRpbmcgY3B1
IDEyNyB0byBydW5xdWV1ZSAwCj4gIMKgwqDCoCAoWEVOKSBhbHRlcm5hdGl2ZXM6IFBhdGNoaW5n
IHdpdGggYWx0IHRhYmxlIDAwMDAwMDAwMDAyZDRmNDggLT4gCj4gMDAwMDAwMDAwMDJkNTc2NAo+
ICDCoMKgwqAgKFhFTikgKioqIExPQURJTkcgRE9NQUlOIDAgKioqCj4gIMKgwqDCoCAoWEVOKSBM
b2FkaW5nIGQwIGtlcm5lbCBmcm9tIGJvb3QgbW9kdWxlIEAgMDAwMDAwMDAxNjI1NzAwMAo+ICDC
oMKgwqAgKFhFTikgQWxsb2NhdGluZyAxOjEgbWFwcGluZ3MgdG90YWxsaW5nIDQwOTZNQiBmb3Ig
ZG9tMDoKPiAgwqDCoMKgIChYRU4pIEJBTktbMF0gMHgwMDAwMDAwODAwMDAwMC0weDAwMDAwMDEw
MDAwMDAwICgxMjhNQikKPiAgwqDCoMKgIChYRU4pIEJBTktbMV0gMHgwMDAwMDAyMDAwMDAwMC0w
eDAwMDAwMDM4MDAwMDAwICgzODRNQikKPiAgwqDCoMKgIChYRU4pIEJBTktbMl0gMHgwMDAwMDA1
MDAwMDAwMC0weDAwMDAwMDgwMDAwMDAwICg3NjhNQikKPiAgwqDCoMKgIChYRU4pIEJBTktbM10g
MHgwMDIwMjAwMDAwMDAwMC0weDAwMjAyMDgwMDAwMDAwICgyMDQ4TUIpCj4gIMKgwqDCoCAoWEVO
KSBCQU5LWzRdIDB4MDAyMDIwYjAwMDAwMDAtMHgwMDIwMjBjMDAwMDAwMCAoMjU2TUIpCj4gIMKg
wqDCoCAoWEVOKSBCQU5LWzVdIDB4MDAyMDI2MDAwMDAwMDAtMHgwMDIwMjYyMDAwMDAwMCAoNTEy
TUIpCj4gIMKgwqDCoCAoWEVOKSBHcmFudCB0YWJsZSByYW5nZTogMHgwMDAwMDAxODFjNzAwMC0w
eDAwMDAwMDE4MjA3MDAwCj4gIMKgwqDCoCAoWEVOKSBBbGxvY2F0aW5nIFBQSSAxNiBmb3IgZXZl
bnQgY2hhbm5lbCBpbnRlcnJ1cHQKPiAgwqDCoMKgIChYRU4pIExvYWRpbmcgekltYWdlIGZyb20g
MDAwMDAwMDAxNjI1NzAwMCB0byAKPiAwMDAwMDAwMDA4MDgwMDAwLTAwMDAwMDAwMDk5ODEyMDAK
PiAgwqDCoMKgIChYRU4pIExvYWRpbmcgZDAgRFRCIHRvIDB4MDAwMDAwMDAwZmUwMDAwMC0weDAw
MDAwMDAwMGZlMDAyNWIKPiAgwqDCoMKgIChYRU4pIEluaXRpYWwgbG93IG1lbW9yeSB2aXJxIHRo
cmVzaG9sZCBzZXQgYXQgMHg0MDAwIHBhZ2VzLgo+ICDCoMKgwqAgKFhFTikgU2NydWJiaW5nIEZy
ZWUgUkFNIGluIGJhY2tncm91bmQKPiAgwqDCoMKgIChYRU4pIFN0ZC4gTG9nbGV2ZWw6IEFsbAo+
ICDCoMKgwqAgKFhFTikgR3Vlc3QgTG9nbGV2ZWw6IEFsbAo+ICDCoMKgwqAgKFhFTikgKioqIFNl
cmlhbCBpbnB1dCB0byBET00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCAK
PiBpbnB1dCkKPiAgwqDCoMKgIChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHg2Cj4g
IMKgwqDCoCAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEgMHgxMCBvbiBDUFUwIHZpYSBUVEJS
IDB4MDAwMDAwMDAxODJmZjAwMAo+ICDCoMKgwqAgKFhFTikgMFRIWzB4MF0gPSAweDAwMDAwMDAw
MTgzMDJmN2YKPiAgwqDCoMKgIChYRU4pIDFTVFsweDBdID0gMHgwMDAwMDAwMDE4MzAwZjdmCj4g
IMKgwqDCoCAoWEVOKSAyTkRbMHgwXSA9IDB4MDAwMDAwMDAwMDAwMDAwMAo+ICDCoMKgwqAgKFhF
TikgQ1BVMDogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0Cj4gIMKgwqDCoCAoWEVOKSAtLS0t
WyBYZW4tNC4xMy4wLXJjwqAgYXJtNjTCoCBkZWJ1Zz15wqDCoCBOb3QgdGFpbnRlZCBdLS0tLQo+
ICDCoMKgwqAgKFhFTikgQ1BVOsKgwqDCoCAwCj4gIMKgwqDCoCAoWEVOKSBQQzrCoMKgwqDCoCAw
MDAwMDAwMDAwMmI2NWM4IDAwMDAwMDAwMDAyYjY1YzgKCkNhbiB5b3UgbG9vayB3aXRoIGFkZHIy
bGluZSB3aGF0IHRoaXMgUEMgcmVmZXJzIHRvPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
