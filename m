Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5591248B5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:46:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZbQ-0006eA-Fj; Wed, 18 Dec 2019 13:43:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihZbP-0006e3-C1
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:42:59 +0000
X-Inumbo-ID: 48883e06-219c-11ea-a914-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48883e06-219c-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 13:42:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so1883908wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 05:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r0yvD4aEOMXXVpjkkN0poMNE/QpN2meBOCkGKZ6hMsY=;
 b=lJ2ik+rozRKvYjui1dfeVWpEn4tjN1CMWsfrV5R94JN4VGgsdvsnTgC+65TMXq215+
 TagIooYNcdRtK8m2AyN/x1+CxLkd0otCAdgCGIohLPWhJaq2b27ton++dLrymVNIh/c5
 N6hlirIroeUnt18RD/3kSwXZJF8ckEwgkPIPBcz6q9fQ9PHLZzLQZ7J+gedE/8i8xHCs
 Ar//NEKyG9KAsCnP+i5LgDfcW5dEgz/zmTJda0UjXR8ib7F11MrZbmCJt7YGx/DGdAY2
 3hvy9ENHS1HqbXYLgEfiVUPwwNZKYmZGSKUEOzL+MS4s/2oKk4gqdhrN+kjnNWlA0B1+
 DdMA==
X-Gm-Message-State: APjAAAUCu0/qtOY7lPRwhDCtxUKpxXVdkCKFXnTizu4N8RQHKbvaqmHc
 CAAU8Y7OwqNvDNUOhlVnJkI=
X-Google-Smtp-Source: APXvYqy3v7Hs/mhDtIVnO5gLvQcsdatFtYS+7Lpqx8/l38oodvTUsxBhiIxMpzTukxGMYOcvyzhCKg==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr3267115wmf.142.1576676570072; 
 Wed, 18 Dec 2019 05:42:50 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id v3sm2583376wru.32.2019.12.18.05.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 05:42:49 -0800 (PST)
To: Mark Brown <broonie@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20191218123756.41363-1-broonie@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <6c62f578-dd5e-1821-d9a4-2f3fc0abcfd5@xen.org>
Date: Wed, 18 Dec 2019 13:42:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218123756.41363-1-broonie@kernel.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] arm64: xen: Use modern annotations for
 assembly functions
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
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8xMi8yMDE5IDEyOjM3LCBNYXJrIEJyb3duIHdyb3RlOgo+IEluIGFuIGVmZm9ydCB0
byBjbGFyaWZ5IGFuZCBzaW1wbGlmeSB0aGUgYW5ub3RhdGlvbiBvZiBhc3NlbWJseSBmdW5jdGlv
bnMKPiBpbiB0aGUga2VybmVsIG5ldyBtYWNyb3MgaGF2ZSBiZWVuIGludHJvZHVjZWQuIFRoZXNl
IHJlcGxhY2UgRU5UUlkgYW5kCj4gRU5EUFJPQy4gVXBkYXRlIHRoZSBhbm5vdGF0aW9ucyBpbiB0
aGUgeGVuIGNvZGUgdG8gdGhlIG5ldyBtYWNyb3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyayBC
cm93biA8YnJvb25pZUBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+CgpDaGVlcnMsCgo+IC0tLQo+IAo+IFRoaXMgaXMgcGFydCBvZiBhIHdpZGVy
IGVmZm9ydCB0byBjb252ZXJ0IGFsbCB0aGUgYXJjaC9hcm02NCBjb2RlLgo+IAo+ICAgYXJjaC9h
cm02NC94ZW4vaHlwZXJjYWxsLlMgfCA4ICsrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L3hlbi9oeXBlcmNhbGwuUyBiL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TCj4gaW5kZXggYzVm
MDVjNGE0ZDAwLi4zMDVjMjI3NGI4ZWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC94ZW4vaHlw
ZXJjYWxsLlMKPiArKysgYi9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUwo+IEBAIC01NiwxMSAr
NTYsMTEgQEAKPiAgICNkZWZpbmUgWEVOX0lNTSAweEVBMQo+ICAgCj4gICAjZGVmaW5lIEhZUEVS
Q0FMTF9TSU1QTEUoaHlwZXJjYWxsKQkJXAo+IC1FTlRSWShIWVBFUlZJU09SXyMjaHlwZXJjYWxs
KQkJCVwKPiArU1lNX0ZVTkNfU1RBUlQoSFlQRVJWSVNPUl8jI2h5cGVyY2FsbCkJCQlcCj4gICAJ
bW92IHgxNiwgI19fSFlQRVJWSVNPUl8jI2h5cGVyY2FsbDsJXAo+ICAgCWh2YyBYRU5fSU1NOwkJ
CQlcCj4gICAJcmV0OwkJCQkJXAo+IC1FTkRQUk9DKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCj4g
K1NZTV9GVU5DX0VORChIWVBFUlZJU09SXyMjaHlwZXJjYWxsKQo+ICAgCj4gICAjZGVmaW5lIEhZ
UEVSQ0FMTDAgSFlQRVJDQUxMX1NJTVBMRQo+ICAgI2RlZmluZSBIWVBFUkNBTEwxIEhZUEVSQ0FM
TF9TSU1QTEUKPiBAQCAtODYsNyArODYsNyBAQCBIWVBFUkNBTEwyKG11bHRpY2FsbCk7Cj4gICBI
WVBFUkNBTEwyKHZtX2Fzc2lzdCk7Cj4gICBIWVBFUkNBTEwzKGRtX29wKTsKPiAgIAo+IC1FTlRS
WShwcml2Y21kX2NhbGwpCj4gK1NZTV9GVU5DX1NUQVJUKHByaXZjbWRfY2FsbCkKPiAgIAltb3Yg
eDE2LCB4MAo+ICAgCW1vdiB4MCwgeDEKPiAgIAltb3YgeDEsIHgyCj4gQEAgLTEwOSw0ICsxMDks
NCBAQCBFTlRSWShwcml2Y21kX2NhbGwpCj4gICAJICovCj4gICAJdWFjY2Vzc190dGJyMF9kaXNh
YmxlIHg2LCB4Nwo+ICAgCXJldAo+IC1FTkRQUk9DKHByaXZjbWRfY2FsbCk7Cj4gK1NZTV9GVU5D
X0VORChwcml2Y21kX2NhbGwpOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
