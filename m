Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E28CBF496
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:03:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUIt-0004CZ-G3; Thu, 26 Sep 2019 13:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDUIr-0004CQ-HK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:59:29 +0000
X-Inumbo-ID: db38e732-e065-11e9-b588-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id db38e732-e065-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 13:59:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a11so2925508wrx.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kFKI0Oksf9h+BHdmRzPr0jpVoipFtAwQz7QE82Q3FmY=;
 b=bN8SfW1i0XOnnB7NKaDGOjWqCFr7Jlwim3bYqk6kmnxZcu3lBvyhxRKo+XttaMK+i/
 RphCG+aUVmrdUFfBSJxahAesTS4GGptI7FZocz7Yj9N/GL/53h0ASOuidnnwJEtUHObq
 72EqmJHNWY9ruibNQuSvlSONfr9S2UVLbwEHoXHTB0uO3zo5qVUghM4M8K/uI1VQQRvS
 f5DJNp0L1Orqt3Oa7UcmOsFBSD82i+sSODamZTnQLLT1YPP2wQML2b+bSyruAMtrVDEQ
 9DfuuDxCujAAC/ok9FXBR5/zPCbQwzCGVeSEahSOTuzSd8lHrYprfCTtt9R8H/vDgtRI
 l7uA==
X-Gm-Message-State: APjAAAUEihzzGMJ23AHA0qoCpnryMytCqfoQjJkOPFBTi2zEIq8sSf5P
 seFAOVWLuRGGh7F7clPNIbg=
X-Google-Smtp-Source: APXvYqxuGM4V63TP4VxQ+AuCCRvXRiF8j1lKa/v2584VVrLEVnIFxdqgYWKmJMn4gMtDWwHBfXyJYQ==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr2853025wrt.59.1569506368300; 
 Thu, 26 Sep 2019 06:59:28 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id e20sm4554535wrc.34.2019.09.26.06.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 06:59:27 -0700 (PDT)
Date: Thu, 26 Sep 2019 14:59:26 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926135926.bo4tfgtijc4immeh@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <340534a15e206136a9573e0af57fd74565dbaeff.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <340534a15e206136a9573e0af57fd74565dbaeff.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 63/84] x86/domain_page: mapcache is no
 longer tied to pv.
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MjZBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCkFJVUkgdGhl
cmUgaXMgd2hlcmUgd2Ugd2FudCB0byBlbmQgdXAuIEkgZG8gd29uZGVyIGlmIHRoaXMgaXMgdGhl
CmNvcnJlY3QgcGxhY2UgZm9yIHRoaXMgcGF0Y2ggdGhvdWdoLiBUaGUgYm90dG9tIGxpbmUgaXMg
d2UgbmVlZCB0byBtYWtlCnN1cmUgdGhlIEhWTSBwYXRoIHdvcmtzIGJlZm9yZSB3ZSBjYW4gYWxs
b3cgSFZNIHRvIHVzZSBpdC4KCkkgZG9uJ3QgaGF2ZSBhbiBhbnN3ZXIgeWV0LiBJIHdpbGwgaGF2
ZSB0byBsb29rIGF0IGxhdGVyIHBhdGNoZXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
