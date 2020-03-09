Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27F17DF3B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:00:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBH2s-0001Yd-Nc; Mon, 09 Mar 2020 11:58:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xrSX=42=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1jBH2r-0001YY-Cr
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:58:05 +0000
X-Inumbo-ID: 3b35ed9c-61fd-11ea-90c4-bc764e2007e4
Received: from mout.kundenserver.de (unknown [217.72.192.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b35ed9c-61fd-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 11:58:04 +0000 (UTC)
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkYkC-1jcJJt0bwE-00m51N; Mon, 09 Mar 2020 12:57:39 +0100
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
 <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
 <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
 <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <03b48649-0a19-80fd-88d2-6241e284f7af@vivier.eu>
Date: Mon, 9 Mar 2020 12:57:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
Content-Language: fr
X-Provags-ID: V03:K1:hw0IUu3amw8TetNO1ivmES2MS1pUP6jUBz/1S57ei78TgyBpZu5
 BybeLBWx2rLDxktiNDNlAbNbCFCWWHORTuzm08z9R1s4GvklfvRu/KnIAOSxRHc/WNH6xRV
 SGQUfob/nimb+IvN6H9VJ+dWYp42uKtz+5+G+pNyHnYOtDs0THWLmHlx2g/rSbbjmvwK2RZ
 dpXdH7XKDoySSv7ikwQhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QBn88ySfXdg=:+TDsBMIs+q38J4/rwQ+WFk
 Jq7YhVun69Y0ym2zCri/WxN0LmtO+0HXgwrEz3CbFub/lP2vdxzYCMEl+prybIxUvFbc77lX5
 08LSScHDyBvDmiYm8t+y6B8gsm1WRKEQaU0gPdv2L+g4UZfizxhmxxN0o1aOpLHw45n2IILid
 FvLZkFtYDx3z6RqXH1g5ATvKKsTtqBs9ZbTUAYoKaNC63ibDF5Cxv/7ndG+E1VZWmiHhECNb4
 ZOtVwLCHHXrSUZSi/UA+FdUz70BX0CF5sHuvph/iWM1AGME+QBaXCca4eYyWCgUvvWFnQW3Q8
 6/L0JuWrsxigbG9bypnfKrl8UrLTMKEYLbl8+2zUDySKYA2FpeZCFfafRnLYcW1wFSu0vgQst
 LOeB9dgJfitEa9r/WwZczgEAki+ldc2KfWvNidBg0+HyEZLWYZ8KTu0ARTKbXOLyD/rfSZONE
 46UKdV7ondDpYnAUQBj33k0cZFnpPFBq+pUPCUvqdgLPLKaIVbA9iHcFdd0uJyYnHXvS1wVNY
 zro0Zex1Gipl9km4IDZ0lm1SffzDW1rDGydTG1j3rAl8e57kegIvo9lLwaeIQ7+/H70MQFeN7
 YW8FGOzMjNr/1czdYsyMjf+6OwtvRG+CNsIDMAZ2E5tcrIET5LoYtNj6V6lNTaKpWpnfAduQA
 OqNl5bzPuworqIhuphLaO99ephIbU0g9TG9hOES9DZ7LjD4J3p1UQ/LMkqf9Tu/uDwBsmURUY
 LGDmlIaENf3Ub+y9mwwAafGvNLNy4aUpXjVkKGz1F6SvXQs8u6azx/ZqeAPkcH2NYI05aRIE3
 aSzZppTSC0VQZbgW5DdgxS5hlIKiObonK09rcKS8ZhTFwjI/o+3hT7VnoM3YWgxxGpLKRmE
Subject: Re: [Xen-devel] [PATCH 00/20] hw: Clean up hw/i386 headers (and few
 alpha/hppa)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMjcvMDIvMjAyMCDDoCAxNDoyOCwgUGFvbG8gQm9uemluaSBhIMOpY3JpdMKgOgo+IE9uIDI2
LzEwLzE5IDE1OjMyLCBMYXVyZW50IFZpdmllciB3cm90ZToKPj4gTGUgMjYvMTAvMjAxOSDDoCAx
NDoyMCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgYSDDqWNyaXTCoDoKPj4+IEhpLAo+Pj4KPj4+
IE9uIDEwLzE0LzE5IDQ6MjIgUE0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+Pj4+
IFRoaXMgaXMgYSBmb2xsb3ctdXAgb2YgTWFya3VzJ3MgY2xlYW51cCBzZXJpZXM6Cj4+Pj4gVGFt
ZSBhIGZldyAidG91Y2ggdGhpcywgcmVjb21waWxlIHRoZSB3b3JsZCIKPj4+PiBodHRwczovL3d3
dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c2MzU3NDguaHRtbAo+
Pj4+Cj4+Pj4gVGhpcyBwYXJ0IGlzIG1vc3RseSByZXN0cmljdGVkIHRvIFg4NiwgYnV0IHNpbmNl
IHNvbWUgZmlsZSBmcm9tIHRoZQo+Pj4+IEFscGhhL1BBLVJJU0MgbWFjaGluZXMgaW5jbHVkZSAi
aHcvaTM4Ni9wYy5oIiBJIGhhZCB0byBmaXggdGhlbQo+Pj4+IHRvby4KPj4+Pgo+Pj4+IEV2ZW50
dWFsbHkgSSdsbCBzdWNjZWVkIGF0IHJlbW92aW5nIGh3L2kzODYvIGRlcGVuZGVuY3kgb24gbm9u
LVg4Ngo+Pj4+IHBsYXRmb3JtcyAoUXVlc3QgSSBzdGFydGVkIDIgeWVhcnMgYWdvLi4uKS4KPj4+
Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4KPj4+PiBQaGlsLgo+Pj4+Cj4+Pj4gUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgKDIwKToKPj4+PiDCoMKgIHZsOiBBZGQgbWlzc2luZyAiaHcvYm9hcmRzLmgiIGlu
Y2x1ZGUKPj4+PiDCoMKgIGh3L3NvdXRoYnJpZGdlL2ljaDk6IFJlbW92ZWQgdW51c2VkIGhlYWRl
cnMKPj4+PiDCoMKgIGh3L2lucHV0L3Bja2JkOiBSZW1vdmUgdW51c2VkICJody9pMzg2L3BjLmgi
IGhlYWRlcgo+Pj4+IMKgwqAgaHcvaTM4Ni9pb2FwaWNfaW50ZXJuYWw6IFJlbW92ZSB1bnVzZWQg
Imh3L2kzODYvaW9hcGljLmgiIGhlYWRlcgo+Pj4+IMKgwqAgaHcvdGltZXI6IFJlbW92ZSB1bnVz
ZWQgInVpL2NvbnNvbGUuaCIgaGVhZGVyCj4+Pj4gwqDCoCBody91c2IvZGV2LXN0b3JhZ2U6IFJl
bW92ZSB1bnVzZWQgInVpL2NvbnNvbGUuaCIgaGVhZGVyCj4+Pj4gwqDCoCBody9pMzg2L2ludGVs
X2lvbW11OiBSZW1vdmUgdW51c2VkIGluY2x1ZGVzCj4+Pj4gwqDCoCBody94ZW4veGVuX3B0X2xv
YWRfcm9tOiBSZW1vdmUgdW51c2VkIGluY2x1ZGVzCj4+Pj4gwqDCoCBody9hbHBoYS9hbHBoYV9z
eXM6IFJlbW92ZSB1bnVzZWQgImh3L2lkZS5oIiBoZWFkZXIKPj4+PiDCoMKgIGh3L2FscGhhL2Rw
MjY0OiBJbmNsdWRlICJuZXQvbmV0LmgiCj4+Pj4gwqDCoCBody9ocHBhL21hY2hpbmU6IEluY2x1
ZGUgIm5ldC9uZXQuaCIKPj4+PiDCoMKgIGh3L2FjcGkvY3B1X2hvdHBsdWc6IEluY2x1ZGUgImh3
L3BjaS9wY2kuaCIKPj4+PiDCoMKgIGh3L3RpbWVyL2hwZXQ6IEluY2x1ZGUgImV4ZWMvYWRkcmVz
cy1zcGFjZXMuaCIKPj4+PiDCoMKgIGh3L3BjaS1ob3N0L3EzNTogSW5jbHVkZSAicWVtdS9yYW5n
ZS5oIgo+Pj4+IMKgwqAgaHcvaTJjL3NtYnVzX2ljaDk6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIK
Pj4+PiDCoMKgIGh3L3BjaS1ob3N0L3BpaXg6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIKPj4+PiDC
oMKgIGh3L2FjcGk6IEluY2x1ZGUgImh3L21lbS9udmRpbW0uaCIKPj4+PiDCoMKgIGh3L2kzODY6
IEluY2x1ZGUgImh3L21lbS9udmRpbW0uaCIKPj4+PiDCoMKgIGh3L3BjaS1ob3N0L3EzNTogUmVt
b3ZlIHVudXNlZCBpbmNsdWRlcwo+Pj4+IMKgwqAgaHcvaTM4Ni9wYzogQ2xlYW4gdXAgaW5jbHVk
ZXMKPj4+IExhdXJlbnQsIHNpbmNlIHRoaXMgc2VyaWVzIGlzIGZ1bGx5IHJldmlld2VkLCBjYW4g
aXQgZ28gdmlhCj4+PiB5b3VyIHFlbXUtdHJpdmlhbCB0cmVlPwo+Pgo+PiBJJ2xsIHRyeSBidXQg
SSdtIG5vdCBzdXJlIHRvIGhhdmUgdGhlIHRpbWUgdG8gZG8gdGhhdCBiZWZvcmUgdGhlIHNvZnRm
cmVlemUuCj4gCj4gUGluZyA6KQoKQXBwbGllZCB2MiB0byBteSB0cml2aWFsLXBhdGNoZXMgYnJh
bmNoLgoKVGhhbmtzLApMYXVyZW50CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
