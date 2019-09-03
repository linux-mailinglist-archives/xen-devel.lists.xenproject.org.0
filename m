Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9DA6597
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:38:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55Di-0005Ya-Gm; Tue, 03 Sep 2019 09:35:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55Dg-0005YV-Jr
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:35:24 +0000
X-Inumbo-ID: 2677afc0-ce2e-11e9-ab8b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2677afc0-ce2e-11e9-ab8b-12813bfff9fa;
 Tue, 03 Sep 2019 09:35:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9006EABED;
 Tue,  3 Sep 2019 09:35:21 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Date: Tue, 3 Sep 2019 11:35:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 0/8] x86emul: further work
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTogeDg2ZW11bDogc3VwcG9ydCBXQk5PSU5WRAoyOiB4ODYvSFZNOiBpZ25vcmUgZ3Vlc3QgSU5W
RCB1c2VzCjM6IHg4NmVtdWw6IGdlbmVyYWxpemUgaW52bHBnKCkgaG9vawo0OiB4ODZlbXVsOiBz
dXBwb3J0IElOVlBDSUQKNTogeDg2ZW11bDogc3VwcG9ydCBNT1ZESVJ7SSw2NEJ9IGluc25zCjY6
IHg4Ni9IVk06IHNjYWxlIE1QRVJGIHZhbHVlcyByZXBvcnRlZCB0byBndWVzdHMgKG9uIEFNRCkK
NzogeDg2ZW11bDogc3VwcG9ydCBSRFBSVQo4OiB4ODYvSFZNOiBkb24ndCBuZWVkbGVzc2x5IGlu
dGVyY2VwdCBBUEVSRi9NUEVSRi9UU0MgTVNSIHJlYWRzCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
