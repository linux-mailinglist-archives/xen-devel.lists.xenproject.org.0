Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE61527AA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 09:52:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izGNp-0003i2-QR; Wed, 05 Feb 2020 08:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izGNo-0003ak-Lk
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 08:50:04 +0000
X-Inumbo-ID: 80356954-47f4-11ea-90a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80356954-47f4-11ea-90a3-12813bfff9fa;
 Wed, 05 Feb 2020 08:50:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F625AFA5;
 Wed,  5 Feb 2020 08:50:03 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20f27148-db90-4e8b-7d95-f616904dea60@suse.com>
Date: Wed, 5 Feb 2020 09:50:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204173455.22020-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/3] nvmx: implement support for MSR
 bitmaps
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxODozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0xODMsMTMg
KzE5MywyNyBAQCB2b2lkIG52bXhfdmNwdV9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAg
ICAgIHYtPmFyY2guaHZtLnZteC52bXdyaXRlX2JpdG1hcCA9IE5VTEw7Cj4gICAgICB9Cj4gIH0K
PiAtIAo+ICsKPiArdm9pZCB2Y3B1X3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCB2Y3B1ICp2
KQoKc3RhdGljICh3aGljaCB3b3VsZCBiZSBlYXN5IHRvIGFkZCB3aGlsZSBjb21taXR0aW5nLCBp
ZiBubyBvdGhlcgpuZWVkIGFyaXNlcyBmb3IgYSB2NSBoZXJlKQoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
