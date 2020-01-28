Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E388214BACB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:41:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwS0h-0003w0-Bz; Tue, 28 Jan 2020 14:38:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwS0g-0003vg-5Z
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:38:34 +0000
X-Inumbo-ID: dbf6bb54-41db-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbf6bb54-41db-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 14:38:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8688AF59;
 Tue, 28 Jan 2020 14:38:32 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1580222228-21828-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7423f360-cfab-7604-5a48-77df6d90ec60@suse.com>
Date: Tue, 28 Jan 2020 15:38:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580222228-21828-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/suspend: disable watchdog before
 calling console_start_sync()
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

T24gMjguMDEuMjAyMCAxNTozNywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLi4uIGFuZCBlbmFi
bGUgaXQgYWZ0ZXIgZXhpdGluZyBTLXN0YXRlLiBPdGhlcndpc2UgYWNjdW11bGF0ZWQKPiBvdXRw
dXQgaW4gc2VyaWFsIGJ1ZmZlciBtaWdodCBlYXNpbHkgdHJpZ2dlciB0aGUgd2F0Y2hkb2cgaWYg
aXQncwo+IHN0aWxsIGVuYWJsZWQgYWZ0ZXIgZW50ZXJpbmcgc3luYyB0cmFuc21pc3Npb24gbW9k
ZS4KPiAKPiBUaGUgaXNzdWUgb2JzZXJ2ZWQgb24gbWFjaGluZXMgd2hpY2gsIHVuZm9ydHVuYXRl
bHksIGdlbmVyYXRlIG5vbi0wCj4gb3V0cHV0IGluIENQVSBvZmZsaW5lIGNhbGxiYWNrcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
