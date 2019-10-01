Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDC2C3096
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:50:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEio-0007lk-QZ; Tue, 01 Oct 2019 09:45:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFEin-0007le-IY
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:45:29 +0000
X-Inumbo-ID: 337dfc03-e430-11e9-96f7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 337dfc03-e430-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 09:45:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31FC21000;
 Tue,  1 Oct 2019 02:45:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45F1A3F739;
 Tue,  1 Oct 2019 02:45:27 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
 <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
 <2ce8fb9f-d365-cabf-6a98-e61ac525d4e5@arm.com>
 <3c901636-732f-446e-8a64-94149939d175@suse.com>
 <a00e52df-6475-31a8-bfac-844de29b9c72@arm.com>
 <a3fb54e1-9296-7016-85c3-4eb2e26506a2@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a204a396-3932-3738-156f-b01094936843@arm.com>
Date: Tue, 1 Oct 2019 10:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a3fb54e1-9296-7016-85c3-4eb2e26506a2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDEvMTAvMjAxOSAxMDo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAwMS8xMC8yMDE5IDEwOjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEphbiwKPj4KPj4g
T24gMDEvMTAvMjAxOSAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAwMS4xMC4yMDE5
IDExOjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gMDEvMTAvMjAxOSAwMDoyMSwgQW5k
cmV3IENvb3BlciB3cm90ZToKPj4+Pj4gT24gMzAvMDkvMjAxOSAyMToxNywgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+Pj4+Pj4gTXkgd29ycnkgaXMgdGhpcyBnYXRlIGNvbmZpZyBnYXRlIG5vdGhpbmcg
b24gQXJtIHNvIHRoZSB1c2VyIG1heSBoYXZlCj4+Pj4+PiBhIGZhbHNlIHNlbnNlIHRoYXQgaXQg
Y2FuIGJlIHVzZWQgKGV2ZW4gdGhvdWdoIGl0IGlzIGNsZWFybHkgQlJPS0VOKS4KPj4+Pj4+Cj4+
Pj4+PiBBbHNvIHRoZSBuYW1lIGlzIHF1aXRlIGNsb3NlIHRvIHRoZSBDT05GSUdfSEFSREVOX1BS
RURJQ1RPUiBvbiBBcm0KPj4+Pj4+IGFuZAo+Pj4+Pj4gbWF5IGNvbmZ1c2UgdXNlci4gQWx0aG91
Z2gsIEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBuYW1lIHNvIGZhciA6Lwo+Pj4+Pgo+Pj4+PiBUaGUg
ImRlcGVuZHMgb24gQlJPS0VOIiBtZWFucyBpdCB3aWxsIG5ldmVyIHNob3cgdXAgdG8gYSB1c2Vy
IGluCj4+Pj4+IG1lbnVjb25maWcsIHdoaWNoIGlzIHdoeSBpdCB3YXMgb25seSBDQyB0byB4ODYs
IGFuZCBub3QgdG8gcmVzdC4KPj4+Pgo+Pj4+IFdoYXQncyB0aGUgbG9uZyB0ZXJtIHBsYW4gZm9y
IHRoaXMgb3B0aW9uPyBBcmUgeW91IHBsYW5uaW5nIHRvCj4+Pj4gcmVtb3ZlIGl0Cj4+Pj4gY29t
cGxldGVseSBvciBqdXN0IHRoZSBkZXBlbmRlbmNpZXMgb24gQlJPS0VOPwo+Pj4+Cj4+Pj4gTXkg
Y29uY2VybiBpcyBpZiB0aGlzIG9wdGlvbiB3aWxsIGV2ZXIgYmVjb21lIHNlbGVjdGFibGUgdGhl
biBpdAo+Pj4+IHdpbGwgbm90IGRvaW5nCj4+Pj4gd2hhdCdzIGV4cGVjdGVkIG9uIEFybS4KPj4+
Pgo+Pj4+IFNvLCBldmVuIGlmIGluIHByaW5jaXBsZSBpdCBpcyBhcmNoIGFnbm9zdGljLCBpdCBm
ZWVscyB0byBtZSB0aGlzCj4+Pj4gb3B0aW9uIHNob3VsZAo+Pj4+IGJldHRlciBiZSBpbXBsZW1l
bnRlZCBpbiB4ODYvS2NvbmZpZy4KPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHNvLCBuby4gV2hlbiBC
Uk9LRU4gaXMgdG8gYmUgcmVtb3ZlZCwgaXQgb3VnaHQgdG8gYmUKPj4+IHJlcGxhY2VkIGJ5IGEg
c3VpdGFibGUgImRlcGVuZHMgb24gSEFWRV8qIiwgd2hpY2ggQXJtIGNvdWxkIGNob29zZQo+Pj4g
dG8gbm90IHNlbGVjdC4KPj4KPj4gU28gdGhlcmUgYXJlIGFuIGV4cGVjdGF0aW9uIHRoaXMgb3B0
aW9uIHdpbGwgYmUgdXNlZCBieSBjb21tb24gY29kZSBpbgo+PiB0aGUgZnV0dXJlPwo+IAo+IEl0
IGFscmVhZHkgaXMuwqAgQVJNIGhhcyBzdHVicyBmb3IgZXZhbHVhdGVfbm9zcGVjKCkgZXRjLgo+
IAo+IE15IGd1dCBmZWVsaW5nIGlzIHRoYXQgdGhlIG9ubHkgd2F5IHRoaXMgaXMgZ29pbmcgdG8g
YmUgcmVzb2x2ZWQgc2FuZWx5Cj4gaXMgd2l0aCBhIGNvbXBpbGVyIGZlYXR1cmUgb3IgcGx1Z2lu
LCBhdCB3aGljaCBwb2ludCBpdCByZWFzb25hYmx5IGNhbgo+IGJlIGNyb3NzLWFyY2guCgpGYWly
IGVub3VnaC4gSSBkb24ndCBoYXZlIGFueSBtb3JlIGNvbmNlcm4gdGhlbi4gSSB3aWxsIGhhdmUg
YSB0aGluayBhYm91dCB0aGUgCm5hbWluZyBvciB0aGUgcG9zc2libHkgdG8gbWVyZ2UgdGhlIHR3
byBjb25maWdzICh0aGUgY29tbW9uIGFuZCBhcm0gb25lcykgdG9nZXRoZXIuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
