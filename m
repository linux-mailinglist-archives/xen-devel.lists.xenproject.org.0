Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9BB3927
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:11:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9osy-0008QL-Nn; Mon, 16 Sep 2019 11:09:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9osy-0008QG-0B
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:09:36 +0000
X-Inumbo-ID: 76cb61d0-d872-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76cb61d0-d872-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 11:09:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ABDB7AE2A;
 Mon, 16 Sep 2019 11:09:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da8a7de2-c5ea-73c6-f2c0-57dbbdf9f50b@suse.com>
Date: Mon, 16 Sep 2019 13:09:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913192759.10795-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 06/10] tools/libxc: Pre-cleanup for
 xc_cpuid_{set, apply_policy}()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtOTMyLDYgKzkz
MiwxMyBAQCBpbnQgeGNfY3B1aWRfc2V0KAo+ICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gICAg
ICAgICAgfQo+ICAKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIE5vdGVzIGZvciBmb2xsb3dp
bmcgdGhpcyBhbGdvcml0aG06Cj4gKyAgICAgICAgICoKPiArICAgICAgICAgKiBXaGlsZSBpdCB3
aWxsIGFjY2VwdCBhbnkgbGVhZiBkYXRhLCBpdCBvbmx5IG1ha2VzIHNlbnNlIHRvIHVzZSBvbgo+
ICsgICAgICAgICAqIGZlYXR1cmUgbGVhdmVzLiAgcmVnc1tdIGluaXRpYWxseSBjb250YWlucyB0
aGUgaG9zdCB2YWx1ZXMuICBUaGlzLAo+ICsgICAgICAgICAqIHdpdGggdGhlIGZhbGwtdGhyb3Vn
aCBjaGFpbiBpcyBob3cgdGhlICdzJyBhbmQgJ2snIG9wdGlvbnMgd29ya3MuCj4gKyAgICAgICAg
ICovCgpOaXQ6IFN0cmF5ICJzIiBhdCB0aGUgdmVyeSBlbmQuIEFuZCBkb2Vzbid0IHRoZXJlIHdh
bnQgdG8gYmUgYSAybmQKY29tbWEgYWZ0ZXIgImNoYWluIiAoSSBhZG1pdCB0aGlzIGlzIHB1cmVs
eSBmcm9tIGEgR2VybWFuIGxhbmd1YWdlCnBlcnNwZWN0aXZlKS4KCkphbiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
