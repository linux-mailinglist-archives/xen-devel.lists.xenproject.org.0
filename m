Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E487146680
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 19:56:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbqNc-0002HF-Rm; Fri, 14 Jun 2019 17:52:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbqNb-0002GG-21
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 17:52:47 +0000
X-Inumbo-ID: 3751ada3-8ecd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3751ada3-8ecd-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 17:52:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D02E62B;
 Fri, 14 Jun 2019 10:52:45 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4BA3F718;
 Fri, 14 Jun 2019 10:52:45 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1905011628310.23881@sstabellini-ThinkPad-X260>
 <e6a6ed7e-8085-4b29-a102-6d4ddf1f578f@arm.com>
Message-ID: <79361ad3-2f0a-aafb-9503-e2774535494a@arm.com>
Date: Fri, 14 Jun 2019 18:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e6a6ed7e-8085-4b29-a102-6d4ddf1f578f@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: improve dom0less documentation
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8wNi8yMDE5IDE5OjU5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywK
PiAKPiBPbiA1LzIvMTkgMTI6MzAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gSW1w
cm92ZSBEb20wLWxlc3MgZG9jdW1lbnRhdGlvbjogaW5jbHVkZSBhIGNvbXBsZXRlIGNvbmZpZ3Vy
YXRpb24KPj4gZXhhbXBsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgo+Pgo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9mZWF0dXJlcy9k
b20wbGVzcy5wYW5kb2MgYi9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwo+PiBpbmRleCA0
ZTM0MmI3Li5lMDc2ZTM3IDEwMDY0NAo+PiAtLS0gYS9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBh
bmRvYwo+PiArKysgYi9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwo+IAo+IFRoZSBjb250
ZW50IGlzIHByb2JhYmx5IG9rIGZlYXR1cmVzLCBhbHRob3VnaCBJIGFtIHdvcnJ5IG9mIGR1cGxp
Y2F0aW9uIHdpdGggCj4gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dC4KPiAK
PiBIb3dldmVyLCB3aGVuIGxvb2tpbmcgaG93IG90aGVyIGZlYXR1cmVzIGRlYWwgd2l0aCBzaW1p
bGFyIGRlc2NyaXB0aW9uLAo+IEkgbm90aWNlZCB0aGF0IHdlIGRvbid0IGZvbGxvdyB0aGUgdGVt
cGxhdGUgKHNlZSB0ZW1wbGF0ZXMucGFuZG9jKS4KPiAKPiBJIGFtIGF3YXJlIHRoaXMgaXMgYSBz
dWdnZXN0aW9uLCBidXQgaXQgd291bGQgYmUgZ29vZCB0byBmb2xsb3cgaXQgYXMgYSB1c2VyIAo+
IHdvdWxkIGJlIGFibGUgdG8gZmluZCBoaXMgd2F5IHRocm91Z2ggaXQgbW9yZSBlYXNpbHkgYW5k
IHdvdWxkIGhlbHAgdG8ga25vdyB0aGlzIAo+IGlzIEFybSBvbmx5ICh0aGlzIGlzIG5vdCBjbGVh
cmx5IHNwZWxsIG91dCkuCj4gCj4gQ291bGQgeW91IGhhdmUgYSBsb29rIGF0IGl0Pwo+IAo+IFRo
aXMgY291bGQgYmUgYSBmb2xsb3ctdXAgc286Cj4gCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CgpOb3cgY29tbWl0dGVkLgoKVGhhbmsgeW91IQoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
