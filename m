Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED331188CA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 13:48:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieetZ-00046z-Hn; Tue, 10 Dec 2019 12:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieetY-00046u-Q7
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 12:45:40 +0000
X-Inumbo-ID: f81c477a-1b4a-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f81c477a-1b4a-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 12:45:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BBE57AC23;
 Tue, 10 Dec 2019 12:45:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
 <20191207211634.9958-4-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <352fb051-a722-a4ba-0fec-bf45cdbfb367@suse.com>
Date: Tue, 10 Dec 2019 13:45:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191207211634.9958-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] xen/build: Automatically locate a
 suitable python interpreter
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTIuMTkgMjI6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gTmVlZGluZyB0byBwYXNz
IFBZVEhPTj1weXRob24zIGludG8gaHlwZXJ2aXNvciBidWlsZHMgaXMgaXJyaXRhdGluZyBhbmQK
PiB1bm5lY2Vzc2FyeS4gIExvY2F0ZSBhIHN1aXRhYmxlIGludGVycHJldGVyIGF1dG9tYXRpY2Fs
bHksIGRlZmF1bHRpbmcgdG8gUHkzCj4gaWYgaXQgaXMgYXZhaWxhYmxlLgo+IAo+IFJlcG9ydGVk
LWJ5OiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
