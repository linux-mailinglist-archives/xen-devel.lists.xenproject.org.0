Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E01BF5D8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVbd-0007hJ-8d; Thu, 26 Sep 2019 15:22:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDVbb-0007hA-IL
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 15:22:55 +0000
X-Inumbo-ID: 82da3440-e071-11e9-9658-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 82da3440-e071-11e9-9658-12813bfff9fa;
 Thu, 26 Sep 2019 15:22:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C952AF10;
 Thu, 26 Sep 2019 15:22:53 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20190926133618.24083-1-sergey.dyasli@citrix.com>
 <20190926135041.72cri2bam4ub3ojq@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <78c74dfe-7a21-b785-5bfb-ea090f027167@suse.com>
Date: Thu, 26 Sep 2019 17:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926135041.72cri2bam4ub3ojq@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shim: fix ballooning down the guest
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMTkgMTU6NTEsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+IE9uIFRodSwgU2Vw
IDI2LCAyMDE5IGF0IDAyOjM2OjE4UE0gKzAxMDAsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+IEN1
cnJlbnRseSBiYWxsb29uaW5nIGRvd24gYSBwdnNoaW0gZ3Vlc3QgY2F1c2VzIHRoZSBmb2xsb3dp
bmcgZXJyb3JzCj4+IGluc2lkZSB0aGUgc2hpbToKPj4KPj4gICAgICBkM3YwIGZhaWxlZCB0byBy
ZXNlcnZlIDUxMiBleHRlbnRzIG9mIG9yZGVyIDUxMiBmb3Igb2ZmbGluaW5nCj4+Cj4+IEFuZCB0
aGUgYmFsbG9vbmVkLW91dCBwYWdlcyBzdGF5IGluc2lkZSBzaGltIGFuZCBkb24ndCByZWFjaCBM
MCBYZW4uCj4+Cj4+IEZpeCB0aGlzIGJ5IHBhc3NpbmcgdGhlIGNvcnJlY3QgYXJndW1lbnRzIHRv
IHB2X3NoaW1fb2ZmbGluZV9tZW1vcnkoKQo+PiBkdXJpbmcgYSBYRU5NRU1fZGVjcmVhc2VfcmVz
ZXJ2YXRpb24gcmVxdWVzdC4KPj4KPiAKPiBUaGlzIGlzIG1pc3Npbmc6Cj4gCj4gRml4ZXM6IGIy
MjQ1YWNjNjBjMyAoJ3hlbi9wdnNoaW06IG1lbW9yeSBob3RwbHVnJykKPiAKPj4gU2lnbmVkLW9m
Zi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBBbHNv
IGFkZGluZyBKdWVyZ2VuIGZvciBhIHJlbGVhc2UgQWNrLgo+IAo+IFRoYW5rcywgUm9nZXIuCj4g
CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
