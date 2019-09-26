Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8132BBEDA8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 10:44:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPKl-0005dv-QZ; Thu, 26 Sep 2019 08:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDPKj-0005do-Us
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 08:41:05 +0000
X-Inumbo-ID: 5f8c3571-e039-11e9-964a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 5f8c3571-e039-11e9-964a-12813bfff9fa;
 Thu, 26 Sep 2019 08:41:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6466EAC8E;
 Thu, 26 Sep 2019 08:41:03 +0000 (UTC)
To: Andreas Kinzler <hfp@posteo.de>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <5d406fbf-d057-a515-5364-6f0e2f6955c7@suse.com>
 <b5df65da-38a6-f7ce-b7ec-3ab6af5e4c44@posteo.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8af1562e-3daa-0284-5004-13cc04a6b243@suse.com>
Date: Thu, 26 Sep 2019 10:41:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b5df65da-38a6-f7ce-b7ec-3ab6af5e4c44@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul.Durrant@citrix.com,
 Steven Haigh <netwiz@crc.id.au>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxODo1OCwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IERvZXMgaXQgc3Rp
bGwgbWFrZSBzZW5zZSB0byB0cnkgdGhlIHBhdGNoIGdpdmVuIHRoZSBjcHVpZCBJIHBvc3RlZD8K
ClRoZSBwYXRjaCBzaG91bGRuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZSB0aGVyZSwgYWZhaWN0LgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
