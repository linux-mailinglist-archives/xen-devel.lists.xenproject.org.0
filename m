Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5A116A83
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:06:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFtA-00060v-6h; Mon, 09 Dec 2019 10:03:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0zrz=Z7=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1ieFt8-00060q-Pj
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:03:34 +0000
X-Inumbo-ID: 2851e0fc-1a6b-11ea-87b5-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2851e0fc-1a6b-11ea-87b5-12813bfff9fa;
 Mon, 09 Dec 2019 10:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=nBaeKvF19RC1p9Y+VNTV6yTu9tg80OEYcBODw7vlZ5M=;
 b=KTerDmaC2ex16s1RHUy/TPzDfnBfLxlYt+IT3hl2bsc3cFqtMgBSxG9zF61c64JziIPIDH
 Gr8UxQv5Mx5pggpNhx+gg4Gj4+/qhg+FXjz+0T60VZ7GK4HEJG9mVvVHQLyuyJl9rYgh+2
 GbyVuUGc8//7IEdFKJaDwiLpdsXtuAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-LedRWQ_UNJmQeERFmn_F2w-1; Mon, 09 Dec 2019 05:03:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0694618557C2;
 Mon,  9 Dec 2019 10:03:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43DBA5D6C5;
 Mon,  9 Dec 2019 10:03:20 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <52a50b12-2699-6e4c-50f7-628d6a80247e@redhat.com>
Date: Mon, 9 Dec 2019 11:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209095002.32194-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: LedRWQ_UNJmQeERFmn_F2w-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 2/6] hw/pci-host/i440fx: Extract
 PCII440FXState to "hw/pci-host/i440fx.h"
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
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMjAxOSAxMC40OSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gTWFr
ZSB0aGUgUENJSTQ0MEZYU3RhdGUgc3RydWN0dXJlIHB1YmxpYywgc28gaXQgY2FuIGJlIHVzZWQg
b3V0IG9mCj4gdGhpcyBzb3VyY2UgZmlsZS4gVGhpcyB3aWxsIGFsbG93IHVzIHRvIGV4dHJhY3Qg
dGhlIElHRCBQYXNzdGhyb3VnaAo+IEhvc3QgQnJpZGdlLCB3aGljaCBpcyBhIGNoaWxkcmVuIG9m
IHRoZSBUWVBFX0k0NDBGWF9QQ0lfREVWSUNFLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9ody9w
Y2ktaG9zdC9pNDQwZnguaCB8IDE5ICsrKysrKysrKysrKysrKysrLS0KPiAgaHcvcGNpLWhvc3Qv
aTQ0MGZ4LmMgICAgICAgICB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFRob21h
cyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
