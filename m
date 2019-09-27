Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A36CC080E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDre8-0000OW-Ks; Fri, 27 Sep 2019 14:55:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDre6-0000OI-ML
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:54:58 +0000
X-Inumbo-ID: c5790086-e136-11e9-967b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c5790086-e136-11e9-967b-12813bfff9fa;
 Fri, 27 Sep 2019 14:54:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97814AD2A;
 Fri, 27 Sep 2019 14:54:56 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06e542f4-1ac5-0a70-eb34-3dcd1b543134@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6c171fcb-8598-49f2-f8ca-87154b2bcdc3@suse.com>
Date: Fri, 27 Sep 2019 16:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <06e542f4-1ac5-0a70-eb34-3dcd1b543134@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: correct bogus error indicator of
 cpu_add()
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTY6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCA1NGNlMmRiOGI4
ICgieDg2L251bWE6IGFkanVzdCBkYXRhdHlwZXMgZm9yIG5vZGUgYW5kIHB4bSIpCj4gY2hhbmdl
ZCB0aGlzIGZyb20gdGhlIC0xIChpLmUuIC1FUEVSTSwgd2hpY2ggd2FzIGFscmVhZHkgYm9ndXMp
IHRoYXQKPiBjb21lcyBiYWNrIGZyb20gc2V0dXBfbm9kZSgpIHRvIE5VTUFfTk9fTk9ERSAoMHhm
ZikuIFVzZSBhIHByb3BlciBlcnJvcgo+IGluZGljYXRvciBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
