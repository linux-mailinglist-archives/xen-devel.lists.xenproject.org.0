Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C413B49B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 22:47:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irTzL-0006hD-U4; Tue, 14 Jan 2020 21:44:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irTzK-0006h8-2V
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 21:44:38 +0000
X-Inumbo-ID: 0f16578a-3717-11ea-8479-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f16578a-3717-11ea-8479-12813bfff9fa;
 Tue, 14 Jan 2020 21:44:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so13763169wrq.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 13:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ue7S4P/q666m6AIvnf+nUt0jgeHtyiC9jpkmOzEGk80=;
 b=iucrALZplcy6PP0STsZbhUQ8LWFqNviz8HFslcStKgFCvJFpjHyeQk409EkZEKB04g
 ujf24AyyP+ZEXLGAF1tD5KX4P20uuPsHtPNpJWiDfvEllxvAPHvEVJVU0RsGBqPqLI+2
 AtfLn4cvlLBBy2hewaxUBjKAgzASeZyvmrT5xeiOq5lJ5N8lAW010EFyYA+Sdh9pQ/Jt
 NA5AtzujUedpp5GFWIoq25I0nCAMqTE564NQE+QCe0Wz5xQniTv0KE0mHR1iNHAUW9Bd
 lWBS3qAHlsTQQUVlqVEFwEQwLumfnEDVrQSpBr8ZRaOKVQyWiC2E12M3ltzYm/jlT1LZ
 qrRw==
X-Gm-Message-State: APjAAAVCFF2gNuiU6UQNTy7qkXXNy+UIdW9fMY6MKYTsU5qefeBOwE0Y
 YpNuc4jfYqnqYiTQGjhP1aHwA+TfjPNtCg==
X-Google-Smtp-Source: APXvYqwVVwutrVmT/5H1oMrTN6HbdwGXU1mBbaGn4dB42eNaomKnQKiRDOR2Ps9jFoHEmYnHnov/vQ==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr26323135wrr.138.1579038276144; 
 Tue, 14 Jan 2020 13:44:36 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id c2sm21389083wrp.46.2020.01.14.13.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:44:35 -0800 (PST)
To: Brian Woods <brian.woods@xilinx.com>, xen-devel@lists.xenproject.org
References: <1578619590-3661-1-git-send-email-brian.woods@xilinx.com>
 <1578619590-3661-2-git-send-email-brian.woods@xilinx.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1567bba4-f984-acb6-0a04-8f5e13aa5ef5@xen.org>
