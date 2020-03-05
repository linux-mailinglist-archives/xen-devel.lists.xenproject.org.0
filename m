Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BD17A304
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 11:21:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9nab-0002QF-N8; Thu, 05 Mar 2020 10:18:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9naa-0002QA-1k
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 10:18:48 +0000
X-Inumbo-ID: b32193fa-5eca-11ea-a551-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b32193fa-5eca-11ea-a551-12813bfff9fa;
 Thu, 05 Mar 2020 10:18:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A4F7AE2D;
 Thu,  5 Mar 2020 10:18:46 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <d323139d-97ef-0c76-8ec6-a669f5b0ba2d@eikelenboom.it>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bb3965c5-6724-b261-260b-d07e40176802@suse.com>
Date: Thu, 5 Mar 2020 11:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d323139d-97ef-0c76-8ec6-a669f5b0ba2d@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] xen boot PVH guest with linux 5.6.0-rc4-ish kernel:
 general protection fault, RIP: 0010:__pv_queued_spin_lock_slowpath
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAgMTg6NTIsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPiBIaSBKdWVyZ2Vu
LAo+IAo+IEp1c3QgdGVzdGVkIGEgNS42LjAtcmM0J2lzaCBrZXJuZWwgKDhiNjE0Y2I4ZjFkY2Fj
OGNhNzdjZjRkZDg1ZjQ2ZWYzMDU1ZjgyMzgsIHNvIGl0IGluY2x1ZGVzIHRoZSB4ZW4gZml4ZXMg
ZnJvbSB4ODYgdHJlZXMpLgo+IFhlbiBpcyB0aGUgbGF0ZXN0IHhlbi11bnN0YWJsZSwgZG9tMCBr
ZXJuZWwgaXMgNS41LjcuCj4gCj4gRHVyaW5nIGJvb3Qgb2YgdGhlIFBWSCBndWVzdCBJIGdvdCB0
aGUgc3BsYXQgYmVsb3cuCj4gV2l0aCBhIDUuNS43IGtlcm5lbCB0aGUgZ3Vlc3QgYm9vdHMgZmlu
ZS4KClRoZXJlIHdlcmUgMiBidWdzLiBJIGhhdmUgc2VudCB0aGUgcGF0Y2hlcy4KCkludGVyZXN0
aW5nLCB0aG91Z2gsIHRoYXQgeW91IGRpZCBzZWUgb25seSBvbmUgb2YgdGhlbSAoSSBoaXQgdGhl
CnNhbWUgYnVnIGFzIHlvdSBkaWQgb25seSBhZnRlciBmaXhpbmcgdGhlIHhlbmJ1cyBwcm9ibGVt
KS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
