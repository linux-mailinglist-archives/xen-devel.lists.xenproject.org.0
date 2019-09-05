Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D9AA53B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 15:59:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5sFu-0008Qq-8x; Thu, 05 Sep 2019 13:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5sFs-0008Qi-Tl
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:56:56 +0000
X-Inumbo-ID: 058b26f8-cfe5-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 058b26f8-cfe5-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 13:56:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8EA7EB6A0;
 Thu,  5 Sep 2019 13:56:55 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190905132703.5554-1-roger.pau@citrix.com>
 <20190905132703.5554-3-roger.pau@citrix.com>
 <ca15dc5b2939422889c91e6783f0bbfb@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae31b413-30d2-e244-51c2-7a89e7dcec9f@suse.com>
Date: Thu, 5 Sep 2019 15:57:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ca15dc5b2939422889c91e6783f0bbfb@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] sysctl/libxl: choose a sane default
 for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxNTo1MiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBSb2dlciBQ
YXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAx
OSAxNDoyNwo+Pgo+PiBDdXJyZW50IGxpYnhsIGNvZGUgd2lsbCBhbHdheXMgZW5hYmxlIEhhcmR3
YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSwKPj4gZXhwZWN0aW5nIHRoYXQgdGhlIGh5cGVydmlz
b3Igd2lsbCBmYWxsYmFjayB0byBzaGFkb3cgaWYgSEFQIGlzIG5vdAo+PiBhdmFpbGFibGUuIFdp
dGggdGhlIGNoYW5nZXMgdG8gdGhlIGRvbWFpbiBidWlsZGVyIHRoYXQncyBub3QgdGhlIGNhc2UK
Pj4gYW55IGxvbmdlciwgYW5kIHRoZSBoeXBlcnZpc29yIHdpbGwgcmFpc2UgYW4gZXJyb3IgaWYg
SEFQIGlzIG5vdAo+PiBhdmFpbGFibGUgaW5zdGVhZCBvZiBzaWxlbnRseSBmYWxsaW5nIGJhY2sg
dG8gc2hhZG93Lgo+Pgo+PiBJbiBvcmRlciB0byBrZWVwIHRoZSBwcmV2aW91cyBmdW5jdGlvbmFs
aXR5IHJlcG9ydCB3aGV0aGVyIEhBUCBpcwo+PiBhdmFpbGFibGUgb3Igbm90IGluIFhFTl9TWVND
VExfcGh5c2luZm8sIHNvIHRoYXQgdGhlIHRvb2xzdGFjayBjYW4KPj4gc2VsZWN0IGEgc2FuZSBk
ZWZhdWx0IGlmIHRoZXJlJ3Mgbm8gZXhwbGljaXQgdXNlciBzZWxlY3Rpb24gb2Ygd2hldGhlcgo+
PiBIQVAgc2hvdWxkIGJlIHVzZWQuCj4+Cj4+IE5vdGUgdGhhdCBvbiBBUk0gaGFyZHdhcmUgSEFQ
IGNhcGFiaWxpdHkgaXMgYWx3YXlzIHJlcG9ydGVkIHNpbmNlIGl0J3MKPj4gYSByZXF1aXJlZCBm
ZWF0dXJlIGluIG9yZGVyIHRvIHJ1biBYZW4uCj4+Cj4+IEZpeGVzOiBkMGMwYmE3ZDNkZSAoJ3g4
Ni9odm0vZG9tYWluOiByZW1vdmUgdGhlICdoYXBfZW5hYmxlZCcgZmxhZycpCj4+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IExHVE0K
PiAKPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
