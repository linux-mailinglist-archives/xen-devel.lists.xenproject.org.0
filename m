Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82C1069E
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 11:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLlpw-0007Sy-8H; Wed, 01 May 2019 09:47:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/fo=TB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLlpt-0007Sp-Tn
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 09:47:33 +0000
X-Inumbo-ID: 24226920-6bf6-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 24226920-6bf6-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 09:47:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B748A78;
 Wed,  1 May 2019 02:47:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EE633F719;
 Wed,  1 May 2019 02:47:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-7-git-send-email-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8448a1f5-75de-123b-b496-bdc9b99826b2@arm.com>
Date: Wed, 1 May 2019 10:47:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-7-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 07/10] xen/arm: make process_memory_node
 a device_tree_node_func
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMC8wNC8yMDE5IDIyOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gQ2hh
bmdlIHRoZSBzaWduYXR1cmUgb2YgcHJvY2Vzc19tZW1vcnlfbm9kZSB0byBtYXRjaAo+IGRldmlj
ZV90cmVlX25vZGVfZnVuYy4KCk5BY2sgaW4gdGhlIGN1cnJlbnQgZm9ybS4gSWYgYSBmdW5jdGlv
biByZXR1cm4gYSB2YWx1ZSwgdGhlbiBpdCBzaG91bGQgYmUgCmNoZWNrZWQgYXBwcm9wcmlhdGVs
eSBhbmQgbm90IGlnbm9yZWQuCgpCdXQgdGhlbiwgdGhlIGNvbW1pdCBtZXNzYWdlIGxlYWRzIHRv
IHRoaW5rIHlvdSBhcmUgZ29pbmcgdG8gdXNlIApkZXZpY2VfdHJlZV9ub2RlX2Z1bmMgaGVyZSB3
aGlsZSBpbiBmYWN0IGl0IGlzIGluIHRoZSBuZXh0IHBhdGNoLiBQbGVhc2UgdXBkYXRlIAp0aGUg
Y29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+
IC0gbmV3Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMTYgKysrKysrKysrKy0t
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0v
Ym9vdGZkdC5jCj4gaW5kZXggZTdiMDhlZC4uYjY2MDBhYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IEBAIC0xMjQs
OSArMTI0LDEwIEBAIGludCBfX2luaXQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2
b2lkICpmZHQsCj4gICAgICAgcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAtc3RhdGljIHZvaWQgX19p
bml0IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3NfY2VsbHMs
IHUzMiBzaXplX2NlbGxzKQo+ICtzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNzX21lbW9yeV9ub2Rl
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSwgaW50IGRlcHRoLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxzLCB1MzIgc2l6ZV9jZWxs
cywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQo+
ICAgewo+ICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnByb3A7Cj4gICAgICAgaW50
IGk7Cj4gQEAgLTEzOSwxNCArMTQwLDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX21l
bW9yeV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gICAgICAgewo+ICAgICAgICAg
ICBwcmludGsoImZkdDogbm9kZSBgJXMnOiBpbnZhbGlkICNhZGRyZXNzLWNlbGxzIG9yICNzaXpl
LWNlbGxzIiwKPiAgICAgICAgICAgICAgICAgIG5hbWUpOwo+IC0gICAgICAgIHJldHVybjsKPiAr
ICAgICAgICByZXR1cm4gMDsKPiAgICAgICB9Cj4gICAKPiAgICAgICBwcm9wID0gZmR0X2dldF9w
cm9wZXJ0eShmZHQsIG5vZGUsICJyZWciLCBOVUxMKTsKPiAgICAgICBpZiAoICFwcm9wICkKPiAg
ICAgICB7Cj4gICAgICAgICAgIHByaW50aygiZmR0OiBub2RlIGAlcyc6IG1pc3NpbmcgYHJlZycg
cHJvcGVydHlcbiIsIG5hbWUpOwo+IC0gICAgICAgIHJldHVybjsKPiArICAgICAgICByZXR1cm4g
MDsKPiAgICAgICB9Cj4gICAKPiAgICAgICBjZWxsID0gKGNvbnN0IF9fYmUzMiAqKXByb3AtPmRh
dGE7Cj4gQEAgLTE2MSw2ICsxNjIsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1v
cnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+ICAgICAgICAgICBib290aW5mby5t
ZW0uYmFua1tib290aW5mby5tZW0ubnJfYmFua3NdLnNpemUgPSBzaXplOwo+ICAgICAgICAgICBi
b290aW5mby5tZW0ubnJfYmFua3MrKzsKPiAgICAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4g
ICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX211bHRpYm9vdF9ub2RlKGNv
bnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gQEAgLTI5Myw3ICsyOTYsOCBAQCBzdGF0aWMgaW50
IF9faW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4gICB7Cj4gICAgICAgaWYgKCBkZXZp
Y2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLCAibWVtb3J5IikgKQo+IC0gICAgICAgIHBy
b2Nlc3NfbWVtb3J5X25vZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2Nl
bGxzKTsKPiArICAgICAgICBwcm9jZXNzX21lbW9yeV9ub2RlKGZkdCwgbm9kZSwgbmFtZSwgZGVw
dGgsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBOVUxMKTsKPiAgICAgICBlbHNlIGlmICggZGVwdGggPD0gMyAmJiAoZGV2aWNlX3RyZWVf
bm9kZV9jb21wYXRpYmxlKGZkdCwgbm9kZSwgInhlbixtdWx0aWJvb3QtbW9kdWxlIiApIHx8Cj4g
ICAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfY29tcGF0aWJsZShmZHQsIG5vZGUsICJt
dWx0aWJvb3QsbW9kdWxlIiApKSkKPiAgICAgICAgICAgcHJvY2Vzc19tdWx0aWJvb3Rfbm9kZShm
ZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMpOwo+IAoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
