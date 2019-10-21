Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B962DF381
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 18:46:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMamT-000516-Q6; Mon, 21 Oct 2019 16:43:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwQb=YO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iMamS-000511-2U
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 16:43:40 +0000
X-Inumbo-ID: ee09a462-f421-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ee09a462-f421-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 16:43:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C3F2175A;
 Mon, 21 Oct 2019 09:43:37 -0700 (PDT)
Received: from [10.37.10.13] (unknown [10.37.10.13])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 642833F71F;
 Mon, 21 Oct 2019 09:43:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-8-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011358180.20899@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b126aaaf-eaee-ddee-cb9d-fa791f539913@arm.com>
Date: Mon, 21 Oct 2019 17:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910011358180.20899@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 07/10] xen/arm: Allow insn.h to
 be called from assembly
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzEvMTkgMTA6MDAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDI2IFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEEgZm9sbG93
LXVwIHBhdGNoIHdpbGwgcmVxdWlyZSB0byBpbmNsdWRlIGluc24uaCBmcm9tIGFzc2VtYmx5IGNv
ZGUuIFNvCj4+IHdlZSBuZWVkIHRvIHByb3RlY3QgYW55IEMtc3BlY2lmaWMgZGVmaW5pdGlvbiB0
byBhdm9pZCBjb21waWxhdGlvbgo+ICAgIF4gd2UgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXiBkZWZpbml0aW9ucwo+IAo+PiBlcnJvciB3aGVuIHVzZWQgaW4gYXNzZW1ibHkgY29kZS4K
PiAgICBeIGVycm9ycwo+IAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+PiAtLS0KPj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2luc24u
aCB8IDggKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vaW5zbi5oCj4+IGluZGV4IDE5Mjc3MjEyZTEuLjAwMzkxZjgzZjkgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW5zbi5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vaW5zbi5oCj4+IEBAIC0xLDggKzEsMTQgQEAKPj4gICAjaWZuZGVmIF9fQVJDSF9BUk1fSU5T
Tgo+PiAgICNkZWZpbmUgX19BUkNIX0FSTV9JTlNOCj4+ICAgCj4+ICsjaWZuZGVmIF9fQVNTRU1C
TFlfXwo+PiArCj4+ICAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+PiAgIAo+PiArLyoKPj4gKyAq
IEF0IHRoZSBtb21lbnQsIGFyY2gtc3BlY2lmaWMgaGVhZGVycyBjb250YWluIG9ubHkgZGVmaW5p
dGlvbiBmb3IgQwo+PiArICogY29kZS4KPj4gKyAqLwo+IAo+IFBsZWFzZSByZW1vdmUgIkF0IHRo
ZSBtb21lbnQsICIgYmVjYXVzZSBpbi1jb2RlIGNvbW1lbnQgc2hvdWxkIGFsd2F5cwo+IHJlZmxl
Y3QgdGhlIGxhdGVzdCBzdGF0ZSBvZiB0aGUgY29kZWJhc2UuCgpXZWxsLCB3ZSBkbyBoYXZlIGEg
bG90IG9mICJDdXJyZW50bHkiLyJBdCB0aGUgbW9tZW50Ii8iRm9yIG5vdyIgaW4gdGhlIApjb2Rl
LiBTb21lIG9mIG15IHBhdGNoZXMgd2VudCBpbiByZWNlbnRseSB3aXRoIHN1Y2ggd29yZGluZywg
c28gd2h5IHRoaXMgCnBhcnRpY3VsYXIgb25lIGlzIGEgcHJvYmxlbT8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
