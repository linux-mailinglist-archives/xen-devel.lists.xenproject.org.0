Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CB88416
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 22:33:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwBVb-00050p-KH; Fri, 09 Aug 2019 20:29:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hwBVa-00050k-JJ
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 20:29:06 +0000
X-Inumbo-ID: 54ac572b-bae4-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54ac572b-bae4-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 20:29:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B8DA2166E;
 Fri,  9 Aug 2019 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565382544;
 bh=aZG1ARp0uAxkwZj0NlnRk43PGAgn3euKMDb5ClfXiA8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bcwTYiTXk23oJfMeBGgNPcapRxvpXJQlY/yG/QjF2yVN2FHN8IRktD0AIOUcR9Pf6
 419Je2mM2YcyMMpIZJhbQEVijnoE47iRlWD0JFXTqzCBp9HN53w+KQUPYodcibg3M2
 uCpe3MSPQehwho2sD/uhzx65zBL9QpwLDhgmqOEg=
Date: Fri, 9 Aug 2019 13:29:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <ab9dae72-c8e9-4bf0-ded1-338cf456e6ff@arm.com>
Message-ID: <alpine.DEB.2.21.1908091328320.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-4-sstabellini@kernel.org>
 <ab9dae72-c8e9-4bf0-ded1-338cf456e6ff@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 4/7] xen/arm: early_print_info print
 reserved_mem
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA3IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNi8wOC8yMDE5IDIyOjQ5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBJbXBy
b3ZlIGVhcmx5X3ByaW50X2luZm8gdG8gYWxzbyBwcmludCB0aGUgYmFua3Mgc2F2ZWQgaW4KPiA+
IGJvb3RpbmZvLnJlc2VydmVkX21lbS4gUHJpbnQgdGhlbSByaWdodCBhZnRlciBSRVNWRCwgaW5j
cmVhc2luZyB0aGUgc2FtZQo+ID4gaW5kZXguCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBp
biB2NDoKPiA+IC0gbmV3IHBhdGNoCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQu
YyB8IDkgKysrKysrKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMg
Yi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gPiBpbmRleCAzZTZmZDYzYjE2Li5iOGYyZTUzMTIy
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYwo+ID4gQEAgLTM1MSw5ICszNTEsMTAgQEAgc3RhdGljIGludCBfX2lu
aXQgZWFybHlfc2Nhbl9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKPiA+ICAgc3RhdGljIHZvaWQgX19p
bml0IGVhcmx5X3ByaW50X2luZm8odm9pZCkKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IG1lbWlu
Zm8gKm1pID0gJmJvb3RpbmZvLm1lbTsKPiA+ICsgICAgc3RydWN0IG1lbWluZm8gKm1lbV9yZXN2
ID0gJmJvb3RpbmZvLnJlc2VydmVkX21lbTsKPiA+ICAgICAgIHN0cnVjdCBib290bW9kdWxlcyAq
bW9kcyA9ICZib290aW5mby5tb2R1bGVzOwo+ID4gICAgICAgc3RydWN0IGJvb3RjbWRsaW5lcyAq
Y21kcyA9ICZib290aW5mby5jbWRsaW5lczsKPiA+IC0gICAgaW50IGksIG5yX3JzdmQ7Cj4gPiAr
ICAgIGludCBpLCBqLCBucl9yc3ZkOwo+IAo+IE1heSBJIGFzayB5b3UgdG8gc3dpdGNoIHRoZW0g
dG8gdW5zaWduZWQgaW50Pwo+IAo+ID4gICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG1pLT5ucl9i
YW5rczsgaSsrICkKPiA+ICAgICAgICAgICBwcmludGsoIlJBTTogJSJQUklwYWRkciIgLSAlIlBS
SXBhZGRyIlxuIiwKPiA+IEBAIC0zNzgsNiArMzc5LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBl
YXJseV9wcmludF9pbmZvKHZvaWQpCj4gPiAgICAgICAgICAgcHJpbnRrKCIgUkVTVkRbJWRdOiAl
IlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICBp
LCBzLCBlKTsKPiA+ICAgICAgIH0KPiA+ICsgICAgZm9yICggaiA9IDA7IGogPCBtZW1fcmVzdi0+
bnJfYmFua3M7IGorKywgaSsrICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgcHJpbnRrKCIgUkVT
VkRbJWRdOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLCBpLAo+IAo+IFdpdGggdGhhdCB0
aGUgcmVxdWVzdCBhYm92ZTogcy8lZC8ldS8KCkdvb2QgaWRlYS4gSSdsbCB0YWtlIHRoZSBvcHBv
cnR1bml0eSB0byBhbHNvIHN3aXRjaCB0aGUgUkVTVkRbJWRdIHRvClJFU1ZEWyV1XSBqdXN0IGFi
b3ZlCgoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFydCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFydCArIG1lbV9y
ZXN2LT5iYW5rW2pdLnNpemUgLSAxKTsKPiA+ICsgICAgfQo+ID4gICAgICAgcHJpbnRrKCJcbiIp
Owo+ID4gICAgICAgZm9yICggaSA9IDAgOyBpIDwgY21kcy0+bnJfbW9kczsgaSsrICkKPiA+ICAg
ICAgICAgICBwcmludGsoIkNNRExJTkVbJSJQUklwYWRkciJdOiVzICVzXG4iLCBjbWRzLT5jbWRs
aW5lW2ldLnN0YXJ0LAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
