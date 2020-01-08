Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B592B1341CC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:34:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAVD-0003R0-0w; Wed, 08 Jan 2020 12:31:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipAVA-0003QX-Uk
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:31:56 +0000
X-Inumbo-ID: d748691e-3212-11ea-b7d9-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d748691e-3212-11ea-b7d9-12813bfff9fa;
 Wed, 08 Jan 2020 12:31:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so3162935wrw.8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 04:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sRlckOhMYcJqtZ4uaWm9FxsVj63QIK9xqpALmybQyGg=;
 b=i+vCcHVALgJx/nlKCYS5LaLPveJ7lumnDVXiVoJ7wXjQO5UyGQHX6XzX3Hi54QgG2Q
 9/ubM1av/xUvf+OU7Ft8qHQv7TnkbBBixDEXgejlNSxOZXO14JenTyPZB3Hsji06hM/7
 pGrOOFo7NcX/VYUuKftQi4TuB0LtYcSX3083y/bQqhhgjbqaKzbWKEi3aEio1upss8n8
 jrNwLUB/RyOVwdiDO1RLdaQk6TdXL1alVljAUg6vlimaWuxf9OfNjAXhTIkRFoWATwMW
 r/ruCzuUbQ9hcn71D/clmfB2fN6QWVzAYT1R4VNQfTvasNxrCTY5xukCbE0KSBLeJdUL
 rINQ==
X-Gm-Message-State: APjAAAUefIGXqwL5KPjMD+EFBCFDHYAiB3eQD8D1T3jGbhRg0mTEnlMI
 SNn1ApU6J4IJWF3aMuR6B7w=
X-Google-Smtp-Source: APXvYqx39WprH2feLwIAvsvAlDGUmNzcjCz0kmGF5kblgD61/jsmHDuwGf0XU/x82538tHGEOEqkgQ==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr4413101wru.119.1578486708726; 
 Wed, 08 Jan 2020 04:31:48 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id a1sm4037341wrr.80.2020.01.08.04.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 04:31:48 -0800 (PST)
Date: Wed, 8 Jan 2020 12:31:46 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200108123146.2deeog565ie3n4my@debian>
References: <20200107173902.13768-1-liuwe@microsoft.com>
 <20200107173902.13768-2-liuwe@microsoft.com>
 <5405f981-d7b4-11ce-38a5-fc221454d99a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5405f981-d7b4-11ce-38a5-fc221454d99a@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/2] x86/hyperv: drop usage of GENMASK_ULL
 from hyperv-tlfs.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDE6MjY6MjBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMDEuMjAyMCAxODozOSwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCj4gPiBAQCAtNDE1LDEzICs0MTUsMTMgQEAgZW51
bSBIVl9HRU5FUklDX1NFVF9GT1JNQVQgewo+ID4gIAlIVl9HRU5FUklDX1NFVF9BTEwsCj4gPiAg
fTsKPiA+ICAKPiA+IC0jZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVNVTFRfTUFTSwlHRU5NQVNLX1VM
TCgxNSwgMCkKPiA+ICsjZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVNVTFRfTUFTSwkweGZmZmYgLyog
R0VOTUFTS19VTEwoMTUsIDApICovCj4gPiAgI2RlZmluZSBIVl9IWVBFUkNBTExfRkFTVF9CSVQJ
CUJJVCgxNiwgVUwpCj4gPiAgI2RlZmluZSBIVl9IWVBFUkNBTExfVkFSSEVBRF9PRkZTRVQJMTcK
PiA+ICAjZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVBfQ09NUF9PRkZTRVQJMzIKPiA+IC0jZGVmaW5l
IEhWX0hZUEVSQ0FMTF9SRVBfQ09NUF9NQVNLCUdFTk1BU0tfVUxMKDQzLCAzMikKPiA+ICsjZGVm
aW5lIEhWX0hZUEVSQ0FMTF9SRVBfQ09NUF9NQVNLCTB4ZmZmMDAwMDAwMDAgLyogR0VOTUFTS19V
TEwoNDMsIDMyKSAqLwo+ID4gICNkZWZpbmUgSFZfSFlQRVJDQUxMX1JFUF9TVEFSVF9PRkZTRVQJ
NDgKPiA+IC0jZGVmaW5lIEhWX0hZUEVSQ0FMTF9SRVBfU1RBUlRfTUFTSwlHRU5NQVNLX1VMTCg1
OSwgNDgpCj4gPiArI2RlZmluZSBIVl9IWVBFUkNBTExfUkVQX1NUQVJUX01BU0sJMHhmZmYwMDAw
MDAwMDAwMDAgLyogR0VOTUFTS19VTEwoNTksIDQ4KSAqLwo+IAo+IFRoZSBsYXN0IHR3byBzaG91
bGQgZ2FpbiBVTEwgKG9yIGF0IGxlYXN0IFVMKSBzdWZmaXhlcy4gSSBhbHNvCj4gd29uZGVyIHdo
ZXRoZXIgYm90aCB3b3VsZG4ndCBiZXR0ZXIgYmUgZXhwcmVzc2VkIGFzICgweGZmZlVMTCA8PCBO
KS4KPiBXaXRoIGF0IGxlYXN0IHRoZSBzdWZmaXhlcyBhZGRlZAoKVGhhbmtzLiBJIHdpbGwgZml4
IHRob3NlIHVwLgoKVXNpbmcgKDB4ZmZmZlVMTCA8PCBOKSB3b3JrcyBmb3IgbWUgdG9vLiBMZXQn
cyBzZWUgd2hhdCBmb3JtIFBhdWwKcHJlZmVycy4KCldlaS4KCj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
