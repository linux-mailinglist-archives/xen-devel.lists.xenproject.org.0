Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7146E1EE1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:09:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIEE-0004wa-O9; Wed, 23 Oct 2019 15:07:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u5x0=YQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iNIEC-0004wQ-Oi
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:07:12 +0000
X-Inumbo-ID: c9cf3e47-f5a6-11e9-9482-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c9cf3e47-f5a6-11e9-9482-12813bfff9fa;
 Wed, 23 Oct 2019 15:07:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE3243E8;
 Wed, 23 Oct 2019 08:07:11 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9133F718;
 Wed, 23 Oct 2019 08:07:11 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023150103.31562-1-ian.jackson@eu.citrix.com>
 <20191023150103.31562-2-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <986c12bb-a7f2-bb37-10f9-c2d59698bcf3@arm.com>
Date: Wed, 23 Oct 2019 16:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023150103.31562-2-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] make-flight: Drop arm64 with
 Linux before 4.10
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMjMvMTAvMjAxOSAxNjowMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gVGhlIGRy
aXZlciBmb3IgdGhlIGxheHRvbnMnIG5ldHdvcmsgY2FyZHMgaXMgbm90IGluIDQuNCAoYW5kIHRo
YXQncwo+IHF1aXRlIG9sZCkuICBPdXIgVGh1bmRlclgncyBtYXkgZXZlbiByZXF1aXJlIHNvbWV0
aGluZyBtb3JlIHJlY2VudCBidXQKPiB3ZSB3aWxsIGNyb3NzIHRoYXQgYnJpZGdlIHdoZW4gd2Ug
c2VlIGl0Lgo+IAo+IEVmZmVjdCBpcyB0byBkcm9wIHRoZSBmb2xsb3dpbmcgam9iczoKPiAgICBs
aW51eC00LjEgICphcm02NCoKPiAgICBsaW51eC00LjQgICphcm02NCoKPiAgICBsaW51eC00Ljkg
ICphcm02NCoKPiAoQ2hlY2tlZCBieSBleWViYWxsaW5nIHN0YW5kYWxvbmUtZ2VuZXJhdGUtZHVt
cC1mbGlnaHQtcnVudmFycyBkaWZmLikKPiAKPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgoKRldJVzoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKQ2hlZXJzLAoKPiAtLS0KPiAgIG1ha2UtZmxpZ2h0IHwgOCArKysrKysrLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9tYWtlLWZsaWdodCBiL21ha2UtZmxpZ2h0Cj4gaW5kZXggZjkwZmU3N2MuLmJlNjIwYzZkIDEw
MDc1NQo+IC0tLSBhL21ha2UtZmxpZ2h0Cj4gKysrIGIvbWFrZS1mbGlnaHQKPiBAQCAtMTgzLDcg
KzE4Myw3IEBAIGpvYl9jcmVhdGVfdGVzdF9maWx0ZXJfY2FsbGJhY2sgKCkgewo+ICAgYXJjaF9i
cmFuY2hfZmlsdGVyX2NhbGxiYWNrICgpIHsKPiAgICAgbG9jYWwgYXJjaD0kMQo+ICAgICBjYXNl
ICIkYXJjaCIgaW4KPiAtICBhcm0qKQo+ICsgIGFybWhmKQo+ICAgICAgICAgICBjYXNlICIkYnJh
bmNoIiBpbgo+ICAgICAgICAgICBsaW51eC0zLjApIHJldHVybiAxOzsKPiAgICAgICAgICAgbGlu
dXgtMy40KSByZXR1cm4gMTs7Cj4gQEAgLTE5MSw2ICsxOTEsMTIgQEAgYXJjaF9icmFuY2hfZmls
dGVyX2NhbGxiYWNrICgpIHsKPiAgICAgICAgICAgbGludXgtMy4xNCkgcmV0dXJuIDE7Owo+ICAg
ICAgICAgICBlc2FjCj4gICAgICAgICAgIDs7Cj4gKyAgYXJtNjQpCj4gKyAgICAgICAgY2FzZSAi
JGJyYW5jaCIgaW4KPiArICAgICAgICBsaW51eC0zLiopIHJldHVybiAxOzsKPiArICAgICAgICBs
aW51eC00Lj8pIHJldHVybiAxOzsKPiArICAgICAgICBlc2FjCj4gKyAgICAgICAgOzsKPiAgICAg
ZXNhYwo+ICAgICBjYXNlICIkYXJjaCIgaW4KPiAgICAgYXJtKikKPiAKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
