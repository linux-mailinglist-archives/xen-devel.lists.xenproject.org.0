Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC811CE18
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 14:18:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifOKK-0003ST-Ub; Thu, 12 Dec 2019 13:16:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifOKJ-0003SM-IW
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 13:16:19 +0000
X-Inumbo-ID: 8d7558ec-1ce1-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d7558ec-1ce1-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 13:16:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0BCC2AD11;
 Thu, 12 Dec 2019 13:16:05 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1576154413.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d383e7c3-9590-d023-614d-cd598931bdfb@suse.com>
Date: Thu, 12 Dec 2019 14:16:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cover.1576154413.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 0/2] Refactor super page shattering
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxMzo0NiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gbWFwX3BhZ2VzX3RvX3hl
biBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyB1c2UgYWxtb3N0IGV4YWN0bHkgdGhlIHNhbWUKPiBw
YWdlIHNoYXR0ZXJpbmcgbG9naWMsIGFuZCB0aGUgY29kZSBpcyBtaW5nbGVkIHdpdGggb3RoZXIg
UFRFCj4gbWFuaXB1bGF0aW9ucyBzbyBpdCBpcyBsZXNzIG9idmlvdXMgdGhhdCB0aGUgaW50ZW50
aW9uIGlzIHBhZ2UKPiBzaGF0dGVyaW5nLiBGYWN0b3Igb3V0IHRoZSBmdW5jdGlvbnMgdG8gbWFr
ZSB0aGVtIHJldXNhYmxlIGFuZCB0byBtYWtlCj4gdGhlIGludGVudGlvbiBtb3JlIG9idmlvdXMu
Cj4gCj4gT2YgY291cnNlLCB0aGVyZSBpcyBub3QgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IHNoYXR0ZXJpbmcgbG9naWMgb2YKPiBlYWNoIGxldmVsLCBzbyB3ZSBjb3VsZCBmdXJ0aGVyIHR1
cm4gdGhlIHBlci1sZXZlbCBmdW5jdGlvbnMgaW50byBhCj4gc2luZ2xlIG1hY3JvLCBhbHRob3Vn
aCB0aGlzIGlzIG5vdCB0aGF0IHNpbXBsZSBzaW5jZSB3ZSBoYXZlIHBlci1sZXZlbAo+IGZ1bmN0
aW9ucyBhbmQgbWFjcm9zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgdGhlcmUgYXJlIHNsaWdodCBk
aWZmZXJlbmNlcwo+IGJldHdlZW4gbGV2ZWxzLiBLZWVwIGl0IHBlci1sZXZlbCBmb3Igbm93LgoK
RldJVyB0aGVzZSBsb29rIG9rYXkgdG8gbWUgbm93LCBhbmQgSSB3b3VsZCBnaXZlIHRoZW0gbXkg
Ui1iIHdpdGhvdXQKaWYgdGhlcmUgd2Fzbid0IHRoZSB0eXBlIHNhZmV0eSBpc3N1ZS4gQW5kcmV3
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
