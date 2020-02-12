Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FF15A4D1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 10:32:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1oKJ-0001r2-Gg; Wed, 12 Feb 2020 09:28:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JFaq=4A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1oKH-0001qx-U6
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 09:28:57 +0000
X-Inumbo-ID: 17d31dee-4d7a-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17d31dee-4d7a-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 09:28:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69DA5ADDA;
 Wed, 12 Feb 2020 09:28:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200211112726.26639-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ccc6ee7-d51d-6cf0-871c-8bef6b01eb5d@suse.com>
Date: Wed, 12 Feb 2020 10:28:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211112726.26639-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: Clean up the allocation helpers
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxMjoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDb25mb3JtIHRvIHN0
eWxlLCBkcm9wIHVubmVjZXNzYXJ5IGxvY2FsIHZhcmlhYmxlcywgYW5kIGF2b2lkIG9wZW5jb2Rp
bmcKPiBjbGVhcl9kb21haW5fcGFnZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
