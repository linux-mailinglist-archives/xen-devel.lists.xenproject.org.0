Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3592126686
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 17:18:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihyRl-0007hv-8D; Thu, 19 Dec 2019 16:14:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihyRk-0007hq-DX
 for xen-devel@lists.xen.org; Thu, 19 Dec 2019 16:14:40 +0000
X-Inumbo-ID: a820345c-227a-11ea-9202-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a820345c-227a-11ea-9202-12813bfff9fa;
 Thu, 19 Dec 2019 16:14:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 74163ACE1;
 Thu, 19 Dec 2019 16:14:38 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <61c9b6aa-7c0d-6034-9846-ca09bb87361c@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d7087df1-16f5-85b8-a97c-328f78ce9dd6@suse.com>
Date: Thu, 19 Dec 2019 17:14:35 +0100
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
ICAgIGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMTIxNzQ4LwoKU28gaW4gc2NoZWRfc2xhdmUo
KSAqdnByZXYgaXMgYWxyZWFkeSBzY3J1YmJlZC4KCkkgaGF2ZSBjdXJyZW50bHkgbm8gaWRlYSBo
b3cgdGhhdCBjb3VsZCBoYXBwZW4sIGlzIHZwcmV2LT5pc19ydW5uaW5nCnNob3VsZCBiZSBjbGVh
cmVkIG9ubHkgYSBsaXR0bGUgYml0IGxhdGVyLgoKV2lsbCBsb29rIGludG8gaXQgbW9yZS4uCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
