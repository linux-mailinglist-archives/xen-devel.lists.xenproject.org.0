Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F21607A6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:16:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOyt-00017k-If; Fri, 05 Jul 2019 14:14:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjOys-00017f-8n
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:14:30 +0000
X-Inumbo-ID: 33907856-9f2f-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33907856-9f2f-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 14:14:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8F1C03092652;
 Fri,  5 Jul 2019 14:14:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5F0718FA8;
 Fri,  5 Jul 2019 14:14:17 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <549bc5d4-e0b6-2b5f-2716-b9481b6fcb34@redhat.com>
Date: Fri, 5 Jul 2019 16:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-7-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 05 Jul 2019 14:14:28 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFkZCBhIG5ldyBlbnRy
eSBwb2ludCBmb3IgWGVuIFBWSCB0aGF0IGVudGVyIGRpcmVjdGx5IGluIDMyYml0cy4KPiAKPiBJ
bmZvcm1hdGlvbiBvbiB0aGUgZXhwZWN0ZWQgc3RhdGUgb2YgdGhlIG1hY2hpbmUgd2hlbiB0aGlz
IGVudHJ5IHBvaW50Cj4gaXMgdXNlZCBjYW4gYmUgZm91bmQgYXQ6Cj4gaHR0cHM6Ly94ZW5iaXRz
LnhlbnByb2plY3Qub3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbAo+IAo+IFJlZjogaHR0
cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0t
Cj4gCj4gTm90ZXM6Cj4gICAgIHYzOgo+ICAgICAtIHJlYmFzZWQsIFNQRFgKPiAgICAgLSByZW1v
dmUgYGNsaScgYXMgdmlhIFBWSCB0aGUgaW50ZXJydXB0cyBhcmUgZ3VhcmFudGVlZCB0byBiZSBv
ZmYKPiAgICAgLSByZXdyaXRlIHNvbWUgY29tbWVudHMKPiAKPiAgLi4uL1hlblJlc2V0VmVjdG9y
L0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbSAgIHwgODEgKysrKysrKysrKysrKysrKysrKwo+ICBP
dm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20gICAgfCA0OSArKysrKysr
KysrKwo+ICBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL1hlblJlc2V0VmVjdG9yLm5hc21iICAgfCAg
MSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IE92bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFp
bi5hc20KCkFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
