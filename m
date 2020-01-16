Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A813DF9D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:09:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7fR-0000Dt-Tc; Thu, 16 Jan 2020 16:06:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOjP=3F=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1is7fP-0000Dm-Qk
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:06:43 +0000
X-Inumbo-ID: 2d8bcf9c-387a-11ea-8771-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d8bcf9c-387a-11ea-8771-12813bfff9fa;
 Thu, 16 Jan 2020 16:06:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579190800; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=D1XEQrxmRSQcADORZc3/c6VoQQA3ta1oMdCu2VlAr5E=;
 b=gAT/W/6dJWJi1698k5nw24wgaMOU6JhUYpi+TjyKAx1XFPe9RqLKoxEEGrfFE5HOGE85LjV3
 PlTbZz9eEZYhuNuqBpO8H7H1M1LtzK3W7XpQrWrQhI6ey1tVEYqgpTvBcMDCIncGBhdG9zJf
 NLnmlJwMx+mapkcC0GvHUFVbOZs=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mxa.mailgun.org with ESMTP id 5e208a0c.7f4742f7fdb0-smtp-out-n03;
 Thu, 16 Jan 2020 16:06:36 -0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p17so4418313wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:06:35 -0800 (PST)
X-Gm-Message-State: APjAAAVfm4aplh0A2LS8QAu54F6c++h7J7HuUq108VzCWt3y2shuak1z
 xZenWkzzE9//wCW4zTDGbzud/PpeQ3l+OVg/5yI=
X-Google-Smtp-Source: APXvYqzYzBizUl7XMJ77hhm2MVsJWHhf0X6BDgRhL/MN4JajZkqE+ceDV4Uv6l6Yq+sGFLe7spw0mPWbNJ2DtaH2L+A=
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr105943wma.84.1579190795164; 
 Thu, 16 Jan 2020 08:06:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <3f8ab6b4cf686e814d91961b564fede6d0c64030.1578503483.git.tamas.lengyel@intel.com>
 <e1fe9e56-919a-409d-c01a-1453d0338dcf@suse.com>
In-Reply-To: <e1fe9e56-919a-409d-c01a-1453d0338dcf@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Jan 2020 09:05:58 -0700
X-Gmail-Original-Message-ID: <CABfawhkWzi9b7xkOtUE+VZm9JRej1SSJvC7ROoK1rHCtWfpxNQ@mail.gmail.com>
Message-ID: <CABfawhkWzi9b7xkOtUE+VZm9JRej1SSJvC7ROoK1rHCtWfpxNQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 06/18] x86/mem_sharing: define
 mem_sharing_domain to hold some scattered variables
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

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgODoyMyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQ3JlYXRlIHN0cnVjdCBtZW1fc2hhcmluZ19kb21haW4gdW5kZXIgaHZtX2RvbWFp
biBhbmQgbW92ZSBtZW0gc2hhcmluZwo+ID4gdmFyaWFibGVzIGludG8gaXQgZnJvbSBwMm1fZG9t
YWluIGFuZCBodm1fZG9tYWluLgo+ID4KPiA+IEV4cG9zZSB0aGUgbWVtX3NoYXJpbmdfZW5hYmxl
ZCBtYWNybyB0byBiZSB1c2VkIGNvbnNpc3RlbnRseSBhY3Jvc3MgWGVuLgo+ID4KPiA+IFJlbW92
ZSBzb21lIGR1cGxpY2F0ZSBjYWxscyB0byBtZW1fc2hhcmluZ19lbmFibGVkIGluIG1lbV9zaGFy
aW5nLmMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5
ZWxAaW50ZWwuY29tPgo+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiB3aXRoIG9uZSBxdWVzdGlvbjoKPgo+ID4gQEAgLTE5Miw2ICsxOTIsMTAgQEAgc3RydWN0
IGh2bV9kb21haW4gewo+ID4gICAgICAgICAgc3RydWN0IHZteF9kb21haW4gdm14Owo+ID4gICAg
ICAgICAgc3RydWN0IHN2bV9kb21haW4gc3ZtOwo+ID4gICAgICB9Owo+ID4gKwo+ID4gKyNpZmRl
ZiBDT05GSUdfTUVNX1NIQVJJTkcKPiA+ICsgICAgc3RydWN0IG1lbV9zaGFyaW5nX2RvbWFpbiBt
ZW1fc2hhcmluZzsKPiA+ICsjZW5kaWYKPgo+IEFyZSB5b3UgaW50ZW5kaW5nIHRvIGFkZCBmaWVs
ZHMgdG8gdGhpcyBuZXcgc3RydWN0PyBJZiBzbywKPiBzaG91bGQgdGhlIGZpZWxkIGhlcmUgYmVj
b21lIGEgcG9pbnRlciwgYW5kIHRoZSBzdHJ1Y3R1cmUKPiBhbGxvY2F0ZWQgb25seSB3aGVuIGFj
dHVhbGx5IG5lZWRlZD8KPgoKQXQgdGhlIG1vbWVudCB0aGVyZSBhcmUgbm8gYWRkaXRpb25hbCB2
YXJpYWJsZXMgcGxhbm5lZCB0byBiZSBhZGRlZC4KSWYvd2hlbiB3ZSBkbyB3ZSBjYW4gY29uc2lk
ZXIgdHVybmluZyB0aGlzIGludG8gYSBwb2ludGVyLCBhdCB3aGljaApwb2ludCB3ZSBjYW4gYWxz
byBnZXQgcmlkIG9mIHRoZSAiZW5hYmxlZCIgZmllbGQgYW5kIHR1cm4gdGhlCm1lbV9zaGFyaW5n
X2VuYWJsZWQgbWFjcm8gaW50byBhIE5VTEwtcG9pbnRlciBjaGVjayBpbnN0ZWFkLiBGb3Igbm93
IEkKd291bGRuJ3QgYm90aGVyIGJlY2F1c2UgaXRzIG5vdCBsaWtlIHdlIHNhdmUgbXVjaCBieSBk
b2luZyBzby4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
