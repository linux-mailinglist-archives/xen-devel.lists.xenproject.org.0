Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7A14E99A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 09:37:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixRll-0003Te-ET; Fri, 31 Jan 2020 08:35:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixRlk-0003TZ-5i
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 08:35:16 +0000
X-Inumbo-ID: 999b3891-4404-11ea-8b9c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 999b3891-4404-11ea-8b9c-12813bfff9fa;
 Fri, 31 Jan 2020 08:35:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F668ACA7;
 Fri, 31 Jan 2020 08:35:13 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-3-anthony.perard@citrix.com>
 <af46bb71-eb4b-d17c-f434-8d076083c12c@suse.com>
 <20200130165444.GP1288@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36d3139d-0619-0c55-369e-0b8da13a604c@suse.com>
Date: Fri, 31 Jan 2020 09:35:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130165444.GP1288@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 02/12] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNzo1NCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MjksIDIwMjAgYXQgMDM6MTk6MDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjAxLjIwMjAgMTE6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gKyMgSGFuZGxlIG9iamVj
dHMgaW4gc3ViZGlycwo+Pj4gKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiArIyBvIGlmIHdlIGVu
Y291bnRlciBmb28vIGluICQob2JqLXkpLCByZXBsYWNlIGl0IGJ5IGZvby9idWlsdF9pbi5vCj4+
PiArIyAgIGFuZCBhZGQgdGhlIGRpcmVjdG9yeSB0byB0aGUgbGlzdCBvZiBkaXJzIHRvIGRlc2Nl
bmQgaW50bzogJChzdWJkaXIteSkKPj4+ICtfX3N1YmRpci15CTo9ICQoZmlsdGVyICUvLCAkKG9i
ai15KSkKPj4+ICtzdWJkaXIteQkrPSAkKF9fc3ViZGlyLXkpCj4+Cj4+IEkgcmVhbGl6ZSBJJ2xs
IGJlIGNhbGxlZCBndWlsdHkgb2YgYmlrZS1zaGVkZGluZyBhZ2FpbiwgYW5kIEkgYWxzbwo+PiBy
ZWFsaXplIHRoaXMgaXMgdGhlIHdheSBMaW51eCBkb2VzIGl0LCBidXQgd2hhdCB1c2UgaXMgdGhl
Cj4+IGludGVybWVkaWF0ZSBfX3N1YmRpci15PyBMaW51eCBoYXMgbm8gMm5kIHVzZSwgYW5kIGhl
bmNlIEkgYWxzbwo+PiBkb24ndCBzZWUgd2h5IHdlIHdvdWxkIGdhaW4gb25lLiBJIGZ1cnRoZXIg
dGhpbmsgYWNjb3JkaW5nIHRvIG91cgo+PiBzdHlsZSB0aGVyZSBzaG91bGQgYmUgbm8gdXNlIG9m
IHRhYnMgaGVyZS4KPiAKPiBJIHRob3VnaCB0aGUgZXh0cmEgX19zdWJkaXIteSB0aGF0IExpbnV4
IGRvZXMgd2FzIHRvIGRvIHRoZSBmaWx0ZXJpbmcgb24KPiBvYmoteSByaWdodCB3YXkgYW5kIG5v
dCBhdCBhIGxhdGVyIHRpbWUgd2hlbiBzdWJkaXIteSBpcyB1c2VkLiBCdXQgaW4KPiBMaW51eCAo
bm93IHRoYXQgSSBsb29rIG1vcmUgY2xvc2VseSBhdCBpdCksIHN1YmRpci15IGlzIGluaXRpYWxp
c2VkIHdpdGgKPiA6PSB0byBoYXZlIHRoZSByaWdodCB0eXBlLCBzbyB0aGUgZXh0cmEgX19zdWJk
aXIteSBkb2Vzbid0IGFwcGVhciB0byBiZQo+IHVzZWZ1bC4gKEFuZCBJIGRpZG4ndCBmaW5kIGFu
eSBzdWJkaXIteT0pCj4gCj4gU28sIEknbGwgYWRkIGEgInN1YmRpci15IDo9IiBzb21ld2hlcmUg
YW5kIHJlbW92ZSB0aGUgbmVlZCBmb3IKPiBfX3N1YmRpci15LiAoQW5kIGhvcGVmdWxseSwgbm8g
b25lIHdpbGwgYWRkIGEgc3ViZGlyLXk9ZGlyIHNvbWV3aGVyZSBhbmQKPiBicmVhayB0aGUgYnVp
bGQuKQoKQWx0ZXJuYXRpdmVseSwgdG8gcmV0YWluIHRoaXMgImxhdGNoaW5nIiBlZmZlY3QsIGhv
dyBhYm91dAoKc3ViZGlyLXkgOj0gJChzdWJkaXIteSkgJChmaWx0ZXIgJS8sICQob2JqLXkpKQoK
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
