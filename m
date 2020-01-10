Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2761373F6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:45:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipxNn-0004BN-Kh; Fri, 10 Jan 2020 16:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipxNn-0004BH-2I
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:43:35 +0000
X-Inumbo-ID: 566220c8-33c8-11ea-bf69-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 566220c8-33c8-11ea-bf69-12813bfff9fa;
 Fri, 10 Jan 2020 16:43:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A656DB22F;
 Fri, 10 Jan 2020 16:43:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200109193241.14542-1-andrew.cooper3@citrix.com>
 <20200109193241.14542-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a2aefb6-d9b1-9569-81da-fc9136aab816@suse.com>
Date: Fri, 10 Jan 2020 17:43:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109193241.14542-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/boot: Remove the preconstructed
 low 16M superpage mappings
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAyMDozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVzZSBhcmUgbGVm
dCBvdmVyIGZyb20gYy9zIGIyODA0NDIyICJ4ODY6IG1ha2UgWGVuIGVhcmx5IGJvb3QgY29kZQo+
IHJlbG9jYXRhYmxlIiwgd2hpY2ggbWFkZSBpdCBwb3NzaWJsZSBmb3IgWGVuIG5vdCB0byBiZSBp
biB0aGUgYm90dG9tIDE2TS4KPiAKPiBOb3RoaW5nIHVzaW5nIHRoZSBtYXBwaW5ncyBhbnkgbW9y
ZS4gIEJ1aWxkIHRoZW0gaW4gdGhlIGRpcmVjdG1hcCB3aGVuIHdhbGtpbmcKPiB0aGUgRTgyMCB0
YWJsZSBhbG9uZyB3aXRoIGV2ZXJ5dGhpbmcgZWxzZS4KPiAKPiBGdXJ0aGVybW9yZSwgaXQgaXMg
dW5kZWZpbmVkIHRvIGhhdmUgc3VwZXJwYWdlcyBhbmQgTVRSUnMgZGlzYWdyZWUgb24KPiBjYWNo
ZWFiaWxpdHkgYm91bmRhcmllcywgYW5kIG5vdGhpbmcgYWN0dWFsbHkgY2hlY2tzLiAgV2hpbGUg
d2UgZG9uJ3QgZml4IHRoaXMKPiBleHBsaWNpdGx5LCB3ZSBkbyBhdCBsZWFzdCBob25vdXIgdGhl
IEU4MjAgbm93IGlmIGl0IHNheXMgdGhlcmUgYXJlIGJvdW5kYXJpZXMKPiBpbiB0aGlzIHJhbmdl
Lgo+IAo+IEFzIGEgY29uc2VxdWVuY2UsIHRoZXJlIGFyZSBub3cgbm8gX1BBR0VfUFJFU0VOVCBl
bnRyaWVzIGJldHdlZW4KPiBfX3BhZ2VfdGFibGVzX3tzdGFydCxlbmR9IHdoaWNoIG5lZWQgdG8g
c2tpcCByZWxvY2F0aW9uLiAgVGhpcyBzaW1wbGlmaWVzIHRoZQo+IE1CMS8yIGVudHJ5IHBhdGgg
bG9naWMgdG8gcmVtb3ZlIHRoZSBsMl9pZGVudG1hcFtdIHNwZWNpYWwgY2FzZS4KPiAKPiBUaGUg
bG93IDJNICh1c2luZyA0ayBwYWdlcykgaXMgcmV0YWluZWQgZm9yIG5vdy4gIEFtb25nc3Qgb3Ro
ZXIgdGhpbmdzLCBpdAo+IG1hdHRlcnMgZm9yIGNvbnNvbGUgbG9nZ2luZyB3aGlsZSB0aGUgbGVn
YWN5IFZHQSBob2xlIGlzIGluIHVzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
