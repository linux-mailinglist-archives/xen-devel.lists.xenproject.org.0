Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81E165CDE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:40:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kAB-00080v-2U; Thu, 20 Feb 2020 11:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4kA8-00080q-Sw
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:38:36 +0000
X-Inumbo-ID: 87a22154-53d5-11ea-850a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87a22154-53d5-11ea-850a-12813bfff9fa;
 Thu, 20 Feb 2020 11:38:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kA6-00077r-La; Thu, 20 Feb 2020 11:38:34 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kA6-0007o0-CE; Thu, 20 Feb 2020 11:38:34 +0000
Date: Thu, 20 Feb 2020 11:38:32 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220113832.jvxldbqtvrye26q7@debian>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
 <2124c861-bd26-1ec4-3b38-0cf24ee87c79@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2124c861-bd26-1ec4-3b38-0cf24ee87c79@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/5] libxl/PCI: establish per-device
 reserved memory policy earlier
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDQ6NDY6NDRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmVzZXJ2ZWQgZGV2aWNlIG1lbW9yeSByZWdpb24gcHJvY2Vzc2luZyBhcyB3ZWxsIGFz
IEU4MjAgdGFibGUgY3JlYXRpb24KPiBoYXBwZW4gZWFybGllciB0aGFuIHRoZSBhZGRpbmcgb2Yg
KFBDSSkgZGV2aWNlcywgeWV0IHRoZXkgY29uc3VtZSB0aGUKPiBwb2xpY3kgKGUuZy4gdG8gZGVj
aWRlIHdoZXRoZXIgdG8gYWRkIGVudHJpZXMgdG8gdGhlIEU4MjAgdGFibGUpLiBCdXQgc28KPiBm
YXIgaXQgd2FzIG9ubHkgYXQgdGhlIHN0YWdlIG9mIFBDSSBkZXZpY2UgYWRkaXRpb24gdGhhdCB0
aGUgZmluYWwKPiBwb2xpY3kgd2FzIGVzdGFibGlzaGVkIChpLmUuIGlmIG5vdCBleHBsaWNpdGx5
IHNwZWNpZmllZCBieSB0aGUgZ3Vlc3QKPiBjb25maWcgZmlsZSkuCj4gCj4gTm90ZSB0aGF0IEkg
Y291bGRuJ3QgZmluZCB0aGUgZG9tYWluIElEIHRvIGJlIGF2YWlsYWJsZSBpbgo+IGxpYnhsX19k
b21haW5fZGV2aWNlX2NvbnN0cnVjdF9yZG0oKSwgYnV0IG9ic2VydmluZyB0aGF0Cj4gbGlieGxf
X2RldmljZV9wY2lfc2V0ZGVmYXVsdCgpIGFsc28gZG9lc24ndCB1c2UgaXQsIGZvciB0aGUgdGlt
ZSBiZWluZwo+IERPTUlEX0lOVkFMSUQgZ2V0cyBwYXNzZWQuIEFuIG9idmlvdXMgYWx0ZXJuYXRp
dmUgd291bGQgYmUgdG8gZHJvcCB0aGUKPiB1bnVzZWQgcGFyYW1ldGVyL2FyZ3VtZW50LCB5ZXQg
YXQgdGhhdCB0aW1lIHRoZSBxdWVzdGlvbiB3b3VsZCBiZQo+IHdoZXRoZXIgdG8gYWxzbyBkcm9w
IG90aGVyIHVudXNlZCBvbmVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
