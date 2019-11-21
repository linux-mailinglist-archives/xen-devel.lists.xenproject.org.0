Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180061057CA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:05:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpqz-00063C-TR; Thu, 21 Nov 2019 17:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXpqy-000636-CW
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 17:02:48 +0000
X-Inumbo-ID: bdf8a63e-0c80-11ea-a33e-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdf8a63e-0c80-11ea-a33e-12813bfff9fa;
 Thu, 21 Nov 2019 17:02:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s5so5363276wrw.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 09:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S7UL28sWzHTjFnUwz7O9I+g+8cbsjcUeDGBIAcONYf0=;
 b=Sz8Sm9UWAy2meK9ZAx4AvgR4vyuq4w9qvMsVOY09TFeHPk3J1asg0bm64vy0C8T8Ej
 6Zu2klYGV/+Us3PvtGu3PoOfRIcGDDWoP4cG9/mbG3aim5Ur/WirVZgLt+xDma+QIQ3p
 I4j+59XwNoiDTRG9+vBPVp7dCtRMrMfgCwmdCcurQ/UHgnoYNhgZcSlEASBC/oPPieLT
 +ZaVfTfhh8z0TF7O9J6oUeky7dMG4+B+GAHlGe2qWbE+piTO+pKH5EsH6pcXcomZVHFP
 rh0Rg044HLSqMoNovwezbnzS0xVYqVhELKkIukOtBkk3f9AS7gqlolMi//5WwqcFgRbv
 KycA==
X-Gm-Message-State: APjAAAX3Jqpd1X7uXmCCcNH2ogEbyEGUx41z8JkGogv5b9diJs/ZUibm
 WEjjzzSno5qC5ep/twj2ZRQ=
X-Google-Smtp-Source: APXvYqziXZ8BM0+iakwT5r4K/xzK4v37G0SM0J4+j2unhe97i6G0+AD1yk8oZdQJAd76mju2uNqWTQ==
X-Received: by 2002:adf:91e1:: with SMTP id 88mr12696072wri.16.1574355766758; 
 Thu, 21 Nov 2019 09:02:46 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id u14sm3943847wrm.51.2019.11.21.09.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 09:02:46 -0800 (PST)
Date: Thu, 21 Nov 2019 17:02:44 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121170244.4vvetqox35pcitnx@debian>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-10-liuwe@microsoft.com>
 <b30133bd-1bf0-242a-fc92-851452806ce4@suse.com>
 <20191121162700.hpkrjcuebdylttjm@debian>
 <a71f7987-751f-a13e-e73c-653a802ea30b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a71f7987-751f-a13e-e73c-653a802ea30b@suse.com>
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
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDU6NTk6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4KPiA+PiBBbHNvIGhvdyBhYm91dCBoYXZpbmcgKl9wcm9iZSgpIHJldHVybiB0aGUg
YWRkcmVzcyBvZiAqX29wcywgc3VjaAo+ID4+IHRoYXQgdGhlIGxhdHRlciBjb3VsZCBhbGwgYmVj
b21lIHN0YXRpYz8KPiA+IAo+ID4gUHJldmlvdXNseSB5b3UgbWFkZSBhIHN1Z2dlc3Rpb24gdG8g
bWFrZSBwcm9iZSByZXR1cm4gdGhlIG5hbWUgb2YgdGhlCj4gPiBoeXBlcnZpc29yLiBIZXJlIHlv
dSBhc2sgZm9yIGFkZHJlc3Mgb2Ygb3BzLiBJIGFjdHVhbGx5IHByZWZlciB0aGUKPiA+IG1ldGhv
ZCBzdWdnZXN0ZWQgaGVyZSwgYnV0IHRoaXMgbWVhbnMgSSB3aWxsIG5lZWQgdG8ga2VlcAo+ID4g
aHlwZXJ2aXNvcl9uYW1lIGFyb3VuZC4KPiAKPiBJcyB0aGVyZSBhY3R1YWxseSBhbnkgdXNlciBv
ZiB0aGUgbmFtZSBmaWVsZCBvdGhlciB0aGFuIHRoZSBjYWxsZXIKPiBvZiBwcm9iZT8gSWYgbm90
LCBzdXJlbHkgdGhhdCBjYWxsZXIgY291bGQgYWNjZXNzIHRoZSBuYW1lIGZpZWxkCj4gd2l0aG91
dCBhIGh5cGVydmlzb3JfbmFtZSgpIHdyYXBwZXIuCgpJIGRvbid0IGVudmlzaW9uIG1vcmUgdXNl
cnMgYXQgdGhpcyBzdGFnZS4KCkknbSBmaW5lIHdpdGggYWNjZXNzaW5nIHRoYXQgZmllbGQgZGly
ZWN0bHkuIFdlIGNhbiBhbHdheXMgaW50cm9kdWNlIHRoZQpmdW5jdGlvbiBhZ2FpbiBpZiBpdCBi
ZWNvbWVzIG5lY2Vzc2FyeS4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
