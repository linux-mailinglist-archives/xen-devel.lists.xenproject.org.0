Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB761B0A0D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:19:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KHs-0000ba-K1; Thu, 12 Sep 2019 08:17:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8KHq-0000bS-N0
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:17:06 +0000
X-Inumbo-ID: b4d9f8c8-d535-11e9-83e4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4d9f8c8-d535-11e9-83e4-12813bfff9fa;
 Thu, 12 Sep 2019 08:17:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 436EFB636;
 Thu, 12 Sep 2019 08:17:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <796c3ac8-689d-3661-15de-df33745c5862@suse.com>
Date: Thu, 12 Sep 2019 10:17:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/8] tools/libxc: Pre-cleanup for
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

T24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtOTM1LDYgKzkz
NSwxMyBAQCBpbnQgeGNfY3B1aWRfc2V0KAo+ICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gICAg
ICAgICAgfQo+ICAKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIE5vdGVzIGZvciBmb2xsb3dp
bmcgdGhpcyBhbGdvcml0aG06Cj4gKyAgICAgICAgICoKPiArICAgICAgICAgKiBXaGlsZSBpdCB3
aWxsIGFjY2VwdCBhbnkgbGVhZiBkYXRhLCBpdCBvbmx5IG1ha2VzIHNlbnNlIHRvIHVzZSBvbgo+
ICsgICAgICAgICAqIGZlYXR1cmUgbGVhdmVzLiAgcmVnc1tdIGluaXRpYWxseSBjb250YWlucyB0
aGUgaG9zdCB2YWx1ZXMuICBUaGlzLAo+ICsgICAgICAgICAqIHdpdGggdGhlIGZhbGwtdGhyb3Vn
aCBjaGFpbiBpcyBob3cgdGhlICdrJyBvcHRpb24gd29ya3MuCj4gKyAgICAgICAgICovCj4gICAg
ICAgICAgZm9yICggaiA9IDA7IGogPCAzMjsgaisrICkKPiAgICAgICAgICB7Cj4gICAgICAgICAg
ICAgIHVuc2lnbmVkIGNoYXIgdmFsID0gISEoKHJlZ3NbaV0gJiAoMVUgPDwgKDMxIC0gaikpKSk7
CgpMb29raW5nIGF0IHRoZSBuZXh0IHBhdGNoIChhbmQgaGVuY2UgbW9yZSBjbG9zZWx5IGF0IHRo
ZSBjb2RlIGJlbG93CmhlcmUpIC0gc2hvdWxkbid0IHRoZSBjb21tZW50IG1lbnRpb24gYm90aCAn
aycgYW5kICdzJz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
