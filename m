Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B883814DC90
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:11:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixAVg-00072s-Br; Thu, 30 Jan 2020 14:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixAVf-00072m-6I
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:09:31 +0000
X-Inumbo-ID: 2217ffe6-436a-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2217ffe6-436a-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 14:09:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixAVd-00060u-IW; Thu, 30 Jan 2020 14:09:29 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixAVd-0007Nv-6q; Thu, 30 Jan 2020 14:09:29 +0000
Date: Thu, 30 Jan 2020 14:09:26 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200130140926.l2o26jczv64rich2@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-11-liuwe@microsoft.com>
 <20200130122655.GL4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130122655.GL4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 10/12] x86/hyperv: provide percpu
 hypercall input page
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MjY6NTVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAwODoyMDozMlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gSHlwZXItVidzIGlucHV0IC8gb3V0cHV0IGFyZ3VtZW50IG11c3QgYmUg
OCBieXRlcyBhbGlnbmVkIGFuIG5vdCBjcm9zcwo+ID4gcGFnZSBib3VuZGFyeS4gT25lIHdheSB0
byBzYXRpc2Z5IHRob3NlIHJlcXVpcmVtZW50cyBpcyB0byB1c2UgcGVyY3B1Cj4gPiBwYWdlLgo+
ID4gCj4gPiBGb3IgdGhlIGZvcmVzZWVhYmxlIGZ1dHVyZSB3ZSBvbmx5IG5lZWQgdG8gcHJvdmlk
ZSBpbnB1dCBmb3IgVExCCj4gPiBhbmQgQVBJQyBoeXBlcmNhbGxzLCBzbyBza2lwIHNldHRpbmcg
dXAgYW4gb3V0cHV0IHBhZ2UuCj4gPiAKPiA+IFdlIHdpbGwgYWxzbyBuZWVkIHRvIHByb3ZpZGUg
YW4gYXBfc2V0dXAgaG9vayBmb3Igc2Vjb25kYXJ5IGNwdXMgdG8KPiA+IHNldHVwIGl0cyBvd24g
aW5wdXQgcGFnZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gCj4gSnVzdCBzb21lIG5pdHMgYmVsb3cuCj4gCgpBbGwgY29tbWVudHMgYWRk
cmVzc2VkLgoKV2VpLgoKPiAKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
