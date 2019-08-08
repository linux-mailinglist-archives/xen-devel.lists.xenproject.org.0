Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749088640C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:11:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvj6G-00049x-U5; Thu, 08 Aug 2019 14:09:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AgOK=WE=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1hvj6F-00049q-EX
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:09:03 +0000
X-Inumbo-ID: 1307d606-b9e6-11e9-aff5-0bc76002b7fe
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1307d606-b9e6-11e9-aff5-0bc76002b7fe;
 Thu, 08 Aug 2019 14:09:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2731D30C061E;
 Thu,  8 Aug 2019 14:08:59 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8989260BF1;
 Thu,  8 Aug 2019 14:08:05 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:08:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808160803.1326a244.cohuck@redhat.com>
In-Reply-To: <1565166336833.46550@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166336833.46550@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 08 Aug 2019 14:09:02 +0000 (UTC)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 01/26] configure: Define
 TARGET_ALIGNED_ONLY
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 i.mitsyanko@gmail.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA3IEF1ZyAyMDE5IDA4OjI1OjM3ICswMDAwCjx0b255Lm5ndXllbkBidC5jb20+IHdy
b3RlOgoKPiBSZW5hbWUgQUxJR05FRF9PTkxZIHRvIFRBUkdFVF9BTElHTkVEX09OTFkgZm9yIGNs
YXJpdHkgYW5kIG1vdmUKPiBkZWZpbmVzIG91dCBvZiB0YXJnZXQvZm9vL2NwdS5oIGludG8gY29u
ZmlndXJlLCBhcyB3ZSBkbyB3aXRoCj4gVEFSR0VUX1dPUkRTX0JJR0VORElBTiwgc28gdGhhdCBp
dCBpcyBhbHdheXMgZGVmaW5lZCBlYXJseS4KPiAKPiBQb2lzb25lZCBUQVJHRVRfQUxJR05FRF9P
TkxZIHRvIHByZXZlbnQgdXNlIGluIGNvbW1vbiBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRv
bnkgTmd1eWVuIDx0b255Lm5ndXllbkBidC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiBSZXZpZXdlZC1ieTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEFs
ZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+Cj4gLS0tCj4gIGNvbmZp
Z3VyZSAgICAgICAgICAgICB8IDEwICsrKysrKysrKy0KPiAgaW5jbHVkZS9leGVjL3BvaXNvbi5o
IHwgIDEgKwo+ICBpbmNsdWRlL3FvbS9jcHUuaCAgICAgfCAgMiArLQo+ICB0YXJnZXQvYWxwaGEv
Y3B1LmggICAgfCAgMiAtLQo+ICB0YXJnZXQvaHBwYS9jcHUuaCAgICAgfCAgMSAtCj4gIHRhcmdl
dC9taXBzL2NwdS5oICAgICB8ICAyIC0tCj4gIHRhcmdldC9zaDQvY3B1LmggICAgICB8ICAyIC0t
Cj4gIHRhcmdldC9zcGFyYy9jcHUuaCAgICB8ICAyIC0tCj4gIHRhcmdldC94dGVuc2EvY3B1Lmgg
ICB8ICAyIC0tCj4gIHRjZy90Y2cuYyAgICAgICAgICAgICB8ICAyICstCj4gIHRjZy90Y2cuaCAg
ICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIDExIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDE3IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVj
a0ByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
