Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FB49C8F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 11:03:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd9xe-0004Mg-0L; Tue, 18 Jun 2019 08:59:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hd9xc-0004MT-Dy
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 08:59:24 +0000
X-Inumbo-ID: 5d447fa2-91a7-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d447fa2-91a7-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 08:59:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 02:59:21 -0600
Message-Id: <5D08A7E70200007800239282@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 02:59:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906171428080.2072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906171428080.2072@sstabellini-ThinkPad-T480s>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDIzOjI4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVGh1LCAyIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDMwLjA0
LjE5IGF0IDIzOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGlj
L2RvbWN0bC5oCj4+ID4gQEAgLTU3MSwxMiArNTcxLDI0IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2Jp
bmRfcHRfaXJxIHsKPj4gPiAgKi8KPj4gPiAgI2RlZmluZSBEUENJX0FERF9NQVBQSU5HICAgICAg
ICAgMQo+PiA+ICAjZGVmaW5lIERQQ0lfUkVNT1ZFX01BUFBJTkcgICAgICAwCj4+ID4gKy8qCj4+
ID4gKyAqIERlZmF1bHQgbWVtb3J5IHBvbGljeS4gQ29ycmVzcG9uZHMgdG86Cj4+ID4gKyAqIEFy
bTogTUVNT1JZX1BPTElDWV9BUk1fREVWX25HUkUKPj4gPiArICogeDg2OiBNRU1PUllfUE9MSUNZ
X1g4Nl9VQwo+PiA+ICsgKi8KPj4gPiArI2RlZmluZSBNRU1PUllfUE9MSUNZX0RFRkFVTFQgICAg
MAo+PiA+ICsvKiB4ODYgb25seS4gTWVtb3J5IHR5cGUgVU5DQUNIQUJMRSAqLwo+PiA+ICsjZGVm
aW5lIE1FTU9SWV9QT0xJQ1lfWDg2X1VDICAgICAwCj4+IAo+PiBJJ20gYWZyYWlkIHRoaXMgbWF5
IGVuZCB1cCBtaXNsZWFkaW5nLCBhcyBvbiBOUFQgYW5kIGluCj4+IHNoYWRvdyBtb2RlIHdlIHVz
ZSBVQy0gaW5zdGVhZCBvZiBVQyBhZmFpY3MuIEFuZHJldywKPj4gZG8geW91IGhhdmUgYW4gb3Bp
bmlvbiBlaXRoZXIgd2F5IHdoYXQgZXhhY3RseSBzaG91bGQKPj4gYmUgc3RhdGVkIGhlcmU/Cj4g
Cj4gUGluZz8KClRvIG1lPyBJJ3ZlIHN0YXRlZCBteSBvcGluaW9uLgoKSmFuCgo+IEkgYW0gaGFw
cHkgdG8gdXNlIGFueSBuYW1pbmcgc2NoZW1lIHlvdSBwcmVmZXIsIHBsZWFzZSBwcm92aWRlIGlu
cHV0LgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
