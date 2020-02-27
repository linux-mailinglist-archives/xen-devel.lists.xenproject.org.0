Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0211171440
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:42:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7FeD-0007Pa-7q; Thu, 27 Feb 2020 09:40:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7FeB-0007PU-HS
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:39:59 +0000
X-Inumbo-ID: 1e254204-5945-11ea-961e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e254204-5945-11ea-961e-12813bfff9fa;
 Thu, 27 Feb 2020 09:39:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0099FADBB;
 Thu, 27 Feb 2020 09:39:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-2-andrew.cooper3@citrix.com>
 <f25da974-6fe3-5b0e-4ca1-a937b61d9b22@suse.com>
 <69658bb9-e4e2-dda7-d341-caea6846e794@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4bbd588-559d-1392-7253-8b512c7a2aef@suse.com>
Date: Thu, 27 Feb 2020 10:40:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <69658bb9-e4e2-dda7-d341-caea6846e794@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 01/10] x86/sysctl: Don't return cpu policy
 data for compiled-out support (2)
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

T24gMjcuMDIuMjAyMCAxMDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wMi8yMDIw
IDA3OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEp1c3QgYXMgd2l0aCBjL3MgOTZkYzc3YjRiMSBmb3IgWEVOX1NZ
U0NUTF9nZXRfY3B1X3BvbGljeSwKPj4+IFhFTl9TWVNDVExfZ2V0X2NwdV9mZWF0dXJlc2V0IG5l
ZWRzIHRvIGJlY29tZSBjb25kaXRpb25hbC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBBbGJlaXQgSSdkIHNheSAid2FudCIsIG5v
dCAibmVlZHMiIGluIHRoZSBkZXNjcmlwdGlvbi4KPiAKPiBJdCBvY2N1cnMgdG8gbWUgdGhhdCBY
RU5fU1lTQ1RMX2dldF9jcHVfZmVhdHVyZXNldCBpcyBzdHJpY3RseSBhIHN1YnNldAo+IG9mIFhF
Tl9TWVNDVExfZ2V0X2NwdV9wb2xpY3ksIGFuZCB0aGF0IG5vdyBJJ3ZlIGFkanVzdGVkIHRoZSB0
b29sc3RhY2sKPiBvbnRvIGdldF9jcHVfcG9saWN5LCB0aGUgc29sZSByZW1haW5pbmcgdXNlciBp
cyB4ZW4tY3B1aWQuCj4gCj4gZ2V0X2NwdV9wb2xpY3kgYWxyZWFkeSBoYXMgc2VwYXJhdGUgZGVm
YXVsdCBhbmQgbWF4IGluZGljZXMsIHdoZXJlYXMKPiBnZXRfY3B1X2ZlYXR1cmVzZXQgd2FzIHdy
aXR0ZW4gYmVmb3JlIHRoZSBuZWVkIGZvciB0aGlzIGhhcyBiZWNvbWUgb2J2aW91cy4KPiAKPiBU
aGlzIGxlYWRzIHRvIGFuIGFzeW1tZXRyeSBpbiB4ZW4tY3B1aWQsIHdoZXJlIHRoZSAtcCAocG9s
aWN5KSBvcHRpb24KPiBwcm92aWRlcyB0d28gbW9yZSBzZXRzIG9mIGluZm9ybWF0aW9uIHRoYW4g
dGhlIGZlYXR1cmVzZXQgbGlzdGluZy4KPiAKPiBJbnN0ZWFkLCBJIHRoaW5rIEknZCBsaWtlIHRv
IGRyb3AgWEVOX1NZU0NUTF9nZXRfY3B1X2ZlYXR1cmVzZXQgYW5kCj4gdXBkYXRlIHRoZSBzb2xl
IHVzZXIgdG8gdGhlIG1vcmUgY29tcGxldGUgaW50ZXJmYWNlLgoKU291bmRzIGxpa2UgYSBnb29k
IG1vdmUgdG8gbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
