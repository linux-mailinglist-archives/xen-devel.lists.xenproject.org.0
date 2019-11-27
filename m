Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1713E10B4D8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:52:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia1S0-0006w8-Np; Wed, 27 Nov 2019 17:50:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWg5=ZT=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ia1Ry-0006jx-Oj
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:50:02 +0000
X-Inumbo-ID: 55bf3bba-113e-11ea-a3ba-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55bf3bba-113e-11ea-a3ba-12813bfff9fa;
 Wed, 27 Nov 2019 17:50:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so8009241wmj.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 09:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A4EA+NoICG+28wBZZweLvMB6FgpZ621/AH6uT9WAPow=;
 b=G9isYYvevruWOw0WC5F6ANaP29FeZSXpZj5XazcQxzooaeHBHvTj4V+8Y44V/x7nJV
 +Ur9Gd4Nkmjs7CS1DUhK5xPBkA0BBDuyheH/3ihy009BUuoG5FwCLeY/X1QbAWK4je2I
 b44UBmgTsks9er2QeUMXpuhBw/RQf0mZi4u4LSj5FTxse5MWFhOb4ghoDBLjKvHRXLcC
 pwVWdRxn+tS936k9Eb9vBcy6IwWnl2+c1J4/MdKiUq6By4BtB+66EwAEPqJW7rNROH28
 oLQ+/0Pr584c22xtKhbXpGSV223uz1ILw5WIHCveLR/LOayxcIpQ5o+e5iYg/FYyq4iW
 fbeQ==
X-Gm-Message-State: APjAAAX69IyzpKq6wQ7u2xUVA7z6T82mMHx6rJ+945z4cl/d28UoLRUT
 RIKxmT42HwkVcsv/kLDHDiA=
X-Google-Smtp-Source: APXvYqyv8oPkzJq5Q1g/e/BWM7L3tLKeJYhOK72yFIS8bZGrlj2EkDMR85L6j1veg2KbO+Uzk3at4g==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr2487349wme.44.1574877000795; 
 Wed, 27 Nov 2019 09:50:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id y11sm20089910wrq.12.2019.11.27.09.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 09:49:59 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-2-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <646dee52-f156-b570-7ac1-419bd42f1b18@xen.org>
Date: Wed, 27 Nov 2019 17:49:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115201037.44982-2-stewart.hildebrand@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 06/11] Add NR_SGIS and NR_PPIS
 definitions to irq.h
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

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjEwLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gVGhl
c2Ugd2lsbCBiZSB1c2VkIGluIGEgZm9sbG93LXVwIHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4K
PiAtLS0KPiB2MzogbmV3IHBhdGNoCj4gLS0tCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5o
IHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmggYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2lycS5oCj4gaW5kZXggM2IzN2EyMWMwNi4uMzY3ZmU2MjY5YyAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9pcnEuaAo+IEBAIC0zMyw3ICszMyw5IEBAIHN0cnVjdCBhcmNoX2lycV9kZXNjIHsKPiAg
ICAgICB1bnNpZ25lZCBpbnQgdHlwZTsKPiAgIH07Cj4gICAKPiAtI2RlZmluZSBOUl9MT0NBTF9J
UlFTCTMyCj4gKyNkZWZpbmUgTlJfU0dJUyAgICAgICAgIDE2Cj4gKyNkZWZpbmUgTlJfUFBJUyAg
ICAgICAgIDE2Cj4gKyNkZWZpbmUgTlJfTE9DQUxfSVJRUyAgIChOUl9TR0lTICsgTlJfUFBJUykK
CldlIGhhdmUgYWxyZWFkeSBOUl9HSUNfU0dJIChzZWUgaW5jbHVkZS9hc20tYXJtL2dpYy5oKSBh
bmQgVkdJQ19OUl9TR0lTIAooc2VlIGluY2x1ZGUvYXNtLWFybS9uZXdfdmdpYy5oKS4KClNvIEkg
d291bGQgcmF0aGVyIG5vdCB3YW50IHRvIGRlZmluZSB0aGUgc2FtZSB2YWx1ZSAod2l0aCB0aGUg
c2FtZSAKbWVhbmluZykgYSB0aGlyZCB0aW1lLgoKTm90ZSB0aGF0IEkgYW0gb2sgaWYgdGhlIHR3
byBleGlzdGluZyBvbmUgYXJlIGRyb3BwZWQgaW4gZmF2b3Igb2YgTlJfU0dJUy4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
