Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84FCDBFB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 08:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHMsP-0002ZW-Tw; Mon, 07 Oct 2019 06:52:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHMsO-0002ZO-Nl
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 06:52:12 +0000
X-Inumbo-ID: fd049b1a-e8ce-11e9-97a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd049b1a-e8ce-11e9-97a3-12813bfff9fa;
 Mon, 07 Oct 2019 06:52:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 777B5AD94;
 Mon,  7 Oct 2019 06:52:11 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20191004164243.30822-1-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6a15e888-10c0-9c8a-268a-dae476357c3f@suse.com>
Date: Mon, 7 Oct 2019 08:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191004164243.30822-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL
 deference in flask_assign_{, dt}device()
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
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, paul@xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMTkgMTg6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBmbGFza19hc3NpZ25feywg
ZHR9ZGV2aWNlKCkgbWF5IGJlIHVzZWQgdG8gY2hlY2sgd2hldGhlciB5b3UgY2FuIHRlc3QgaWYK
PiBhIGRldmljZSBpcyBhc3NpZ25lZC4gSW4gdGhpcyBjYXNlLCB0aGUgZG9tYWluIHdpbGwgYmUg
TlVMTC4KPiAKPiBIb3dldmVyLCBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpIHdpbGwg
YmUgY2FsbGVkIGFuZCBtYXkgZW5kIHVwCj4gdG8gZGVmZXJlbmNlIGEgTlVMTCBwb2ludGVyLiBU
aGlzIGNhbiBiZSBwcmV2ZW50ZWQgYnkgbW92aW5nIHRoZSBjYWxsCj4gYWZ0ZXIgd2UgY2hlY2sg
dGhlIHZhbGlkaXR5IGZvciB0aGUgZG9tYWluIHBvaW50ZXIuCj4gCj4gQ292ZXJpdHktSUQ6IDE0
ODY3NDEKPiBGaXhlczogNzFlNjE3YTZiOCAoJ3VzZSBpc19pb21tdV9lbmFibGVkKCkgd2hlcmUg
YXBwcm9wcmlhdGUuLi4nKQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
