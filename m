Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60FC3810
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJRg-0003VY-Cs; Tue, 01 Oct 2019 14:48:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFJRe-0003VS-SY
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:48:06 +0000
X-Inumbo-ID: 7977d1d6-e45a-11e9-9702-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7977d1d6-e45a-11e9-9702-12813bfff9fa;
 Tue, 01 Oct 2019 14:48:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5A931AE84;
 Tue,  1 Oct 2019 14:48:04 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
 <20191001143207.15844-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5101087-a0db-50bf-8276-78f38b859aff@suse.com>
Date: Tue, 1 Oct 2019 16:48:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001143207.15844-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_ARRAY
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVyZSBhcmUgbGVn
aXRpbWF0ZSBjaXJjdW1zdGFuY2Ugd2hlcmUgYXJyYXkgaGFyZGVuaW5nIGlzIG5vdCB3YW50ZWQg
b3IKPiBuZWVkZWQuICBBbGxvdyBpdCB0byBiZSB0dXJuZWQgb2ZmLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIG9uZSBtb3JlIHF1ZXN0aW9u
IChJJ20gc29ycnksIEkgbWVhbnQgdG8gYXNrIG9uIHYxIGJ1dCB0aGVuCmZvcmdvdCk6Cgo+IC0t
LSBhL3hlbi9jb21tb24vS2NvbmZpZwo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+IEBAIC03
Nyw2ICs3NywzMCBAQCBjb25maWcgSEFTX0NIRUNLUE9MSUNZCj4gIAlzdHJpbmcKPiAgCW9wdGlv
biBlbnY9IlhFTl9IQVNfQ0hFQ0tQT0xJQ1kiCj4gIAo+ICttZW51ICJTcGVjdWxhdGl2ZSBoYXJk
ZW5pbmciCj4gKwo+ICtjb25maWcgU1BFQ1VMQVRJVkVfSEFSREVOX0FSUkFZCj4gKwlib29sICJT
cGVjdWxhdGl2ZSBBcnJheSBIYXJkZW5pbmciCj4gKwlkZWZhdWx0IHkKCkFyZSB5b3Uvd2UgY29u
dmluY2VkIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGV4cG9zZSB0aGlzIHdpdGhvdXQgRVhQRVJUCnF1
YWxpZmllcj8gSSBrbm93IHlvdSBkaXNsaWtlIHRoYXQgZW50aXJlIG1vZGVsLCBidXQgb3VyIGNv
bW1vbgpncm91bmRzIHN0aWxsIGFyZSAtIGFmYWljdCAtIHRoYXQgd2UgZG9uJ3Qgd2FudCBhIHBy
b2xpZmVyYXRpb24gb2YKKHNlY3VyaXR5KSBzdXBwb3J0ZWQgY29uZmlndXJhdGlvbiB2YXJpYXRp
b25zLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
