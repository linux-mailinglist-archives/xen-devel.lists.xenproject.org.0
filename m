Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8574ABDF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 22:34:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdKlx-0008RX-Un; Tue, 18 Jun 2019 20:32:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdKlw-0008RS-8M
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 20:32:04 +0000
X-Inumbo-ID: 214426e8-9208-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 214426e8-9208-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 20:32:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DE3A20863;
 Tue, 18 Jun 2019 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560889922;
 bh=xxvRhUKQk4pzrDE74NDsr6pjjdrSK+uugigBYcpKVeI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=z50VpngM6irBRDeuyy3njpccw4w74JT6vEwftMNEHkWLSwYclcKREGYnG8z4b54/s
 KVk7DqBTZ8SZhJd93D+zNC5NPSFQdDURXEs9kkbsm9AuwTUxRKs8M+QMwll2+iggfJ
 ODlucrrE/HLAKX9dlUqTaKKbIxfk3Db1G0MYvHDg=
Date: Tue, 18 Jun 2019 13:32:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5D08A7E70200007800239282@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1906181330330.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906171428080.2072@sstabellini-ThinkPad-T480s>
 <5D08A7E70200007800239282@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBKdW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE3LjA2LjE5
IGF0IDIzOjI4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBUaHUsIDIg
TWF5IDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+PiBPbiAzMC4wNC4xOSBhdCAyMzow
MiwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oCj4gPj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmgKPiA+PiA+IEBAIC01NzEsMTIgKzU3MSwyNCBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9iaW5kX3B0
X2lycSB7Cj4gPj4gPiAgKi8KPiA+PiA+ICAjZGVmaW5lIERQQ0lfQUREX01BUFBJTkcgICAgICAg
ICAxCj4gPj4gPiAgI2RlZmluZSBEUENJX1JFTU9WRV9NQVBQSU5HICAgICAgMAo+ID4+ID4gKy8q
Cj4gPj4gPiArICogRGVmYXVsdCBtZW1vcnkgcG9saWN5LiBDb3JyZXNwb25kcyB0bzoKPiA+PiA+
ICsgKiBBcm06IE1FTU9SWV9QT0xJQ1lfQVJNX0RFVl9uR1JFCj4gPj4gPiArICogeDg2OiBNRU1P
UllfUE9MSUNZX1g4Nl9VQwo+ID4+ID4gKyAqLwo+ID4+ID4gKyNkZWZpbmUgTUVNT1JZX1BPTElD
WV9ERUZBVUxUICAgIDAKPiA+PiA+ICsvKiB4ODYgb25seS4gTWVtb3J5IHR5cGUgVU5DQUNIQUJM
RSAqLwo+ID4+ID4gKyNkZWZpbmUgTUVNT1JZX1BPTElDWV9YODZfVUMgICAgIDAKPiA+PiAKPiA+
PiBJJ20gYWZyYWlkIHRoaXMgbWF5IGVuZCB1cCBtaXNsZWFkaW5nLCBhcyBvbiBOUFQgYW5kIGlu
Cj4gPj4gc2hhZG93IG1vZGUgd2UgdXNlIFVDLSBpbnN0ZWFkIG9mIFVDIGFmYWljcy4gQW5kcmV3
LAo+ID4+IGRvIHlvdSBoYXZlIGFuIG9waW5pb24gZWl0aGVyIHdheSB3aGF0IGV4YWN0bHkgc2hv
dWxkCj4gPj4gYmUgc3RhdGVkIGhlcmU/Cj4gPiAKPiA+IFBpbmc/Cj4gCj4gVG8gbWU/IEkndmUg
c3RhdGVkIG15IG9waW5pb24uCgpJIGNhbm5vdCBuYW1lIHRoZSBtYWNybyAiTUVNT1JZX1BPTElD
WV9YODZfVUMtIiBiZWNhdXNlIGl0IGNhbm5vdCBlbmQKd2l0aCBhICItIi4gSW5zdGVhZCwgSSBj
YW4gbmFtZSBpdCBNRU1PUllfUE9MSUNZX1g4Nl9VQ19NSU5VUyB0aGF0IHNlZW1zCnRvIGJlIHdo
YXQgTGludXggZG9lcy4gSSdsbCByZW5hbWUgdGhlIG9wdGlvbmFsIHhsIHBhcmFtZXRlciB0b28g
ZnJvbQoieDg2X3VjIiB0byAieDg2X3VjX21pbnVzIi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
