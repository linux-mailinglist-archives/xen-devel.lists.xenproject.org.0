Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78F471B4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2019 20:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcDaR-0006cp-Iu; Sat, 15 Jun 2019 18:39:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZUrs=UO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcDaP-0006ck-Rj
 for xen-devel@lists.xenproject.org; Sat, 15 Jun 2019 18:39:33 +0000
X-Inumbo-ID: ea573da9-8f9c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ea573da9-8f9c-11e9-8980-bc764e045a96;
 Sat, 15 Jun 2019 18:39:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E02C428;
 Sat, 15 Jun 2019 11:39:31 -0700 (PDT)
Received: from [10.37.12.2] (unknown [10.37.12.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C6CD3F246;
 Sat, 15 Jun 2019 11:39:31 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
Date: Sat, 15 Jun 2019 19:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611184541.7281-3-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 02/10] xen/arm: optee: add OP-TEE header
 files
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgTGFycykKCkhpLAoKT24gNi8xMS8xOSA3OjQ2IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvb3B0ZWVfbXNnLmggYi94
ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uZmU3NDNkYmRlMwo+IC0tLSAvZGV2L251bGwKPiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaAo+IEBAIC0wLDAgKzEsMzEwIEBACj4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UgKi8KCkhtbW0sIHNvcnJ5
IEkgaGF2ZW4ndCBub3RpY2VkIGl0IHVudGlsIG5vdyAoU0RQWCBpcyBtb3JlIGV4cGxpY2l0IHRo
YXQgCnRoZSBmdWxsLWJsb3duIGxpY2Vuc2UpLiBJIHN1c3BlY3QgdGhpcyBpcyBmaW5lIHRvIGhh
dmUgQlNELTIgQ2xhdXNlIApsaWNlbnNlIGluIFhlbiBidXQgSSB3YW50IHRvIGNvbmZpcm1hdGlv
biBmcm9tIHNvbWVvbmUga25vd2luZyBtb3JlIHRoYW4gCm1lIGFib3V0IGxpY2Vuc2UgY29tcGF0
aWJpbGl0eS4gTGFycz8KCklmIHRoaXMgaXMgZmluZSwgdGhlbiBJIHdvdWxkIGxpa2UgdG8gYWRk
IGEgd29yZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgCihJIGFtIGhhcHB5IHRvIGRvIHRoYXQgb24g
Y29tbWl0KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
