Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD925F280C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 08:33:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iScGH-0007zS-Js; Thu, 07 Nov 2019 07:31:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iScGG-0007zN-6e
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 07:31:20 +0000
X-Inumbo-ID: 946de7bc-0130-11ea-a1b9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 946de7bc-0130-11ea-a1b9-12813bfff9fa;
 Thu, 07 Nov 2019 07:31:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52D92B4D6;
 Thu,  7 Nov 2019 07:31:14 +0000 (UTC)
To: Artem Mygaiev <joculator@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
 <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
Date: Thu, 7 Nov 2019 08:31:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAyMzowOCwgQXJ0ZW0gTXlnYWlldiB3cm90ZToKPiBPbiBXZWQsIE5vdiA2
LCAyMDE5IGF0IDQ6MjggUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToK
Pj4gT24gMDYuMTEuMjAxOSAxMDoxOSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+IC0tLSBhL0Nv
bmZpZy5tawo+Pj4gKysrIGIvQ29uZmlnLm1rCj4+PiBAQCAtMjIxLDcgKzIyMSw5IEBAIENGTEFH
UyArPSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzCj4+Pgo+Pj4gICQoY2FsbCBjYy1vcHRpb24t
YWRkLEhPU1RDRkxBR1MsSE9TVENDLC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50KQo+Pj4g
ICQoY2FsbCBjYy1vcHRpb24tYWRkLENGTEFHUyxDQywtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRl
bWVudCkKPj4+ICtpZm5lcSAoJChhcm1kcykseSkKPj4+ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxD
RkxBR1MsQ0MsLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSkKPj4+ICtlbmRpZgo+Pj4gICQo
Y2FsbCBjYy1vcHRpb24tYWRkLENGTEFHUyxDQywtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcykK
Pj4+Cj4+PiAgTERGTEFHUyArPSAkKGZvcmVhY2ggaSwgJChFWFRSQV9MSUIpLCAtTCQoaSkpCj4+
Cj4+IC4uLiB0aGlzIHdvdWxkIGJlIG5lY2Vzc2FyeS4KPiAKPiBJIGFtIHZlcnkgc29ycnksIHRo
aXMgcGF0Y2ggZG9lcyBub3QgaGF2ZSBhIHByb3BlciBkZXNjcmlwdGlvbiBpbmRlZWQuCj4gCj4g
Rm9yIHRoaXMgcGFydGljdWxhciBjaGFuZ2UgLSBhcm0gY2xhbmcgZG9lcyBub3QgdW5kZXN0YW5k
Cj4gLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZQo+IG9wdGlvbiBhdCBhbGwsIHRoYXQgaXMg
d2h5IGl0IGlzIHVuZGVyICEkKGFybWRzKQoKQnV0IGF2b2lkaW5nIHRvIGFkZCBvcHRpb25zIHdo
aWNoIHRoZSBjb21waWxlciBkb2Vzbid0IHVuZGVyc3RhbmQKaXMgdGhlIHB1cnBvc2Ugb2YgdXNp
bmcgY2Mtb3B0aW9uLWFkZCwgcmF0aGVyIHRoYW4gYmxpbmRseSBhZGRpbmcKdGhlbSB0byBDRkxB
R1MuIFdoYXQgYW0gSSBtaXNzaW5nIGhlcmU/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
