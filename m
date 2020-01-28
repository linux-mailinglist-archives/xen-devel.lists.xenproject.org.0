Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8314B544
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:43:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwR5R-0005fY-8Z; Tue, 28 Jan 2020 13:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwR5Q-0005fT-0o
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:39:24 +0000
X-Inumbo-ID: 97ef671a-41d3-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97ef671a-41d3-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 13:39:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 976E1B00D;
 Tue, 28 Jan 2020 13:39:22 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <361d6176-f8b6-2655-b8ca-3e12fbb44e66@suse.com>
Date: Tue, 28 Jan 2020 14:39:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/suspend: disable watchdog before
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

T24gMjcuMDEuMjAyMCAyMjoyOSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gQEAgLTIyMyw2ICsy
MjQsNyBAQCBzdGF0aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKPiAgCj4gICAgICBhY3Bp
X3NsZWVwX3ByZXBhcmUoc3RhdGUpOwo+ICAKPiArICAgIHdhdGNoZG9nX2Rpc2FibGUoKTsKPiAg
ICAgIGNvbnNvbGVfc3RhcnRfc3luYygpOwo+ICAgICAgcHJpbnRrKCJFbnRlcmluZyBBQ1BJIFMl
ZCBzdGF0ZS5cbiIsIHN0YXRlKTsKPiAgCj4gQEAgLTI4MSw2ICsyODMsNyBAQCBzdGF0aWMgaW50
IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKPiAgICAgICAgICB0Ym9vdF9zM19lcnJvcihlcnJvcik7
Cj4gIAo+ICAgICAgY29uc29sZV9lbmRfc3luYygpOwo+ICsgICAgd2F0Y2hkb2dfZW5hYmxlKCk7
Cj4gIAo+ICAgICAgbWljcm9jb2RlX3VwZGF0ZV9vbmUodHJ1ZSk7CgpCZXR3ZWVuIHRoZXNlIHR3
byB0aGVyZSdzIGEgImdvdG8gZG9uZTsiIHdoaWNoIGFsc28gd2FudHMKd2F0Y2hkb2dfZW5hYmxl
KCkgYWRkZWQgdGhlbi4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
