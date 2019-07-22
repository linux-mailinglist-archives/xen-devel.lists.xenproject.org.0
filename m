Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160F70054
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXr4-0005qZ-FF; Mon, 22 Jul 2019 12:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GkIe=VT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpXr3-0005qT-6T
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:55:49 +0000
X-Inumbo-ID: 04d770c8-ac80-11e9-a3dc-db61b59111b0
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04d770c8-ac80-11e9-a3dc-db61b59111b0;
 Mon, 22 Jul 2019 12:55:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53AAEB04C;
 Mon, 22 Jul 2019 12:55:44 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190721200623.GJ11726@bitfolk.com>
 <7d518504-b12b-a6b9-dc37-7fdb00f8d632@suse.com>
 <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
 <6b3c41f4-377e-0515-a6c8-8057c8dcd465@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d58c2d90-16b1-0172-116f-fde7c9981add@suse.com>
Date: Mon, 22 Jul 2019 14:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6b3c41f4-377e-0515-a6c8-8057c8dcd465@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Cc: Andy Smith <andy@strugglers.net>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMTkgMTQ6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIyLjA3LjIwMTkgMTQ6
MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IERvZXMgcmV2ZXJ0aW5nIGJhY2sgdG8gY3JlZGl0
MSBtYWtlIHRoZSBpc3N1ZSBnbyBhd2F5P8KgIEkndmUgbmV2ZXIKPj4gZW5jb3VudGVyZWQgdGhp
cyBvbiBhbnkgc210PTAgdGVzdCwgYnV0IEkgYWxzbyBkb24ndCB1c2UgY3JlZGl0MiBhdCBhbGwu
Cj4gCj4gSSdsbCB0cnkgdG8gcmVtZW1iZXIgdHJ5aW5nIHRoaXMgb3V0IHRoZSBuZXh0IHRpbWUg
SSBzZWUgaXQuIEkgY2FuJ3QKPiBzZWUgYSBjb25uZWN0aW9uIHRvIHRoZSB1c2VkIHNjaGVkdWxl
ciB0aG91Z2gsIHdoZW4gdGhlIG1lc3NhZ2UgY29tZXMKPiBvdXQgb2YgX19jcHVfZGllKCkuIFRo
ZXJlIG11c3QgYmUgYW4gZXhjZXNzaXZlIGRlbGF5IGZvciB0aGUgZHlpbmcKPiBDUFUgdG8gZmlu
YWxseSBjYWxsIGNwdV9leGl0X2NsZWFyKCkuIEkgd29uZGVyIGlmIHRoZSBDUFUgbWlnaHQgZS5n
Lgo+IGJlIHNjcnViYmluZyBtZW1vcnkgYXQgdGhhdCBwb2ludC4gQnV0IHRoYXQgc2hvdWxkbid0
IGhhcHBlbiB0aGlzCj4gZWFybHkuCj4gCj4+IFRoZSBzaWJsaW5nIHRocmVhZHMgc2hvdWxkbid0
IGJlIGluc2VydGVkIGludG8gdGhlIHNjaGVkdWxlciBpbiB0aGUKPj4gZmlyc3QgcGxhY2UsIGFu
ZCBJIHRob3VnaHQgd2UgdG9vayBkZWxpYmVyYXRlIHN0ZXBzIHRvIHByZXZlbnQgdGhhdCBmcm9t
Cj4+IG9jY3VycmluZy4KPiAKPiBJIGRvbid0IHRoaW5rIHdlIGRpZCwgYnV0IEkgYWdyZWUgdGhp
cyBtYXkgYmUgd29ydGh3aGlsZSB0byBkbyBpZiBpdAo+IHdvdWxkbid0IHJlc3VsdCBpbiBhZGRp
bmcgdWdseSBzcGVjaWFsIGNhc2VzIHNvbWV3aGVyZS4KCkhtbSwgSSB3b25kZXIgaWYgbXkgcGF0
Y2ggInhlbi9zY2hlZDogcG9wdWxhdGUgY3B1cG9vbDAgb25seSBhZnRlciBhbGwKY3B1cyBhcmUg
dXAiIGZyb20gbXkgY29yZSBzY2hlZHVsaW5nIHNlcmllcyBtaWdodCBoZWxwPwoKSSBhbHJlYWR5
IHRob3VnaHQgb2YgbW92aW5nIGl0IHJhdGhlciB0byB0aGUgYmVnaW5uaW5nIG9mIHRoZSBzZXJp
ZXMgYXMKaXQgY291bGQgZ28gaW4gZXZlbiB3aXRob3V0IHRoZSBjb3JlIHNjaGVkdWxpbmcuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
