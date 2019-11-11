Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B7BF74A8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 14:22:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU9Zy-0003dU-7Q; Mon, 11 Nov 2019 13:18:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Nc6x=ZD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iU9Zx-0003dP-86
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 13:18:01 +0000
X-Inumbo-ID: ae88d49c-0485-11ea-a20d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae88d49c-0485-11ea-a20d-12813bfff9fa;
 Mon, 11 Nov 2019 13:17:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC112B590;
 Mon, 11 Nov 2019 13:17:58 +0000 (UTC)
To: Colin Ian King <colin.king@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20191111122009.67789-1-colin.king@canonical.com>
 <04efe197-2914-ab1d-918b-8899aa0354af@suse.com>
 <ec4ffabf-9cfa-2db6-7e23-60f84947d0a9@canonical.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <767fe18a-c3d6-4200-9eb5-31e1665811a0@suse.com>
Date: Mon, 11 Nov 2019 14:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ec4ffabf-9cfa-2db6-7e23-60f84947d0a9@canonical.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH][next] xen/gntdev: remove redundant non-zero
 check on ret
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMTkgMTM6MzEsIENvbGluIElhbiBLaW5nIHdyb3RlOgo+IE9uIDExLzExLzIwMTkg
MTI6MjUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDExLjExLjE5IDEzOjIwLCBDb2xpbiBL
aW5nIHdyb3RlOgo+Pj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4KPj4+Cj4+PiBUaGUgbm9uLXplcm8gY2hlY2sgb24gcmV0IGlzIGFsd2F5cyBnb2luZyB0
byBiZSBmYWxzZSBiZWNhdXNlCj4+PiByZXQgd2FzIGluaXRpYWxpemVkIGFzIHplcm8gYW5kIHRo
ZSBvbmx5IHBsYWNlIGl0IGlzIHNldCB0bwo+Pj4gbm9uLXplcm8gY29udGFpbnMgYSByZXR1cm4g
cGF0aCBiZWZvcmUgdGhlIG5vbi16ZXJvIGNoZWNrLiBIZW5jZQo+Pj4gdGhlIGNoZWNrIGlzIHJl
ZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4+Cj4+IFdoaWNoIHZlcnNpb24gZGlkIHlvdSBw
YXRjaCBhZ2FpbnN0PyBJbiBjdXJyZW50IG1hc3RlciB0aGUgYWJvdmUKPj4gc3RhdGVtZW50IGlz
IG5vdCB0cnVlLgo+IAo+IGFnYWluc3QgdG9kYXkncyBsaW51eC1uZXh0CgpBaCwgb2theSwgdGhp
cyBpcyBsaWtlbHkgdGhlIHJlc3VsdCBvZiB0aGUgcmVjZW50IG1tLW5vdGlmaWVyIHBhdGNoCnNl
cmllcy4gSSdsbCBwdXQgdGhpcyBwYXRjaCBvbiBob2xkIHVudGlsIHRoZSByZWNlbnQgcGF0Y2hl
cyBoYXZlCmhpdCBtYXN0ZXIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
