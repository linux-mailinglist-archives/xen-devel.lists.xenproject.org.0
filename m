Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FC74EDA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:10:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdSu-0004vM-Ak; Thu, 25 Jul 2019 13:07:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rHZM=VW=savoirfairelinux.com=fredy.pulido@srs-us1.protection.inumbo.net>)
 id 1hqdSt-0004vH-55
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:07:23 +0000
X-Inumbo-ID: 2322a138-aedd-11e9-a30c-3fd8da61339a
Received: from mail.savoirfairelinux.com (unknown [208.88.110.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2322a138-aedd-11e9-a30c-3fd8da61339a;
 Thu, 25 Jul 2019 13:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id DBEC49C01FF;
 Thu, 25 Jul 2019 09:07:20 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hjL0t0Xjefez; Thu, 25 Jul 2019 09:07:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 6B9CF9C0341;
 Thu, 25 Jul 2019 09:07:20 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id s8mOBXB1rxzS; Thu, 25 Jul 2019 09:07:20 -0400 (EDT)
Received: from thinkpad (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 430E19C01FF;
 Thu, 25 Jul 2019 09:07:20 -0400 (EDT)
Message-ID: <9df5e4064d83633e3b9572539de13b99c6ceb17c.camel@savoirfairelinux.com>
From: "Fredy P." <fredy.pulido@savoirfairelinux.com>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 25 Jul 2019 09:07:20 -0400
In-Reply-To: <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
Organization: Savoir-faire Linux
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gSVJDIEFuZHJldyB0b2xkIG1lCgoiSSBjYW4gc2VlIHdoeSB0aGVybWFsIG1vbml0b3Jpbmcg
aXMgdXNlZnVsIGZyb20gZG9tMCwgYW5kIHdlIHNob3VsZCBmaWd1cmUgb3V0IHNvbWUgd2F5IHRv
IGZpeCBpdCwgYnV0IHNpbXBseSB1bmRvaW5nIHRoYXQgY2hhbmdlIGlzbid0IHRoZSByaWdodCB0
aGluZyB0byBkbyIKLS0gCkZyZWR5IFB1bGlkbywKQ29uc3VsdGFudCBlbiBsb2dpY2llbCBsaWJy
ZQpJbmZyYXN0cnVjdHVyZSwgSW5mb251YWdpcXVlIGV0IGFyY2hpdGVjdHVyZSBkZSBzeXN0w6ht
ZXMKU2F2b2lyLWZhaXJlIExpbnV4LCBNb250csOpYWwsIFFjCkJ1cmVhdSA6ICgrIDEpIDUxNCAy
NzYtNTQ2OCBwLjQxMCAKCk9uIFRodSwgMjAxOS0wNy0yNSBhdCAxMjo1NCArMDAwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gSG1tLCBJIHdvdWxkbid0IGNhbGwgdGhpcyBkZXByZWNhdGlvbiwgYnV0
IGEgcmVncmVzc2lvbi4gSSB3b3VsZAo+IHNheSB3ZSB3YW50IHRvIHJlLWV4cG9zZSB0aGlzIGxl
YWYgdG8gRG9tMCwgdGhlIG1vcmUgdGhhdCB0aGUKPiBjb21taXQgYWxzbyBvbmx5IG1lbnRpb25z
IHVucHJpdmlsZWdlZCBkb21haW5zLiBBbmRyZXc/CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
