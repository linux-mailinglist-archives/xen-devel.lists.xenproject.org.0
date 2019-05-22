Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57BB26446
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 15:04:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTQrl-0006XO-Bk; Wed, 22 May 2019 13:01:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTQrj-0006XF-Pc
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:01:07 +0000
X-Inumbo-ID: a8adefea-7c91-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a8adefea-7c91-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 13:01:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B85F5AF58;
 Wed, 22 May 2019 13:01:04 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: =?UTF-8?B?PDIwMTkwNTIyMDk0NTQ5LjI4Mzk377+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwNTIyMDk0NTQ5LjI4Mzk377+9Mu+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5CE52014020000780023147E=40suse=2ecom=3e_=3cf100e5be-cf19?=
 =?UTF-8?Q?-bf28-c113-b07b4fe99c59=40suse=2ecom=3e_=3c5CE541D602000078002315?=
 =?UTF-8?B?ODdAc3VzZS5jb20+?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c3d83d55-b987-bc9b-5af2-00474f696a02@suse.com>
Date: Wed, 22 May 2019 15:01:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDUvMjAxOSAxNDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTI6MTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyMi8wNS8yMDE5IDEyOjEw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjQ1LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+IEBAIC0zMTg1LDIyICszMTg1LDYgQEAg
c3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KAo+Pj4+ICAKPj4+
PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+Pj4gIAo+Pj4+IC0gICAgLyoKPj4+PiAt
ICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMgd2lsbCBkbyBn
cmFudC10YWJsZSBvcHMKPj4+PiAtICAgICAqIHN1Y2ggYXMgcXVlcnlfc2l6ZS4gR3JhbnQtdGFi
bGUgY29kZSBjdXJyZW50bHkgZG9lcyAKPj4gY29weV90by9mcm9tX2d1ZXN0Cj4+Pj4gLSAgICAg
KiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1kb21haW4gbG9jaywgd2hpY2ggdGhpcyB0ZXN0
IHdvdWxkIAo+PiBkaXNhbGxvdy4KPj4+PiAtICAgICAqIFRoZSB0ZXN0IGlzIG5vdCBuZWVkZWQg
dW50aWwgd2UgaW1wbGVtZW50IHNsZWVwaW5nLW9uLXdhaXRxdWV1ZSB3aGVuCj4+Pj4gLSAgICAg
KiB3ZSBhY2Nlc3MgYSBwYWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBub3cu
Cj4+Pj4gLSAgICAgKi8KPj4+PiAtI2lmIDAKPj4+PiAtICAgIC8qCj4+Pj4gLSAgICAgKiBJZiB0
aGUgcmVxdWlyZWQgZ3Vlc3QgbWVtb3J5IGlzIHBhZ2VkIG91dCwgdGhpcyBmdW5jdGlvbiBtYXkg
c2xlZXAuCj4+Pj4gLSAgICAgKiBIZW5jZSB3ZSBiYWlsIGltbWVkaWF0ZWx5IGlmIGNhbGxlZCBm
cm9tIGF0b21pYyBjb250ZXh0Lgo+Pj4+IC0gICAgICovCj4+Pj4gLSAgICBpZiAoIGluX2F0b21p
YygpICkKPj4+PiAtICAgICAgICByZXR1cm4gSFZNVFJBTlNfdW5oYW5kbGVhYmxlOwo+Pj4+IC0j
ZW5kaWYKPj4+Cj4+PiBEZWFsaW5nIHdpdGggdGhpcyBUT0RPIGl0ZW0gaXMgb2YgY291cnNlIG11
Y2ggYXBwcmVjaWF0ZWQsIGJ1dAo+Pj4gc2hvdWxkIGl0IHJlYWxseSBiZSBkZWxldGVkIGFsdG9n
ZXRoZXI/IFRoZSBiaWctZG9tYWluLWxvY2sgaXNzdWUKPj4+IGlzIGdvbmUgYWZhaXIsIGluIHdo
aWNoIGNhc2UgZHJvcHBpbmcgdGhlICNpZiAwIHdvdWxkIHNlZW0KPj4+IHBvc3NpYmxlIHRvIG1l
LCBldmVuIGlmIGl0J3Mgbm90IHN0cmljdGx5IG5lZWRlZCB3aXRob3V0IHRoZSBzbGVlcC0KPj4+
IG9uLXdhaXRxdWV1ZSBiZWhhdmlvciBtZW50aW9uZWQuCj4+Cj4+IFF1ZXN0aW9uIGlzIHdoZXRo
ZXIgaXQgaXMgd29ydGggdG8ga2VlcCBpdCByZXN1bHRpbmcgaW4gdGhlIG5lZWQgdG8KPj4ga2Vl
cCBwcmVlbXB0X2NvdW50KCkgYXMgd2VsbC4KPiAKPiBXZWxsLCBwZXJzb25hbGx5IEkgdGhpbmsg
a2VlcGluZyBpdCBpcyBhIHNtYWxsIHByaWNlIHRvIHBheS4gQnV0IHNlZWluZwo+IEFuZHJldydz
IFItYiBoZSBjbGVhcmx5IHRoaW5rcyBkaWZmZXJlbnQuIEFuZCBqdXN0IHRvIGJlIGNsZWFyIC0g
SQo+IGRvbid0IHJlYWxseSB3YW50IHRvIHZldG8gdGhpcyBjaGFuZ2UsIGFzIGF0IHRoZSBzYW1l
IHRpbWUgaXQncyBhbHNvCj4gZWFzeSBlbm91Z2ggdG8gcHV0IGJhY2sgaWYgbmVlZCBiZS4gQnV0
IEknZCBsaWtlIHRoaXMgdG8gYmUgZ2l2ZSBhCj4gMm5kIGNvbnNpZGVyYXRpb24gYXQgbGVhc3Qu
CgpDb21wbGV0ZWx5IHVuZGVyc3RhbmRhYmxlLgoKSSBqdXN0IHN0dW1ibGVkIG92ZXIgdGhhdCB3
aGVuIEkgbmVlZGVkIHRvIGludHJvZHVjZSByY3VfcmVhZF9sb2NrKCkKdXNhZ2UgaW4gc29tZSBo
b3QgcGF0aHMgZm9yIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMgYW5kIEkgd2FudGVkIHRvCnVu
ZGVyc3RhbmQgdGhlIHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucyBmb3IgYWRkaW5nIHRob3NlIGNh
bGxzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
