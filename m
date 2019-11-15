Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A639BFDDD7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:28:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVagZ-0007JT-Hy; Fri, 15 Nov 2019 12:26:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVagY-0007Ij-W7
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:26:47 +0000
X-Inumbo-ID: 300d4a00-07a3-11ea-a268-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 300d4a00-07a3-11ea-a268-12813bfff9fa;
 Fri, 15 Nov 2019 12:26:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4931FAF76;
 Fri, 15 Nov 2019 12:26:45 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3e049cac-e585-a4ba-b4f6-9687bfd2806f@suse.com>
Date: Fri, 15 Nov 2019 13:26:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191114180542.1016867-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMTkgMTk6MDUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdpdGggJChUQVJHRVQp
LmVmaSBkZXBlbmRpbmcgb24gZWZpL3JlbG9jcy1kdW1teS5vLCBhcmNoL3g4Ni9NYWtlZmlsZQo+
IHdpbGwgYXR0ZW1wdCB0byBidWlsZCB0aGF0IG9iamVjdC4gVGhpcyByZXN1bHQgaW4gdGhlIGRl
cGVuZGVuY3kgZmlsZQo+IGJlZW4gZ2VuZXJhdGVkIHdpdGggcmVsb2NzLWR1bW15Lm8gZGVwZW5k
aW5nIG9uIGVmaS9yZWxvY3MtZHVtbXkuby4KPiAKPiBUaGVuLCB3aGVuIGFyY2gveDg2L2VmaS9N
YWtlZmlsZSB0cmllcyB0byBidWlsZCByZWxvY3MtZHVtbXkubywgd2VsbAo+IGVmaS9yZWxvY3Mt
ZHVtbXkuUyBkb2Vzbid0IGV4aXN0Lgo+IAo+IEhhdmUgb25seSBvbmUgbWFrZWZpbGUgcmVzcG9u
c2libGUgZm9yIGJ1aWxkaW5nIHJlbG9jcy1kdW1teS5vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
