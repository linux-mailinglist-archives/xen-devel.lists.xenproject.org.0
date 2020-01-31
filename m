Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D014EE21
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:01:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWnd-0007DP-T9; Fri, 31 Jan 2020 13:57:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixWnd-0007DK-4G
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:57:33 +0000
X-Inumbo-ID: a0521a3c-4431-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0521a3c-4431-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 13:57:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E85AAB1D4;
 Fri, 31 Jan 2020 13:57:31 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-5-liuwe@microsoft.com>
 <20200130101733.GF4679@Air-de-Roger> <20200130120020.xhaprdddcu3eoi4v@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a24ba6d-37e5-173a-77c7-72c3ffef3628@suse.com>
Date: Fri, 31 Jan 2020 14:57:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130120020.xhaprdddcu3eoi4v@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 04/12] x86: make paddr_bits available
 earlier
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxMzowMCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAxMToxNzozM0FNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gIAo+Pj4g
KyAgICAvKiBUaGlzIG11c3QgY29tZSBiZWZvcmUgZTgyMCBjb2RlIGJlY3VhdXNlIGl0IHNldHMg
cGFkZHJfYml0cy4gKi8KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXiBiZWNhdXNlCj4gCj4gRml4ZWQuIFRoYW5rcy4KCkFuZCB0aGVuCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
