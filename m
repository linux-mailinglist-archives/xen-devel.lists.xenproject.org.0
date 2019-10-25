Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948DE489F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 12:33:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNwrt-0006SO-8I; Fri, 25 Oct 2019 10:30:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNwrr-0006SJ-Ua
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 10:30:51 +0000
X-Inumbo-ID: 828fc1e6-f712-11e9-94c2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 828fc1e6-f712-11e9-94c2-12813bfff9fa;
 Fri, 25 Oct 2019 10:30:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D109269A3E;
 Fri, 25 Oct 2019 10:30:47 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
Date: Fri, 25 Oct 2019 12:31:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] getting 4.11.3 ready
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLAoKdGhlIDQuMTEuMyBzdGFibGUgcmVsZWFzZSBpcyBkdWUuIEkgaW50ZW5kIHRvIHdhaXQg
Zm9yIHRoZSBYU0EgZml4ZXMKZ29pbmcgcHVibGljIG9uIHRoZSAzMXN0LCBidXQgbm90IChtdWNo
KSBsb25nZXIuIFBsZWFzZSBwb2ludCBvdXQKYmFja3BvcnRpbmcgY2FuZGlkYXRlcyB0aGF0IHlv
dSBmaW5kIG1pc3NpbmcgZnJvbSB0aGUgcmVzcGVjdGl2ZQpzdGFibGUgdHJlZXMuIEkgaGF2ZSB0
aHJlZSBvbmVzIHF1ZXVlZCB3aGljaCBoYXZlbid0IHBhc3NlZCB0aGUgcHVzaApnYXRlIHRvIHRo
ZSBtYXN0ZXIgYnJhbmNoIHlldDoKCjkyNTdjMjE4ZTUJeDg2L3Z2bXg6IEZpeCB0aGUgdXNlIG9m
IFJEVFNDUCB3aGVuIGl0IGlzIGludGVyY2VwdGVkIGF0IEwwCjdlZWU5YzE2ZDYJeDg2L3RzYzog
dXBkYXRlIHZjcHUgdGltZSBpbmZvIG9uIGd1ZXN0IFRTQyBhZGp1c3RtZW50cwo5NjMzOTI5ODI0
CXg4NjogZml4IG9mZi1ieS1vbmUgaW4gaXNfeGVuX2ZpeGVkX21mbigpCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
