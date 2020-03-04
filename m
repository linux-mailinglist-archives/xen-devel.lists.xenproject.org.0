Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425A1794BE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:16:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WdQ-0000P7-LX; Wed, 04 Mar 2020 16:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9WdP-0000P2-EB
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:12:35 +0000
X-Inumbo-ID: f55d1156-5e32-11ea-a431-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f55d1156-5e32-11ea-a431-12813bfff9fa;
 Wed, 04 Mar 2020 16:12:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B8F3AD2A;
 Wed,  4 Mar 2020 16:12:34 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-22-anthony.perard@citrix.com>
 <20200227131625.GQ24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9f0a99e-fcd8-d3e6-0e16-f4258d257909@suse.com>
Date: Wed, 4 Mar 2020 17:12:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227131625.GQ24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 21/23] xen/build: Use if_changed for
 prelink*.o
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxNDoxNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyNiwgMjAyMCBhdCAxMTozMzo1M0FNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4g
V2UgY2hhbmdlIHRoZSBkZXBlbmRlbmNpZXMgb2YgcHJlbGluay1lZmkubyBzbyB0aGF0IHdlIGNh
biB1c2UgdGhlCj4+IHNhbWUgY29tbWFuZCBsaW5lLiBUaGUgZGVwZW5kZW5jeSBvbiBlZmkvYnVp
bHRfaW4ubyBpc24ndCBuZWVkZWQKPj4gYmVjYXVzZSwgd2UgYWxyZWFkeSBoYXZlOgo+PiAgICAg
ZWZpLyoubzogZWZpL2J1aWx0X2luLm8KPj4gdG8gYnVpbGQgZWZpLyoubyBmaWxlcyB0aGF0IHBy
ZWxpbmstZWZpLm8gbmVlZHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
