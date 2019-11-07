Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552EF32E4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:23:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjaA-0007Fm-Vv; Thu, 07 Nov 2019 15:20:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSja8-0007Fh-VZ
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:20:21 +0000
X-Inumbo-ID: 1bf39b00-0172-11ea-a1c9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bf39b00-0172-11ea-a1c9-12813bfff9fa;
 Thu, 07 Nov 2019 15:20:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30CEEB280;
 Thu,  7 Nov 2019 15:20:19 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191107150609.93004-1-roger.pau@citrix.com>
 <20191107150609.93004-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c6b0734-ac3b-a25b-8e4c-cc368eb4f986@suse.com>
Date: Thu, 7 Nov 2019 16:20:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107150609.93004-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 1/2] x86/ioapic: remove usage of
 TRUE and FALSE in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMjAxOSAxNjowNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFuZCBpbnN0ZWFk
IHVzZSBwcm9wZXIgYm9vbGVhbnMuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
T3RoZXIgdGhhbiBBbmRyZXcgSSB0aGluayB0aGlzIGlzIGZpbmUgd2l0aG91dCBmdXJ0aGVyIGV4
dGVuc2lvbiwKaS5lLgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpP
ZiBjb3Vyc2UgdGhpcyBpc24ndCB0byBzYXkgdGhhdCBJIHdvdWxkbid0IHdlbGNvbWUgYSBtb3Jl
IGNvbXBsZXRlCmNsZWFudXAsIGFzIHN1Z2dlc3RlZCBieSBoaW0uCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
