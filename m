Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD015936B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 16:42:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Xdo-0007kS-2D; Tue, 11 Feb 2020 15:40:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1Xdm-0007kJ-Ir
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 15:39:58 +0000
X-Inumbo-ID: c15d46b4-4ce4-11ea-b5c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c15d46b4-4ce4-11ea-b5c7-12813bfff9fa;
 Tue, 11 Feb 2020 15:39:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57BFCC1FB;
 Tue, 11 Feb 2020 15:39:56 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20200128142818.27200-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <11156f81-f538-9e42-9950-804e9dffd7c0@suse.com>
Date: Tue, 11 Feb 2020 16:39:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200128142818.27200-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] tools/xenstore
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gU29tZSBwYXRjaGVzIGZv
ciBYZW5zdG9yZS1zdHViZG9tIHdoaWNoIGhhdmUgYmVlbiBseWluZyBhcm91bmQgaW4gbXkKPiBs
b2NhbCB0cmVlIGZvciBzb21lIHRpbWUgbm93Lgo+IAo+IEp1ZXJnZW4gR3Jvc3MgKDMpOgo+ICAg
IHhlbnN0b3JlOiBzZXR1cCB4ZW5zdG9yZSBzdHViZG9tIGNvbnNvbGUgaW50ZXJmYWNlIHByb3Bl
cmx5Cj4gICAgeGVuc3RvcmU6IGFkZCBjb25zb2xlIHhlbnN0b3JlIGVudHJpZXMgZm9yIHhlbnN0
b3JlIHN0dWJkb20KPiAgICB4ZW5zdG9yZTogcmVtb3ZlIG5vdCBhcHBsaWNhYmxlIGNvbnRyb2wg
Y29tbWFuZHMgaW4gc3R1YmRvbQo+IAo+ICAgdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRv
bWFpbi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gICB0b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jICAgfCAxOCArKysrKysrKysrKysrKysKPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAoKUGlu
Zz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
