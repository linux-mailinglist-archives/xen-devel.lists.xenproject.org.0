Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD752F1B10
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 17:21:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSO0y-0001Yq-R5; Wed, 06 Nov 2019 16:18:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Klsb=Y6=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iSO0x-0001Yl-Dl
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 16:18:35 +0000
X-Inumbo-ID: 1418246c-00b1-11ea-a1ae-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1418246c-00b1-11ea-a1ae-12813bfff9fa;
 Wed, 06 Nov 2019 16:18:34 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlbPO-1i1GRu0zdy-00io0J; Wed, 06 Nov 2019 17:18:00 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <157298160814.27285.16893877491189017648@37313f22b938>
 <73852c81-87b7-e5f5-4041-d24f078cc7fa@vivier.eu>
 <CAFEAcA8SvSGCZsYT1LmN1cP1BjVDPqLP90yW9TCbvVA=kmyqBw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <98bf5ee2-7897-0b42-c88e-f71e6623cb50@vivier.eu>
Date: Wed, 6 Nov 2019 17:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SvSGCZsYT1LmN1cP1BjVDPqLP90yW9TCbvVA=kmyqBw@mail.gmail.com>
Content-Language: fr
X-Provags-ID: V03:K1:qtbzbGDMbOiX07//Csg2bwvslFqpUcHtBOnifLrjl6D5ZjvpYN/
 BEo/MB6k1/UHjQf10F3oyBj0+nQR0S92+dC3WtK426o2Gweuhj292GOgx3P//zJkB54a2CY
 spIW/HS6fdps62Y2taYht2R8R7zZWiAKxs7VueyoXckGI8/h3kcq8H5BnYuPj993VpqNJOI
 +Bhf6Vpkq8ULz9GriCYog==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mXe145y9FDM=:+dJcVURXF2BN/wYb9jAvmt
 RuDAV/IFZzQ+vUPzvqhWWA7Vu3hI/Sbp82KBAS8yLBzUyhY6qnC2o9izTsPgI3V7OkPbvQB0U
 b/a4czyZurXxxbd7Iu5afwnGwU1gu8IbVA1qG5gV//FB+jfTOH00trbiXpihg5eiC7DMIdmIY
 7DwqMTbBHhbj20cv/pCHci5hLoUEuhmdhhvVneTM898vvHebq1MftGr0E/szVZY5iYNcK8q1g
 +Rp8/QZvqu8BODtiKfXoz9IuDDoHMZcrjomv4YgEAK8E4iJ4Pj0CeoZMsj0ajzkIyrHe8bkLo
 zDxSk/Ah8W3DiHbpT79HQyhKdFhl4QZxyp+EM/d1vkfDd85r92ZdtaIaPiHFD0PHfRse+89vx
 ycMOJq0CByOMoQQiBFUER/0StbDkqH4VWRVXMRCNm76IbMzE3bm4lDaaTWBdLs8myIlvtf60E
 zSkmVW7864lkZ0BXfHurdCKhMRTwJPTMr3aeSSMfBmsWEiEB9vUDTPxUGK7T+JaaidlDtl06U
 HPHZ837pW6FvR1PnAxMXhDrL7gu0Yt0kSU5nag1/khO1rVEe2MfJBbL2kVwyQshMP9xzr+h1R
 qHqOLnq/TOvyeyXQTJTDPJoe85h/o2T1L1/FIz6woVMSgRR1gJ9YOuoTEcb+4BcI7AazmffYK
 DjfSZVUaJGbnrjprLZdNcqgTU0lSKyNqsh6eVO5P418sz2CsreGOcMSRzrUJbt8y38Z1M+Oj4
 ktkzs53tIPi7eejjkryH/qbOzSOJVXsjhjRr8WQf6pE6LKwxhS8TKkRnGDAmDrv0w9dWWqav4
 N59xbM9yWLd6YBxD53dvmikRxLGTOIfbx29QgbDeV3iWYEdvHLeSv4kuqgzrr3MZuwtzgq17w
 03wsRy5d9QfvlvsiF4v77H4Q84KJexy9k17IRWDMY=
