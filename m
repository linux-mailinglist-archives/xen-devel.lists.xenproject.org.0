Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979C10FC9B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 12:43:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic6XE-00023j-FB; Tue, 03 Dec 2019 11:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+tL=ZZ=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ic6XC-0001po-UP
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 11:40:02 +0000
X-Inumbo-ID: a376be8c-15c1-11ea-81d9-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a376be8c-15c1-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 11:40:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so3181882wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 03:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xqGt7AQDGHNLwJ9/+DDGDovG2sRshi5dNp6vR7v4Fyk=;
 b=YWI/CcClL0JeWFG0qvmzCphIzINCPzGITPKQEzy1C0BZkZr+VV0zAOJ7Dy6KDk4zfa
 is52hsxBhG6wMORmI6nIqWSqkE42mQbKXDDxZHcnIFRH7X+yiDi7vE9HpBjJwapQP9V7
 O4aWVYduiSIxcgeMG2ozXA1Xg8wKHlaeSlTWfNswKS7c4PFwhTV9E+EYXehgCgjv1fuY
 m4TEItZZneByvUSL06Tg/YjjJLMa5F2HZ2fgBvgONGHnkV5iWM8joUlm1D4ezAFe1q7q
 bxBa8hXocCUNKd2c7QmI4gblyuoCb50dcrhADrrg4on/cwO6TdCjHOAHIAJOtWIBFhmF
 TLTg==
X-Gm-Message-State: APjAAAWsQBhucN6Ikb9kAWkVfqGQ5nn59hoZgyTO5r0SlZSEwOVSg2S+
 VpaUHjDu6RxqDecTSGL3ySEO3EKhJJQ=
X-Google-Smtp-Source: APXvYqz0v1igkMYY6np5FahPWzwWGPuF3j7Dn9Yj3mW0mr3/SUcnE3BLsEnlaonL1Gvm2DVUZ72u+g==
X-Received: by 2002:adf:d848:: with SMTP id k8mr4512147wrl.328.1575373199815; 
 Tue, 03 Dec 2019 03:39:59 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id p10sm2565523wmi.15.2019.12.03.03.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 03:39:59 -0800 (PST)
To: Yangtao Li <tiny.windzz@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, Andre Przywara <andre.przywara@arm.com>
References: <20191202084924.29893-1-tiny.windzz@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86d52917-1ba3-a660-2502-56b9657086b9@xen.org>
Date: Tue, 3 Dec 2019 11:39:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202084924.29893-1-tiny.windzz@gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: Basic support for sunxi/sun50i h6
 platform.
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCtBbmRyZSkKCkhpLAoKQEFuZHJlLCBJSVJDIHlvdSBvcmlnaW5hbGx5IGFkZGVkIHRoZSBzdXBw
b3J0IGZvciBzdW54aSBpbiBYZW4uIENvdWxkIAp5b3UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBwYXRj
aD8KCkNoZWVycywKCk9uIDAyLzEyLzIwMTkgMDg6NDksIFlhbmd0YW8gTGkgd3JvdGU6Cj4gYWRk
aW5nIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgaDYgU29DcywgU3BlY2lmaWNhbGx5IG9yYW5nZXBp
My4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDx0aW55LndpbmR6ekBnbWFpbC5jb20+
Cj4gLS0tID4gICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3N1bnhpLmMgfCAxICsKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cGxhdGZvcm1zL3N1bnhpLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3N1bnhpLmMKPiBpbmRl
eCA1NTcwNWIxNWIyLi5lOGU0ZDg4YmVmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvc3VueGkuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvc3VueGkuYwo+IEBA
IC0xMTksNiArMTE5LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzdW54aV92OF9kdF9j
b21wYXRbXSBfX2luaXRjb25zdCA9Cj4gICB7Cj4gICAgICAgImFsbHdpbm5lcixzdW41MGktYTY0
IiwKPiAgICAgICAiYWxsd2lubmVyLHN1bjUwaS1oNSIsCj4gKyAgICAiYWxsd2lubmVyLHN1bjUw
aS1oNiIsCj4gICAgICAgTlVMTAo+ICAgfTsKPiAgIAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
