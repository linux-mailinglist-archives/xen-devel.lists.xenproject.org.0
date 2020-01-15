Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320B13BE97
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:35:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irgua-0001Tl-Ev; Wed, 15 Jan 2020 11:32:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irguZ-0001Tg-9v
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:32:35 +0000
X-Inumbo-ID: b6294cc6-378a-11ea-8521-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6294cc6-378a-11ea-8521-12813bfff9fa;
 Wed, 15 Jan 2020 11:32:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5CE3FADDF;
 Wed, 15 Jan 2020 11:32:28 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7938484e-14a0-8edf-635b-15b05af6dace@suse.com>
Date: Wed, 15 Jan 2020 12:32:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAyMDozNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSWYgSVRTQyBpcyBu
b3QgYXZhaWxhYmxlIG9uIENQVSAoZS5nIGlmIHJ1bm5pbmcgbmVzdGVkIGFzIFBWIHNoaW0pCj4g
dGhlbiBYODZfRkVBVFVSRV9OT05TVE9QX1RTQyBpcyBub3QgYWR2ZXJ0aXNlZCBpbiBjZXJ0YWlu
IGNhc2VzLCBpLmUuCj4gYWxsIEFNRCBhbmQgc29tZSBvbGQgSW50ZWwgcHJvY2Vzc29ycy4gSW4g
d2hpY2ggY2FzZSBUU0Mgd291bGQgbmVlZCB0bwo+IGJlIHJlc3RvcmVkIG9uIENQVSBmcm9tIHBs
YXRmb3JtIHRpbWUgYnkgWGVuIHVwb24gZXhpdGluZyBkZWVwIEMtc3RhdGVzLgoKSG93IGRvZXMg
d2FraW5nIGZyb20gZGVlcCBDIHN0YXRlcyBjb3JyZXNwb25kIHRvIHRoZSBQViBzaGltPyBJIG5v
dGljZQp0aGF0IGNzdGF0ZV9yZXN0b3JlX3RzYygpIGdldHMgY2FsbGVkIGlycmVzcGVjdGl2ZSBv
ZiB0aGUgQyBzdGF0ZSBiZWluZwpleGl0ZWQsIHNvIEkgd29uZGVyIHdoZXRoZXIgdGhlcmUncyBy
b29tIGZvciBpbXByb3ZlbWVudCB0aGVyZQppbmRlcGVuZGVudCBvZiB0aGUgaXNzdWUgYXQgaGFu
ZC4gQXMgZmFyIGFzIHRoaXMgY2hhbmdlIGlzIGNvbmNlcm5lZCwKSSB0aGluayB5b3Ugd2FudCB0
byBkcm9wIHRoZSBub3Rpb24gb2YgImRlZXAiIGZyb20gdGhlIGRlc2NyaXB0aW9uLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
