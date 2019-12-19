Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85605126568
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 16:06:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihxKq-0000yc-Bs; Thu, 19 Dec 2019 15:03:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yrdy=2J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihxKo-0000yN-5I
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 15:03:26 +0000
X-Inumbo-ID: a75db883-2270-11ea-91ee-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a75db883-2270-11ea-91ee-12813bfff9fa;
 Thu, 19 Dec 2019 15:03:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id j17so5176391edp.3;
 Thu, 19 Dec 2019 07:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eHI0iwd13nlsti/7aC4qVHyc9ywZTHzaPT5YWWOEWiw=;
 b=aaL89OBl/RxiE5kj3Q3xlK7zUxRLfbGQTd5v7R7qAD4PXkyB6+/LLZ9ugog7NTL/EQ
 HdmEjUeS7uQKe+cx8vPiKaev5P7ZT5JxYWJovda1QpDiaNMTaizsmmh10CUOYx+hXG+x
 URTR2ULDpAXdIoeq3jHHVeR/I4GbszP8mThXZ9dkoGNRyL+Bf5sjXiB/OfOU2HmDMybg
 fBl9HlrFeVE1qBSOWr0A03XbtoP/2YRMA2149+TUCHttdCRuU9ncNsyI8NSJ3upm4eaA
 Kr9ZDeqpD6cByi0ILlO4rkQuoHjfn1GFXKHYkkvj08+U+hNFTfSW/ntOnrMxo4Aw3QKi
 BdJA==
X-Gm-Message-State: APjAAAUonT22MVKnZYCRv409KbAAT75Z6ITjO94hzdOLTPxVRPKYtUdt
 s0me2jHxM8usmxydp6BLtn4=
X-Google-Smtp-Source: APXvYqwMtHY75VyMtanjrQ+I0UxHMSHfybK+EujzkSzdSEJY/wXsNLV5bj9xXRvplD4WCDMIsT5PUQ==
X-Received: by 2002:a50:9f65:: with SMTP id b92mr9611433edf.275.1576767782851; 
 Thu, 19 Dec 2019 07:03:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id m23sm521971ejd.21.2019.12.19.07.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 07:03:02 -0800 (PST)
To: Lars Kurth <lars.kurth@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
 <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e7d096c0-74b7-3427-8853-3273e46d0274@xen.org>
Date: Thu, 19 Dec 2019 15:03:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE4LzEyLzIwMTkgMTc6MDksIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g
77u/T24gMTgvMTIvMjAxOSwgMTQ6MjksICJKdWxpZW4gR3JhbGwiIDxqdWxpZW5AeGVuLm9yZz4g
d3JvdGU6Cj4gCj4gICAgICBIaSBMYXJzLAo+ICAgICAgCj4gICAgICBPbiAxMi8xMi8yMDE5IDIx
OjE0LCBMYXJzIEt1cnRoIHdyb3RlOgo+ICAgICAgPiArIyMjIFdvcmtmbG93IGZyb20gYW4gQXV0
aG9yJ3MgUGVyc3BlY3RpdmUKPiAgICAgID4gKwo+ICAgICAgPiArV2hlbiBjb2RlIGF1dGhvcnMg
cmVjZWl2ZSBmZWVkYmFjayBvbiB0aGVpciBwYXRjaGVzLCB0aGV5IHR5cGljYWxseSBmaXJzdCB0
cnkKPiAgICAgID4gK3RvIGNsYXJpZnkgZmVlZGJhY2sgdGhleSBkbyBub3QgdW5kZXJzdGFuZC4g
Rm9yIHNtYWxsZXIgcGF0Y2hlcyBvciBwYXRjaCBzZXJpZXMKPiAgICAgID4gK2l0IG1ha2VzIHNl
bnNlIHRvIHdhaXQgdW50aWwgcmVjZWl2aW5nIGZlZWRiYWNrIG9uIHRoZSBlbnRpcmUgc2VyaWVz
IGJlZm9yZQo+ICAgICAgPiArc2VuZGluZyBvdXQgYSBuZXcgdmVyc2lvbiBhZGRyZXNzaW5nIHRo
ZSBjaGFuZ2VzLiBGb3IgbGFyZ2VyIHNlcmllcywgaXQgbWF5Cj4gICAgICA+ICttYWtlIHNlbnNl
IHRvIHNlbmQgb3V0IGEgbmV3IHJldmlzaW9uIGVhcmxpZXIuCj4gICAgICA+ICsKPiAgICAgID4g
K0FzIGEgcmV2aWV3ZXIsIHlvdSBuZWVkIHNvbWUgc3lzdGVtIHRoYXQgaGU7cHMgZW5zdXJlIHRo
YXQgeW91IGFkZHJlc3MgYWxsCj4gICAgICAKPiAgICAgIEp1c3QgYSBzbWFsbCB0eXBvOiBJIHRo
aW5rIHlvdSBtZWFudCAiaGVscHMiIHJhdGhlciB0aGFuICJoZTtwcyIuCj4gICAgICAKPiAgICAg
IENoZWVycywKPiAgICAgIAo+IFRoYW5rIHlvdTogZml4ZWQgaW4gbXkgd29ya2luZyBjb3B5Lgo+
IAo+IE9uZSB0aGluZyB3aGljaCBvY2N1cnJlZCB0byBtZSBmb3IgcmV2aWV3cyBsaWtlIHRoZXNl
LCB3aGVyZSB0aGVyZSBpcyBubyBBQ0sncyBvciBSZXZpZXdlZC1ieSdzIGlzIHRoYXQgSSBkb24n
dCBhY3R1YWxseSBrbm93IHdoZXRoZXIgeW91IGFzIHJldmlld2VyIGlzIG90aGVyd2lzZSBoYXBw
eSB3aXRoIHRoZSByZW1haW5kZXIgb2YgcGF0Y2guCj4gTm9ybWFsbHkgdGhlIEFDS2VkLWJ5IG9y
IFJldmlld2VkLWJ5IGlzIGEgc2lnbmFsIHRoYXQgaXQgaXMKPiAgPiBJIGFtIGFzc3VtaW5nIGl0
IGlzLCBidXQgSSB0aGluayBpdCBtYXkgYmUgd29ydGh3aGlsZSBwb2ludGluZyB0aGlzIApvdXQg
aW4gdGhlIGRvY3VtZW50LCB0aGF0IHVubGVzcyBzdGF0ZWQgb3RoZXJ3aXNlLCB0aGUgcmV2aWV3
ZXIgaXMgaGFwcHkgCndpdGggdGhlIHBhdGNoCkkgZG9uJ3QgdGhpbmsgeW91IGNhbiBhbHdheXMg
YXNzdW1lIHRoaXMuIFRoZXJlIGFyZSBjYXNlIHdoZXJlIEkgZG9uJ3QgCmdpdmUgYSByZXZpZXdl
ZC1ieSB5ZXQgYmVjYXVzZSBJIHdhbnQgdG8gdW5kZXJzdGFuZCB0aGUgZm9sbG93LXVwIApwYXRj
aGVzIGZpcnN0LgoKSSB0aGluayB3aGF0IElhbiBkZXNjcmliZWQgY29ycmVzcG9uZCB0aGUgYmVz
dCB0byBteSB2aWV3IGhlcmUuIEFuZCBJIAphZ3JlZSB0aGF0IHdlIHByb2JhYmx5IHdhbnQgdG8g
YmUgbW9yZSBleHBsaWNpdCBpbiB0aGUgcmV2aWV3IHRvIGF2b2lkIApjb25mdXNpb24uCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
