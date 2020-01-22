Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33E145AA3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 18:12:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJVS-0006Xp-N3; Wed, 22 Jan 2020 17:09:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihv9=3L=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iuJVR-0006Xk-2e
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 17:09:29 +0000
X-Inumbo-ID: f29b69dc-3d39-11ea-bccf-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f29b69dc-3d39-11ea-bccf-12813bfff9fa;
 Wed, 22 Jan 2020 17:09:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579712968; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=sXXhASW1/SKJ3H/OcIO4K6RnBvzCJH7ZOevTo84kpyo=;
 b=fhaQOajLw7hT7VKf5HpzMpQ3TjX7IMbc4jBgChcapWNTre0mX6IBXbcIZqCzDC8ZlE0Oki/o
 x5qfZpXJSthk1SY9ZdDDM3woEhcgoz3degU/fSvID0lM1unC5Zw5+oX6hHd3Z4OceNYZ6C9q
 +OqxcVY65m2BrBgUhUy4Q7PUQ9w=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5e2881c6.7f02ce431cb0-smtp-out-n02;
 Wed, 22 Jan 2020 17:09:26 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p17so8003781wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 09:09:26 -0800 (PST)
X-Gm-Message-State: APjAAAXtbxFlE4xe+A6qhE2c7wYfvDLMgTyo2ML3a/MEOVBcUoK1ohnb
 LtRKFj+/uGWQ0ZmUCsZRQxUPKmIjbLgpRUMPVQU=
X-Google-Smtp-Source: APXvYqz1GB6teKk7opN0DzXrTNCAzGL9SHDISIG6bJsXvowAjOC+CNw7J2zjWKqnh+SzjfYkol/6A7jWWx1mdmSlyhg=
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr3893529wma.84.1579712965036; 
 Wed, 22 Jan 2020 09:09:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <1ccb1524a08c3db2f59b7dae4d8377e1c98903c9.1579628566.git.tamas.lengyel@intel.com>
 <52f14300-8ebe-d7c3-5f54-4084c631034b@suse.com>
In-Reply-To: <52f14300-8ebe-d7c3-5f54-4084c631034b@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 Jan 2020 10:08:47 -0700
X-Gmail-Original-Message-ID: <CABfawhmVqWEkj9RRgiDD8W_C-u+p84H69_HVK-anLaimS+=uPQ@mail.gmail.com>
Message-ID: <CABfawhmVqWEkj9RRgiDD8W_C-u+p84H69_HVK-anLaimS+=uPQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v5 14/18] x86/mem_sharing: use
 default_access in add_to_physmap
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgODozNSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gV2hlbiBwbHVnZ2luZyBhIGhvbGUgaW4gdGhlIHRhcmdldCBwaHlzbWFwIGRvbid0
IHVzZSB0aGUgYWNjZXNzIHBlcm1pc3Npb24KPiA+IHJldHVybmVkIGJ5IF9fZ2V0X2dmbl90eXBl
X2FjY2VzcyBhcyBpdCBjYW4gYmUgbm9uLXNlbnNpY2FsLAo+Cj4gImNhbiBiZSIgaXMgdG9vIHZh
Z3VlIGZvciBteSB0YXN0ZSAtIGl0IHN1Z2dlc3RzIHRoZXJlIG1heSBhbHNvIGJlIGNhc2VzCj4g
d2hlcmUgYSBzZW5zaWJsZSB2YWx1ZSBpcyByZXR1cm5lZCwgYW5kIGhlbmNlIGl0IHNob3VsZCBi
ZSB1c2VkLiBDb3VsZAo+IHlvdSBjbGFyaWZ5IHRoaXMgcGxlYXNlPyAoVGhlIGNvZGUgY2hhbmdl
IGl0c2VsZiBvZiBjb3Vyc2UgaXMgc2ltcGxlIGFuZAo+IG1lY2hhbmljYWwgZW5vdWdoIHRvIGxv
b2sgb2theS4pCgpXZWxsLCBJIGNhbiBvbmx5IHNwZWFrIG9mIHdoYXQgSSBvYnNlcnZlZC4gVGhl
IGNhc2Ugc2VlbXMgdG8gYmUgdGhhdAptb3N0IG9mIHRoZSB0aW1lIHRoZSBmdW5jdGlvbiBhY3R1
YWxseSByZXR1cm5zIHAybV9hY2Nlc3Nfcnd4ICh3aGljaAppcyBzZW5zaWJsZSksIGJ1dCBvY2Nh
c2lvbmFsbHkgc29tZXRoaW5nIGVsc2UuIEkgZGlkbid0IGludmVzdGlnYXRlCndoZXJlIHRoYXQg
dmFsdWUgYWN0dWFsbHkgY29tZXMgZnJvbSwgYnV0IHdoZW4gcG9wdWxhdGluZyBhIHBoeXNtYXAK
bGlrZSB0aGlzIG9ubHkgdGhlIGRlZmF1bHRfYWNjZXNzIGlzIHNhbmUuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
