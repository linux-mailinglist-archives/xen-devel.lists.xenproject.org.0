Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85A12FA2D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:18:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPcS-0007Ic-Kl; Fri, 03 Jan 2020 16:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inPcR-0007IS-BN
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:16:11 +0000
X-Inumbo-ID: 5ac24bc0-2e44-11ea-a4e3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ac24bc0-2e44-11ea-a4e3-12813bfff9fa;
 Fri, 03 Jan 2020 16:16:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE703AC46;
 Fri,  3 Jan 2020 16:16:09 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-4-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6b69d27-bdfe-2dcb-7a99-47d088050b0f@suse.com>
Date: Fri, 3 Jan 2020 17:16:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191229183341.14877-4-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/8] x86: rename guest/hypercall.h to
 guest/xen-hypercall.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTIuMjAxOSAxOTozMywgV2VpIExpdSB3cm90ZToKPiBXZSB3aWxsIHByb3ZpZGUgYSBo
ZWFkZXIgZmlsZSBmb3IgSHlwZXItViBoeXBlcmNhbGxzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+CgpJ
biBwcmluY2lwbGUKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KYWxi
ZWl0IC4uLgoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC97
aHlwZXJjYWxsLmggPT4geGVuLWh5cGVyY2FsbC5ofSB8IDIgKy0KCi4uLiBjb3VsZCB3ZSBzZXR0
bGUgb24gZ3Vlc3QvKi1oY2FsbC5oIHRvIHNhdmUgb24gZmlsZSBuYW1lCmxlbmd0aCB3aXRob3V0
IChob3BlZnVsbHkpIGJlY29taW5nIGFtYmlndW91cz8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
