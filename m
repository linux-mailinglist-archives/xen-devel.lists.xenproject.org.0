Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A7168873
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 21:49:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5FCb-0002Jn-Sq; Fri, 21 Feb 2020 20:47:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j5FCa-0002Ji-Mw
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 20:47:12 +0000
X-Inumbo-ID: 54302927-54eb-11ea-86fe-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54302927-54eb-11ea-86fe-12813bfff9fa;
 Fri, 21 Feb 2020 20:47:10 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g19so3941931eds.11
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 12:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zYodKpkrvAkVFJp/LJC7DX/oW9zWLiCbbGx3UboJYCo=;
 b=ZZ5fXY25Yo2LDcSkilVbv5nPcYoAvPjcG70zbi38ZrGabKD+0VnAfxuLc/PRewZffj
 ZTaujLupxpDG4wJpQRhDCNKBbeCYbNvrhJcuXJdPLF2oWYzhVARZNfFmmyw0l2P0bNFi
 H1AY4BPnWBVBcBPrBeAGbVxQqsCjrDCGigxdA5cOmT5V8XK6lXg2Jw1XBKfaj8kYJ8Ir
 zn7kJfbN9+/cXfYt+NII2AR/lwlsPMvbIQsqWpOwQEjZmFV4ADAXMfu+B21toYe1/VV9
 zFuUJJ8Z9PAAWaUWWEWq4cdoRBnH9SpIDm4hvPKYfzrN0j9TKIT+h6RA3dkR2KSh81uJ
 BmOQ==
X-Gm-Message-State: APjAAAXzueKY7hUDVvYj7vvPtrlpM0BDmFs+u0WzcbAhCeGGfISH6mdH
 EmSrod6gvd5War5q1rcJ5Pc=
X-Google-Smtp-Source: APXvYqx80gLQnZ/kpGanCJPlPLXfb67y7M9nSeRVelxxfzFVWpVaGFWvYuOMtGGcWD5dBa0JMUN7gg==
X-Received: by 2002:a17:906:31c3:: with SMTP id
 f3mr35424843ejf.239.1582318029534; 
 Fri, 21 Feb 2020 12:47:09 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id s22sm329146ejm.43.2020.02.21.12.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 12:47:08 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <20200221112049.3077-4-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1eb0bb82-7ba0-87e7-9cf2-df2db1a43917@xen.org>
Date: Fri, 21 Feb 2020 20:47:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221112049.3077-4-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 3/6] public/xen.h: add a definition for a
 'valid domid' mask
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMi8yMDIwIDExOjIwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gQSBzdWJzZXF1ZW50
IHBhdGNoIHdpbGwgbW9kaWZ5IGxpYnhsIHRvIGFsbG93IHNlbGVjdGlvbiBvZiBhIHJhbmRvbSBk
b21pZAo+IHZhbHVlIHdoZW4gY3JlYXRpbmcgZG9tYWlucy4gVmFsaWQgdmFsdWVzIGFyZSBsaW1p
dGVkIHRvIGEgd2lkdGggb2YgMTUgYml0cywKPiBzbyBhZGQgYW4gYXBwcm9wcmlhdGUgbWFzayBk
ZWZpbml0aW9uIHRvIHRoZSBwdWJsaWMgaGVhZGVyLgo+IAo+IE5PVEU6IEl0IGlzIHJlYXNvbmFi
bGUgZm9yIHRoaXMgbWFzayBkZWZpbml0aW9uIHRvIGJlIGluIGEgWGVuIHB1YmxpYyBoZWFkZXIK
PiAgICAgICAgcmF0aGVyIHRoYW4gaW4sIHNheSwgYSBsaWJ4ZW5jdHJsIGhlYWRlciBzaW5jZSBp
dCByZWxhdGVzIHRvIHRoZQo+ICAgICAgICB2YWxpZGl0eSBvZiBhIHZhbHVlIHBhc3NlZCB0byBY
RU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbi4gVGhpcyBuZXcKPiAgICAgICAgZGVmaW5pdGlvbiBpcyBw
bGFjZWQgaW4geGVuLmggcmF0aGVyIHRoYW4gZG9tY3RsLmggb25seSB0byBjby1sb2NhdGUKPiAg
ICAgICAgaXQgd2l0aCBvdGhlciBkb21pZC1yZWxhdGVkIGRlZml0aW9ucy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
