Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E754F1232B2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:40:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFqB-0001rO-PK; Tue, 17 Dec 2019 16:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fMX9=2H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihFqA-0001rJ-9o
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:36:54 +0000
X-Inumbo-ID: 693a2512-20eb-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 693a2512-20eb-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 16:36:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5B25AE46;
 Tue, 17 Dec 2019 16:36:43 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d857381c-80f1-8e11-1550-c988845c3aeb@suse.com>
Date: Tue, 17 Dec 2019 17:37:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: statically allocate
 bootmem_region_list
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSdtIHNvcnJ5IGZvciB0aGUgbm9uLXRocmVhZGVkIHJlcGx5LCBidXQgbXkgbWFpbCBjbGllbnQg
aGFzCm1peGVkIHVwIHRoaXMgbWFpbCB3aXRoIGFub3RoZXIgb25lLCBzbyBJIGhhdmUgbm90aGlu
ZyB0bwpwcm9wZXJseSByZXBseSB0by4gV2l0aCBvbmUgc3R5bGlzdGljIGlzc3VlIHRha2VuIGNh
cmUgb2YKKGJsYW5rcyBhcm91bmQgdGhlIGJpbmFyeSBvcGVyYXRvciAvICkKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KVGhlIGNoYW5nZSB3b3VsZCBiZSBlYXN5
IGVub3VnaCB0byBkbyB3aGlsZSBjb21taXR0aW5nLCBidXQKc2FpZCBtYWlsYm94IGlzc3VlIHdv
dWxkIGVpdGhlciByZXF1aXJlIHNvbWVvbmUgZWxzZSB0bwphcHBseSB0aGUgY2hhbmdlLCBvciB5
b3UgdG8gc2VuZCBhIHYyICh3aGljaCB0aGVuIGhvcGVmdWxseQp3b24ndCBlbmQgdXAgZ2FyYmxl
ZCkuCgpJaXJjIHRoaXMgd2FzIHN1Z2dlc3RlZCBiZWZvcmUsIHNvIGl0IHdvdWxkIGJlIG5pY2Ug
aWYgdGhlCnBhdGNoIGNvdWxkIGFsc28gZ2FpbiBhIHN1aXRhYmxlIFN1Z2dlc3RlZC1ieS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
