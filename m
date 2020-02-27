Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6917120A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7EG8-0008I1-E8; Thu, 27 Feb 2020 08:11:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7EG7-0008Hw-2i
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 08:11:03 +0000
X-Inumbo-ID: b1599c76-5938-11ea-95ed-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1599c76-5938-11ea-95ed-12813bfff9fa;
 Thu, 27 Feb 2020 08:11:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3357CAC1D;
 Thu, 27 Feb 2020 08:11:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e17b200e-05ea-d000-5c4a-432a07a1e40e@suse.com>
Date: Thu, 27 Feb 2020 09:11:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/10] x86/msr: Introduce and use default
 MSR policies
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGb3Igbm93LCB0aGUg
ZGVmYXVsdCBhbmQgbWF4IHBvbGljaWVzIHJlbWFpbiBpZGVudGljYWwsIGJ1dCB0aGlzIHdpbGwg
Y2hhbmdlCj4gaW4gdGhlIGZ1dHVyZS4KPiAKPiBVcGRhdGUgWEVOX1NZU0NUTF9nZXRfY3B1X3Bv
bGljeSBhbmQgaW5pdF9kb21haW5fbXNyX3BvbGljeSgpIHRvIHVzZSB0aGUKPiBkZWZhdWx0IHBv
bGljaWVzLgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHNvcnQgUFYgYWhlYWQgb2YgSFZNLCBh
cyBpcyB0aGUgcHJldmFpbGluZyBzdHlsZQo+IGVsc2V3aGVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
