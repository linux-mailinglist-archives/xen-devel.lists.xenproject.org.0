Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F66D1071E0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 13:00:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY7YM-0006Id-6U; Fri, 22 Nov 2019 11:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nz3w=ZO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iY7YJ-0006IY-VN
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:56:43 +0000
X-Inumbo-ID: 265ec48a-0d1f-11ea-9631-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 265ec48a-0d1f-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 11:56:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so8334147wrr.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2019 03:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gAafFiRGNjamILcUCgczmh4s7Z4+O33gKmZNUqxFu5Q=;
 b=BR7rQMpclJdq4xan+dGa2HALGt+/f1X0bRVKck8CcpK1h2kC83Pby/vVDuozGdhOjS
 uPzdlMl3ZCaFvhShKZOW9qp/F+KcPf9ZGUvvKpNMJr/9T9HU7wykY816v9NHZ9jT/r0m
 i956SwcsCw9IHq45+AIMOWkCVV2+GDje1xW0Pb4OfLmqL9O1RfG0IGIE8gDofWqGDZbM
 Yaa1HwLaw2lDnoLUXN/m9tCKB6DqnxfeOEJbPZCSbD0F+eTM/PSTknk3cYJcgWko5vWL
 CIH+F+JNTJakzoPLNzBePBAdF6QMkbh27f5poRPxsXlHO3KY6TEBqQiEx7td4W/oaOzT
 2rxQ==
X-Gm-Message-State: APjAAAWMc98a4ExOfYNamFUpjQXiYzra7NeoJ/QL9lXv23bQKcM5sIVC
 Vn2FTJt82xDoeFEk5nRF3HI=
X-Google-Smtp-Source: APXvYqyucs33JOUbiJvUFBB2A91wFmTBmjEKMA0iQBaotc+hAky3tcdEVeL5PyxhLwEX6FidbHOZBg==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr17528759wrj.334.1574423802398; 
 Fri, 22 Nov 2019 03:56:42 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id h124sm3447083wmf.30.2019.11.22.03.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 03:56:41 -0800 (PST)
Date: Fri, 22 Nov 2019 11:56:40 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191122115640.ojms3gn64z3nsufk@debian>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-3-al1img@gmail.com>
 <24023.49953.218810.697415@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24023.49953.218810.697415@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 2/3] libxl: rename VKB backend type
 "linux" to "pv"
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MTQ6NDFBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gT2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYyIDIvM10gbGlieGw6IHJl
bmFtZSBWS0IgYmFja2VuZCB0eXBlICJsaW51eCIgdG8gInB2IiIpOgo+ID4gRnJvbTogT2xla3Nh
bmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgo+ID4gCj4gPiBUaGVyZSBh
cmUgdHdvIGtpbmQgb2YgVktCIGJhY2tlbmRzOiBRRU1VIGFuZCB1c2VyIHNwYWNlIFBWIGJhY2tl
bmQuCj4gPiBGb3IgUFYgYmFja2VuZCAibGludXgiIGVudW0gaXMgdXNlZCBidXQgdGhpcyBuYW1l
IGlzIGNvbmZ1c2VkLiBSZW5hbWUKPiA+ICJsaW51eCIgZW51bSB0byAicHYiIGFzIGl0IGJldHRl
ciBtYXRjaGVzIHVzZXIgc3BhY2UgUFYgYmFja2VuZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgo+IAo+IFJlcXVl
c3RlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQWNrZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhlIExJTlVYIHR5
cGUgd2FzIGludHJvZHVjZWQgYmFjayBpbiAyMDE4LgoKVGhpcyBwYXRjaCBzaG91bGQgaGF2ZSBw
cm92aWRlZCBhdCBsZWFzdCBhCgogICNkZWZpbmUgLi4uTElOVVggLi4uUFYKCmluIGxpYnhsLmgg
Zm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgcHVycG9zZS4KCldlaS4KCgo+IAo+IFRoYW5rcy4K
PiAKPiBJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
