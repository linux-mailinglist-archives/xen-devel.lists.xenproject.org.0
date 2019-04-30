Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B5F9C9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 15:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLScb-0000lW-1k; Tue, 30 Apr 2019 13:16:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLScZ-0000lM-Tr
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 13:16:31 +0000
X-Inumbo-ID: 2b0a3b88-6b4a-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2b0a3b88-6b4a-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 13:16:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2D480D;
 Tue, 30 Apr 2019 06:16:30 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 532CE3F5AF;
 Tue, 30 Apr 2019 06:16:29 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
 <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
Date: Tue, 30 Apr 2019 14:16:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMC8wNC8yMDE5IDEyOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4w
NC4xOSBhdCAxMjo0NCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+IEFuIGFsdGVybmF0aXZl
IHdvdWxkIGJlIG1lbW9yeSBiYXJyaWVycyBiZXR3ZWVuIHRoZSB3cml0ZXMgb24gQVJNLAo+PiBy
aWdodD8gT3IgYSBzdHJvbmcgb3JkZXJlZCBzZXRfYml0KCkgdmFyaWFudCAod2UgaGFkIHRoYXQg
ZGlzY3Vzc2lvbgo+PiByZWNlbnRseSByZWxhdGVkIHRvIGEgYmFycmllciBpbiBBUk0tc3BlY2lm
aWMgX19jcHVfZGlzYWJsZSgpKS4KCkkgYW0gbm90IGVudGlyZWx5IGEgYmlnIGZhbiBvZiBhIHN0
cm9uZy1vcmRlciB2YXJpYW50LiBJdCB3aWxsIHBvdGVudGlhbGx5IGFkZCAKbW9yZSBtZW1vcnkg
YmFycmllcnMgdGhhbiBuZWNlc3NhcnkgaW4gdGhpcyBjb250ZXh0LgoKPiAKPiBZZXMuCgpXaGF0
IHdvdWxkIGJlIHRoZSBhZHZhbnRhZ2Ugb2YgMi0zIG1lbW9yeSBiYXJyaWVycyBvdmVyIGEgbWVt
b3J5IGJhcnJpZXIgKyBjaGVjaz8KCj4gCj4+IFRoZW4gd2UgY291bGQgZHJvcCB0aGlzICNpZm5k
ZWYgc2VjdGlvbi4KPiAKPiBOb3Qgc3VyZSBhYm91dCB0aGlzIC0gSSdtIGFjdHVhbGx5IHVuY29u
dmluY2VkIHRoZSBsYXR0ZXIgcGFydCBvZgo+IHdoYXQncyBpbnNpZGUgdGhlICNpZmRlZiBpc24n
dCBhY3R1YWxseSBuZWVkZWQgb24geDg2IGFzIHdlbGwuIEp1c3QKPiBjb25zaWRlciB0aGUgY2Fz
ZSBvZiB2Y3B1X3VuYmxvY2soKSBtYWtpbmcgaXQgdG8gdGhlIHZjcHVfd2FrZSgpCj4gaW52b2Nh
dGlvbiBvbiBhbm90aGVyIENQVSB3aGlsZSB3ZSdyZSBiZXR3ZWVuIGFueSB0d28gb2YgdGhlCj4g
dGhyZWUgd3JpdGVzIGhlcmUuIChJIGtub3cgSSd2ZSBiZWVuIGZlZWxpbmcgdW5lYXN5IGFib3V0
IHRoaXMKPiBiZWZvcmUsIGJ1dCBJIGd1ZXNzIEkgbXVzdCBoYXZlIGNvbWUgdG8gdGhlIGNvbmNs
dXNpb24gdGhhdCBpdCdzCj4gX3Byb2JhYmx5XyBva2F5LikKVGhhdCdzIG5vdCBnb2luZyB0byBi
ZSBjb3ZlcmVkIGJ5IHRoZSBjaGVjayBvbiBub24teDg2IHBsYXRmb3JtLiBJbmRlZWQsIAp2Y3B1
X3dha2UoKSBpcyBub3QgdXBkYXRpbmcgYW55IG9mIHRoZSBmaWVsZHMuIFNvLCBmcm9tIG15IHVu
ZGVyc3RhbmRpbmcsIHRoZSAKd2FrZS11cCByZXF1ZXN0IHdpbGwganVzdCBiZSBpZ25vcmVkLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
