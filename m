Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C200A67D5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 13:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57Ib-0000l8-MO; Tue, 03 Sep 2019 11:48:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i57Ia-0000kz-P9
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 11:48:36 +0000
X-Inumbo-ID: c2a31210-ce40-11e9-8853-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a31210-ce40-11e9-8853-bc764e2007e4;
 Tue, 03 Sep 2019 11:48:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9715BAF68;
 Tue,  3 Sep 2019 11:48:34 +0000 (UTC)
To: Christoph Hellwig <hch@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
 <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
 <20190830085807.GA15771@infradead.org>
 <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
 <20190902155732.GA8311@infradead.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8e81051f-ad50-7b4e-2e88-c685ade6b240@suse.com>
Date: Tue, 3 Sep 2019 13:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902155732.GA8311@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: Peng Fan <peng.fan@nxp.com>, "will@kernel.org" <will@kernel.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Julien Grall <Julien.Grall@arm.com>, dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, nd <nd@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMTkgMTc6NTcsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIEZyaSwgQXVn
IDMwLCAyMDE5IGF0IDA3OjQwOjQyUE0gLTA3MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4gKyBKdWVyZ2VuLCBCb3Jpcwo+Pgo+PiBPbiBGcmksIDMwIEF1ZyAyMDE5LCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPj4+IENhbiB3ZSB0YWtlIGEgc3RlcCBiYWNrIGFuZCBmaWd1cmUgb3V0
IHdoYXQgd2Ugd2FudCB0byBkbyBoZXJlPwo+Pj4KPj4+IEFGQUlDUyB0aGlzIGZ1bmN0aW9uIGFs
bG9jYXRlcyBtZW1vcnkgZm9yIHRoZSBzd2lvdGxiLXhlbiBidWZmZXIsCj4+PiBhbmQgdGhhdCBt
ZWFucyBpdCBtdXN0IGJlIDw9IDMyLWJpdCBhZGRyZXNzYWJsZSB0byBzYXRpc2Z5IHRoZSBETUEg
QVBJCj4+PiBndWFyYW50ZWVzLiAgVGhhdCBtZWFucyB3ZSBnZW5lcmFsbHkgd2FudCB0byB1c2Ug
R0ZQX0RNQTMyIGV2ZXJ5d2hlcmUKPj4+IHRoYXQgZXhpc3RzLCBidXQgb24gc3lzdGVtcyB3aXRo
IG9kZCB6b25lcyB3ZSBtaWdodCB3YW50IHRvIGRpcCBpbnRvCj4+PiBHRlBfRE1BLiAgVGhpcyBh
bHNvIG1lYW5zIHN3aW90bGIteGVuIGRvZXNuJ3QgYWN0dWFsbHkgZG8gdGhlIHJpZ2h0Cj4+PiB0
aGluZyBvbiB4ODYgYXQgdGhlIG1vbWVudC4gIFNvIHNob3VsZG4ndCB3ZSBqdXN0IGhhdmUgb25l
IGNvbW1vbgo+Pj4gcm91dGluZSBpbiBzd2lvdGxiLXhlbi5jIHRoYXQgY2hlY2tzIGlmIHdlIGhh
dmUgQ09ORklHX1pPTkVfRE1BMzIKPj4+IHNldCwgdGhlbiB0cnkgR0ZQX0RNQTMyLCBhbmQgaWYg
bm90IGNoZWNrIGlmIENPTkZJR19aT05FX0RNQSBpcyBzZXQKPj4+IGFuZCB0aGVuIHRyeSB0aGF0
LCBlbHNlIGRlZmF1bHQgdG8gR0ZQX0tFUk5FTD8KPj4KPj4gWWVzLCBmb3IgQVJNL0FSTTY0IGl0
IG1ha2VzIGEgbG90IG9mIHNlbnNlIGdpdmVuIHRoYXQgZG9tMCBpcyAxOjEgbWFwcGVkCj4+IChw
c2V1ZG8tcGh5c2ljYWwgPT0gcGh5c2ljYWwpLiAgSSdsbCBsZXQgSnVlcmdlbiBhbmQgQm9yaXMg
Y29tbWVudCBvbgo+PiB0aGUgeDg2IHNpZGUgb2YgdGhpbmdzLCBidXQgb24geDg2IFBWIERvbTAg
aXMgbm90IDE6MSBtYXBwZWQgc28KPj4gR0ZQX0RNQTMyIGlzIHByb2JhYmx5IG5vdCBtZWFuaW5n
ZnVsLgo+IAo+IEJ1dCBpcyBpdCBhY3R1YWxseSBoYXJtZnVsPyAgSWYgdGhlIEdGUF9ETUEzMiBk
b2Vzbid0IGh1cnQgd2UgY291bGQKPiBqdXN0IHVzZSBpdCB0aGVyZS4gIE9yIGlmIHRoYXQgc2Vl
bXMgdG8gdWdseSB3ZSBjYW4gbWFrZSB0aGUgZG1hCj4gZmxhZ3MgZGVwZW5kZW50cyBvbiBhIFhF
Tl8xVE8xX01BUFBFRCBjb25maWcgb3B0aW9uIHNldCBieSBhcm0vYXJtNjQuCj4gCgpJJ2QgcmF0
aGVyIGhhdmUgaXQgb25seSBpZiBuZWVkZWQuIEVzcGVjaWFsbHkgb24gWDg2IFBWIGRvbTAgSSdk
IGxpa2UgdG8KYXZvaWQgR0ZQX0RNQTMyIGFzIG1lbW9yeSBiZWxvdyA0R0IgKGd1ZXN0IHBoeXNp
Y2FsKSBtaWdodCBiZSByYXRoZXIKc2NhcmNlIGluIHNvbWUgY29uZmlndXJhdGlvbnMuCgpJIHRo
aW5rIFg4NiBQVkggZG9tMCBzaG91bGQgbmVlZCBHRlBfRE1BMzIsIHRvbywgYXMgdGhlIGxpbWl0
IGlzIHJlbGF0ZWQKdG8gdGhlIGFkZHJlc3MgYXMgY29tbXVuaWNhdGVkIHRvIHRoZSBkZXZpY2Ug
KGJlZm9yZSBiZWluZyB0cmFuc2xhdGVkIGJ5CnRoZSBJT01NVSksIHJpZ2h0PyBUaGlzIHdvdWxk
IG1lYW4gb24gYSBYODYga2VybmVsIGNvbmZpZ3VyZWQgdG8gc3VwcG9ydApQViBhbmQgUFZIIHRo
ZSB0ZXN0IGZvciBzZXR0aW5nIEdGUF9ETUEzMiBjYW4ndCBkZXBlbmQgb24gYSBjb25maWcKb3B0
aW9uIGFsb25lLCBpdCBuZWVkcyB0byBiZSBkeW5hbWljLgoKQlRXLCBmb3IgUFYgZ3Vlc3RzIHRo
ZSBETUEgYWRkcmVzcyB3aWR0aCBpcyBoYW5kbGVkIHZpYQp4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNf
cmVnaW9uKCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
