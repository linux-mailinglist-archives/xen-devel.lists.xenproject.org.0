Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCAB18F0AE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 09:12:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGI9s-0004JL-E4; Mon, 23 Mar 2020 08:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGI9r-0004F1-9d
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 08:10:03 +0000
X-Inumbo-ID: b1d024f0-6cdd-11ea-8274-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1d024f0-6cdd-11ea-8274-12813bfff9fa;
 Mon, 23 Mar 2020 08:10:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19E00ACAE;
 Mon, 23 Mar 2020 08:10:01 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
Date: Mon, 23 Mar 2020 09:09:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320190737.42110-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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

T24gMjAuMDMuMjAyMCAyMDowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgZjk2ZTE0NjlhZDA2YjYxNzk2YzYwMTkzZGFhZWI5ZjhhOTZkNzQ1OC4KPiAKPiBU
aGUgY29tbWl0IGlzIHdyb25nLCBhcyB0aGUgd2hvbGUgcG9pbnQgb2YgbnZteF91cGRhdGVfYXBp
Y3YgaXMgdG8KPiB1cGRhdGUgdGhlIGd1ZXN0IGludGVycnVwdCBzdGF0dXMgZmllbGQgd2hlbiB0
aGUgQWNrIG9uIGV4aXQgVk1FWElUCj4gY29udHJvbCBmZWF0dXJlIGlzIGVuYWJsZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpC
ZWZvcmUgYW55b25lIGdldHMgdG8gbG9vayBhdCB0aGUgb3RoZXIgdHdvIHBhdGNoZXMsIHNob3Vs
ZCB0aGlzCmJlIHRocm93biBpbiByaWdodCBhd2F5PwoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
