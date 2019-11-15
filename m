Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7BFE0F9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:13:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdGm-0002tF-B9; Fri, 15 Nov 2019 15:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVdGk-0002t6-OJ
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:12:18 +0000
X-Inumbo-ID: 4f76d2b5-07ba-11ea-a274-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f76d2b5-07ba-11ea-a274-12813bfff9fa;
 Fri, 15 Nov 2019 15:12:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AFF18B44F;
 Fri, 15 Nov 2019 15:12:16 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <136f8a63b7e381af7a6134721ab6c63dac4e4654.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60964610-caf4-6019-3a72-2573e67b6422@suse.com>
Date: Fri, 15 Nov 2019 16:12:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <136f8a63b7e381af7a6134721ab6c63dac4e4654.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/9] x86: move some xen mm function
 declarations
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGV5IHdlcmUgcHV0IGludG8gcGFnZS5oIGJ1dCBt
bS5oIGlzIG1vcmUgYXBwcm9wcmlhdGUuCj4gCj4gVGhlIHJlYWwgcmVhc29uIGlzIHRoYXQgSSB3
aWxsIGJlIGFkZGluZyBzb21lIG5ldyBmdW5jdGlvbnMgd2hpY2gKPiB0YWtlcyBtZm5fdC4gSXQg
dHVybnMgb3V0IGl0IGlzIGEgYml0IGRpZmZpY3VsdCB0byBkbyBpbiBwYWdlLmguCj4gCj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cndp
dGggb25lIGZ1cnRoZXIgcmVxdWVzdDoKCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
Cj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gQEAgLTYzMCw0ICs2MzAsOSBAQCBp
bnQgYXJjaF9hY3F1aXJlX3Jlc291cmNlKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB0
eXBlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpZCwgdW5zaWdu
ZWQgbG9uZyBmcmFtZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
bnJfZnJhbWVzLCB4ZW5fcGZuX3QgbWZuX2xpc3RbXSk7Cj4gIAo+ICsvKiBBbGxvY2F0b3IgZnVu
Y3Rpb25zIGZvciBYZW4gcGFnZXRhYmxlcy4gKi8KPiArdm9pZCAqYWxsb2NfeGVuX3BhZ2V0YWJs
ZSh2b2lkKTsKPiArdm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdik7Cj4gK2wxX3BnZW50
cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdik7CgpDYW4gdGhlc2UgcGxlYXNl
IGJlIHB1dCBuZXh0IHRvIGUuZy4gZG9fcGFnZV93YWxrKCk/CgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
