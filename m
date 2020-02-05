Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408615304D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 13:03:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izJMc-00079p-Ns; Wed, 05 Feb 2020 12:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izJMb-00079k-AT
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 12:01:01 +0000
X-Inumbo-ID: 2d36842a-480f-11ea-a933-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d36842a-480f-11ea-a933-bc764e2007e4;
 Wed, 05 Feb 2020 12:01:01 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJMa-0004Dn-JN; Wed, 05 Feb 2020 12:01:00 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJMa-0005z1-9p; Wed, 05 Feb 2020 12:01:00 +0000
Date: Wed, 5 Feb 2020 12:00:57 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200205120057.hyavdx5gqhdnmtuy@debian>
References: <20200204202938.9605-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204202938.9605-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxc/restore: Fix
 REC_TYPE_X86_PV_VCPU_XSAVE data auditing (take 2)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDg6Mjk6MzhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJdCB0dXJucyBvdXQgdGhhdCBhIGJ1ZyAoc2luY2UgZm9yZXZlcikgaW4gWGVuIGNh
dXNlcyBYU0FWRSByZWNvcmRzIHRvIGhhdmUKPiBub24tYXJjaGl0ZWN0dXJhbCBiZWhhdmlvdXIg
b24geHNhdmUtY2FwYWJsZSBoYXJkd2FyZSwgd2hlbiBhIFBWIGd1ZXN0IGhhcyBub3QKPiB0b3Vj
aGVkIHRoZSBzdGF0ZS4KPiAKPiBJbiBzdWNoIGEgY2FzZSwgdGhlIGRhdGEgcmVjb3JkIHJldHVy
bmVkIGZyb20gWGVuIGlzIDIqdWludDY0X3QsIGJvdGggY2xhaW1pbmcKPiB0aGUgKGlsbGVnaXRp
bWF0ZSkgc3RhdGUgb2YgJXhjcjAgYW5kICV4Y3IwX2FjY3VtIGJlaW5nIDAuCj4gCj4gQWRqdXN0
IHRoZSBib3VuZCBpbiBoYW5kbGVfeDg2X3B2X3ZjcHVfYmxvYigpIHRvIGNvcGUgd2l0aCB0aGlz
Lgo+IAo+IEZpeGVzOiAyYTYyYzIyNzE1YiAibGlieGMvcmVzdG9yZTogRml4IGRhdGEgYXVkaXRp
bmcgaW4gaGFuZGxlX3g4Nl9wdl92Y3B1X2Jsb2IoKSIKPiBSZXBvcnRlZC1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
