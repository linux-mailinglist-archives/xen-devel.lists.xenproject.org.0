Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99D37556
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 15:36:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYsUt-0001j1-R0; Thu, 06 Jun 2019 13:32:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zGnk=UF=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hYsUs-0001iw-1B
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 13:32:02 +0000
X-Inumbo-ID: 753f39bc-885f-11e9-aae6-efe013448227
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 753f39bc-885f-11e9-aae6-efe013448227;
 Thu, 06 Jun 2019 13:31:58 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so3395074edt.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2019 06:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eMi06uwDDu1J6G56Bawktu1AJEOJZQ5hkrYHY4pRGZA=;
 b=WWrcEGHDYaTxO9Xayawm3PxurHvQ7/aZrkIZgkDhmmYnA2GmVOXHCLjIwP3tDwkN7a
 lieZFXXzYg8Ui+dd1EZRieesrOQtWn7GhBNxpbCEMTUK5irCYO8KyGnTaFR7Ct5233hL
 iAkpAY6jNd8hd1fGlBTNugYb0F54DzYSCvpVTJ0ltAAtMD4iHiftuovCseSCXP7oCY3a
 suuVfdm0xsev7y/KJwGCtNzZBxDgFEt/5jSdls5xhGS1KvbEVddCrLzFtOd52m0kZyGq
 gUgPh7FaFOs2/7A3vEFaaIpEY59sUCHEDZxLuUetmQWXUuKk8dHUw09fPLouTmTJifsz
 1/vA==
X-Gm-Message-State: APjAAAWciekKsT8NGfQ0nGdwOD6fJJTPLlzkZC9iFKRlyQE1MMa42P6t
 L25+N7bDHr7fSU6IqYMO9sk9H7q6eom/sBamTBA=
X-Google-Smtp-Source: APXvYqyhenysLaLoYIA2JmPUbuEe/Jg6G9PU4BREacSQWlqoQ4YKK4/FPo6pzSrV2kRaTJYpn9V8Y4F1G3QX6O3wkN0=
X-Received: by 2002:a05:6402:1436:: with SMTP id
 c22mr19003311edx.70.1559827917912; 
 Thu, 06 Jun 2019 06:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <5CF7D1F30200007800235943@prv1-mh.provo.novell.com>
In-Reply-To: <5CF7D1F30200007800235943@prv1-mh.provo.novell.com>
From: George Dunlap <George.Dunlap@eu.citrix.com>
Date: Thu, 6 Jun 2019 14:31:46 +0100
Message-ID: <CAFLBxZZ2=aZEJma0TvdO3DofnBe=P9dBGr8be7Gn93hCYiZyZA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] memory: don't depend on
 guest_handle_subrange_okay() implementation details
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCAzOjMwIFBNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBndWVzdF9oYW5kbGVfc3VicmFuZ2Vfb2theSgpIHRha2VzIGluY2x1
c2l2ZSBmaXJzdCBhbmQgbGFzdCBwYXJhbWV0ZXJzLAo+IGkuZS4gY2hlY2tzIHRoYXQgW2ZpcnN0
LCBsYXN0XSBpcyB2YWxpZC4gTWFueSBjYWxsZXJzLCBob3dldmVyLCBhY3R1YWxseQo+IG5lZWQg
dG8gc2VlIHdoZXRoZXIgW2ZpcnN0LCBsaW1pdCkgaXMgdmFsaWQgKGkuZS4sIGxpbWl0IGlzIG5v
bi0KPiBpbmNsdXNpdmUpLCBhbmQgdG8gZG8gdGhpcyB0aGV5IHN1YnRyYWN0IDEgZnJvbSB0aGUg
c2l6ZS4gVGhpcyBpcwo+IG5vcm1hbGx5IGNvcnJlY3QsIGV4Y2VwdCBpbiBjYXNlcyB3aGVyZSBm
aXJzdCA9PSBsaW1pdCwgaW4gd2hpY2ggY2FzZQo+IGd1ZXN0X2hhbmRsZV9zdWJyYW5nZV9va2F5
KCkgd2lsbCBiZSBwYXNzZWQgYSBzZWNvbmQgcGFyYW1ldGVyIGxlc3MgdGhhbgo+IGl0cyBmaXJz
dC4KPgo+IEFzIGl0IGhhcHBlbnMsIGR1ZSB0byB0aGUgd2F5IHRoZSBtYXRoIGlzIGltcGxlbWVu
dGVkIGluIHg4NidzCj4gZ3Vlc3RfaGFuZGxlX3N1YnJhbmdlX29rYXkoKSwgdGhlIHJldHVybiB2
YWx1ZSB0dXJucyBvdXQgdG8gYmUgY29ycmVjdDsKPiBidXQgd2Ugc2hvdWxkbuKAmXQgcmVseSBv
biB0aGlzIGJlaGF2aW9yLgo+Cj4gTWFrZSBzdXJlIGFsbCBjYWxsZXJzIGhhbmRsZSBmaXJzdCA9
PSBsaW1pdCBleHBsaWNpdGx5IGJlZm9yZSBjYWxsaW5nCj4gZ3Vlc3RfaGFuZGxlX3N1YnJhbmdl
X29rYXkoKS4KPgo+IE5vdGUgdGhhdCB0aGUgb3RoZXIgdXNlcyAoaW5jcmVhc2UtcmVzZXJ2YXRp
b24sIHBvcHVsYXRlLXBoeXNtYXAsIGFuZAo+IGRlY3JlYXNlLXJlc2VydmF0aW9uKSBhcmUgYWxy
ZWFkeSBmaW5lIGR1ZSB0byBhIHN1aXRhYmxlIGNoZWNrIGluCj4gZG9fbWVtb3J5X29wKCkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdl
ZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
