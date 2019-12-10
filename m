Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B4118C8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehSV-0000r4-AG; Tue, 10 Dec 2019 15:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+NSe=2A=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iehST-0000pg-SA
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:29:53 +0000
X-Inumbo-ID: e953028a-1b61-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e953028a-1b61-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:29:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d73so431611wmd.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7saRNdb5r8f4VjGFcMO0Jaz1qOQPM7sIUZ29VjqrkYs=;
 b=tCYa0sc5Pgmb6FO+KQBLnpeSfAxFCrj1e46RBuC+6Io6Rl6D7tHsgyGaZdS3K+uS86
 5qchFLNDuzWugfNIzzsAuGBn6PVJak5nfLf8HoCIxIdaQP5anLoWBDib2GtZiCU1FzOC
 s7cH7DsZac4sp4orgEYpklIwWDbZIjmTW7VMWzJYKov0JAmTEAnjicI9XCaZqvc8Axag
 Z5O6gpICakbCQ3/PttBpzkJDZn20jGkwWku8ro/Nw8qRM2Qf37Q1k0YWc0QBKN2FaAWB
 WY16Yor9xfjwWEuhd5UUoBLlJnzIkt5/LY5ol752INxQ4PiolevOApCR9I+c4NDzL3lS
 Ximw==
X-Gm-Message-State: APjAAAV0mFcHYFAOUIpm7a+mApKq3FA9DEHhXSAaD1GnBCFQxSvMO0Ek
 akZbE76bSNME6tqvJIsAO+U=
X-Google-Smtp-Source: APXvYqxLodUIpPrHyKHjDbNIVXtsSWUl58TVFoi+Ez4xA0swBX6YY2swaaR6wYYHr0ekENdpKg24NA==
X-Received: by 2002:a1c:4f:: with SMTP id 76mr5641312wma.69.1575991792443;
 Tue, 10 Dec 2019 07:29:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id n10sm3628426wrt.14.2019.12.10.07.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 07:29:51 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191207211634.9958-2-andrew.cooper3@citrix.com>
 <20191210121701.8196-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f657ca4c-d266-b0ad-db15-73265fbdc958@xen.org>
Date: Tue, 10 Dec 2019 15:29:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210121701.8196-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 1/3] xen/flask: Drop the
 gen-policy.py script
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xMi8yMDE5IDEyOjE3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZSBzY3Jp
cHQgaXMgUHl0aG9uIDIgc3BlY2lmaWMsIGFuZCBmYWlscyB3aXRoIHN0cmluZy9iaW5hcnkgaXNz
dWVzIHdpdGgKPiBQeXRob24gMzoKPiAKPiAgICBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwg
bGFzdCk6Cj4gICAgICBGaWxlICJnZW4tcG9saWN5LnB5IiwgbGluZSAxNCwgaW4gPG1vZHVsZT4K
PiAgICAgICAgZm9yIGNoYXIgaW4gc3lzLnN0ZGluLnJlYWQoKToKPiAgICAgIEZpbGUgIi91c3Iv
bGliL3B5dGhvbjMuNS9jb2RlY3MucHkiLCBsaW5lIDMyMSwgaW4gZGVjb2RlCj4gICAgICAgIChy
ZXN1bHQsIGNvbnN1bWVkKSA9IHNlbGYuX2J1ZmZlcl9kZWNvZGUoZGF0YSwgc2VsZi5lcnJvcnMs
IGZpbmFsKQo+ICAgIFVuaWNvZGVEZWNvZGVFcnJvcjogJ3V0Zi04JyBjb2RlYyBjYW4ndCBkZWNv
ZGUgYnl0ZSAweDhjIGluIHBvc2l0aW9uIDA6IGludmFsaWQgc3RhcnQgYnl0ZQo+IAo+IEZpeGlu
ZyB0aGUgc2NyaXB0IHRvIGJlIGNvbXBhdGlibGUgaXNuJ3QgaGFyZCwgYnV0IHVzaW5nIHB5dGhv
biBoZXJlIGlzCj4gd2FzdGVmdWwuICBEcm9wIHRoZSBzY3JpcHQgZW50aXJlbHksIGFuZCB3cml0
ZSBhbiBlcXVpdmVsZW50IGZsYXNrLXBvbGljeS5TCj4gaW5zdGVhZC4gIFRoaXMgcmVtb3ZlcyB0
aGUgbmVlZCBmb3IgYSAkKFBZVEhPTikgYW5kICQoQ0MpIHBhc3MuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTog
RGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+Cj4gLS0tCj4gQ0M6IERhbmll
bCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiBDQzogVm9sb2R5bXly
IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgo+IAo+IHYyOgo+ICAgKiBGaXgg
dGFicyB2cyBzcGFjZXMgaXNzdWVzCj4gdjM6Cj4gICAqIFVzZSAlIHJhdGhlciB0aGFuIEAgZm9y
IHByb2diaXRzL29iamVjdCwgZm9yIEFybTMyIGJ1aWxkLgoKSG93IHRvIG1ha2UgZGV2ZWxvcHBl
ciBsaWZlIG1vcmUgZXhjaXRpbmcuLi4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEB4
ZW4ub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
