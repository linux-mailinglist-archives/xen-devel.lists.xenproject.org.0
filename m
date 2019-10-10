Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A361ED244C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 10:53:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIU7A-0002a9-UB; Thu, 10 Oct 2019 08:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iIU79-0002a0-Fm
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 08:48:03 +0000
X-Inumbo-ID: ab187a74-eb3a-11e9-97fe-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab187a74-eb3a-11e9-97fe-12813bfff9fa;
 Thu, 10 Oct 2019 08:48:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA6BFAE7F;
 Thu, 10 Oct 2019 08:48:01 +0000 (UTC)
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20191010083209.4702-1-huangfq.daxian@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2666dce3-0897-961c-548c-8f4bbbc63dc1@suse.com>
Date: Thu, 10 Oct 2019 10:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191010083209.4702-1-huangfq.daxian@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: remove unnecessary printing
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMTkgMTA6MzIsIEZ1cWlhbiBIdWFuZyB3cm90ZToKPiB4ZW5fYXV0b194bGF0X2dy
YW50X2ZyYW1lcy52YWRkciBpcyBkZWZpbml0ZWx5IE5VTEwgaW4gdGhpcyBjYXNlLgo+IFNvIHRo
ZSBhZGRyZXNzIHByaW50aW5nIGlzIHVubmVjZXNzYXJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZ1
cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
