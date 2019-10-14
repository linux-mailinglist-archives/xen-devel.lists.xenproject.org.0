Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC9D612C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 13:22:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJyNP-0008VX-RI; Mon, 14 Oct 2019 11:18:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iJyNO-0008VC-EV
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 11:18:58 +0000
X-Inumbo-ID: 652028f4-ee74-11e9-9379-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 652028f4-ee74-11e9-9379-12813bfff9fa;
 Mon, 14 Oct 2019 11:18:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D18ACB126;
 Mon, 14 Oct 2019 11:18:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-users <xen-users@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org
Message-ID: <02a5b82e-3ddb-217b-a970-feb60797ef9e@suse.com>
Date: Mon, 14 Oct 2019 13:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [ANNOUNCE] Xen 4.13 RC1
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

SGkgYWxsLAoKWGVuIDQuMTMgcmMxIGlzIHRhZ2dlZC4gWW91IGNhbiBjaGVjayB0aGF0IG91dCBm
cm9tIHhlbi5naXQ6CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdCA0LjEzLjAtcmMxCgpG
b3IgeW91ciBjb252ZW5pZW5jZSB0aGVyZSBpcyBhbHNvIGEgdGFyYmFsbCBhdDoKaHR0cHM6Ly9k
b3dubG9hZHMueGVucHJvamVjdC5vcmcvcmVsZWFzZS94ZW4vNC4xMy4wLXJjMS94ZW4tNC4xMy4w
LXJjMS50YXIuZ3oKCkFuZCB0aGUgc2lnbmF0dXJlIGlzIGF0OgpodHRwczovL2Rvd25sb2Fkcy54
ZW5wcm9qZWN0Lm9yZy9yZWxlYXNlL3hlbi80LjEzLjAtcmMxL3hlbi00LjEzLjAtcmMxLnRhci5n
ei5zaWcKClBsZWFzZSBzZW5kIGJ1ZyByZXBvcnRzIGFuZCB0ZXN0IHJlcG9ydHMgdG8geGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnLgpXaGVuIHNlbmRpbmcgYnVnIHJlcG9ydHMsIHBsZWFz
ZSBDQyByZWxldmFudCBtYWludGFpbmVycyBhbmQgbWUKKGpncm9zc0BzdXNlLmNvbSkuCgpUaGVy
ZSB3aWxsIGJlIGEgWGVuIFRlc3QgRGF5IG9uIEZlYiAxNXRoLgoKU2VlIGluc3RydWN0aW9ucyBv
bjoKCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl80LjEzX1JDX3Rlc3RfaW5z
dHJ1Y3Rpb25zCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl9Qcm9qZWN0X1Rl
c3RfRGF5cwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
