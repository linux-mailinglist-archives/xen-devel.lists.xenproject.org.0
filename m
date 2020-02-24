Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6FF16A396
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:12:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Afv-0000xF-Cy; Mon, 24 Feb 2020 10:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6Afu-0000xA-2o
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:09:18 +0000
X-Inumbo-ID: b74c0b8e-56ed-11ea-ade5-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b74c0b8e-56ed-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 10:09:17 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dc19so11199650edb.10
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 02:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=au3+WN+I9pRpzF5llN9+F5dRHMQhjkaO8ts7VBXfDdE=;
 b=UENqaf/KMPzkxdGm+FK79zqnUikJszHP/KoMi0tkD7otAHmE0mBL2zUHZPZZKAAnIc
 aCsuixRgJ7aJdTSUnfwYVIVmQDkG2ZKUAAJmxV292eNGo7kF8wlENmL/VU6AcIRAfJZ3
 eJ0eiyd3YYU9N843+sDZC3QRyaRvpf3Jsy5zKOm3rYnMmEly7ZI87vjSlZEIKq4BrEmY
 1aNISIC2Y2sMxojmX8EYpnUradkQxnPdIkWpXihAGG1jbP2Ap5uQryGiCvMhkJPcakFX
 1HqzUiPE9TJwxRVj6MGvqEUXdfV4xln4WOiezsoa87RtAGwXPFP4VVueTbQanMR33ntt
 ai6w==
X-Gm-Message-State: APjAAAWDhWjJQM36KwrX+q0OmXZFWTfqYxM68RJ73w8fT7GlNDx6MRsX
 THuOmhiZ8v/tyPxCeUOrVfFUMnMrpF4=
X-Google-Smtp-Source: APXvYqyJnpOdQfvN2LTF7ZjNRQrshMgF5S7HQ5/d8ohw8YklTEZPq4JAUniPnDUGjFM3NG7TCUYyTg==
X-Received: by 2002:a17:906:7c5a:: with SMTP id
 g26mr44349258ejp.249.1582538956687; 
 Mon, 24 Feb 2020 02:09:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id ay24sm942816edb.29.2020.02.24.02.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 02:09:15 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5E532442.1040401@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <96315706-b884-aa1c-8160-b6c2f338c1be@xen.org>
Date: Mon, 24 Feb 2020 10:09:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5E532442.1040401@hisilicon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v5] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgV2VpLAoKT24gMjQvMDIvMjAyMCAwMToxNywgV2VpIFh1IHdyb3RlOgo+IFBhcnNlIHRoZSBB
Q1BJIFNQQ1IgdGFibGUgYW5kIGluaXRpYWxpemUgdGhlIDE2NTUwIGNvbXBhdGlibGUgc2VyaWFs
IHBvcnQKPiBmb3IgQVJNIG9ubHkuIEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQgb25lIFVBUlQg
b24gQVJNLiBTb21lIGZpZWxkcwo+IHdoaWNoIHdlIGRvIG5vdCBjYXJlIHlldCBvbiBBUk0gYXJl
IGlnbm9yZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNv
bT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSBkb24n
dCB0aGluayBKYW4gZ2F2ZSBhbiBleHBsaWNpdCByZXZpZXdlZC1ieSBmb3IgdGhpcyBwYXRjaC4g
SG93ZXZlci4uLgoKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiAK
PiAtLS0KPiBDaGFuZ2VzIGluIHY1Ogo+IC0gY2hlY2sgdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3Mg
c3BhY2UgYmVmb3JlIGNoZWNraW5nIHRoZSBhZGRyZXNzCgouLi4gdmVyc2lvbiA0IG9mIHRoaXMg
cGF0Y2ggaGFzIGFscmVhZHkgYmVlbiBtZXJnZWQuIFNvIGNhbiB5b3Ugc2VuZCBhIApmb2xsb3ct
dXAgdG8gcmUtb3JkZXIgdGhlIGNoZWNrPwoKQmVzdCByZWdhcmRzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
