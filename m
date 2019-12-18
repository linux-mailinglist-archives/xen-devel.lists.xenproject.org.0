Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A054124657
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:00:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXy7-00045r-De; Wed, 18 Dec 2019 11:58:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aLVj=2I=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1ihXy5-00045Z-Gp
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:58:17 +0000
X-Inumbo-ID: a60acfb2-218d-11ea-a1e1-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.126.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a60acfb2-218d-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 11:58:05 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mati7-1i61YI3hf9-00cQ3R; Wed, 18 Dec 2019 12:58:02 +0100
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-4-philmd@redhat.com>
 <a4745134-47dc-ab8a-6009-69fcc9dfbb02@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <46339299-e45b-79a3-5b45-f62fb5c7b26f@vivier.eu>
Date: Wed, 18 Dec 2019 12:57:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a4745134-47dc-ab8a-6009-69fcc9dfbb02@redhat.com>
Content-Language: fr
X-Provags-ID: V03:K1:AR6rLL9OUaLXBSge+Ysq2JK5B3pRs3+5iqxqYL3rgqs4SMPQKEC
 5Wtg/deGODcWz12bGNdUSKtFdYrtpBikaQFwowetjIKj/0mEc/74p2pDNqVVlE+S0gF2o4t
 o/Re3Pq4v31Rr8lDkXoB4KvnJzCwm8YaNSCRuNCbX0XyDJ5axLG+4GhOGeFM/TDV93POT+9
 Se99TpCxYgyxsbFMDwc/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PrIx85r8kCU=:JOjNJQv7MZR4KSDeQnsdNP
 IKZYZNnV01s8cJ3LcfPJXbVyDQNAiEIMDAmgFzltNH3FLFgAqB9AJrkseajKo2qRSVWyKKPcK
 IdMmuXjU2ie3H2/VeWdjiDM23jMJexiplzjOT6ZgyzMTeenYEgLr92eoNkc3ZEYEeLuOYurEO
 mHmcenHLykBu3LFP0EeoVKUbnSiBOgE/knidEtgIpmxGGoYOA5RSEKAg8U94rXsrdzmkEo7yZ
 AtDjGty9rOrT35UxOD6E3/xnAmF1cdKOnUH8ru6qDpNOr3sygBBPSwwZfn0Qx5wBp19VOST2x
 tOkzb/HDqLmb1LJimWvLo9tqB6IvJfaues1RxUW2KSw4jh4XbyR3+wCj2p2SMtsggQ6h1EBI3
 CGOGMrMFc33Zp++AeY0X3uirIxmyS6dxHxbIdpP22/Mk7Uvqyx4dzDO7fGfHgiwMzeGgmN/Ks
 UXQyTI4yY5kXiax4lKuQEMHylT9dDj5kD+Ku+E8+dhPq1yBkmy0mqgT09p7ILYaLhBcerc+tP
 2aVzUmeHww2ECE8aiCtQF7r/K20qCMZB84aRSBw/7m92hhQImJlauckWvsrLrTeSBzlwTukKj
 Rk/08ziwGHpZcn1EDm2CN+BS9VJ7tcBZxQ6xmHsJuLkpWMJyfr0Tu+AVJZE+Lp07ZlZ6iEVSH
 BAsvbIgncO8zka2dWEbMIMtK72LbQ/gmt+k8UfgLJgeW4pkWTx8EbaWyPSIFlQ362oX2P1TTH
 Bp0+FDOCyTEBt9cWZlIJfTXJ6FssPTrZUHBsNXkYeU2juEOB4Dlj9dkbnS/7lkq8Fj2LZL5ee
 G03JwhBsCHB/7rJ5rrp64z9HbottFHy6lTz6G7y3AUNDci+NKLTaFNJIyL3RuApVMQ5MBDUXI
 quP+dJagzZT1lvyJJ40qYn/bwg1lHfiLgp8FCTdFI=
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 3/6] hw/pci-host/i440fx: Use
 size_t to iterate over ARRAY_SIZE()
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

TGUgMDkvMTIvMjAxOSDDoCAxMTowNSwgVGhvbWFzIEh1dGggYSDDqWNyaXTCoDoKPiBPbiAwOS8x
Mi8yMDE5IDEwLjQ5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4gV2UgZG9uJ3Qg
ZW5mb3JjZSB0aGUgLVdzaWduLWNvbnZlcnNpb24gQ1BQRkxBRywgYnV0IGl0IGRvZXNuJ3QgaHVy
dAo+PiB0byBhdm9pZCB0aGlzIHdhcm5pbmc6Cj4+Cj4+ICAgd2FybmluZzogaW1wbGljaXQgY29u
dmVyc2lvbiBjaGFuZ2VzIHNpZ25lZG5lc3M6ICdpbnQnIHRvICdzaXplX3QnIChha2EgJ3Vuc2ln
bmVkIGxvbmcnKSBbLVdzaWduLWNvbnZlcnNpb25dCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICBody9wY2kt
aG9zdC9pNDQwZnguYyB8IDUgKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9pNDQwZngu
YyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCj4+IGluZGV4IGZiZGM1NjM1OTkuLjBjYzgwYjI3NmQg
MTAwNjQ0Cj4+IC0tLSBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jCj4+ICsrKyBiL2h3L3BjaS1ob3N0
L2k0NDBmeC5jCj4+IEBAIC00MTksMTIgKzQxOSwxMSBAQCBvdXQ6Cj4+ICBzdGF0aWMgdm9pZCBp
Z2RfcHRfaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpwY2lfZGV2LCBFcnJvciAqKmVycnApCj4+
ICB7Cj4+ICAgICAgdWludDMyX3QgdmFsID0gMDsKPj4gLSAgICBpbnQgaSwgbnVtOwo+PiArICAg
IHNpemVfdCBpOwo+PiAgICAgIGludCBwb3MsIGxlbjsKPj4gICAgICBFcnJvciAqbG9jYWxfZXJy
ID0gTlVMTDsKPj4gIAo+PiAtICAgIG51bSA9IEFSUkFZX1NJWkUoaWdkX2hvc3RfYnJpZGdlX2lu
Zm9zKTsKPj4gLSAgICBmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPj4gKyAgICBmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShpZ2RfaG9zdF9icmlkZ2VfaW5mb3MpOyBpKyspIHsKPj4gICAg
ICAgICAgcG9zID0gaWdkX2hvc3RfYnJpZGdlX2luZm9zW2ldLm9mZnNldDsKPj4gICAgICAgICAg
bGVuID0gaWdkX2hvc3RfYnJpZGdlX2luZm9zW2ldLmxlbjsKPj4gICAgICAgICAgaG9zdF9wY2lf
Y29uZmlnX3JlYWQocG9zLCBsZW4sICZ2YWwsICZsb2NhbF9lcnIpOwo+Pgo+IAo+IFJldmlld2Vk
LWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KPiAKPiAKCkFwcGxpZWQgdG8gbXkg
dHJpdmlhbC1wYXRjaGVzIGJyYW5jaC4KClRoYW5rcywKTGF1cmVudAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
