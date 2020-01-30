Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D214DC0D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:34:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9va-00048k-F8; Thu, 30 Jan 2020 13:32:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix9vZ-00048f-2C
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:32:13 +0000
X-Inumbo-ID: ebca4908-4364-11ea-8a63-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebca4908-4364-11ea-8a63-12813bfff9fa;
 Thu, 30 Jan 2020 13:32:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABC9EAC2C;
 Thu, 30 Jan 2020 13:32:11 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200121135916.1140483-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <85e27563-49c8-1a1e-e2c6-92642492ef21@suse.com>
Date: Thu, 30 Jan 2020 14:32:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200121135916.1140483-3-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2.1 15/12] squash! xen/build: have the
 root Makefile generates the CFLAGS
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxNDo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhlIFhFTl9CVUlM
RF9FRkkgdGVzdHMgaW4gYXJjaC94ODYvTWFrZWZpbGUgd2FzIGZpbHRlcmluZyBvdXQKPiBDRkxB
R1MteSwgYnV0IGFjY29yZGluZyB0byBkZDQwMTc3YzFiYzggKCJ4ODYtNjQvRUZJOiBhZGQgQ0ZM
QUdTIHRvCj4gY2hlY2sgY29tcGlsZSIpLCBpdCB3YXMgZG9uZSB0byBmaWx0ZXIgb3V0IC1NRi4g
WEVOX0NGTEFHUyBkb2Vzbid0Cj4gaGF2ZSB0aG9zZSBmbGFncyBhbnltb3JlLCBzbyBubyBmaWx0
ZXJpbmcgaXMgbmVlZGVkLgoKQnV0IHRoaXMgc2hvdWxkIHRoZW4gYmUgcGFydCBvZiBwYXRjaCAx
MCwgbm90IDEyLCBJIHdvdWxkIHRoaW5rLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
