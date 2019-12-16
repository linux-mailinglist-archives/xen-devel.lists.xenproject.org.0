Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15F1205D0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:33:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpWi-0003y1-2H; Mon, 16 Dec 2019 12:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igpWg-0003xq-PO
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:31:02 +0000
X-Inumbo-ID: eb56547c-1fff-11ea-9398-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb56547c-1fff-11ea-9398-12813bfff9fa;
 Mon, 16 Dec 2019 12:31:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F366AF92;
 Mon, 16 Dec 2019 12:31:00 +0000 (UTC)
To: Jin Nan Wang <jnwang@suse.com>
References: <20191216082718.20922-1-jnwang@suse.com>
 <034e70b7-58df-a144-5339-697368410afb@suse.com>
 <a4f3ac09-d0e0-c5b1-b2ed-f7fa2ffc7e21@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e43c2898-1aa0-fd76-1057-bb4fa1f51243@suse.com>
Date: Mon, 16 Dec 2019 13:31:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a4f3ac09-d0e0-c5b1-b2ed-f7fa2ffc7e21@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Xen missing prompt log when exec-sp=off
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxMjo1MSwgSmluIE5hbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDE2LzEyLzIw
MTkgNzowMCBwbSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE2LjEyLjIwMTkgMDk6MjcsIEpp
biBOYW4gV2FuZyB3cm90ZToKPj4+IEZpeCBhIGlzc3VlIHdoZW4gdXNlciBkaXNhYmxlIEVUUCBl
eGVjLXNwLCB4ZW4gbWlzc2VkIGEgcHJvbXB0Cj4+PiBsb2cgaW4gZG1lc2cuCj4+IFdoeSAibWlz
c2VkIiAoYW5kIHdoeSAicHJvbXB0Iik/IEkgdGhpbmsgdGhlIG9yaWdpbmFsIGludGVudGlvbgo+
PiB3YXMgdG8gbG9nIGEgbWVzc2FnZSBvbmx5IHdoZW4gbm8gY29tbWFuZCBsaW5lIG9wdGlvbiB3
YXMgZ2l2ZW4KPj4gYW5kIHRoZSBzeXN0ZW0gd291bGQgYmUgdnVsbmVyYWJsZSB3aXRob3V0IHRo
ZSBkaXNhYmxpbmcuCj4gCj4gWWVzLCBJIGd1ZXNzIGl0Lgo+IAo+IEJ1dCB3aGVuIEkgdGVzdCBl
cHQ9ZXhlYy1zcD1vZmYuIEkgZ290IGEgbGl0dGxlIGNvbmZ1c2VkLgo+IAo+IEJlY2F1c2Ugb2Yg
dGhlICJwcm9tcHQiIHRlbGwgbWUgaXQncyBkaXNhYmxlZCwgYXQgZGVmYXVsdC4KPiAKPiB3aGVu
IEkgYWRkICdlcHQ9ZXhlYy1zcD1vZmYnLCB0aGUgInByb21wdCIgaXMgZGlzYXBwZWFyZWQuIEl0
IHNlZW1zIGxpa2UgCj4gaXQncyBFTkFCTEVELgoKQnV0IHdoZW4geW91IGRvbid0IHNlZSB0aGUg
bG9nIG1lc3NhZ2UgKHdoaWNoIGJ0dyBpcyBub3QgYSBwcm9tcHQpCnRoZSBuZXh0IHN0ZXAgdGhl
biB3b3VsZCBiZSB0byBjaGVjayB0aGUgY29tbWFuZCBsaW5lLiBXaGVuIHlvdQpzZWUgIm9mZiIg
dGhlcmUsIHlvdSdsbCBrbm93IGl0J3Mgb2ZmLiBObyBjb25mdXNpb24gYXQgYWxsLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
