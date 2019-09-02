Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC4A5878
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:55:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4ml8-0000ay-KO; Mon, 02 Sep 2019 13:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4ml7-0000at-V1
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:52:41 +0000
X-Inumbo-ID: ee308682-cd88-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee308682-cd88-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:52:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4DDCBAEAE;
 Mon,  2 Sep 2019 13:52:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190902121151.11384-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c533a4e-5547-adb6-4ea7-1f817d05afaa@suse.com>
Date: Mon, 2 Sep 2019 15:52:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902121151.11384-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/acpi: Drop sleep_states[] and
 associated print messages
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBzbGVlcF9zdGF0ZXNb
XSBpcyBhIHdyaXRlLW9ubHkgYXJyYXksIGFuZCBkZXNwaXRlIHRoZSBsb29wIGxvZ2ljLCB0aGUg
cHJpbnRlZAo+IG1lc3NhZ2UgaXMgY29uc2lzdGVudGx5ICJBQ1BJIHNsZWVwIG1vZGVzOiBTMyIu
ICBEcm9wIGl0IGFsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkFsYmVpdCBGVFIgSSdtIG5vdCBjb252aW5jZWQgcmVtb3ZpbmcgdGhlIGxvZyBtZXNz
YWdlIGlzIHJlYWxseSBhCmdvb2QgaWRlYS4gQnV0IHdlIGNhbiBzdXJlbHkgcmUtaW5zdGF0ZSBp
dCBpZiB3ZSBldmVyIG1lYW4gdG8Kc3VwcG9ydCB0aGluZ3Mgb3RoZXIgdGhhbiBTMy4gVGhlIG9u
bHkgY29uY2VybiB3b3VsZCBiZSB3aGV0aGVyLAphcyBpaXJjIHdhcyBzdWdnZXN0ZWQgc29tZXdo
ZXJlLCB3ZSBtYXkgd2FudCB0byBhbGxvdyBzdXBwcmVzc2luZwp1c2Ugb2YgUzMsIGluIHdoaWNo
IGNhc2UgdGhlIGxvZyBtZXNzYWdlIG1pZ2h0IGluZGVlZCBiZSBoZWxwZnVsCmV2ZW4gd2l0aG91
dCB1cyBzdXBwb3J0aW5nIG90aGVyIHNsZWVwIHN0YXRlcy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
