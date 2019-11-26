Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022B10A02E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:23:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbi8-0000WJ-TL; Tue, 26 Nov 2019 14:21:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZbi7-0000WE-Uw
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:20:59 +0000
X-Inumbo-ID: f72e9eba-1057-11ea-a3a2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f72e9eba-1057-11ea-a3a2-12813bfff9fa;
 Tue, 26 Nov 2019 14:20:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5A95BA81;
 Tue, 26 Nov 2019 14:20:57 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <696c79eb-0129-4278-3605-c862c77e1845@suse.com>
Date: Tue, 26 Nov 2019 15:20:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191126141026.2858622-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMTkgMTU6MTAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gQ2hhbmdlc2V0cyAzMTlm
OWEwYmE5ICgicGFzc3Rocm91Z2g6IHF1YXJhbnRpbmUgUENJIGRldmljZXMiKSBhbmQKPiBiYTJh
YjAwYmJiICgiSU9NTVU6IGRlZmF1bHQgdG8gYWx3YXlzIHF1YXJhbnRpbmluZyBQQ0kgZGV2aWNl
cyIpCj4gaW50cm9kdWNlZCBQQ0kgZGV2aWNlICJxdWFyYW50aW5lIiBiZWhhdmlvciwgYnV0IGRp
ZCBub3QgZG9jdW1lbnQgaG93Cj4gdGhlIHBjaS1hc3NpZ25hYmxlLWFkZCBhbmQgLXJlbW92ZSBm
dW5jdGlvbnMgYWN0IGluIHJlZ2FyZCB0byB0aGlzLgo+IFJlY3RpZnkgdGhpcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
