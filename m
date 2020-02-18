Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F3162F34
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 20:02:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j485T-0002Ph-NX; Tue, 18 Feb 2020 18:59:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xyDT=4G=weilnetz.de=sw@srs-us1.protection.inumbo.net>)
 id 1j485S-0002Pc-IW
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 18:59:14 +0000
X-Inumbo-ID: bfc2e196-5280-11ea-8229-12813bfff9fa
Received: from v2201612906741603.powersrv.de (unknown [37.120.169.71])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfc2e196-5280-11ea-8229-12813bfff9fa;
 Tue, 18 Feb 2020 18:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 37C52DB80E2;
 Tue, 18 Feb 2020 19:59:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 8Ju_kkFJxhiF; Tue, 18 Feb 2020 19:59:09 +0100 (CET)
Received: from macbook02.fritz.box (p57B42574.dip0.t-ipconnect.de
 [87.180.37.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 21A18DB80E1;
 Tue, 18 Feb 2020 19:59:09 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
 <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Autocrypt: addr=sw@weilnetz.de; keydata=
 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
Message-ID: <eed26f29-6cbd-7663-7f30-39596bb70422@weilnetz.de>
Date: Tue, 18 Feb 2020 19:59:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gMTguMDIuMjAgdW0gMTk6NDkgc2NocmllYiBQZXRlciBNYXlkZWxsOgoKPiBJIHRoaW5rIHRo
YXQgd2Ugc2hvdWxkIGZpeCB0aGUgaW5jb25zaXN0ZW5jeSB3aGVyZSB0aGVzZSBmdW5jdGlvbnMK
PiBhbGwgdGFrZSAidWludDhfdCogYnVmIjoKPgo+ICAtIGFkZHJlc3Nfc3BhY2VfcncoKQo+ICAt
IGFkZHJlc3Nfc3BhY2VfcmVhZCgpCj4gIC0gYWRkcmVzc19zcGFjZV93cml0ZSgpCj4gIC0gYWRk
cmVzc19zcGFjZV93cml0ZV9yb20oKQo+ICAtIGNwdV9waHlzaWNhbF9tZW1vcnlfcncoKQo+ICAt
IGNwdV9tZW1vcnlfcndfZGVidWcoKQo+Cj4gYnV0IHRoZXNlIHRha2Ugdm9pZCo6Cj4gIC0gY3B1
X3BoeXNpY2FsX21lbW9yeV9yZWFkKCkKPiAgLSBjcHVfcGh5c2ljYWxfbWVtb3J5X3dyaXRlKCkK
PiAgLSBhZGRyZXNzX3NwYWNlX3dyaXRlX2NhY2hlZCgpCj4gIC0gYWRkcmVzc19zcGFjZV9yZWFk
X2NhY2hlZF9zbG93KCkKPiAgLSBhZGRyZXNzX3NwYWNlX3dyaXRlX2NhY2hlZF9zbG93KCkKPiAg
LSBwY2lfZG1hX3JlYWQoKQo+ICAtIHBjaV9kbWFfd3JpdGUoKQo+ICAtIHBjaV9kbWFfcncoKQo+
ICAtIGRtYV9tZW1vcnlfcmVhZCgpCj4gIC0gZG1hX21lbW9yeV93cml0ZSgpCj4gIC0gZG1hX21l
bW9yeV9ydygpCj4gIC0gZG1hX21lbW9yeV9yd19yZWxheGVkKCkKPgo+IERlcGVuZGluZyBvbiB3
aGljaCB3YXkgd2UgZ28gd2Ugd291bGQgZWl0aGVyIHdhbnQgdG8gcmVtb3ZlIHRoZXNlCj4gY2Fz
dHMsIG9yIG5vdC4KPgo+IEkgZ3Vlc3MgdGhhdCB3ZSBoYXZlIG1vcmUgY2FzZXMgb2YgJ3ZvaWQq
JywgYW5kIHRoYXQgd291bGQKPiBjZXJ0YWlubHkgYmUgdGhlIGVhc2llciB3YXkgdG8gY29udmVy
dCAob3RoZXJ3aXNlIHdlIHByb2JhYmx5Cj4gbmVlZCB0byBhZGQgYSBidW5jaCBvZiBuZXcgY2Fz
dHMgdG8gdWludDhfdCogaW4gdmFyaW91cyBjYWxsc2l0ZXMpLAo+IGJ1dCBJIGRvbid0IGhhdmUg
YSBzdHJvbmcgb3Bpbmlvbi4gUGFvbG8gPwo+Cj4gdGhhbmtzCj4gLS0gUE1NCgoKSW5kZWVkLCBm
aXhpbmcgc3VjaCBpbmNvbnNpdGVuY2llcyB3b3VsZCBiZSBnb29kLgoKUGVyc29uYWxseSBJIGxp
a2UgdGhlIHdheSBob3cgdGhlIHN0YW5kYXJkIEMgbGlicmFyeSBoYW5kbGVzIHN1Y2gKcG9pbnRl
cnMgZm9yIGZ1bmN0aW9ucyBsaWtlIG1lbWNweSwgZnJlYWQsIGZ3cml0ZSBhbmQgb3RoZXJzLgoK
VGhlcmVmb3JlIEkgc3VnZ2VzdCB0byB1c2UgYGNvbnN0IHZvaWQgKmAgYW5kIGB2b2lkICpgIGFu
ZCB0byBhdm9pZCB0eXBlCmNhc3RzLgoKUmVnYXJkcwpTdGVmYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
