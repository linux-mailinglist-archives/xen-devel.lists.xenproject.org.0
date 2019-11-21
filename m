Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FE10570F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:29:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpIY-0002QW-F7; Thu, 21 Nov 2019 16:27:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXpIX-0002QM-95
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:27:13 +0000
X-Inumbo-ID: c53faeb0-0c7b-11ea-9631-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c53faeb0-0c7b-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 16:27:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x26so4135043wmk.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 08:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fq1aahxsnde7/XFd+YjLDf2MWP+WdkzxJC6Q5DNAlro=;
 b=K7uld+VYGk/muqrI9evoNdAzemXjUccBwlhirwLirSj7WZrhcoowaujkoXo1mKwMV5
 xZDUnoOO0E+M9RvmP1YWKubT3MZr0EfRIy+/of5DNGDih76lKiiCXC/V0tSbFEQO0qUx
 zBVtuzqvFiE8spfbmFcSsModta8j1eu5yB19ilF1p9b0AiL31bIIJyN/DRZQ88dJ6sxR
 B2cWh9TyOi2BxyJFDSJAKlaqBIo06NI/NmM5ZZ+z02i+IxDGLCNEJxRVPBhCOmdO+V+r
 B3e3Q5pQg7VnF5Nw4qh8iv2j3FqXbmYDSKweuHnuV2YquRcfrHVi1DzTC9Uzk0UdYPkx
 n7sQ==
X-Gm-Message-State: APjAAAW5widT3PqD+ozCrxRUmt/2csOmipkT0PDTL9O0g4vZfL1zamaA
 F2sffLZOTLOgkUBdLsoOMJM=
X-Google-Smtp-Source: APXvYqytVJTWlBvZpzRbvjYHN1qv0Snii9iyLoSD/caggEe8R0lXvji5JHMtfAW+eoOzEH/+fQQtWA==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr10721976wmb.135.1574353631543; 
 Thu, 21 Nov 2019 08:27:11 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id h16sm3795962wrs.48.2019.11.21.08.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 08:27:10 -0800 (PST)
Date: Thu, 21 Nov 2019 16:27:08 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121162708.5ffuol576hew7xw3@debian>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-7-liuwe@microsoft.com>
 <5ae30e58-29a0-804d-3b08-7904c2bf2f9b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ae30e58-29a0-804d-3b08-7904c2bf2f9b@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v3 6/9] x86: rename
 hypervisor_{alloc, free}_unused_page
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
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDI6NDk6NTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4v
eGVuLmMKPiA+IEBAIC05Nyw3ICs5Nyw3IEBAIHN0YXRpYyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2
b2lkKQo+ID4gICAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICAgICAgdW5zaWduZWQgbG9uZyByYzsK
PiA+ICAKPiA+IC0gICAgaWYgKCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKCZtZm4pICkK
PiA+ICsgICAgaWYgKCB4ZW5fYWxsb2NfdW51c2VkX3BhZ2UoJm1mbikgKQo+IAo+IEJ1dCBpcyBq
dXN0ICJ4ZW5fIiBhcyBhIHByZWZpeCBhIGdvb2QgbmFtZSBpbiBYZW4gY29kZT8gUGVyaGFwcwo+
ICJ4ZW5fZ3Vlc3RfIiBvciAoc2hvcnRlcikgInhnXyI/CgpUaGF0J3MgZmluZSBieSBtZS4KCldl
aS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
