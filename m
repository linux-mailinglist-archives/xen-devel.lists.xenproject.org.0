Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C818F105
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 09:40:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGIbi-0006m8-VY; Mon, 23 Mar 2020 08:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGIbh-0006lv-3I
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 08:38:49 +0000
X-Inumbo-ID: b6e8757e-6ce1-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6e8757e-6ce1-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 08:38:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9EB26AEEA;
 Mon, 23 Mar 2020 08:38:47 +0000 (UTC)
To: Julien Grall <julien.grall.oss@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-5-andrew.cooper3@citrix.com>
 <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcff0161-3e77-c4cd-be58-f522b3269142@suse.com>
Date: Mon, 23 Mar 2020 09:38:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2OX=YKNz8KapaQdSbBRcGw-gS3H=fKXaNgaah0h+r3ZQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Introduce a xmemdup_bytes() helper
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDMuMjAyMCAyMzoxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIEZyaSwgMjAgTWFy
IDIwMjAgYXQgMjE6MjYsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi94bWFsbG9jLmgKPj4gQEAgLTUxLDYgKzUxLDE3IEBACj4+ICAjZGVmaW5lIHht
YWxsb2NfYnl0ZXMoX2J5dGVzKSBfeG1hbGxvYyhfYnl0ZXMsIFNNUF9DQUNIRV9CWVRFUykKPj4g
ICNkZWZpbmUgeHphbGxvY19ieXRlcyhfYnl0ZXMpIF94emFsbG9jKF9ieXRlcywgU01QX0NBQ0hF
X0JZVEVTKQo+Pgo+PiArLyogQWxsb2NhdGUgdW50eXBlZCBzdG9yYWdlIGFuZCBjb3B5aW5nIGFu
IGV4aXN0aW5nIGluc3RhbmNlLiAqLwo+PiArI2RlZmluZSB4bWVtZHVwX2J5dGVzKF9zcmMsIF9u
cikgICAgICAgICAgICAgICAgXAo+PiArICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiArICAgICAgICB1bnNpZ25lZCBsb25nIG5yXyA9IChfbnIpOyAg
ICAgICAgICAgICAgXAo+PiArICAgICAgICB2b2lkICpkc3RfID0geG1hbGxvY19ieXRlcyhucl8p
OyAgICAgICAgXAo+IAo+IFRoZSBucl8gdnMgX25yIGlzIHJlYWxseSBjb25mdXNpbmcgdG8gcmVh
ZC4gQ291bGQgeW91IHJlLWltcGxlbWVudCB0aGUKPiBmdW5jdGlvbiBhcyBhIHN0YXRpYyBpbmxp
bmU/CgpBbmQgZXZlbiBpZiB0aGF0IHdvdWxkbid0IHdvcmsgb3V0IC0gd2hhdCdzIHRoZSBwb2lu
dCBvZiBoYXZpbmcKbWFjcm8gYXJndW1lbnQgbmFtZXMgd2l0aCBsZWFkaW5nIHVuZGVyc2NvcmVz
PyBUaGlzIGlzbid0IGFueQpiZXR0ZXIgc3RhbmRhcmQtd2lzZSAoYWZhaWN0KSB0aGFuIG90aGVy
IHVzZXMgb2YgbGVhZGluZwp1bmRlcnNjb3JlcyBmb3IgaWRlbnRpZmllcnMgd2hpY2ggYXJlbid0
IENVLXNjb3BlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
