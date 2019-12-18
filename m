Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2118124EC5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 18:04:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihcgJ-0001Ht-UI; Wed, 18 Dec 2019 17:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihcgI-0001Ho-By
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 17:00:14 +0000
X-Inumbo-ID: d5d3c4ff-21b7-11ea-90cb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5d3c4ff-21b7-11ea-90cb-12813bfff9fa;
 Wed, 18 Dec 2019 17:00:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DF29AB92;
 Wed, 18 Dec 2019 17:00:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-users <xen-users@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org
Message-ID: <fc0a2b00-e047-172d-04cd-91950f0e9448@suse.com>
Date: Wed, 18 Dec 2019 18:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [ANNOUNCEMENT] Xen 4.13 is released
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBjb21tdW5pdHkgbWVtYmVycywKCkknbSBwbGVhc2VkIHRvIGFubm91bmNlIHRoYXQgWGVu
IDQuMTMuMCBpcyByZWxlYXNlZC4KClBsZWFzZSBmaW5kIHRoZSB0YXJiYWxsIGFuZCBpdHMgc2ln
bmF0dXJlIGF0OgoKICAgaHR0cHM6Ly9kb3dubG9hZHMueGVucHJvamVjdC5vcmcvcmVsZWFzZS94
ZW4vNC4xMy4wLwoKWW91IGNhbiBhbHNvIGNoZWNrIG91dCB0aGUgdGFnIGluIHhlbi5naXQ6Cgog
ICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0IFJFTEVBU0UtNC4xMy4w
CgpHaXQgY2hlY2tvdXQgYW5kIGJ1aWxkIGluc3RydWN0aW9ucyBjYW4gYmUgZm91bmQgYXQ6Cgpo
dHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fUHJvamVjdF80LjEzX1JlbGVhc2Vf
Tm90ZXMjQnVpbGRfUmVxdWlyZW1lbnRzCgpSZWxlYXNlIG5vdGVzIGNhbiBiZSBmb3VuZCBhdDoK
CiAgIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl9Qcm9qZWN0XzQuMTNfUmVs
ZWFzZV9Ob3RlcwoKQSBzdW1tYXJ5IGZvciA0LjEzIHJlbGVhc2UgZG9jdW1lbnRzIGNhbiBiZSBm
b3VuZCBhdDoKCiAgIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0NhdGVnb3J5Olhl
bl80LjEzCgpUZWNobmljYWwgYmxvZyBwb3N0IGZvciA0LjEzIGNhbiBiZSBmb3VuZCBhdDoKCiAg
IGh0dHBzOi8veGVucHJvamVjdC5vcmcvMjAxOS8xMi8xOC93aGF0cy1uZXctaW4teGVuLTQtMTMv
CgpUaGFua3MgZXZlcnlvbmUgd2hvIGNvbnRyaWJ1dGVkIHRvIHRoaXMgcmVsZWFzZS4gVGhpcyBy
ZWxlYXNlIHdvdWxkCm5vdCBoYXZlIGhhcHBlbmVkIHdpdGhvdXQgYWxsIHRoZSBhd2Vzb21lIGNv
bnRyaWJ1dGlvbnMgZnJvbSBhcm91bmQKdGhlIGdsb2JlLgoKUmVnYXJkcywKCkp1ZXJnZW4gR3Jv
c3MgKG9uIGJlaGFsZiBvZiB0aGUgWGVuIFByb2plY3QgSHlwZXJ2aXNvciB0ZWFtKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
