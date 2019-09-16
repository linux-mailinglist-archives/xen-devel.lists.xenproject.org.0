Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91EB3773
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nYh-0004na-Tr; Mon, 16 Sep 2019 09:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9nYg-0004nU-Sn
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:44:34 +0000
X-Inumbo-ID: 964b30f0-d866-11e9-95d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 964b30f0-d866-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 09:44:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D66DBAB87;
 Mon, 16 Sep 2019 09:44:32 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
Date: Mon, 16 Sep 2019 11:44:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/2] x86emul: vendor specific treatment
 adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSd2ZSBub3RpY2VkIHRoZSBpc3N1ZSB0aGUgMXN0IHBhdGNoIG1lYW5zIHRvIGFkZHJlc3Mgb25s
eSB3aGlsZQpwdXR0aW5nIHRvZ2V0aGVyIHRoZSAybmQuIENvbnNpZGVyaW5nIHRoZSBvdGhlciBI
eWdvbiBlbmFibGVtZW50CmluIHRoaXMgcmVsZWFzZSBjeWNsZSBJIHRoaW5rIHdlIHdhbnQgcGF0
Y2ggMSBmb3IgNC4xMy4gUGF0Y2ggMgpzaG91bGQgYmUgY29uc2lkZXJlZCB0b28sIGJ1dCB3ZSd2
ZSBiZWVuIGVmZmVjdGl2ZWx5IG1pcy1lbXVsYXRpbmcKTU9WU1hEIG9uIG1vZGVybiBJbnRlbCBo
YXJkd2FyZSBmb3IgcXVpdGUgc29tZSB0aW1lLCBzbyBpdCBnZXR0aW5nCmRlbGF5ZWQgdW50aWwg
YWZ0ZXIgNC4xMyAoYW5kIHRoZW4gcG9zc2libGUgYmUgYmFja3BvcnRlZCkgd291bGRuJ3QKYmUg
b3Zlcmx5IGJhZC4KCjE6IHRyZWF0IEh5Z29uIGd1ZXN0cyBsaWtlIEFNRCBvbmVzCjI6IGFkanVz
dCBNT1ZTWEQgc291cmNlIG9wZXJhbmQgaGFuZGxpbmcKCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