Subject: Re: [Xen-devel] [PULL v2 0/3] Trivial branch patches
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMDYvMTEvMjAxOSDDoCAxNzowNSwgUGV0ZXIgTWF5ZGVsbCBhIMOpY3JpdMKgOgo+IE9uIFR1
ZSwgNSBOb3YgMjAxOSBhdCAyMDowNiwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1
PiB3cm90ZToKPj4KPj4gTGUgMDUvMTEvMjAxOSDDoCAyMDoyMCwgbm8tcmVwbHlAcGF0Y2hldy5v
cmcgYSDDqWNyaXQgOgo+Pj4gUGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8y
MDE5MTEwNTE3NTAxMC4yNTkxLTEtbGF1cmVudEB2aXZpZXIuZXUvCj4+Pgo+Pj4KPj4+Cj4+PiBI
aSwKPj4+Cj4+PiBUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHBy
b2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgo+Pj4gbW9yZSBpbmZvcm1hdGlvbjoKPj4+Cj4+
PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUFVMTCB2MiAwLzNdIFRyaXZpYWwgYnJhbmNoIHBhdGNo
ZXMKPj4+IFR5cGU6IHNlcmllcwo+Pj4gTWVzc2FnZS1pZDogMjAxOTExMDUxNzUwMTAuMjU5MS0x
LWxhdXJlbnRAdml2aWVyLmV1Cj4+Pgo+Pj4gPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQo+Pj4g
IyEvYmluL2Jhc2gKPj4+IGdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAK
Pj4+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKPj4+IGdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQo+Pj4gZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQo+Pj4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPj4+ID09PSBURVNUIFNDUklQVCBFTkQgPT09Cj4+Pgo+Pj4gU3dpdGNoZWQgdG8gYSBu
ZXcgYnJhbmNoICd0ZXN0Jwo+Pj4gNDlhNTVmNyBnbG9iYWw6IFNxdWFzaCAndGhlIHRoZScKPj4+
IGMwYjU1MTMgaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogRml4IDgtYml0IGFjY2Vzc2VzCj4+
PiBlYjQzMzk1IGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdoZW4gd3Jp
dGluZyB0byBQblAgcmVnaXN0ZXJzCj4+Pgo+Pj4gPT09IE9VVFBVVCBCRUdJTiA9PT0KPj4+IDEv
MyBDaGVja2luZyBjb21taXQgZWI0MzM5NWJmOGYxIChody9taXNjL2dybGliX2FoYl9hcGJfcG5w
OiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcgdG8gUG5QIHJlZ2lzdGVycykKPj4+IDIvMyBDaGVj
a2luZyBjb21taXQgYzBiNTUxM2Y5NzFhIChody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXgg
OC1iaXQgYWNjZXNzZXMpCj4+PiAzLzMgQ2hlY2tpbmcgY29tbWl0IDQ5YTU1ZjdmZWIxOSAoZ2xv
YmFsOiBTcXVhc2ggJ3RoZSB0aGUnKQo+Pj4gRVJST1I6IGRvIG5vdCB1c2UgQzk5IC8vIGNvbW1l
bnRzCj4+PiAjMjY6IEZJTEU6IGRpc2FzL2xpYnZpeGwvdml4bC9pbnZhbHNldC5oOjEwNToKPj4+
ICsgIC8vIE5vdGUgdGhhdCB0aGlzIGRvZXMgbm90IG1lYW4gdGhlIGJhY2tpbmcgc3RvcmFnZSBp
cyBlbXB0eTogaXQgY2FuIHN0aWxsCj4+Cj4+IEFzIHJlcG9ydGVkIGJ5IERhdmlkIEdpbGJlcnQs
IHRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZSBhcyB0aGlzIGZpbGUgaXMgYQo+PiBDKysgZmlsZS4K
PiAKPiBUcnVlLCBidXQgaXQncyBhbHNvIGEgdGhpcmQtcGFydHkgZGVwZW5kZW5jeSB0aGF0IHdl
IGhhdmUKPiB0YWtlbiBhIGNvcHkgb2YuIElmIHdlIGNhcmUgYWJvdXQgZml4aW5nIGl0cyB0eXBv
cyBpbiBjb21tZW50cwo+IHdlIHNob3VsZCBkbyB0aGF0IGJ5IHN1Ym1pdHRpbmcgdGhlIGZpeGVz
IHVwc3RyZWFtLiBXZSBzaG91bGQKPiBhdm9pZCBtYWtpbmcgY2hhbmdlcyB0byBvdXIgbG9jYWwg
Y29weSBvZiB0aGlzIGNvZGUgYmVjYXVzZQo+IGl0IGp1c3QgbWFrZXMgaXQgdW5uZWNlc3Nhcmls
eSBtb3JlIGRpZmZpY3VsdCB0byBkbyB1cGRhdGVzIHRvCj4gbmV3ZXIgdmVyc2lvbnMuCj4gCj4g
Q291bGQgeW91IGRyb3AgdGhhdCBjaGFuZ2UsIHBsZWFzZT8gKFNvcnJ5IEkgZGlkbid0IG5vdGlj
ZQo+IGl0IGdvaW5nIGJ5IHdoZW4gdGhlIHBhdGNoIHdhcyBvcmlnaW5hbGx5IG9uIGxpc3QuKQoK
U3VyZS4KClRoYW5rcywKTGF1cmVudAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
