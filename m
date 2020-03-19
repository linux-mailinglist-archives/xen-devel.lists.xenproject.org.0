Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE618B2FA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 13:09:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEtx1-0003B3-3j; Thu, 19 Mar 2020 12:07:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dEF6=5E=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jEtwz-0003Aw-Td
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 12:07:01 +0000
X-Inumbo-ID: 234d9d28-69da-11ea-bbee-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 234d9d28-69da-11ea-bbee-12813bfff9fa;
 Thu, 19 Mar 2020 12:07:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9AE73AB7F;
 Thu, 19 Mar 2020 12:07:00 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-4-jgross@suse.com>
 <d6bad3fd-93b7-5835-4c46-dd2382dfd67e@suse.com>
 <388ab30a-f4ce-113a-aefd-7ad4b0124f9e@suse.com>
 <f0d87b5a-d55b-7761-c36c-e3d38a873945@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f2522c1a-fca0-579d-7033-34671a318f92@suse.com>
Date: Thu, 19 Mar 2020 13:07:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f0d87b5a-d55b-7761-c36c-e3d38a873945@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/4] xen/rcu: add assertions to debug
 build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAgMDg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE4LjAzLjIwMjAgMDc6
MjYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE3LjAzLjIwIDE1OjM2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEzLjAzLjIwMjAgMTQ6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gWGVuJ3MgUkNVIGltcGxlbWVudGF0aW9uIHJlbGllcyBvbiBubyBzb2Z0aXJxIGhhbmRsaW5n
IHRha2luZyBwbGFjZQo+Pj4+IHdoaWxlIGJlaW5nIGluIGEgUkNVIGNyaXRpY2FsIHNlY3Rpb24u
IEFkZCBBU1NFUlQoKXMgaW4gZGVidWcgYnVpbGRzCj4+Pj4gaW4gb3JkZXIgdG8gY2F0Y2ggYW55
IHZpb2xhdGlvbnMuCj4+Pj4KPj4+PiBGb3IgdGhhdCBwdXJwb3NlIG1vZGlmeSByY3VfcmVhZF9b
dW5dbG9jaygpIHRvIHVzZSBhIGRlZGljYXRlZCBwZXJjcHUKPj4+PiBjb3VudGVyIGFkZGl0aW9u
YWwgdG8gcHJlZW1wdF9bZW58ZGlzXWFibGUoKSBhcyB0aGlzIGVuYWJsZXMgdG8gdGVzdAo+Pj4+
IHRoYXQgY29uZGl0aW9uIGluIF9fZG9fc29mdGlycSgpIChBU1NFUlRfTk9UX0lOX0FUT01JQygp
IGlzIG5vdAo+Pj4+IHVzYWJsZSB0aGVyZSBkdWUgdG8gX19jcHVfdXAoKSBjYWxsaW5nIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcygpCj4+Pj4gd2hpbGUgaG9sZGluZyB0aGUgY3B1IGhvdHBsdWcg
bG9jaykuCj4+Pj4KPj4+PiBXaGlsZSBhdCBpdCBzd2l0Y2ggdGhlIHJjdV9yZWFkX1t1bl1sb2Nr
KCkgaW1wbGVtZW50YXRpb24gdG8gc3RhdGljCj4+Pj4gaW5saW5lIGZ1bmN0aW9ucyBpbnN0ZWFk
IG9mIG1hY3Jvcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+Pj4gd2l0aCBvbmUgcmVtYXJrOgo+Pj4KPj4+PiBAQCAtOTEsMTYgKzExNCwyMyBA
QCB0eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVhZF9sb2NrX3Q7Cj4+Pj4gwqDC
oCAqIHdpbGwgYmUgZGVmZXJyZWQgdW50aWwgdGhlIG91dGVybW9zdCBSQ1UgcmVhZC1zaWRlIGNy
aXRpY2FsIAo+Pj4+IHNlY3Rpb24KPj4+PiDCoMKgICogY29tcGxldGVzLgo+Pj4+IMKgwqAgKgo+
Pj4+IC0gKiBJdCBpcyBpbGxlZ2FsIHRvIGJsb2NrIHdoaWxlIGluIGFuIFJDVSByZWFkLXNpZGUg
Y3JpdGljYWwgc2VjdGlvbi4KPj4+PiArICogSXQgaXMgaWxsZWdhbCB0byBwcm9jZXNzIHNvZnRp
cnFzIHdoaWxlIGluIGFuIFJDVSByZWFkLXNpZGUgCj4+Pj4gY3JpdGljYWwgc2VjdGlvbi4KPj4+
Cj4+PiBUaGUgbGF0ZXN0IHdpdGggdGhlIHJlLWFkZGVkIHByZWVtcHRfZGlzYWJsZSgpLCB3b3Vs
ZG4ndCB0aGlzIGJldHRlcgo+Pj4gc2F5ICIuLi4gdG8gcHJvY2VzcyBzb2Z0aXJxcyBvciBibG9j
ayAuLi4iPwo+Pgo+PiBJIGNhbiBhZGQgdGhpcywgYnV0IE9UT0ggYmxvY2tpbmcgd2l0aG91dCBw
cm9jZXNzaW5nIHNvZnRpcnFzIGlzIG5vdAo+PiBwb3NzaWJsZSwgYXMgdGhlcmUgaXMgbm8gb3Ro
ZXIgKGxlZ2FsKSB3YXkgdG8gZW50ZXIgdGhlIHNjaGVkdWxlci4KPiAKPiBTdXJlLCBidXQgdGhh
dCdzIHN0aWxsIGltcGxpY2l0LCBidXQgY291bGQgZG8gd2l0aCBzYXlpbmcgZXhwbGljaXRseS4K
Ck9rYXkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
