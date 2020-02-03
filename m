Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192315093B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:10:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydJy-00009e-Fj; Mon, 03 Feb 2020 15:07:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iydJw-00009W-QS
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:07:28 +0000
X-Inumbo-ID: e45faec6-4696-11ea-8e6e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e45faec6-4696-11ea-8e6e-12813bfff9fa;
 Mon, 03 Feb 2020 15:07:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iydJv-0004Df-3x; Mon, 03 Feb 2020 15:07:27 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iydJu-0005bp-QV; Mon, 03 Feb 2020 15:07:27 +0000
Date: Mon, 3 Feb 2020 15:07:24 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200203150724.bdnhkkyrntsdvxpl@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200203150154.GZ4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203150154.GZ4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDQ6MDE6NTRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEphbiAzMSwgMjAyMCBhdCAwNTo0OToyNFBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gSHlwZXItViB1c2VzIGEgdGVjaG5pcXVlIGNhbGxlZCBvdmVybGF5IHBh
Z2UgZm9yIGl0cyBoeXBlcmNhbGwgcGFnZS4gSXQKPiA+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBw
YWdlIHRvIHRoZSBndWVzdCB3aGVuIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb25hbGl0eQo+ID4gaXMg
ZW5hYmxlZC4gVGhhdCBtZWFucyB3ZSBjYW4gdXNlIGEgcGFnZSB0aGF0IGlzIG5vdCBiYWNrZWQg
YnkgcmVhbAo+ID4gbWVtb3J5IGZvciBoeXBlcmNhbGwgcGFnZS4KPiA+IAo+ID4gVXNlIHRoZSB0
b3AtbW9zdCBhZGRyZXNzYWJsZSBwYWdlIGZvciB0aGF0IHB1cnBvc2UuIEFkanVzdCBlODIwIG1h
cAo+ID4gYWNjb3JkaW5nbHkuCj4gCj4gQ2FuIHlvdSBhZGQgdGhpcyBpcyBkb25lIHRvIGF2b2lk
IHBhZ2Ugc2hhdHRlcmluZyBhbmQgdG8gbWFrZSBzdXJlCj4gWGVuIGlzbid0IG92ZXJ3cml0aW5n
IGFueSBNTUlPIGFyZWEgd2hpY2ggbWlnaHQgYmUgcHJlc2VudCBhdCBsb3dlcgo+IGFkZHJlc3Nl
cz8KCk5QLgoKPiAKPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1
Y3QgZTgyMG1hcCAqZTgyMCkKPiA+ICt7Cj4gPiArICAgIHVpbnQ2NF90IHMgPSBIVl9IQ0FMTF9N
Rk4gPDwgUEFHRV9TSElGVDsKPiA+ICsKPiA+ICsgICAgaWYgKCAhZTgyMF9hZGRfcmFuZ2UoZTgy
MCwgcywgcyArIFBBR0VfU0laRSwgRTgyMF9SRVNFUlZFRCkgKQo+IAo+IEkgdGhpbmsgZW5kIHNo
b3VsZCBiZSBzICsgUEFHRV9TSVpFIC0gMSwgb3IgZWxzZSBpdCBleHBhbmRzIGFjcm9zcyB0d28K
PiBwYWdlcz8KCk5vLCBpdCBzaG91bGRuJ3QuCgpFODIwIGVudHJ5IHJlY29yZHMgdGhlIHNpemUg
b2YgdGhlIHJlZ2lvbiwgd2hpY2ggaXMgY2FsY3VsYXRlZCBhcwplbmQtc3RhcnQuIFRoZSBvbmUg
dXNhZ2UgaW4gcHYvc2hpbS5jIGZvbGxvd3MgdGhlIHNhbWUgcGF0dGVybiBoZXJlLgoKV2VpLgoK
PiAKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
