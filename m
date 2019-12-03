Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02010FEB5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 14:24:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic86q-0001wE-LL; Tue, 03 Dec 2019 13:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VoZh=ZZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ic86o-0001w9-V2
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 13:20:54 +0000
X-Inumbo-ID: ba0f8c25-15cf-11ea-81dd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba0f8c25-15cf-11ea-81dd-12813bfff9fa;
 Tue, 03 Dec 2019 13:20:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36DA0AD78;
 Tue,  3 Dec 2019 13:20:52 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191203103352.29728-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <529366a7-1b08-59c7-cd36-c009e4aaea00@suse.com>
Date: Tue, 3 Dec 2019 14:20:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203103352.29728-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/2] automation: improve tests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMTkgMTE6MzMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBIZWxsbywKPiAKPiBT
bWFsbCBzZXJpZXMgdG8gaW1wcm92ZSB0aGUgYXV0b21hdGVkIHRlc3RzLCBmaXJzdCBwYXRjaCBl
bmFibGVzIFhlbgo+IGNvbnNvbGUgdGltZXN0YW1wcyBhbmQgdGhlIHNlY29uZCBvbmUgaW5jcmVh
c2VzIHRoZSB0ZXN0IHRpbWVvdXQgdG8gMzBzCj4gc2luY2UgdGhlIGNsYW5nIFBWSCB0ZXN0cyBh
bHJlYWR5IHRha2VzIH4xMHMgd2l0aG91dCB0YWtpbmcgaW50byBhY2NvdW50Cj4gdGhlIHRpbWUg
dG8gaW5pdGlhbGl6ZSBRRU1VLgo+IAo+IFRoYW5rcywgUm9nZXIuCj4gCj4gUm9nZXIgUGF1IE1v
bm5lICgyKToKPiAgICBhdXRvbWF0aW9uOiBhZGQgdGltZXN0YW1wcyB0byBYZW4gdGVzdHMKPiAg
ICBhdXRvbWF0aW9uOiBpbmNyZWFzZSB0ZXN0cyBtYXhpbXVtIHRpbWUgZnJvbSAxMHMgdG8gMzBz
Cj4gCj4gICBhdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS14ODYtNjQuc2ggfCA1ICsrKy0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAoK
Rm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
