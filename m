Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23DA23E27
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 19:16:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSlqp-0007wg-Cn; Mon, 20 May 2019 17:13:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSlqn-0007wb-Px
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 17:13:25 +0000
X-Inumbo-ID: 9334cb56-7b22-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9334cb56-7b22-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 17:13:24 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: YBX3FnYT6byv+hyapIrfygGeZOwoC1Y/UA5xsMj+mZu5p/fcF1xyJUQNdVOCgtCuAoGE+iOjFc
 nIFg9eFVHAy16ZNW4kOLr1uFugn6GX7RQo1IWzp7/OoxpBI7irpw1cJNFWHL3KGNit4WmvouLH
 Aqls2sLNlqJx9Cd29b6L4fF6vXJ0pjUhqr7PFD83dcNo+AAciFMb8fFps5sPYfrnoCwGGfxsew
 5Zo23E0jmneViTJMYkbh7hP1wjpnwlzDeB2fonNRGhabmuN2lxQl7sFoWKiZufLoBpFgJ9i38Z
 Mh4=
X-SBRS: 2.7
X-MesageID: 677928
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,492,1549947600"; 
   d="scan'208";a="677928"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.57361.772390.248245@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 18:12:49 +0100
To: Alistair Francis <alistair.francis@wdc.com>
In-Reply-To: <20190517223152.29839-1-alistair.francis@wdc.com>
References: <20190517223152.29839-1-alistair.francis@wdc.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 1/2] autotools: Updage config.guess and
 config.sub
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxpc3RhaXIgRnJhbmNpcyB3cml0ZXMgKCJbUEFUQ0ggdjIgMS8yXSBhdXRvdG9vbHM6IFVwZGFn
ZSBjb25maWcuZ3Vlc3MgYW5kIGNvbmZpZy5zdWIiKToKPiBUaGUgYXV0b2NvbmYgbWFudWFsIFsx
XSBzcGVjaWZpZXMgdGhhdCBhcyB3ZSBkZWZpbmUgQUNfQ0FOT05JQ0FMX0hPU1Qgd2UKPiBtdXN0
IHN1cHBseSBjb25maWcuZ3Vlc3MgYW5kIGNvbmZpZy5zdWIuIEluIHdoaWNoIGNhc2UgbGV0J3Mg
dXBkYXRlIHRoZW0KPiBmcm9tIFsyXSBjb21taXQ6IGI5ODQyNGMyNCAiY29uZmlnLmd1ZXNzOiBS
ZW1vdmUgc3BhY2UgYWZ0ZXIgIiNlbmRpZiIsIGFzCj4gR251bGliIGFuZCBzb21lIgo+IAo+IFRo
aXMgYWxsb3dzIHVzIHRvIHN1cHBvcnQgbW9yZSBhY2hpdGVjdHVyZXMgKFJJU0MtVikgYW5kIG90
aGVyIGdlbmVyYWwKPiBpbXByb3ZlbWVudHMuCgpJIGhhdmUgbm90IHZlcmlmaWVkIHRoZSBjb250
ZW50cyBvZiB0aHNpIHBhdGNoIGFnYWluc3QgdGhlIGdudWxpYiBnaXQKcmVwb3NpdG9yeS4gIFRo
YXQgaXMgYSB0aGluZyB0aGF0IHNob3VsZCBiZSBkb25lLiAgQnV0IGl0J3MgcHJvYmFibHkKZWFz
aWVzdCB0byBkbyB0aGF0IGF0IHRoZSB0aW1lIG9mIGNvbW1pdHRpbmcgdGhpcy4KCkFja2VkLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
