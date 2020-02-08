Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF641567DE
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 22:36:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0XiW-0002RT-E0; Sat, 08 Feb 2020 21:32:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CP/8=34=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j0XiV-0002RO-7S
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2020 21:32:43 +0000
X-Inumbo-ID: 89ba9d28-4aba-11ea-a759-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ba9d28-4aba-11ea-a759-bc764e2007e4;
 Sat, 08 Feb 2020 21:32:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j0XiT-0007cM-RL; Sat, 08 Feb 2020 21:32:41 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j0XiT-0008Dy-H3; Sat, 08 Feb 2020 21:32:41 +0000
Date: Sat, 8 Feb 2020 16:31:43 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200208163143.d4zgfabm5k26hp23@debian>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208151939.31691-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBGZWIgMDgsIDIwMjAgYXQgMDM6MTk6MzlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgd3JpdHRlbiBBQkkgc3RhdGVzIHRoYXQgJWVzIHdpbGwgYmUgc2V0IHVwLCBi
dXQgbGlieGMgZG9lc24ndCBkbyBzby4gIEluCj4gcHJhY3RpY2UsIGl0IGJyZWFrcyBgcmVwIG1v
dnNgIGluc2lkZSBndWVzdHMgYmVmb3JlIHRoZXkgcmVsb2FkICVlcy4KPiAKPiBUaGUgd3JpdHRl
biBBQkkgZG9lc24ndCBtZW50aW9uICVzcywgYnV0IGxpYnhjIGRvZXMgc2V0IGl0IHVwLiAgSGF2
aW5nICVkcwo+IGRpZmZlcmVudCB0byAlc3MgaXMgb2Jub3hvdXMgdG8gd29yayB3aXRoLCBhcyBk
aWZmZXJlbnQgcmVnaXN0ZXJzIGhhdmUKPiBkaWZmZXJlbnQgaW1wbGljaXQgc2VnbWVudHMuCj4g
Cj4gTW9kaWZ5IHRoZSBzcGVjIHRvIHN0YXRlIHRoYXQgJXNzIGlzIHNldCB1cCBhcyBhIGZsYXQg
cmVhZC93cml0ZSBzZWdtZW50Lgo+IFRoaXMgYSkgbWF0Y2hlcyB0aGUgTXVsdGlib290IDEgc3Bl
YywgYikgbWF0Y2hlcyB3aGF0IGlzIHNldCB1cCBpbiBwcmFjdGljZSwKPiBhbmQgYykgaXMgdGhl
IG1vcmUgc2FuZSBiZWhhdmlvdXIgZm9yIGd1ZXN0cyB0byB1c2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
