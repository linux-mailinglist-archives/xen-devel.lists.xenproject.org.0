Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86710AC67
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:10:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtIP-0005lv-5r; Wed, 27 Nov 2019 09:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZtIN-0005lq-7p
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:07:35 +0000
X-Inumbo-ID: 584818bf-10f5-11ea-a3ae-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 584818bf-10f5-11ea-a3ae-12813bfff9fa;
 Wed, 27 Nov 2019 09:07:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 225CCBA1A;
 Wed, 27 Nov 2019 09:07:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
 <20191126035517.GT5763@mail-itl>
 <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
 <CAMmSBy_2gQCPOJjo-VWZ3gmbER+5QPNJyQJN3u_SgKDGZQadGg@mail.gmail.com>
 <20191126183202.GV5763@mail-itl>
 <CAMmSBy8j6OzxdvJNGseLP++qstCjPajjv-N=fwbu3i3Zu-qaiw@mail.gmail.com>
 <a520243e-d20f-01f2-bf58-c4916dd8508a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e379d111-ec7b-5210-c996-f4e437218d6e@suse.com>
Date: Wed, 27 Nov 2019 10:07:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a520243e-d20f-01f2-bf58-c4916dd8508a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] UEFI support on Dell boxes
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAyMToxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8xMS8yMDE5
IDIwOjEyLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+PiBPbiBUdWUsIE5vdiAyNiwgMjAxOSBh
dCAxMDozMiBBTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kKPj4+IFNvLCB0byBpbXByb3Zl
IFhlbidzIGhhcmR3YXJlL2Zpcm13YXJlIGNvbXBhdGliaWxpdHksIEkgaGF2ZSB0d28gaWRlYXM6
Cj4+Pgo+Pj4gMS4gTWFrZSBlZmk9YXR0cj11YyB0aGUgZGVmYXVsdCAoaXQncyBzdGlsbCBwb3Nz
aWJsZSB0byBkaXNhYmxlIGl0IHdpdGgKPj4+IGVmaT1hdHRyPW5vKS4KPj4gSSdkIGJlIHZlcnkg
bXVjaCBpbiBmYXZvciBvZiB0aGF0IHRvbyAoZXNwZWNpYWxseSBzaW5jZSBpdCBzZWVtcyB0byBt
YXRjaAo+PiBMaW51eCBiZWhhdmlvdXIpIFdoYXQgZG8gb3RoZXJzIHRoaW5rPwo+IAo+IEl0cyBt
b3JlIHRoYW4ganVzdCB0aGlzLsKgIExpbnV4IGFsc28gZG9lc24ndCB1c2UgRUZJIHJlYm9vdCBi
ZWNhdXNlIGl0Cj4gaXMgYnJva2VuIGFsbW9zdCBldmVyeXdoZXJlIChiZWNhdXNlIFdpbmRvd3Mg
ZG9lc24ndCB1c2UgaXQgYmVjYXVzZSBpdHMKPiBicm9rZW4gYWxtb3N0IGV2ZXJ5d2hlcmUsIHNv
IGl0IG5ldmVyIGdldHMgZml4ZWQpLgo+IAo+IFhlbiBzaG91bGQgYmUgZm9sbG93aW5nIExpbnV4
LCBidXQgSSdtIGV4aGF1c3RlZCBhcmd1aW5nIHRoaXMgcG9pbnQuCgpXaGVyZSBpdCBtYWtlcyBz
ZW5zZSwgeWVzLiBCdXQgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGl0IGRvZXNuJ3QgKHdlCmRvbid0
LCBmb3IgZXhhbXBsZSwgd2FudCB0byBibGluZGx5IGluaGVyaXQgYnVncykuIE5vciBkbyBJIHNl
ZSB3aHkKTGludXggc2hvdWxkIGJlIHRoZSBvbmx5IHBvc3NpYmxlIHJlZmVyZW5jZS4gSWYgb3Ro
ZXIgT1NlcyB3b3JrCmFyb3VuZCBpc3N1ZXMgaW4gYSBiZXR0ZXIgd2F5IHRoYW4gTGludXggZG9l
cywgd2h5IHNob3VsZCB3ZSBmb2xsb3cKTGludXggcmF0aGVyIHRoYW4gc3VjaCBhbHRlcm5hdGl2
ZSBpbXBsZW1lbnRhdGlvbj8KCj4gQSBjb25zZXF1ZW5jZSBpcyB0aGF0IGRvd25zdHJlYW0gdGVu
ZCB0byBzaGFyZSBhIHBpbGUgb2YgInVuYnJlYWsgWGVuIG9uCj4gVUVGSSIgcGF0Y2hlcyB3aGlj
aCBoYXZlIGJlZW4gcmVqZWN0ZWQgdXBzdHJlYW0gb24gcGhpbG9zb3BoaWNhbCByYXRoZXIKPiB0
aGFuIHRlY2huaWNhbCBncm91bmRzLCBkZXNwaXRlIHRoaXMgYmVpbmcgYSB0b3hpYyBlbnZpcm9u
bWVudCB0byB3b3JrIGluLgoKV2UnbGwgZ2V0IG91dCBvZiB0aGlzIHJlY3VycmluZyBkZWJhdGUg
b25seSBpZiB5b3Ugb3IgYW55b25lIGVsc2UKcHJvcG9zZSB0byBoYXZlIHNvbWVvbmUgb3RoZXIg
dGhhbiBtZSBiZSB0aGUgVUVGSSBjb2RlIG1haW50YWluZXIuCk5vIG1hdHRlciB0aGF0IHlvdSBj
YWxsIHRoZW0gcGhpbG9zb3BoaWNhbCByYXRoZXIgdGhhbiB0ZWNobmljYWwKYXJndW1lbnRzLCBJ
IGNvbnRpbnVlIHRvIGJlIG9mIHRoZSBmaXJtIG9waW5pb24gdGhhdCB3b3JrYXJvdW5kcwpmb3Ig
YWxsIHNvcnRzIG9mIHRoaW5ncyBhcmUgYWNjZXB0YWJsZSwgYnV0IHNob3VsZG4ndCBpbXBhY3Qg
aW4KYW55IHdheSBzeXN0ZW1zIGFkaGVyaW5nIHRvIHN0YW5kYXJkcy4gKEl0IGlzIHByb2JhYmx5
IFtiYWRdIGx1Y2sKdGhhdCBJJ3ZlIG5vdCBteXNlbGYgYmVlbiBzZXZlcmVseSBpbXBhY3RlZCBi
eSBVRUZJIGltcGxlbWVudGF0aW9uCmlzc3VlcyB3aXRoIGFueSBvZiB0aGUgYm94ZXMgSSByb3V0
aW5lbHkgdGVzdCBvbi4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
