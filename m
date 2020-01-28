Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC73E14BE1B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:54:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwU65-0001QO-GA; Tue, 28 Jan 2020 16:52:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwU63-0001QJ-F2
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:52:15 +0000
X-Inumbo-ID: 88d09f19-41ee-11ea-8739-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88d09f19-41ee-11ea-8739-12813bfff9fa;
 Tue, 28 Jan 2020 16:52:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1943CAFB2;
 Tue, 28 Jan 2020 16:52:14 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <f499998850729f19cc8486222ccc93e274ea441d.1580148227.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f728b220-bd51-3b60-a9bc-82687819bc12@suse.com>
Date: Tue, 28 Jan 2020 17:52:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <f499998850729f19cc8486222ccc93e274ea441d.1580148227.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 4/9] x86/mem_sharing: Replace
 MEM_SHARING_DEBUG with gdprintk
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFVzaW5nIFhFTkxP
R19FUlIgbGV2ZWwgc2luY2UgdGhpcyBpcyBvbmx5IHVzZWQgaW4gZGVidWcgcGF0aHMgKGllLiBp
dCdzCj4gZXhwZWN0ZWQgdGhlIHVzZXIgYWxyZWFkeSBoYXMgbG9nbHZsPWFsbCBzZXQpLiBBbHNv
IHVzZSAlcGQgdG8gcHJpbnQgdGhlIGRvbWFpbgo+IGlkcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgoKQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
