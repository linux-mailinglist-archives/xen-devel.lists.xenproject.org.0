Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81514104CA6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 08:33:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXguz-0006Vo-Dg; Thu, 21 Nov 2019 07:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pquq=ZN=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iXgux-0006Vj-Of
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 07:30:19 +0000
X-Inumbo-ID: c09ec120-0c30-11ea-9631-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c09ec120-0c30-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 07:30:14 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 87F782000E8;
 Thu, 21 Nov 2019 18:30:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1574321406; bh=W3KtQd7gjd9i7voYh//LGfHKLMJZFDep0GWkMswrvL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=c+/68U4HMJS0ElcpY4eBW/qsKrA3ja7u4Cp6pPU8tEmr/GTGVylvTeyTxwJKmz1nd
 fdwKxdzjbLYI0BqilqzOUcm4vG5hQQgcbMRP6tw8/92UK7AmzVzu7wuTMjBhGLmG/2
 u9fXVsl8OwTHCIFuJ2YG5wzROn5Y0gPoLCZmE4w4=
MIME-Version: 1.0
Date: Thu, 21 Nov 2019 18:30:02 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
In-Reply-To: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
User-Agent: Roundcube Webmail/1.4-rc2
Message-ID: <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMS0yMSAxNzowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBXaGVyZSBkbyB3ZSBz
dGFuZCB3aXRoIFhlbiA0LjEzIHJlZ2FyZGluZyBibG9ja2VycyBhbmQgcmVsYXRlZCBwYXRjaGVz
Pwo+IAo+IDIuIFJ5emVuL1JvbWUgZmFpbHVyZXMgd2l0aCBXaW5kb3dzIGd1ZXN0czoKPiAgICBX
aGF0IGlzIHRoZSBjdXJyZW50bHkgcGxhbm5lZCB3YXkgdG8gYWRkcmVzcyB0aGUgcHJvYmxlbT8g
V2hvIGlzCj4gICAgd29ya2luZyBvbiB0aGF0PwoKQSB3b3JrYXJvdW5kIHdhcyBmb3VuZCBieSBz
cGVjaWZ5aW5nIGNwdWlkIHZhbHVlcyBpbiB0aGUgV2luZG93cyBWTSAKY29uZmlnIGZpbGUuCgpU
aGUgd29ya2Fyb3VuZCBsaW5lIGlzOgpjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4
eHh4eHh4eHgwMTAweHh4eHh4eHh4eHh4IiBdCgpJdCB3YXMgc3VnZ2VzdGVkIHRoYXQgdGhpcyBi
ZSBkb2N1bWVudGVkIC0gYnV0IG5vIGltbWVkaWF0ZSBhY3Rpb24gCnNob3VsZCBiZSB0YWtlbiAt
IHdpdGggYSB2aWV3IHRvIGNvcnJlY3QgdGhpcyBwcm9wZXJseSBpbiA0LjE0LgoKSSdtIG5vdCBz
dXJlIHRoZSBzdGF0dXMgb2YgYW55IHBhdGNoZXMgLyBhZGRpdGlvbnMgdG8gZG9jdW1lbnRhdGlv
biAtIApob3dldmVyIG1heWJlIHRoaXMgaXMgdGhlIHdpa2k/IEknbGwgbGVhdmUgdGhhdCBmb3Ig
c29tZW9uZSBlbHNlIHRvIApjb21tZW50IG9uLgoKLS0gClN0ZXZlbiBIYWlnaAoKPyBuZXR3aXpA
Y3JjLmlkLmF1ICAgICA/IGh0dHA6Ly93d3cuY3JjLmlkLmF1Cj8gKzYxICgzKSA5MDAxIDYwOTAg
ICAgPyAwNDEyIDkzNSA4OTcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
