Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AA5330BC
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 15:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmjs-00008d-Sd; Mon, 03 Jun 2019 13:11:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E8iV=UC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hXmjr-00008X-Kk
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:10:59 +0000
X-Inumbo-ID: 06882e4a-8601-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06882e4a-8601-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 13:10:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7E3AAB91;
 Mon,  3 Jun 2019 13:10:56 +0000 (UTC)
To: Ben Hutchings <ben.hutchings@codethink.co.uk>, Greg KH <greg@kroah.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
 <20190603080036.GF7814@kroah.com> <1559563359.24330.8.camel@codethink.co.uk>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d3358f62-3e53-4468-782c-7b4466d34c0a@suse.com>
Date: Mon, 3 Jun 2019 15:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559563359.24330.8.camel@codethink.co.uk>
Content-Language: de-DE
Subject: Re: [Xen-devel] [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
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
Cc: Prarit Bhargava <prarit@redhat.com>, xen-devel@lists.xenproject.org,
 stable <stable@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDYvMjAxOSAxNDowMiwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPiBPbiBNb24sIDIwMTkt
MDYtMDMgYXQgMTA6MDAgKzAyMDAsIEdyZWcgS0ggd3JvdGU6Cj4+IE9uIFRodSwgTWF5IDMwLCAy
MDE5IGF0IDA3OjAyOjM0UE0gLTA3MDAsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPj4+
IE9uIDUvMzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPj4+PiBJJ20gbG9va2lu
ZyBhdCBDVkUtMjAxNS04NTUzIHdoaWNoIGlzIGZpeGVkIGJ5Ogo+Pj4+Cj4+Pj4gY29tbWl0IDc2
ODFmMzFlYzljZGFjYWI0ZmQxMDU3MGJlOTI0ZjJjZWY2NjY5YmEKPj4+PiBBdXRob3I6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4+PiBEYXRlOsKgwqDC
oFdlZCBGZWIgMTMgMTg6MjE6MzEgMjAxOSAtMDUwMAo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoHhlbi9w
Y2liYWNrOiBEb24ndCBkaXNhYmxlIFBDSV9DT01NQU5EIG9uIFBDSSBkZXZpY2UgcmVzZXQuCj4+
Pj4KPj4+PiBJJ20gYXdhcmUgdGhhdCB0aGlzIGNoYW5nZSBpcyBpbmNvbXBhdGlibGUgd2l0aCBx
ZW11IDwgMi41LCBidXQgdGhhdCdzCj4+Pj4gbm93IHF1aXRlIG9sZC7CoMKgRG8geW91IHRoaW5r
IGl0IG1ha2VzIHNlbnNlIHRvIGFwcGx5IHRoaXMgY2hhbmdlIHRvCj4+Pj4gc29tZSBzdGFibGUg
YnJhbmNoZXM/Cj4+Pj4KPj4+PiBCZW4uCj4+Pj4KPj4+Cj4+PiBIZXkgQmVuLAo+Pj4KPj4+IDxz
aHJ1Z3M+IE15IG9waW5pb24gaXMgdG8gZHJvcCBpdCwgYnV0IGlmIEp1ZXJnZW4gdGhpbmtzIGl0
IG1ha2VzIHNlbnNlIHRvCj4+PiBiYWNrcG9ydCBJIGFtIG5vdCBnb2luZyB0byBhcmd1ZS4KPj4K
Pj4gT2ssIEkndmUgcXVldWVkIHRoaXMgdXAgbm93LCB0aGFua3MuCj4gCj4gSnVlcmdlbiBzYWlk
Ogo+IAo+PiBJJ20gd2l0aCBLb25yYWQgaGVyZS4KPiAKPiBzbyB1bmxlc3MgSSdtIHZlcnkgY29u
ZnVzZWQgdGhpcyBzaG91bGQgKm5vdCogYmUgYXBwbGllZCB0byBzdGFibGUKPiBicmFuY2hlcy4K
CiJzaG91bGQgbm90IiBpcyBhIGxpdHRsZSBiaXQgaGFyZC4gSSBkaWRuJ3Qgb3B0IGZvciBhZGRp
bmcgaXQsIGJ1dCBJCmRvbid0IG9iamVjdCB0byBhZGQgaXQgZWl0aGVyIChsaWtlIEtvbnJhZCA6
LSkgKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
