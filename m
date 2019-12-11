Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFBD11A9BD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:18:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iezxM-0007st-Uo; Wed, 11 Dec 2019 11:15:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r5Tp=2B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iezxM-0007sk-9c
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:15:00 +0000
X-Inumbo-ID: 780941ba-1c07-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 780941ba-1c07-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 11:14:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so6607465wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 03:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ktCczsVyL5ku5kq481NV2YaIOOC7NQOQXQEN/B8uF3A=;
 b=iMo8Km+iXn0OiGKoOPb1XQy4vLYMn7z8x59nbDTZw5z47JdXZ5E8vKUQppXvJzoyO+
 oaya5eax1YIuxPHNFGPkfq54LTe+bCWBoCN9qZUeEMN6OLcQ50JQSuodOjrmVnIRSwja
 53RCZtqPtg1zf99GHMr0GVSPypgn1nvpv1PZgXLCeK4FonBQegt+XoUBIvluL1eQbWx8
 K1YvOd/mXRVWP7Gm4w8EVRmAzuquFa/VHRthcsb0ZbwxC9EmhU345n1rp2jt8yFYO3+v
 cUsxi1Q8oJ3C59zyFrA8d0kbh8qIbB4KexmaeA5vRWkaaMR3s+7vLVh71XTcjRUTb4U8
 RhwQ==
X-Gm-Message-State: APjAAAWLdDx+uu7skQ8xtMhkGbRUVTsfw1oW2llGYQ6d9uv5VYTw9KgJ
 ++4a44/gvGiFlrCogH3i/ps=
X-Google-Smtp-Source: APXvYqyV8yn3pDQKUR8CiDgL2TvVjPY1Ht4TlwdGJtmBBhawd35soCbZgWu9rdMVOma85sLPKVvEEA==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr3097876wmh.21.1576062898832; 
 Wed, 11 Dec 2019 03:14:58 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id a16sm1835560wrt.37.2019.12.11.03.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 03:14:58 -0800 (PST)
Date: Wed, 11 Dec 2019 11:14:56 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191211111456.6jfbvp3llw6y43dp@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-2-liuwe@microsoft.com>
 <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
 <cbb42ea2e12a4731873ae74ed0668a3c@EX13D32EUC003.ant.amazon.com>
 <66f2460e-8cb5-1866-32f1-6538092cb866@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66f2460e-8cb5-1866-32f1-6538092cb866@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
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
 "Durrant, Paul" <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDQ6NDM6MzBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMTIuMjAxOSAxNjozNywgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJv
dW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4KPiA+PiBCZXVsaWNo
Cj4gPj4gU2VudDogMTAgRGVjZW1iZXIgMjAxOSAxNTozNAo+ID4+IFRvOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgo+ID4+IENjOiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgUGF1bCBEdXJy
YW50IDxwYXVsQHhlbi5vcmc+OyBBbmRyZXcKPiA+PiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleQo+ID4+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
WGVuIERldmVsb3BtZW50IExpc3QgPHhlbi0KPiA+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLW5leHQgMS83XSB4ODY6IGltcG9ydCBoeXBlcnYt
dGxmcy5oCj4gPj4gZnJvbSBMaW51eAo+ID4+Cj4gPj4gT24gMjUuMTAuMjAxOSAxMToxNiwgV2Vp
IExpdSB3cm90ZToKPiA+Pj4gVGFrZW4gZnJvbSBMaW51eCBjb21taXQgYjJkOGIxNjdlMTViYjVl
YzI2OTFkMTExOWMwMjU2MzBhMjQ3ZjY0OS4KPiA+Pj4KPiA+Pj4gVGhpcyBpcyBhIHByaXN0aW5l
IGNvcHkgZnJvbSBMaW51eC4gSXQgaXMgbm90IHVzZWQgeWV0IGFuZCBwcm9iYWJseQo+ID4+PiBk
b2Vzbid0IGNvbXBpbGUuIENoYW5nZXMgdG8gbWFrZSBpdCB3b3JrIHdpbGwgY29tZSBsYXRlci4K
PiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4K
PiA+Pgo+ID4+IFRoaXMgY29taW5nIGZyb20gTGludXggYW5kIGFzc3VtaW5nIGF0IGxlYXN0IGEg
ZmFpciBwYXJ0IG9mIGl0IGlzCj4gPj4gZ29pbmcgdG8gYmUgdXNlZCwgaW4gcHJpbmNpcGxlCj4g
Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Pgo+ID4+IEhv
d2V2ZXIsIHRoZXJlIGFyZSBtYW55IHNlZW1pbmdseSB1bm5lY2Vzc2FyeSB1c2VzIG9mIF9fcGFj
a2VkCj4gPj4gaGVyZSwgd2hpY2ggSSdkIHJhdGhlciBub3Qgc2VlIGdvIGluIGF0IGFsbCAoaS5l
LiBub3QgYmUgZHJvcHBlZAo+ID4+IGxhdGVyIG9uLCBhbmQgdGhlbiBwb3RlbnRpYWxseSBtaXNz
aW5nIHNvbWUpLiBJIGZpbmQgLi4uCj4gPj4KPiA+Pj4gK3R5cGVkZWYgc3RydWN0IF9IVl9SRUZF
UkVOQ0VfVFNDX1BBR0Ugewo+ID4+PiArCV9fdTMyIHRzY19zZXF1ZW5jZTsKPiA+Pj4gKwlfX3Uz
MiByZXMxOwo+ID4+PiArCV9fdTY0IHRzY19zY2FsZTsKPiA+Pj4gKwlfX3M2NCB0c2Nfb2Zmc2V0
Owo+ID4+PiArfSAgX19wYWNrZWQgSFZfUkVGRVJFTkNFX1RTQ19QQUdFLCAqUEhWX1JFRkVSRU5D
RV9UU0NfUEFHRTsKPiA+Pgo+ID4gCj4gPiBZb3UgcmVhbGlzZSB0aGVyZSdzIGEgZGVmaW5pdGlv
biBvZiB0aGlzIGluIHRoZSB2aXJpZGlhbiBjb2RlIGFscmVhZHksIHJpZ2h0Pwo+IAo+IEl0IGxv
b2tlZCBmYW1pbGlhciwgYnV0IGl0IGRpZG4ndCBvY2N1ciB0byBtZSB0byBwb2ludCB0aGlzIG91
dC4KPiBZZXMsIHRoZXJlIGxvb2tzIHRvIGJlIHJvb20gZm9yIGRlZHVwbGljYXRpb24uLi4KPiAK
CkkgaGFkIGEgcGxhbiB0byBtYWtlIHZpcmlkaWFuIGNvZGUgdXNlIHRoaXMgY29weSBkaXJlY3Rs
eS4KCgo+IEFjdHVhbGx5LCBXZWksIG9uZSBtb3JlIHRoaW5nIEkgd2FzIGN1cmlvdXMgYWJvdXQg
LSB3aGF0IGlzICJ0bGZzIgo+IGFuIGFjcm9ueW0gb2Y/CgpJdCBtZWFucyAiVG9wLUxldmVsIEZ1
bmN0aW9uIFNwZWNpZmljYXRpb24iLgoKKEkgd2lzaCBYZW4gaGFkIHNvbWV0aGluZyBzaW1pbGFy
KQoKV2VpLgoKPiAKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
