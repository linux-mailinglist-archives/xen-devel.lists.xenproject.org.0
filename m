Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A61C04CE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:05:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDox8-0003Xu-Ms; Fri, 27 Sep 2019 12:02:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDox7-0003Xm-4I
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:02:25 +0000
X-Inumbo-ID: aa03482e-e11e-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id aa03482e-e11e-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 12:02:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E5A5B158;
 Fri, 27 Sep 2019 12:02:22 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190927114554.11513-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14ed3dcd-3e20-0de0-c875-7a596441ee72@suse.com>
Date: Fri, 27 Sep 2019 14:02:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927114554.11513-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: fix PVH dom0 settings
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxMzo0NSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFBWSCBkb20wIG11c3Qg
b3BlcmF0ZSB3aXRoIHRoZSBpb21tdSBzZXR0aW5ncyBpbiAnc3RyaWN0JyBtb2RlIGkuZS4gb25s
eSB0aGUKPiBkb21haW4ncyBvd24gcGFnZXMgd2lsbCBiZSBtYXBwZWQgaW4gdGhlIElPTU1VLiBU
aGUgY2hlY2tfaHdkb21fcmVxcygpIGlzCj4gc3VwcG9zZWQgdG8gZW5zdXJlIHRoaXMuIFVuZm9y
dHVuYXRlbHkgdGhlIHRlc3QgZm9yIGEgUFZIIGRvbTAgaXMgbWFkZQo+IHVzaW5nIHBhZ2luZ19t
b2RlX3RyYW5zbGF0ZSgpIGFuZCwgd2hlbiBjb21taXQgZjg5ZjU1NTggInJlbW92ZSBsYXRlCj4g
KG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzIiBtb3ZlZCB0aGUg
Y2FsbCBvZgo+IGNoZWNrX2h3ZG9tX3JlcXMoKSBmcm9tIGlvbW11X2h3ZG9tX2luaXQoKSB0byBp
b21tdV9kb21haW5faW5pdCgpLCB0aGF0Cj4gdGVzdCBiZWNhbWUgaW5lZmZlY3RpdmUgKGJlY2F1
c2UgaW9tbXVfZG9tYWluX2luaXQoKSBpcyBjYWxsZWQgYmVmb3JlCj4gcGFnaW5nX2VuYWJsZSgp
KS4KPiAKPiBUaGlzIHBhdGNoIHJlcGxhY2VzIHRoZSB0ZXN0IG9mIHBhZ2luZ19tb2RlX3RyYW5z
bGF0ZSgpIHdpdGggYSB0ZXN0IG9mCj4gaGFwX2VuYWJsZWQoKSwgYW5kIGFsc28gdmVyaWZpZXMg
J3N0cmljdCcgbW9kZSBpcyB0dXJuZWQgb24gaW4KPiBhcmNoX2lvbW11X2NoZWNrX2F1dG90cmFu
c2xhdGVkX2h3ZG9tKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPiBSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KCk9oLCBhbmQgSSBndWVzcyB5b3UndmUgYWxzbyBtZWFudCB0byBDYyBK
w7xyZ2VuIGZvciBhIHJlbGVhc2UgYWNrCihub3cgZG9uZSk/CgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
