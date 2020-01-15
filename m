Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A613C6F0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 16:08:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irkF0-0004vR-5O; Wed, 15 Jan 2020 15:05:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5IT=3E=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1irkEy-0004vI-LC
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 15:05:52 +0000
X-Inumbo-ID: 8372b66e-37a8-11ea-8588-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8372b66e-37a8-11ea-8588-12813bfff9fa;
 Wed, 15 Jan 2020 15:05:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so220429wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 07:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l+nye/BYJZe7Bw5ayLtgP5rQcdwwOtxIDTaqQZhLPlA=;
 b=TriLauzYNHsL9JUFeTfBPgLI3mXzaqN3X9Xv/T8hv1OAE1K7OtZVwWUpXbis2F35TX
 RirAzOPqPLVWRC7z1OXHnRrMPGjhFz/iZeZAbbXyxAIVPNAuKrLyGW2Noofc0ZesG/MW
 Vf9V+IOqGVXhB+dOFTOW4PjseC3EM7FByyDxJiPbbc9V8UnGPrKIH4IUWhfOAQW8sKmr
 dGMKFyelrc7PHa2wWA9rVmrOrCtBPIzpnzN5GBlpk35A5HIqzGj7hRC/yjD6RAkywMGA
 Uozdpqsm+OfjYXwdpaBTzQfA3IgdGQY0RLzfOe9RkmwIUWrA8ZxEkL4L2hGj01HgMKn8
 DAWA==
X-Gm-Message-State: APjAAAU2myiQi8PbfxbGg9p0mCV6B7vSAWafroWGy39XfchcE0+gyc6f
 fQaUaIxDfx8oRrS70HEqaZE=
X-Google-Smtp-Source: APXvYqztGYFP1LUF57lEbPErN/f7VP1qI9rU2yAcdmhylE8alEK9YH4yvGaqdMcNcSqYuH4XY8iHQg==
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr173641wmg.139.1579100748472;
 Wed, 15 Jan 2020 07:05:48 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id r62sm148422wma.32.2020.01.15.07.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:05:47 -0800 (PST)
Date: Wed, 15 Jan 2020 15:05:45 +0000
From: Wei Liu <wei.liu@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200115150545.j5gu7lm3l3ouv7l4@debian>
References: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] net: xen-netback: hash.c: Use built-in RCU
 list checking
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
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, frextrite@gmail.com, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDc6NDg6NDBQTSArMDUzMCwgbWFkaHVwYXJuYWJob3dt
aWswNEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBh
cm5hYmhvd21pazA0QGdtYWlsLmNvbT4KPiAKPiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdSBoYXMg
YnVpbHQtaW4gUkNVIGFuZCBsb2NrIGNoZWNraW5nLgo+IFBhc3MgY29uZCBhcmd1bWVudCB0byBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJo
b3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tPgoKWW91IHNlZW0gdG8gaGF2ZSBk
cm9wcGVkIHRoZSBzZWNvbmQgaHVuayB3aGljaCBtb2RpZmllZAp4ZW52aWZfZmx1c2hfaGFzaCwg
aXMgdGhhdCBhIG1pc3Rha2U/CgpXZWkuCgo+IC0tLQo+ICBkcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9oYXNoLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2hhc2gu
YyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2hhc2guYwo+IGluZGV4IDEwZDU4MGMzZGVhMy4u
M2Y5NzgzZjcwYTc1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2hhc2gu
Ywo+ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2hhc2guYwo+IEBAIC01MSw3ICs1MSw4
IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9hZGRfaGFzaChzdHJ1Y3QgeGVudmlmICp2aWYsIGNvbnN0
IHU4ICp0YWcsCj4gIAo+ICAJZm91bmQgPSBmYWxzZTsKPiAgCW9sZGVzdCA9IE5VTEw7Cj4gLQls
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShlbnRyeSwgJnZpZi0+aGFzaC5jYWNoZS5saXN0LCBsaW5r
KSB7Cj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShlbnRyeSwgJnZpZi0+aGFzaC5jYWNoZS5s
aXN0LCBsaW5rLAo+ICsJCQkJbG9ja2RlcF9pc19oZWxkKCZ2aWYtPmhhc2guY2FjaGUubG9jaykp
IHsKPiAgCQkvKiBNYWtlIHN1cmUgd2UgZG9uJ3QgYWRkIGR1cGxpY2F0ZSBlbnRyaWVzICovCj4g
IAkJaWYgKGVudHJ5LT5sZW4gPT0gbGVuICYmCj4gIAkJICAgIG1lbWNtcChlbnRyeS0+dGFnLCB0
YWcsIGxlbikgPT0gMCkKPiAtLSAKPiAyLjE3LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
