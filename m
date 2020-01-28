Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5714B558
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:48:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRCD-0006da-R1; Tue, 28 Jan 2020 13:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwRCC-0006dV-Ei
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:46:24 +0000
X-Inumbo-ID: 92cddc98-41d4-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92cddc98-41d4-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 13:46:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRCA-0000bU-El; Tue, 28 Jan 2020 13:46:22 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwRCA-0002tp-2I; Tue, 28 Jan 2020 13:46:22 +0000
Date: Tue, 28 Jan 2020 13:46:19 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200128134618.dqhluq5od4gapihx@debian>
References: <20200128122823.12920-1-pdurrant@amazon.com>
 <20200128122823.12920-3-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128122823.12920-3-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTI6Mjg6MjNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ICtgYGAKPiArMCAgICAgMSAgICAgMiAgICAgMyAgICAgNCAgICAgNSAgICAgNiAgICAg
NyBvY3RldAo+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSsKPiArfCB0eXBlICAgICAgICAgICAgICAgICAgIHwgcmVjb3JkIHNwZWNpZmljIGRhdGEg
ICB8Cj4gKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAgICAgICAgICAgICAg
fAo+ICsuLi4KPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rCj4gK2BgYAo+ICsKPiArCj4gK3wgRmllbGQgfCBEZXNjcmlwdGlvbiB8Cj4gK3wtLS18
LS0tfAo+ICt8IGB0eXBlYCB8IDB4MDAwMDAwMDA6IGludmFsaWQgfAo+ICt8ICAgICAgICB8IDB4
MDAwMDAwMDE6IG5vZGUgZGF0YSB8Cj4gK3wgICAgICAgIHwgMHgwMDAwMDAwMjogd2F0Y2ggZGF0
YSB8Cj4gK3wgICAgICAgIHwgMHgwMDAwMDAwMyAtIDB4RkZGRkZGRkY6IHJlc2VydmVkIGZvciBm
dXR1cmUgdXNlIHwKPiArCj4gKwo+ICt3aGVyZSBkYXRhIGlzIGFsd2F5cyBpbiB0aGUgZm9ybSBv
ZiBhIE5VTCBzZXBhcmF0ZWQgYW5kIHRlcm1pbmF0ZWQgdHVwbGUKPiArYXMgZm9sbG93cwo+ICsK
CklzIHRoZXJlIGFueSBwYWRkaW5nIHJlcXVpcmVtZW50IGZvciBhIHJlY29yZD8gSSB0YWtlIGl0
IHRoZXJlIGlzbid0PwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
