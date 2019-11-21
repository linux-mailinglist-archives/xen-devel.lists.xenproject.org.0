Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F295E1050CB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:43:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXjss-0006SK-AE; Thu, 21 Nov 2019 10:40:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXjsq-0006SF-EQ
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:40:20 +0000
X-Inumbo-ID: 4f7c332c-0c4b-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f7c332c-0c4b-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 10:40:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C96A8B2B1;
 Thu, 21 Nov 2019 10:40:17 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191121101904.10295-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6c044574-c9b0-32c9-2577-8a4dfcc74b9a@suse.com>
Date: Thu, 21 Nov 2019 11:40:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191121101904.10295-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMTkgMTE6MTksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBDdXJyZW50IGNvZGUg
dW5jb25kaXRpb25hbGx5IHByZXZlbnRzIHNldHRpbmcgQVBJQ19TUElWX0ZPQ1VTX0RJU0FCTEVE
Cj4gcmVnYXJkbGVzcyBvZiB0aGUgcHJvY2Vzc29yIG1vZGVsLCB3aGljaCBpcyBub3QgY29ycmVj
dCBhY2NvcmRpbmcgdG8KPiB0aGUgc3BlY2lmaWNhdGlvbi4KPiAKPiBUaGlzIGlzc3VlIHdhcyBk
aXNjb3ZlcmVkIHdoaWxlIHRyeWluZyB0byBib290IGEgcHZzaGltIHdpdGggeDJBUElDCj4gZW5h
YmxlZC4KPiAKPiBBbHdheXMgYWxsb3cgc2V0dGluZyBBUElDX1NQSVZfRk9DVVNfRElTQUJMRUQ6
IHRoZSBsb2NhbCBBUElDCj4gcHJvdmlkZWQgdG8gZ3Vlc3RzIGlzIGVtdWxhdGVkIGJ5IFhlbiwg
YW5kIGFzIHN1Y2ggZG9lc24ndCBkZXBlbmQgb24KPiB0aGUgZmVhdHVyZXMgZm91bmQgb24gdGhl
IGhhcmR3YXJlIHByb2Nlc3Nvci4gTm90ZSBmb3IgZXhhbXBsZSB0aGF0Cj4gWGVuIG9mZmVycyB4
MkFQSUMgc3VwcG9ydCB0byBndWVzdHMgZXZlbiB3aGVuIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJl
Cj4gZG9lc24ndCBoYXZlIHN1Y2ggZmVhdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
