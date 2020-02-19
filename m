Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C8163CC1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 06:39:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4I14-00026K-1q; Wed, 19 Feb 2020 05:35:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4I11-00026F-Qj
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 05:35:19 +0000
X-Inumbo-ID: 9cf9a3da-52d9-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cf9a3da-52d9-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 05:35:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4DC33AE24;
 Wed, 19 Feb 2020 05:35:17 +0000 (UTC)
To: Thomas Gleixner <tglx@linutronix.de>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
Date: Wed, 19 Feb 2020 06:35:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/ioperm: add new paravirt function
 update_io_bitmap
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, stable@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAgMjI6MDMsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyaXRlczoKPj4gQ29tbWl0IDExMWU3YjE1Y2YxMGY2ICgieDg2
L2lvcGVybTogRXh0ZW5kIElPUEwgY29uZmlnIHRvIGNvbnRyb2wKPj4gaW9wZXJtKCkgYXMgd2Vs
bCIpIHJld29ya2VkIHRoZSBpb3BsIHN5c2NhbGwgdG8gdXNlIEkvTyBiaXRtYXBzLgo+Pgo+PiBV
bmZvcnR1bmF0ZWx5IHRoaXMgYnJva2UgWGVuIFBWIGRvbWFpbnMgdXNpbmcgdGhhdCBzeXNjYWxs
IGFzIHRoZXJlCj4+IGlzIGN1cnJlbnRseSBubyBJL08gYml0bWFwIHN1cHBvcnQgaW4gUFYgZG9t
YWlucy4KPj4KPj4gQWRkIEkvTyBiaXRtYXAgc3VwcG9ydCB2aWEgYSBuZXcgcGFyYXZpcnQgZnVu
Y3Rpb24gdXBkYXRlX2lvX2JpdG1hcAo+PiB3aGljaCBYZW4gUFYgZG9tYWlucyBjYW4gdXNlIHRv
IHVwZGF0ZSB0aGVpciBJL08gYml0bWFwcyB2aWEgYQo+PiBoeXBlcmNhbGwuCj4+Cj4+IEZpeGVz
OiAxMTFlN2IxNWNmMTBmNiAoIng4Ni9pb3Blcm06IEV4dGVuZCBJT1BMIGNvbmZpZyB0byBjb250
cm9sIGlvcGVybSgpIGFzIHdlbGwiKQo+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS41Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gVGVzdGVkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gRHVoLCBzb3JyeSBhYm91dCB0aGF0IGFuZCB0
aGFua3MgZm9yIGZpeGluZyBpdC4KPiAKPiBCVFcsIHdoeSBpc24ndCBzdHVmZiBsaWtlIHRoaXMg
bm90IGNhdGNoZWQgZHVyaW5nIG5leHQgb3IgYXQgbGVhc3QKPiBiZWZvcmUgdGhlIGZpbmFsIHJl
bGVhc2U/IElzIG5vdGhpbmcgcnVubmluZyBDSSBvbiB1cHN0cmVhbSB3aXRoIGFsbAo+IHRoYXQg
WEVOIG11Y2sgYWN0aXZlPwoKVGhpcyBwcm9ibGVtIHNob3dlZCB1cCBieSBub3QgYmVpbmcgYWJs
ZSB0byBzdGFydCB0aGUgWCBzZXJ2ZXIgKHByb2JhYmx5Cm5vdCB0aGUgZnJlc2hlc3Qgb25lKSBp
biBkb20wIG9uIGEgbW9kZXJhdGUgYWdlZCBBTUQgc3lzdGVtLgoKT3VyIENJIHRlc3RzIHRlbmQg
ZG8gYmUgbW9yZSB0ZXh0IGNvbnNvbGUgYmFzZWQgZm9yIGRvbTAuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
