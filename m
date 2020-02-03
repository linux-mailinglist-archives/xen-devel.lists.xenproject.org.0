Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A3150899
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:43:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyctL-0005Py-Fd; Mon, 03 Feb 2020 14:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iyctJ-0005Pk-CA
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:39:57 +0000
X-Inumbo-ID: 0c439712-4693-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c439712-4693-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 14:39:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyctI-0003db-6X; Mon, 03 Feb 2020 14:39:56 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iyctH-0002yY-Lm; Mon, 03 Feb 2020 14:39:56 +0000
Date: Mon, 3 Feb 2020 14:39:51 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200203143951.e7bwuti4dowksngr@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-5-liuwe@microsoft.com>
 <20200203143201.GY4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203143201.GY4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 04/11] x86/hypervisor: provide
 hypervisor_fixup_e820
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

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDM6MzI6MDFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKWy4uLl0KPiA+ICAKPiA+ICAjZWxzZQo+ID4gIAo+ID4gQEAgLTQ2LDYgKzUxLDcg
QEAgc3RhdGljIGlubGluZSBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZvaWQpIHsgcmV0
dXJuIE5VTEw7IH0KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lk
KSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9Cj4gPiAgc3RhdGljIGlubGluZSBpbnQgaHlwZXJ2
aXNvcl9hcF9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyByZXR1cm4gMDsgfQo+
ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKSB7IEFTU0VSVF9V
TlJFQUNIQUJMRSgpOyB9Cj4gPiArc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfZTgyMF9m
aXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQo+IAo+
IEFyZSB5b3Ugc3VyZSB0aGUgYXNzZXJ0IGhlcmUgaXMgZmluZT8KPiAKPiBDb25zaWRlciBYZW4g
cnVubmluZyBuZXN0ZWQgb24gYW5vdGhlciBoeXBlcnZpc29yLCBhbmQgYnVpbHQgd2l0aG91dAo+
IENPTkZJR19HVUVTVCBlbmFibGVkLCBJIHRoaW5rIHRoZSBhYm92ZSBhc3NlcnQgd291bGQgdHJp
Z2dlci4KCkhtbS4uLiB5ZXMsIHRoaXMgYXNzZXJ0aW9uIHNob3VsZCBiZSBkcm9wcGVkLiBUaGFu
a3MuCgpXZWkuCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
