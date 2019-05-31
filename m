Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383C311B3
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 17:55:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWjpf-0005Mi-Gn; Fri, 31 May 2019 15:52:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWjpd-0005MV-NU
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:52:37 +0000
X-Inumbo-ID: 1bd16a8f-83bc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1bd16a8f-83bc-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 15:52:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55952341;
 Fri, 31 May 2019 08:52:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE7C53F59C;
 Fri, 31 May 2019 08:52:33 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
 <20190530165123.22593-1-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ffd5f689-085a-34f4-d150-5221783c0083@arm.com>
Date: Fri, 31 May 2019 16:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530165123.22593-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH] ts-kernel-build: Disable
 CONFIG_ARCH_QCOM in Xen Project CI
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMzAvMDUvMjAxOSAxNzo1MSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gICAgZHJp
dmVycy9maXJtd2FyZS9xY29tX3NjbS5jOjQ2OTo0NzogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQg
MyBvZiBgZG1hX2FsbG9jX2NvaGVyZW50JyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg
Wy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gCj4gVGhpcyBpcyBmaXhlZCBi
eQo+IAo+ICAgIGZpcm13YXJlOiBxY29tX3NjbTogVXNlIHByb3BlciB0eXBlcyBmb3IgZG1hIG1h
cHBpbmdzCj4gCj4gYnV0IHRoaXMgaXMgbm90IHByZXNlbnQgaW4gYWxsIHJlbGV2YW50IHN0YWJs
ZSBicmFuY2hlcy4KPiAKPiBXZSBjdXJyZW50bHkgaGF2ZSBubyBRdWFsY29tbSBoYXJkd2FyZSBp
biB0aGUgWGVuIFByb2plY3QgdGVzdCBsYWIgc28KPiB3ZSBkbyBub3QgbmVlZCB0aGlzIGVuYWJs
ZWQuCj4gCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwo+IENDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g
Q0M6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KPiBDQzogQW5keSBHcm9zcyA8
YWdyb3NzQGtlcm5lbC5vcmc+Cj4gQ0M6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29u
QGxpbmFyby5vcmc+Cj4gQ0M6IEF2YW5lZXNoIEt1bWFyIER3aXZlZGkgPGFrZHdpdmVkQGNvZGVh
dXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgoKRldJVzoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKPiAtLS0KPiAgIHRzLWtlcm5lbC1idWlsZCB8IDQgKysrKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90cy1rZXJuZWwtYnVpbGQg
Yi90cy1rZXJuZWwtYnVpbGQKPiBpbmRleCBmN2QwNTliMC4uNTUzNjU4NmYgMTAwNzU1Cj4gLS0t
IGEvdHMta2VybmVsLWJ1aWxkCj4gKysrIGIvdHMta2VybmVsLWJ1aWxkCj4gQEAgLTI3NCw2ICsy
NzQsMTAgQEAgc2V0b3B0IENPTkZJR19NRElPX1RIVU5ERVI9bQo+ICAgc2V0b3B0IENPTkZJR19J
MkNfVEhVTkRFUlg9bQo+ICAgc2V0b3B0IENPTkZJR19TUElfVEhVTkRFUlg9bQo+ICAgCj4gKyMg
U29tZSBMaW51eCBicmFuY2hlcyB3ZSBjYXJlIGFib3V0LCBpbmNsdWRpbmcgNC4xOSwgc3RpbGwg
bGFjawo+ICsjIGZpcm13YXJlOiBxY29tX3NjbTogVXNlIHByb3BlciB0eXBlcyBmb3IgZG1hIG1h
cHBpbmdzCj4gK0NPTkZJR19BUkNIX1FDT009bgo+ICsKPiAgICMjIyMKPiAgIAo+ICAgRU5ECj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
