Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464FBCBFD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:00:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCnCK-0002xc-3q; Tue, 24 Sep 2019 15:57:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCnCJ-0002xX-7W
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:57:51 +0000
X-Inumbo-ID: 0f365b38-dee4-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 0f365b38-dee4-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:57:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A39DC142F;
 Tue, 24 Sep 2019 08:57:49 -0700 (PDT)
Received: from [10.1.39.57] (unknown [10.1.39.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D00523F59C;
 Tue, 24 Sep 2019 08:57:48 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-8-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <27781495-c097-f0a3-6c75-d8cb2aa6f523@arm.com>
Date: Tue, 24 Sep 2019 16:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569339027-19484-8-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI0LzE5IDQ6MzAgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+IEBA
IC0xMjYzLDE1ICsxMjY0LDIyIEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsCj4gICAgICAgZHRfZHBy
aW50aygiJXMgcGFzc3Rocm91Z2ggPSAlZCBuaXJxID0gJWQgbmFkZHIgPSAldVxuIiwKPiAgICAg
ICAgICAgICAgICAgIGR0X25vZGVfZnVsbF9uYW1lKGRldiksIG5lZWRfbWFwcGluZywgbmlycSwg
bmFkZHIpOwo+ICAgCj4gLSAgICBpZiAoIGR0X2RldmljZV9pc19wcm90ZWN0ZWQoZGV2KSAmJiBu
ZWVkX21hcHBpbmcgKQo+ICsgICAgaWYgKCBuZWVkX21hcHBpbmcgKQo+ICAgICAgIHsKPiAtICAg
ICAgICBkdF9kcHJpbnRrKCIlcyBzZXR1cCBpb21tdVxuIiwgZHRfbm9kZV9mdWxsX25hbWUoZGV2
KSk7Cj4gLSAgICAgICAgcmVzID0gaW9tbXVfYXNzaWduX2R0X2RldmljZShkLCBkZXYpOwo+IC0g
ICAgICAgIGlmICggcmVzICkKPiAtICAgICAgICB7Cj4gLSAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICJGYWlsZWQgdG8gc2V0dXAgdGhlIElPTU1VIGZvciAlc1xuIiwKPiArICAgICAgICBk
dF9kcHJpbnRrKCJDaGVjayBpZiAlcyBpcyBiZWhpbmQgdGhlIElPTU1VIGFuZCBhZGQgaXRcbiIs
Cj4gICAgICAgICAgICAgICAgICAgICAgZHRfbm9kZV9mdWxsX25hbWUoZGV2KSk7Cj4gLSAgICAg
ICAgICAgIHJldHVybiByZXM7Cj4gKwo+ICsgICAgICAgIGlvbW11X2FkZF9kdF9kZXZpY2UoZGV2
KTsKClJldHVybiB2YWx1ZSBzaG91bGQgYWx3YXlzIGJlIGNoZWNrZWQgb3IgZXhwbGFpbiB3aHkg
dGhpcyBpcyBub3QgZG9uZS4KClsuLi5dCgo+ICAgaW50IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1
Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwp
Cj4gICB7Cj4gQEAgLTE3Nyw2ICsyNDEsMTMgQEAgaW50IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1
Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgICAgIH0KPiAgIAo+ICsgICAgICAgIGlvbW11X2FkZF9kdF9kZXZpY2Uo
ZGV2KTsKClNhbWUgaGVyZS4KCj4gKyAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX3Byb3RlY3Rl
ZChkZXYpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAg
ICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0KClRoaXMgaXMgYWxyZWFkeSBjaGVja2VkIGlu
IGlvbW11X2Fzc2lnbl9kdF9kZXZpY2UoKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
