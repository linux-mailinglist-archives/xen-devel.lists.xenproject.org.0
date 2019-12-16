Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58C12038E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:17:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igoL3-0004Lg-2V; Mon, 16 Dec 2019 11:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igoL1-0004LU-M2
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:14:55 +0000
X-Inumbo-ID: 4936304a-1ff5-11ea-9387-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4936304a-1ff5-11ea-9387-12813bfff9fa;
 Mon, 16 Dec 2019 11:14:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD3E2ACE1;
 Mon, 16 Dec 2019 11:14:53 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191213173742.1960441-1-george.dunlap@citrix.com>
 <20191213173742.1960441-4-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <609d2bb5-9b83-16be-f2c2-eacef344cd68@suse.com>
Date: Mon, 16 Dec 2019 12:15:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213173742.1960441-4-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] x86/mm: More discriptive names for page
 de/validation functions
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxODozNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBUaGUgZnVuY3Rpb25z
IGFsbG9jX3BhZ2VfdHlwZSgpLCBhbGxvY19sTl90YWJsZSgpLCBmcmVlX3BhZ2VfdHlwZSgpCj4g
YW5kIGZyZWVfbE5fdGFibGUoKSBhcmUgY29uZnVzaW5nbHkgbmFtZWQ6IG5vdGhpbmcgaXMgYmVp
bmcgYWxsb2NhdGVkCj4gb3IgZnJlZWQuICBSYXRoZXIsIHRoZSBwYWdlIGJlaW5nIHBhc3NlZCBp
biBpcyBiZWluZyBlaXRoZXIgdmFsaWRhdGVkCj4gb3IgZGV2YWxpZGF0ZWQgZm9yIHVzZSBhcyB0
aGUgc3BlY2lmaWMgdHlwZTsgaW4gdGhlIHNwZWNpZmljIGNhc2Ugb2YKPiBwYWdldGFibGVzLCB0
aGVzZSBtYXkgYmUgcHJvbW90ZWQgb3IgZGVtb3RlZCAoaS5lLiwgZ3JhYiBhcHByb3ByaWF0ZQo+
IHJlZmVyZW5jZXMgZm9yIFBURXMpLgo+IAo+IFJlbmFtZSBhbGxvY19wYWdlX3R5cGUoKSBhbmQg
ZnJlZV9wYWdlX3R5cGUoKSB0byB2YWxpZGF0ZV9wYWdlKCkgYW5kCj4gZGV2YWxpZGF0ZV9wYWdl
KCkuICBBbHNvIHJlbmFtZSBhbGxvY19zZWdkZXNjX3BhZ2UoKSB0bwo+IHZhbGlkYXRlX3NlZ2Rl
c2NfcGFnZSgpLCBzaW5jZSB0aGlzIGlzIHdoYXQgaXQncyBkb2luZy4KPiAKPiBSZW5hbWUgYWxs
b2NfbE5fdGFibGUoKSBhbmQgZnJlZV9sTl90YWJsZSgpIHRvIHByb21vdGVfbE5fdGFibGUoKSBh
bmQKPiBkZW1vdGVfbE5fdGFibGUoKSwgcmVzcGVjdGl2ZWx5Lgo+IAo+IEFmdGVyIHRoaXMgY2hh
bmdlOgo+IC0gZ2V0IC8gcHV0IHR5cGUgY29uc2lzdGVubHkgcmVmZXIgdG8gaW5jcmVhc2luZyBv
ciBkZWNyZWFzaW5nIHRoZSBjb3VudAo+IC0gdmFsaWRhdGUgLyBkZXZhbGlkYXRlIGNvbnNpc3Rl
bnRseSByZWZlcnMgdG8gYWN0aW9ucyBkb25lIHdoZW4gYQo+IHR5cGUgY291bnQgZ29lcyAwIC0+
IDEgb3IgMSAtPiAwCj4gLSBwcm9tb3RlIC8gZGVtb3RlIGNvbnNpc3Rlbmx5IHJlZmVycyB0byBh
Y3F1aXJpbmcgb3IgZnJlZWluZwo+IHJlc291cmNlcyAoaW4gdGhlIGZvcm0gb2YgdHlwZSByZWZz
IGFuZCBnZW5lcmFsIHJlZmVyZW5jZXMpIGluIG9yZGVyCj4gdG8gYWxsb3cgYSBwYWdlIHRvIGJl
IHVzZWQgYXMgYSBwYWdldGFibGUuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2ln
bmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
