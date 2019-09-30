Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52321C1FC6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtUj-0008B9-Ra; Mon, 30 Sep 2019 11:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtUi-0008Ar-60
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:05:32 +0000
X-Inumbo-ID: 378d216a-e372-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 378d216a-e372-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 11:05:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99FA4AC7B;
 Mon, 30 Sep 2019 11:05:30 +0000 (UTC)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-3-wipawel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96f675c6-a841-be3a-5388-ed13835d996c@suse.com>
Date: Mon, 30 Sep 2019 13:05:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190928151305.127380-3-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 02/12] livepatch: Allow to override
 inter-modules buildid dependency
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, RossLagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDkuMjAxOSAxNzoxMiwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5
c2N0bC5oCj4gQEAgLTM1LDcgKzM1LDcgQEAKPiAgI2luY2x1ZGUgImRvbWN0bC5oIgo+ICAjaW5j
bHVkZSAicGh5c2Rldi5oIgo+ICAKPiAtI2RlZmluZSBYRU5fU1lTQ1RMX0lOVEVSRkFDRV9WRVJT
SU9OIDB4MDAwMDAwMTIKPiArI2RlZmluZSBYRU5fU1lTQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4
MDAwMDAwMTMKCk9oLCBJIHNlZS4KCj4gQEAgLTk1Niw2ICs5NTYsMTUgQEAgc3RydWN0IHhlbl9z
eXNjdGxfbGl2ZXBhdGNoX2FjdGlvbiB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLyogaHlwZXJ2aXNvciBkZWZhdWx0LiAqLwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIE9yIHVwcGVyIGJvdW5kIG9mIHRpbWUg
KG5zKSAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8q
IGZvciBvcGVyYXRpb24gdG8gdGFrZS4gKi8KPiArCj4gKy8qCj4gKyAqIE92ZXJ3cml0ZSBkZWZh
dWx0IGludGVyLW1vZHVsZSBidWlsZGlkIGRlcGVuZGVuY3kgY2hhaW4gZW5mb3JjZW1lbnQuCj4g
KyAqIENoZWNrIG9ubHkgaWYgbW9kdWxlIGlzIGJ1aWx0IGZvciBnaXZlbiBoeXBlcnZpc29yIGJ5
IGNvbXBhcmluZyBidWlsZGlkLgo+ICsgKi8KPiArI2RlZmluZSBMSVZFUEFUQ0hfQUNUSU9OX0FQ
UExZX05PREVQUyAoMSA8PCAwKQo+ICsgICAgdWludDY0X3QgZmxhZ3M7ICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIElOOiBhY3Rpb24gZmxhZ3MuICovCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogUHJvdmlkZSBhZGRpdGlvbmFsIHBhcmFtZXRlcnMg
Ki8KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBmb3Ig
YW4gYWN0aW9uLiAqLwoKNjQgYml0cyBzZWVtcyBxdWl0ZSBhIGxvdCAoYW5kIHVudXN1YWwpIGZv
ciBhIGZsYWdzIGZpZWxkLiBBbHNvLAphcyBhIG5pdCwgZG8geW91IHBlcmhhcHMgbWVhbiAib3Zl
cnJpZGUiIGluc3RlYWQgb2YgIm92ZXJ3cml0ZSIKaW4gdGhlIGNvbW1lbnQ/CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
