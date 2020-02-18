Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50379162B39
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 18:02:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j46EN-0000i0-CO; Tue, 18 Feb 2020 17:00:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j46EM-0000hv-90
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 17:00:18 +0000
X-Inumbo-ID: 237adb8c-5270-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 237adb8c-5270-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 17:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C886DB50F;
 Tue, 18 Feb 2020 17:00:16 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05c12542-950c-226a-aba5-f0346a5ff180@suse.com>
Date: Tue, 18 Feb 2020 18:00:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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

T24gMjAuMTIuMjAxOSAyMjozOSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gU2ltaWxhcmx5IHRv
IFBWIHZUU0MgZW11bGF0aW9uLCBvcHRpbWl6ZSBIVk0gc2lkZSBmb3IgY29uc2lzdGVuY3kKPiBh
bmQgc2NhbGFiaWxpdHkgYnkgZHJvcHBpbmcgYSBzcGlubG9jayBwcm90ZWN0aW5nIGEgc2luZ2xl
IHZhcmlhYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpo
aW5pbkBjaXRyaXguY29tPgoKU2VlaW5nIHRoYXQgeW91IGRpZG4ndCByZXBseSB0byBteSBjb21t
ZW50IHNlbnQgb24gRGVjIDIzcmQsCkknbSBnb2luZyB0byBkcm9wIHRoaXMgcGF0Y2ggbm93IGZy
b20gbXkgdG8tYmUtZGVhbHQtd2l0aApmb2xkZXIuIFlvdSBjYW4gYWx3YXlzIHJlLXN1Ym1pdC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
