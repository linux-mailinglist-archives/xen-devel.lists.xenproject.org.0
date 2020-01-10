Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A638137288
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:11:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwpe-0000Ue-3w; Fri, 10 Jan 2020 16:08:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipwpc-0000UX-B1
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:08:16 +0000
X-Inumbo-ID: 68429821-33c3-11ea-bf53-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68429821-33c3-11ea-bf53-12813bfff9fa;
 Fri, 10 Jan 2020 16:08:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2407B15D;
 Fri, 10 Jan 2020 16:08:14 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200110160404.15573-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43caf284-1725-19b9-94a6-a2545ff5f21e@suse.com>
Date: Fri, 10 Jan 2020 17:08:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200110160404.15573-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/3] x86: improve assisted tlb flush and
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDEuMjAyMCAxNzowNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFBhdGNoICMyIGlz
IGxpa2VseSB0aGUgbW9zdCBjb250cm92ZXJzaWFsIG9uZSwgYXMgaXQgY2hhbmdlcyB0aGUKPiBp
bXBsZW1lbnRhdGlvbiBvZiBhc3Npc3RlZCBUTEIgZmx1c2hlcy4gSSBoYXZlIHRvIGFkbWl0IEkg
aGF2ZW4ndCBiZWVuCj4gYWJsZSB0byBmaWd1cmUgb3V0IHdoeSBIVk0gZ3Vlc3QgY29udGV4dCBm
bHVzaGVzIGlzc3VlZCBhCj4gZmx1c2hfdGxiX21hc2ssIGFuZCB0aGUgY29tbWl0IGludHJvZHVj
aW5nIHN1Y2ggYmVoYXZpb3IgZG9lc24ndCBjb250YWluCj4gYSBoZWxwZnVsIGNvbW1pdCBtZXNz
YWdlLgoKQSBzaGFkb3cgbW9kZSB0aGluZywgbWF5YmU/CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
