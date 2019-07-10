Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EB96450D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 12:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl9an-0008NT-HR; Wed, 10 Jul 2019 10:12:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iApL=VH=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hl9al-0008NI-KT
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 10:12:51 +0000
X-Inumbo-ID: 458000b9-a2fb-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 458000b9-a2fb-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 10:12:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 462C6C05B03B;
 Wed, 10 Jul 2019 10:12:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 985A15FCCA;
 Wed, 10 Jul 2019 10:12:47 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-32-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a21b7f96-f542-2381-f8fc-f7c1572cbf7f@redhat.com>
Date: Wed, 10 Jul 2019 12:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-32-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 10 Jul 2019 10:12:49 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 31/35] OvmfPkg/OvmfXen: Introduce
 XenTimerDxe
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ICJQY0F0Q2hpcHNldFBr
Zy84MjU0VGltZXJEeGUiIGlzIHJlcGxhY2VkIHdpdGggYSBYZW4tc3BlY2lmaWMKPiBFRklfVElN
RVJfQVJDSF9QUk9UT0NPTCBpbXBsZW1lbnRhdGlvbi4gQWxzbyByZW1vdmUKPiA4MjU5SW50ZXJy
dXB0Q29udHJvbGxlckR4ZSBhcyBpdCBpcyBub3QgdXNlZCBhbnltb3JlLgo+IAo+IFRoaXMgVGlt
ZXIgdXNlcyB0aGUgbG9jYWwgQVBJQyB0aW1lciBhcyB0aW1lIHNvdXJjZSBhcyBpdCBjYW4gd29y
ayBvbgo+IGJvdGggYSBYZW4gUFZIIGd1ZXN0IGFuZCBhbiBIVk0gb25lLgo+IAo+IEJhc2VkIG9u
IHRoZSAiUGNBdENoaXBzZXRQa2cvODI1NFRpbWVyRHhlIiBpbXBsZW1lbnRhdGlvbi4KPiAKPiBS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQo+
IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2MzoKPiAgICAgLSByZWJhc2VkLCBTUERYLCBjb3B5
cmlnaHQKCigxKSBQbGVhc2UgcmVwbGFjZSBib3RoIG9jY3VycmVuY2VzIG9mICJQY0F0Q2hpcHNl
dFBrZyIgaW4gdGhlIGNvbW1pdAptZXNzYWdlIHdpdGggIk92bWZQa2ciLiAoWW91IHJlYmFzZWQg
dGhlIERTQy9GREYgZmlsZXMgY29ycmVjdGx5LCBidXQKbWlzc2VkIHRoZSBjb21taXQgbWVzc2Fn
ZS4pCgpXaXRoIHRoYXQ6CgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
