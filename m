Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A67A937
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:13:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRtT-0001VP-Hh; Tue, 30 Jul 2019 13:10:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsRtR-0001VK-Pk
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:10:17 +0000
X-Inumbo-ID: 5f986a70-b2cb-11e9-9471-1f0950c14730
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f986a70-b2cb-11e9-9471-1f0950c14730;
 Tue, 30 Jul 2019 13:10:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 051EF3002F52;
 Tue, 30 Jul 2019 13:10:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 132CE600F8;
 Tue, 30 Jul 2019 13:10:13 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1ba55a93-e880-6fe3-abfc-a840d956bf3c@redhat.com>
Date: Tue, 30 Jul 2019 15:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 30 Jul 2019 13:10:16 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCk9uIDA3LzI5LzE5IDE3OjM5LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBQ
YXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiBodHRwczovL3hlbmJp
dHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici5wbGF0Zm9ybS14
ZW4tcHZoLXY0Cj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIHBhdGNoICJPdm1mUGtnL1hlblBsYXRm
b3JtUGVpOiBSZXNlcnZlIGh2bWxvYWRlcidzIG1lbW9yeSBvbmx5IHdoZW4gaXQgaGFzCj4gICBy
dW4iIHdhcyByZW1vdmVkLCBhbmQgaW5zdGVhZCBhIGRpZmZlcmVudCBjaGFuZ2UgaXMgZG9uZSBp
bgo+ICAgIk92bWZQa2cvWGVuUGxhdGZvcm1QZWk6IFJld29yayBtZW1vcnkgZGV0ZWN0aW9uIgo+
IC0gb3RoZXIgY2hhbmdlcyBkZXRhaWxlZCBpbiB0aGUgbm90ZXMgb2YgZWFjaCBwYXRjaAoKSSd2
ZSBnb25lIHRocm91Z2ggdGhlIHY0IHNlcmllcy4gSWYgcmV2aWV3ZXJzIG9uIHRoZSB4ZW4tZGV2
ZWwgbGlzdAp0aGluayB2NCBpcyBva2F5IHRvIG1lcmdlLCBJIGNhbiBkbyB0aGF0ICh3aXRoIHRo
ZSBzbWFsbCBmaXh1cHMgSQpvZmZlcmVkIGhlcmUgYW5kIHRoZXJlKS4gSSBzdWdnZXN0IHRoYXQg
d2Ugd2FpdCBhIGZldyBkYXlzIC0tIHBsZWFzZQpwaW5nIG1lIHdoZW4geW91IGJlbGlldmUgdGhl
IHJldmlldyBvbiB4ZW4tZGV2ZWwgaGFzIGNvbmNsdWRlZC4KCklmIHlvdSBwcmVmZXIgdG8gcG9z
dCB2NSwgdGhhdCB3b3JrcyBhcyB3ZWxsIG9mIGNvdXJzZS4KClRoYW5rcywKTGFzemxvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
