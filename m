Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D34117FD6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 06:38:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieYCB-0004s8-GQ; Tue, 10 Dec 2019 05:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieYCA-0004s3-3I
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 05:36:26 +0000
X-Inumbo-ID: 00b7f4ba-1b0f-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00b7f4ba-1b0f-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 05:36:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24A7DAC5F;
 Tue, 10 Dec 2019 05:36:23 +0000 (UTC)
To: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>
References: <20191209201444.33243-1-natechancellor@gmail.com>
 <CAKwvOdmrGGn6f+XBOO3GCm-jVftLsFTUXdbhS9_iJVY03XqCjA@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fa48a214-7c12-9123-88d0-00e99359f335@suse.com>
Date: Tue, 10 Dec 2019 06:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmrGGn6f+XBOO3GCm-jVftLsFTUXdbhS9_iJVY03XqCjA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: Adjust indentation in
 xlvbd_alloc_gendisk
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMjI6MDcsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gT24gTW9uLCBEZWMg
OSwgMjAxOSBhdCAxMjoxNCBQTSBOYXRoYW4gQ2hhbmNlbGxvcgo+IDxuYXRlY2hhbmNlbGxvckBn
bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBDbGFuZyB3YXJuczoKPj4KPj4gLi4vZHJpdmVycy9ibG9j
ay94ZW4tYmxrZnJvbnQuYzoxMTE3OjQ6IHdhcm5pbmc6IG1pc2xlYWRpbmcgaW5kZW50YXRpb247
Cj4+IHN0YXRlbWVudCBpcyBub3QgcGFydCBvZiB0aGUgcHJldmlvdXMgJ2lmJyBbLVdtaXNsZWFk
aW5nLWluZGVudGF0aW9uXQo+PiAgICAgICAgICAgICAgICAgIG5yX3BhcnRzID0gUEFSVFNfUEVS
X0RJU0s7Cj4+ICAgICAgICAgICAgICAgICAgXgo+PiAuLi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtm
cm9udC5jOjExMTU6Mzogbm90ZTogcHJldmlvdXMgc3RhdGVtZW50IGlzIGhlcmUKPj4gICAgICAg
ICAgICAgICAgICBpZiAoZXJyKQo+PiAgICAgICAgICAgICAgICAgIF4KPj4KPj4gVGhpcyBpcyBi
ZWNhdXNlIHRoZXJlIGlzIGEgc3BhY2UgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGlzIGxpbmU7IHJl
bW92ZQo+PiBpdCBzbyB0aGF0IHRoZSBpbmRlbnRhdGlvbiBpcyBjb25zaXN0ZW50IGFjY29yZGlu
ZyB0byB0aGUgTGludXgga2VybmVsCj4+IGNvZGluZyBzdHlsZSBhbmQgY2xhbmcgbm8gbG9uZ2Vy
IHdhcm5zLgo+Pgo+PiBXaGlsZSB3ZSBhcmUgaGVyZSwgdGhlIHByZXZpb3VzIGxpbmUgaGFzIHNv
bWUgdHJhaWxpbmcgd2hpdGVzcGFjZTsgY2xlYW4KPj4gdGhhdCB1cCBhcyB3ZWxsLgo+Pgo+PiBG
aXhlczogYzgwYTQyMDk5NWU3ICgieGVuLWJsa2Zyb250OiBoYW5kbGUgWGVuIG1ham9yIG51bWJl
cnMgb3RoZXIgdGhhbiBYRU5WQkQiKQo+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdC
dWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83OTEKPj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ibG9j
ay94ZW4tYmxrZnJvbnQuYyB8IDQgKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+PiBpbmRleCBhNzRk
MDM5MTM4MjIuLmMwMmJlMDZjNTI5OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4t
YmxrZnJvbnQuYwo+PiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4+IEBAIC0x
MTEzLDggKzExMTMsOCBAQCBzdGF0aWMgaW50IHhsdmJkX2FsbG9jX2dlbmRpc2soYmxraWZfc2Vj
dG9yX3QgY2FwYWNpdHksCj4gCj4gV2hpbGUgeW91J3JlIGhlcmUsIHdvdWxkIHlvdSBwbGVhc2Ug
YWxzbyByZW1vdmluZyB0aGUgc2luZ2xlIHNwYWNlCj4gYmVmb3JlIHRoZSBsYWJlbHMgaW4gdGhp
cyBmdW5jdGlvbj8KCkFGQUlLIHRob3NlIGFyZSBpbnRlbmRlZCB0byBiZSB0aGVyZS4KCkhhdmlu
ZyBsYWJlbHMgaW5kZW50ZWQgYnkgYSBzcGFjZSBtYWtlcyBkaWZmIG5vdCBiZWxpZXZlIHRob3Nl
IGFyZQpmdW5jdGlvbiBkZWNsYXJhdGlvbnMuIFNvIGEgcGF0Y2hpbmcgYSBmdW5jdGlvbiB3aXRo
IGEgbGFiZWwgd29uJ3Qgc2hvdwp0aGUgbGFiZWwsIGJ1dCB0aGUgZnVuY3Rpb24gaW4gdGhlIGRp
ZmYgYmxvY2sgaGVhZGVyLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
