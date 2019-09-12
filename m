Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596FDB08EE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 08:38:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Ii9-0006fl-R9; Thu, 12 Sep 2019 06:36:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8Ii9-0006fg-20
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 06:36:09 +0000
X-Inumbo-ID: 9939d4f2-d527-11e9-83e3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9939d4f2-d527-11e9-83e3-12813bfff9fa;
 Thu, 12 Sep 2019 06:36:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87460ACD9;
 Thu, 12 Sep 2019 06:36:05 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <20190906074058.21782-1-jgross@suse.com>
 <CAMmSBy_huA=jDwwGfzN1cB8zt3DNP5iJZNSQ_doe1RK-4kzw8Q@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d5975dd9-250f-5e8e-e3b2-3728cf652449@suse.com>
Date: Thu, 12 Sep 2019 08:36:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_huA=jDwwGfzN1cB8zt3DNP5iJZNSQ_doe1RK-4kzw8Q@mail.gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: luwei.kang@intel.com, Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>, olekstysh@gmail.com,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 puwen@hygon.cn, xen-devel@lists.xenproject.org, chao.gao@intel.com,
 Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMDg6MTAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gSGkhCj4gCj4gT24g
RnJpLCBTZXAgNiwgMjAxOSBhdCAxMjo0MSBBTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+IHdyb3RlOgo+Pgo+PiBUaGlzIGVtYWlsIG9ubHkgdHJhY2tzIGJpZyBpdGVtcyBmb3IgeGVu
LmdpdCB0cmVlLiBQbGVhc2UgcmVwbHkgZm9yIGl0ZW1zIHlvdQo+PiB3b3VsZCBsaWtlIHRvIHNl
ZSBpbiA0LjEzIHNvIHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRlYSB3aGF0IGlzIGdvaW5nIG9uIGFu
ZAo+PiBwcmlvcml0aXNlIGFjY29yZGluZ2x5Lgo+Pgo+PiBZb3UncmUgd2VsY29tZSB0byBwcm92
aWRlIGRlc2NyaXB0aW9uIGFuZCB1c2UgY2FzZXMgb2YgdGhlIGZlYXR1cmUgeW91J3JlCj4+IHdv
cmtpbmcgb24uCj4+Cj4+ID0gVGltZWxpbmUgPQo+Pgo+PiBXZSBub3cgYWRvcHQgYSBmaXhlZCBj
dXQtb2ZmIGRhdGUgc2NoZW1lLiBXZSB3aWxsIHJlbGVhc2UgYWJvdXQgZXZlcnkgOCBtb250aHMu
Cj4+IFRoZSB1cGNvbWluZyA0LjEzIHRpbWVsaW5lIGFyZSBhcyBmb2xsb3dlZDoKPj4KPj4gKiBM
YXN0IHBvc3RpbmcgZGF0ZTogU2VwdGVtYmVyIDEzdGgsIDIwMTkKPiAKPiBOYWl2ZSBxdWVzdGlv
biBwZXJoYXBzLCBidXQgc2luY2UgdGhlIGZpcnN0IGRlYWRsaW5lIGlzIHR3byBkYXlzIGF3YXks
Cj4gSSdtIHdvbmRlcmluZwo+IHdoYXQncyBteSBiZXN0IG9wdGlvbiB0byBwcm92aWRlIGVhcmx5
IGZlZWRiYWNrPyBDdXJyZW50bHkgd2UncmUgdGVzdGluZyB3aXRoCj4gbWFzdGVyIGJyYW5jaCBp
biBQcm9qZWN0IEVWRSwgYnV0IEkndmUgbm90aWNlZCB0aGF0IGl0IGlzIDQgd2Vla3MgYmVoaW5k
IHN0YWdpbmcKPiBhdCB0aGlzIHBvaW50Lgo+IAo+IFdoZW4gaXMgaXQgZXhwZWN0ZWQgdG8gY2F0
Y2ggdXA/CgpBcyBzb29uIGFzIE9TU3Rlc3QgaXMgc3VjY2VlZGluZyBvbiBzdGFnaW5nLgoKQW55
IGZlZWRiYWNrIGlzIHZlcnkgd2VsY29tZSwgb2YgY291cnNlLiBJbiBjYXNlIHlvdSBjb3VsZCBi
YXNlIHlvdXIKdGVzdHMgb24gc3RhZ2luZyB0aGlzIG1pZ2h0IHNwZWVkIHVwIHRoaW5ncywgZGVw
ZW5kaW5nIG9uIHlvdXIgdGVzdHMKKGZhaWxpbmcgZm9yIHRoZSBzYW1lIHJlYXNvbnMgYXMgT1NT
dGVzdCB3b3VsZG4ndCBhZGQgdGhhdCBtdWNoCmluZm9ybWF0aW9uLCBidXQgZmluZGluZyBvdGhl
ciBidWdzIHdvdWxkIGJlIGEgYmlnIHBsdXMpLgoKSW4gdGhlIFJDLXBoYXNlIG1hc3RlciBzaG91
bGQgYmUgcmF0aGVyIGNsb3NlIHRvIHN0YWdpbmcsIGFzIGEgbmV3IFJDCmlzIGFsd2F5cyB0YWdn
ZWQgb24gdGhlIG1hc3RlciBicmFuY2ggYW5kIHN0YWdpbmcgc2hvdWxkIHJlY2VpdmUgZml4ZXMK
b25seSAodGhlcmUgYXJlIHNvbWUgZXhjZXB0aW9ucyBmcm9tIHRpbWUgdG8gdGltZSwgbGlrZSBz
ZWN1cml0eSBmaXhlcykuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
