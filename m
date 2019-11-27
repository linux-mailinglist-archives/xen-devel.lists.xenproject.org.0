Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD110AFD0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:55:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZwnU-0003NE-6E; Wed, 27 Nov 2019 12:51:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZwnS-0003N3-W2
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 12:51:55 +0000
X-Inumbo-ID: af94c788-1114-11ea-a3b1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af94c788-1114-11ea-a3b1-12813bfff9fa;
 Wed, 27 Nov 2019 12:51:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97127BA25;
 Wed, 27 Nov 2019 12:51:52 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20191126133023.48592-1-julien@xen.org>
 <8dd862df-433d-5b58-eacb-79a6b325ec2f@suse.com>
 <f1b6e591-7546-ab7e-8cce-bf7da1d72e37@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8d421db8-008a-de62-4460-07711f2a901d@suse.com>
Date: Wed, 27 Nov 2019 13:51:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <f1b6e591-7546-ab7e-8cce-bf7da1d72e37@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Update path to the livepatch
 documentation
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTM6NTAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAoK0p1ZXJnZW4pCj4gCj4g
SGksCj4gCj4gT24gMjYvMTEvMjAxOSAxNDowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2
LjExLjIwMTkgMTQ6MzAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IENvbW1pdCBkNjYxNjExZDA4
ICJkb2NzL21hcmtkb3duOiBTd2l0Y2ggdG8gdXNpbmcgcGFuZG9jLCBhbmQgZml4Cj4+PiB1bmRl
cnNjb3JlIGVzY2FwaW5nIiBjb252ZXJ0ZWQgdGhlIGxpdmVwYXRjaCBkb2N1bWVudGF0aW9uIGZy
b20gbWFya2Rvd24KPj4+IHRvIHBhbmRvYy4KPj4+Cj4+PiBVcGRhdGUgTUFJTlRBSU5FUlMgdG8g
cmVmbGVjdCB0aGUgY2hhbmdlIHNvIHRoZSBjb3JyZWN0IG1haW50YWluZXJzIGFyZQo+Pj4gQ0Nl
ZCB0byB0aGUgcGF0Y2hlcy4KPj4+Cj4+PiBGaXhlczogZDY2MTYxMWQwOCAoImRvY3MvbWFya2Rv
d246IFN3aXRjaCB0byB1c2luZyBwYW5kb2MsIGFuZCBmaXggCj4+PiB1bmRlcnNjb3JlIGVzY2Fw
aW5nIikKPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+
Cj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQEp1ZXJn
ZW46IFRoaXMgaXMganVzdCBhbiB1cGRhdGUgdG8gTUFJTlRBSU5FUlMgZmlsZS4gV291bGQgeW91
IGJlIGhhcHB5IAo+IHRvIHRha2UgaXQgZm9yIFhlbiA0LjEzPwoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
