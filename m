Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F543144B
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWli8-0008GI-1z; Fri, 31 May 2019 17:53:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWli6-0008GD-VU
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:52:59 +0000
X-Inumbo-ID: ec8c9672-83cc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ec8c9672-83cc-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 17:52:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61A53A78;
 Fri, 31 May 2019 10:52:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7001D3F59C;
 Fri, 31 May 2019 10:52:56 -0700 (PDT)
To: Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1559203823-4092-1-git-send-email-vishnu@os.amperecomputing.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <244fdc8f-cd62-ba15-ed6f-046cb2778637@arm.com>
Date: Fri, 31 May 2019 18:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559203823-4092-1-git-send-email-vishnu@os.amperecomputing.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: p2m: configure stage-2 page
 table to support upto 42-bit PA systems
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Feng Kan OS <fengkan@os.amperecomputing.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaXRsZTogcy91cHRvLyBJIHRoaW5rPwoKQWxzbyBob3cgYWJvdXQ6ICJQcm9wZXJseSBj
b25maWd1cmUgc3RhZ2UtMiBmb3IgNDItYml0IFBBIHN5c3RlbSIuCgpPbiAzMC8wNS8yMDE5IDA4
OjU5LCBWaXNobnUgUGFqanVyaSBPUyB3cm90ZToKPiBYRU4gY29uZmlndXJlcyBzdGFnZS0yIHBh
Z2UgdGFibGUgdG8gZXhwb3NlIDQwIGJpdHMgb2YgSVBBCj4gKEludGVybWVkaWF0ZSBQaHlzaWNh
bCBBZGRyZXNzKSBiaXRzIGZvciBzeXN0ZW1zIHdpdGggNDIgYml0cyBvZiBQQQoKSSB0aGluayB5
b3Ugd2FudCB0byBkcm9wIHRoZSBmaXJzdCAiYml0cyIuCgo+IChQaHlzaWNhbCBBZGRyZXNzKS4g
VGhpcyBzZXR0aW5nIHByZXZlbnRzIHRoZSA0Mi1iaXQgUEEgc3lzdGVtcyBmcm9tIGJvb3RpbmcK
PiBET00wJ3Mga2VybmVsIHNpbmNlIGFjY2VzcyBhYm92ZSA0MCBiaXRzIHJlc3VsdHMgaW4gYSBm
YXVsdC4KCgpUaGlzIHNlbnRlbmNlIGlzIGRpZmZpY3VsdCB0byByZWFkIGlmIHlvdSBkb24ndCBy
ZWFkIHRoZSBuZXh0IG9uZSBmaXJzdC4KCj4gCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9y
IDQyLWJpdCBzeXN0ZW0KPiB3aGljaCBoYXMgYSBmdWxsIDQyLWJpdCBhZGRyZXNzIHJhbmdlLgoK
VGhlIGxpbmUtd3JhcCBsb29rcyBzdHJhbmdlIGhlcmUuCgo+IAo+IFRoZSBmaXggd2lsbCBhbGxv
Y2F0ZSA4IHBhZ2VzIGZvciBzdGFnZSAyIG1hcHBpbmcgZm9yIGJvdGggRE9NMCBhbmQgZ3Vlc3Rz
LgoKcy9tYXBwaW5nL3Jvb3QgcGFnZS10YWJsZXMvCgo+IEl0IGlzIGEgYml0IHdhc3RlZnVsIGJ1
dCBub3QgYW4gaXNzdWUgc2luY2UgbW9zdCBvZiB0aGVzZSBzeXN0ZW1zIHNob3VsZCBoYXZlCj4g
c3VmZmljaWVudGx5IGxhcmdlIG1lbW9yeSBjYXBhY2l0eS4KCkhlcmUgYSBzdWdnZXN0aW9uIGZv
ciB0aGUgY29tbWl0IG1lc3NhZ2U6CgoiQXQgdGhlIG1vbWVudCwgb24gcGxhdGZvcm0gc3VwcG9y
dGluZyA0Mi1iaXQgUEEsIFhlbiB3aWxsIG9ubHkgZXhwb3NlIDQwLWJpdCAKd29ydGggb2YgSVBB
IHRvIGFsbCBkb21haW5zLgoKVGhlIGxpbWl0YXRpb24gd2FzIHRvIHByZXZlbnQgYWxsb2NhdGlu
ZyB0b28gbXVjaCBtZW1vcnkgZm9yIHRoZSByb290IHBhZ2UgCnRhYmxlcyBhcyB0aG9zZSBwbGF0
Zm9ybXMgb25seSBzdXBwb3J0IDMtbGV2ZWxzIHBhZ2UtdGFibGVzLiBBdCB0aGUgdGltZSwgdGhp
cyAKd2FzIGRlZW1lZCBhY2NlcHRhYmxlIGJlY2F1c2Ugbm9uZSBvZiB0aGUgcGxhdGZvcm1zIGhh
ZCBhZGRyZXNzIHdpcmVkIGFib3ZlIDQwLWJpdHMuCgpIb3dldmVyLCBuZXdlciBwbGF0Zm9ybXMg
dGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIGZ1bGwgYWRkcmVzcyBzcGFjZS4gVGhpcyB3aWxsIApyZXN1
bHQgdG8gYnJlYWsgRG9tMCBib290IGFzIGl0IGNhbid0IGFjY2VzcyBhbnl0aGluZyBhYm92ZSA0
MC1iaXQuCgpUaGUgb25seSB3YXkgdG8gc3VwcG9ydCA0Mi1iaXQgSVBBIGlzIHRvIGFsbG9jYXRl
IDggcGFnZXMgZm9yIHRoZSByb290IApwYWdlLXRhYmxlcy4gVGhpcyBpcyBhIGJpdCBhIHdhc3Rl
IG9mIG1lbW9yeSBhcyBYZW4gZG9lcyBub3Qgb2ZmZXIgcGVyLWd1ZXN0IApzdGFnZS0yIGNvbmZp
Z3VyYXRpb24uIEJ1dCBpdCBpcyBjb25zaWRlcmVkIGFjY2VwdGFibGUgYXMgY3VycmVudCBwbGF0
Zm9ybXMgCnN1cHBvcnQgNDItYml0IFBBIGhhdmUgYSBsb3Qgb2YgbWVtb3J5LgoKSW4gdGhlIGZ1
dHVyZSwgd2UgbWF5IHdhbnQgdG8gY29uc2lkZXIgcGVyLWd1ZXN0IHN0YWdlLTIgY29uZmlndXJh
dGlvbiB0byByZWR1Y2UgCnRoZSB3YXN0ZS4KIgoKSWYgeW91IGFyZSBoYXBweSB3aXRoIHRoZSBj
b21taXQgbWVzc2FnZSwgSSB3aWxsIHVwZGF0ZSB1c2UgaXQgb24gY29tbWl0LgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBGZW5nIEthbiA8ZmVuZ2thbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFZpc2hudSA8dmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+Cj4gLS0t
CgpJdCBpcyBjb21tb24gdG8gYnJpZWZseSBkZXNjcmliZSBhZnRlciAtLS0gdGhlIGNoYW5nZXMg
eW91IG1hZGUgaW4gdGhlIG5ldyB2ZXJzaW9uLgoKPiAgIHhlbi9hcmNoL2FybS9wMm0uYyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBp
bmRleCA5MmMyNDEzLi43NzEyOTkxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+IEBAIC0xOTk1LDcgKzE5OTUsNyBAQCB2b2lkIF9f
aW5pdCBzZXR1cF92aXJ0X3BhZ2luZyh2b2lkKQo+ICAgICAgICAgICBbMF0gPSB7IDMyLCAgICAg
IDMyLyozMiovLCAgMCwgICAgICAgICAgMSB9LAo+ICAgICAgICAgICBbMV0gPSB7IDM2LCAgICAg
IDI4LyoyOCovLCAgMCwgICAgICAgICAgMSB9LAo+ICAgICAgICAgICBbMl0gPSB7IDQwLCAgICAg
IDI0LyoyNCovLCAgMSwgICAgICAgICAgMSB9LAo+IC0gICAgICAgIFszXSA9IHsgNDIsICAgICAg
MjQvKjIyKi8sICAxLCAgICAgICAgICAxIH0sCj4gKyAgICAgICAgWzNdID0geyA0MiwgICAgICAy
Mi8qMjIqLywgIDMsICAgICAgICAgIDEgfSwKPiAgICAgICAgICAgWzRdID0geyA0NCwgICAgICAy
MC8qMjAqLywgIDAsICAgICAgICAgIDIgfSwKPiAgICAgICAgICAgWzVdID0geyA0OCwgICAgICAx
Ni8qMTYqLywgIDAsICAgICAgICAgIDIgfSwKPiAgICAgICAgICAgWzZdID0geyAwIH0sIC8qIElu
dmFsaWQgKi8KPiAtLQo+IDEuOC4zLjEKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
