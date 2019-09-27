Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444FC0735
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:23:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDr6B-0004HV-Ho; Fri, 27 Sep 2019 14:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDr69-0004HD-Fv
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:19:53 +0000
X-Inumbo-ID: d24184f0-e131-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d24184f0-e131-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 14:19:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 681C3B168;
 Fri, 27 Sep 2019 14:19:30 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
 <FB6109D7-6FDC-41AF-95F8-3CC65FAA1215@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1746ff41-cc4c-a64d-fe25-393819a1717b@suse.com>
Date: Fri, 27 Sep 2019 16:19:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <FB6109D7-6FDC-41AF-95F8-3CC65FAA1215@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
 Practice
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxMjoxNywgTGFycyBLdXJ0aCB3cm90ZToKPiBDYW4gSSBtYXliZSBnZXQg
eW91IHRvIHJlY29uc2lkZXIgYW5kIHJlLXJldmlldyB0aGUgbmV4dCB2ZXJzaW9uIGZyb20gdGhl
Cj4gdmlldyBwb2ludCBvZiBhbiBhdXRob3IgYW5kIG1heWJlIG1ha2Ugc3VnZ2VzdGlvbnMgb24g
aG93IHRvIGNyZWF0ZSBtb3JlCj4gYmFsYW5jZQoKSSdsbCBjZXJ0YWlubHkgbWFrZSBhbiBhdHRl
bXB0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
