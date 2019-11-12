Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4647F92E8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:42:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUXKi-0001Qv-4p; Tue, 12 Nov 2019 14:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RWbO=ZE=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iUXKh-0001Qq-66
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:39:51 +0000
X-Inumbo-ID: 47c7835e-055a-11ea-b678-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47c7835e-055a-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 14:39:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a17so2507060wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 06:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bgEP+EflIODH6y5Wq0P5EbQW9VxaN3P7DuSZOtvL41M=;
 b=HNExHZ8jirk+h240/ZMh49teJsKecMa9i50I3JU5kZhKvrdEF2IrJo3YwJPHcqNkeh
 4Ix9LmccmWRcxGBUrm7qi+9QJaSyTYq+UfK4srhQLdZn3vjtKI+csUzL0qCnkP2r47no
 xTW/M3CMRJAFHjg4dqJl+kRiaDB1E6wlBkTosnskz803dt/KL7tBbxpeoaD2Y/Y3h7FI
 Vtoc3yU3LW6ca6OsnfdJFEVFNmrwW91MyyzpZyQ5/AMY/dnvvn1yWijoDe0RnQyd1fna
 iffMfGUVkwVnv8rCadA3Z/PaWK1fs60euFA9GHDkv5l9pVfQ+qrMDR+ep7CSJF2Rvhyu
 e+Lw==
X-Gm-Message-State: APjAAAVJEE3UN4ZZGAN1dE54INF7VDgHuR3Yi6jX5n5zdyJHGo2r+LXw
 VSgYnhBT18HuWVu0MNTuW5I=
X-Google-Smtp-Source: APXvYqzOtwottFOyi3jySvcaoa/IkDPWJj/e+tVtrmlOmxNPvu08xpqP7EFjfEueLNqvt9Z3oJQRNg==
X-Received: by 2002:a1c:2e0f:: with SMTP id u15mr4285756wmu.47.1573569589439; 
 Tue, 12 Nov 2019 06:39:49 -0800 (PST)
Received: from debian (63.149.115.87.dyn.plus.net. [87.115.149.63])
 by smtp.gmail.com with ESMTPSA id y2sm4519506wmy.2.2019.11.12.06.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 06:39:48 -0800 (PST)
Date: Tue, 12 Nov 2019 14:39:47 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20191112143947.6s6wqtukc5ecicft@debian>
References: <20191112141943.245215-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112141943.245215-1-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix
 libxl_retrieve_domain_configuration error path
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDI6MTk6NDNQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gRnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4K
PiAKPiBJZiBhbiBlcnJvciB3ZXJlIHRvIGhhcHBlbiBiZWZvcmUgdGhlIGxhc3Qgc3RlcCwgZm9y
IGV4YW1wbGUgdGhlCj4gZG9tYWluX2NvbmZpZ3VyYXRpb24gaXMgbWlzc2luZywgdGhlIGVycm9y
IHdvdWxkbid0IGJlIGNoZWNrIGJ5IHRoZQoKY2hlY2sgLT4gY2hlY2tlZAoKPiBfZW5kIGNhbGxi
YWNrLgo+IAo+IEZpeCB0aGF0LCBhbHNvIGluaXRpYWxpc2UgYGxvY2snIHRvIE5VTEwgYmVjYXVz
ZSB0aGUgZXhpdCBwYXRoIGNoZWNrcwo+IGl0Lgo+IAo+IFRoZSBpc3N1ZSBzaG93cyB1cCB3aGVu
IHRoZXJlJ3MgYSBzdHViZG9tLCBhbmQgcnVubmluZyBgeGwgbGlzdCAtbGAKPiBhYm9ydHMuIElu
c3RlYWQsIHdpdGggdGhpcyBwYXRjaCwgYHhsIGxpc3QgLWxgIHdpbGwgbm90IGxpc3Qgc3R1YmRv
bSwKPiBwcm9iYWJseSBsaWtlIGJlZm9yZS4KPiAKPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5
a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+IEZpeGVz
OiA2MTU2MzQxOTI1N2VkNDAyNzg5MzhkYjJjY2U3ZDY5N2FlZDQ0ZjVkCj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2xAeGVuLm9yZz4KCkkgYWxzbyBoYXZlIGEgbG9vayBhdCBvdGhlciBjYWxsYmFj
a3MuIFRoZSBfZW5kIG9uZSBpcyB0aGUgb25seSBvbmUgdGhhdAptaXNzZWQgdGhpcyBlYXJseSBl
eGl0IHBhdGguCgpKdWVyZ2VuLCB0aGlzIHNob3VsZCBkZWZpbml0aXZlbHkgYmUgaW4gNC4xMyBz
aW5jZSBpdCBmaXhlcyBhIGJ1ZwppbnRyb2R1Y2VkIGluIHRoaXMgY3ljbGUuCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
