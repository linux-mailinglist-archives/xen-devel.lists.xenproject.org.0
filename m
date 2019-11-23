Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684B108024
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 20:31:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYb4t-0005q6-FZ; Sat, 23 Nov 2019 19:28:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYb4s-0005q1-Fz
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 19:28:18 +0000
X-Inumbo-ID: 66782fc6-0e27-11ea-a37e-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66782fc6-0e27-11ea-a37e-12813bfff9fa;
 Sat, 23 Nov 2019 19:28:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so10079148wmf.2
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 11:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mBnW+gDUfTA8EbrqUBh0sdEW2JIjc7NmSD0mqhWuSC4=;
 b=WZIM1YPreiEXr5lelkivnsbgB61whJ4CTNgxppt2ZdDhfGdpnlvJZtHLYSOIwZRNSU
 ll/SUqbLIhQK/ErcVrH4ZEg63sZwS29tKMSPqwxK9YEVqq/O7ukmVRdv+1ZIX9xwFae1
 WnzUMon7Fuov1m/L10h0IfGXXFf7BNoapYJdFnRYCdhgCGN3u/mhYU++LzrhvHFHpiqE
 izgygvxAKTxbHLBa+VUVAK9NGxlX/jNyAWeHbsr5BnNDB4raN8GtGHndZ2TCk0XBQq7v
 iO9XgU9PaqkQskXzHyiyfWseAYElGEmWKlbHO5maaGPgVRrpyd7cq0623PgzoU0HcZq0
 phSg==
X-Gm-Message-State: APjAAAXzuN0yF0JEzfSEsmE3l0j7XtOO1RyZLDxYiOP5OgWfjGrr0RPB
 UAvHOIB/bugqbC7hiDcY0g4=
X-Google-Smtp-Source: APXvYqyCJnvy4HnLslJJYnhYKCXMJM5YAsTwj5JWD75SkFVHjiGargeJ2BMmPZjP9OxjZfJ61vEqTA==
X-Received: by 2002:a1c:6686:: with SMTP id a128mr8834228wmc.169.1574537297100; 
 Sat, 23 Nov 2019 11:28:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id b15sm3054186wrx.77.2019.11.23.11.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 11:28:16 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115200115.44890-5-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e9a55900-fbe9-bade-54ca-0adc82e2c87d@xen.org>
Date: Sat, 23 Nov 2019 19:28:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115200115.44890-5-stewart.hildebrand@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 04/11] xen: arm: remove
 is_assignable_irq
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

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjAxLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gSXQg
b25seSBoYWQgMSBjYWxsZXIuCklmIHRoaXMgaXMgdGhlIG9ubHkgcmVhc29uLCB0aGVuIEkgd291
bGQgcHJlZmVyIHRvIGtlZXAgaXQgYXMgaXQgbWFrZXMgCmVhc2llciB0byByZWFzb24uIFNvIGFy
ZSB5b3UgcmVtb3ZpbmcgaXQgYmVjYXVzZSB0aGUgZnVuY3Rpb24gCmlzX2Fzc2lnbmFibGVfaXJx
KCkgYW5kIHJvdXRlX2lycV90b19ndWVzdCgpIGFyZSBub3QgZ29pbmcgdG8gYmUgcmUtdXNlZCAK
Zm9yIFBQSXM/CgpJZiBzbywgd2Ugc2hvdWxkIHJlbmFtZSB0aGUgZnVuY3Rpb24gcm91dGVfaXJx
X3RvX2d1ZXN0KCkgdG8gY2xhcmlmeSAKdGhpcyBjYW4gb25seSBiZSB1c2VkIG9uIFNQSXMuCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
