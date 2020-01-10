Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B5137424
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:55:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipxWi-0005MI-Eb; Fri, 10 Jan 2020 16:52:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipxWh-0005MD-3e
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:52:47 +0000
X-Inumbo-ID: 9bb82c8c-33c9-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bb82c8c-33c9-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 16:52:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4E96B258;
 Fri, 10 Jan 2020 16:52:37 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200109193241.14542-1-andrew.cooper3@citrix.com>
 <20200109193241.14542-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9a8a38c-665d-2d2f-72e1-382019428f7f@suse.com>
Date: Fri, 10 Jan 2020 17:52:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109193241.14542-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/boot: Drop INVALID_VCPU
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

T24gMDkuMDEuMjAyMCAyMDozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBOb3cgdGhhdCBOVUxM
IHdpbGwgZmF1bHQgYXQgYm9vdCwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBzcGVjaWFsIGNvbnN0
YW50IHRvCj4gc2lnbmlmeSAiY3VycmVudCBub3Qgc2V0IHVwIHlldCIuCj4gCj4gU2luY2UgYy9z
IGZhZTI0OWQyMzQxMyAieDg2L2Jvb3Q6IFJhdGlvbmFsaXNlIHN0YWNrIGhhbmRsaW5nIGR1cmlu
ZyBlYXJseQo+IGJvb3QiLCB0aGUgQlNQIGNwdV9pbmZvIGJsb2NrIGlzIG5vdyBjb25zaXN0ZW50
bHkgemVybywgc28gZHJvcCB0aGUgYWRqYWNlbnQKPiByZS16ZXJvaW5nLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
