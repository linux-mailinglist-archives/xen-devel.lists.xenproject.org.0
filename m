Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6013A72DEF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:43:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFdh-00043n-0M; Wed, 24 Jul 2019 11:40:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqFdf-00043P-3T
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:40:55 +0000
X-Inumbo-ID: e2862bf2-ae07-11e9-b778-bbaa8bd7a0e2
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2862bf2-ae07-11e9-b778-bbaa8bd7a0e2;
 Wed, 24 Jul 2019 11:40:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81B1AB03C;
 Wed, 24 Jul 2019 11:40:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-2-jgross@suse.com>
 <4a5a2830-17da-2b4b-e22d-b29bf72f8b76@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f1e2ca12-3a27-685f-8023-d69ea5a21c8e@suse.com>
Date: Wed, 24 Jul 2019 13:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4a5a2830-17da-2b4b-e22d-b29bf72f8b76@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen/x86: cleanup unused NMI/MCE code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMTkgMTM6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjQvMDcvMjAxOSAx
MjoyNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gcHZfcmFpc2VfaW50ZXJydXB0KCkgaXMgb25s
eSBjYWxsZWQgZm9yIE5NSXMgdGhlc2UgZGF5cywgc28gdGhlIE1DRQo+PiBzcGVjaWZpYyBwYXJ0
IGNhbiBiZSByZW1vdmVkLiBSZW5hbWUgcHZfcmFpc2VfaW50ZXJydXB0KCkgdG8KPj4gcHZfcmFp
c2Vfbm1pKCkgYW5kIE5NSV9NQ0VfU09GVElSUSB0byBOTUlfU09GVElSUS4KPj4KPj4gQWRkaXRp
b25hbGx5IHRoZXJlIGlzIG5vIG5lZWQgdG8gcGluIHRoZSB2Y3B1IHRoZSBOTUkgaXMgZGVsaXZl
cmVkCj4+IHRvLCB0aGF0IGlzIGEgbGVmdG92ZXIgb2YgKGFscmVhZHkgcmVtb3ZlZCkgTUNFIGhh
bmRsaW5nLgo+IAo+IFRoaXMgcGhyYXNpbmcgaXMgcmF0aGVyIGF3a3dhcmQgdG8gcmVhZC4KPiAK
PiBDYW4gSSByZWNvbW1lbmQgInRoZSB2Y3B1IHdoaWNoIHRoZSBOTUkiIGFzIGFuIGFsdGVybmF0
aXZlLCBhbmQgYWxzbwo+IHdpdGggdGhlIGNvbW1hIHR1cm5lZCBpbnRvIGEgc2VtaWNvbG9uLgoK
RmluZSB3aXRoIG1lLgoKPiAKPj4gICBTbyByZW1vdmUKPj4gdGhlIHBpbm5pbmcsIHRvby4gTm90
ZSB0aGF0IHBpbm5pbmcgd2FzIGludHJvZHVjZWQgYnkgY29tbWl0IDM1NWIwNDY5YTgKPj4gYWRk
aW5nIE1DRSBzdXBwb3J0ICh3aXRoIE5NSSBzdXBwb3J0IGV4aXN0aW5nIGFscmVhZHkpLiBNQ0Ug
dXNpbmcKPj4gdGhhdCBwaW5uaW5nIHdhcyByZW1vdmVkIHdpdGggY29tbWl0IDNhOTE3NjlkNmUg
YWdhaW4gd2l0aG91dCBjbGVhbmluZwo+PiB1cCB0aGUgY29kZS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IAo+IFRoZSB3b3JkaW5nIHR3
ZWFrIGNhbiBlYXNpbHkgYmUgbWFkZSBvbiBjb21taXQuCgpUaGFua3MuCgoKSnVlcmdlbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
