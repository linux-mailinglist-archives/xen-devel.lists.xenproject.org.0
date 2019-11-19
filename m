Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796DB102A79
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 18:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6wa-0006ro-4r; Tue, 19 Nov 2019 17:05:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iX6wY-0006rj-Am
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 17:05:34 +0000
X-Inumbo-ID: cb131b8a-0aee-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb131b8a-0aee-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 17:05:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D03ABB139;
 Tue, 19 Nov 2019 17:05:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191119170019.18450-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d95a1642-4ba2-8cf2-5c39-2e554ce139c2@suse.com>
Date: Tue, 19 Nov 2019 18:05:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191119170019.18450-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/cpuid: Fix Lisbon/Magny-Cours
 Opterons WRT SSSE3/SSE4A
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMTkgMTg6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gYy9zIGZmNjZjY2VmZTUg
Ing4Ni9DUFVJRDogYWRqdXN0IFNTRW4gZGVwZW5kZW5jaWVzIiBtYWRlIFNTRTRBIGRlcGVuZCBv
bgo+IFNTU0UzLCBidXQgdGhlc2UgcHJvY2Vzc29ycyByZWFsbHkgZG8gaGF2ZSBoYXZlIFNTRTRB
IHdpdGhvdXQgU1NTRTMuCj4gCj4gVGhpcyBtYW5pZmVzdHMgYXMgYW4gdXBncmFkZSByZWdyZXNz
aW9uLCBhcyB0aGUgU1NFNEEgZmVhdHVyZSBkaXNhcHBlYXJzIGZyb20KPiB2aWV3Lgo+IAo+IEFk
anVzdCB0aGUgU1NFNEEgZmVhdHVyZSB0byBkZXBlbmQgb24gU1NFMyByYXRoZXIgdGhhbiBTU1NF
My4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
