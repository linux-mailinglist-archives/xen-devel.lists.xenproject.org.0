Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3916FACB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 10:34:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6t3I-0006XW-Jw; Wed, 26 Feb 2020 09:32:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6t3H-0006XR-5W
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 09:32:23 +0000
X-Inumbo-ID: e337f289-587a-11ea-93e4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e337f289-587a-11ea-93e4-12813bfff9fa;
 Wed, 26 Feb 2020 09:32:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B369AD06;
 Wed, 26 Feb 2020 09:32:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200225173133.3632-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01fc1f0d-3889-32d0-de38-187a7d12f67d@suse.com>
Date: Wed, 26 Feb 2020 10:32:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225173133.3632-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/sysctl: Don't return cpu policy data
 for compiled-out support
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

T24gMjUuMDIuMjAyMCAxODozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBQb2xpY3kgb2JqZWN0
cyBhcmVuJ3QgdGlueSwgYW5kIHRoZSBkZXJpdmF0aW9uIGxvZ2ljIGlzbid0IHRyaXZpYWwuICBX
ZSBhcmUKPiBhYm91dCB0byBpbmNyZWFzZSB0aGUgbnVtYmVyIG9mIHBvbGljeSBvYmplY3RzLCBz
byB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8KPiBkcm9wIGxvZ2ljIGFuZCBzdG9yYWdlIHNwYWNl
IGJhc2VkIG9uIENPTkZJR197UFYsSFZNfS4KCkl0IGRvZXNuJ3QgbG9vayBhcyBpZiB5b3Ugd2Vy
ZSBkcm9wcGluZyBlaXRoZXIgbG9naWMgb3Igc3RvcmFnZSBzcGFjZS4gV2l0aAp0aGlzIGFzcGVj
dCB0YWtlbiBjYXJlIG9mIChieSBhZGp1c3Rpbmcgd29yZGluZywgb3IgYnkgY2xhcmlmaWNhdGlv
biBvZiB3aGF0CmlzIG1lYW50KSAuLi4KCj4gU3RhcnQgYnkgY2F1c2luZyBYRU5fU1lTQ1RMX2dl
dF9jcHVfcG9saWN5IHRvIGZhaWwgd2l0aCAtRU9QTk9UU1VQUCB3aGVuCj4gcmVxdWVzdGluZyBk
YXRhIGZvciBhIGNvbXBpbGVkLW91dCBzdWJzeXN0ZW0uICBVcGRhdGUgeGVuLWNwdWlkIHRvIGNv
cGUgYW5kCj4gY29udGludWUgdG8gZnVydGhlciBzeXN0ZW0gcG9saWNpZXMsIHNlZWluZyBhcyB0
aGUgaW5kaWNpZXMgYXJlIGludGVybGVhdmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
