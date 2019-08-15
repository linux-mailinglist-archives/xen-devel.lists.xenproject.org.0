Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3738E788
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 10:58:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyBWk-0000t0-Fd; Thu, 15 Aug 2019 08:54:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pfC1=WL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hyBWj-0000sv-QU
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 08:54:33 +0000
X-Inumbo-ID: 4caa0376-bf3a-11e9-8b99-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4caa0376-bf3a-11e9-8b99-12813bfff9fa;
 Thu, 15 Aug 2019 08:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D219308FEC6;
 Thu, 15 Aug 2019 08:54:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-57.ams2.redhat.com
 [10.36.117.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C839A81768;
 Thu, 15 Aug 2019 08:54:30 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190813113119.14804-1-anthony.perard@citrix.com>
 <20190813113119.14804-21-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5650925a-3a21-6dbe-0576-49b21143fb3c@redhat.com>
Date: Thu, 15 Aug 2019 10:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190813113119.14804-21-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 15 Aug 2019 08:54:32 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v5 20/35]
 OvmfPkg/XenPlatformPei: Introduce XenPvhDetected
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTMvMTkgMTM6MzEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFhlblB2aERldGVjdGVk
KCkgY2FuIGJlIHVzZWQgdG8gZmlndXJlIG91dCBpZiBPVk1GIGhhcyBzdGFydGVkIHZpYSB0aGUK
PiBYZW4gUFZIIGVudHJ5IHBvaW50Lgo+IAo+IFJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2Nv
cmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IExhc3psbyBFcnNlayA8
bGVyc2VrQHJlZGhhdC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHY1Ogo+ICAgICAtIGlu
IFhlblB2aERldGVjdGVkLCBjaGVjayBtWGVuSW5mby5IeXBlclBhZ2VzIGluc3RlYWQgb2YgLlZl
cnNpb25NYWpvcgoKUmlnaHQsIGFuZCB0aGF0IHNlZW1zIHRvIGFkZHJlc3MKCmh0dHA6Ly9taWQu
bWFpbC1hcmNoaXZlLmNvbS8yMDE5MDgwODEwNDM1NC53Y2wydmljcG12Ymwzcmx6QEFpci1kZS1S
b2dlcgpodHRwczovL2VkazIuZ3JvdXBzLmlvL2cvZGV2ZWwvbWVzc2FnZS80NTE1OQoKU28gbXkg
QUNLIHN0YW5kcy4KClRoYW5rcwpMYXN6bG8KCj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxh
dGZvcm0uaCB8ICA1ICsrKysrCj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgICAgICB8
IDEzICsrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaCBiL092bWZQ
a2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAo+IGluZGV4IDRhODAwNTdiZGMuLmRiOWE2MjU3
MmYgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gKysr
IGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gQEAgLTk5LDYgKzk5LDExIEBA
IFhlbkh2bWxvYWRlckRldGVjdGVkICgKPiAgICBWT0lECj4gICAgKTsKPiAgCj4gK0JPT0xFQU4K
PiArWGVuUHZoRGV0ZWN0ZWQgKAo+ICsgIFZPSUQKPiArICApOwo+ICsKPiAgVk9JRAo+ICBBbWRT
ZXZJbml0aWFsaXplICgKPiAgICBWT0lECj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXggMjliNDJi
NzQ2Yy4uZjI2ZjBlNTZkZCAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0yMTQsNiArMjE0
LDE5IEBAIFhlbkh2bWxvYWRlckRldGVjdGVkICgKPiAgICByZXR1cm4gKG1YZW5Idm1sb2FkZXJJ
bmZvICE9IE5VTEwpOwo+ICB9Cj4gIAo+ICtCT09MRUFOCj4gK1hlblB2aERldGVjdGVkICgKPiAr
ICBWT0lECj4gKyAgKQo+ICt7Cj4gKyAgLy8KPiArICAvLyBUaGlzIGZ1bmN0aW9uIHNob3VsZCBv
bmx5IGJlIHVzZWQgYWZ0ZXIgWGVuQ29ubmVjdAo+ICsgIC8vCj4gKyAgQVNTRVJUIChtWGVuSW5m
by5IeXBlclBhZ2VzICE9IE5VTEwpOwo+ICsKPiArICByZXR1cm4gbVhlbkh2bWxvYWRlckluZm8g
PT0gTlVMTDsKPiArfQo+ICsKPiAgVk9JRAo+ICBYZW5QdWJsaXNoUmFtUmVnaW9ucyAoCj4gICAg
Vk9JRAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
