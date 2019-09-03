Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F44A6895
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57sa-0005II-Gf; Tue, 03 Sep 2019 12:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57sZ-0005I8-8f
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:25:47 +0000
X-Inumbo-ID: f47c74f2-ce45-11e9-ab92-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f47c74f2-ce45-11e9-ab92-12813bfff9fa;
 Tue, 03 Sep 2019 12:25:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE638AEFB;
 Tue,  3 Sep 2019 12:25:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <fa007bb5-1644-6116-fe96-00b00f7241a4@suse.com>
 <59fc6a13-6008-e537-6bfd-51fd97df676c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0dff6e4-a5be-445d-76db-cbe923484a92@suse.com>
Date: Tue, 3 Sep 2019 14:25:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <59fc6a13-6008-e537-6bfd-51fd97df676c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/8] x86emul: support MOVDIR{I, 64B} insns
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxMjoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wOS8yMDE5
IDEwOjM5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTm90ZSB0aGF0IFNETSByZXZpc2lvbiAwNzAg
ZG9lc24ndCBzcGVjaWZ5IGV4Y2VwdGlvbiBiZWhhdmlvciBmb3IKPj4gTW9kUk0ubW9kICE9IDBi
MTE7IGFzc3VtaW5nICNVRCBoZXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gV2hhdCBhcmUgd2UgZ29pbmcgdG8gZG8gYWJvdXQgdGhl
IC0+d3JpdGUoKSBob29rIGF0b21pY2l0eT/CoCBJJ20gaGFwcHkKPiB0byBwdXQgaXQgb24gdGhl
IFRPRE8gbGlzdCwgYnV0IHdlIGNhbid0IHNpbXBseSBpZ25vcmUgdGhlIHByb2JsZW0uCgpTbyBk
byB5b3Ugbm90IGFncmVlIHdpdGggbXkgYXNzZXNzbWVudCB0aGF0IG91ciBtZW1jcHkoKQppbXBs
ZW1lbnRhdGlvbiBzYXRpc2ZpZXMgdGhlIG5lZWQsIGFuZCBpdCdzIGp1c3Qgbm90IHZlcnkKbmlj
ZSB0aGF0IHRoZSAtPndyaXRlKCkgaG9vayBpcyBkZXBlbmRlbnQgdXBvbiB0aGlzPwoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
