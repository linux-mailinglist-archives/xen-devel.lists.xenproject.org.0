Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312371341B1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:29:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAQo-0002Od-GH; Wed, 08 Jan 2020 12:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipAQn-0002OQ-5J
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:27:25 +0000
X-Inumbo-ID: 34902860-3212-11ea-a455-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34902860-3212-11ea-a455-bc764e2007e4;
 Wed, 08 Jan 2020 12:27:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB6B8AD78;
 Wed,  8 Jan 2020 12:27:15 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200107173902.13768-1-liuwe@microsoft.com>
 <20200107173902.13768-3-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9459334-15f2-f2ae-ffcb-89a634b33211@suse.com>
Date: Wed, 8 Jan 2020 13:27:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107173902.13768-3-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/hyperv: drop all __packed from
 hyperv-tlfs.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxODozOSwgV2VpIExpdSB3cm90ZToKPiBBbGwgc3RydWN0dXJlcyBhcmUg
YWxyZWFkeSBuYXR1cmFsbHkgYWxpZ25lZC4gTGludXggYWRkZWQgdGhvc2UKPiBhdHRyaWJ1dGVz
IG91dCBvZiBwYXJhbm9pYS4KPiAKPiBJbiBYZW4gd2UndmUgaGFkIGluc3RhbmNlIHdlIGhhZCB0
byBkcm9wIHBvaW50bGVzcyBfX3BhY2tlZCB0byBwbGFjYXRlCj4gZ2NjIDkgKHNlZSBjYTkzMTBi
MjRlKSwgaXQgaXMgYmV0dGVyIGRyb3AgdGhvc2UgYXR0cmlidXRlcy4KPiAKPiBSZXF1ZXN0ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
