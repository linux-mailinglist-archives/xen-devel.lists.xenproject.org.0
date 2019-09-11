Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E1AFE90
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 16:18:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i83PX-0003xE-SH; Wed, 11 Sep 2019 14:15:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i83PW-0003x9-9O
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 14:15:54 +0000
X-Inumbo-ID: a87a7c0c-d49e-11e9-83d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a87a7c0c-d49e-11e9-83d5-12813bfff9fa;
 Wed, 11 Sep 2019 14:15:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52B86B6C3;
 Wed, 11 Sep 2019 14:15:50 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-20-jgross@suse.com>
 <0fea0ecf-5cde-7e5e-4a18-3c86f13d1d8f@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <23291d2d-fbba-074c-d51e-27dd70979143@suse.com>
Date: Wed, 11 Sep 2019 16:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0fea0ecf-5cde-7e5e-4a18-3c86f13d1d8f@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 19/48] xen: add sched_unit_pause_nosync()
 and sched_unit_unpause()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRoZSBjcmVkaXQgc2NoZWR1bGVyIGNhbGxzIHZj
cHVfcGF1c2Vfbm9zeW5jKCkgYW5kIHZjcHVfdW5wYXVzZSgpCj4+IHRvZGF5LiBBZGQgc2NoZWRf
dW5pdF9wYXVzZV9ub3N5bmMoKSBhbmQgc2NoZWRfdW5pdF91bnBhdXNlKCkgdG8KPj4gcGVyZm9y
bSB0aGUgc2FtZSBvcGVyYXRpb25zIG9uIHNjaGVkdWxlciB1bml0cyBpbnN0ZWFkLgo+IAo+IEFu
ZCBieSBwbGFjaW5nIHRoZW0gaW4gc2NoZWQtaWYuaCB5b3UgbWVhbiB0byBpbmRpY2F0ZSB0aGF0
IHRoZXkncmUKPiBub3QgbWVhbnQgdG8gYmUgdXNlZCBieSBvdGhlciB0aGFuIHNjaGVkdWxlciBj
b2RlPyBJIGFzayBiZWNhdXNlCj4gdGhlIHZjcHUgYW5kIGRvbWFpbiBjb3VudGVycGFydHMgYXJl
IHZhbGlkbHkgdXNhYmxlIGVsc2V3aGVyZS4KCkNvcnJlY3QuIEFjdGluZyBvbiBzY2hlZF91bml0
cyBpcyBzdXBwb3NlZCB0byBiZSBkb25lIGluIHNjaGVkdWxpbmcKY29kZSBvbmx5LgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
