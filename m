Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA61294CF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 12:08:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijLWF-0002S5-S1; Mon, 23 Dec 2019 11:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ijLWD-0002Ry-Ra
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 11:04:57 +0000
X-Inumbo-ID: 08e457a4-2574-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08e457a4-2574-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 11:04:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1EC7AFAA;
 Mon, 23 Dec 2019 11:04:47 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191223110330.26883-1-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a971ab29-c5ee-8ed2-5fb1-a8640c13a7ca@suse.com>
Date: Mon, 23 Dec 2019 12:05:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191223110330.26883-1-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/hyperv: change hv_tlb_flush_ex to
 fix clang build
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxMjowMywgV2VpIExpdSB3cm90ZToKPiBDbGFuZyBjb21wbGFpbnM6Cj4g
Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHN5bmljLmM6MTU6Cj4gL2J1aWxkcy94ZW4tcHJvamVj
dC94ZW4veGVuL2luY2x1ZGUvYXNtL2d1ZXN0L2h5cGVydi10bGZzLmg6OTAwOjE4OiBlcnJvcjog
ZmllbGQgJ2h2X3ZwX3NldCcgd2l0aCB2YXJpYWJsZSBzaXplZCB0eXBlICdzdHJ1Y3QgaHZfdnBz
ZXQnIG5vdCBhdCB0aGUgZW5kIG9mIGEgc3RydWN0IG9yIGNsYXNzIGlzIGEgR05VIGV4dGVuc2lv
biBbLVdlcnJvciwtV2dudS12YXJpYWJsZS1zaXplZC10eXBlLW5vdC1hdC1lbmRdCj4gICAgICAg
ICBzdHJ1Y3QgaHZfdnBzZXQgaHZfdnBfc2V0Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiAxIGVycm9yIGdlbmVyYXRlZC4KPiAvYnVpbGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4vUnVsZXMu
bWs6MTk4OiByZWNpcGUgZm9yIHRhcmdldCAnc3luaWMubycgZmFpbGVkCj4gbWFrZVs2XTogKioq
IFtzeW5pYy5vXSBFcnJvciAxCj4gCj4gQ29tbWVudCBvdXQgdGhlIGxhc3QgdmFyaWFibGUgc2l6
ZSBhcnJheSBmcm9tIGh2X3RsYl9mbHVzaF9leCB0byBmaXgKPiBjbGFuZyBidWlsZHMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
