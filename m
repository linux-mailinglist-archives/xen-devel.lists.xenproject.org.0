Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEC326DC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 05:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXdUI-0001cy-Hd; Mon, 03 Jun 2019 03:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXdUG-0001cR-Sp
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 03:18:16 +0000
X-Inumbo-ID: 354d6968-85ae-11e9-a547-275df4f13f3a
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 354d6968-85ae-11e9-a547-275df4f13f3a;
 Mon, 03 Jun 2019 03:18:09 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 11:15:56 +0800
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <140f6edd3e9647abaf56d75df9131cd9@sslemail.net>
 <D13DE1D6-CE96-4A41-941E-FC4161CFA1EA@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <c3a361ab-8923-2d20-441e-279f82482530@mxnavi.com>
Date: Mon, 3 Jun 2019 11:18:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <D13DE1D6-CE96-4A41-941E-FC4161CFA1EA@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDUvMzEvMTkgMjA6NTgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4KPj4gT24gTWF5IDMxLCAy
MDE5LCBhdCAxMjoxMCBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToK
Pj4KPj4+Pj4gT24gMzAuMDUuMTkgYXQgMTI6MTcsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3
cm90ZToKPj4+IERlZmF1bHQ6IGVuYWJsZWQuCj4+PiBDYW4gYmUgZGlzYWJsZWQgZm9yIHNtYWxs
ZXIgY29kZSBmb290cHJpbnQuCj4+IEJ1dCB5b3UncmUgYXdhcmUgdGhhdCB3ZSdyZSwgZm9yIG5v
dyBhdCBsZWFzdCwgdHJ5aW5nIHRvIGxpbWl0IHRoZQo+PiBudW1iZXIgb2YgaW5kZXBlbmRlbnRs
eSBzZWxlY3RhYmxlIGNvbmZpZyBvcHRpb25zPyBPbmVzIGRlcGVuZGluZwo+PiBvbiBFWFBFUlQg
YXJlIHNvcnQgb2YgYW4gZXhjZXB0aW9uIGluIGNlcnRhaW4gY2FzZXMuCj4gSeKAmW0gdHJ5aW5n
IHRvIHJlbWVtYmVyIGV4YWN0bHkgd2hhdCB3ZSBoYXZlIG9yIGhhdmVu4oCZdCBkZWNpZGVkLiAg
SSB0YWtlIGl0IHlvdSB0aGluayB3ZSBzaG91bGQgYXZvaWQgaGF2aW5nIGEgbG9hZCBvZiBpbmRl
cGVuZGVudGx5LXNlbGVjdGFibGUgY29uZmlndXJhdGlvbnMgdG8gc3VwcG9ydD8KPgo+IEJhb2Rv
bmcsIHdoYXQgd2FzIHlvdXIgbWFpbiBwdXJwb3NlIGluIGFkZGluZyBhIHBhdGNoIGxpa2UgdGhp
cz8gIEp1c3QgdG8gbWFrZSB0aGluZ3MgYSBiaXQgdGlkaWVyLCBvciB3YXMgaXQgdG8gdHJ5IHRv
IGdvIHRocm91Z2ggYW5kIGdlbmVyYXRlIGEgZmFyIHNtYWxsZXIgaHlwZXJ2aXNvciBjb2RlYmFz
ZSAoZm9yIGluc3RhbmNlLCBwZXJoYXBzIHRvIG1ha2Ugc2FmZXR5IGNlcnRpZmljYXRpb24gbW9y
ZSB0cmFjdGFibGUpPwoKSGVsbG8gR2VvcmdlLCB5ZXMgeWVzLCBzbWFsbGVyIGNvZGUgYmFzZSBm
b3Igc2FmZXR5IGNlcnRpZmljYXRpb24gaXMgCnVuZGVyIG15IHRob3VnaHQuCgpwbGFuIHRvIHJ1
biB4ZW4gZm9yIGF1dG9tb3RpdmUgdXNlIGNhc2Ugb24gYXJtIChwZXJoYXBzIGkuTVg4ICkgZGV2
aWNlcy4KCj4KPiBJIHRoaW5rIHdl4oCZdmUgdGFsa2VkIGFib3V0IHRoaXMgYmVmb3JlLCBidXQg
b3VyIGJhc2ljIG9wdGlvbnMsIGFzIGZhciBhcyBzdXBwb3J0LCB3b3VsZCBiZToKPgo+IDEuIEhh
dmUgYSBzaW5nbGUgbGFyZ2UgY29uZmlnIG9wdGlvbiB3aGljaCBkaXNhYmxlZCBsYXJnZSBzd2F0
aGVzIG9mIHVudXNlZCBmdW5jdGlvbmFsaXR5Cj4gMi4gSGF2ZSBpbmRpdmlkdWFsIGJpdHMgY29u
ZmlndXJhYmxlLCBidXQgaGF2ZSBvbmx5IGEgaGFuZGZ1bCBvZiDigJxzZWN1cml0eSBzdXBwb3J0
ZWTigJ0gY29uZmlndXJhdGlvbnMuCj4KPiBUaGUgaWRlYSB3aXRoICMyIGlzIHRoYXQgd2XigJlk
IGhhdmUgYSDigJxjZXJ0aWZpY2F0aW9u4oCdIGNvbmZpZyB0aGF0IHdlIHRlc3RlZCBhbmQgc2Vj
dXJpdHkgc3VwcG9ydGVkLCB3aXRoIGFsbCBvZiB0aGVzZSBpbmRpdmlkdWFsIGJpdHMgb2ZmLCBh
cyB3ZWxsIGFzIOKAnGNsb3Vk4oCdIGFuZCDigJxjbGllbnTigJ0gY29uZmlncyB3aXRoIGFsbCBv
ZiB0aGVzZSDigJxvcHRpb25hbOKAnSBiaXRzIG9uIChvciBzb21lIHN1YnNldCBvbiwgZGVwZW5k
aW5nIG9uIHdoYXQgZWFjaCBjb21tdW5pdHkgdGhvdWdodCBtYWRlIHRoZSBtb3N0IHNlbnNlIGZv
ciB0aGVpciB1c2UgY2FmZSkuICBJZiBwZW9wbGUgd2FudGVkIHRvIGVuYWJsZSBvciBkaXNhYmxl
IGluZGl2aWR1YWwgY29uZmlnIG9wdGlvbnMgb3V0c2lkZSBmbyB0aG9zZSwgdGhleeKAmWQgYmUg
dGFraW5nIGEgcmlzayB3cnQgYnJlYWthZ2UgKG5vdCB0ZXN0ZWQpIG9yIHNlY3VyaXR5IGlzc3Vl
cyAobm8gWFNBIGlzc3VlZCB1bmxlc3MgaXQgYWZmZWN0ZWQgb25lIG9mIHRoZSBzdXBwb3J0ZWQg
Y29uZmlncykuCkkgbGlrZSB0aGUgaWRlYSBhYm91dCAnY2VydGlmaWNhdGlvbicgY29uZmlnLgo+
IFJpY2ggLyBEYW5pZWwsIGFtIEkgb24gdGhlIHJpZ2h0IHRyYWNrIGhlcmU/ICBBbnkgdGhvdWdo
dHM/Cj4KPiAgIC1HZW9yZ2UKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
