Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F933A147D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:16:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GU3-0005kI-2d; Thu, 29 Aug 2019 09:12:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3GU1-0005kD-CS
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:12:45 +0000
X-Inumbo-ID: 287ecd5c-ca3d-11e9-ae63-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 287ecd5c-ca3d-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:12:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 983DAB048;
 Thu, 29 Aug 2019 09:12:42 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1567005862-18540-1-git-send-email-igor.druzhinin@citrix.com>
 <20190829080059.s24eyer5hfaqnbfv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71cab791-47c9-1f08-30c1-e03546a1c135@suse.com>
Date: Thu, 29 Aug 2019 11:12:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829080059.s24eyer5hfaqnbfv@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mmcfg: add "force" option for MCFG
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
Cc: sstabellini@kernel.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMDowMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBB
dWcgMjgsIDIwMTkgYXQgMDQ6MjQ6MjJQTSArMDEwMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW1jb25maWctc2hhcmVkLmMKPj4gKysrIGIveGVu
L2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1zaGFyZWQuYwo+PiBAQCAtMjYsMzMgKzI2LDM0IEBA
Cj4+ICAKPj4gICNpbmNsdWRlICJtbWNvbmZpZy5oIgo+PiAgCj4+ICtzdGF0aWMgYm9vbF90IF9f
cmVhZF9tb3N0bHkgZm9yY2VfbW1jZmcgPSB0cnVlOwo+PiAgdW5zaWduZWQgaW50IHBjaV9wcm9i
ZSA9IFBDSV9QUk9CRV9DT05GMSB8IFBDSV9QUk9CRV9NTUNPTkY7Cj4+ICAKPj4gIHN0YXRpYyBp
bnQgX19pbml0IHBhcnNlX21tY2ZnKGNvbnN0IGNoYXIgKnMpCj4+ICB7Cj4+ICAgICAgY29uc3Qg
Y2hhciAqc3M7Cj4+IC0gICAgaW50IHJjID0gMDsKPj4gKyAgICBpbnQgdmFsLCByYyA9IDA7Cj4+
ICAKPj4gICAgICBkbyB7Cj4+ICAgICAgICAgIHNzID0gc3RyY2hyKHMsICcsJyk7Cj4+ICAgICAg
ICAgIGlmICggIXNzICkKPj4gICAgICAgICAgICAgIHNzID0gc3RyY2hyKHMsICdcMCcpOwo+PiAg
Cj4+IC0gICAgICAgIHN3aXRjaCAoIHBhcnNlX2Jvb2wocywgc3MpICkKPj4gLSAgICAgICAgewo+
PiAtICAgICAgICBjYXNlIDA6Cj4+IC0gICAgICAgICAgICBwY2lfcHJvYmUgJj0gflBDSV9QUk9C
RV9NTUNPTkY7Cj4+IC0gICAgICAgICAgICBicmVhazsKPj4gLSAgICAgICAgY2FzZSAxOgo+PiAt
ICAgICAgICAgICAgYnJlYWs7Cj4+IC0gICAgICAgIGRlZmF1bHQ6Cj4+IC0gICAgICAgICAgICBp
ZiAoICFjbWRsaW5lX3N0cmNtcChzLCAiYW1kX2ZhbTEwIikgfHwKPj4gLSAgICAgICAgICAgICAg
ICAgIWNtZGxpbmVfc3RyY21wKHMsICJhbWQtZmFtMTAiKSApCj4+ICsgICAgICAgIGlmICggKHZh
bCA9IHBhcnNlX2Jvb2wocywgc3MpKSA+PSAwICkgewo+PiArICAgICAgICAgICAgaWYgKCB2YWwg
KQo+PiArICAgICAgICAgICAgICAgcGNpX3Byb2JlIHw9IFBDSV9QUk9CRV9NTUNPTkY7Cj4+ICsg
ICAgICAgICAgICBlbHNlCj4+ICsgICAgICAgICAgICAgICBwY2lfcHJvYmUgJj0gflBDSV9QUk9C
RV9NTUNPTkY7Cj4+ICsgICAgICAgIH0gZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJh
bWRfZmFtMTAiLCBzLCBzcykpID49IDAgfHwKPj4gKyAgICAgICAgICAgICAgICAgICAgKHZhbCA9
IHBhcnNlX2Jvb2xlYW4oImFtZC1mYW0xMCIsIHMsIHNzKSkgPj0gMCApIHsKPj4gKyAgICAgICAg
ICAgIGlmICggdmFsICkKPj4gICAgICAgICAgICAgICAgICBwY2lfcHJvYmUgfD0gUENJX0NIRUNL
X0VOQUJMRV9BTURfTU1DT05GOwo+PiAgICAgICAgICAgICAgZWxzZQo+PiAtICAgICAgICAgICAg
ICAgIHJjID0gLUVJTlZBTDsKPj4gLSAgICAgICAgICAgIGJyZWFrOwo+PiAtICAgICAgICB9Cj4+
ICsgICAgICAgICAgICAgICAgcGNpX3Byb2JlICY9IH5QQ0lfQ0hFQ0tfRU5BQkxFX0FNRF9NTUNP
TkY7Cj4+ICsgICAgICAgIH0gZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJmb3JjZSIs
IHMsIHNzKSkgPj0gMCkKPj4gKyAgICAgICAgICAgIGZvcmNlX21tY2ZnID0gdmFsOwo+IAo+IFlv
dSBjb3VsZCBhbHNvIGNvbnNpZGVyIGFkZGluZyBhIG5ldyBmbGFnIHRvIHBjaV9wcm9iZSwgaWU6
Cj4gUENJX1BST0JFX0ZPUkNFX01NQ0ZHLgoKWWVzIHBsZWFzZSwgYWxiZWl0IHRvIGJlIGluIHN5
bmMgd2l0aCB0aGUgb3RoZXIgZmxhZyBwZXJoYXBzCmJldHRlciBQQ0lfUFJPQkVfRk9SQ0VfTU1D
T05GIG9yIFBDSV9QUk9CRV9NTUNPTkZfRk9SQ0UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
