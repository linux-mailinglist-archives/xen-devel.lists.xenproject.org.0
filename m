Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F13422B1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 12:39:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb0cg-0002Bh-6n; Wed, 12 Jun 2019 10:36:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hb0cf-0002BQ-Ca
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 10:36:53 +0000
X-Inumbo-ID: fcf7cf52-8cfd-11e9-9098-4321019e72c7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcf7cf52-8cfd-11e9-9098-4321019e72c7;
 Wed, 12 Jun 2019 10:36:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0633AF97;
 Wed, 12 Jun 2019 10:36:50 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190612101228.23898-1-jgross@suse.com>
 <5D00D1A602000078002376A9@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8392fdc4-a6b2-a3aa-dca6-0a0ad7a411be@suse.com>
Date: Wed, 12 Jun 2019 12:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D00D1A602000078002376A9@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] x86/xen: disable nosmt in Xen guests
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
 the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org,
 mingo@redhat.com, Borislav Petkov <bp@alien8.de>, hpa@zytor.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDYuMTkgMTI6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjA2LjE5IGF0
IDEyOjEyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gV2hlbiBydW5uaW5nIGFzIGEgWGVu
IGd1ZXN0IHNlbGVjdGluZyAibm9zbXQiIGVpdGhlciB2aWEgY29tbWFuZCBsaW5lCj4+IG9yIGlt
cGxpY2l0bHkgdmlhIGRlZmF1bHQgc2V0dGluZ3MgbWFrZXMgbm8gc2Vuc2UsIGFzIHRoZSBndWVz
dCBoYXMgbm8KPj4gY2x1ZSBhYm91dCB0aGUgcmVhbCBzeXN0ZW0gdG9wb2xvZ3kgaXQgaXMgcnVu
bmluZyBvbi4gV2l0aCBYZW4gaXQgaXMKPj4gdGhlIGh5cGVydmlzb3IncyBqb2IgdG8gZW5zdXJl
IHRoZSBwcm9wZXIgYnVnIG1pdGlnYXRpb25zIGFyZSBhY3RpdmUKPj4gcmVnYXJkaW5nIHNtdCBz
ZXR0aW5ncy4KPiAKPiBJIGRvbid0IGFncmVlIHdpdGggdGhlIHNlY29uZCBzZW50ZW5jZTogSXQg
aXMgaW4gcHJpbmNpcGxlIGZpbmUgZm9yIHRoZQo+IGh5cGVydmlzb3IgdG8gZXhwb3NlIEhUIChp
LmUuIG5vdCBkaXNhYmxlIGl0IGFzIGJ1ZyBtaXRpZ2F0aW9uKSwgYW5kCj4gbGVhdmUgaXQgdG8g
dGhlIGd1ZXN0IGtlcm5lbHMgdG8gcHJvdGVjdCB0aGVtc2VsdmVzLiBXZSdyZSBqdXN0IG5vdAo+
IGF0IHRoZSBwb2ludCB5ZXQgd2hlcmUgWGVuIG9mZmVycyBzdWZmaWNpZW50IC8gcmVsaWFibGUg
ZGF0YSB0byBndWVzdAo+IGtlcm5lbHMgdG8gZG8gc28sIHNvIF9mb3IgdGhlIHRpbWUgYmVpbmdf
IHdoYXQgeW91IHNheSBpcyBjb3JyZWN0LgoKT2theSwgSSdsbCBhZGQgc29tZXRoaW5nIGxpa2U6
CgpUaGlzIGlzIHRydWUgYXMgbG9uZyBYZW4gZG9lc24ndCBzdXBwb3J0IGNvcmUgc2NoZWR1bGlu
ZyB0b2dldGhlciB3aXRoCmV4cG9zaW5nIHRoZSAodGhlbikgY29ycmVjdCBzaWJsaW5nIGluZm9y
bWF0aW9uIHRvIHRoZSBndWVzdCBhbmQKaW5kaWNhdGluZyB0aGF0IGNhc2UgdmlhIGEgc3V0YWJs
ZSBpbnRlcmZhY2UuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
