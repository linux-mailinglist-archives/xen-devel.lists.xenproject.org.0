Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE76E463
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQ8I-0003Zc-HY; Fri, 19 Jul 2019 10:28:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfBs=VQ=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hoQ8H-0003ZX-N1
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:28:57 +0000
X-Inumbo-ID: 011ea536-aa10-11e9-8693-23e2385ebde5
Received: from gandi.net (unknown [217.70.182.73])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 011ea536-aa10-11e9-8693-23e2385ebde5;
 Fri, 19 Jul 2019 10:28:53 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id 745E3160559;
 Fri, 19 Jul 2019 10:28:52 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190718215428.6727-1-george.dunlap@citrix.com>
 <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
 <75a6f429-d741-f6e5-36cd-bcc3f7cd7a8c@citrix.com>
From: Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <15ffc899-c796-b4f9-9a1e-37d1c1a484bb@gandi.net>
Date: Fri, 19 Jul 2019 12:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <75a6f429-d741-f6e5-36cd-bcc3f7cd7a8c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3LzE5LzE5IDEyOjAxIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDcvMTkvMTkg
ODozNCBBTSwgTmljb2xhcyBCZWxvdWluIHdyb3RlOgo+Pgo+PiBPbiA3LzE4LzE5IDExOjU0IFBN
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gVGhlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bCBtaXNz
IGZ1bmN0aW9ucyBmcm9tIGxpYnhsX3V0aWxzLCBsZXQncyBzdGFydAo+Pj4gd2l0aCB0aGUgc2lt
cGxlIGxpYnhsX2RvbWlkX3RvX25hbWUgYW5kIGl0cyBjb3VudGVycGFydAo+Pj4gbGlieGxfbmFt
ZV90b19kb21pZC4KPj4+Cj4+PiBOQiB0aGF0IEMuR29TdHJpbmcoKSB3aWxsIHJldHVybiAiIiBp
ZiBpdCdzIHBhc3NlZCBhIE5VTEw7IHNlZQo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9n
by9pc3N1ZXMvMzI3MzQjaXNzdWVjb21tZW50LTUwNjgzNTQzMgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IE5pY29sYXMgQmVsb3VpbiA8bmljb2xhcy5iZWxvdWluQGdhbmRpLm5ldD4KPj4+IFNpZ25l
ZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPj4+IC0t
LQo+Pj4gdjM6Cj4+PiAgLSBXaXJlIGludG8gYnVpbGQgc3lzdGVtCj4+PiAgLSBBZGQgcmVmZXJl
bmNlIHRvIEMuR29TdHJpbmcoKSBoYW5kbGluZyBOVUxMIHRvIGNvbW1pdCBtZXNzYWdlCj4+Pgo+
Pj4gTmljb2xhcywgY291bGQgeW91IHRlc3QgdG8gc2VlIGlmIHRoaXMgYWN0dWFsbHkgd29ya3Mg
Zm9yIHlvdT8KPj4gVGVzdGVkIGl0LCBpdCB3b3Jrcy4KPj4KPj4gSSBtdXN0IGNvbmZlc3MgSSBk
byBub3QgdXNlIHRoYXQgaW1wb3J0IHBhdGggYXMgdGhlIG5ldyBtb2R1bGVzIG1lY2hhbmlzbQo+
PiBpbnRyb2R1Y2VkIGluIEdvMS4xMSBkb3dubG9hZHMgYW5kIGNvbXBpbGUgYSB2ZXJzaW9uZWQg
Y29weSBvZiBldmVyeQo+PiBkZXBlbmRlbmN5IHBlciBwcm9qZWN0LCBhbmQgdGhpcyBiZWhhdmlv
ciBpcyBpbmNvbXBhdGlibGUgd2l0aCB0aGUgYnVpbGQKPj4gc3lzdGVtIHVzZWQgaGVyZS4KPiBB
bHNvIC0tIEkgY2FuJ3QgY2hlY2sgdGhpcyBpbiB3aXRob3V0IHNvbWVib2R5IGFja2luZyBteSBj
aGFuZ2VzOyBhbmQKPiB5b3UncmUgdGhlIG1vc3Qgb2J2aW91cyBwZXJzb24gdG8gZG8gc28uIDot
KQo+Cj4gIC1HZW9yZ2UKSSBzdWNjZXNzZnVsbHkgdGVzdGVkIHlvdXIgY2hhbmdlcyBzbyBjb25z
aWRlciB0aGVtIGFzIGFja2VkLgoKTmljb2xhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
