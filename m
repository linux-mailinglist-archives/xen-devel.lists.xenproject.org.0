Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7515580E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 14:02:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j03EA-000220-MW; Fri, 07 Feb 2020 12:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nQzt=33=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j03E9-00021t-K9
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 12:59:21 +0000
X-Inumbo-ID: a774c800-49a9-11ea-a759-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a774c800-49a9-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 12:59:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37E30AC67;
 Fri,  7 Feb 2020 12:59:19 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20200207072405.2236-1-jgross@suse.com>
 <d2fe8b44aed9e9f3bf51585af1403f2ac1162042.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e99b7b34-64d8-d75a-e4b6-a5fc61dbb23b@suse.com>
Date: Fri, 7 Feb 2020 13:59:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d2fe8b44aed9e9f3bf51585af1403f2ac1162042.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: add some diagnostic info in the
 run queue keyhandler
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAgMTI6MDksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAyMC0w
Mi0wNyBhdCAwODoyNCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gV2hlbiBkdW1waW5n
IHRoZSBydW4gcXVldWUgaW5mb3JtYXRpb24gYWRkIHNvbWUgbW9yZSBkYXRhIHJlZ2FyZGluZwo+
PiBjdXJyZW50IGFuZCAoaWYga25vd24pIHByZXZpb3VzIHZjcHUgZm9yIGVhY2ggcGh5c2ljYWwg
Y3B1Lgo+Pgo+IExvb2tzIGdvb2QgdG8gbWUuCj4gCj4gQ2FuIHdlIGhhdmUsIGhlcmUgaW4gdGhl
IGNoYW5nZWxvZywgYSBzYW1wbGUgb2YgaG93IHRoZSBuZXcgb3V0cHV0Cj4gbG9va3MgbGlrZT8K
ClN1cmUuIEFuZCBJJ2xsIGV2ZW4gYWRkIHRoZSBwcm9wZXIgbG9ja2luZyBiZWZvcmUgYWNjZXNz
aW5nIHRoZQpwZXJjcHUgc2NoZWR1bGluZyBkYXRhLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
