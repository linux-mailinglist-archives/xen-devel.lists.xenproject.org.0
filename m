Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47E8DBE3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 19:29:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxx2Y-00033o-7p; Wed, 14 Aug 2019 17:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=b6FE=WK=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1hxx2X-00033h-7L
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 17:26:25 +0000
X-Inumbo-ID: a38e2d2a-beb8-11e9-96f7-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a38e2d2a-beb8-11e9-96f7-bc764e2007e4;
 Wed, 14 Aug 2019 17:26:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m44so7725661edd.9
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2019 10:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KH4w0oKwUZo6WnJTZai7ekWKA/CJXDos3wfcS4r+T+o=;
 b=FwWRjE6OsxzLbp7eYh90Rna5x9DD6d1S7llQJ4qjoqRHG6mCWqvn6br1A+VtRTrHJl
 uon3iS0lEX0A/0h2Q6UdfNUYjtNRpJi8ofWt91U06wa7NI2J92B2z9h0NiTuRc9G/kje
 veMCuws6t86u7TVcyJX4rutDUinKxB+SjAmsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KH4w0oKwUZo6WnJTZai7ekWKA/CJXDos3wfcS4r+T+o=;
 b=iuIXiRriG6mCUQHq3CJDVEakPwIZbYiMZEMKSryzIaS4Y7GlKvL75aj8U9AfRuonfB
 dMoEMv4P14i+IWegtO6Tqb/5KUgbaQE8pHQk3StXUpt7bRtPmzyXBYGBfmY270I/XSyS
 HLxlNJE8a+bDloS0C6EvhsQCz+f0tLRO036WrY+H3LXMdiBrXRMyXtL42s4fw9R3fenY
 Hg/e2Hp6pbzOpBs0ShMPNay1pehY2J4xxX73GkoSQ133tcmX1NjxQZHQsN2RPoABButZ
 gqnCSw1QMNLTx41pk9CebIe/Vg68EKEFoey+2RzJiORczjRALBBhQ/7+1pyZKr4fP4lQ
 bALA==
X-Gm-Message-State: APjAAAWpXtPcmnsDfOrnXwiK9TmkEDyytYZ1TGID4EAVYbNbmwGX9qVe
 lkpstcmp++5fEU5R6EqXP/4V2g==
X-Google-Smtp-Source: APXvYqwr5gJ5RO1f3Je9Fpb0lIcmjnzJrRicW+lM3nEHrC54WpVw+JLDCNpQs7d5n6gcXlpD09jMxg==
X-Received: by 2002:a50:a5dd:: with SMTP id b29mr868361edc.34.1565803583538;
 Wed, 14 Aug 2019 10:26:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l9sm69555eds.96.2019.08.14.10.26.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:26:22 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:26:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <20190814172620.GO7444@phenom.ffwll.local>
References: <20190813062712.24993-1-nishkadg.linux@gmail.com>
 <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs
 constant
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTA6MzI6MDBBTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gCj4gT24gOC8xMy8xOSA5OjI3IEFNLCBOaXNoa2EgRGFzZ3VwdGEg
d3JvdGU6Cj4gPiBTdGF0aWMgc3RydWN0dXJlIGZiX2Z1bmNzLCBvZiB0eXBlIGRybV9mcmFtZWJ1
ZmZlcl9mdW5jcywgaXMgdXNlZCBvbmx5Cj4gPiB3aGVuIGl0IGlzIHBhc3NlZCB0byBkcm1fZ2Vt
X2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKCkgYXMgaXRzIGxhc3QKPiA+IGFyZ3VtZW50LiBkcm1fZ2Vt
X2ZiX2NyZWF0ZV93aXRoX2Z1bmNzIGRvZXMgbm90IG1vZGlmeSBpdHMgbHN0IGFyZ3VtZW50Cj4g
PiAoZmJfZnVuY3MpIGFuZCBoZW5jZSBmYl9mdW5jcyBpcyBuZXZlciBtb2RpZmllZC4gVGhlcmVm
b3JlIG1ha2UgZmJfZnVuY3MKPiA+IGNvbnN0YW50IHRvIHByb3RlY3QgaXQgZnJvbSBmdXJ0aGVy
IG1vZGlmaWNhdGlvbi4KPiA+IElzc3VlIGZvdW5kIHdpdGggQ29jY2luZWxsZS4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KCkknbSBhc3N1bWluZyB5b3UnbGwgYXBwbHkgdGhpcyB0byBkcm0t
bWlzYy1uZXh0IHRvbz8gR29vZCB0byBzdGF0ZSB0aGF0LAp0byBhdm9pZCBjb25mdXNpb24gYW5k
IGNvb3JkaW5hdGlvbiBpc3N1ZXMuCi1EYW5pZWwKCj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYwo+ID4gaW5kZXggYzI5NTVkMzc1Mzk0Li40YTk4NGY0NTU1NWUg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+ID4gQEAg
LTQ1LDcgKzQ1LDcgQEAgc3RhdGljIHZvaWQgZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYikKPiA+ICAgCWRybV9nZW1fZmJfZGVzdHJveShmYik7Cj4gPiAgIH0KPiA+IC1zdGF0
aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKPiA+ICAgCS5k
ZXN0cm95ID0gZmJfZGVzdHJveSwKPiA+ICAgfTsKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
