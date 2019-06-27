Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9375817E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:27:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSWh-0001Id-Vr; Thu, 27 Jun 2019 11:25:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgSWf-0001IU-PT
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:25:13 +0000
X-Inumbo-ID: 3a4722f4-98ce-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3a4722f4-98ce-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 11:25:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 05:25:11 -0600
Message-Id: <5D14A792020000780023B84B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 05:25:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <20190627093335.56355-2-roger.pau@citrix.com>
 <37ca0dbd-cf76-3f2e-3c67-a381cb7da07b@citrix.com>
In-Reply-To: <37ca0dbd-cf76-3f2e-3c67-a381cb7da07b@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/3] xen/link: handle .init.rodata.cst*
 sections in the linker script
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA2LjE5IGF0IDEyOjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjcvMDYvMjAxOSAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiAtLS0g
YS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMK
Pj4gQEAgLTE1Niw2ICsxNTYsNyBAQCBTRUNUSU9OUwo+PiAgICAgICAgICooLmluaXQucm9kYXRh
KQo+PiAgICAgICAgICooLmluaXQucm9kYXRhLnJlbCkKPj4gICAgICAgICAqKC5pbml0LnJvZGF0
YS5zdHIqKQo+PiArICAgICAgICooLmluaXQucm9kYXRhLmNzdCopCj4gCj4gLi4uIC5pbml0IGlz
IGp1c3QgYSBncm91cGluZyBwcmVmaXgsIHNvIEknZCByZWNvbW1lbmQgdGhhdCB3ZSB0cmVhdAo+
IC5pbml0LnJvZGF0YSBpbiBleGFjdGx5IHRoZSBzYW1lIHdheSBhcyB3ZSB0cmVhdCAucm9kYXRh
LCBzbyBJJ2Qgc3VnZ2VzdAo+IHR1cm5pbmcgdGhpcyBpbnRvCj4gCj4gKiguaW5pdC5yb2RhdGEp
Cj4gKiguaW5pdC5yb2RhdGEuKikKPiAKPiB0byBtYXRjaCB0aGUgcmVndWxhciAucm9kYXRhLgoK
T3IsIGFzIHN1Z2dlc3RlZCBlbHNld2hlcmUsIG1ha2UgLnJvZGF0YSB1c2UgbGVzcyB3aWRlIG1h
dGNoaW5nLApsaWtlIHdlIGRvIGZvciAuaW5pdC5yb2RhdGEuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
