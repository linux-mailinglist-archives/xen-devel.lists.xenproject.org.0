Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB411E160
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:01:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifhhy-0002ju-CH; Fri, 13 Dec 2019 09:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifhhw-0002jn-HS
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 09:58:00 +0000
X-Inumbo-ID: 06435514-1d8f-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06435514-1d8f-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 09:57:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6E4D2B292;
 Fri, 13 Dec 2019 09:57:50 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <09e75904-8faa-fbae-39ea-d9bd026ea4fa@suse.com>
 <1a17bb6d-6f32-280e-0d00-6d06f3520052@amazon.com>
 <0fe3d33f-b83c-4640-c999-fa773c0264a6@suse.com>
 <22a03442-bdf7-8a20-ee21-d668cf2fa878@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7577bb30-ea17-da9b-6552-6225d71b83a9@suse.com>
Date: Fri, 13 Dec 2019 10:58:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <22a03442-bdf7-8a20-ee21-d668cf2fa878@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAyMzoxNywgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gdGhlICJuZXdl
c3Qgb2YgZXZlcnl0aGluZyI6IFRoYXQncyBub3Qgd2hhdCBJIGludGVuZCB0byBwcm9wb3NlLiBU
aGUgCj4gbWljcm9jb2RlIHByb3ZpZGVkIHZpYSBhIHNjYW4gKG9yIDxpbnRlZ2VyPiBmb3IgdGhh
dCBtYXR0ZXIpIHdpbGwgYWx3YXlzIAo+IG92ZXJyaWRlIHRoZSBidWlsdGluIG1pY3JvY29kZS4g
VGhlIGNvbW1vbiBjYXNlIHdvdWxkIGJlIHRoYXQgdGhlIAo+IG1pY3JvY29kZSBwcm92aWRlZCB2
aWEgYSBzY2FuIChvciA8aW50ZWdlcj4pIGlzIG5ld2VyIHRoYW4gdGhlIGJ1aWx0aW4uIAo+IFll
dCwgYW4gYWRtaW5pc3RyYXRvciB3aWxsIGhhdmUgdGhlIG9wdGlvbiwgaWYgbmVlZGVkLCB0byB1
c2UgYW4gb2xkZXIgCj4gbWljcm9jb2RlIHZpYSBhIHNjYW4gKG9yIDxpbnRlZ2VyPikgdG8gb3Zl
cnJpZGUgYSBuZXdlciBidWlsdGluIG1pY3JvY29kZS4KClRoYXQncyBhIGZhaXIgZW5vdWdoIG1v
ZGVsLCBidXQgaXQgd2FudHMgc3BlbGxpbmcgb3V0IGluIHRoZSBwYXRjaApkZXNjcmlwdGlvbi4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
