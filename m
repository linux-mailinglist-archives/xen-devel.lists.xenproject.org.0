Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C69EB8E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2coI-00038M-1k; Tue, 27 Aug 2019 14:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2coG-00038C-6s
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:51:00 +0000
X-Inumbo-ID: 14b3f5c2-c8da-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14b3f5c2-c8da-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:50:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 76210ACC1;
 Tue, 27 Aug 2019 14:50:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190819134213.1628-1-andrew.cooper3@citrix.com>
 <20190819134213.1628-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e7684af-dcb6-efe9-c25b-af34f0d51074@suse.com>
Date: Tue, 27 Aug 2019 16:50:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819134213.1628-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Reposition trampoline data
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

T24gMTkuMDguMjAxOSAxNTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAuLi4gdG8gc2VwYXJh
dGUgY29kZSBmcm9tIGRhdGEuICBJbiBwYXJ0aWN1bGFyLCB0cmFtcG9saW5lX3JlYWxtb2RlX2Vu
dHJ5J3MKPiB3cml0ZSB0byB0cmFtcG9saW5lX2NwdV9zdGFydGVkIGNsb2JiZXJzIHRoZSBJLWNh
Y2hlIGxpbmUgY29udGFpbmluZwo+IHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnksIHdoaWNoIHdv
bid0IGJlIGdyZWF0IGZvciBBUCBzdGFydHVwLgo+IAo+IFJlZm9ybWF0IHRoZSBjb21tZW50cyBm
b3IgdHJhbXBvbGluZV9nZHQgdG8gcmVkdWNlIHRoZWlyIHZvbHVtZS4KPiAKPiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCiwgLi4uIHN1YmplY3QgdG8gRGF2aWQncyBjb25jZXJuIHdydCBoaXMgc2VyaWVzLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
