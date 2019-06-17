Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC148716
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:27:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctV6-0006f5-TE; Mon, 17 Jun 2019 15:24:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUew=UQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hctV5-0006eu-Id
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:24:51 +0000
X-Inumbo-ID: 0b60b134-9114-11e9-be77-07d2fec442be
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0b60b134-9114-11e9-be77-07d2fec442be;
 Mon, 17 Jun 2019 15:24:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A190A28;
 Mon, 17 Jun 2019 08:24:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED73A3F718;
 Mon, 17 Jun 2019 08:24:47 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "lars.kurth@citrix.com" <lars.kurth@citrix.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
 <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
Message-ID: <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
Date: Mon, 17 Jun 2019 16:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
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

aG1tLCBJIGZvcmdvdCB0byBDQyBsYXJzLiBTb3JyeSBmb3IgdGhhdC4KCkNoZWVycywKCk9uIDE1
LzA2LzIwMTkgMTk6MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiAoKyBMYXJzKQo+IAo+IEhpLAo+
IAo+IE9uIDYvMTEvMTkgNzo0NiBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaCAKPj4gYi94ZW4vaW5j
bHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMDAwLi5mZTc0M2RiZGUzCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS90ZWUvb3B0ZWVfbXNnLmgKPj4gQEAgLTAsMCArMSwzMTAgQEAKPj4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UgKi8KPiAKPiBIbW1tLCBz
b3JyeSBJIGhhdmVuJ3Qgbm90aWNlZCBpdCB1bnRpbCBub3cgKFNEUFggaXMgbW9yZSBleHBsaWNp
dCB0aGF0IHRoZSAKPiBmdWxsLWJsb3duIGxpY2Vuc2UpLiBJIHN1c3BlY3QgdGhpcyBpcyBmaW5l
IHRvIGhhdmUgQlNELTIgQ2xhdXNlIGxpY2Vuc2UgaW4gWGVuIAo+IGJ1dCBJIHdhbnQgdG8gY29u
ZmlybWF0aW9uIGZyb20gc29tZW9uZSBrbm93aW5nIG1vcmUgdGhhbiBtZSBhYm91dCBsaWNlbnNl
IAo+IGNvbXBhdGliaWxpdHkuIExhcnM/Cj4gCj4gSWYgdGhpcyBpcyBmaW5lLCB0aGVuIEkgd291
bGQgbGlrZSB0byBhZGQgYSB3b3JkIGluIHRoZSBjb21taXQgbWVzc2FnZSAoSSBhbSAKPiBoYXBw
eSB0byBkbyB0aGF0IG9uIGNvbW1pdCkuCj4gCj4gQ2hlZXJzLAo+IAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
