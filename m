Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608431548AF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 16:58:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjUw-0008No-7Y; Thu, 06 Feb 2020 15:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSBF=32=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izjUu-0008Nd-GX
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:55:20 +0000
X-Inumbo-ID: 1339c218-48f9-11ea-b60c-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1339c218-48f9-11ea-b60c-bc764e2007e4;
 Thu, 06 Feb 2020 15:55:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so604822wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 07:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qXHO6n+cpmfmOOPTgMqoi8fTkqkIAOAZsUqtgp69/S0=;
 b=shxHMpefzV4Ssmqkzbc5WUkGkqKed4hEKJmk4jV0219DBMPyAwKikl4mgvWyPx6yE5
 yZn/GE4LFUj+Z8lseGvyQ/p5FF9V1lmxviT7F1OwSW86Llp55LUsxdWPWvev+eHZZnDK
 tSxxL+xFE7zj4mKfxAKqiYGeH0f4p7Ze75AEwcIYPK69ONybUAbABOMkznwDkq9QlLbA
 ShDq5DiQ5QscqUF6i1UUVK58Vw/w6g2YIOaBL2fgyN7Z73rYQiePMz4SWZOHGG6pYS8k
 nvHjA1eg1IDQbMhdD5W+Lo/6+rHsEwqt8jo9UP4VtpTAJNfWVtjWZ6hO7Mltbm0skO36
 646w==
X-Gm-Message-State: APjAAAX9T5bs8qhY30Z9Y/pXjLqxF3UUKo8dzzFBtKHbollcWSoUfLiE
 PmlWQsyMI+0wZyImMVw4F+I=
X-Google-Smtp-Source: APXvYqxQlH3SdQsq0SrvKb8EOyTqpuuvD9Dvf76Sy6m9O4VIAOwBIIgKEqq4c79NWSkRX5WKlWtL8w==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr5057702wmc.129.1581004519111; 
 Thu, 06 Feb 2020 07:55:19 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id f207sm4332807wme.9.2020.02.06.07.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 07:55:18 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200206154118.31451-1-julien@xen.org>
 <22a72040-c4cd-7068-4064-b738bca74669@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8bab94bd-3bc1-9094-a29a-fdfda97d7a49@xen.org>
Date: Thu, 6 Feb 2020 15:55:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <22a72040-c4cd-7068-4064-b738bca74669@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/include: public: Document the padding
 in struct xen_hvm_param
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDYvMDIvMjAyMCAxNTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYu
MDIuMjAyMCAxNjo0MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgo+Pgo+PiBUaGVyZSBpcyBhbiBpbXBsaWNpdCBwYWRkaW5nIG9m
IDIgYnl0ZXMgaW4gc3RydWN0IHhlbl9odm1fcGFyYW0gYmV0d2Vlbgo+PiB0aGUgZmllbGQgZG9t
aWQgYW5kIGluZGV4LiBNYWtlIGl0IGV4cGxpY2l0IGJ5IGludHJvZHVjZSBhIHBhZGRpbmcKPj4g
ZmllbGQuIFRoaXMgY2FuIGFsc28gc2VydmUgYXMgZG9jdW1lbnRhdGlvbi4KPj4KPj4gTm90ZSB0
aGF0IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIG1hbmRhdGUgaXQgdG8gYmUgemVybyBiZWNhdXNlIGEg
Z3Vlc3QgbWF5Cj4+IG5vdCBoYXZlIGluaXRpYWxpemVkIHRoZSBwYWRkaW5nLgo+IAo+IEFncmVl
ZCAtIHdlIGNhbiBtYW5kYXRlIHN1Y2ggb25seSBhdCBpbnRyb2R1Y3Rpb24sIG5vdCBhdCBhbnkK
PiBsYXRlciB0aW1lLgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpUaGFuayB5b3UhCgo+IChJIGRvdWJ0IHRoaXMgaXMgdGhlIG9ubHkgbWlzc2luZyBmaWVsZCB0
byBtYWtlIHBhZGRpbmcgZXhwbGljaXQuKQoKUHJvYmFibHkgbm90LCBzYWRseS4gSSBzdHVtYmxl
ZCBhY2Nyb3NzIHRoZSBIVk0gcGFyYW0gaW1wbGljaXQgcGFkZGluZyAKd2hpbGUgbG9va2luZyBh
dCBsaXZldXBkYXRpbmcgdGhlIEhWTSBwYXJhbS4KCkkgZ3Vlc3MgSSBjb3VsZCB1c2UgcGFob2xl
IHRvIGNoZWNrIHRoZSBwYWRkaW5ncyBhcmUgZXhwbGljaXQgZm9yIGFsbCAKdGhlIHB1YmxpYyBz
dHJ1Y3R1cmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
