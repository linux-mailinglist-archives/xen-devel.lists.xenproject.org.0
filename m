Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BC14BCBE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:23:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSff-0000Bo-VD; Tue, 28 Jan 2020 15:20:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwSfe-0000Bh-HZ
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:20:54 +0000
X-Inumbo-ID: c592ee41-41e1-11ea-8714-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c592ee41-41e1-11ea-8714-12813bfff9fa;
 Tue, 28 Jan 2020 15:20:53 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSfc-0002hk-B5; Tue, 28 Jan 2020 15:20:52 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSfc-0002W9-1J; Tue, 28 Jan 2020 15:20:52 +0000
Date: Tue, 28 Jan 2020 15:20:49 +0000
From: Wei Liu <wl@xen.org>
To: Michael Kelley <mikelley@microsoft.com>
Message-ID: <20200128152049.tyoitqio5xnd4oo6@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
 <DM5PR2101MB1047A55493A6056E084CB3F7D70F0@DM5PR2101MB1047.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM5PR2101MB1047A55493A6056E084CB3F7D70F0@DM5PR2101MB1047.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDE6MzU6MjJBTSArMDAwMCwgTWljaGFlbCBLZWxsZXkg
d3JvdGU6ClsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnYtdGxmcy5oIGIveGVuL2luY2x1ZGUvYXNtLQo+ID4geDg2L2d1ZXN0L2h5cGVydi10bGZz
LmgKPiA+IGluZGV4IDA1YzQwNDQ5NzYuLjVkMzdlZmQyZDIgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+ID4gQEAgLTMxOCwxNSArMzE4LDE2IEBAIHN0
cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2Ugewo+ID4gICAqCj4gPiAgICogQml0KHMpCj4gPiAgICog
NjMgLSBJbmRpY2F0ZXMgaWYgdGhlIE9TIGlzIE9wZW4gU291cmNlIG9yIG5vdDsgMSBpcyBPcGVu
IFNvdXJjZQo+ID4gLSAqIDYyOjU2IC0gT3MgVHlwZTsgTGludXggaXMgMHgxMDAKPiA+ICsgKiA2
Mjo1NiAtIE9zIFR5cGU7IExpbnV4IDB4MTAwLCBGcmVlQlNEIDB4MjAwLCBYZW4gMHgzMDAKPiAK
PiBUaGlzIGNvbW1lbnQgaXNuJ3QgcXVpdGUgcmlnaHQgLS0gaXQgcmVmbGVjdHMgdGhlIG1pc3Rh
a2UgaW4gdGhlCj4gVExGUyB0aGF0IGlzIGJlaW5nIGNvcnJlY3RlZC4gIFRoZSBmaWVsZCA2Mjo1
NiBpcyBvbmx5IDcgYml0cyB3aWRlLAo+IHNvIDB4MTAwLCAweDIwMCwgZXRjLiB3b24ndCBmaXQu
ICBUaGUgYWN0dWFsIHZhbHVlcyBhcmU6IExpbnV4IDB4MSwKPiBGcmVlQlNEIDB4MiwgYW5kIFhl
biAweDMuICBUaGVuIGJpdHMgNTU6NDggYXJlIDB4MDAuCgpUaGFua3MgTWljaGFlbC4KCkkgd2ls
bCBmaXggdGhpcyBzZWN0aW9uIChhbmQgcGVyaGFwcyBzdWJtaXQgYSBwYXRjaCBmb3IgTGludXgg
YXMgd2VsbCkuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
