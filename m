Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF35C20B3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 14:40:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEuwK-0000Mc-AA; Mon, 30 Sep 2019 12:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEuwI-0000MU-Gs
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 12:38:06 +0000
X-Inumbo-ID: 263d29de-e37f-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 263d29de-e37f-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 12:38:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC1DFAD4F;
 Mon, 30 Sep 2019 12:38:04 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190930100900.660-1-jgross@suse.com>
 <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
 <0365be90-5f43-53cd-5e90-3ae0397a21a1@suse.com>
 <fc49b59e-bbbb-7c64-3b31-2244c76ee2ae@suse.com>
 <800eb65a-a26f-289b-86b3-bace17ce5083@suse.com>
 <b74d4b2e-3851-bdce-affa-9b438302fb29@suse.com>
 <f6ff9de4-9572-08cb-c1c5-24e9903f110e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d770a09-1a1f-d7be-047f-c471abae2bbc@suse.com>
Date: Mon, 30 Sep 2019 14:38:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6ff9de4-9572-08cb-c1c5-24e9903f110e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 20/19] docs: add "sched-gran" boot
 parameter documentation
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMzoyNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBBbmQgaXQgd2lsbCBi
ZSBmYXRhbCBmb3IgbGFyZ2Ugc2NhbGUgaW5zdGFsbGF0aW9ucyB3aXRoIEFNRC0gYW5kIElOVEVM
LQo+IHNlcnZlcnMuIEJvb3QtcGFyYW1ldGVycyBoYXZpbmcgdGhlIHNhbWUgc2VtYW50aWNzIHNo
b3VsZCBiZSBuYW1lZCB0aGUKPiBzYW1lIChyZWdhcmRsZXNzIG9mIHRoZSBuYW1lIG9yIHZhbHVl
IHBhcnQpIGluIG9yZGVyIHRvIGVuYWJsZSBzdWNoCj4gY3VzdG9tZXJzIHRvIHVzZSB0aGUgc2Ft
ZSBzZXR0aW5nIG9uIGVhY2ggc2VydmVyLgoKQnV0IHN1Y2ggYSBsYXJnZSBzY2FsZSB1c2VyIHdv
dWxkIHF1aXRlIGxpa2VseSB3YW50IHRoZSBtZWFuaW5nIG9mCiJjb3JlIiBpbiB0aGUgcmVzcGVj
dGl2ZSB2ZW5kb3IncyBzZW5zZSwgaS5lLiBDUFUgc2NoZWR1bGluZyBvbiBBTUQKKGFzIG5vdCBi
ZWluZyBhZmZlY3RlZCBieSB0aGUgdmFyaW91cyBIVCBsZWFrcyksIGFuZCBjb3JlIHNjaGVkdWxp
bmcKb24gSW50ZWwuIER1ZSB0byBBTUQgRmFtMTcgbm93IGFjdHVhbGx5IGNhbGxpbmcgdGhlIHRo
aW5nIEhUIHRvbywgaW4KZmFjdCBzdWNoIGluc3RhbGxhdGlvbnMgd291bGQgbGlrZWx5IHdhbnQg
X2RpZmZlcmVudF8gb3B0aW9ucyB3aGVuCnRoZSBwcmltYXJ5IGdvYWwgaXMgc2VjdXJpdHksIGFu
ZCBhIHNlY29uZGFyeSBvbmUgaXMgcGVyZm9ybWFuY2UgLwp0aHJvdWdocHV0LiBPdG9oIEkgZ3Vl
c3MgdGhpcyBpcyBnb2luZyB0byBiZSBvdXIgZGVmYXVsdCBldmVudHVhbGx5LAppLmUuIG5vIGNv
bW1hbmQgbGluZSBvcHRpb24gb3VnaHQgdG8gYmUgbmVlZGVkIHRvIGFjaGlldmUgdGhpcy4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
