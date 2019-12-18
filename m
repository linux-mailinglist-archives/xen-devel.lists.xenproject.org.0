Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31ED1248BD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:51:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZfq-0006tp-8M; Wed, 18 Dec 2019 13:47:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihZfo-0006tj-I5
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:47:32 +0000
X-Inumbo-ID: effee478-219c-11ea-907d-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id effee478-219c-11ea-907d-12813bfff9fa;
 Wed, 18 Dec 2019 13:47:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so2379155wru.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 05:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v9axkc95iuDYixAbEzxzzwYTJaudiSMRC+IUIlIdAkk=;
 b=MqbBDuUtC4PxlcZk6nG6tk032wBXI9pP/lxT9ZG2g6CaPeBpna2LTby8tNgq4Bp2IA
 AUEKx55AuSwRxmtESPkvr2vzZ68oEy6+bfruyMyksDPI1FpKXZtocOmlB2xjzD6kH1Tr
 3tTWNhqfctKNqGZxsCV3hTHE5jqT9r0qv9KM6a8gHHxK9Kz/l/GlRJNust6US7Lno4Wr
 cWEWDIXxgX+ALCGulIaIDYo1ZFDkCElGIn8Dz0HPZoIfPPzhoTU+CGCb9J+A9KlPhGxA
 LAFeyVT3gO6NPeDuJacoY0PMsFZ5cQe52uNgMtbFxCzmxV0lRY8K3mXpFXtniJ1GCQ67
 cEjg==
X-Gm-Message-State: APjAAAXpWRh7VhtunMGB2Q0WVC/R+JJWz8Z/irDHZJzHZzpR9Xp3jdvE
 7Ha5Ho2iVgVJGWvP/Jim3bWn3LlF
X-Google-Smtp-Source: APXvYqyJ9CPcSjvQ07QUEG3ToI5dcpQxlSNn2UheQsJB42fphlYmiLGXIcUOpr7VMjk37laNNFLnkw==
X-Received: by 2002:adf:f052:: with SMTP id t18mr2942308wro.192.1576676850820; 
 Wed, 18 Dec 2019 05:47:30 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id p18sm2603972wmb.8.2019.12.18.05.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 05:47:30 -0800 (PST)
Date: Wed, 18 Dec 2019 13:47:28 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191218134728.rfvtctmn4nym3axl@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
 <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
 <20191218131852.cl7yiz3an2tbc5eg@debian>
 <e6eeed56-6fef-9676-1e40-3b5ce152a99c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6eeed56-6fef-9676-1e40-3b5ce152a99c@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next 7/7] x86: implement Hyper-V clock
 source
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

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDI6MjQ6MzNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTIuMjAxOSAxNDoxOCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgRGVj
IDE4LCAyMDE5IGF0IDAxOjUxOjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDE4LjEyLjIwMTkgMTM6MzgsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IE9uIFR1ZSwgRGVjIDEwLCAy
MDE5IGF0IDA1OjU5OjA0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gT24gMjUu
MTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiA+Pj4+PiArc3RhdGljIGlubGluZSB1aW50
NjRfdCByZWFkX2h5cGVydl90aW1lcih2b2lkKQo+ID4+Pj4+ICt7Cj4gPj4+Pj4gKyAgICB1aW50
NjRfdCBzY2FsZSwgb2Zmc2V0LCByZXQsIHRzYzsKPiA+Pj4+PiArICAgIHVpbnQzMl90IHNlcTsK
PiA+Pj4+PiArICAgIHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gJmh5cGVy
dl90c2NfcGFnZTsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICBkbyB7Cj4gPj4+Pj4gKyAgICAgICAg
c2VxID0gdHNjX3BhZ2UtPnRzY19zZXF1ZW5jZTsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgICAg
LyogU2VxIDAgaXMgc3BlY2lhbC4gSXQgbWVhbnMgdGhlIFRTQyBlbmxpZ2h0ZW5tZW50IGlzIG5v
dAo+ID4+Pj4+ICsgICAgICAgICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBUaGUgcmVmZXJl
bmNlIHRpbWUgY2FuIG9ubHkgYmUKPiA+Pj4+PiArICAgICAgICAgKiBvYnRhaW5lZCBmcm9tIHRo
ZSBSZWZlcmVuY2UgQ291bnRlciBNU1IuCj4gPj4+Pj4gKyAgICAgICAgICovCj4gPj4+Pj4gKyAg
ICAgICAgaWYgKCBzZXEgPT0gMCApCj4gPj4+Pj4gKyAgICAgICAgewo+ID4+Pj4+ICsgICAgICAg
ICAgICByZG1zcmwoSFZfWDY0X01TUl9USU1FX1JFRl9DT1VOVCwgcmV0KTsKPiA+Pj4+PiArICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiA+Pj4+PiArICAgICAgICB9Cj4gPj4+Pj4gKwo+ID4+Pj4+
ICsgICAgICAgIHNtcF9ybWIoKTsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgICAgdHNjID0gcmR0
c2Nfb3JkZXJlZCgpOwo+ID4+Pj4KPiA+Pj4+IFRoaXMgYWxyZWFkeSBpbmNsdWRlcyBhdCBsZWFz
dCBhIHJlYWQgZmVuY2UuCj4gPj4+Cj4gPj4+IE9LLiByZHRzYygpIHNob3VsZCBiZSBlbm91Z2gg
aGVyZS4KPiA+Pgo+ID4+IEFyZSB5b3Ugc3VyZT8gTXkgY29tbWVudCB3YXMgcmF0aGVyIHRvd2Fy
ZHMgdGhlIGRyb3BwaW5nIG9mIHNtcF9ybWIoKQo+ID4+IChtYXliZSByZXBsYWNpbmcgYnkgYSBj
b21tZW50KS4KPiA+IAo+ID4gSSBkbyBtZWFuIHRvIGtlZXAgc21wX3JtYigpIGJlZm9yZSBpdC4g
SXMgdGhhdCBub3QgZW5vdWdoPwo+IAo+IFdpdGgKPiAKPiAjZGVmaW5lIHNtcF9ybWIoKSAgICAg
ICBiYXJyaWVyKCkKPiAKPiBpdCBpc24ndCAtIGl0J3MgbWVyZWx5IGEgY29tcGlsZXIgYmFycmll
ciwgYnV0IGZvciB0aGUgb3JkZXJpbmcKPiB5b3Ugd2FudCB5b3UgbmVlZCBhIGZlbmNlLgoKQWgs
IEkgc2VlLiBUaGFuayB5b3UuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
