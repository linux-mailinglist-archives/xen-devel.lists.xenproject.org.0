Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59B10AFC8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:49:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZwiM-0002LR-Qy; Wed, 27 Nov 2019 12:46:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWg5=ZT=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZwiL-0002LL-55
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 12:46:37 +0000
X-Inumbo-ID: f2162710-1113-11ea-a55d-bc764e2007e4
Received: from mail-wr1-f51.google.com (unknown [209.85.221.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2162710-1113-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 12:46:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z3so26509519wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 04:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/2kIb8WWDi1hmh+SMoRw4BjUmtebjFzQ6NguwuQYzds=;
 b=UTsfxuD/wnbj8RKKcFSFUYJbCtlVA9SCPAGp0syEWrO5nU9mtEcU0nH2zwKFoUT4az
 pWnu2FZI/qEPrOSo1FjoLbqBdfpmxSeNx3mNHOoZ4Pz/DhqkT0WkjD8g1t6cfDLgdbf3
 jRoOyYqgff0Ou19EV0XTh5VlOQU2Vw0f+YdUzJKjbfBM5pySP+9EKKFzMk4Sf2k+4kra
 aBRblBqoOLOtQNcdiI7zdSLiDxNPAjpyIs5O4dymY3HjOcosR6/9lXnX5nnkhGTc1YSc
 1SOJvoqxpoTNplfkC7p3YpJSHSQWRdbdPF/WcK4/7rFL1z89losThTZWl77OP9hwZ5Jc
 JtQg==
X-Gm-Message-State: APjAAAW5XjT8AiipeTN5V04gySvaySTNWE0u0FnyaQMjq5DD9fOMMTon
 DHj2j9pK9Q+mhrR3aRKn7uw=
X-Google-Smtp-Source: APXvYqwvLi+46Oteq0n6OT2P2D7BtmlQfpx+QGBwZ/iMerq0GK8TJcfCPm3HdbSKPPQ6ge0ir1zQCw==
X-Received: by 2002:adf:e2cd:: with SMTP id d13mr42949098wrj.221.1574858794874; 
 Wed, 27 Nov 2019 04:46:34 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id y15sm18059136wrh.94.2019.11.27.04.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 04:46:34 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfc89f03-ba62-975e-afe2-2fb85fd5bb4c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a7cb8e84-b557-fa95-5796-5537b6ae46ae@xen.org>
Date: Wed, 27 Nov 2019 12:46:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cfc89f03-ba62-975e-afe2-2fb85fd5bb4c@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] getting 4.12.2 ready
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNS8xMS8yMDE5IDE1OjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBBbGwsCgpIaSwKCj4g
Cj4gdGhlIDQuMTIuMiBzdGFibGUgcmVsZWFzZSBpcyBkdWUgaW4gYWJvdXQgMiB3ZWVrcyB0aW1l
LiBQbGVhc2UgcG9pbnQKPiBvdXQgYmFja3BvcnRpbmcgY2FuZGlkYXRlcyB0aGF0IHlvdSBmaW5k
IG1pc3NpbmcgZnJvbSB0aGUgcmVzcGVjdGl2ZQo+IHN0YWJsZSB0cmVlcy4KCk1vc3Qgb2YgdGhl
IHNlcmllcyAieGVuL2FybTogWFNBLTIwMSBhbmQgWFNBLTI2MyBmaXhlcyIgWzFdIHNob3VsZCBi
ZSAKYmFja3BvcnRlZCB0byBhdCBsZWFzdCBYZW4gNC4xMiAodGhpcyBpcyBhbHJlYWR5IGluIHN0
YWdpbmcpLgoKVGhpcyB3b3VsZCBlcnJvciBpc3N1ZXMgd2l0aCBTRXJyb3IgYW5kIFNTQkQuIEJ1
dCBJIGhhdmVuJ3QgaGFkIHRoZSAKY2hhbmNlIHRvIGNoZWNrIHRoaXMgaXMgYXBwbHlpbmcgY2xl
YW5seSB0byBYZW4gNC4xMi4gTWF5YmUgU3RlZmFubyBjYW4gCnRha2UgYSBsb29rPwoKQ2hlZXJz
CgpbMV0gCmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnL21zZzU5MjgzLmh0bWwKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
