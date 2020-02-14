Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B215D7D3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 13:57:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2aUs-0001eb-OI; Fri, 14 Feb 2020 12:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNNH=4C=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2aUr-0001eW-Oe
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 12:55:05 +0000
X-Inumbo-ID: 3869a9f0-4f29-11ea-ba47-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3869a9f0-4f29-11ea-ba47-12813bfff9fa;
 Fri, 14 Feb 2020 12:55:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2aUp-0008N3-30; Fri, 14 Feb 2020 12:55:03 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2aUo-0000VE-Oi; Fri, 14 Feb 2020 12:55:03 +0000
Date: Fri, 14 Feb 2020 12:54:59 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200214125459.meugdhshkdrldrop@debian>
References: <20200214124618.5962-1-wl@xen.org>
 <005c2678-4916-0d0b-1a4f-609d0bdfa80a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <005c2678-4916-0d0b-1a4f-609d0bdfa80a@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH RFC] docs: move xen-command-line.pandoc
 under admin-guide
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMTI6NTA6MzZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNC8wMi8yMDIwIDEyOjQ2LCBXZWkgTGl1IHdyb3RlOgo+ID4gVGhhdCBkaXJl
Y3Rvcnkgd291bGQgYmUgdGhlIGZpcnN0IHBsYWNlIEkgbG9vayBpZiBJIG5lZWQgdG8ga25vdyB4
ZW4KPiA+IGNvbW1hbmQgbGluZSBvcHRpb25zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4gCj4gUGxlYXNlIG5vdCBxdWl0ZSB5ZXQuwqAgVGhpcyBicmVha3Mg
dGhlIChkZWZhY3RvIGNvbW1vbikgVVJMIG9uCj4geGVuYml0cy54ZW4ub3JnL2RvY3MvIGFuZCBJ
J3ZlIGdvdCBhbiBpbi1wcm9ncmVzcyBzZXJpZXMgdG8gY29udmVydCBpdAo+IHRvIFJTVC4KPiAK
PiBBbHNvLCB0aGVyZSBpcyBzb21lIEdQTHYyID0+IENDLUJZIGxpY2Vuc2luZyB0byBmaWd1cmUg
b3V0Lgo+IAo+IExvbmd0ZXJtLCBJIGFic29sdXRlbHkgd2FudCBpdCB0byBsaXZlIHRoZXJlLgoK
SG93IGFib3V0IHdlIHB1dCBhIHN0dWIgZmlsZSB0aGVyZSB0byBwb2ludCB0byB0aGUgcmVhbCBm
aWxlIGZvciBub3c/CgpXZWkuCgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
