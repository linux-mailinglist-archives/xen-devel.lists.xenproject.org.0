Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E875AD755
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:55:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7HHQ-00065w-D4; Mon, 09 Sep 2019 10:52:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7HHO-00065q-LQ
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:52:18 +0000
X-Inumbo-ID: e3fc1818-d2ef-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3fc1818-d2ef-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 10:52:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4CA47B620;
 Mon,  9 Sep 2019 10:52:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190909104351.13444-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99b5f0b5-554c-1c29-f92b-a4e081bc178c@suse.com>
Date: Mon, 9 Sep 2019 12:52:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909104351.13444-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Improve code generation from
 bootsym()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMjo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgY29kZSBnZW5l
cmF0aW9uIGZvciBib290c3ltKCkgaXMgYXRyb2Npb3VzLCBhbmQgdW5uZWNlc3NlcmlseQo+IGNv
bXBsaWNhdGVkLiAgR2l2ZW4gdGhlIGFwcHJvcHJpYXRlIHBoeXNpY2FsIGFkZHJlc3MsIGFsbCB3
ZSBuZWVkIGlzIHRvCj4gY29uc3RydWN0IGEgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBhcHByb3By
aWF0ZSB0eXBlLgo+IAo+ICAgYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzkgdXAvZG93
bjogMC8tNDI1NiAoLTQyNTYpCj4gICBGdW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCj4gICBrZXhlY19yZXNlcnZlX2FyZWEuY29u
c3Rwcm9wICAgICAgICAgICAgICAgICAxNjUgICAgIDE1OSAgICAgIC02Cj4gICByZXNldF92aWRl
b21vZGVfYWZ0ZXJfczMgICAgICAgICAgICAgICAgICAgICAyMzEgICAgICA3MCAgICAtMTYxCj4g
ICBpZGVudGlmeV9jcHUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEzNDEgICAgMTE3
NiAgICAtMTY1Cj4gICBwYXJzZV9hY3BpX3NsZWVwICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA0MDggICAgIDI0MCAgICAtMTY4Cj4gICBlYXJseV9pbml0X2ludGVsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA2MzIgICAgIDQ0MCAgICAtMTkyCj4gICBfX2NwdV91cCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDE5ODMgICAgMTY4MiAgICAtMzAxCj4gICBkb19wbGF0
Zm9ybV9vcCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDY0NjkgICAgNTUyNiAgICAtOTQz
Cj4gICBjb21wYXRfcGxhdGZvcm1fb3AgICAgICAgICAgICAgICAgICAgICAgICAgIDY0MzMgICAg
NTQ4MiAgICAtOTUxCj4gICBfX3N0YXJ0X3hlbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMTI5MzkgICAxMTU3MCAgIC0xMzY5Cj4gICBUb3RhbDogQmVmb3JlPTMzNDEyOTgsIEFmdGVy
PTMzMzcwNDIsIGNoZyAtMC4xMyUKPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
