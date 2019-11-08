Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CFF40CE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 07:57:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSyAX-0001vG-I5; Fri, 08 Nov 2019 06:54:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MP+o=ZA=suse.de=jgross@srs-us1.protection.inumbo.net>)
 id 1iSyAW-0001vB-3G
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:54:52 +0000
X-Inumbo-ID: a8c95ace-01f4-11ea-a1d0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8c95ace-01f4-11ea-a1d0-12813bfff9fa;
 Fri, 08 Nov 2019 06:54:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F046AAAD0;
 Fri,  8 Nov 2019 06:54:49 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <157305592941.20672.10855835711915878073.stgit@Palanthas>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.de>
Message-ID: <09394f6c-2e5a-6951-6603-fa02cc66eb8d@suse.de>
Date: Fri, 8 Nov 2019 07:54:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157305592941.20672.10855835711915878073.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUGFIX PATCH for-4.13] sched: fix dom0less boot
 with the null scheduler
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
Cc: George.Dunlap@eu.citrix.com, julien.grall@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMTkgMTY6NTgsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IEluIGEgZG9tMGxlc3Mg
Y29uZmlndXJhdGlvbiwgaWYgdGhlIG51bGwgc2NoZWR1bGVyIGlzIHVzZWQsIHRoZSBzeXN0ZW0K
PiBtYXkgZmFpbCB0byBib290LCBiZWNhdXNlIHRoZSBsb29wIGluIG51bGxfdW5pdF93YWtlKCkg
bmV2ZXIgZXhpdHMuCj4gCj4gQmlzZWN0aW9uIHNob3dlZCB0aGF0IHRoaXMgYmVoYXZpb3Igb2Nj
dXJzIHNpbmNlIGNvbW1pdCBkNTQ1ZjFkNiAoInhlbjoKPiBzY2hlZDogZGVhbCB3aXRoIHZDUFVz
IGJlaW5nIG9yIGJlY29taW5nIG9ubGluZSBvciBvZmZsaW5lIikgYnV0IHRoZQo+IHJlYWwgcHJv
YmxlbSBpcyB0aGF0LCBpbiB0aGlzIGNhc2UsIHBpY2tfcmVzKCkgYWx3YXlzIHJldHVybiB0aGUg
c2FtZQo+IENQVS4KPiAKPiBGaXggdGhpcyBieSBvbmx5IGRlYWwgd2l0aCB0aGUgc2ltcGxlIGNh
c2UsIGkuZS4sIHRoZSB2Q1BVIHRoYXQgaXMKPiBjb21pbmcgb25saW5lIGNhbiBiZSBhc3NpZ25l
ZCB0byBhIHNjaGVkLiByZXNvdXJjZSByaWdodCBhd2F5LCBpbgo+IG51bGxfdW5pdF93YWtlKCku
Cj4gCj4gSWYgaXQgY2FuJ3QsIGp1c3QgYWRkIGl0IHRvIHRoZSB3YWl0cXVldWUsIGFuZCB3ZSB3
aWxsIGRlYWwgd2l0aCBpdCBpbgo+IG51bGxfc2NoZWR1bGUoKSwgYmVpbmcgY2FyZWZ1bCBhYm91
dCBub3QgcmFjaW5nIHdpdGggdmNwdV93YWtlKCkuCj4gCj4gUmVwb3J0ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IFRlc3RlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
