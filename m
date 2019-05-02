Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43411688
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 11:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7wQ-00065a-1g; Thu, 02 May 2019 09:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hM7wO-00065V-Mx
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 09:23:44 +0000
X-Inumbo-ID: f5e4338e-6cbb-11e9-8d85-b338947df30b
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5e4338e-6cbb-11e9-8d85-b338947df30b;
 Thu, 02 May 2019 09:23:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89560529"
To: Jan Beulich <JBeulich@suse.com>, David Woodhouse <dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <cover.1556708225.git.dwmw2@infradead.org>
 <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
 <5CCAA6ED020000780022B0AA@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5a327ee0-58cd-6526-b3e1-3bda2b71a230@citrix.com>
Date: Thu, 2 May 2019 10:23:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCAA6ED020000780022B0AA@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [RFC PATCH 2/7] x86/boot: Remove gratuitous call
 back into low-memory code
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDUvMjAxOSAwOToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDUuMTkg
YXQgMTM6MTcsIDxkd213MkBpbmZyYWRlYWQub3JnPiB3cm90ZToKPj4gV2UgYXBwZWFyIHRvIGhh
dmUgaW1wbGVtZW50ZWQgYSBtZW1jcHkoKSBpbiB0aGUgbG93LW1lbW9yeSB0cmFtcG9saW5lCj4+
IHdoaWNoIHdlIHRoZW4gY2FsbCBpbnRvIGZyb20gX19zdGFydF94ZW4oKSwgZm9yIG5vIGFkZXF1
YXRlbHkgZGVmaW5lZAo+PiByZWFzb24uCj4gTWF5IEkgc3VnZ2VzdCB0aGF0IGluIGNhc2VzIGxp
a2UgdGhpcyB5b3UgbG9vayBhdCB0aGUgY29tbWl0Cj4gaW50cm9kdWNpbmcgdGhlIGZ1bmN0aW9u
PyBJdCBzdXBwbGllcyBhIHJlYXNvbjoKPgo+ICJBZGQgYSBuZXcgcmF3IGU4MjAgdGFibGUgZm9y
IGNvbW1vbiBwdXJwb3NlIGFuZCBjb3B5IHRoZSBCSU9TIGJ1ZmZlcgo+ICB0byBpdC4gRG9pbmcg
dGhlIGNvcHlpbmcgaW4gYXNzZW1ibHkgYXZvaWRzIHRoZSBuZWVkIHRvIGV4cG9ydCB0aGUKPiAg
c3ltYm9scyBmb3IgdGhlIEJJT1MgRTgyMCBidWZmZXIgYW5kIG51bWJlciBvZiBlbnRyaWVzLiIK
CkkgY29tcGxldGVseSBhZ3JlZSB3aXRoIERhdmlkIGhlcmUuwqAgVGhhdCBkZXNjcmlwdGlvbiBp
cyBjb21wbGV0ZWx5Cmluc3VmZmljaWVudCBmb3IganVzdGlmeWluZyB3aHkgdGhlIGxvZ2ljIHdh
cyBkb25lIHRoYXQgd2F5IGluIHRoZSBlbmQsCmFuZCBJIHdvdWxkIG5vdCBoYXZlIGFjY2VwdGVk
IHRoZSBwYXRjaCBpbiB0aGF0IGZvcm0gYXQgYWxsLgoKVG8gYmUgY2xlYXIuwqAgSSB1bmRlcnN0
YW5kIChhbmQgYWdyZWUpIHdoeSBoYXZpbmcgb3VyIG1haW4gY29weSBvZiB0aGUKZTgyMCB0YWJs
ZSBpbiB0aGUgdHJhbXBvbGluZSBpcyBhIGJhZCB0aGluZywgYW5kIG1vdmluZyB0aGUgbWFpbiBj
b3B5Cm91dCBvZiB0aGUgdHJhbXBvbGluZSBpcyBmaW5lLgoKV2hhdCBpc24ndCBmaW5lIGlzIHdo
eSwgaW4gdGhlIGFkanVzdGVkIHdvcmxkLCB3ZSBjYWxsIGJhY2sgaW50byB3aGF0CmFwcGVhcnMg
dG8gYmUgdGhlIHRyYW1wb2xpbmUsIGJ1dCBpc24ndCwgdG8gZ2V0IGFjY2VzcyB0byBkYXRhIHdo
aWNoIHRoZQpjYWxsaW5nIGNvZGUgY2FuIGFscmVhZHkgYWNjZXNzLsKgIEluIHBhcnRpY3VsYXIu
Li4KCj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSBzZWUgdmFsdWUgaW4gdGhpcywgYXMgaXQgYXZv
aWRzIGludHJvZHVjdGlvbgo+IG9mIHdyb25nIGFjY2Vzc2VzIHRvIHRoZXNlIHZhcmlhYmxlcy4K
Ci4uLnRoaXMgcmVhc29uaW5nIGlzIGJvZ3VzLsKgIFdlJ3JlIGVpdGhlciBhY2Nlc3NpbmcgdGhl
IGRhdGEgaXRzZWxmLCBvcgp0aGUgbWVtY3B5IGZ1bmN0aW9uLCBidXQgdGhlcmUgaXMgbm8gcG9z
c2libGUgd2F5IHRvIHByb2dyYW1hdGljYWxseQphdm9pZCAid3JvbmciIGFjY2VzcyBpbnRvIHRo
ZSB0cmFtcG9saW5lLCBiZWNhdXNlIHdlJ3JlIHN0aWxsIGFjY2Vzc2luZyBpdC4KClRoZXJlZm9y
ZSwgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgcG9zc2libGUgYmVuZWZpdCBub3QgZXhwb3J0aW5n
IHRoZQpkYXRhIGhhcyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCB3aHkgY29tcGxpY2F0aW5nIGl0
IHdpdGggYSBjYWxsIHRvIGEKZnVuY3Rpb24gKHdoaWNoIGlzbid0IGFjdHVhbGx5IGV4ZWN1dGlu
ZyB3aGVyZSBpdCBhcHBlYXJzIHRvIGxpdmUpLCBpcwpjb25zaWRlcmVkIGEgYmVuZWZpdC4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
