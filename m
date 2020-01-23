Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC20146C64
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:13:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iue7m-0006hE-M1; Thu, 23 Jan 2020 15:10:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iue7l-0006h8-3B
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 15:10:25 +0000
X-Inumbo-ID: 7aaaf0d2-3df2-11ea-be5c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aaaf0d2-3df2-11ea-be5c-12813bfff9fa;
 Thu, 23 Jan 2020 15:10:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C759DACD7;
 Thu, 23 Jan 2020 15:10:22 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
 <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
 <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
 <01b8360a-803b-e409-0ced-9f6cf75ba609@xen.org>
 <4afebff2-2239-44f8-ae82-7264595eda70@citrix.com>
 <33b7d973-d9ee-d13d-c82d-8edf242d03eb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80459e00-ac99-f136-e4a1-250de7a82956@suse.com>
Date: Thu, 23 Jan 2020 16:10:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <33b7d973-d9ee-d13d-c82d-8edf242d03eb@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxNTo1MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZXJlZm9yZSwgdGhl
eSB3aWxsIGhhdmUgdG8gYWNjZXB0IHdoYXRldmVyIHN0cmluZyBpcyByZXBvcnRlZCBieSAKPiBI
Vk1Mb2FkZXIgKG9yIFhlbikuIEFzIHlvdSBhbHJlYWR5IGFsbG93IFhlbiB0byBjb25maWd1cmUg
aXQsIHdoeSB3b3VsZCAKPiB0aGF0IGJlIGEgcHJvYmxlbSB0byBjaGFuZ2UgdGhlIG9uZSBpbiBL
Y29uZmlnPyBXaHkgZG8geW91IG5lZWQgdG8gZml4IAo+IGl0IHVwIGluIGh2bWxvYWRlciBhcyB3
ZWxsPwoKQmVjYXVzZSwgYXMgc3RhdGVkIGJlZm9yZSwgaHZtbG9hZGVyIGlzIGFjdHVhbGx5IHRo
ZSBwcmVzZW50YXRpb24KbGF5ZXIgZnJvbSB0aGUgZ3Vlc3QgZmlybXdhcmUgcG92LiBIZW5jZSB3
aGF0IGlzIHNlbnNpYmx5IGNvbWluZwpiYWNrIGFzICI8ZGVuaWVkPiIgb3IgIjxoaWRkZW4+IiBm
cm9tIHRoZSBoeXBlcmNhbGwgc2hvdWxkIG5vdApwcm9wYWdhdGUgaW50byB0aGUgZmlybXdhcmUg
dGFibGVzIHRoZSBndWVzdCBnZXRzIHRvIHNlZS4gT3RoZXIKdXNlcnMgb2YgdGhlIGh5cGVyY2Fs
bCBtYXkgdmVyeSB3ZWxsIGxlYXZlIHRoZXNlIHN0cmluZ3MKdW5maWx0ZXJlZCwgc3VjaCB0aGF0
IHRvIGNvbnN1bWVycyBpdCdzIGNsZWFyIHdoYXQgaGFzIGhhcHBlbmVkCihhbmQgZnJvbSBvdGhl
ciBjb250ZXh0IGl0IHdvdWxkIHRoZW4gdHlwaWNhbGx5IGFsc28gYmUgY2xlYXIKd2hhdCBleGFj
dCBwaWVjZSBvZiBpbmZvcm1hdGlvbiBpdCBpcyB3aGljaCBoYXMgZ290IGhpZGRlbikuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
