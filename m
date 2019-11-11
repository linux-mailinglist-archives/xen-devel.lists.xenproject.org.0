Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A3F73DB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 13:28:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU8ld-0007sz-TS; Mon, 11 Nov 2019 12:26:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Nc6x=ZD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iU8lc-0007sr-GV
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 12:26:00 +0000
X-Inumbo-ID: 6a214af2-047e-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a214af2-047e-11ea-adbe-bc764e2007e4;
 Mon, 11 Nov 2019 12:25:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D9EAB14E;
 Mon, 11 Nov 2019 12:25:57 +0000 (UTC)
To: Colin King <colin.king@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20191111122009.67789-1-colin.king@canonical.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <04efe197-2914-ab1d-918b-8899aa0354af@suse.com>
Date: Mon, 11 Nov 2019 13:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191111122009.67789-1-colin.king@canonical.com>
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

T24gMTEuMTEuMTkgMTM6MjAsIENvbGluIEtpbmcgd3JvdGU6Cj4gRnJvbTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBUaGUgbm9uLXplcm8gY2hlY2sgb24g
cmV0IGlzIGFsd2F5cyBnb2luZyB0byBiZSBmYWxzZSBiZWNhdXNlCj4gcmV0IHdhcyBpbml0aWFs
aXplZCBhcyB6ZXJvIGFuZCB0aGUgb25seSBwbGFjZSBpdCBpcyBzZXQgdG8KPiBub24temVybyBj
b250YWlucyBhIHJldHVybiBwYXRoIGJlZm9yZSB0aGUgbm9uLXplcm8gY2hlY2suIEhlbmNlCj4g
dGhlIGNoZWNrIGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCgpXaGljaCB2ZXJzaW9u
IGRpZCB5b3UgcGF0Y2ggYWdhaW5zdD8gSW4gY3VycmVudCBtYXN0ZXIgdGhlIGFib3ZlCnN0YXRl
bWVudCBpcyBub3QgdHJ1ZS4KCgpKdWVyZ2VuCgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJM
b2dpY2FsbHkgZGVhZCBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy94ZW4vZ250ZGV2LmMgfCA1
IC0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwo+IGluZGV4IDEw
Y2M1ZTllNjEyYS4uMDdkODBiMTc2MTE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRl
di5jCj4gKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPiBAQCAtNTI0LDExICs1MjQsNiBAQCBz
dGF0aWMgaW50IGdudGRldl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpm
bGlwKQo+ICAgCX0KPiAgICNlbmRpZgo+ICAgCj4gLQlpZiAocmV0KSB7Cj4gLQkJa2ZyZWUocHJp
dik7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gICAJZmxpcC0+cHJpdmF0ZV9kYXRhID0g
cHJpdjsKPiAgICNpZmRlZiBDT05GSUdfWEVOX0dSQU5UX0RNQV9BTExPQwo+ICAgCXByaXYtPmRt
YV9kZXYgPSBnbnRkZXZfbWlzY2Rldi50aGlzX2RldmljZTsKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
