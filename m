Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CE61E34
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSTc-0000xf-MB; Mon, 08 Jul 2019 12:10:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSTb-0000xa-GD
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:10:35 +0000
X-Inumbo-ID: 62271916-a179-11e9-8d4f-dba7f14090c8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 62271916-a179-11e9-8d4f-dba7f14090c8;
 Mon, 08 Jul 2019 12:10:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2919360;
 Mon,  8 Jul 2019 05:10:31 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ECE03F738;
 Mon,  8 Jul 2019 05:10:28 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190618111149.32515-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <184864a8-5a02-543c-81a4-b934205e4e38@arm.com>
Date: Sun, 7 Jul 2019 18:26:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618111149.32515-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] get_maintainer: Improve patch recognition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Perches <joe@perches.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE4LzE5IDEyOjEyIFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBGcm9t
OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgo+IAo+IFRoZXJlIGFyZSBtb2RlIGNoYW5n
ZSBhbmQgcmVuYW1lIG9ubHkgcGF0Y2hlcyB0aGF0IGFyZSB1bnJlY29nbml6ZWQKPiBieSB0aGUg
Z2V0X21haW50YWluZXIucGwgc2NyaXB0Lgo+IAo+IFJlY29nbml6ZSB0aGVtLgo+IAo+IFsgTGlu
dXggY29tbWl0IDA0NTVjNzQ3ODhmZDVhYWQ0Mzk5ZjAwZTNmYmJiN2U4NzQ1MGNhNTggXQo+IAo+
IFJlcG9ydGVkLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDx4eXByb24uZ2xwa0BnbXguZGU+Cj4g
Q0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIg
QmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpUaGlzIGxvb2tzIGdvb2QgdG8g
bWUuCgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
