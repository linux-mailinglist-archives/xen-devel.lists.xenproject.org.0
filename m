Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF2217FED0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 14:41:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBf5Y-0004G5-84; Tue, 10 Mar 2020 13:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBf5W-0004Fx-Qx
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:38:26 +0000
X-Inumbo-ID: 6a48e4b8-62d4-11ea-ada3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a48e4b8-62d4-11ea-ada3-12813bfff9fa;
 Tue, 10 Mar 2020 13:38:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD64FAE89;
 Tue, 10 Mar 2020 13:38:23 +0000 (UTC)
To: paul@xen.org
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
 <e46984e6-9b86-dfb5-9b2b-7772fb700352@suse.com>
 <001001d5f6d8$957be030$c073a090$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17fdf9d5-d14d-50a6-9ffa-a3b2c53f574e@suse.com>
Date: Tue, 10 Mar 2020 14:38:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001001d5f6d8$957be030$c073a090$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, 'Varad Gautam' <vrd@amazon.de>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Julien Grall' <julien@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxMzozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE9rLCBJJ2xsIGNvbnZl
cnQgYmFjayB0byBhIEJVRygpLgoKV2FpdCBhIGxpdHRsZSAtIEkgdGhpbmsgSSBoYXZlIGFuIGFs
dGVybmF0aXZlIHByb3Bvc2FsLiBKdXN0IHdhbnQgdG8KYXQgbGVhc3Qgc21va2UgdGVzdCBpdCBi
ZWZvcmUgc2VuZGluZyBvdXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
