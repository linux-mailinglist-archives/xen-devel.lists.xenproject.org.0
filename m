Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440986B87
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 22:30:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvp0v-0007e7-KL; Thu, 08 Aug 2019 20:27:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K+/l=WE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hvp0u-0007e2-Qm
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 20:27:56 +0000
X-Inumbo-ID: 00bc1086-ba1b-11e9-ba57-4f1381365eb2
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00bc1086-ba1b-11e9-ba57-4f1381365eb2;
 Thu, 08 Aug 2019 20:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB91C30BD1CC;
 Thu,  8 Aug 2019 20:27:54 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-122.ams2.redhat.com
 [10.36.117.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10DA160A97;
 Thu,  8 Aug 2019 20:27:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-30-anthony.perard@citrix.com>
 <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
 <20190808132832.GU1242@perard.uk.xensource.com>
 <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <604a726a-8443-88ff-8173-31e87bf7489c@redhat.com>
Date: Thu, 8 Aug 2019 22:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 20:27:54 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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
Cc: xen-devel@lists.xenproject.org, devel@edk2.groups.io,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMTkgMTU6NDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBBdWcg
MDgsIDIwMTkgYXQgMDI6Mjg6MzJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IE9u
IFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA1OjU0OjUxUE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4+PiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOTozOFBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPj4+PiBQY2RGU0JDbG9jayBpcyB1c2VkIGJ5IFNlY1BlaUR4ZVRp
bWVyTGliQ3B1LCB0aGUgVGltZXJMaWIKPj4+PiBpbXBsZW1lbnRhdGlvbi4gSXQgd2lsbCBhbHNv
IGJlIHVzZWQgYnkgWGVuVGltZXJEeGUuIE92ZXJyaWRlCj4+Pj4gUGNkRlNCQ2xvY2sgdG8gbWF0
Y2ggWGVuIHZMQVBJQyB0aW1lciBmcmVxdWVuY3kuCj4+Pgo+Pj4gSSdtIGtpbmQgb2Ygc3VycHJp
c2VkIHRoYXQgaGlzIGlzIG5vdCBhdXRvbWF0aWNhbGx5IGRldGVjdGVkPwo+Pj4KPj4+IElzIGl0
IGEgYnVnIGluIFhlbiBvciBqdXN0IGFsd2F5cyBoYXJkY29kZWQgb24gT1ZNRj8KPj4KPj4gSXQn
cyBoYXJkY29kZWQuIFdoeSB3b3VsZCB5b3UgbmVlZCBhdXRvIGRldGVjdGlvbiB3aGVuIHlvdSBh
bHdheXMgcnVuIG9uCj4+IHRoZSBzYW1lIG1hY2hpbmUgOy0pLgo+IAo+IEkgZG9uJ3QgdGhpbmsg
dGhhdCdzIHBhcnQgb2YgdGhlIEhWTS9QVkggQUJJIGluIGFueSB3YXksIGFuZCBpZiB5b3UKPiBo
YXJkY29kZSBpdCBpbiBPVk1GIGl0IHdvdWxkIHByZXZlbnQgWGVuIGZyb20gY2hhbmdpbmcgdGhl
IGZyZXF1ZW5jeQo+IGluIHRoZSBmdXR1cmUgaWYgc3VjaCBuZWNlc3NpdHkgYXJpc2VzLiBXZSBz
aG91bGQgdHJ5IHRvIGF2b2lkIHBhaW50aW5nCj4gb3Vyc2VsdmVzIGludG8gYSBjb3JuZXIgd2hl
biBwb3NzaWJsZS4KPiAKPiBEb2Vzbid0IE9WTUYgaGF2ZSBhIHdheSB0byBnZXQgdGhpcyBmcm9t
IHRoZSBoYXJkd2FyZSBpdHNlbGY/CgpJdCBtaWdodCBiZSBwb3NzaWJsZSB0byBjaGFuZ2UgdGhl
IFBDRHMgYWNjZXNzIG1ldGhvZCBpbiB0aGUgRFNDIGZpbGUgdG8KImR5bmFtaWMiLCBhbmQgdGhl
biBzZXQgaXQgZHluYW1pY2FsbHkgaW4gWGVuUGxhdGZvcm1QZWkuIFRoYXQgc2hvdWxkCndvcmsg
ZmluZSBpZiBvbmx5IHRoZSBEWEUgcGhhc2UgcmVsaWVzIG9uIHRoZSBQQ0QuIEhvd2V2ZXIsIGlm
IFBFSU1zCihvdGhlciB0aGFuIFhlblBsYXRmb3JtUGVpKSBjb25zdW1lIHRoZSBQQ0QgdG9vLCB0
aGVuIHRoZSBvcmRlcmluZwooYmV0d2VlbiBzZXQvZ2V0KSBtaWdodCBub3QgYmUgdHJpdmlhbCB0
byBlbnN1cmUuIFRoaXMga2luZCBvZiBwcm9ibGVtCnNvbWV0aW1lcyByZXF1cmllcyBzZXBhcmF0
ZSBsaWJyYXJ5IGluc3RhbmNlcyBmb3IgU0VDL1BFSS9EWEUuCgpUaGFua3MKTGFzemxvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
