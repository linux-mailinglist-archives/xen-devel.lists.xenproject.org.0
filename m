Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011AAEE6A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:21:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7huY-0002NJ-RG; Tue, 10 Sep 2019 15:18:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7huX-0002N3-9t
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:18:29 +0000
X-Inumbo-ID: 3b734186-d3de-11e9-ac1f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3b734186-d3de-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:18:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53A0B1000;
 Tue, 10 Sep 2019 08:18:24 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C5C43F71F;
 Tue, 10 Sep 2019 08:18:21 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
 <c3c41841ac809b600241b41400f18e12971aad8f.1567596460.git-series.lars.kurth@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2db8eb91-9ac2-8db5-cf98-2f7ef60ac0da@arm.com>
Date: Tue, 10 Sep 2019 16:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c3c41841ac809b600241b41400f18e12971aad8f.1567596460.git-series.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] Add V section entry to allow
 identification of Xen MAINTAINERS file
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDkvNC8xOSAxMjozMCBQTSwgTGFycyBLdXJ0aCB3cm90ZToKPiBUaGlzIGNo
YW5nZSBwcm92aWRlcyBzdWZmaWNpZW50IGluZm9ybWF0aW9uIHRvIGFsbG93IGdldF9tYWludGFp
bmVyLnBsIC8KPiBhZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0cyB0byBiZSBydW4gb24geGVuIHNp
c3RlciByZXBvc2l0b3JpZXMgc3VjaCBhcwo+IG1pbmktb3MuZ2l0LCBvc3N0ZXN0LmdpdCwgZXRj
Cj4gCj4gQSBzdWdnZXN0ZWQgdGVtcGxhdGUgZm9yIHNpc3RlciByZXBvc2l0b3JpZXMgb2YgWGVu
IGlzCj4gCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiBUaGlzIGZpbGUgZm9sbG93cyB0aGUgc2FtZSBjb252ZW50aW9ucyBhcyBvdXRs
aW5lZCBpbgo+IHhlbi5naXQ6TUFJTlRBSU5FUlMuIFBsZWFzZSByZWZlciB0byB0aGUgZmlsZSBp
biB4ZW4uZ2l0Cj4gZm9yIG1vcmUgaW5mb3JtYXRpb24uCj4gCj4gVEhFIFJFU1QKPiBNOiAgICAg
IE1BSU5UQUlORVIxIDxtYWludGFpbmVyMUBlbWFpbC5jb20+Cj4gTTogICAgICBNQUlOVEFJTkVS
MiA8bWFpbnRhaW5lcjJAZW1haWwuY29tPgo+IEw6ICAgICAgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4gUzogICAgICBTdXBwb3J0ZWQKPiBGOiAgICAgICoKPiBGOiAgICAgICovCj4g
VjogICAgICB4ZW4tbWFpbnRhaW5lcnMtMQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0
aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
