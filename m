Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8B64633
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 14:33:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlBjf-0001Dc-ET; Wed, 10 Jul 2019 12:30:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kBj=VH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hlBjd-0001DU-Sg
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 12:30:09 +0000
X-Inumbo-ID: 7363bf0d-a30e-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7363bf0d-a30e-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 12:30:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0FD1AEAC;
 Wed, 10 Jul 2019 12:30:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190709152845.18217-1-andrew.cooper3@citrix.com>
 <20190709152845.18217-2-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <716a9340-bafa-1bc6-063a-46071389cdc8@suse.com>
Date: Wed, 10 Jul 2019 14:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709152845.18217-2-andrew.cooper3@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstored: Make gnttab interface
 mandatory
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDcuMTkgMTc6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4geGVuc3RvcmVkIGN1cnJl
bnRseSByZXF1aXJlcyBhbiBsaWJ4YyBhbmQgZXZ0Y2huIGludGVyZmFjZSwgYnV0IGxlYXZlcwo+
IHRoZSBnbnR0YWIgaW50ZXJmYWNlIGFzIG9wdGlvbmFsLgo+IAo+IGdudHRhYiBpcyB1YmlxdWl0
b3VzIHRoZXNlIGRheXMsIGFuZCBpbiBwcmFjdGljZSBtYW5kYXRvcnkgaW4gYWxsIGNhc2VzCj4g
d2hlcmUgeGVuc3RvcmVkIGlzbid0IHJ1bm5pbmcgYXMgcm9vdCBpbiBkb20wIChkdWUgdG8gdGhl
IGluYWJpbGl0eSB0bwo+IGZvcmVpZ24gbWFwIGJ5IE1GTikuCj4gCj4gVGhlIHRvb2xzdGFjayBo
YXMgdW5jb25kaXRpb25hbGx5IHNldCB1cCBncmFudCBkZXRhaWxzIGZvciBtYW55IHllYXJzCj4g
bm93LCBhbmQgbG9uZ3Rlcm0gaXQgd291bGQgYmUgZ29vZCB0byBwaGFzZSBvdXQgdGhlIHVzZSBv
ZiBsaWJ4Yy4gIFRoaXMKPiByZXF1aXJlcyB0aGF0IHhlbnN0b3JlZCBtYXAgdGhlIHN0b3JlIHJp
bmcgYnkgZ3JhbnQgbWFwLCByYXRoZXIgdGhhbgo+IGZvcmVpZ24gbWFwLgo+IAo+IE5vIHByYWN0
aWNhbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
