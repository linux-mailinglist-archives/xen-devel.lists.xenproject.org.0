Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF0E132D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 09:33:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNB6r-0002gu-As; Wed, 23 Oct 2019 07:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mdh1=YQ=codethink.co.uk=ben.dooks@srs-us1.protection.inumbo.net>)
 id 1iNB6p-0002gp-Vo
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 07:31:08 +0000
X-Inumbo-ID: 12a7ccae-f567-11e9-bbab-bc764e2007e4
Received: from imap1.codethink.co.uk (unknown [176.9.8.82])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12a7ccae-f567-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 07:31:06 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iNB6m-0005id-Qc; Wed, 23 Oct 2019 08:31:04 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191022125006.3746-1-ben.dooks@codethink.co.uk>
 <alpine.DEB.2.21.1910221008370.30080@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1910221009040.30080@sstabellini-ThinkPad-T480s>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <412520e1-689c-77e7-edcd-fb9199ac76d9@codethink.co.uk>
Date: Wed, 23 Oct 2019 08:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910221009040.30080@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen: mm: include <xen/xen-ops.h> for
 missing declarations
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
Cc: linux-kernel@lists.codethink.co.uk, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTAvMjAxOSAxODowOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MjIgT2N0IDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAyMiBPY3Qg
MjAxOSwgQmVuIERvb2tzIChDb2RldGhpbmspIHdyb3RlOgo+Pj4gSW5jbHVkZSA8eGVuL3hlbi1v
cHMuaD4gZm9yIHhlbl97Y3JlYXRlLGRlc3Ryb3l9X2NvbnRpZ291c19yZWdpb24KPj4+IGNhbGwg
ZGVjbGFyYXRpb25zLiBGaXhlcyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nczoKPj4+Cj4+
PiBhcmNoL2FybS94ZW4vbW0uYzoxMTk6NTogd2FybmluZzogc3ltYm9sICd4ZW5fY3JlYXRlX2Nv
bnRpZ3VvdXNfcmVnaW9uJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+
Pj4gYXJjaC9hcm0veGVuL21tLmM6MTMxOjY6IHdhcm5pbmc6IHN5bWJvbCAneGVuX2Rlc3Ryb3lf
Y29udGlndW91c19yZWdpb24nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIChDb2RldGhpbmspIDxiZW4uZG9va3NA
Y29kZXRoaW5rLmNvLnVrPgo+Pgo+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IERvIHlvdSB3YW50IG1lIHRvIHBpY2sgdXAgdGhl
c2UgdHdvIHBhdGNoZXMgYW5kIGhhdmUgdGhlbSBnbyB1cHN0cmVhbQo+IHZpYSB0aGUgWGVuIHRy
ZWUsIG9yIGFyZSB0aGV5IHBhcnQgb2YgYSBiaWdnZXIgcmV3b3JrPwoKSSd2ZSBiZWVuIGRvaW5n
IHNvbWUgdGVzdGluZyB3aXRoIHNwYXJzZSBhbmQgZ29pbmcgZml4aW5nIHdhcm5pbmdzIGFzCkkg
Z28gYWxvbmcuIFBsZWFzZSB0YWtlIHRoZXNlIHZpYSB5b3VyIHRyZWUuCgotLSAKQmVuIERvb2tz
CQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRo
aW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZh
Y3kuaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
