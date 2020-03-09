Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3217E4EA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 17:41:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBLPu-0004NS-Vz; Mon, 09 Mar 2020 16:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBLPu-0004NN-31
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 16:38:10 +0000
X-Inumbo-ID: 5c12e5ac-6224-11ea-bdac-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c12e5ac-6224-11ea-bdac-bc764e2007e4;
 Mon, 09 Mar 2020 16:38:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 98AD6B322;
 Mon,  9 Mar 2020 16:38:08 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200219114411.26922-1-liuwe@microsoft.com>
 <20200219114411.26922-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26c31c83-c2d5-1379-9055-dd802c51d02b@suse.com>
Date: Mon, 9 Mar 2020 17:38:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219114411.26922-2-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/3] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxMjo0NCwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2ZsdXNodGxiLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmgK
PiBAQCAtMTIzLDYgKzEyMyw5IEBAIHZvaWQgc3dpdGNoX2NyM19jcjQodW5zaWduZWQgbG9uZyBj
cjMsIHVuc2lnbmVkIGxvbmcgY3I0KTsKPiAgIC8qIEZsdXNoIGFsbCBIVk0gZ3Vlc3RzIGxpbmVh
ciBUTEIgKHVzaW5nIEFTSUQvVlBJRCkgKi8KPiAgI2RlZmluZSBGTFVTSF9HVUVTVFNfVExCIDB4
NDAwMAo+ICAKPiArI2RlZmluZSBGTFVTSF9UTEJfRkxBR1NfTUFTSyAoRkxVU0hfVExCIHwgRkxV
U0hfVExCX0dMT0JBTCB8IEZMVVNIX1ZBX1ZBTElEIHwgXAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBGTFVTSF9PUkRFUl9NQVNLKQoKSSBkb24ndCB0aGluayBGTFVTSF9PUkRFUl9N
QVNLIHNob3VsZCBiZSBwYXJ0IG9mIHRoaXMsIGFzIGl0J3Mgbm90CmV4Y2x1c2l2ZWx5IFRMQi1m
bHVzaCByZWxhdGVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
