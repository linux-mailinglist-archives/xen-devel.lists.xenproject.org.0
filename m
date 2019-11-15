Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85899FE2AC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 17:24:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVeMX-0004c7-Gw; Fri, 15 Nov 2019 16:22:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVeMV-0004c2-R2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 16:22:19 +0000
X-Inumbo-ID: 180b72bc-07c4-11ea-9631-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 180b72bc-07c4-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 16:22:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t1so11623239wrv.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 08:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Sk1JXOZx55k4sWAHYMdZWPYrfnNOQ8PlRzD7cWpmIN8=;
 b=pSW1+h3ZHjerV24f1j6yIhVqommBcqXkUifQwJGKrJVMYtX0DCxN71Za9El2IwCbUZ
 e+B24QDWFHFYIhHspg6axuLko8X3bg5R1P2NRlaftbsZVyVxtJg+7QNqCDn0s6RUB/X2
 470Ub+GWGkcHiYyU3u6sY8mOirMY1c5R5LbI1FFckFfuJH2e8UuyXz8zxzqduKbjxaIX
 GLlbutcq9xilxtCVKAK7+X2MIt3JhzUnI45BQ4ejEX8IaIb0Pkh2wH/kwMBi5wpOQ58T
 XsjmGWbc1ehIptdjrkVmbBlOVucJcdXz5x6rWskeTVhRGO3EXtbDpYVBulFmrrQKx6wL
 I/JA==
X-Gm-Message-State: APjAAAXVBanHqlxkODy0zRlFLT0AqQqBO6C3bZyBpG0915K5wxGIlSM5
 OwYq1iQIUgOiLaZDSXFuA3c=
X-Google-Smtp-Source: APXvYqwLqqvcClRgowFJoUUh6eYGTtjy0MTVU/xiFLdfh0ke6/DkaGUB30nGJh/rpYke9O987zCLBg==
X-Received: by 2002:a5d:6746:: with SMTP id l6mr5924889wrw.349.1573834938262; 
 Fri, 15 Nov 2019 08:22:18 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id w19sm10192364wmk.36.2019.11.15.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:22:17 -0800 (PST)
Date: Fri, 15 Nov 2019 16:22:15 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20191115162215.aeeypi2hzsdpw463@debian>
References: <20191115161532.1231811-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115161532.1231811-1-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] configure: Fix test for python
 3.8
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
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDQ6MTU6MzJQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy44L3doYXRzbmV3LzMuOC5odG1sI2Rl
YnVnLWJ1aWxkLXVzZXMtdGhlLXNhbWUtYWJpLWFzLXJlbGVhc2UtYnVpbGQKPiAKPiA+IFRvIGVt
YmVkIFB5dGhvbiBpbnRvIGFuIGFwcGxpY2F0aW9uLCBhIG5ldyAtLWVtYmVkIG9wdGlvbiBtdXN0
IGJlCj4gPiBwYXNzZWQgdG8gcHl0aG9uMy1jb25maWcgLS1saWJzIC0tZW1iZWQgdG8gZ2V0IC1s
cHl0aG9uMy44IChsaW5rIHRoZQo+ID4gYXBwbGljYXRpb24gdG8gbGlicHl0aG9uKS4gVG8gc3Vw
cG9ydCBib3RoIDMuOCBhbmQgb2xkZXIsIHRyeQo+ID4gcHl0aG9uMy1jb25maWcgLS1saWJzIC0t
ZW1iZWQgZmlyc3QgYW5kIGZhbGxiYWNrIHRvIHB5dGhvbjMtY29uZmlnCj4gPiAtLWxpYnMgKHdp
dGhvdXQgLS1lbWJlZCkgaWYgdGhlIHByZXZpb3VzIGNvbW1hbmQgZmFpbHMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0t
Cj4gCj4gTm90ZXM6Cj4gICAgIFlvdSBtYXkgd2FudCB0byByZXJ1biAuL2F1dG9nZW4uc2ggb24g
Y29tbWl0LgoKSW5kZWVkLiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBsb3Qgb2YgdW5yZWxhdGVk
IGNoYW5nZXMsIHByZXN1bWFibHkgZHVlCnRvIHRoZSBkaWZmZXJlbmNlIGluIGF1dG9jb25mLgoK
PiBkaWZmIC0tZ2l0IGEvbTQvcHl0aG9uX2RldmVsLm00IGIvbTQvcHl0aG9uX2RldmVsLm00Cj4g
aW5kZXggZTM2NWNkNjU4ZTBlLi5iYmYxZTAzNTRiMmIgMTAwNjQ0Cj4gLS0tIGEvbTQvcHl0aG9u
X2RldmVsLm00Cj4gKysrIGIvbTQvcHl0aG9uX2RldmVsLm00Cj4gQEAgLTIzLDggKzIzLDE1IEBA
IEFTX0lGKFt0ZXN0IHgiJHB5Y29uZmlnIiA9IHgibm8iXSwgWwo+ICBdLCBbCj4gICAgICBkbmwg
SWYgcHl0aG9uLWNvbmZpZyBpcyBmb3VuZCB1c2UgaXQKPiAgICAgIENQUEZMQUdTPSIkQ0ZMQUdT
IGAkUFlUSE9OLWNvbmZpZyAtLWNmbGFnc2AiCj4gLSAgICBMREZMQUdTPSIkTERGTEFHUyBgJFBZ
VEhPTi1jb25maWcgLS1sZGZsYWdzYCIKPiAtICAgIExJQlM9IiRMSUJTIGAkUFlUSE9OLWNvbmZp
ZyAtLWxpYnNgIgo+ICsgICAgZG5sIFdlIG5lZWQgdG8gdXNlIC0tZW1iZWQgd2l0aCBweXRob24g
My44IGJ1dCBub3Qgd2l0aCBlYXJsaWVyIHZlcnNpb24gc28KPiArICAgIGRubCBjaGVjayBpZiBp
dCBpcyByZWNvZ25pemVkLgo+ICsgICAgcHl0aG9uX2RldmVsX2VtYmVkPSIiCj4gKyAgICBpZiAk
UFlUSE9OLWNvbmZpZyAtLWVtYmVkID4vZGV2L251bGwgMj4vZGV2L251bGw7IHRoZW4KPiArICAg
ICAgcHl0aG9uX2RldmVsX2VtYmVkPSItLWVtYmVkIgo+ICsgICAgZmkKPiArICAgIExERkxBR1M9
IiRMREZMQUdTIGAkUFlUSE9OLWNvbmZpZyAtLWxkZmxhZ3MgJHB5dGhvbl9kZXZlbF9lbWJlZGAi
Cj4gKyAgICBMSUJTPSIkTElCUyBgJFBZVEhPTi1jb25maWcgLS1saWJzICRweXRob25fZGV2ZWxf
ZW1iZWRgIgo+ICsgICAgdW5zZXQgcHl0aG9uX2RldmVsX2VtYmVkCj4gIF0pCgpBY2tlZC1ieTog
V2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
