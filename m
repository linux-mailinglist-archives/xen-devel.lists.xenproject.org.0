Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032FFE1F52
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:29:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIWy-00071g-LW; Wed, 23 Oct 2019 15:26:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNIWx-00071b-7U
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:26:35 +0000
X-Inumbo-ID: 7ef3d8f2-f5a9-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ef3d8f2-f5a9-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 15:26:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5BA7FBA3B;
 Wed, 23 Oct 2019 15:26:33 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
 <6817967de825071edd7adedbc6b798199ae292ad.1570918263.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dd2a6de-75dd-c9bc-f699-28a53d9e83fa@suse.com>
Date: Wed, 23 Oct 2019 17:26:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6817967de825071edd7adedbc6b798199ae292ad.1570918263.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] efi: remove old
 SetVirtualAddressMap() arrangement
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTAuMjAxOSAwMDoxMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBAQCAtMTU5MSwxMCArMTU3Niw2IEBAIHZvaWQgX19pbml0IGVmaV9pbml0X21lbW9yeSh2b2lk
KQo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0KPiAgCj4gLSNpZmRlZiBVU0VfU0VUX1ZJUlRV
QUxfQUREUkVTU19NQVAKPiAtICAgIGVmaV9ycy0+U2V0VmlydHVhbEFkZHJlc3NNYXAoZWZpX21l
bW1hcF9zaXplLCBlZmlfbWRlc2Nfc2l6ZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWRlc2NfdmVyLCBlZmlfbWVtbWFwKTsKPiAtI2Vsc2UKPiAgICAgIC8qIFNldCB1cCAx
OjEgcGFnZSB0YWJsZXMgdG8gZG8gcnVudGltZSBjYWxscyBpbiAicGh5c2ljYWwiIG1vZGUuICov
CgpUaGlzIGNvbW1lbnQsIGJ0dywgYWxzbyB3YW50cyBlaXRoZXIgYWRqdXN0aW5nIG9yIHJlbW92
aW5nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
