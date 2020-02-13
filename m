Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE315BC3A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:57:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BCr-0005Lk-KF; Thu, 13 Feb 2020 09:54:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2BCq-0005LC-0e
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:54:48 +0000
X-Inumbo-ID: ddf7d164-4e46-11ea-b86c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddf7d164-4e46-11ea-b86c-12813bfff9fa;
 Thu, 13 Feb 2020 09:54:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BF09AC79;
 Thu, 13 Feb 2020 09:54:46 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-2-roger.pau@citrix.com>
 <20200212230526.jr3hgd6imgvcvfmi@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36506b64-e6be-a8fe-e871-0f8016cc84f7@suse.com>
Date: Thu, 13 Feb 2020 10:54:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212230526.jr3hgd6imgvcvfmi@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/smp: unify header includes in smp.h
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAwMDowNSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEZlYiAxMiwgMjAy
MCBhdCAwNTo0OTo0N1BNICswMTAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+IFVuaWZ5IHRo
ZSB0d28gYWRqYWNlbnQgaGVhZGVyIGluY2x1ZGVzIHRoYXQgYXJlIGJvdGggZ2F0ZWQgd2l0aCBp
Zm5kZWYKPj4gX19BU1NFTUJMWV9fLgo+Pgo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRl
ZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
