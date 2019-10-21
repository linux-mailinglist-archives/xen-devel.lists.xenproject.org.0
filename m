Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57102DE755
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 11:03:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMTWG-0004qD-RC; Mon, 21 Oct 2019 08:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMTWF-0004q8-8K
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 08:58:27 +0000
X-Inumbo-ID: f18ee4da-f3e0-11e9-8aca-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f18ee4da-f3e0-11e9-8aca-bc764e2007e4;
 Mon, 21 Oct 2019 08:58:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v3so1176295wmh.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 01:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Klh8TCpph3zHlaxpBPIGDXd/QnYa/HKIuFNMyXlMhlY=;
 b=rWAlkRgUqD2sy+ap38MBR1MfT/p3habxy8wKd/R/UzOhniOwGTZ3tnwydp/cc2UWB2
 yxeHbTMUnTB4Tj4hY/MRSmoKqfjlfuYM4lfTN4StdMLmkErQRxFdKZbAxjCXK1lvAiHl
 Fh1NNDheT/2b8k37hyXwqW13mLsszTh9GGNjQqaObHGHGIRGJiliQkWbY4Td8OKOVvbg
 Af7hvxcPw6ia0jVC1eN29ipacbj3EVK0aTnfSKYw+Zo+GIQ38NfD5pnvoQG2IC5KA9xU
 b6Z8h8Tm9PmuyDONnfF5m3NccbpTolZLX20uxNsnd9Ijj4UGDkwVF8ykTB4Sq1X9nRxj
 Lv+A==
X-Gm-Message-State: APjAAAX7JsJlPGf3uZ2vS3fBhjkP/C0dqicDPLBHIV4bisyvfJpjs4cQ
 UZ5kMvBDptfDYanlSENZzyUxuv6+ACw=
X-Google-Smtp-Source: APXvYqzEDahoWKQNy69utW7Fb8GW0P5yHwMxp7AiJkaHQaMTWzH71AbHJByCGOE7B3Qbr0CtP7Ug+A==
X-Received: by 2002:a1c:1a95:: with SMTP id a143mr4213592wma.85.1571648305723; 
 Mon, 21 Oct 2019 01:58:25 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id k3sm1039249wro.77.2019.10.21.01.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 01:58:25 -0700 (PDT)
Date: Mon, 21 Oct 2019 09:58:23 +0100
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20191021085823.uug4wzvcmsi4fd5n@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930150044.5734-1-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v2 0/9] Port Xen to Hyper-V
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDQ6MDA6MzRQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBIaSBhbGwKPiAKPiBUaGlzIGlzIHZlcnNpb24gMiBvZiB0aGUgcGF0Y2ggc2VyaWVzLgo+IAo+
IFRoaXMgaXMgdGhlIHZlcnkgZmlyc3Qgc3RhZ2UgZm9yIHBvcnRpbmcgWGVuIHRvIHJ1biBvbiBI
eXBlci1WIHdpdGggYWxsIHRoZQo+IGdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIuICBXaXRo
IHRoaXMgc2VyaWVzLCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKPiBIeXBlci1WIGFuZCBw
cmludHMgb3V0IGEgbWVzc2FnZS4gIEkgd291bGQgbGlrZSB0byBmaXJzdCBnZXQgdGhlIGNvZGUg
c3RydWN0dXJlCj4gYW5kIGtjb25maWcgb3B0aW9ucyBhZ3JlZWQgdXBvbi4KPiAKPiBUaGVyZSBh
cmUgdHdvIG1ham9yIGFyZWFzIHRvIGJlIHdvcmtlZCBvbjoKPiAgICogTWFrZSBEb20wIGFibGUg
dG8gdXNlIEh5cGVyLVYncyBzeW50aGV0aWMgZGV2aWNlcy4KPiAgICogTWFrZSBYZW4gdXNlIG9m
IHRoZSBzeW50aGV0aWMgdGltZXIsIHJlZmVyZW5jZSBUU0MgYW5kIGVubGlnaHRlbm1lbnQgVk1D
Uwo+ICAgICBhbmQgb3RoZXIgaW50ZXJmYWNlcy4KPiAKPiBUaGV5IGFyZW4ndCB0cml2aWFsLCBh
bmQgdGltZSBjYW4gYmUgc2NhcmNlIG9uIG15IHNpZGUsIHNvIEkgaW50ZW5kIHRvIHBvc3QKPiBw
YXRjaGVzIHBpZWNlIG1lYWwgd2hlbiB0aGV5IGFyZSByZWFkeS4KPiAKPiBRdWVzdGlvbnMgYW5k
IGNvbW1lbnRzIGFyZSB3ZWxjb21lLgo+IAo+IFRoYW5rcywKPiBXZWkuCj4gCj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MjoKPiAxLiBJbnRyb2R1Y2UgYW5kIHVzZSBhIGh5cGVydmlzb3IgZnJhbWV3b3Jr
Cj4gMi4gS2VlcCBtZW1tYXAgaW5mcmEgdW5kZXIgWGVuIGZvciBub3cKClBpbmc/CgpDYW4gSSBn
ZXQgYW4gaGlnaCBsZXZlbCBhZ3JlZW1lbnQgb24gdGhlIGNvZGUgc3RydWN0dXJlIHN1Y2ggdGhh
dCBJIGNhbgpjb250aW51ZSBidWlsZGluZyBvbiB0b3Agb2YgdGhpcyBzZXJpZXM/CgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
