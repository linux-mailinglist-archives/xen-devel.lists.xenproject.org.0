Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C188A170A4C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 22:20:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j742p-0000Pu-0s; Wed, 26 Feb 2020 21:16:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ojl6=4O=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1j742n-0000Pp-6r
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 21:16:37 +0000
X-Inumbo-ID: 4586e31a-58dd-11ea-a490-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4586e31a-58dd-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 21:16:36 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id 13so794551iou.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 13:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=fK+Cp34X0s8U6UAoC8LWg+S/2TOzs0jflib6BZzxmEA=;
 b=qvB/QsQjHT3Hy22TZQEJEzlTvguY0OrJzUpzVNZkJTXMID2OZCF9KHVXfJl8Clnm0S
 FTY6EMWLsDliT1uRewj6b3yY6KNT2sWlj/3MGO3d7BeSNJbyGLEgvzOgVH4Ef6Gw4TtR
 a+JFgeu8NYBqUcvbqwNRHTNXg9lu4cdxODGFVOJcUDuZKjDXUAk6ktXjqcVYJ6e1f08T
 1GV83tKXk3ybfYzvziDtzXYmssgmGR7ZRFlIHxcxikZ33SknaJJ41UGFSU1T5so7iwsB
 N9UIDgDPez7GZYhLbWHgel8EuqnPbS+/6YxxdUF4ZK1/R5WV3w9lrnVqG+nuNrNlmX7U
 /KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=fK+Cp34X0s8U6UAoC8LWg+S/2TOzs0jflib6BZzxmEA=;
 b=VQsXSkZa9bz9YBABGi8znNQLqx9GFymUdibI/6Ej1/8zrFK8bYE58D8xX6pyIBm5Yo
 CrpTZgei8RVXviu+M8Lg5NtAqzhjstIaUob9QfTBGp4f/PGzkcs6iRDZWT3Vd3EInYNp
 DJu9HcOl/dwAp00DXGZ/k2xWbs01O2t1pUWyhi2nCqZsyLYAsIizOCkGZS9oBGTptKw9
 n1w9Y/5uCdz6fcRxlC+59Y9arQvY/DauyoqvfRu3sWmLmFKo8mlkLbRyIy4io6oA5++W
 qj43Gyb6dpVJfyLyfEWyLCWkM55x3I3DeXKCjpgDbq9H07r2CT4u/pDKdnKRaDjPd7hg
 yC4Q==
X-Gm-Message-State: APjAAAW61RlpojauA9ZRPlcpMLPa4d7Hqf7y2nJ8DA2MD+aDJ9yvw90g
 V1I/zyJ+OLUlu1rF4aw6BRE=
X-Google-Smtp-Source: APXvYqw8wV3N0YAIWzFzQPnMS8886Y+mQgIEvxatwwhg8s08x5DfZKBjFHwe6Y8vyOWSMUV7uedMjw==
X-Received: by 2002:a5e:8612:: with SMTP id z18mr631521ioj.206.1582751796277; 
 Wed, 26 Feb 2020 13:16:36 -0800 (PST)
Received: from [100.64.72.98] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id e22sm447822iob.31.2020.02.26.13.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 13:16:35 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <2AA96E76-330D-4960-BAC9-6E36474FECC2@gmail.com>
Date: Wed, 26 Feb 2020 16:16:34 -0500
To: Ian Jackson <ian.jackson@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: iPhone Mail (17D50)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce
 cmp-fd-file-inode utility
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

77u/T24gRmViIDI2LCAyMDIwLCBhdCAxMTowNywgSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21h
aWwuY29tPiB3cm90ZToKPiAKPj4g77u/T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTA6NDggQU0g
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBKYXNvbiBBbmRy
eXVrIHdyaXRlcyAoIltQQVRDSCAxLzJdIHRvb2xzL2hlbHBlcnM6IEludHJvZHVjZSBjbXAtZmQt
ZmlsZS1pbm9kZSB1dGlsaXR5Iik6Cj4+PiBUaGlzIGlzIGEgQyBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgcGVybCBjb2RlIGluc2lkZSBvZiBsb2NraW5nLnNoIHRvCj4+PiBjaGVjayB0aGF0IHRoZSBs
b2NrZWQgZmlsZSBkZXNjcmlwdG9yIGFuZCBsb2NrIGZpbGUgc2hhcmUgdGhlIHNhbWUgaW5vZGUK
Pj4+IGFuZCB0aGVyZWZvcmUgbWF0Y2guICBPbmUgY2hhbmdlIGZyb20gdGhlIHBlcmwgdmVyc2lv
biBpcyByZXBsYWNpbmcKPj4+IHByaW50aW5nICJ5IiBvbiBzdWNjZXNzIHdpdGggZXhpdCB2YWx1
ZXMgb2YgMCAoc2hlbGwgVHJ1ZSkgYW5kIDEgKHNoZWxsCj4+PiBGYWxzZSkuCj4+IE1heWJlIGl0
IHdvdWxkIGJlIGJldHRlciB0byB1c2Ugc3RhdCgxKSA/ICBPbiBMaW51eAo+PiBzdGF0IC1MIC1j
JUQuJWkgL2Rldi9zdGRpbiBibGFoLmxvY2sKPj4gb3Igc29tZSBzdWNoLCBhbmQgdGhlbiBjb21w
YXJlIHRoZSB0d28gbnVtYmVycy4KPj4gSSdtIHJlbHVjdGFudCB0byBob3N0IGEgZ2VuZXJhbC1w
dXJwb3NlIHNoZWxsIHV0aWxpdHkgaW4geGVuLmdpdCwgbm8KPj4gbWF0dGVyIGhvdyB1c2VmdWwu
Li4KCldlJ3ZlIHVzZWQgdGhpcyBkb3duc3RyZWFtIGluIE9wZW5YVCB0byBhdm9pZCBwdWxsaW5n
IGluIHRoZSBnZW5lcmFsLXB1cnBvc2UgUGVybCBydW50aW1lLCB3aGljaCBpcy4ubGFyZ2VyIHRo
YW4gdGhpcyBzcGVjaWFsLXB1cnBvc2UgdXRpbGl0eS4gIFRoaXMgc2hlbGwgdXRpbGl0eSB3YXMg
ZGV2ZWxvcGVkIGZvciB0aGlzIHNwZWNpZmljIHVzZSBjYXNlIGluIFhlbi4KClJpY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
