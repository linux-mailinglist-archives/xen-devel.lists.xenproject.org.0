Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F5E5D5B
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 15:36:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOMCC-0008W4-1l; Sat, 26 Oct 2019 13:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUhD=YT=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iOMCA-0008Vz-MH
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 13:33:30 +0000
X-Inumbo-ID: 31f836e4-f7f5-11e9-beca-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.17.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31f836e4-f7f5-11e9-beca-bc764e2007e4;
 Sat, 26 Oct 2019 13:33:29 +0000 (UTC)
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKKd7-1ihnwh12sx-00LjPm; Sat, 26 Oct 2019 15:33:00 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191014142246.4538-1-philmd@redhat.com>
 <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
Date: Sat, 26 Oct 2019 15:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
Content-Language: fr
X-Provags-ID: V03:K1:AfH0JSrsQ7+6IREPNux+I86yleQstGdiOfFgdWcmW2iM6kTzKqX
 yN7J5lA/ATJjarOqxxXxi5jhpSy/ZYVjR2d/86Q+vY2ucFsLNVIzm3nygeLzru3JcOLmCSu
 TxqJgkXFuCSDjZ6HcaxdbTnf7n9yPzF9KCt3taj5KO6OI0FjZCXLnebanyi56/0K7LVE5VX
 cYSjjTQfVEevHZPjrtcxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JB65cC2/0K4=:zubs51sgA7OgkzO1EQAX7T
 nwKJdGsUQE8/ZQJssjE84YDLY2EdPT8+y9bflYl/9fENMmt5wFFk3OEAPzDQDxfI9HZzK0cIe
 50WgreLUlatCyr0g27LwipmFSN5b+8D6sWt7DrTk3/KL7rkCGXDWb0sTeKbQccBQLucylT+3A
 zntPsfQS+RM8GErVuLUN/35mvag1Hcgk6C2rORlgdSL3LZXMaiPNlAkYo4lfnutYgAF3dB1xZ
 jEZt0UJqD595c9Ib08ZiKLnRqeOlikBQ7aZAr8O698nomuak811qEe/XlaAX+I5yN/oESkh9S
 BpcCztTKdBn524aoiRvwC5y2tZScdA9ya2zWR05wjBg6kv9GLQxR/FAfm+paNhBYTZ+tCWMom
 TzxDCgAbzrrwljLDhfTMfi9dbdPkRqFRbHYLHjHBp/lIWHZPIjAAUHS6O8vWbQFw+o9XgtV7x
 ILg/9rZ0IGEoc8PzdHYit50O2vFnD8LVRjcdAviB22G+2JyvlXjY9EgDwH+P7EmJuq01bUYC1
 B2bP1gq0wLThi/PK84NdPGpWG60i1NmGLIArxPpTMU7mx7LuYvci5BBGLP29vxbMZL3Vq7MQ5
 06RVgkyEvB0/xtiWeA5eOJRL/ssUiVv7NLdN5vwjLzRlgkWg2ac6136IURxQby/6BIFTekg3P
 ADrPZFD9JMmn/xvzHvIrPeU47ffrW50wzFT1TqFAltQ9P6o8At5GHrb976U1UcRZtdS+Z1vqN
 rSI9NNhLuFWBqbYZy/3yTkio9YSFIk19v6oXAJtURYPxPJnio5Ttr9wiydhrdM4fdubNneBd9
 1ClwCgTcxrz6HACpHqrySPSgC225f8iJysJSGNNXydoImJ8+EvhZQBrZ2TjOjAm87O+cOl8kb
 cuH21ROTQq4/0qUSrhJiqHJdjtHuEGIfvQEvDynNk=
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
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgMjYvMTAvMjAxOSDDoCAxNDoyMCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgYSDDqWNyaXTC
oDoKPiBIaSwKPiAKPiBPbiAxMC8xNC8xOSA0OjIyIFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToKPj4gVGhpcyBpcyBhIGZvbGxvdy11cCBvZiBNYXJrdXMncyBjbGVhbnVwIHNlcmll
czoKPj4gVGFtZSBhIGZldyAidG91Y2ggdGhpcywgcmVjb21waWxlIHRoZSB3b3JsZCIKPj4gaHR0
cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjM1NzQ4
Lmh0bWwKPj4KPj4gVGhpcyBwYXJ0IGlzIG1vc3RseSByZXN0cmljdGVkIHRvIFg4NiwgYnV0IHNp
bmNlIHNvbWUgZmlsZSBmcm9tIHRoZQo+PiBBbHBoYS9QQS1SSVNDIG1hY2hpbmVzIGluY2x1ZGUg
Imh3L2kzODYvcGMuaCIgSSBoYWQgdG8gZml4IHRoZW0KPj4gdG9vLgo+Pgo+PiBFdmVudHVhbGx5
IEknbGwgc3VjY2VlZCBhdCByZW1vdmluZyBody9pMzg2LyBkZXBlbmRlbmN5IG9uIG5vbi1YODYK
Pj4gcGxhdGZvcm1zIChRdWVzdCBJIHN0YXJ0ZWQgMiB5ZWFycyBhZ28uLi4pLgo+Pgo+PiBSZWdh
cmRzLAo+Pgo+PiBQaGlsLgo+Pgo+PiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoMjApOgo+PiDC
oMKgIHZsOiBBZGQgbWlzc2luZyAiaHcvYm9hcmRzLmgiIGluY2x1ZGUKPj4gwqDCoCBody9zb3V0
aGJyaWRnZS9pY2g5OiBSZW1vdmVkIHVudXNlZCBoZWFkZXJzCj4+IMKgwqAgaHcvaW5wdXQvcGNr
YmQ6IFJlbW92ZSB1bnVzZWQgImh3L2kzODYvcGMuaCIgaGVhZGVyCj4+IMKgwqAgaHcvaTM4Ni9p
b2FwaWNfaW50ZXJuYWw6IFJlbW92ZSB1bnVzZWQgImh3L2kzODYvaW9hcGljLmgiIGhlYWRlcgo+
PiDCoMKgIGh3L3RpbWVyOiBSZW1vdmUgdW51c2VkICJ1aS9jb25zb2xlLmgiIGhlYWRlcgo+PiDC
oMKgIGh3L3VzYi9kZXYtc3RvcmFnZTogUmVtb3ZlIHVudXNlZCAidWkvY29uc29sZS5oIiBoZWFk
ZXIKPj4gwqDCoCBody9pMzg2L2ludGVsX2lvbW11OiBSZW1vdmUgdW51c2VkIGluY2x1ZGVzCj4+
IMKgwqAgaHcveGVuL3hlbl9wdF9sb2FkX3JvbTogUmVtb3ZlIHVudXNlZCBpbmNsdWRlcwo+PiDC
oMKgIGh3L2FscGhhL2FscGhhX3N5czogUmVtb3ZlIHVudXNlZCAiaHcvaWRlLmgiIGhlYWRlcgo+
PiDCoMKgIGh3L2FscGhhL2RwMjY0OiBJbmNsdWRlICJuZXQvbmV0LmgiCj4+IMKgwqAgaHcvaHBw
YS9tYWNoaW5lOiBJbmNsdWRlICJuZXQvbmV0LmgiCj4+IMKgwqAgaHcvYWNwaS9jcHVfaG90cGx1
ZzogSW5jbHVkZSAiaHcvcGNpL3BjaS5oIgo+PiDCoMKgIGh3L3RpbWVyL2hwZXQ6IEluY2x1ZGUg
ImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIKPj4gwqDCoCBody9wY2ktaG9zdC9xMzU6IEluY2x1ZGUg
InFlbXUvcmFuZ2UuaCIKPj4gwqDCoCBody9pMmMvc21idXNfaWNoOTogSW5jbHVkZSAicWVtdS9y
YW5nZS5oIgo+PiDCoMKgIGh3L3BjaS1ob3N0L3BpaXg6IEluY2x1ZGUgInFlbXUvcmFuZ2UuaCIK
Pj4gwqDCoCBody9hY3BpOiBJbmNsdWRlICJody9tZW0vbnZkaW1tLmgiCj4+IMKgwqAgaHcvaTM4
NjogSW5jbHVkZSAiaHcvbWVtL252ZGltbS5oIgo+PiDCoMKgIGh3L3BjaS1ob3N0L3EzNTogUmVt
b3ZlIHVudXNlZCBpbmNsdWRlcwo+PiDCoMKgIGh3L2kzODYvcGM6IENsZWFuIHVwIGluY2x1ZGVz
Cj4gTGF1cmVudCwgc2luY2UgdGhpcyBzZXJpZXMgaXMgZnVsbHkgcmV2aWV3ZWQsIGNhbiBpdCBn
byB2aWEKPiB5b3VyIHFlbXUtdHJpdmlhbCB0cmVlPwoKSSdsbCB0cnkgYnV0IEknbSBub3Qgc3Vy
ZSB0byBoYXZlIHRoZSB0aW1lIHRvIGRvIHRoYXQgYmVmb3JlIHRoZSBzb2Z0ZnJlZXplLgoKVGhh
bmtzLApMYXVyZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
