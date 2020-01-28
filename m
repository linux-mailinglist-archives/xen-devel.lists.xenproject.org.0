Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B914BE34
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:59:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwU9h-0001mZ-5X; Tue, 28 Jan 2020 16:56:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwU9f-0001mI-Nr
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:55:59 +0000
X-Inumbo-ID: 0e2e2464-41ef-11ea-8739-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e2e2464-41ef-11ea-8739-12813bfff9fa;
 Tue, 28 Jan 2020 16:55:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87CFBAEC4;
 Tue, 28 Jan 2020 16:55:57 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
Date: Tue, 28 Jan 2020 17:55:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFdoZW4gcGx1Z2dp
bmcgYSBob2xlIGluIHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBwZXJt
aXNzaW9uCj4gcmV0dXJuZWQgYnkgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzIGFzIGl0IGNhbiBiZSBu
b24tc2Vuc2ljYWwsIGxlYWRpbmcgdG8KPiBzcHVyaW91cyB2bV9ldmVudHMgYmVpbmcgc2VudCBv
dXQgZm9yIGFjY2VzcyB2aW9sYXRpb25zIGF0IHVuZXhwZWN0ZWQKPiBsb2NhdGlvbnMuIE1ha2Ug
dXNlIG9mIHAybS0+ZGVmYXVsdF9hY2Nlc3MgaW5zdGVhZC4KCkFzIGJlZm9yZSwgdG8gbWUgImNh
biBiZSBub24tc2Vuc2ljYWwiIGlzIGluc3VmZmljaWVudCBhcyBhIHJlYXNvbgpoZXJlLiBJZiBp
dCBjYW4gYWxzbyBiZSBhICJnb29kIiB2YWx1ZSwgaXQgc3RpbGwgcmVtYWlucyB1bmNsZWFyCndo
eSBpbiB0aGF0IGNhc2UgcDJtLT5kZWZhdWx0X2FjY2VzcyBpcyBuZXZlcnRoZWxlc3MgdGhlIHJp
Z2h0CnZhbHVlIHRvIHVzZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
