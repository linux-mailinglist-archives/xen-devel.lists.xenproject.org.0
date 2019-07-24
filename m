Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8072732
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 07:10:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq9UP-0008QE-Rs; Wed, 24 Jul 2019 05:06:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hq9UP-0008Q8-8A
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 05:06:57 +0000
X-Inumbo-ID: d9a3f492-add0-11e9-a19a-cbe195157b3d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9a3f492-add0-11e9-a19a-cbe195157b3d;
 Wed, 24 Jul 2019 05:06:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7CB26ACCA;
 Wed, 24 Jul 2019 05:06:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190723182530.24087-1-jgross@suse.com>
 <20190723182530.24087-3-jgross@suse.com>
 <5217ee9c-33d0-e40e-5b5e-ac5ecd81881d@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9fea0db1-174d-987b-4905-82395e8b112b@suse.com>
Date: Wed, 24 Jul 2019 07:06:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5217ee9c-33d0-e40e-5b5e-ac5ecd81881d@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMjA6NTMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjMvMDcvMjAxOSAx
OToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBpbmRleCAzNDlmOTYyNGY1Li41MDgx
NzZhMTQyIDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gKysrIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCj4+IEBAIC0xMTA2LDQzICsxMTA2LDU5IEBAIHZvaWQgd2F0Y2hk
b2dfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKPj4gICAgICAgICAgIGtpbGxfdGlt
ZXIoJmQtPndhdGNoZG9nX3RpbWVyW2ldKTsKPj4gICB9Cj4+ICAgCj4+IC1pbnQgdmNwdV9waW5f
b3ZlcnJpZGUoc3RydWN0IHZjcHUgKnYsIGludCBjcHUpCj4+ICsvKgo+PiArICogUGluIGEgdmNw
dSB0ZW1wb3JhcmlseSB0byBhIHNwZWNpZmljIENQVSAob3IgcmVzdG9yZSBvbGQgcGlubmluZyBz
dGF0ZSBpZgo+PiArICogY3B1IGlzIE5SX0NQVVMpLgo+PiArICogVGVtcG9yYXJ5IHBpbm5pbmcg
Y2FuIGJlIGRvbmUgZHVlIHRvIHR3byByZWFzb25zLCB3aGljaCBtYXkgYmUgbmVzdGVkOgo+PiAr
ICogLSBWQ1BVX0FGRklOSVRZX09WRVJSSURFIChyZXF1ZXN0ZWQgYnkgZ3Vlc3QpOiBpcyBhbGxv
d2VkIHRvIGZhaWwgaW4gY2FzZQo+PiArICogICBvZiBhIGNvbmZsaWN0IChlLmcuIGluIGNhc2Ug
Y3B1cG9vbCBkb2Vzbid0IGluY2x1ZGUgcmVxdWVzdGVkIENQVSwgb3IKPj4gKyAqICAgYW5vdGhl
ciBjb25mbGljdGluZyB0ZW1wb3JhcnkgcGlubmluZyBpcyBhbHJlYWR5IGluIGVmZmVjdC4KPj4g
KyAqIC0gVkNQVV9BRkZJTklUWV9XQUlUIChjYWxsZWQgYnkgd2FpdF9ldmVudCgpOiBvbmx5IHVz
ZWQgdG8gcGluIHZjcHUgdG8gdGhlCj4gCj4gTmVlZCBhbiBleHRyYSApCgpZZXMuCgo+IAo+IE90
aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gCgpUaGFua3MsCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
