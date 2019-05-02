Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E118811C64
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 17:14:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMDNc-0008Ah-83; Thu, 02 May 2019 15:12:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMDNb-0008Ac-9P
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 15:12:11 +0000
X-Inumbo-ID: a7d2dbc4-6cec-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7d2dbc4-6cec-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 15:12:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 09:12:08 -0600
Message-Id: <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 09:12:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
In-Reply-To: <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDIzOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL2RvbWN0bC5oCj4gQEAgLTU3MSwxMiArNTcxLDI0IEBAIHN0cnVjdCB4ZW5fZG9tY3Rs
X2JpbmRfcHRfaXJxIHsKPiAgKi8KPiAgI2RlZmluZSBEUENJX0FERF9NQVBQSU5HICAgICAgICAg
MQo+ICAjZGVmaW5lIERQQ0lfUkVNT1ZFX01BUFBJTkcgICAgICAwCj4gKy8qCj4gKyAqIERlZmF1
bHQgbWVtb3J5IHBvbGljeS4gQ29ycmVzcG9uZHMgdG86Cj4gKyAqIEFybTogTUVNT1JZX1BPTElD
WV9BUk1fREVWX25HUkUKPiArICogeDg2OiBNRU1PUllfUE9MSUNZX1g4Nl9VQwo+ICsgKi8KPiAr
I2RlZmluZSBNRU1PUllfUE9MSUNZX0RFRkFVTFQgICAgMAo+ICsvKiB4ODYgb25seS4gTWVtb3J5
IHR5cGUgVU5DQUNIQUJMRSAqLwo+ICsjZGVmaW5lIE1FTU9SWV9QT0xJQ1lfWDg2X1VDICAgICAw
CgpJJ20gYWZyYWlkIHRoaXMgbWF5IGVuZCB1cCBtaXNsZWFkaW5nLCBhcyBvbiBOUFQgYW5kIGlu
CnNoYWRvdyBtb2RlIHdlIHVzZSBVQy0gaW5zdGVhZCBvZiBVQyBhZmFpY3MuIEFuZHJldywKZG8g
eW91IGhhdmUgYW4gb3BpbmlvbiBlaXRoZXIgd2F5IHdoYXQgZXhhY3RseSBzaG91bGQKYmUgc3Rh
dGVkIGhlcmU/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