Date: Tue, 14 Jan 2020 21:44:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578619590-3661-2-git-send-email-brian.woods@xilinx.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC 1/2] arm,
 smmu: add support for iommu_fwspec functions
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQnJpYW4sCgpPbiAxMC8wMS8yMDIwIDAxOjI2LCBCcmlhbiBXb29kcyB3cm90ZToKPiBNb2Rp
ZnkgdGhlIHNtbXUgZHJpdmVyIHNvIHRoYXQgaXQgdXNlcyB0aGUgaW9tbXVfZndzcGVjIGhlbHBl
cgo+IGZ1bmN0aW9ucy4gIFRoaXMgbWVhbnMgYm90aCBBUk0gSU9NTVUgZHJpdmVycyB3aWxsIGJv
dGggdXNlIHRoZQo+IGlvbW11X2Z3c3BlYyBoZWxwZXIgZnVuY3Rpb25zLCBtYWtpbmcgZW5hYmxp
bmcgZ2VuZXJpYyBkZXZpY2UgdHJlZQo+IGJpbmRpbmdzIGluIHRoZSBTTU1VIGRyaXZlciBtdWNo
IGNsZWFuZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQHhp
bGlueC5jb20+Cj4gLS0tCj4gUkZDIGVzcGVjaWFsbHkgd2FudGVkIG9uOgo+ICAgIC0gQ2hlY2sg
aW4gZGV2aWNlX3RyZWUuYy4gIFRoaXMgaXMgbmVlZGVkLCBvdGhlcndpc2UgaXQgd29uJ3QgYm9v
dCBkdWUKPiAgICAgIHRvIGRldl9pb21tdV9md3NwZWNfZ2V0KGRldikgYmVpbmcgdHJ1ZSBhbmQg
cmV0dXJuaW5nIEVFWElTVC4gIEknbQo+ICAgICAgbm90IGNvbXBsZXRlbHkgc3VyZSB3aGF0IHR5
cGUgb2YgY2hlY2sgaXMgYmVzdCBoZXJlLgoKSSBndWVzcyB0aGlzIGJlY2F1c2UgdGhlIG1hc3Rl
cnMgYXJlIHJlZ2lzdGVyZWQgZHVyaW5nIHRoZSAKaW5pdGlhbGl6YXRpb24gb2YgdGhlIFNNTVUu
IENvdWxkIHdlIGluc3RlYWQgbG9vayBhdCByZWdpc3RlcmluZyB0aGVtIApmcm9tIHRoZSBhZGRf
ZGV2aWNlIGNhbGxiYWNrPwoKSSB1bmRlcnN0YW5kIHRoaXMgd291bGQgbWVhbiB0byBnbyB0aHJv
dWdoIGFsbCB0aGUgU01NVSBhbmQgcmVxdWlyZSBhIApiaXQgbW9yZSB3b3JrLiBCdXQgSSB0aGlu
ayBpdCB3aWxsIGhlbHAgbG9uZ2VyIHRlcm0gYXMgdGhlIHdvcmtmbG93IGZvciAKcmVnaXN0ZXJp
bmcgYSBtYXN0ZXIgd291bGQgYmUgc2ltaWxhciB3aGV0aGVyIGxlZ2FjeSBvciBnZW5lcmljIGJp
bmRpbmdzIAphcmUgdXNlZC4KCkBTdGVmYW5vIGFueSBvcGluaW9ucz8KCj4gCj4gICB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jICAgIHwgNzQgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMg
fCAgMyArKyA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKPiBpbmRleCA5NDY2MmE4Li5j
NWRiNWJlIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMK
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gQEAgLTQ5LDYgKzQ5
LDcgQEAKPiAgICNpbmNsdWRlIDxhc20vYXRvbWljLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2Rldmlj
ZS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9pby5oPgo+ICsjaW5jbHVkZSA8YXNtL2lvbW11X2Z3c3Bl
Yy5oPgo+ICAgI2luY2x1ZGUgPGFzbS9wbGF0Zm9ybS5oPgo+ICAgCj4gICAvKiBYZW46IFRoZSBi
ZWxvdyBkZWZpbmVzIGFyZSByZWRlZmluZWQgd2l0aGluIHRoZSBmaWxlLiBVbmRlZiBpdCAqLwo+
IEBAIC01OTcsOCArNTk4LDcgQEAgc3RydWN0IGFybV9zbW11X3NtciB7Cj4gICB9Owo+ICAgCj4g
ICBzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyX2NmZyB7Cj4gLQlpbnQJCQkJbnVtX3N0cmVhbWlkczsK
PiAtCXUxNgkJCQlzdHJlYW1pZHNbTUFYX01BU1RFUl9TVFJFQU1JRFNdOwoKTm93IHRoYXQgd2Ug
dXNlIGZ3c3BlYywgZG8gd2UgcmVhbGx5IG5lZWQgdG8ga2VlcCB0aGUgCk1BWF9NQVNURVJfU1RS
RUFNSURTIGxpbWl0PwoKPiArCXN0cnVjdCBpb21tdV9md3NwZWMJCSpmd3NwZWM7CgpOSVQ6IENh
biB0aGUgY29udGVudCBiZSBjb25zdD8KCj4gICAJc3RydWN0IGFybV9zbW11X3NtcgkJKnNtcnM7
Cj4gICB9Owo+ICAgCj4gQEAgLTc3OSw3ICs3NzksNyBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX3Nt
bXVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsCj4gICAJCQkJc3RydWN0IGRl
dmljZSAqZGV2LAo+ICAgCQkJCXN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKm1hc3RlcnNwZWMpCj4g
ICB7Cj4gLQlpbnQgaTsKPiArCWludCBpLCByZXQgPSAwOwo+ICAgCXN0cnVjdCBhcm1fc21tdV9t
YXN0ZXIgKm1hc3RlcjsKPiAgIAo+ICAgCW1hc3RlciA9IGZpbmRfc21tdV9tYXN0ZXIoc21tdSwg
bWFzdGVyc3BlYy0+bnApOwo+IEBAIC03OTgsMjYgKzc5OCwzNyBAQCBzdGF0aWMgaW50IHJlZ2lz
dGVyX3NtbXVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsCj4gICAJfQo+ICAg
Cj4gICAJbWFzdGVyID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptYXN0ZXIpLCBHRlBfS0VS
TkVMKTsKPiAtCWlmICghbWFzdGVyKQo+ICsJaWYgKCFtYXN0ZXIpIHsKPiAgIAkJcmV0dXJuIC1F
Tk9NRU07Cj4gKwl9CgpOSVQ6IE1heSBJIGFzayB3aHkgZGlkIHlvdSBhZGQgdGhlIHt9IGhlcmU/
CgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
