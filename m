Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1402E186F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 12:59:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNEIP-000342-U6; Wed, 23 Oct 2019 10:55:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sGrY=YQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNEIO-00033w-RQ
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 10:55:16 +0000
X-Inumbo-ID: 985bbe8e-f583-11e9-8aca-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 985bbe8e-f583-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 10:55:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a11so5470522wra.6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 03:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dYuVykpCZUUsW1Ybxeq6xSSquUEAUtpErtKAU54MkNA=;
 b=WES0GYwd7sHOaVHz3+1wLud1FeUoogKI4fSccTF3dqOIWUO7eNB6BEMij7/UxTdoXu
 8bsl5GIPGr6pGgzsYTRRmmjJRGN6WSZihfe3v1/m8C0/vgHJ4F9DqMKk2XkGvU86v9/C
 jXljnpiNol4C6n4XXI22V66RoLINvzQI64lFoOkgBuEoGQoE9mFGWzmxaOK5hSr1jxDI
 VAcIPmzVzLYb9X5SUd8HM69T9ixAOU27GkdZRfr9NbtmuVhQT+4vrcpxBxuvuhgfAD1v
 gV8H5kNDUGb85ljlOiGZp7NMfNftT/QuY1QIz62MfEnU3XuU9igyzwtwznoIp4yjYJl4
 mxkA==
X-Gm-Message-State: APjAAAVCOGSOhBXx2q+Gt3UAzLa6ApocahzUjN+bjILsaUgxWr8aeHaP
 hEHC4vZu8axACcc4kfAitks=
X-Google-Smtp-Source: APXvYqwPAd3uJonsR+cUnH1JQ3c63KKSTZkNbtkw9j09CgVElKyDzOZjduCGsArw8GrAiZ2ylzojOQ==
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr5145620wra.48.1571828115394;
 Wed, 23 Oct 2019 03:55:15 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id d2sm12669714wmd.2.2019.10.23.03.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 03:55:14 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:55:13 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191023105513.5vli2q4khpbf3gdx@debian>
References: <20191023085739.43585-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023085739.43585-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/tsc: update vcpu time info on
 guest TSC adjustments
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6NTc6MzlBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IElmIGEgSFZNL1BWSCBndWVzdCB3cml0ZXMgdG8gTVNSX0lBMzJfVFNDe19BREpV
U1R9IGFuZCB0aHVzIGNoYW5nZXMKPiB0aGUgdmFsdWUgb2YgdGhlIHRpbWUgc3RhbXAgY291bnRl
ciB0aGUgdmNwdSB0aW1lIGluZm8gbXVzdCBhbHNvIGJlCj4gdXBkYXRlZCwgb3IgdGhlIHRpbWUg
Y2FsY3VsYXRlZCBieSB0aGUgZ3Vlc3QgdXNpbmcgdGhlIFhlbiBQViBjbG9jawo+IGludGVyZmFj
ZSB3aWxsIGJlIHNrZXdlZC4KPiAKPiBVcGRhdGUgdGhlIHZjcHUgdGltZSBpbmZvIHdoZW4gdGhl
IGd1ZXN0IHdyaXRlcyB0byBlaXRoZXIgTVNSX0lBMzJfVFNDCj4gb3IgTVNSX0lBMzJfVFNDX0FE
SlVTVC4gVGhpcyBmaXhlcyBsb2NrdXBzIHNlZW4gd2hlbiBydW5uaW5nIHRoZQo+IHB2LXNoaW0g
b24gQU1EIGhhcmR3YXJlLCBzaW5jZSB0aGUgc2hpbSB3aWxsIGFnZ3Jlc3NpdmVseSB0cnkgdG8g
a2VlcAo+IFRTQ3MgaW4gc3luYyBieSBwZXJpb2RpY2FsbHkgd3JpdGluZyB0byBNU1JfSUEzMl9U
U0MgaWYgdGhlIFRTQyBpcyBub3QKPiByZWxpYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSsO8cmdlbiBH
cm/DnyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jIHwg
NCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBpbmRl
eCA5YWNkMzU5Yzk5Li5lNGMwNDI1MzMwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gQEAgLTQ0Miw2ICs0NDIsOCBA
QCBzdGF0aWMgdm9pZCBodm1fc2V0X2d1ZXN0X3RzY19tc3Ioc3RydWN0IHZjcHUgKnYsIHU2NCBn
dWVzdF90c2MpCj4gIAo+ICAgICAgaHZtX3NldF9ndWVzdF90c2ModiwgZ3Vlc3RfdHNjKTsKPiAg
ICAgIHYtPmFyY2guaHZtLm1zcl90c2NfYWRqdXN0ICs9IHYtPmFyY2guaHZtLmNhY2hlX3RzY19v
ZmZzZXQgLSB0c2Nfb2Zmc2V0Owo+ICsgICAgaWYgKCB2ID09IGN1cnJlbnQgKQo+ICsgICAgICAg
IHVwZGF0ZV92Y3B1X3N5c3RlbV90aW1lKHYpOwoKV2h5IG5vdCBnZXQgcmlkIG9mIHRoZSB0ZXN0
IGFuZCBhbHdheXMgY2FsbCB1cGRhdGVfdmNwdV9zeXN0ZW1fdGltZSh2KT8KCldlaS4KCj4gIH0K
PiAgCj4gIHN0YXRpYyB2b2lkIGh2bV9zZXRfZ3Vlc3RfdHNjX2FkanVzdChzdHJ1Y3QgdmNwdSAq
diwgdTY0IHRzY19hZGp1c3QpCj4gQEAgLTQ0OSw2ICs0NTEsOCBAQCBzdGF0aWMgdm9pZCBodm1f
c2V0X2d1ZXN0X3RzY19hZGp1c3Qoc3RydWN0IHZjcHUgKnYsIHU2NCB0c2NfYWRqdXN0KQo+ICAg
ICAgdi0+YXJjaC5odm0uY2FjaGVfdHNjX29mZnNldCArPSB0c2NfYWRqdXN0IC0gdi0+YXJjaC5o
dm0ubXNyX3RzY19hZGp1c3Q7Cj4gICAgICBodm1fc2V0X3RzY19vZmZzZXQodiwgdi0+YXJjaC5o
dm0uY2FjaGVfdHNjX29mZnNldCwgMCk7Cj4gICAgICB2LT5hcmNoLmh2bS5tc3JfdHNjX2FkanVz
dCA9IHRzY19hZGp1c3Q7Cj4gKyAgICBpZiAoIHYgPT0gY3VycmVudCApCj4gKyAgICAgICAgdXBk
YXRlX3ZjcHVfc3lzdGVtX3RpbWUodik7Cj4gIH0KPiAgCj4gIHU2NCBodm1fZ2V0X2d1ZXN0X3Rz
Y19maXhlZChzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3QgYXRfdHNjKQo+IC0tIAo+IDIuMjMuMAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
