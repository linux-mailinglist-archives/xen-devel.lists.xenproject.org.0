Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A490109428
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 20:23:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZJu3-0004AJ-PV; Mon, 25 Nov 2019 19:20:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQY9=ZR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZJu2-00045k-H4
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 19:20:06 +0000
X-Inumbo-ID: 94bf72ef-0fb8-11ea-a394-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94bf72ef-0fb8-11ea-a394-12813bfff9fa;
 Mon, 25 Nov 2019 19:20:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u18so537387wmc.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 11:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4/wwnJwtsZDjk8eGhUhB9TNJhdD34c8xSJNlmbK8Lg=;
 b=teyAspen4tHm8QfAofw/0JSeDlAGjuZgYlyrEFl7LNU9eSDfJP76FL4dbixeeDZgzQ
 6JKjyfVbMUOLmEi58TFNXy69vQac5dxbMj1MrAt895BBhvaPyKlEGilXQ3ZNJ6L2bAGK
 auIaUkFTkEaUeHEvDVYZ1vhyaS9uOA0wIqnuDh+enShKkF/UuEAbCqVhwXqhCej/xatU
 0kM6h21ey8EpokVu4Cq/zziPRHZy2Vu/ykbfedwKKX8CFwMUA3aiZN6CEVXuIUBChGM7
 L0k2rk418r59EhsIZmmD7YOzchUcqyweI7zwP37QMgcNVMg/YTVRHahYeFZmDcOl8nRh
 Xfvg==
X-Gm-Message-State: APjAAAVWx7JKmauzc38lgIyqk/plNcLO8Jh69G62kkRKFNJ7DGtoyjTw
 +/ycVbrAc9qh/S4JU3wSV/I=
X-Google-Smtp-Source: APXvYqy+vETh4zuOXrNCq0aSth8bRSyCzrBCJUbgY4t7BKnHQtIFLYq8TdQjz0khg6jQ8frtfADaYg==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr450589wmk.8.1574709604111;
 Mon, 25 Nov 2019 11:20:04 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id t12sm11155922wrx.93.2019.11.25.11.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 11:20:03 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191125183520.126404-1-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <091f3626-8ee4-81bd-5031-3b57cf038b57@xen.org>
Date: Mon, 25 Nov 2019 19:20:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125183520.126404-1-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: initialize vpl011 flag register
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

SGksCgpPbiAyNS8xMS8yMDE5IDE4OjM1LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IFRoZSB0eC9y
eCBmaWZvIGZsYWdzIHdlcmUgbm90IHNldCB3aGVuIHRoZSB2cGwwMTEgaXMgaW5pdGlhbGl6ZWQu
IFRoaXMKPiBpcyBhIHByb2JsZW0gZm9yIGNlcnRhaW4gZ3Vlc3RzIHRoYXQgYXJlIG9wZXJhdGlu
ZyBpbiBwb2xsZWQgbW9kZSwgYXMgYQo+IGd1ZXN0IHdpbGwgZ2VuZXJhbGx5IGNoZWNrIHRoZSBy
eCBmaWZvIGVtcHR5IGZsYWcgdG8gZGV0ZXJtaW5lIGlmIHRoZXJlCj4gaXMgZGF0YSBiZWZvcmUg
ZG9pbmcgYSByZWFkLiBUaGUgcmVzdWx0IGlzIGEgY29udGludW91cyBzcGFtIG9mIHRoZQo+IG1l
c3NhZ2UgInZwbDAxMTogVW5leHBlY3RlZCBJTiByaW5nIGJ1ZmZlciBlbXB0eSIgYmVmb3JlIHRo
ZSBmaXJzdCB2YWxpZAo+IGNoYXJhY3RlciBpcyByZWNlaXZlZC4gVGhpcyBpbml0aWFsaXplcyB0
aGUgZmxhZyBzdGF0dXMgcmVnaXN0ZXIgdG8gdGhlCj4gZGVmYXVsdCBzcGVjaWZpZWQgaW4gdGhl
IFBMMDExIHRlY2huaWNhbCByZWZlcmVuY2UgbWFudWFsLgoKTm90ZSB0aGF0IHRoZSB2cGwwMTEg
aXMgbm90IG1lYW50IHRvIGVtdWxhdGUgYSBmdWxsIFBMMDExLiBJbnN0ZWFkIGl0CmVtdWxhdGVz
IHRoZSBTQlNBIFVBUlQgd2hpY2ggaXMgYSBzdWJzZXQgb2YgdGhlIFBMMDExLiBUaGV5IGhhdmUg
c29tZSAKZGlmZmVyZW5jZXMgYW5kIEkgd291bGQgYmUgY2F1dGlvdXMgdG8gdHJ5IHRvIGRyaXZl
IGl0IGFzIGEgUEwwMTEuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplZmYgS3ViYXNjaWsgPGplZmYu
a3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3ZwbDAxMS5j
IHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMgYi94ZW4vYXJjaC9hcm0vdnBsMDExLmMKPiBpbmRl
eCA3YmM1ZWViMjA3Li4zMWI3ZDU2ZDdkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS92cGww
MTEuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwo+IEBAIC02MjYsNiArNjI2LDggQEAg
aW50IGRvbWFpbl92cGwwMTFfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdnBsMDExX2lu
aXRfaW5mbyAqaW5mbykKPiAgICAgICBpZiAoIHZwbDAxMS0+YmFja2VuZC5kb20ucmluZ19idWYg
KQo+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgIAo+ICsgICAgdnBsMDExLT51YXJ0ZnIg
PSBUWEZFIHwgUlhGRTsKCkkga25vdyB0aGF0IGl0IGRvZXMgbm90IG1ha2UgbXVjaCBkaWZmZXJl
bmNlLCBidXQgSSB3b3VsZCBwcmVmZXIgaWYgCnVhcnRmciBpcyBpbml0aWFsaXplZCBvbmNlIHdl
IGtub3cgbm90aGluZyBlbHNlIGNhbiBmYWlsLgoKV2l0aCBvciB3aXRob3V0IHRoaXMgc3VnZ2Vz
dGlvbjoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbCA8anVsaWVuQHhlbi5vcmc+CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
