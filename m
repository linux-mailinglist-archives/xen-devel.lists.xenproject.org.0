Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363CA1100A3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:53:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9UT-00012J-4t; Tue, 03 Dec 2019 14:49:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9UR-00012E-2Z
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:49:23 +0000
X-Inumbo-ID: 173a2c68-15dc-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 173a2c68-15dc-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 14:49:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2906DB310;
 Tue,  3 Dec 2019 14:49:21 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-5-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c32e24fd-00bf-ff5a-f57b-d73ba249fb15@suse.com>
Date: Tue, 3 Dec 2019 15:49:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191130115737.15752-5-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/8] x86: introduce hypervisor framework
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiBXZSB3aWxsIHNvb24gaW1wbGVt
ZW50IEh5cGVyLVYgc3VwcG9ydCBmb3IgWGVuLiBBZGQgYSBmcmFtZXdvcmsgZm9yCj4gdGhhdC4K
PiAKPiBUaGlzIHJlcXVpcmVzIG1vdmluZyBzb21lIG9mIHRoZSBoeXBlcnZpc29yXyogZnVuY3Rp
b25zIGZyb20geGVuLmggdG8KPiBoeXBlcnZpc29yLmguCj4gCj4gU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CndpdGggb25lIG1vcmUgYWRqdXN0bWVudCAoc29ycnkgZm9yIG5vdGljaW5n
IG9ubHkgbm93KToKCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnZpc29yLmMKPiBAQCAtMCwwICsxLDQ1IEBACj4gKy8qKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
PiArICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gKyAqCj4gKyAqIFN1cHBvcnQgZm9y
IGRldGVjdGluZyBhbmQgcnVubmluZyB1bmRlciBhIGh5cGVydmlzb3IuCj4gKyAqCj4gKyAqIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5Cj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4gKyAqIChhdCB5b3Vy
IG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ICsgKiBidXQg
V0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
Zgo+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UuICBTZWUgdGhlCj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCj4gKyAqCj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFt
OyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4gKyAqCj4gKyAq
IENvcHlyaWdodCAoYykgMjAxOSBNaWNyb3NvZnQuCj4gKyAqLwo+ICsjaW5jbHVkZSA8eGVuL2lu
aXQuaD4KPiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ICsKPiArI2luY2x1ZGUgPGFzbS9jYWNo
ZS5oPgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KPiArCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgX19yZWFkX21vc3RseSAqb3BzOwoKVGhlIF9fcmVh
ZF9tb3N0bHkgaXMgbWlzcGxhY2VkIC0gaXQncyBhbiBhdHRyaWJ1dGUgb2YgdGhlIHZhcmlhYmxl
LApub3QgaXRzIHR5cGUsIGFuZCBoZW5jZSBiZWxvbmdzIGFmdGVyIHRoZSAqIC4gSXQganVzdCBz
byBoYXBwZW5zCnRoYXQgdGhlIGNvbXBpbGVyIGlzIChzdGlsbCkgcmVsYXRpdmVseSByZWxheGVk
IGluIHdoYXQgaXQgYWNjZXB0cywKYnV0IEkgdGhpbmsgYXQgbGVhc3QgdGhlIGdjYyBtYW51YWwg
aGFzIGEgd2FybmluZyB0b3dhcmRzIGZ1dHVyZQptb3JlIHN0cmljdCBiZWhhdmlvci4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
