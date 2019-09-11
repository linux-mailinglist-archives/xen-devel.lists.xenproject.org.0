Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A6AFB71
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:36:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i80sG-0006kn-4s; Wed, 11 Sep 2019 11:33:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i80sE-0006ki-T3
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:33:22 +0000
X-Inumbo-ID: f53f2752-d487-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f53f2752-d487-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 11:33:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA07828;
 Wed, 11 Sep 2019 04:33:20 -0700 (PDT)
Received: from [10.37.9.92] (unknown [10.37.9.92])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CD343F59C;
 Wed, 11 Sep 2019 04:33:17 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-36-jgross@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6cc5a569-04a2-ab5e-4015-60cedb986b5e@arm.com>
Date: Wed, 11 Sep 2019 12:33:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-36-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 35/48] xen/sched: add fall back to idle
 vcpu when scheduling unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDgvOS8xOSAzOjU4IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IFdo
ZW4gc2NoZWR1bGluZyBhbiB1bml0IHdpdGggbXVsdGlwbGUgdmNwdXMgdGhlcmUgaXMgbm8gZ3Vh
cmFudGVlIGFsbAo+IHZjcHVzIGFyZSBhdmFpbGFibGUgKGUuZy4gYWJvdmUgbWF4dmNwdXMgb3Ig
dmNwdSBvZmZsaW5lKS4gRmFsbCBiYWNrIHRvCj4gaWRsZSB2Y3B1IG9mIHRoZSBjdXJyZW50IGNw
dSBpbiB0aGF0IGNhc2UuIFRoaXMgcmVxdWlyZXMgdG8gc3RvcmUgdGhlCj4gY29ycmVjdCBzY2hl
ZHVsZV91bml0IHBvaW50ZXIgaW4gdGhlIGlkbGUgdmNwdSBhcyBsb25nIGFzIGl0IHVzZWQgYXMK
PiBmYWxsYmFjayB2Y3B1Lgo+IAo+IEluIG9yZGVyIHRvIG1vZGlmeSB0aGUgcnVuc3RhdGVzIG9m
IHRoZSBjb3JyZWN0IHZjcHVzIHdoZW4gc3dpdGNoaW5nCj4gc2NoZWR1bGUgdW5pdHMgbWVyZ2Ug
c2NoZWRfdW5pdF9ydW5zdGF0ZV9jaGFuZ2UoKSBpbnRvCj4gc2NoZWRfc3dpdGNoX3VuaXRzKCkg
YW5kIGxvb3Agb3ZlciB0aGUgYWZmZWN0ZWQgcGh5c2ljYWwgY3B1cyBpbnN0ZWFkCj4gb2YgdGhl
IHVuaXQncyB2Y3B1cy4gVGhpcyBpbiB0dXJuIHJlcXVpcmVzIGFuIGFjY2VzcyBmdW5jdGlvbiB0
byB0aGUKPiBjdXJyZW50IHZhcmlhYmxlIG9mIG90aGVyIGNwdXMuCj4gCj4gVG9kYXkgY29udGV4
dF9zYXZlZCgpIGlzIGNhbGxlZCBpbiBjYXNlIHByZXZpb3VzIGFuZCBuZXh0IHZjcHVzIGRpZmZl
cgo+IHdoZW4gZG9pbmcgYSBjb250ZXh0IHN3aXRjaC4gV2l0aCBhbiBpZGxlIHZjcHUgYmVpbmcg
Y2FwYWJsZSB0byBiZSBhCj4gc3Vic3RpdHV0ZSBmb3IgYW4gb2ZmbGluZSB2Y3B1IHRoaXMgaXMg
cHJvYmxlbWF0aWMgd2hlbiBzd2l0Y2hpbmcgdG8KPiBhbiBpZGxlIHNjaGVkdWxpbmcgdW5pdC4g
QW4gaWRsZSBwcmV2aW91cyB2Y3B1IGxlYXZlcyB1cyBpbiBkb3VidCB3aGljaAo+IHNjaGVkdWxl
IHVuaXQgd2FzIGFjdGl2ZSBwcmV2aW91c2x5LCBzbyBzYXZlIHRoZSBwcmV2aW91cyB1bml0IHBv
aW50ZXIKPiBpbiB0aGUgcGVyLXNjaGVkdWxlIHJlc291cmNlIGFyZWEgYW5kIHVzZSBpdHMgdmFs
dWUgYmVpbmcgbm9uLU5VTEwgYXMKPiBhIGhpbnQgd2hldGhlciBjb250ZXh0X3NhdmVkKCkgc2hv
dWxkIGJlIGNhbGxlZC4KPiAKPiBXaGVuIHJ1bm5pbmcgYW4gaWRsZSB2Y3B1IGluIGEgbm9uLWlk
bGUgc2NoZWR1bGluZyB1bml0IHVzZSBhIHNwZWNpZmljCj4gZ3Vlc3QgaWRsZSBsb29wIG5vdCBw
ZXJmb3JtaW5nIGFueSB0YXNrbGV0cyBhbmQgbGl2ZXBhdGNoaW5nIGluIG9yZGVyCj4gdG8gYXZv
aWQgcG9wdWxhdGluZyB0aGUgY3B1IGNhY2hlcyB3aXRoIG1lbW9yeSB1c2VkIGJ5IG90aGVyIGRv
bWFpbnMKPiAoYXMgZmFyIGFzIHBvc3NpYmxlKS4gU29mdGlycXMgYXJlIGNvbnNpZGVyZWQgdG8g
YmUgc2F2ZS4KPiAKPiBJbiBvcmRlciB0byBhdm9pZCBsaXZlcGF0Y2hpbmcgd2hlbiBnb2luZyB0
byBndWVzdCBpZGxlIGFub3RoZXIKPiB2YXJpYW50IG9mIHJlc2V0X3N0YWNrX2FuZF9qdW1wKCkg
bm90IGNhbGxpbmcgY2hlY2tfZm9yX2xpdmVwYXRjaF93b3JrCj4gaXMgbmVlZGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkkgaGF2ZW4ndCBs
b29rZWQgYXQgdGhlIGZ1bGwgcGF0Y2guIFRoZSBhcm0gY2hhbmdlIGlzIHF1aXRlIG1pbmltYWws
IHNvIApmb3IganVzdCBhcm0tYml0czoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
