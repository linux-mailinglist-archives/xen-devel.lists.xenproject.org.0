Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A129510957B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 23:20:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZMfz-0001CC-A9; Mon, 25 Nov 2019 22:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQY9=ZR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZMfx-0001C7-Qf
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 22:17:45 +0000
X-Inumbo-ID: 6780e056-0fd1-11ea-b08b-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6780e056-0fd1-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 22:17:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n188so1078126wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 14:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9EpEyryOn67kmIw2jkhRN81hNLCR15j1JvcgFy/ouqU=;
 b=jK9tJlMq5BYdi2kaHAY1gvswPVILY0S3huVF0M1NX3Cc8PYlW/HSKFEQgjHQkUDQiX
 3HavnCgz3EeFaxr1BQGJGD8qtyiNPvi7olvnrs+cI1HUaGNhdEp2c9yvOlHQBM0qio5+
 AbFjRGuNXafuZoZdWHaBfKA6TYQ/IB6kE4uX++o2naafY+tqRC0VfhF8+rfTKE09zq2v
 1VcNHaahLhH2KmBLGFyMkYZxCqy4XPIxbRQCgqV9Zqtj79ScqRqEEzUozNpvYW1wxjCt
 yvrG/RiRU2AyT9jD53H7sseiwh/WzpQ8GUNrUwbQflLuXDPhck0uS2/cKacQZL7nPPO9
 +bcA==
X-Gm-Message-State: APjAAAVrURz+q1pDSSxdFN8kqzdGGyvIi6wG0UX/KGj4XZzcUl7AgrLI
 sdAJA47p+FXvEN2N9lDeghU=
X-Google-Smtp-Source: APXvYqwbxpEgu9eDhctGIgL5kq53C6681DyhPP6VT/Pu6xjR/FI7kuUUXVbAZ2C9SSxWL309mgB4hA==
X-Received: by 2002:a1c:9986:: with SMTP id b128mr993041wme.154.1574720264387; 
 Mon, 25 Nov 2019 14:17:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id e16sm741836wme.35.2019.11.25.14.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 14:17:43 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191125205800.64602-1-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <750f31db-87d8-65ba-bf4d-eff3471d1143@xen.org>
Date: Mon, 25 Nov 2019 22:17:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125205800.64602-1-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: initialize vpl011 flag register
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNS8xMS8yMDE5IDIwOjU4LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IFRoZSB0eC9y
eCBmaWZvIGZsYWdzIHdlcmUgbm90IHNldCB3aGVuIHRoZSB2cGwwMTEgaXMgaW5pdGlhbGl6ZWQu
IFRoaXMKPiBpcyBhIHByb2JsZW0gZm9yIGNlcnRhaW4gZ3Vlc3RzIHRoYXQgYXJlIG9wZXJhdGlu
ZyBpbiBwb2xsZWQgbW9kZSwgYXMgYQo+IGd1ZXN0IHdpbGwgZ2VuZXJhbGx5IGNoZWNrIHRoZSBy
eCBmaWZvIGVtcHR5IGZsYWcgdG8gZGV0ZXJtaW5lIGlmIHRoZXJlCj4gaXMgZGF0YSBiZWZvcmUg
ZG9pbmcgYSByZWFkLiBUaGUgcmVzdWx0IGlzIGEgY29udGludW91cyBzcGFtIG9mIHRoZQo+IG1l
c3NhZ2UgInZwbDAxMTogVW5leHBlY3RlZCBJTiByaW5nIGJ1ZmZlciBlbXB0eSIgYmVmb3JlIHRo
ZSBmaXJzdCB2YWxpZAo+IGNoYXJhY3RlciBpcyByZWNlaXZlZC4gVGhpcyBpbml0aWFsaXplcyB0
aGUgZmxhZyBzdGF0dXMgcmVnaXN0ZXIgdG8gdGhlCj4gZGVmYXVsdCBzcGVjaWZpZWQgaW4gdGhl
IFBMMDExIHRlY2huaWNhbCByZWZlcmVuY2UgbWFudWFsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpl
ZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgoKWW91IGNvdWxkIGhh
dmUgcmV0YWluZWQgbXkgYWNrZWQtYnkgaGVyZSA6KS4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPgoKV2UgYXJlIGluIGxhdGUgc3RhZ2UgZm9yIFhlbiA0LjEzIGFuZCBm
cm9tIHdoYXQgeW91IHNheSB0aGlzIHdpbGwgb25seSAKc3BhbSB0aGUgY29uc29sZSAodGhvdWdo
IGl0IGlzIHJhdGUtbGltaXRlZCkuIFNvIEkgZG9uJ3QgaW50ZW5kIHRvIApyZXF1ZXN0IHRvIGJl
IG1lcmdlZCBpbiBYZW4gNC4xMyAoZmVlbCBmcmVlIHRvIHJlcXVlc3QgaXQgaWYgeW91IHRoaW5r
IAppdCBpcyB3b3J0aCBpdCkuCgpJbnN0ZWFkLCBJIHdpbGwgcXVldWUgaXQgZm9yIHRoZSBuZXh0
IHJlbGVhc2UgaW4gbXkgYnJhbmNoIGZvci1uZXh0LzQuMTQuCgo+IAo+IENoYW5nZXMgaW4gdjI6
Cj4gLSBNb3ZlZCB1YXJ0ZnIgaW5pdGlhbGl6YXRpb24gdG8gbGF0ZXIgcG9pbnQgaW4gZnVuY3Rp
b24gYWZ0ZXIgcG90ZW50aWFsCj4gcmV0dXJuL2ZhaWx1cmUgcG9pbnRzCldlIGRvbid0IGNvbW1p
dCB0aGUgY2hhbmdlbG9nLiBUbyBoZWxwIG1ha2luZyB0aGUgY29tbWl0dGVycyBsaWZlIApib3Jp
bmcsIEkgd291bGQgcmVjb21tZW5kIHRvIGFkZCAtLS0gYmVmb3JlIGl0LiBnaXQgYW0gd2lsbCBz
dHJpcHBlZCAKYW55dGhpbmcgYWZ0ZXIgaXQuCgo+IC0tLQoKU2ltaWxhciB0byB0aGlzIG9uZS4K
Cj4gICB4ZW4vYXJjaC9hcm0vdnBsMDExLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cGwwMTEuYyBiL3hl
bi9hcmNoL2FybS92cGwwMTEuYwo+IGluZGV4IDdiYzVlZWIyMDcuLjg5NWY0MzZjYzQgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwbDAxMS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3ZwbDAx
MS5jCj4gQEAgLTY2OCw2ICs2NjgsOCBAQCBpbnQgZG9tYWluX3ZwbDAxMV9pbml0KHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCB2cGwwMTFfaW5pdF9pbmZvICppbmZvKQo+ICAgICAgICAgICBnb3Rv
IG91dDI7Cj4gICAgICAgfQo+ICAgCj4gKyAgICB2cGwwMTEtPnVhcnRmciA9IFRYRkUgfCBSWEZF
Owo+ICsKPiAgICAgICBzcGluX2xvY2tfaW5pdCgmdnBsMDExLT5sb2NrKTsKPiAgIAo+ICAgICAg
IHJlZ2lzdGVyX21taW9faGFuZGxlcihkLCAmdnBsMDExX21taW9faGFuZGxlciwKPiAKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
