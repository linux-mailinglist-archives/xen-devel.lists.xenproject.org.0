Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8511E8D6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 18:01:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifoHF-0004se-PR; Fri, 13 Dec 2019 16:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifoHE-0004sW-0A
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:58:52 +0000
X-Inumbo-ID: d60bcf6c-1dc9-11ea-8f95-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d60bcf6c-1dc9-11ea-8f95-12813bfff9fa;
 Fri, 13 Dec 2019 16:58:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D31C6ABB1;
 Fri, 13 Dec 2019 16:58:49 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
 <20191213154946.GM1155@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4022441e-bdbd-e78b-c8a4-d3fd9a09311a@suse.com>
Date: Fri, 13 Dec 2019 17:59:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213154946.GM1155@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNjo0OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gRnJpLCBEZWMg
MTMsIDIwMTkgYXQgMTI6MDU6MTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEy
LjEyLjIwMTkgMTk6MjcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gLS0tIC9kZXYvbnVsbAo+
Pj4gKysrIGIveGVuLy5naXRpZ25vcmUKPj4+IEBAIC0wLDAgKzEsMiBAQAo+Pj4gKyoubGV4LmMK
Pj4+ICsqLnRhYi5bY2hdCj4+Cj4+IFdoeSBkbyB0aGVzZSBnZXQgbW92ZWQgaGVyZSBmcm9tIC4u
Lgo+Pgo+Pj4gLS0tIGEveGVuL3Rvb2xzL2tjb25maWcvLmdpdGlnbm9yZQo+Pj4gKysrIGIveGVu
L3Rvb2xzL2tjb25maWcvLmdpdGlnbm9yZQo+Pj4gQEAgLTEsMTIgKzEsOCBAQAo+Pj4gICMKPj4+
ICAjIEdlbmVyYXRlZCBmaWxlcwo+Pj4gICMKPj4+IC1jb25maWcqCj4+PiAtKi5sZXguYwo+Pj4g
LSoudGFiLmMKPj4+IC0qLnRhYi5oCj4+PiAtemNvbmYuaGFzaC5jCj4+PiAgKi5tb2MKPj4+ICsq
Y29uZi1jZmcKPj4KPj4gaGVyZT8KPiAKPiBXZWxsLCBpdCdzIG1vcmUgbGlrZSB0aGV5IG1vdmUg
ZnJvbSBsaW51eC5naXQvc2NyaXB0cy9rY29uZmlnLy5naXRpZ25vcmUKPiB0byBsaW51eC5naXQv
LmdpdGlnbm9yZQoKV2hpY2ggZG9lc24ndCBhbnN3ZXIgdGhlIHdoeSAoZm9yIG91ciByZXBvKS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
