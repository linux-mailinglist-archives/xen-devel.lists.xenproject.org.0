Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72931EE321
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:08:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRdtX-00050x-T1; Mon, 04 Nov 2019 15:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRdtW-00050s-Vh
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:03:51 +0000
X-Inumbo-ID: 4e69ae04-ff14-11e9-a181-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e69ae04-ff14-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D751AE68;
 Mon,  4 Nov 2019 15:03:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
Date: Mon, 4 Nov 2019 16:03:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMjAxOSAxNTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMS8yMDE5
IDEzOjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDEuMTEuMjAxOSAyMToyNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYwo+Pj4gKysr
IGIveGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jCj4+PiBAQCAtMjcwLDYgKzI3MCw3IEBAIHN0YXRp
YyB2b2lkIGVhcmx5X2luaXRfaW50ZWwoc3RydWN0IGNwdWluZm9feDg2ICpjKQo+Pj4gIAlpZiAo
ZGlzYWJsZSkgewo+Pj4gIAkJd3Jtc3JsKE1TUl9JQTMyX01JU0NfRU5BQkxFLCBtaXNjX2VuYWJs
ZSAmIH5kaXNhYmxlKTsKPj4+ICAJCWJvb3RzeW0odHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYp
IHw9IGRpc2FibGU7Cj4+PiArCQlib290c3ltKHRyYW1wb2xpbmVfZWZlcikgfD0gRUZFUl9OWDsK
Pj4+ICAJfQo+PiBJJ20gZmluZSB3aXRoIGFsbCBvdGhlciBjaGFuZ2VzIGhlcmUsIGp1c3QgdGhp
cyBvbmUgY29uY2VybnMgbWU6Cj4+IEJlZm9yZSB5b3VyIGNoYW5nZSB3ZSBsYXRjaCBhIHZhbHVl
IGludG8gdHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYKPj4ganVzdCB0byBiZSB1c2VkIGZvciBz
dWJzZXF1ZW50IElBMzJfTUlTQ19FTkFCTEUgd3JpdGVzIHdlIGRvLiBUaGlzCj4+IG1lYW5zIHRo
YXQsIG9uIGEgaHlwZXJ2aXNvciAobGlrZSBYZW4gaXRzZWxmKSBzaW1wbHkgZGlzY2FyZGluZwo+
PiBndWVzdCB3cml0ZXMgdG8gdGhlIE1TUiAod2hpY2ggaXMgImZpbmUiIHdpdGggdGhlIGRlc2Ny
aWJlZCB1c2FnZQo+PiBvZiBvdXJzIHVwIHRvIG5vdyksIHdpdGggeW91ciBjaGFuZ2Ugd2UnZCBu
b3cgZW5kIHVwIHRyeWluZyB0byBzZXQKPj4gRUZFUi5OWCB3aGVuIHRoZSBmZWF0dXJlIG1heSBu
b3QgYWN0dWFsbHkgYmUgZW5hYmxlZCBpbgo+PiBJQTMyX01JU0NfRU5BQkxFLiBXb3VsZG4ndCBz
dWNoIGFuIEVGRVIgd3JpdGUgYmUgbGlhYmxlIHRvICNHUCgwKT8KPj4gSS5lLiBkb24ndCB3ZSBu
ZWVkIHRvIHJlYWQgYmFjayB0aGUgTVNSIHZhbHVlIGhlcmUsIGFuZCB2ZXJpZnkKPj4gd2UgYWN0
dWFsbHkgbWFuYWdlZCB0byBjbGVhciB0aGUgYml0IGJlZm9yZSBhY3R1YWxseSBPUi1pbmcgaW4K
Pj4gRUZFUl9OWD8KPiAKPiBJZiB0aGlzIGlzIGEgcHJvYmxlbSBpbiBwcmFjdGljZSwgZXhlY3V0
aW9uIHdvbid0IGNvbnRpbnVlIGJleW9uZCB0aGUKPiBuZXh0IGlmKCkgY29uZGl0aW9uIGp1c3Qg
b3V0IG9mIGNvbnRleHQsIHdoaWNoIHNldCBFRkVSLk5YIG9uIHRoZSBCU1AKPiB3aXRoIGFuIHVu
Z3VhcmRlZCBXUk1TUi4KCkFuZCBob3cgaXMgdGhpcyBhbnkgZ29vZD8gVGhpcyBraW5kIG9mIGNy
YXNoIGlzIGV4YWN0bHkgd2hhdCBJJ20KYXNraW5nIHRvIGF2b2lkLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
