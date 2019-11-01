Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA8EBDC3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 07:20:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQQG3-0005Gl-HY; Fri, 01 Nov 2019 06:18:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ES3X=YZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iQQG2-0005Gd-JL
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 06:18:02 +0000
X-Inumbo-ID: 594dbcea-fc6f-11e9-9551-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 594dbcea-fc6f-11e9-9551-12813bfff9fa;
 Fri, 01 Nov 2019 06:17:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DAD65B01D;
 Fri,  1 Nov 2019 06:17:57 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191031115829.74378-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5e3ed175-bc9b-054b-8bb5-1a8ce0b55a06@suse.com>
Date: Fri, 1 Nov 2019 07:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031115829.74378-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/shim: copy back the result of
 EVTCHNOP_status
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMTkgMTI6NTgsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBUaGUgZXZlbnQgY2hh
bm5lbCBkYXRhIHdhcyBub3QgY29waWVkIGJhY2sgdG8gZ3Vlc3QgbWVtb3J5LCBmaXggdGhpcwo+
IGJ5IGRvaW5nIHRoZSBjb3B5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
