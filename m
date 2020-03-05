Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8A17A3AE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:08:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oKu-0007V0-RT; Thu, 05 Mar 2020 11:06:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9oKt-0007Ut-C0
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:06:39 +0000
X-Inumbo-ID: 628387c6-5ed1-11ea-a563-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 628387c6-5ed1-11ea-a563-12813bfff9fa;
 Thu, 05 Mar 2020 11:06:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D683DACD9;
 Thu,  5 Mar 2020 11:06:37 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <d323139d-97ef-0c76-8ec6-a669f5b0ba2d@eikelenboom.it>
 <bb3965c5-6724-b261-260b-d07e40176802@suse.com>
 <1bd973f7-f863-7401-870a-2569905e19a0@eikelenboom.it>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c95163ff-39a5-259a-16b4-23534ce4d2a5@suse.com>
Date: Thu, 5 Mar 2020 12:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1bd973f7-f863-7401-870a-2569905e19a0@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] xen boot PVH guest with linux 5.6.0-rc4-ish kernel:
 general protection fault, RIP: 0010:__pv_queued_spin_lock_slowpath
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAgMTI6MDQsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPiBPbiAwNS8wMy8y
MDIwIDExOjE4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAwNC4wMy4yMCAxODo1MiwgU2Fu
ZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+Pj4gSGkgSnVlcmdlbiwKPj4+Cj4+PiBKdXN0IHRlc3Rl
ZCBhIDUuNi4wLXJjNCdpc2gga2VybmVsICg4YjYxNGNiOGYxZGNhYzhjYTc3Y2Y0ZGQ4NWY0NmVm
MzA1NWY4MjM4LCBzbyBpdCBpbmNsdWRlcyB0aGUgeGVuIGZpeGVzIGZyb20geDg2IHRyZWVzKS4K
Pj4+IFhlbiBpcyB0aGUgbGF0ZXN0IHhlbi11bnN0YWJsZSwgZG9tMCBrZXJuZWwgaXMgNS41Ljcu
Cj4+Pgo+Pj4gRHVyaW5nIGJvb3Qgb2YgdGhlIFBWSCBndWVzdCBJIGdvdCB0aGUgc3BsYXQgYmVs
b3cuCj4+PiBXaXRoIGEgNS41Ljcga2VybmVsIHRoZSBndWVzdCBib290cyBmaW5lLgo+Pgo+PiBU
aGVyZSB3ZXJlIDIgYnVncy4gSSBoYXZlIHNlbnQgdGhlIHBhdGNoZXMuCj4gCj4gU3VyZSA/Cj4g
SGF2ZW4ndCBzZWVuIHRoZW0gY29taW5nIGluIC4uLgoKaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4v
MjAyMDAzMDUxMDAzMzEuMTY3OTAtMS1qZ3Jvc3NAc3VzZS5jb20vCmh0dHBzOi8vcGF0Y2hldy5v
cmcvWGVuLzIwMjAwMzA1MTAwMzIzLjE2NzM2LTEtamdyb3NzQHN1c2UuY29tLwoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
