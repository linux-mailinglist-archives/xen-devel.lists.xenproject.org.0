Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2181C7E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:43:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVnf-00039u-6M; Tue, 14 May 2019 11:40:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQVnd-00039h-1l
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:40:49 +0000
X-Inumbo-ID: 1d6c136f-763d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d6c136f-763d-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 11:40:47 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 05:40:46 -0600
Message-Id: <5CDAA93C020000780022E901@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 05:40:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190514111754.56758-1-roger.pau@citrix.com>
In-Reply-To: <20190514111754.56758-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] pvshim: make PV shim build selectable from
 configure
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDEzOjE3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNvIGEgdXNlciBjYW4gZGVjaWRlIHdoZXRoZXIgdG8gY29tcGlsZSBhIFBWIHNoaW0gYXMgcGFy
dCBvZiB0aGUgdG9vbHMKPiBidWlsZC4gTm90ZSB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlz
IHByZXNlcnZlZCwgd2hpY2ggaXMgdG8gYnVpbGQgYQo+IFBWIHNoaW0gd2hlbiB0aGUgdGFyZ2V0
IGFyY2hpdGVjdHVyZSBpcyB4ODYuCgpCdXQgdGhlIG9yaWdpbmFsIGJlaGF2aW9yIHdhcyBzbyBv
bmx5IHdoZW4gYnVpbGRpbmcgeDg2XzY0IC0gc2VlCnRoZSB0aHJlZSBsaW5lcyB5b3UgcmVtb3Zl
IGZyb20gdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUuCgo+IC0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5h
Ywo+ICsrKyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+IEBAIC00OTIsNCArNDkyLDE2IEBAIEFDX0FS
R19FTkFCTEUoWzlwZnNdLAo+ICAKPiAgQUNfU1VCU1QobmluZXBmcykKPiAgCj4gK0FDX0FSR19F
TkFCTEUoW3B2c2hpbV0sCj4gKyAgICBBU19IRUxQX1NUUklORyhbLS1kaXNhYmxlLXB2c2hpbV0s
Cj4gKyAgICAgICAgICAgICAgICAgICBbRGlzYWJsZSBwdnNoaW0gYnVpbGQgKHg4NiBvbmx5LCBl
bmFibGVkIGJ5IGRlZmF1bHQpXSksCj4gKyAgICBbQVNfSUYoW3Rlc3QgIngkZW5hYmxlX3B2c2hp
bSIgPSAieG5vIl0sIFtwdnNoaW09bl0sIFtwdnNoaW09eV0pXSwgWwo+ICsgICAgY2FzZSAiJHRh
cmdldF9jcHUiIGluCj4gKyAgICAgICAgaVtbMzQ1Nl1dODZ8eDg2XzY0KQo+ICsgICAgICAgICAg
IHB2c2hpbT0ieSI7OwoKQXMgc2FpZCBpbiB0aGUgZWFybGllciBkaXNjdXNzaW9uIC0gYXQgbGVh
c3QgZ2NjLWJhc2VkIHRvb2wgY2hhaW5zCmFyZSB1bmxpa2VseSB0byBjb3BlIHdoZW4gb24gaXg4
Ni4gVG9nZXRoZXIgd2l0aCB0aGUgY2hhbmdlZApkZWZhdWx0IGJlaGF2aW9yIEkgZ3Vlc3MgeW91
J3JlIGFjdGl2ZWx5IGJyZWFraW5nIHRoZSAoMzItYml0Cng4NikgYnVpbGQuIEF0IHRoZSB2ZXJ5
IGxlYXN0IHlvdSdkIG5lZWQgdG8gcHJvYmUgZm9yIGEgY2FwYWJsZQooY3Jvc3MpIHRvb2wgY2hh
aW4uIChRdWl0ZSBwb3NzaWJseSBhIDMyLWJpdCBidWlsZCBvbiBhIDY0LWJpdApob3N0IHdvdWxk
IHN0aWxsIHdvcmsgZmluZSwgYnV0IHRoYXQncyBub3QgZW5vdWdoIGltby4pCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
