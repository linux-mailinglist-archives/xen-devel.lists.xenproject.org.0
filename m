Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62912465C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:01:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXxs-00043V-12; Wed, 18 Dec 2019 11:58:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aLVj=2I=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1ihXxq-00043Q-NC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:58:02 +0000
X-Inumbo-ID: a406ecfa-218d-11ea-9066-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a406ecfa-218d-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 11:58:02 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJVU0-1iNpDq0RSK-00Jo1O; Wed, 18 Dec 2019 12:57:58 +0100
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-2-philmd@redhat.com>
 <12e7069c-46f0-ae9f-4e1f-70f0b8318180@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0d11898c-d3b6-97a7-26d5-f71d5dc9e915@vivier.eu>
Date: Wed, 18 Dec 2019 12:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <12e7069c-46f0-ae9f-4e1f-70f0b8318180@redhat.com>
Content-Language: fr
X-Provags-ID: V03:K1:JNYvr0dF2iVjZPMM774y5p0XG32vbIXHKAwm9OVCJU4ZBvtFysh
 QNUXzjCkaQRKzA05is2I1+WD7k8MNmRa4y1Ckj5jvvx7Qf/2BlQQibq5S7vbEQeahhQH9xV
 AAHHV1J+4JGgV+GlB1CJ16XgWV8R0LSwE7OfXK0FCd4udYulqWvv1Kcn/FuyOQcE5sBLS8H
 13/eNnPFPGCJf3m48EYqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QCyaQd4Nwmo=:atB3YLjPnnoe58+SpaAwht
 DjodQlVdGgk//mH2QEQKLDCbSNPq8fdZw292BjhYyMbwkQ/8U2EWQxR9X+Tmyv9RUflbSqmNA
 Co9r93f29PwyHLFMCw8XvNlsLLRkKVpSQqak4doi+oFgvrQ8b3347FCyLic+OcDA61QNI91/h
 e3aXENGrOPgXgCHrh02EmDZDAf0rVhSWLSV5LW7YZIaKu1HTTJN9ieiGKNz9hfLQz8iX17LO3
 h+FQvHj0tB3cHOOKbon3wrwIrbD2pilDk2ZGA1yRLJlN8rIpISPC1mWETzvasO4lzvz01/+nQ
 GzvQha08p65NeoaUF7SPey9WaCikg40AoroZ/0PgNkZotDo/Mz0MjiXFM3HCzUDNmVehQfeDS
 0iILfuRV60CNIhMBnjAFgYB4ITAU8tRm/w3HwPmvZgBLyr+hKjoVmUSNprVTfcWMR3xpzO52d
 ovCr+QYCsIzRUi/gb6NnfmOqwFaduLJJQkjMe5Bif3w32r0X5RI3etoMBEysJBNtHgVkjfW2h
 uXyO78zyXdqSSwJCzFlvWSOUnG4R3VKTxkDfE6KKymKs0upoYP/020P1ChrBwbdVsV2eRBl8s
 Si1aHGOjLxDLSH430Q9zdFhtmRPZiRPX2Mnzz66cxCUwaargFOfcUSRCYom3Dm0i7j9STjuzm
 +Pp5Spvx3h65ldXPVNRC1WF/nFVXtEljYJO9blaml59vox1J5fy326274QD+5ly21ErzVOKyj
 c6cDfeyqBz4er7VZGEPmmTHtK6kwoSWBfPr5De7CiGd9pHswmOY17gFyllW+MTVgRR8Q8DeQw
 rSaVZHGXHNB+0RFA2LHPGGTA/EfJes9GlpsKiM/cCywbrSvEaJXjeoRZJrLOnEbmMnIQkH+FH
 inJWy+gO5bO1wSL+AQ5A==
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMDkvMTIvMjAxOSDDoCAxMTowMiwgVGhvbWFzIEh1dGggYSDDqWNyaXTCoDoKPiBPbiAwOS8x
Mi8yMDE5IDEwLjQ5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4gTWlzc2VkIGR1
cmluZyB0aGUgcmVmYWN0b3IgaW4gY29tbWl0cyAxNGEwMjZkZDU4IGFuZCAwZjI1ZDg2NWEsCj4+
IHRoaXMgZmlsZSBpcyBub3cgb25seSBhYm91dCB0aGUgaTQ0MEZYIGNoaXBzZXQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4K
Pj4gLS0tCj4+ICBody9wY2ktaG9zdC9pNDQwZnguYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaHcvcGNp
LWhvc3QvaTQ0MGZ4LmMgYi9ody9wY2ktaG9zdC9pNDQwZnguYwo+PiBpbmRleCBmMjcxMzExMDJk
Li4zZmM5NDQyNmVhIDEwMDY0NAo+PiAtLS0gYS9ody9wY2ktaG9zdC9pNDQwZnguYwo+PiArKysg
Yi9ody9wY2ktaG9zdC9pNDQwZnguYwo+PiBAQCAtMSw1ICsxLDUgQEAKPj4gIC8qCj4+IC0gKiBR
RU1VIGk0NDBGWC9QSUlYMyBQQ0kgQnJpZGdlIEVtdWxhdGlvbgo+PiArICogUUVNVSBpNDQwRlgg
UENJIEJyaWRnZSBFbXVsYXRpb24KPj4gICAqCj4+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMDYgRmFi
cmljZSBCZWxsYXJkCj4+ICAgKgo+Pgo+IAo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1
dGhAcmVkaGF0LmNvbT4KPiAKPiAKCkFwcGxpZWQgdG8gbXkgdHJpdmlhbC1wYXRjaGVzIGJyYW5j
aC4KClRoYW5rcywKTGF1cmVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
