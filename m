Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795CD116A7D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:04:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFs0-0005wC-Rc; Mon, 09 Dec 2019 10:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0zrz=Z7=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1ieFry-0005w7-Tf
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:02:22 +0000
X-Inumbo-ID: fd873b4e-1a6a-11ea-87b5-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fd873b4e-1a6a-11ea-87b5-12813bfff9fa;
 Mon, 09 Dec 2019 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=xxMmNC5FGITGyG1+6EhX9Q2cuRNo/kPIvv4PpcDRbsU=;
 b=ggGrZ2QhcPAB1KndCvB+1OXiD3REDMGaPU6VFxA8x5u76+wX0RP2TSlH99STWgASVTpkLF
 Tuawe1cilN83uj2YLrIyjYWSL864Rgf5TGtpiLAdosjt/chTaZuDd9Q5LWfkZgCDutxPTD
 jzNfhHvnQW8+4Vx+krNya50SWVvirA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-QjKFY9XyOeen4Q3QFgFomg-1; Mon, 09 Dec 2019 05:02:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78829800C78;
 Mon,  9 Dec 2019 10:02:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A0818231;
 Mon,  9 Dec 2019 10:02:02 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <12e7069c-46f0-ae9f-4e1f-70f0b8318180@redhat.com>
Date: Mon, 9 Dec 2019 11:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209095002.32194-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: QjKFY9XyOeen4Q3QFgFomg-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 1/6] hw/pci-host/i440fx: Correct
 the header description
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
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMjAxOSAxMC40OSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gTWlz
c2VkIGR1cmluZyB0aGUgcmVmYWN0b3IgaW4gY29tbWl0cyAxNGEwMjZkZDU4IGFuZCAwZjI1ZDg2
NWEsCj4gdGhpcyBmaWxlIGlzIG5vdyBvbmx5IGFib3V0IHRoZSBpNDQwRlggY2hpcHNldC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+Cj4gLS0tCj4gIGh3L3BjaS1ob3N0L2k0NDBmeC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvcGNp
LWhvc3QvaTQ0MGZ4LmMgYi9ody9wY2ktaG9zdC9pNDQwZnguYwo+IGluZGV4IGYyNzEzMTEwMmQu
LjNmYzk0NDI2ZWEgMTAwNjQ0Cj4gLS0tIGEvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMKPiArKysgYi9o
dy9wY2ktaG9zdC9pNDQwZnguYwo+IEBAIC0xLDUgKzEsNSBAQAo+ICAvKgo+IC0gKiBRRU1VIGk0
NDBGWC9QSUlYMyBQQ0kgQnJpZGdlIEVtdWxhdGlvbgo+ICsgKiBRRU1VIGk0NDBGWCBQQ0kgQnJp
ZGdlIEVtdWxhdGlvbgo+ICAgKgo+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMDYgRmFicmljZSBCZWxs
YXJkCj4gICAqCj4gCgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
