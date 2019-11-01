Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024B7EC4F5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 15:47:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQYAm-0004gO-0K; Fri, 01 Nov 2019 14:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zotV=YZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQYAk-0004g9-0q
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 14:45:06 +0000
X-Inumbo-ID: 31137f5c-fcb6-11e9-b7a7-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 31137f5c-fcb6-11e9-b7a7-bc764e2007e4;
 Fri, 01 Nov 2019 14:45:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C55031F;
 Fri,  1 Nov 2019 07:45:04 -0700 (PDT)
Received: from [10.1.37.74] (e110479-lin.cambridge.arm.com [10.1.37.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 176AF3F719;
 Fri,  1 Nov 2019 07:45:01 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20191031150922.22938-1-julien.grall@arm.com>
 <75909ef5-99b9-7b7a-58c0-e5f13d530c56@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4496e487-be2c-b585-e360-8f4a67c7b66b@arm.com>
Date: Fri, 1 Nov 2019 14:45:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <75909ef5-99b9-7b7a-58c0-e5f13d530c56@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 00/19] xen/arm: XSA-201 and
 XSA-263 fixes
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8xLzE5IDEwOjQ3IEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDMxLjEw
LjE5IDE2OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIGFsbCwKPj4KPj4gVGhpcyBpcyB2
NCBvZiB0aGUgc2VyaWVzLiBGb3IgdGhvc2Ugd29uZGVyaW5nIHdoeSBpdCBpcyB2NCBhbmQgbm90
IHYyLCAKPj4gdGhpcwo+PiBzZXJpZXMgaXMgY2xvc2VseSByZWxhdGVkIHRvIFhTQS0zMDMgWzFd
IGFuZCByZWZyYWluZWQgdG8gcG9zdCBhIG5ldyAKPj4gdmVyc2lvbgo+PiBwdWJsaWNseS4gVG8g
YXZvaWQgZGVsYXlpbmcgdGhlIHNlcmllcyB3YXMgcmV2aWV3ZWQgcHJpdmF0ZWx5IG9uIAo+PiBz
ZWN1cml0eUAuCj4+Cj4+IFRoZSBzZXJpZXMgaXMgbm93IG5lYXJseSBmdWxseSByZXZpZXdlZC4g
VGhlcmUgYXJlIGp1c3QgYSBmZXcgbWlzc2luZyAKPj4gdGFncwo+PiBmb3IgcGF0Y2ggIzExLCAj
MTIgYW5kICMxOS4KPj4KPj4gVGhlIHNlcmllcyBpcyBiYXNlZCBvbiBYU0EtMzAzIHdoaWNoIGhh
cyBub3QgeWV0IGJlZW4gY29tbWl0dGVkLiBGb3IKPj4gY29udmVuaWVuY2UsIEkgaGF2ZSBwdXNo
ZWQgYSBicmFuY2ggb24gbXkgcHVibGljIGdpdDoKPj4KPj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0LWh0dHAvcGVvcGxlL2p1bGllbmcveGVuLXVuc3RhYmxlLmdpdAo+PiBicmFuY2ggZW50
cnktcmV3b3JrL3Y0Cj4+Cj4+IEBKdWVyZ2VuOiBPbiB2MSwgeW91IGFncmVlZCB0aGlzIHNob3Vs
ZCBiZSBjb25zaWRlcmVkIGFzIGEgYmxvY2tlciBmb3IgCj4+IFhlbiA0LjEzLgo+PiBBcmUgeW91
IHN0aWxsIGhhcHB5IHRvIGNvbnNpZGVyIHRoaXMgc2VyaWVzIHRvIGdvIGluIFhlbiA0LjEzP1Ro
aXMgaXMgCj4+IG1vc3RseQo+PiBmaXhpbmcgdXAgdGhlIG5vbi1YU0EgcGFydCBvZiBYU0EtMzAz
LiBUaGlzIHNob3VsZCBhbGxvdyB0byBoYW5kbGUgCj4+IHByb3Blcmx5Cj4+IFNTQkQgd29ya2Fy
b3VuZCBhbmQgcmVjZWl2ZSBzYWZlbHkgU0Vycm9ycy4KPiAKPiBZZWFoLCBzdGlsbCBmaW5lIHdp
dGggbWUsIHNvIGZvciB0aGUgc2VyaWVzOgo+IAo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRoYW5rIHlvdSEgSSB0b29rIHRoZSBsaWJlcnR5IHRv
IGNvbW1pdCB0aGUgc2VyaWVzIHdpdGggdGhlIHJlbmFtaW5nIApTdGVmYW5vIGFuZCBJIGRpc2N1
c3NlZCB5ZXN0ZXJkYXkuCgpIb3BlZnVsbHkgdGhpcyBpcyB0aGUgbGFzdCBiaWcgc2VyaWVzIGZv
ciBBcm0gZm9yIFhlbiA0LjEzIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
