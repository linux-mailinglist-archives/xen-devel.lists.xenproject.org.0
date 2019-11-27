Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D5810B2F5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:08:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzq8-0004WV-Ms; Wed, 27 Nov 2019 16:06:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZzq6-0004WQ-V9
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:06:50 +0000
X-Inumbo-ID: eb5a93f4-112f-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb5a93f4-112f-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 16:06:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47335ACD0;
 Wed, 27 Nov 2019 16:06:49 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191127154817.12103-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <99248577-d38b-56b3-bc78-eeb99ec6cb85@suse.com>
Date: Wed, 27 Nov 2019 17:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127154817.12103-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTY6NDgsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBXaGVuIHVzaW5nIHBv
c3RlZCBpbnRlcnJ1cHRzIG9uIEludGVsIGhhcmR3YXJlIGl0J3MgcG9zc2libGUgdGhhdCB0aGUK
PiB2Q1BVIHJlc3VtZXMgZXhlY3V0aW9uIHdpdGggYSBzdGFsZSBsb2NhbCBBUElDIElSUiByZWdp
c3RlciBiZWNhdXNlCj4gZGVwZW5kaW5nIG9uIHRoZSBpbnRlcnJ1cHRzIHRvIGJlIGluamVjdGVk
IHZsYXBpY19oYXNfcGVuZGluZ19pcnEKPiBtaWdodCBub3QgYmUgY2FsbGVkLCBhbmQgdGh1cyBQ
SVIgd29uJ3QgYmUgc3luY2VkIGludG8gSVJSLgo+IAo+IEZpeCB0aGlzIGJ5IG1ha2luZyBzdXJl
IFBJUiBpcyBhbHdheXMgc3luY2VkIHRvIElSUiBpbgo+IGh2bV92Y3B1X2hhc19wZW5kaW5nX2ly
cSByZWdhcmRsZXNzIG9mIHdoYXQgaW50ZXJydXB0cyBhcmUgcGVuZGluZy4KPiAKPiBSZXBvcnRl
ZC1ieTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
