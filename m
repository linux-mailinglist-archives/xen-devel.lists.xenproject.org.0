Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB315358D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:47:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNnH-0007wp-5G; Wed, 05 Feb 2020 16:44:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izNnF-0007wk-AJ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:44:49 +0000
X-Inumbo-ID: d2682c2e-4836-11ea-9158-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2682c2e-4836-11ea-9158-12813bfff9fa;
 Wed, 05 Feb 2020 16:44:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC792B1B0;
 Wed,  5 Feb 2020 16:44:05 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200205161432.GU4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bf8cb99-ad56-f846-6668-52e9d3bcd3c3@suse.com>
Date: Wed, 5 Feb 2020 17:44:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205161432.GU4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/7] x86: improve assisted tlb flush and
 use it in guest mode
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxNzoxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBQaW5nPwo+IAo+
IEp1c3Qgd2FudCB0byBtYWtlIHN1cmUgdGhpcyBkb2Vzbid0IGdvIHVuZGVyIHRoZSByYWRhci4K
Ckl0J3Mgc2FmZWx5IHNpdHRpbmcgaW4gbXkgdG8tYmUtbG9va2VkLWF0IGZvbGRlciwgYnV0IHRo
ZXJlJ3MKd2F5IHRvbyBtdWNoIGVsc2UgdG8gbG9vayBhZnRlciB0byBnZXQgdG8gaXQsIHlldC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
