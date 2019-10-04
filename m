Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40517CB878
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 12:38:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGKv7-0000W2-Q8; Fri, 04 Oct 2019 10:34:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGKv6-0000Vx-Vw
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 10:34:45 +0000
X-Inumbo-ID: 93cabdde-e692-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93cabdde-e692-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 10:34:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC26FADF1;
 Fri,  4 Oct 2019 10:34:42 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dde9c6fd-8043-cbc5-ab06-d6e238ad0e38@suse.com>
Date: Fri, 4 Oct 2019 12:34:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] efi/boot: fix set_color function
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMjAxOSAxNTo0OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLSAwIGlzIGEgcG9z
c2libGUgYW5kIGFsbG93ZWQgdmFsdWUgZm9yIGEgY29sb3IgbWFzayBhY2Nyb2RpbmcgdG8KPiAg
IFVFRkkgU3BlYyAyLjYgKDExLjkpIGVzcGVjaWFsbHkgZm9yIHJlc2VydmVkIG1hc2sKCkhtbSwg
bG9va2luZyBhdCAyLjggKHdoZXJlIGl0J3Mgc2VjdGlvbiAxMi45LCB3aGljaCBpbiB0dXJuIGlz
IHdoeQpzZWN0aW9uIHRpdGxlcyB3b3VsZCBiZSBtb3JlIGhlbHBmdWwgaW4gc3VjaCByZWZlcmVu
Y2VzKSBJIGNhbid0CnNlZSB0aGUgY2FzZSBiZWluZyBtZW50aW9uZWQgZXhwbGljaXRseS4gSSBj
YW4gYWNjZXB0IHRoYXQKUmVzZXJ2ZWRNYXNrIG1pZ2h0IGJlIHplcm8sIGJ1dCB0aGVuIEknZCBw
cmVmZXIgdG8gaGFuZGxlIHRoYXQKY2FzZSBpbiB0aGUgY2FsbGVyLCByYXRoZXIgdGhhbiBhbGxv
d2luZyB6ZXJvIGFsc28gZm9yIHRoZSB0aHJlZQpjb2xvcnMuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
