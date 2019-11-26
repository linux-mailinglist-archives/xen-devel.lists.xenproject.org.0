Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ED4109B9E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 10:58:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZXZA-0005rW-EN; Tue, 26 Nov 2019 09:55:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZXZ9-0005rR-4Q
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 09:55:27 +0000
X-Inumbo-ID: de50dc17-1032-11ea-a39d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de50dc17-1032-11ea-a39d-12813bfff9fa;
 Tue, 26 Nov 2019 09:55:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99B72BAD2;
 Tue, 26 Nov 2019 09:55:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20bc338f-9da3-0f08-9a66-7a6ae50eef77@suse.com>
Date: Tue, 26 Nov 2019 10:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] EFI: fix "efi=attr=" handling
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMTkgMDk6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCA2MzNhNDA5NDcz
MjEgKCJkb2NzOiBJbXByb3ZlIGRvY3VtZW50YXRpb24gYW5kIHBhcnNpbmcgZm9yIGVmaT0iKQo+
IGZhaWxlZCB0byBob25vciB0aGUgc3RyY21wKCktbGlrZSByZXR1cm4gdmFsdWUgY29udmVudGlv
biBvZgo+IGNtZGxpbmVfc3RyY21wKCkuCj4gCj4gUmVwb3J0ZWQtYnk6IFJvbWFuIFNoYXBvc2hu
aWsgPHJvbWFuQHplZGVkYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
