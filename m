Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA2165E7B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:16:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lds-0003nx-7Z; Thu, 20 Feb 2020 13:13:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nI7P=4I=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1j4ldq-0003np-Ds
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:13:22 +0000
X-Inumbo-ID: c4bd2e46-53e2-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4bd2e46-53e2-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxRd66hXArnDbqmniqlydJMWajYnS/NgIxGrt3Sj5ig=;
 b=VInr9iyAdvt/6Uqm/v32uc8CwI86p+6rJAWD/42LNgxxivD7lO3HNIFnC0zBjiuxzIE9/F
 0j8FM5HRwk83SBmlVpN7DXBGB98or2TWCFt/qLQ/a4T0D45kblFKXuWhQK0J9zLHthpmGm
 C9px4Ptabw3PMmf+TGljZhmpdotIIb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-AEN5JunrODynT6AfB31ueA-1; Thu, 20 Feb 2020 08:13:12 -0500
X-MC-Unique: AEN5JunrODynT6AfB31ueA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D02CDBA5;
 Thu, 20 Feb 2020 13:13:08 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F2C61001B2C;
 Thu, 20 Feb 2020 13:12:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6100c5a0-b6a7-4c8c-4284-6387de26690c@redhat.com>
Date: Thu, 20 Feb 2020 07:12:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220130548.29974-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: Re: [Xen-devel] [PATCH v3 01/20] scripts/git.orderfile: Display
 Cocci scripts before code modifications
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8yMC8yMCA3OjA1IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPiBXaGVu
IHdlIHVzZSBhIENvY2NpbmVsbGUgc2VtYW50aWMgc2NyaXB0IHRvIGRvIGF1dG9tYXRpYwo+IGNv
ZGUgbW9kaWZpY2F0aW9ucywgaXQgbWFrZXMgc2Vuc2UgdG8gbG9vayBhdCB0aGUgc2VtYW50aWMK
PiBwYXRjaCBmaXJzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBzY3JpcHRzL2dpdC5vcmRlcmZpbGUgfCAz
ICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IEVy
aWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgoKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9n
aXQub3JkZXJmaWxlIGIvc2NyaXB0cy9naXQub3JkZXJmaWxlCj4gaW5kZXggMWY3NDdiNTgzYS4u
N2NmMjJlMGJmNSAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL2dpdC5vcmRlcmZpbGUKPiArKysgYi9z
Y3JpcHRzL2dpdC5vcmRlcmZpbGUKPiBAQCAtMjIsNiArMjIsOSBAQCBNYWtlZmlsZSoKPiAgIHFh
cGkvKi5qc29uCj4gICBxZ2EvKi5qc29uCj4gICAKPiArIyBzZW1hbnRpYyBwYXRjaGVzCj4gKyou
Y29jY2kKPiArCj4gICAjIGhlYWRlcnMKPiAgICouaAo+ICAgCj4gCgotLSAKRXJpYyBCbGFrZSwg
UHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkx
OS0zMDEtMzIyNgpWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
