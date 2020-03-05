Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F5217AA8D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 17:34:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9tP0-0005l9-2T; Thu, 05 Mar 2020 16:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OfCS=4W=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9tOy-0005l4-0h
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 16:31:12 +0000
X-Inumbo-ID: b93116f6-5efe-11ea-8eb5-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b93116f6-5efe-11ea-8eb5-bc764e2007e4;
 Thu, 05 Mar 2020 16:31:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id i9so7048194wml.4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 08:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mC61xGevoIv1oSWVH7eUm/iM/52mFLDRZ62OVWTSVKc=;
 b=oXhSo656TwzOLkDOhL92SM0BQZqo35ggDC5O+/6B0I2lJBTRQHLW8n3ONBJv0yVlis
 jYD5aSmvFXz4LDWe8OAq0MyesRDfLMvirrUa2lRuhqJkZgHEzrEh6J5Z74VrZi58P3nq
 sY4fM37Rpbg/6eEaKfZuHjb6LIyDdv6Hrnqesm75h1zMciOvUZkNySJN8Y3UzHsNzqUb
 A0XxwsizHK6CuLzJN59VQLyFt0bOk+gGQA1fwtamBTmDSM+UkaUPyWNXETOrtuSCdP5X
 wc6PEoA/o2BgGc6UuXR3EjDcCtrYURalDnzfmHlS5iiAeuImI2igxSK3ATYyuUhcFHGZ
 TYjA==
X-Gm-Message-State: ANhLgQ1Kb0ez0zjQHE93dlwGbPqRJNNsLIsl48w9nVShJS7R57jm0aHR
 FUHYtrn2dc86kx3qNTL7beg=
X-Google-Smtp-Source: ADFU+vsQLpQlEO8kXF5NEehzNChy+l/eTb/XENrgW6hmcK6Eb/xV1tGUDSwgPVwgnlGi56wIK33JrA==
X-Received: by 2002:a05:600c:215:: with SMTP id
 21mr10362106wmi.119.1583425869663; 
 Thu, 05 Mar 2020 08:31:09 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id l3sm44908236wrq.62.2020.03.05.08.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 08:31:09 -0800 (PST)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
 <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
 <e194bb44-9d71-070e-7ef7-47dd1a21c56e@xen.org>
 <20200305155929.GA15912@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5b18ad90-8b2e-6e10-96a4-675650355a16@xen.org>
Date: Thu, 5 Mar 2020 16:31:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305155929.GA15912@perard.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCk9uIDA1LzAzLzIwMjAgMTU6NTksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+
IE9uIFRodSwgTWFyIDA1LCAyMDIwIGF0IDAzOjAyOjIyUE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4gSGkgSmFuLAo+Pgo+Pj4+ICAgIHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDE5ICsrKysrKysrLS0tLS0tLS0tLS0KPj4+PiAgICB4ZW4vYXJjaC9hcm0vTWFr
ZWZpbGUgICAgICAgICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQo+Pj4+ICAgIHhlbi9hcmNo
L2FybS9hcm0zMi9NYWtlZmlsZSAgICAgICAgICB8ICAyICstCj4+Pj4gICAgeGVuL2FyY2gvYXJt
L2FybTY0L01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KPj4+Cj4+PiBKdWxpZW4sIFN0ZWZhbm8g
LSBhbnkgY2hhbmNlIG9mIGdldHRpbmcgYW4gYWNrIGhlcmU/Cj4+Cj4+IFN0ZXdhcnQgcG9pbnRl
ZCBvbmUgYnVpbGQgaXNzdWUgb24gQXJtIGluIHRoZSBjb3ZlciBsZXR0ZXIuIEkgYW0gbm90IHN1
cmUKPj4gd2hlcmUgdGhlIGJ1ZyBsaWVzLCBzbyBJIHdvdWxkIGxpa2UgdG8gaG9sZCBvZmYgbXkg
YWNrIHVudGlsIHNvbWVvbmUgZmlndXJlCj4+IG91dCB3aGF0J3MgZ29pbmcgb24uCj4gCj4gVGhl
IGJ1ZyBpcyBpbiBwYXRjaCAiW1hFTiBQQVRDSCB2MyAxNS8yM10geGVuL2J1aWxkOiBoYXZlIHRo
ZSByb290Cj4gTWFrZWZpbGUgZ2VuZXJhdGVzIHRoZSBDRkxBR1MiLiBTbyB0aGlzIHBhdGNoIGlz
IGZpbmUgOi0pLgoKRmluZSA6KS4gVGhhbmsgeW91IGZvciBsb29raW5nIGF0IGl0LiBZb3UgY2Fu
IGFkZCBteSBBY2tlZC1ieSBvbiB0aGlzIHBhdGNoOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8
amdyYWxsQGFtYXpvbi5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
