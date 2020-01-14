Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14E13A9DC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 13:59:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irLl3-0008Lx-VD; Tue, 14 Jan 2020 12:57:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irLl2-0008Ls-Ci
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 12:57:20 +0000
X-Inumbo-ID: 635d9da2-36cd-11ea-8394-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 635d9da2-36cd-11ea-8394-12813bfff9fa;
 Tue, 14 Jan 2020 12:57:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 248E6B0B8;
 Tue, 14 Jan 2020 12:57:14 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200114123445.17507-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <905c55b9-63f0-201e-9d99-b50200aa6862@suse.com>
Date: Tue, 14 Jan 2020 13:57:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200114123445.17507-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] remove unmodified_drivers directory
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxMzozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBIYXZpbmcgTGludXgg
a2VybmVsIGRyaXZlcnMgZm9yIDIuNiBiYXNlZCBrZXJuZWxzIGluIHRoZSBYZW4gdHJlZSBpcwo+
IG5vdCByZWFsbHkgbmVlZGVkIGFueSBsb25nZXIuIFNvIHJlbW92ZSB0aGVtIGZyb20gdGhlIHRy
ZWUuCj4gCj4gSW4gY2FzZSBhbnlvbmUgd2FudHMgdG8gbG9vayBhdCB0aGVtIHRoZXkgYXJlIHN0
aWxsIGF2YWlsYWJsZSBpbgo+IG9sZGVyIGJyYW5jaGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
