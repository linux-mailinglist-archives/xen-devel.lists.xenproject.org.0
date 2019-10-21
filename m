Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32DDE3C8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 07:35:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMQKE-0004lT-2T; Mon, 21 Oct 2019 05:33:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QP7N=YO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMQKB-0004lN-Qw
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 05:33:47 +0000
X-Inumbo-ID: 5a74d878-f3c4-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a74d878-f3c4-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 05:33:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CDB9B418;
 Mon, 21 Oct 2019 05:33:46 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191015154736.19882-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d80caafe-956f-5341-754f-17e1cba54904@suse.com>
Date: Mon, 21 Oct 2019 07:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015154736.19882-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/4] iommu: fixes for interrupt remapping
 enabling
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMTkgMTc6NDcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBIZWxsbywKPiAKPiBU
aGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIGZpeGVzIGZvciBpc3N1ZXMgZm91bmQgd2hlbiBl
bmFibGluZwo+IGludGVycnVwdCByZW1hcHBpbmcgYW5kIHRoZSBJTy1BUElDIGFscmVhZHkgaGFz
IHVubWFza2VkIHBpbnMuIFdoaWxlIEknbQo+IG5vdCBhd2FyZSBvZiBhbnkgc3lzdGVtIG1hbGZ1
bmN0aW9uaW5nIChhcGFydCBmcm9tIHJlcG9ydGluZyBJT01NVQo+IGludGVycnVwdCByZW1hcHBp
bmcgZmF1bHRzKSBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0aG9zZSBpbgo+IDQu
MTMuCj4gCj4gVGhlIHNlcmllcyBjYW4gYWxzbyBiZSBmb3VuZCBhdDoKPiAKPiBnaXQ6Ly94ZW5i
aXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4uZ2l0IGlvbW11X2ludHJfdjMKCkZvciB0aGUg
c2VyaWVzOgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
