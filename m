Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE845E1845
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 12:52:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNEEE-0002nd-Vh; Wed, 23 Oct 2019 10:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sGrY=YQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNEEC-0002nQ-VC
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 10:50:56 +0000
X-Inumbo-ID: fd881eac-f582-11e9-beca-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd881eac-f582-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 10:50:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r19so20702430wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 03:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2nEVJ44by2SZ8RwsJ9olk+ncXRwT3UoH0tZ1Hh14qa0=;
 b=leQ40h+/ksC33KjN2JniOl/hhG3NyELSWPw759LFcpqONbAb8QXRiumA+gqeBtG7XY
 3V8v0ftXr2YE9t0QJDE0aWQb9RPlSByDps5qdNgViz3ODwTcTdVudpvkKUeVz7ceC3Dq
 ChTKjP63yFia36WOVFp4K8mdSRKLxsLJbgSl1d3QEe+I6Ng8hWYk1JB6JoXPClnpj1qQ
 e1eF6uWB5uVjnqtwgKLuX/qgesEyjQlPSTJ/ehDTQvfsR4LmWGpvsxkhKq0SA+MX8XmM
 VDYjRDue28GO9pLZODp/L8GsAFw+0unOyHod7QiSpstnNY2ccC6Amm4Bk5iciBdtEr/3
 Icdg==
X-Gm-Message-State: APjAAAVuNGnpZX/uutzYRVczXS9u5dv3g2EFvsKUilrqPxwi6NWqV0RI
 SFdSjJcHz/yEH66eaQXUVSs=
X-Google-Smtp-Source: APXvYqzh7+Et9c8SebXiKn+2yrZ5jIcikfNqdP6wqGiEk1FH7DPeFDCo3zbYdJWgZF5kDzewWyiGMg==
X-Received: by 2002:a05:600c:2254:: with SMTP id
 a20mr107350wmm.139.1571827855682; 
 Wed, 23 Oct 2019 03:50:55 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id c18sm19362244wrv.10.2019.10.23.03.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 03:50:55 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:50:53 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@gmail.com>
Message-ID: <20191023105053.xw2wja5em2fljlh7@debian>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-10-liuwe@microsoft.com>
 <CACCGGhCQjaYNgExFAA4LD85qm_sO=ZeEo2fHqcpufmJvZt1yqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACCGGhCQjaYNgExFAA4LD85qm_sO=ZeEo2fHqcpufmJvZt1yqw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v3 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6MDc6MjRBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9uIE1vbiwgMjEgT2N0IDIwMTkgYXQgMTc6MDEsIFdlaSBMaXUgPHdsQHhlbi5vcmc+
IHdyb3RlOgo+ID4KPiA+IFdlIHVzZSB0aGUgc2FtZSBjb2RlIHN0cnVjdHVyZSBhcyB3ZSBkaWQg
Zm9yIFhlbi4KPiA+Cj4gPiBBcyBzdGFydGVycywgZGV0ZWN0IEh5cGVyLVYgaW4gcHJvYmUgcm91
dGluZS4gTW9yZSBjb21wbGV4Cj4gPiBmdW5jdGlvbmFsaXRpZXMgd2lsbCBiZSBhZGRlZCBsYXRl
ci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+
IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KClRoYW5rcy4KClsu
Li5dCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+IGluZGV4IGE2NjZhZDk1MjYuLjE3Mzky
ZDFmZmEgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4g
PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gPiBAQCAtNDMsNiArNDMs
MTQgQEAgYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpCj4gPiAgICAgIH0KPiA+ICAjZW5kaWYK
PiA+Cj4gCj4gQWRkIGEgY29tbWVudCBoZXJlIHRvIHBvaW50IG91dCB0aGF0IGh5cGVydl9wcm9i
ZSgpIG5lZWRzIHRvIGJlIGNhbGxlZAo+IGFmdGVyIHhlbl9wcm9iZSgpIHRvIGF2b2lkIGEgZmFs
c2UgcG9zaXRpdmUgZHVlIHRvIHZpcmlkaWFuIHN1cHBvcnQuCj4gCgpZZXMgSSBjYW4gZG8gdGhh
dC4KCldlaS4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
