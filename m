Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10114108010
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 19:48:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYaPP-0002KH-OV; Sat, 23 Nov 2019 18:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYaPN-0002Jk-H4
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 18:45:25 +0000
X-Inumbo-ID: 68eee32c-0e21-11ea-b08b-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68eee32c-0e21-11ea-b08b-bc764e2007e4;
 Sat, 23 Nov 2019 18:45:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t26so8847095wmi.0
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 10:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xNgkuyfDg6wqyfXSED1ZxPHqtTJ4/oI6iMmgjcy3MkU=;
 b=n9air8GXmqvR2Fn1bdJJBulLG/ffEOQFmBYWxPMYPMsqwWyTGOj+WV5YVxtBu6zcNj
 KceceqyN2FQ8G3aRoou1QOBhTf/XzZP/cJknb9Kw50TY4de/RUjCkXqv/aKCBh1Iq35b
 luueBavP/dIo0Ak8cE2Gu4Tv/6gp4caJMWQ1VU7wGG6ueW+CmKLjApcD7DbnRRHvh0iz
 yw92nvzVsWYZnvw/tiAJQP0ZlJDBHhhVQlhe9mWgAuR/8jVnduEv0VwphKyip4L+Uurs
 vFXkvsq2a8O9/k+EP09jl1By/jchA36MDOwT1G4Akyi02wI270HqhNGoG+vskZvfxOdb
 X6Xw==
X-Gm-Message-State: APjAAAUOoMWt9LnK452iFuS5xNrGjhhijntz3qY7twOf1bDCpNSOgh6v
 psOoKwpmWqRxDw4wIq6M51Q=
X-Google-Smtp-Source: APXvYqwkEYq80T7AEAJtwqk648wNHPdlE395kmv9c8+avh2LC6pmYFdsMLxyHyUlYbIs/B2i3BlsMg==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr22738519wmi.114.1574534724245; 
 Sat, 23 Nov 2019 10:45:24 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y6sm3172777wrl.17.2019.11.23.10.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 10:45:23 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115200115.44890-2-stewart.hildebrand@dornerworks.com>
 <90d69e98-33d4-e821-4c11-a86e12799456@xen.org>
Message-ID: <9a390f1c-15ca-5fb4-ce3c-7912904e99e0@xen.org>
Date: Sat, 23 Nov 2019 18:45:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <90d69e98-33d4-e821-4c11-a86e12799456@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 01/11] xen: arm: fix indentation of
 struct vtimer
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
Cc: Julien Grall <julien.grall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Campbell <ian.campbell@citrix.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMy8xMS8yMDE5IDE4OjQwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTUvMTEvMjAxOSAyMDowMSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+PiBGcm9tOiBJYW4g
Q2FtcGJlbGwgPGlhbi5jYW1wYmVsbEBjaXRyaXguY29tPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBJ
YW4gQ2FtcGJlbGwgPGlhbi5jYW1wYmVsbEBjaXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAY2l0cml4LmNvbT4gWzFdCj4+IEFja2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUBldS5jaXRyaXguY29tPiBbMl0KPiAK
PiBSZWdhcmRsZXNzIHRoZSBjb21wbGV4aXR5IG9mIHRoZSBwYXRjaCwgdGhpcyB3YXMgcmV2aWV3
ZWQgbmVhcmx5IDQgeWVhcnMgCj4gYWdvIGFuZCB0aGVyZWZvcmUgcmV2aWV3IHRhZ3MgbWF5IGJl
IHN0YWxsIGV2ZW4gaWYgdGhlIHJldmlld2VycyBhcmUgdGhlIAo+IHNhbWUuCj4gCj4gSW5kZWVk
LCB0aGUgY29kZSBiYXNlIGhhcyBjaGFuZ2VkIHF1aXRlIGEgbG90IGFuZCBzb21lIG9mIHRoZSBw
YXRjaGVzIAo+IG1heSByZXF1aXJlIG1vZGlmaWNhdGlvbnMgdG8gZml0IHRoZSBkaXJlY3Rpb24g
b2YgdGhlIHByb2plY3QuCj4gCj4gQW55d2F5LCBmb3IgdGhpcyBwYXRjaDoKPiAKPiBBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAeGVuLm9yZz4KClNvcnJ5LCBpdCBzaG91bGQg
YmUganVsaWVuQHhlbi5vcmcuIFN0aWxsIGdldHRpbmcgdXNlIG9mIG15IG5ldyBlLW1haWwuCgo+
IAo+IEkgd2lsbCBjb21taXQgaXQgaW4gbXkgYnJhbmNoIGZvci1uZXh0LzQuMTQgYW5kIHdpbGwg
bWVyZ2UgaXQgb25jZSA0LjEzIAo+IGhhcyBiZWVuIHJlbGVhc2VkLgo+IAo+IENoZWVycywKPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
