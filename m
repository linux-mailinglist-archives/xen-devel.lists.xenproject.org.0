Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12713161A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:32:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVHZ-0000Zb-Np; Mon, 06 Jan 2020 16:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioVHY-0000ZV-4z
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:31:08 +0000
X-Inumbo-ID: f01defef-30a1-11ea-ab33-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f01defef-30a1-11ea-ab33-12813bfff9fa;
 Mon, 06 Jan 2020 16:31:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB693ADBE;
 Mon,  6 Jan 2020 16:31:06 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
Date: Mon, 6 Jan 2020 17:31:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 0/8] x86emul: further work
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBvZiB0aGUgbGF0ZXIgcGF0Y2hlcyBhcmUgUkZDLCBmb3IgdmFyeWluZyByZWFzb25zIChz
ZWUgdGhlcmUpLgoKMTogeDg2OiBkZXRlcm1pbmUgSEFWRV9BU18qIGp1c3Qgb25jZQoyOiB4ODY6
IG1vdmUgYmFjayBjbGFuZyBubyBpbnRlZ3JhdGVkIGFzc2VtYmxlciB0ZXN0cwozOiB4ODZlbXVs
OiBzdXBwb3J0IE1PVkRJUkkgaW5zbgo0OiB4ODZlbXVsOiBzdXBwb3J0IE1PVkRJUjY0QiBpbnNu
CjU6IHg4Ni9IVk06IHNjYWxlIE1QRVJGIHZhbHVlcyByZXBvcnRlZCB0byBndWVzdHMgKG9uIEFN
RCkKNjogeDg2ZW11bDogc3VwcG9ydCBSRFBSVQo3OiB4ODYvSFZNOiBkb24ndCBuZWVkbGVzc2x5
IGludGVyY2VwdCBBUEVSRi9NUEVSRi9UU0MgTVNSIHJlYWRzCjg6IHg4NmVtdWw6IHN1cHBvcnQg
TUNPTU1JVAoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
