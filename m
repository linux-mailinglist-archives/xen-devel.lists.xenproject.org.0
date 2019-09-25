Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155ABDACC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:19:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3PI-00037y-PJ; Wed, 25 Sep 2019 09:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD3PH-00037r-IJ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:16:19 +0000
X-Inumbo-ID: 21bfd16c-df75-11e9-962d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 21bfd16c-df75-11e9-962d-12813bfff9fa;
 Wed, 25 Sep 2019 09:16:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D665BACF2;
 Wed, 25 Sep 2019 09:16:17 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c88502e8-3342-3bae-a670-2780c56b54c6@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <32279f32-68fc-0512-01ef-6260ce6c1771@suse.com>
Date: Wed, 25 Sep 2019 11:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c88502e8-3342-3bae-a670-2780c56b54c6@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ACPI/cpuidle: bump maximum number of power
 states we support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCA0YzZjZDY0NTE5
ICgibXdhaXRfaWRsZTogU2t5bGFrZSBDbGllbnQgU3VwcG9ydCIpIGFkZGVkIGEgdGFibGUKPiB3
aXRoIDggZW50cmllcywgd2hpY2ggLSB0b2dldGhlciB3aXRoIEMwIC0gcmVuZGVyZWQgdGhlIGN1
cnJlbnQgbGltaXQKPiB0b28gbG93LiBJdCBzaG91bGQgaGF2ZSBiZWVuIGFjY29tcGFuaWVkIGJ5
IGFuIGluY3JlYXNlIG9mIHRoZSBjb25zdGFudDsKPiBkbyB0aGlzIG5vdy4gRG9uJ3QgYnVtcCBi
eSB0b28gbXVjaCB0aG91Z2gsIGFzIHRoZXJlIGFyZSBhIG51bWJlciBvZiBvbi0KPiBzdGFjayBh
cnJheXMgd2hpY2ggYXJlIGRpbWVuc2lvbmVkIGJ5IHRoaXMgY29uc3RhbnQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
