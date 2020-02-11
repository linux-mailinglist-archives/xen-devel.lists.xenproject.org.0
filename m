Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464D158BD2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Riy-000783-1o; Tue, 11 Feb 2020 09:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1Riw-00077y-Dt
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:20:54 +0000
X-Inumbo-ID: cc817ceb-4caf-11ea-b537-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc817ceb-4caf-11ea-b537-12813bfff9fa;
 Tue, 11 Feb 2020 09:20:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A250AF63;
 Tue, 11 Feb 2020 09:20:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200210183921.23293-1-andrew.cooper3@citrix.com>
 <20200210200921.b5753wvun6skvkaf@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <696fc4e5-8d37-0d5c-3ef0-755b349cf31e@suse.com>
Date: Tue, 11 Feb 2020 10:20:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210200921.b5753wvun6skvkaf@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/pvh: Adjust dom0's starting state
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAyMTowOSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEZlYiAxMCwgMjAy
MCBhdCAwNjozOToyMVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBGaXhlczogYjI1
ZmIxYTA0ZSAieGVuL3B2aDogRml4IHNlZ21lbnQgc2VsZWN0b3IgQUJJIgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
