Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963E154901
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 17:22:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjsD-0002K8-Vs; Thu, 06 Feb 2020 16:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I8Ts=32=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izjsD-0002K3-AR
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 16:19:25 +0000
X-Inumbo-ID: 709801ec-48fc-11ea-a759-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 709801ec-48fc-11ea-a759-bc764e2007e4;
 Thu, 06 Feb 2020 16:19:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izjsC-0007Tn-2Z; Thu, 06 Feb 2020 16:19:24 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izjsB-0001Os-PH; Thu, 06 Feb 2020 16:19:23 +0000
Date: Thu, 6 Feb 2020 16:19:20 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Message-ID: <20200206161920.o3cvruhpgdk2xmdf@debian>
References: <20200206154118.31451-1-julien@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206154118.31451-1-julien@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/include: public: Document the padding
 in struct xen_hvm_param
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDM6NDE6MThQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlcmUg
aXMgYW4gaW1wbGljaXQgcGFkZGluZyBvZiAyIGJ5dGVzIGluIHN0cnVjdCB4ZW5faHZtX3BhcmFt
IGJldHdlZW4KPiB0aGUgZmllbGQgZG9taWQgYW5kIGluZGV4LiBNYWtlIGl0IGV4cGxpY2l0IGJ5
IGludHJvZHVjZSBhIHBhZGRpbmcKPiBmaWVsZC4gVGhpcyBjYW4gYWxzbyBzZXJ2ZSBhcyBkb2N1
bWVudGF0aW9uLgo+IAo+IE5vdGUgdGhhdCBJIGRvbid0IHRoaW5rIHdlIGNhbiBtYW5kYXRlIGl0
IHRvIGJlIHplcm8gYmVjYXVzZSBhIGd1ZXN0IG1heQo+IG5vdCBoYXZlIGluaXRpYWxpemVkIHRo
ZSBwYWRkaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpv
bi5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
