Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D304D12771C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 09:27:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiDbD-0004Vv-26; Fri, 20 Dec 2019 08:25:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiDbC-0004Vq-19
 for xen-devel@lists.xen.org; Fri, 20 Dec 2019 08:25:26 +0000
X-Inumbo-ID: 4552cc26-2302-11ea-9310-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4552cc26-2302-11ea-9310-12813bfff9fa;
 Fri, 20 Dec 2019 08:25:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B2EEABD0;
 Fri, 20 Dec 2019 08:25:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
 <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54c7a3a1-dcd3-d962-2a79-86edb261ba95@suse.com>
Date: Fri, 20 Dec 2019 09:25:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAwMDoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8xMi8yMDE5
IDExOjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gICAgIFhFTlZFUl9jaGFuZ2VzZXQKPj4+
Pj4gICAgIFhFTlZFUl9jb21tYW5kbGluZQo+Pj4+PiAgICAgWEVOVkVSX2J1aWxkX2lkCj4+Pj4+
Cj4+Pj4+IFJldHVybiBhIG1vcmUgY3VzdG9tZXIgZnJpZW5kbHkgZW1wdHkgc3RyaW5nIGluc3Rl
YWQgb2YgIjxkZW5pZWQ+Igo+Pj4+PiB3aGljaCB3b3VsZCBiZSBzaG93biBpbiB0b29scyBsaWtl
IGRtaWRlY29kZS4+Cj4+Pj4gSSB0aGluayAiPGRlbmllZD4iIGlzIHF1aXRlIGZpbmUgZm9yIG1h
bnkgb2YgdGhlIG9yaWdpbmFsIHB1cnBvc2VzLgo+Pj4+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBmaWx0ZXIgZm9yIHRoaXMgd2hlbiBwb3B1bGF0aW5nIGd1ZXN0Cj4+Pj4gRE1JIHRhYmxl
cz8KPj4+IEkgZG9uJ3Qga25vdyBob3cgRE1JIHRhYmxlcyBhcmUgcG9wdWxhdGVkLCBidXQgbm90
aGluZyBzdG9wcyBhIGd1ZXN0Cj4+PiBmcm9tIHVzaW5nIHRoZXNlIGh5cGVyY2FsbHMgZGlyZWN0
bHkuCj4+IEFuZCB0aGlzIGlzIHByZWNpc2VseSB0aGUgY2FzZSB3aGVyZSBJIHRoaW5rICI8ZGVu
aWVkPiIgaXMgYmV0dGVyCj4+IHRoYW4gYW4gZW1wdHkgc3RyaW5nLgo+IAo+ICI8ZGVuaWVkPiIg
d2FzIGEgdGVycmlibGUgY2hvaWNlIGJhY2sgd2hlbiBpdCB3YXMgaW50cm9kdWNlZCwgYW5kIGl0
cwo+IHN0aWxsIGEgdGVycmlibGUgY2hvaWNlIHRvZGF5LgoKVGhhdCdzIGEgbWF0dGVyIG9mIHRh
c3RlIC0gaXQncyBub3QgdGVycmlibGUgYXQgYWxsIHRvIG1lLgoKPiBUaGVzZSBhcmUgQVNDSUkg
c3RyaW5nIGZpZWxkcywgYW5kIHRoZSBlbXB0eSBzdHJpbmcgaXMgYSBwZXJmZWN0bHkgZ29vZAo+
IHN0cmluZy7CoCBOb3RoaW5nIGlzIGdvaW5nIHRvIGJyZWFrLCBiZWNhdXNlIGl0IHdvdWxkIGhh
dmUgYnJva2VuIHRoZQo+IGZpcnN0IHRpbWUgYXJvdW5kLgoKSW4gc29tZSBjYXNlcyBhbiBlbXB0
eSBzdHJpbmcgbWF5IGhhdmUgYSBtZWFuaW5nIG9mICJub25lIiBvcgoibm90aGluZyIsIHdoaWNo
IGlzIG5vdCB0aGUgc2FtZSBhcyAiSSB3b24ndCB0ZWxsIHlvdSIuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
