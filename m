Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3E118138
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 08:18:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieZjy-0005qP-Sg; Tue, 10 Dec 2019 07:15:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieZjw-0005ps-U2
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 07:15:24 +0000
X-Inumbo-ID: d5452d76-1b1c-11ea-88fa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5452d76-1b1c-11ea-88fa-12813bfff9fa;
 Tue, 10 Dec 2019 07:15:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66DA6AC9A;
 Tue, 10 Dec 2019 07:15:23 +0000 (UTC)
To: Nathan Chancellor <natechancellor@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20191209201444.33243-1-natechancellor@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bf13410c-b62e-d82f-6351-ee49d7964fe7@suse.com>
Date: Tue, 10 Dec 2019 08:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209201444.33243-1-natechancellor@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: Adjust indentation in
 xlvbd_alloc_gendisk
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
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMjE6MTQsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IENsYW5nIHdhcm5z
Ogo+IAo+IC4uL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmM6MTExNzo0OiB3YXJuaW5nOiBt
aXNsZWFkaW5nIGluZGVudGF0aW9uOwo+IHN0YXRlbWVudCBpcyBub3QgcGFydCBvZiB0aGUgcHJl
dmlvdXMgJ2lmJyBbLVdtaXNsZWFkaW5nLWluZGVudGF0aW9uXQo+ICAgICAgICAgICAgICAgICAg
bnJfcGFydHMgPSBQQVJUU19QRVJfRElTSzsKPiAgICAgICAgICAgICAgICAgIF4KPiAuLi9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jOjExMTU6Mzogbm90ZTogcHJldmlvdXMgc3RhdGVtZW50
IGlzIGhlcmUKPiAgICAgICAgICAgICAgICAgIGlmIChlcnIpCj4gICAgICAgICAgICAgICAgICBe
Cj4gCj4gVGhpcyBpcyBiZWNhdXNlIHRoZXJlIGlzIGEgc3BhY2UgYXQgdGhlIGJlZ2lubmluZyBv
ZiB0aGlzIGxpbmU7IHJlbW92ZQo+IGl0IHNvIHRoYXQgdGhlIGluZGVudGF0aW9uIGlzIGNvbnNp
c3RlbnQgYWNjb3JkaW5nIHRvIHRoZSBMaW51eCBrZXJuZWwKPiBjb2Rpbmcgc3R5bGUgYW5kIGNs
YW5nIG5vIGxvbmdlciB3YXJucy4KPiAKPiBXaGlsZSB3ZSBhcmUgaGVyZSwgdGhlIHByZXZpb3Vz
IGxpbmUgaGFzIHNvbWUgdHJhaWxpbmcgd2hpdGVzcGFjZTsgY2xlYW4KPiB0aGF0IHVwIGFzIHdl
bGwuCj4gCj4gRml4ZXM6IGM4MGE0MjA5OTVlNyAoInhlbi1ibGtmcm9udDogaGFuZGxlIFhlbiBt
YWpvciBudW1iZXJzIG90aGVyIHRoYW4gWEVOVkJEIikKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5j
b20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83OTEKPiBTaWduZWQtb2ZmLWJ5OiBOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
