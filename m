Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5021952
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 15:45:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRd8y-0005Q5-8Y; Fri, 17 May 2019 13:43:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dmq+=TR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRd8w-0005Q0-KM
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 13:43:26 +0000
X-Inumbo-ID: bd8b0c7f-78a9-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd8b0c7f-78a9-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 13:43:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 152CDADC1;
 Fri, 17 May 2019 13:43:23 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
 <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
 <d46ce182-44e5-dab8-37ae-a9e920120e5f@suse.com>
 <5CDEB8C102000078002301DE@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ca52e3bf-2e9a-1b1e-f079-be72bc4a242d@suse.com>
Date: Fri, 17 May 2019 15:43:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDEB8C102000078002301DE@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Ping: [PATCH] xen/sched: fix csched2_deinit_pdata()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDUvMjAxOSAxNTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTcuMDUuMTkg
YXQgMTU6MjQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAxNy8wNS8yMDE5IDE1OjE3
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA4LjA1LjE5IGF0IDEzOjMxLCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBDb21taXQgNzUzYmE0M2Q2ZDE2ZTY4OCAoInhlbi9zY2hl
ZDogZml4IGNyZWRpdDIgc210IGlkbGUgaGFuZGxpbmciKQo+Pj4+IGludHJvZHVjZWQgYSByZWdy
ZXNzaW9uIHdoZW4gc3dpdGNoaW5nIGNwdXMgYmV0d2VlbiBjcHVwb29scy4KPj4+Pgo+Pj4+IFdo
ZW4gYXNzaWduaW5nIGEgY3B1IHRvIGEgY3B1cG9vbCB3aXRoIGNyZWRpdDIgYmVpbmcgdGhlIGRl
ZmF1bHQKPj4+PiBzY2hlZHVsZXIgY3NjaGVkMl9kZWluaXRfcGRhdGEoKSBpcyBjYWxsZWQgZm9y
IHRoZSBjcmVkaXQyIHByaXZhdGUgZGF0YQo+Pj4+IGFmdGVyIHRoZSBuZXcgc2NoZWR1bGVyJ3Mg
cHJpdmF0ZSBkYXRhIGhhcyBiZWVuIGhvb2tlZCB0byB0aGUgcGVyLWNwdQo+Pj4+IHNjaGVkdWxl
ciBkYXRhLiBVbmZvcnR1bmF0ZWx5IGNzY2hlZDJfZGVpbml0X3BkYXRhKCkgd2lsbCBjeWNsZSB0
aHJvdWdoCj4+Pj4gYWxsIHBlci1jcHUgc2NoZWR1bGVyIGFyZWFzIGl0IGtub3dzIG9mIGZvciBy
ZW1vdmluZyB0aGUgY3B1IGZyb20gdGhlCj4+Pj4gcmVzcGVjdGl2ZSBzaWJsaW5nIG1hc2tzIGlu
Y2x1ZGluZyB0aGUgYXJlYSBvZiB0aGUganVzdCBtb3ZlZCBjcHUuIFRoaXMKPj4+PiB3aWxsIChk
ZXBlbmRpbmcgb24gdGhlIG5ldyBzY2hlZHVsZXIpIGVpdGhlciBjbG9iYmVyIHRoZSBkYXRhIG9m
IHRoZQo+Pj4+IG5ldyBzY2hlZHVsZXIgb3IgaW4gY2FzZSBvZiBzY2hlZF9ydCBsZWFkIHRvIGEg
Y3Jhc2guCj4+Pj4KPj4+PiBBdm9pZCB0aGF0IGJ5IHJlbW92aW5nIHRoZSBjcHUgZnJvbSB0aGUg
bGlzdCBvZiBhY3RpdmUgY3B1cyBpbiBjcmVkaXQyCj4+Pj4gZGF0YSBmaXJzdC4KPj4+Pgo+Pj4+
IFRoZSBvcHBvc2l0ZSBwcm9ibGVtIGlzIG9jY3VycmluZyB3aGVuIHJlbW92aW5nIGEgY3B1IGZy
b20gYSBjcHVwb29sOgo+Pj4+IGluaXRfcGRhdGEoKSBvZiBjcmVkaXQyIHdpbGwgYWNjZXNzIHRo
ZSBwZXItY3B1IGRhdGEgb2YgdGhlIG9sZAo+Pj4+IHNjaGVkdWxlci4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+Cj4+PiBNYXkgSSBh
c2sgd2hhdCB0aGUgZGlzcG9zaXRpb24gb2YgdGhpcyBpcz8gSSd2ZSBub3RpY2VkIHRvbyBsYXRl
Cj4+PiB0aGF0IEkndmUgYmFja3BvcnRlZCB0aGUgY29tbWl0IGJlaW5nIGZpeGVkIGhlcmUgd2l0
aG91dAo+Pj4gd2FpdGluZyBmb3IgdGhpcyBmaXggdG8gZ28gaW4uIEknZCBwcmVmZXIgdGhlIHN0
YWJsZSB0cmVlcywgaW4KPj4+IHBhcnRpY3VsYXIgNC4xMSBmb3IgdGhlIGltcGVuZGluZyA0LjEx
LjIgcmVsZWFzZSwgdG8gYmUgYWJsZQo+Pj4gdG8gcGljayB0aGlzIHVwIHNvb24uCj4+Cj4+IERh
cmlvIGFscmVhZHkgZ2F2ZSBoaXMgUmV2aWV3ZWQtYnk6Cj4gCj4gT2gsIG15IGZhdWx0IHRoZW4g
LSBhcG9sb2dpZXMuCgpOUC4gSW4gY2FzZSB5b3UgbmVlZCB0aGUgcG9pbnRlcjoKCmh0dHBzOi8v
bGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21zZzAwNzM0Lmh0
bWwKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
