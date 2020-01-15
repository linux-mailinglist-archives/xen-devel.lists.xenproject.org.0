Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3D13BA7B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 08:50:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irdO4-0005Po-Rh; Wed, 15 Jan 2020 07:46:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qU8P=3E=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1irdO2-0005Pj-Uk
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 07:46:46 +0000
X-Inumbo-ID: 2cade94e-376b-11ea-84e2-12813bfff9fa
Received: from 7.mo173.mail-out.ovh.net (unknown [46.105.44.159])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cade94e-376b-11ea-84e2-12813bfff9fa;
 Wed, 15 Jan 2020 07:46:44 +0000 (UTC)
Received: from player774.ha.ovh.net (unknown [10.109.143.18])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 6CDB412C688
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 08:46:43 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 794D1E4CF170;
 Wed, 15 Jan 2020 07:46:22 +0000 (UTC)
Date: Wed, 15 Jan 2020 08:46:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20200115084621.5f8d1b10@bahia.lan>
In-Reply-To: <20200110194158.14190-2-vsementsov@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-2-vsementsov@virtuozzo.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14078815388168395091
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedt
Subject: Re: [Xen-devel] [PATCH v6 01/11] qapi/error: add (Error **errp)
 cleaning APIs
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMCBKYW4gMjAyMCAyMjo0MTo0OCArMDMwMApWbGFkaW1pciBTZW1lbnRzb3YtT2dp
ZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5
OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+
Cj4gLS0tCj4gCgpSZXZpZXdlZC1ieTogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4KCj4gQ0M6
IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+IENDOiBFcmljIEJsYWtlIDxlYmxh
a2VAcmVkaGF0LmNvbT4KPiBDQzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KPiBDQzog
TWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiBDQzogR3JlZyBLdXJ6IDxncm91Z0BrYW9k
Lm9yZz4KPiBDQzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgo+IENDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEFudGhvbnkg
UGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IENDOiBQYXVsIER1cnJhbnQgPHBh
dWxAeGVuLm9yZz4KPiBDQzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhh
dC5jb20+Cj4gQ0M6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gQ0M6IEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IENDOiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5i
QGxpbnV4LmlibS5jb20+Cj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNv
bT4KPiBDQzogTWljaGFlbCBSb3RoIDxtZHJvdGhAbGludXgudm5ldC5pYm0uY29tPgo+IENDOiBx
ZW11LWJsb2NrQG5vbmdudS5vcmcKPiBDQzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gCj4gIGluY2x1ZGUvcWFwaS9lcnJvci5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9xYXBpL2Vycm9yLmggYi9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+IGluZGV4IGFkNWI2
ZTg5NmQuLmZhOGQ1MWZkNmQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPiAr
KysgYi9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+IEBAIC0zMDksNiArMzA5LDMyIEBAIHZvaWQgd2Fy
bl9yZXBvcnRmX2VycihFcnJvciAqZXJyLCBjb25zdCBjaGFyICpmbXQsIC4uLikKPiAgdm9pZCBl
cnJvcl9yZXBvcnRmX2VycihFcnJvciAqZXJyLCBjb25zdCBjaGFyICpmbXQsIC4uLikKPiAgICAg
IEdDQ19GTVRfQVRUUigyLCAzKTsKPiAgCj4gKy8qCj4gKyAqIEZ1bmN0aW9ucyB0byBjbGVhbiBF
cnJvciAqKmVycnA6IGNhbGwgY29ycmVzcG9uZGluZyBFcnJvciAqZXJyIGNsZWFuaW5nCj4gKyAq
IGZ1bmN0aW9uIGFuIHNldCBwb2ludGVyIHRvIE5VTEwKPiArICovCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBlcnJvcl9mcmVlX2VycnAoRXJyb3IgKiplcnJwKQo+ICt7Cj4gKyAgICBhc3NlcnQoZXJy
cCAmJiAqZXJycCk7Cj4gKyAgICBlcnJvcl9mcmVlKCplcnJwKTsKPiArICAgICplcnJwID0gTlVM
TDsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGVycm9yX3JlcG9ydF9lcnJwKEVycm9y
ICoqZXJycCkKPiArewo+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOwo+ICsgICAgZXJyb3Jf
cmVwb3J0X2VycigqZXJycCk7Cj4gKyAgICAqZXJycCA9IE5VTEw7Cj4gK30KPiArCj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCB3YXJuX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkKPiArewo+ICsgICAg
YXNzZXJ0KGVycnAgJiYgKmVycnApOwo+ICsgICAgd2Fybl9yZXBvcnRfZXJyKCplcnJwKTsKPiAr
ICAgICplcnJwID0gTlVMTDsKPiArfQo+ICsKPiArCj4gIC8qCj4gICAqIEp1c3QgbGlrZSBlcnJv
cl9zZXRnKCksIGV4Y2VwdCB5b3UgZ2V0IHRvIHNwZWNpZnkgdGhlIGVycm9yIGNsYXNzLgo+ICAg
KiBOb3RlOiB1c2Ugb2YgZXJyb3IgY2xhc3NlcyBvdGhlciB0aGFuIEVSUk9SX0NMQVNTX0dFTkVS
SUNfRVJST1IgaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
