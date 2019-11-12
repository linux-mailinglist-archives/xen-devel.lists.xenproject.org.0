Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F811F96BF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 18:12:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUZge-0008SA-3w; Tue, 12 Nov 2019 17:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUZgc-0008S5-DJ
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 17:10:38 +0000
X-Inumbo-ID: 58b95b82-056f-11ea-984a-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58b95b82-056f-11ea-984a-bc764e2007e4;
 Tue, 12 Nov 2019 17:10:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4DC021D7F;
 Tue, 12 Nov 2019 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573578637;
 bh=EaOwpUJQgJ9yVzMQ3SVXRaxjN/x9bznDrUfqExb6QwY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ArfCWqZlYyogKWRwLJOBZyVgcFQ7jOnzLK3WGQPndKbzQwU+63YpQSjQlTXWVgTe4
 /ArB4WeuB1ms4+uTs/NcJJuDFGI5H1j2B3lD8vbjcR0YqqB6EicHlqNqJqU0idCoG4
 +v6/ZyXj3MuTgfdKETjG0ViKz5wQbsxIAibeujso=
Date: Tue, 12 Nov 2019 09:10:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: lars.kurth@citrix.com
In-Reply-To: <24010.38080.707256.901442@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.1911120908390.2863@sstabellini-ThinkPad-T480s>
References: <20191108190952.22163-1-sstabellini@kernel.org>
 <20191112111416.GA2337@perard.uk.xensource.com>
 <24010.38080.707256.901442@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, ian.jackson@citrix.com,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMiBOb3YgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW50aG9ueSBQRVJBUkQg
d3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gSW50cm9kdWNlIGEgZGVzY3JpcHRpb24g
b2YgYSBuZXcgb3B0aW9uYWwgdGFnIGZvciBCYWNrcG9ydHMiKToKPiA+IFNob3VsZCB3ZSBkZXNj
cmliZSB0aGUgRml4ZXM6IHRhZyBhcyB3ZWxsPyBUaGVzZSB3b3VsZCBoYXZlIGEgc2ltaWxhcgo+
ID4gcHVycG9zZSB0byB0aGUgYmFja3BvcnQgdGFnLCBJIG1lYW4gaXQgY291bGQgaGVscCBmaWd1
cmUgb3V0IHdoaWNoCj4gPiBjb21taXQgdG8gYmFja3BvcnQgdG8gd2hpY2ggdHJlZS4KPiAKPiBH
b29kIHBvaW50LgoKWWVzLCBnb29kIGlkZWEuCgoKTGFycywgSSB0aGluayB3ZSBhcmUgYWxyZWFk
eSBpbiBhZ3JlZW1lbnQuCgpZb3UgY2FuIGZpbmQgdGhlIGRlc2NyaXB0aW9uIG9mICJGaXhlcyIg
aGVyZSBpbiBMaW51eApEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJz
dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
