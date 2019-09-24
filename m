Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D11BCC05
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:03:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCnFA-0004FV-UQ; Tue, 24 Sep 2019 16:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCnF8-0004FI-Ov
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:00:46 +0000
X-Inumbo-ID: 778c7622-dee4-11e9-9623-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 778c7622-dee4-11e9-9623-12813bfff9fa;
 Tue, 24 Sep 2019 16:00:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0232142F;
 Tue, 24 Sep 2019 09:00:44 -0700 (PDT)
Received: from [10.1.39.57] (unknown [10.1.39.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F3E73F694;
 Tue, 24 Sep 2019 09:00:44 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
 <20190924154633.852828-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <aebcb855-c69b-caff-a09d-75d0bf4ad6ed@arm.com>
Date: Tue, 24 Sep 2019 17:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924154633.852828-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] xen/arm: optee: update description
 in Kconfig
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

SGksCgpPbiA5LzI0LzE5IDQ6NDYgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IE9QLVRF
RSBtZWRpYXRvciBub3cgaXMgIlRlY2ggUHJldmlldyIgc3RhdGUsIGFuZCB3ZSB3YW50IHRvIHVw
ZGF0ZQo+IGl0J3MgZGVzY3JpcHRpb24gaW4gS2NvbmZpZyBhY2NvcmRpbmdseS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywK
Cj4gCj4gLS0tCj4gCj4gTm90ZSB0byBjb21taXRlcjogdGhpcyBwYXRjaCBkZXBlbmRzIG9uIGZp
cnN0IDQgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3RlZS9L
Y29uZmlnIHwgOSArKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZp
ZyBiL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZpZwo+IGluZGV4IGI0YjZhYTI2MTAuLjM5MjE2OWIy
NTUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3RlZS9LY29uZmlnCj4gQEAgLTMsNyArMyw4IEBAIGNvbmZpZyBPUFRFRQo+ICAgCWRl
ZmF1bHQgbgo+ICAgCWRlcGVuZHMgb24gVEVFCj4gICAJaGVscAo+IC0JICBFbmFibGUgZXhwZXJp
bWVudGFsIE9QLVRFRSBtZWRpYXRvci4gSXQgYWxsb3dzIGd1ZXN0cyB0byBhY2Nlc3MKPiAtCSAg
T1AtVEVFIHJ1bm5pbmcgb24geW91ciBwbGF0Zm9ybS4gVGhpcyByZXF1aXJlcyB2aXJ0dWFsaXph
dGlvbi1lbmFibGVkCj4gLQkgIE9QLVRFRSBwcmVzZW50LiBZb3UgY2FuIGxlYXJuIG1vcmUgYWJv
dXQgdmlydHVhbGl6YXRpb24gZm9yIE9QLVRFRQo+IC0JICBhdCBodHRwczovL29wdGVlLnJlYWR0
aGVkb2NzLmlvL2FyY2hpdGVjdHVyZS92aXJ0dWFsaXphdGlvbi5odG1sCj4gKwkgIEVuYWJsZSB0
aGUgT1AtVEVFIG1lZGlhdG9yLiBJdCBhbGxvd3MgZ3Vlc3RzIHRvIGFjY2Vzcwo+ICsJICBPUC1U
RUUgcnVubmluZyBvbiB5b3VyIHBsYXRmb3JtLiBUaGlzIHJlcXVpcmVzCj4gKwkgIHZpcnR1YWxp
emF0aW9uLWVuYWJsZWQgT1AtVEVFIHByZXNlbnQuIFlvdSBjYW4gbGVhcm4gbW9yZQo+ICsJICBh
Ym91dCB2aXJ0dWFsaXphdGlvbiBmb3IgT1AtVEVFIGF0Cj4gKwkgIGh0dHBzOi8vb3B0ZWUucmVh
ZHRoZWRvY3MuaW8vYXJjaGl0ZWN0dXJlL3ZpcnR1YWxpemF0aW9uLmh0bWwKPiAKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
