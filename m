Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D770F9EB38
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:38:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2caH-0001TG-VS; Tue, 27 Aug 2019 14:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2caG-0001TA-TK
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:36:32 +0000
X-Inumbo-ID: 0f672578-c8d8-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f672578-c8d8-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 14:36:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94505ACC1;
 Tue, 27 Aug 2019 14:36:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190814104404.17739-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5fa4def-f574-e37e-1973-02a3d1931c2d@suse.com>
Date: Tue, 27 Aug 2019 16:36:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814104404.17739-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Annotate pagetables with
 STT_OBJECT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDguMjAxOSAxMjo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJbnRyb2R1Y2UgYSBu
ZXcgRU5EREFUQSgpIGhlbHBlciB3aGljaCBzZXRzIHR5cGUgYW5kIHNpemUgdG9nZXRoZXIuCgpF
eGNlcHQgdGhpcyBpc24ndCB2ZXJ5IG5hdHVyYWw6IFNldHRpbmcgdGhlIHNpemUgbGF0ZSBpcyBx
dWl0ZQpjb21tb24sIHRvIGF2b2lkIHRoZSBuZWVkIGZvciBhbiAiZW5kIiBsYWJlbC4gQnV0IHRo
ZSB0eXBlIHdvdWxkCmJldHRlciBiZSBzZXQgdG9nZXRoZXIgd2l0aCB0aGUgbGFiZWwgZGVmaW5p
dGlvbiwgaS5lLiBieSBhCkdMT0JBTCgpIGNvdW50ZXJwYXJ0IChlLmcuIEdMT0JBTF9EQVRBKCkp
LiBIb3dldmVyLCBpZiBkZXNwaXRlCnRoaXMgcmVtYXJrIHlvdSB0aGluayB5b3VyIGFwcHJvYWNo
IGlzIHRoZSB3YXkgdG8gZ286Cgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
