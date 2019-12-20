Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4632C1275CB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 07:31:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiBjp-0002mV-C3; Fri, 20 Dec 2019 06:26:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiBjn-0002mQ-RN
 for xen-devel@lists.xen.org; Fri, 20 Dec 2019 06:26:11 +0000
X-Inumbo-ID: 9c9a3714-22f1-11ea-930b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c9a3714-22f1-11ea-930b-12813bfff9fa;
 Fri, 20 Dec 2019 06:26:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BBEAACC6;
 Fri, 20 Dec 2019 06:26:09 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <61c9b6aa-7c0d-6034-9846-ca09bb87361c@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e0986106-fe53-6a73-d70c-cd2ae1783b46@suse.com>
Date: Fri, 20 Dec 2019 07:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <61c9b6aa-7c0d-6034-9846-ca09bb87361c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Recent cores-scheduling failures
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
Cc: Xen-devel <xen-devel@lists.xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMTkgMTM6NDUsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGkgSnVlcmdlbiwKPiAK
PiBXZSByZWNlbnRseSBkaWQgYW5vdGhlciBxdWljayB0ZXN0IG9mIGNvcmUgc2NoZWR1bGluZyBt
b2RlLCBhbmQgdGhlIGZvbGxvd2luZwo+IGZhaWx1cmVzIHdlcmUgZm91bmQ6Cj4gCj4gMS4gbGl2
ZS1wYXRjaCBhcHBseSBmYWlsdXJlczoKPiAKPiAgICAgIChYRU4pIFsgMTA1OC43NTE5NzRdIGxp
dmVwYXRjaDogbHBfMV8xOiBUaW1lZCBvdXQgb24gc2VtYXBob3JlIGluIENQVSBxdWllc2NlIHBo
YXNlIDMwLzMxCj4gICAgICAoWEVOKSBbIDEwNTguNzUxOTgyXSBsaXZlcGF0Y2g6IGxwXzFfMSBm
aW5pc2hlZCBSRVBMQUNFIHdpdGggcmM9LTE2Cj4gCj4gMi4gQUNQSSBTNSBjcmFzaDoKPiAKPiAg
ICAgIGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMTIxNzQ4LwoKQXJlIHRoZXJlIGFueSBYZW5T
ZXJ2ZXIgcGF0Y2hlcyBpbiB5b3VyIGh5cGVydmlzb3I/CgpJJ20gYXNraW5nIGJlY2F1c2UgSSBk
b24ndCBzZWUgd2h5IGEgdmNwdSB3b3VsZCBiZSBmcmVlZCB3aGVuIHNodXR0aW5nCmRvd24gdGhl
IGhvc3QgKG90aGVyIHRoYW4gYnkgYW55IHNodXRkb3duIHNjcmlwdHMsIGJ1dCB0aG9zZSBzaG91
bGQgYmUKbG9uZyBmaW5pc2hlZCB3aGVuIHRyeWluZyB0byBlbnRlciBTNSkuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
