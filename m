Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B11D6E1D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 06:24:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKEKu-00022X-46; Tue, 15 Oct 2019 04:21:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FmRb=YI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iKEKs-00022S-7b
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 04:21:26 +0000
X-Inumbo-ID: 3f8cfbf0-ef03-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f8cfbf0-ef03-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 04:21:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DA3CAF3B;
 Tue, 15 Oct 2019 04:21:23 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>, julien.grall@arm.com
References: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3cdf0397-fd18-35af-6181-c7842dfc3e37@suse.com>
Date: Tue, 15 Oct 2019 06:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove special dom0 case in
 dump_hyp_walk
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

T24gMTUuMTAuMTkgMDU6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBUaGVyZSBpcyBu
byBuZWVkIHRvIGhhdmUgYSBzcGVjaWFsIGRvbTAgY2FzZSB0byBjb252ZXJ0IHRoZSBwZ3RhYmxl
Cj4gdmlydHVhbCBhZGRyZXNzIGludG8gYSBwaHlzaWNhbCBhZGRyZXNzLiBUaGUgdmlydF90b19t
YWRkciBmdW5jdGlvbiBjYW4KPiB3b3JrIGJvdGggaW4gdGhlIGRvbTAgY2FzZSBhbmQgdGhlIGRv
bVUgY2FzZS4KPiAKPiBUaGlzIGlzIG1vcmUgdGhhbiBhIGNsZWFudXA6IHdoZW4gWGVuIGlzIGxv
YWRlZCBhdCBhZGRyZXNzZXMgbG93ZXIgdGhhbgo+IDJNQiBvbiBhcm0zMiBwaHlzX29mZnNldCBt
aWdodCBub3QgaG9sZCB0aGUgcmlnaHQgdmFsdWUgYW5kIGJlIHVuYWJsZSB0bwo+IHBlcmZvcm0g
YSB2aXJ0IHRvIHBoeXMgY29udmVyc2lvbiBwcm9wZXJseS4gUmVkdWNpbmcgdGhlIHVubmVjZXNz
YXJ5Cj4gdXNhZ2Ugb2YgcGh5c19vZmZzZXQgaXMgYSBnb29kIGlkZWEuCj4gCj4gTGluazogaHR0
cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVsJm09MTU3MDgxMzk4MDIyNDAxCj4gU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4K
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+
IGluZGV4IGE2NjM3Y2UzNDcuLmI3ODgzY2ZiYWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC0yODQsMTAgKzI4NCw3IEBAIHZv
aWQgZHVtcF9oeXBfd2Fsayh2YWRkcl90IGFkZHIpCj4gICAgICAgICAgICAgICJvbiBDUFUlZCB2
aWEgVFRCUiAweCUwMTYiUFJJeDY0IlxuIiwKPiAgICAgICAgICAgICAgYWRkciwgc21wX3Byb2Nl
c3Nvcl9pZCgpLCB0dGJyKTsKPiAgIAo+IC0gICAgaWYgKCBzbXBfcHJvY2Vzc29yX2lkKCkgPT0g
MCApCj4gLSAgICAgICAgQlVHX09OKCAobHBhZV90ICopKHVuc2lnbmVkIGxvbmcpKHR0YnIgLSBw
aHlzX29mZnNldCkgIT0gcGd0YWJsZSApOwo+IC0gICAgZWxzZQo+IC0gICAgICAgIEJVR19PTigg
dmlydF90b19tYWRkcihwZ3RhYmxlKSAhPSB0dGJyICk7Cj4gKyAgICBCVUdfT04oIHZpcnRfdG9f
bWFkZHIocGd0YWJsZSkgIT0gdHRiciApOwo+ICAgICAgIGR1bXBfcHRfd2Fsayh0dGJyLCBhZGRy
LCBIWVBfUFRfUk9PVF9MRVZFTCwgMSk7Cj4gICB9CgpJIGNhbid0IG1ha2UgYSBjb25uZWN0aW9u
IGJldHdlZW4gY29tbWl0IG1lc3NhZ2UgKCJzcGVjaWFsIGRvbTAgY2FzZSIpCmFuZCB0aGUgY29k
ZSBtb2RpZmljYXRpb24uIFRoZSBzcGVjaWFsIGNhc2UgcmVtb3ZlZCBpcyBhYm91dCBjcHUgMCwg
bm90CmRvbTAuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
