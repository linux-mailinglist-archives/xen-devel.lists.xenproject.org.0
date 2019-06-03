Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9040332F2C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:06:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXlfz-0000b3-Gz; Mon, 03 Jun 2019 12:02:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxdA=UC=codethink.co.uk=ben.hutchings@srs-us1.protection.inumbo.net>)
 id 1hXlfy-0000ay-OM
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:02:54 +0000
X-Inumbo-ID: 81fa3338-85f7-11e9-bc9d-efb6bf0fafcf
Received: from imap1.codethink.co.uk (unknown [176.9.8.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81fa3338-85f7-11e9-bc9d-efb6bf0fafcf;
 Mon, 03 Jun 2019 12:02:50 +0000 (UTC)
Received: from [167.98.27.226] (helo=xylophone)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hXlfj-0002pR-CU; Mon, 03 Jun 2019 13:02:39 +0100
Message-ID: <1559563359.24330.8.camel@codethink.co.uk>
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Greg KH <greg@kroah.com>
Date: Mon, 03 Jun 2019 13:02:39 +0100
In-Reply-To: <20190603080036.GF7814@kroah.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
 <20190603080036.GF7814@kroah.com>
Organization: Codethink Ltd.
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
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
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTA2LTAzIGF0IDEwOjAwICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFRo
dSwgTWF5IDMwLCAyMDE5IGF0IDA3OjAyOjM0UE0gLTA3MDAsIEtvbnJhZCBSemVzenV0ZWsgV2ls
ayB3cm90ZToKPiA+IE9uIDUvMzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPiA+
ID4gSSdtIGxvb2tpbmcgYXQgQ1ZFLTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKPiA+ID4g
Cj4gPiA+IGNvbW1pdCA3NjgxZjMxZWM5Y2RhY2FiNGZkMTA1NzBiZTkyNGYyY2VmNjY2OWJhCj4g
PiA+IEF1dGhvcjogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+ID4gPiBEYXRlOsKgwqDCoFdlZCBGZWIgMTMgMTg6MjE6MzEgMjAxOSAtMDUwMAo+ID4gPiAK
PiA+ID4gwqDCoMKgwqDCoHhlbi9wY2liYWNrOiBEb24ndCBkaXNhYmxlIFBDSV9DT01NQU5EIG9u
IFBDSSBkZXZpY2UgcmVzZXQuCj4gPiA+IAo+ID4gPiBJJ20gYXdhcmUgdGhhdCB0aGlzIGNoYW5n
ZSBpcyBpbmNvbXBhdGlibGUgd2l0aCBxZW11IDwgMi41LCBidXQgdGhhdCdzCj4gPiA+IG5vdyBx
dWl0ZSBvbGQuwqDCoERvIHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBhcHBseSB0aGlzIGNo
YW5nZSB0bwo+ID4gPiBzb21lIHN0YWJsZSBicmFuY2hlcz8KPiA+ID4gCj4gPiA+IEJlbi4KPiA+
ID4gCj4gPiAKPiA+IEhleSBCZW4sCj4gPiAKPiA+IDxzaHJ1Z3M+IE15IG9waW5pb24gaXMgdG8g
ZHJvcCBpdCwgYnV0IGlmIEp1ZXJnZW4gdGhpbmtzIGl0IG1ha2VzIHNlbnNlIHRvCj4gPiBiYWNr
cG9ydCBJIGFtIG5vdCBnb2luZyB0byBhcmd1ZS4KPiAKPiBPaywgSSd2ZSBxdWV1ZWQgdGhpcyB1
cCBub3csIHRoYW5rcy4KCkp1ZXJnZW4gc2FpZDoKCj4gSSdtIHdpdGggS29ucmFkIGhlcmUuCgpz
byB1bmxlc3MgSSdtIHZlcnkgY29uZnVzZWQgdGhpcyBzaG91bGQgKm5vdCogYmUgYXBwbGllZCB0
byBzdGFibGUKYnJhbmNoZXMuCgpCZW4uCgotLSAKQmVuIEh1dGNoaW5ncywgU29mdHdhcmUgRGV2
ZWxvcGVyICAgICAgICAgICAgICAgIMKgICAgICAgICBDb2RldGhpbmsgTHRkCmh0dHBzOi8vd3d3
LmNvZGV0aGluay5jby51ay8gICAgICAgICAgICAgICAgIERhbGUgSG91c2UsIDM1IERhbGUgU3Ry
ZWV0CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNYW5jaGVzdGVyLCBNMSAy
SEYsIFVuaXRlZCBLaW5nZG9tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
