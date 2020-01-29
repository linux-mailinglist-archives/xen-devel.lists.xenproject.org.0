Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F314CE0E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:13:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpvr-0000Kh-39; Wed, 29 Jan 2020 16:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c1nS=3S=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1iwpvp-0000Ka-C0
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:11:09 +0000
X-Inumbo-ID: f5c70c92-42b1-11ea-8396-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f5c70c92-42b1-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580314268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgU0fNzXnl02Q14znKBtOZl7JL5ujrvp86clC7wMEUA=;
 b=Flp5xwiyofXZhsxwLC7qsMv2Nnb+ygsn8BN5PZi/eIa71XSS02UWUaX07iMYR60VR0yOez
 DiAxZ6Y0OVzvQXul5k+As0Sg5K5ubia1mmlli94IwlkIpSFSlKMwQYzCgKpcqAJFdzG8JB
 1P08k4xaBdM7ivDUNT0UMqGmLl0FOE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-z-K6hrILNJWACylanoqiRA-1; Wed, 29 Jan 2020 11:10:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703F9107ACCD;
 Wed, 29 Jan 2020 16:10:50 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
 [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27B1D60BF3;
 Wed, 29 Jan 2020 16:10:45 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-3-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b7590b41-e7f6-f4df-959c-2ee188db1e66@redhat.com>
Date: Wed, 29 Jan 2020 17:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200129121235.1814563-3-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: z-K6hrILNJWACylanoqiRA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
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
Cc: Bob Feng <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMjkvMjAgMTM6MTIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdlIGFyZSBnb2luZyB0
byB3YW50IHRvIGNoYW5nZSB0aGUgdmFsdWUgb2YgUGNkRlNCQ2xvY2sgYXQgcnVuIHRpbWUgaW4K
PiBPdm1mWGVuLCBzbyBtb3ZlIGl0IHRvIHRoZSBQY2RzRHluYW1pYyBzZWN0aW9uLgo+IAo+IFJl
ZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yNDkwCj4g
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Cj4gLS0tCj4gQ0M6IEJvYiBGZW5nIDxib2IuYy5mZW5nQGludGVsLmNvbT4KPiBDQzogTGltaW5n
IEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Cj4gLS0tCj4gIE1kZVBrZy9NZGVQa2cuZGVjIHwg
OCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9NZGVQa2cvTWRlUGtnLmRlYyBiL01kZVBrZy9NZGVQa2cu
ZGVjCj4gaW5kZXggZDAyMmNjNWUzZWYyLi44ZjVhNDgzNDZlNTAgMTAwNjQ0Cj4gLS0tIGEvTWRl
UGtnL01kZVBrZy5kZWMKPiArKysgYi9NZGVQa2cvTWRlUGtnLmRlYwo+IEBAIC0yMTk0LDEwICsy
MTk0LDYgQEAgW1BjZHNGaXhlZEF0QnVpbGQsUGNkc1BhdGNoYWJsZUluTW9kdWxlXQo+ICAgICMg
QFZhbGlkTGlzdCAgMHg4MDAwMDAwMSB8IDgsIDE2LCAzMgo+ICAgIGdFZmlNZGVQa2dUb2tlblNw
YWNlR3VpZC5QY2RQb3J0ODBEYXRhV2lkdGh8OHxVSU5UOHwweDAwMDAwMDJkCj4gIAo+IC0gICMj
IFRoaXMgdmFsdWUgaXMgdXNlZCB0byBjb25maWd1cmUgWDg2IFByb2Nlc3NvciBGU0IgY2xvY2su
Cj4gLSAgIyBAUHJvbXB0IEZTQiBDbG9jay4KPiAtICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1aWQu
UGNkRlNCQ2xvY2t8MjAwMDAwMDAwfFVJTlQzMnwweDAwMDAwMDBjCj4gLQo+ICAgICMjIFRoZSBt
YXhpbXVtIHByaW50YWJsZSBudW1iZXIgb2YgY2hhcmFjdGVycy4gVWVmTGliIGZ1bmN0aW9uczog
QXNjaWlQcmludCgpLCBBc2NpaUVycm9yUHJpbnQoKSwKPiAgICAjICBQcmludFhZKCksIEFzY2lp
UHJpbnRYWSgpLCBQcmludCgpLCBFcnJvclByaW50KCkgYmFzZSBvbiB0aGlzIFBDRCB2YWx1ZSB0
byBwcmludCBjaGFyYWN0ZXJzLgo+ICAgICMgQFByb21wdCBNYXhpbXVtIFByaW50YWJsZSBOdW1i
ZXIgb2YgQ2hhcmFjdGVycy4KPiBAQCAtMjI5Nyw1ICsyMjkzLDkgQEAgW1BjZHNGaXhlZEF0QnVp
bGQsIFBjZHNQYXRjaGFibGVJbk1vZHVsZSwgUGNkc0R5bmFtaWMsIFBjZHNEeW5hbWljRXhdCj4g
ICAgIyBAUHJvbXB0IEJvb3QgVGltZW91dCAocykKPiAgICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1
aWQuUGNkUGxhdGZvcm1Cb290VGltZU91dHwweGZmZmZ8VUlOVDE2fDB4MDAwMDAwMmMKPiAgCj4g
KyAgIyMgVGhpcyB2YWx1ZSBpcyB1c2VkIHRvIGNvbmZpZ3VyZSBYODYgUHJvY2Vzc29yIEZTQiBj
bG9jay4KPiArICAjIEBQcm9tcHQgRlNCIENsb2NrLgo+ICsgIGdFZmlNZGVQa2dUb2tlblNwYWNl
R3VpZC5QY2RGU0JDbG9ja3wyMDAwMDAwMDB8VUlOVDMyfDB4MDAwMDAwMGMKPiArCj4gIFtVc2Vy
RXh0ZW5zaW9ucy5UaWFub0NvcmUuIkV4dHJhRmlsZXMiXQo+ICAgIE1kZVBrZ0V4dHJhLnVuaQo+
IAoKTG9va3MgZ29vZCB0byBtZToKClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0By
ZWRoYXQuY29tPgoKTWlrZSBvciBMaW1pbmcgd2lsbCBoYXZlIHRvIEFDSy4KClRoYW5rcyEKTGFz
emxvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
