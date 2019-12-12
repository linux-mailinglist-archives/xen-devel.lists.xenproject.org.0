Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E311D19E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 16:57:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQnS-00017I-Ub; Thu, 12 Dec 2019 15:54:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifQnQ-00017A-Vy
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 15:54:33 +0000
X-Inumbo-ID: aae05434-1cf7-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aae05434-1cf7-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 15:54:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7ADB5B1DA;
 Thu, 12 Dec 2019 15:54:23 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <osstest-144726-mainreport@xen.org>
 <24050.24437.97024.719788@mariner.uk.xensource.com>
 <6ae910a6-933b-0b6a-6371-7cc6a09097b3@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <90371b30-7f3b-eec8-b93b-833d7f591780@suse.com>
Date: Thu, 12 Dec 2019 16:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <6ae910a6-933b-0b6a-6371-7cc6a09097b3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.8-testing test] 144726: regressions -
 trouble: fail/pass/starved
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMTkgMTY6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjEyLjIwMTkgMTY6
NDAsIElhbiBKYWNrc29uIHdyb3RlOgo+PiBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JpdGVzICgi
W3hlbi00LjgtdGVzdGluZyB0ZXN0XSAxNDQ3MjY6IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogZmFp
bC9wYXNzL3N0YXJ2ZWQiKToKPj4+IGZsaWdodCAxNDQ3MjYgeGVuLTQuOC10ZXN0aW5nIHJlYWwg
W3JlYWxdCj4+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xv
Z3MvMTQ0NzI2Lwo+Pj4KPj4+IFJlZ3Jlc3Npb25zIDotKAo+Pj4KPj4+IFRlc3RzIHdoaWNoIGRp
ZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNo
IGNvdWxkIG5vdCBiZSBydW46Cj4+PiAgIHRlc3QteHRmLWFtZDY0LWFtZDY0LTUgNTAgeHRmL3Rl
c3QtaHZtNjQtbGJyLXRzeC12bWVudHJ5IGZhaWwgUkVHUi4gdnMuIDE0NDU1OAo+Pgo+PiBTZWUg
cGF0Y2ggYmVsb3cgZm9yIGFuYWx5c2lzLiAgQW5kcmV3LCB3b3VsZCB5b3UgcGxlYXNlIHRha2Ug
YSBsb29rCj4+IGFuZCBjaGVjayB0aGF0IHdoYXQgSSBzYWlkIGlzIHRydWUuCj4+Cj4+IElmIEph
biBhcHByb3ZlcyB3aWxsIGZvcmNlIHB1c2ggNC44LXRlc3RpbmcuCj4gCj4gSSBkby4gVGhhbmtz
Lgo+IAo+PiAgRnJvbSBKdWVyZ2VuIEkgd291bGQgbGlrZSBhIHJlbGVhc2UtYWNrIGZvciB0aGUg
b3NzdGVzdCBjb21taXQgdG8KPj4gImFsbG93IiBpdCBmb3IgdGhlIGZ1dHVyZS4KPiAKPiBJcyB0
aGlzIHJlYWxseSB3b3J0aCBpdD8gVGhlIDQuOCB0cmVlIGlzIGRlYWQgbm93OyBzdHJpY3RseSBz
cGVha2luZwo+IGV2ZW4gdGhlIGxhc3QgYmF0Y2ggb2YgWFNBcyBzaG91bGRuJ3QgaGF2ZSBnb25l
IHRoZXJlIGFueW1vcmUsIGJ1dAo+IHdlIGRpZCBzbyB0byBiZSBmcmllbmRseSB0byBjZXJ0YWlu
IGRpc3Ryb3MsIGFzIGl0IHdhcyBqdXN0IGJhcmVseQo+IHBhc3QgdGhlIGV4cGlyeSBkYXRlLgoK
QXQgbGVhc3QgSSByZWFsbHkgZG9uJ3QgbWluZCwgYXMgSSBjYW4ndCBzZWUgYW55IHJpc2sgZm9y
IDQuMTMuCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
