Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850417DF80
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:07:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBH9T-0002Tn-0s; Mon, 09 Mar 2020 12:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBH9S-0002Ti-0y
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:04:54 +0000
X-Inumbo-ID: 2e66d832-61fe-11ea-ac14-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e66d832-61fe-11ea-ac14-12813bfff9fa;
 Mon, 09 Mar 2020 12:04:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D44BEAE19;
 Mon,  9 Mar 2020 12:04:50 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Date: Mon, 9 Mar 2020 13:04:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/9] x86: reduce include dependencies
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gYSBudW1iZXIgb2YgY2FzZXMgSSd2ZSBub3RpY2VkIHRoZSB4ODYgZW11bGF0b3IsIHdoaWNo
IGlzIHF1aXRlCnNsb3cgdG8gYnVpbGQgZXNwZWNpYWxseSB3aXRoIG5vdCB2ZXJ5IG5ldyBnY2Ms
IHRvIHJlLWJ1aWxkIHdoZW4KaGF2aW5nIGNoYW5nZWQgaGVhZGVycyB3aGljaCBJIHdvdWxkbid0
IGhhdmUgZXhwZWN0ZWQgdG8gYmUKaW5jbHVkZWQgdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLiBI
ZW5jZSBJJ3ZlIGdvbmUgdGhyb3VnaCB0aGUKZGVwZW5kZW5jaWVzIG9mIHRoYXQgb2JqZWN0IGZp
bGUgYW5kIHRyaWVkIHRvIGdldCByaWQgb2YgYXQgbGVhc3QKc29tZSBvZiB0aGUgdmVyeSBvZGQg
ZGVwZW5kZW5jaWVzIHRoZXJlLiAoU29tZSBhcmUgYmVpbmcgYWRkcmVzc2VkCmFsc28gYmUgdGhl
IHNlcGFyYXRlbHkgc2VudCBtZW0tYWNjZXNzIGFuZCB2bS1ldmVudCBwYXRjaGVzIHdpdGggYQpz
aW1pbGFyIHN1YmplY3QuKQoKMTogSFZNOiByZWR1Y2UgZG9tYWluLmggaW5jbHVkZSBkZXBlbmRl
bmNpZXMKMjogSFZNOiByZWR1Y2UgdmNwdS5oIGluY2x1ZGUgZGVwZW5kZW5jaWVzCjM6IEhWTTog
cmVkdWNlIHZwdC5oIGluY2x1ZGUgZGVwZW5kZW5jaWVzCjQ6IEhWTTogcmVkdWNlIHZwaWMuaCBp
bmNsdWRlIGRlcGVuZGVuY2llcwo1OiBIVk06IHJlZHVjZSB2aW9hcGljLmggaW5jbHVkZSBkZXBl
bmRlbmNpZXMKNjogSFZNOiByZWR1Y2UgdmxhcGljLmggaW5jbHVkZSBkZXBlbmRlbmNpZXMKNzog
SFZNOiByZWR1Y2UgaW8uaCBpbmNsdWRlIGRlcGVuZGVuY2llcwo4OiBIVk06IHJlZHVjZSBodm0u
aCBpbmNsdWRlIGRlcGVuZGVuY2llcwo5OiByZWR1Y2UgbWNlLmggaW5jbHVkZSBkZXBlbmRlbmNp
ZXMKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
