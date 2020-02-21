Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B89F1683F0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:46:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5BPQ-0002EC-DI; Fri, 21 Feb 2020 16:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5BPO-0002Dq-AP
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:44:10 +0000
X-Inumbo-ID: 36fb86b0-54c9-11ea-86b2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36fb86b0-54c9-11ea-86b2-12813bfff9fa;
 Fri, 21 Feb 2020 16:42:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF876AD26;
 Fri, 21 Feb 2020 16:42:56 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wl@xen.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-4-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4aaf28c7-8087-733f-de53-9d60a8db681d@suse.com>
Date: Fri, 21 Feb 2020 17:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-4-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/8] xen/vmap: allow vm_init_type to be
 called during early_boot
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDIuMjAyMCAwMTozMiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gV2Ugd2FudCB0byBtb3ZlIHZtX2luaXQsIHdo
aWNoIGNhbGxzIHZtX2luaXRfdHlwZSB1bmRlciB0aGUgaG9vZCwgdG8KPiBlYXJseSBib290IHN0
YWdlLiBBZGQgYSBwYXRoIHRvIGdldCBwYWdlIGZyb20gYm9vdCBhbGxvY2F0b3IgaW5zdGVhZC4K
PiAKPiBBZGQgYW4gZW1hY3MgYmxvY2sgdG8gdGhhdCBmaWxlIHdoaWxlIEkgd2FzIHRoZXJlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
