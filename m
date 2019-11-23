Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308ED10800E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 19:44:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYaKd-00027A-4r; Sat, 23 Nov 2019 18:40:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYaKb-000275-7H
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 18:40:29 +0000
X-Inumbo-ID: b82cc590-0e20-11ea-b08b-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b82cc590-0e20-11ea-b08b-bc764e2007e4;
 Sat, 23 Nov 2019 18:40:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b18so12525020wrj.8
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 10:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=41yetpMdZaQ6G0L6XOVgxvrrjB5kTkHqGTx+rHXYM2w=;
 b=MvSBoc1IonQi/lVtXBO8CXRlA9X4Jfz/Y+kId+ZX9DYJIeZ7iy+mhJvCQVHaNeHnM8
 /k2YapTR+SjOCnjDhtTvDBiZTleUY5BzQW4frEHf9+y2XMbj6CaGkDKygHeyXYEIu8xc
 cCxv69Nu5MJvBCQG5JGBi5vHI/x+ZgI17PzFXxd0U+MC6nF3XrL8N1O63KBvz6D3n2yU
 Skk8e07qUzCLn+y4hDT3Kqsjzt7/NpGSmHm9LJa2hcdH2oGrTR/cI7WQuAPphMSrpw2M
 9wBt/qU3PZT5tTpps4pbmIlTRG26leX0HlGD25/OYARN1RTDPd+G/8nJ7Vpe1sHdXXRH
 tPqA==
X-Gm-Message-State: APjAAAUDyY36Xz9RN7nSgefq25zGFLrnJlC+Yrj6HADEDtO8TqNG63Wq
 C454hCgvIUBCvQasimif/7k=
X-Google-Smtp-Source: APXvYqyP2/911dNObALV8luiXaNnhAOlqN7+uIBxNi1YrwuzXtBK+FjXVP0shEu+vitcO6KlRPQ/lw==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr23594657wrr.207.1574534427627; 
 Sat, 23 Nov 2019 10:40:27 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id d16sm3420323wrg.27.2019.11.23.10.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 10:40:27 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115200115.44890-2-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <90d69e98-33d4-e821-4c11-a86e12799456@xen.org>
Date: Sat, 23 Nov 2019 18:40:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115200115.44890-2-stewart.hildebrand@dornerworks.com>
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

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjAxLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gRnJv
bTogSWFuIENhbXBiZWxsIDxpYW4uY2FtcGJlbGxAY2l0cml4LmNvbT4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBJYW4gQ2FtcGJlbGwgPGlhbi5jYW1wYmVsbEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBjaXRyaXguY29tPiBbMV0KPiBBY2tlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAZXUuY2l0cml4LmNvbT4gWzJd
CgpSZWdhcmRsZXNzIHRoZSBjb21wbGV4aXR5IG9mIHRoZSBwYXRjaCwgdGhpcyB3YXMgcmV2aWV3
ZWQgbmVhcmx5IDQgeWVhcnMgCmFnbyBhbmQgdGhlcmVmb3JlIHJldmlldyB0YWdzIG1heSBiZSBz
dGFsbCBldmVuIGlmIHRoZSByZXZpZXdlcnMgYXJlIHRoZSAKc2FtZS4KCkluZGVlZCwgdGhlIGNv
ZGUgYmFzZSBoYXMgY2hhbmdlZCBxdWl0ZSBhIGxvdCBhbmQgc29tZSBvZiB0aGUgcGF0Y2hlcyAK
bWF5IHJlcXVpcmUgbW9kaWZpY2F0aW9ucyB0byBmaXQgdGhlIGRpcmVjdGlvbiBvZiB0aGUgcHJv
amVjdC4KCkFueXdheSwgZm9yIHRoaXMgcGF0Y2g6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAeGVuLm9yZz4KCkkgd2lsbCBjb21taXQgaXQgaW4gbXkgYnJhbmNoIGZvci1u
ZXh0LzQuMTQgYW5kIHdpbGwgbWVyZ2UgaXQgb25jZSA0LjEzIApoYXMgYmVlbiByZWxlYXNlZC4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
