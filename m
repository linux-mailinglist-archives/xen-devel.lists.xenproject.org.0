Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600F12467E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:10:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihY6h-0005Jv-FQ; Wed, 18 Dec 2019 12:07:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihY6g-0005Jn-4a
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:07:10 +0000
X-Inumbo-ID: e5818c2a-218e-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5818c2a-218e-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 12:07:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C590AF6A;
 Wed, 18 Dec 2019 12:07:00 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <3c4b61a2888f01b9344fd302603c56a8739a1c71.1576630344.git.elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47662c1d-9a27-19ec-1705-c4e428d9901a@suse.com>
Date: Wed, 18 Dec 2019 13:07:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3c4b61a2888f01b9344fd302603c56a8739a1c71.1576630344.git.elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/4] x86/microcode: use const qualifier
 for microcode buffer
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAwMjozMiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gVGhlIGJ1ZmZlciBo
b2xkaW5nIHRoZSBtaWNyb2NvZGUgYml0cyBzaG91bGQgYmUgbWFya2VkIGFzIGNvbnN0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6b24uY29tPgoKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
