Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CAFDF94
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:02:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc81-00010b-Hr; Fri, 15 Nov 2019 13:59:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVc80-00010V-1m
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:59:12 +0000
X-Inumbo-ID: 19597da8-07b0-11ea-a26f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19597da8-07b0-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:59:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5EC8AF21;
 Fri, 15 Nov 2019 13:59:10 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-9-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12c09d1b-cc27-4060-bc11-d818b609350f@suse.com>
Date: Fri, 15 Nov 2019 14:59:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191021155718.28653-9-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v3 8/9] x86: be more verbose when
 running on a hypervisor
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
c2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAgLTY4OSw2ICs2ODksNyBA
QCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+
ICAgICAgaW50IGksIGosIGU4MjBfd2FybiA9IDAsIGJ5dGVzID0gMDsKPiAgICAgIGJvb2wgYWNw
aV9ib290X3RhYmxlX2luaXRfZG9uZSA9IGZhbHNlLCByZWxvY2F0ZWQgPSBmYWxzZTsKPiAgICAg
IGludCByZXQ7Cj4gKyAgICBib29sIHJ1bm5pbmdfb25faHlwZXJ2aXNvcjsKPiAgICAgIHN0cnVj
dCBuczE2NTUwX2RlZmF1bHRzIG5zMTY1NTAgPSB7Cj4gICAgICAgICAgLmRhdGFfYml0cyA9IDgs
Cj4gICAgICAgICAgLnBhcml0eSAgICA9ICduJywKPiBAQCAtNzYzLDcgKzc2NCw3IEBAIHZvaWQg
X19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICAg
KiBhbGxvY2luZyBhbnkgeGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBpbiBsb3dlciBtZW1vcnku
ICovCj4gICAgICBrZXhlY19lYXJseV9jYWxjdWxhdGlvbnMoKTsKPiAgCj4gLSAgICBoeXBlcnZp
c29yX3Byb2JlKCk7Cj4gKyAgICBydW5uaW5nX29uX2h5cGVydmlzb3IgPSBoeXBlcnZpc29yX3By
b2JlKCk7Cj4gIAo+ICAgICAgcGFyc2VfdmlkZW9faW5mbygpOwo+ICAKPiBAQCAtNzg5LDYgKzc5
MCw5IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJp
X3ApCj4gIAo+ICAgICAgcHJpbnRrKCJYZW4gaW1hZ2UgbG9hZCBiYXNlIGFkZHJlc3M6ICUjbHhc
biIsIHhlbl9waHlzX3N0YXJ0KTsKPiAgCj4gKyAgICBpZiAoIHJ1bm5pbmdfb25faHlwZXJ2aXNv
ciApCj4gKyAgICAgICAgcHJpbnRrKCJSdW5uaW5nIG9uICVzXG4iLCBoeXBlcnZpc29yX25hbWUo
KSk7CgpJbnN0ZWFkIG9mIGEgYm9vbCwgd2h5IGRvbid0IHlvdSBtYWtlIGh5cGVydmlzb3JfcHJv
YmUoKSByZXR1cm4gdGhlCm5hbWUgKG9yIE5VTEwpLCBhdm9pZGluZyB0aGUgc2VwYXJhdGUgaHlw
ZXJ2aXNvcl9uYW1lKCkgKGFuZCBtYWtpbmcKaXQgbW9vdCBmb3IgbWUgdG8gYXNrIGZvciBpdCB0
byBiZWNvbWUgX19pbml0KT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
