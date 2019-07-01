Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E15BB48
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 14:12:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhv7p-0007hH-QK; Mon, 01 Jul 2019 12:09:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hhv7o-0007h9-7u
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 12:09:36 +0000
X-Inumbo-ID: 16da4462-9bf9-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16da4462-9bf9-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 12:09:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E497AD72
 for <xen-devel@lists.xenproject.org>; Mon,  1 Jul 2019 12:09:34 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190701113534.10553-1-jgross@suse.com>
 <30a2c632-c3be-24e4-94a8-10b83f607197@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7f066115-de79-1d6a-622d-e92d381959fd@suse.com>
Date: Mon, 1 Jul 2019 14:09:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <30a2c632-c3be-24e4-94a8-10b83f607197@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMTkgMTM6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAxLjA3LjIwMTkgMTM6
MzUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ID09PSB4ODYgPT09Cj4+Cj4+ICogIFBWLUlPTU1V
ICh2NykKPj4gICAgIC0gIFBhdWwgRHVycmFudAo+Pgo+PiAqICBIVk0gZ3Vlc3QgQ1BVIHRvcG9s
b2d5IHN1cHBvcnQgKFJGQykKPj4gICAgIC0gIENoYW8gR2FvCj4+Cj4+ICogIEludGVsIFByb2Nl
c3NvciBUcmFjZSB2aXJ0dWFsaXphdGlvbiBlbmFibGluZyAodjEpCj4+ICAgICAtICBMdXdlaSBL
YW5nCj4+Cj4+ICogIExpbnV4IHN0dWIgZG9tYWlucyAoUkZDIHYyKQo+PiAgICAgLSAgTWFyZWsg
TWFyY3p5a293c2tpLUfDs3JlY2tpCj4+Cj4+ICogIEltcHJvdmUgbGF0ZSBtaWNyb2NvZGUgbG9h
ZGluZyAodjcpCj4+ICAgICAtICBDaGFvIEdhbwo+Pgo+PiAqICBGaXhlcyB0byAjREIgaW5qZWN0
aW9uCj4+ICAgICAtICBBbmRyZXcgQ29vcGVyCj4+Cj4+ICogIENQVUlEL01TUiBYZW4vdG9vbHN0
YWNrIGltcHJvdmVtZW50cwo+PiAgICAgLSAgQW5kcmV3IENvb3Blcgo+Pgo+PiAqICBJbXByb3Zl
bWVudHMgdG8gZG9tYWluX2NyYXNoKCkKPj4gICAgIC0gIEFuZHJldyBDb29wZXIKPj4KPj4gKiAg
eDJBUElDIHN1cHBvcnQgZm9yIEFNRCAodjIpCj4+ICAgICAtICBKYW4gQmV1bGljaAo+Pgo+PiAq
ICBFSUJSUwo+PiAgICAgLSAgQW5kcmV3IENvb3Blcgo+IAo+IFdhc24ndCB0aGUgQVZYNTEyIGVt
dWxhdG9yIHdvcmsgKG5vdyBhdCB2OSkgb24gdGhpcyBsaXN0IGVhcmxpZXIgb24/CgpPaCBzb3Jy
eSwgdGhhdCB3YXMgbG9zdCBzb21laG93LgoKTm93IHJlLWFkZGVkLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
