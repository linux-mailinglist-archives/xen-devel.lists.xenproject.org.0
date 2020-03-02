Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A341175C9A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:09:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8liS-00037O-Sx; Mon, 02 Mar 2020 14:06:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8liR-00037E-8A
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:06:39 +0000
X-Inumbo-ID: 087a873c-5c8f-11ea-9f80-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 087a873c-5c8f-11ea-9f80-12813bfff9fa;
 Mon, 02 Mar 2020 14:06:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BFFA8AEB8
 for <xen-devel@lists.xenproject.org>; Mon,  2 Mar 2020 14:06:37 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9687cc05-d3f5-c139-bbc4-a3eb05afdbea@suse.com>
Message-ID: <c5e5dc42-8037-3774-497e-8bef0edb118d@suse.com>
Date: Mon, 2 Mar 2020 15:06:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9687cc05-d3f5-c139-bbc4-a3eb05afdbea@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/2] x86/mce: add Xeon Icelake to list of CPUs
 that support PPIN
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPgoKTmV3IENQVSBtb2RlbCwgc2Ft
ZSBNU1JzIHRvIGNvbnRyb2wgYW5kIHJlYWQgdGhlIGludmVudG9yeSBudW1iZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUb255IEx1Y2sgPHRvbnkubHVja0BpbnRlbC5jb20+CltMaW51eCBjb21taXQgZGM2
YjAyNWRlOTViY2QyMmZmMzdjNGZhYmIwMjJlYzhhMDI3YWJmMV0KU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9tY2hl
Y2svbWNlX2ludGVsLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlX2ludGVsLmMK
QEAgLTg3MSw2ICs4NzEsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9pbml0X3BwaW4oY29uc3Qgc3Ry
dWN0CiAgICAgY2FzZSAweDU1OiAvKiBTa3lsYWtlIFggKi8KICAgICBjYXNlIDB4NTY6IC8qIEJy
b2Fkd2VsbCBYZW9uIEQgKi8KICAgICBjYXNlIDB4NTc6IC8qIEtuaWdodHMgTGFuZGluZyAqLwor
ICAgIGNhc2UgMHg2YTogLyogSWNlbGFrZSBYICovCiAgICAgY2FzZSAweDg1OiAvKiBLbmlnaHRz
IE1pbGwgKi8KIAogICAgICAgICBpZiAoIChjICE9ICZib290X2NwdV9kYXRhICYmICFwcGluX21z
cikgfHwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
