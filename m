Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3B14CE01
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:10:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwptN-0007qm-3q; Wed, 29 Jan 2020 16:08:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c1nS=3S=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1iwptL-0007qc-1d
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:08:35 +0000
X-Inumbo-ID: 9994d774-42b1-11ea-b211-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9994d774-42b1-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580314113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVuvRoAy8xoENx5N43bQmC4vcpEQFqzKqPvcVa0lw74=;
 b=NCu6SN4gDKvRTIJNzA4R/I1Z30ADSc/FJyO/OiHm6CRC172YlgKgpS5TdDMHTO7843YX9t
 dHBaqZyMWeqBTFPYq8s37E1i4VkOfRX/LHz7Y11inUz77mQbm7QGjnr+eqtJWm1TobWziA
 L/2XLSfIIhLndkN0mO7wWgijxQUwTbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-s9lFZGMxPDKD8_Bk0unEHw-1; Wed, 29 Jan 2020 11:08:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3621113EF;
 Wed, 29 Jan 2020 16:08:28 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
 [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1365D9B900;
 Wed, 29 Jan 2020 16:08:24 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-2-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d1f6bfeb-6cf8-649e-baa0-b5e5c27f42e7@redhat.com>
Date: Wed, 29 Jan 2020 17:08:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200129121235.1814563-2-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: s9lFZGMxPDKD8_Bk0unEHw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 1/5] OvmfPkg/XenResetVector: Silent a
 warning from nasm
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMjkvMjAgMTM6MTIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRvIGF2b2lkIG5hc20g
Z2VuZXJhdGluZyBhIHdhcm5pbmcsIHJlcGxhY2UgdGhlIG1hY3JvIGJ5IHRoZSB2YWx1ZQo+IGV4
cGVjdGVkIHRvIGJlIHN0b3JlZCBpbiBlYXguCj4gICBJYTMyL1hlblBWSE1haW4uYXNtOjc2OiB3
YXJuaW5nOiBkd29yZCBkYXRhIGV4Y2VlZHMgYm91bmRzCj4gCj4gUmVwb3J0ZWQtYnk6IExhc3ps
byBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIE92bWZQa2cvWGVuUmVzZXRW
ZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUmVz
ZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbSBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEz
Mi9YZW5QVkhNYWluLmFzbQo+IGluZGV4IDJkZjBmMTJlMThjYi4uYzc2MWU5ZDMwNzI5IDEwMDY0
NAo+IC0tLSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQo+ICsr
KyBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQo+IEBAIC03Myw3
ICs3Myw3IEBAIHhlblBWSE1haW46Cj4gICAgICA7Cj4gICAgICA7IHBhcmFtZXRlciBmb3IgRmxh
dDMyU2VhcmNoRm9yQmZ2QmFzZQo+ICAgICAgOwo+IC0gICAgbW92ICAgICBlYXgsIEFERFJfT0Yo
Zm91ckdpZ2FieXRlcykKPiArICAgIG1vdiAgICAgZWF4LCAwICAgOyBBRERSX09GKGZvdXJHaWdh
Ynl0ZXMpCj4gICAgICBhZGQgICAgIGVheCwgZWR4IDsgYWRkIGRlbHRhCj4gIAo+ICAgICAgOwo+
IAoKUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
