Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A31B0AFA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 11:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8L4t-0005Lt-V1; Thu, 12 Sep 2019 09:07:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8L4s-0005Ln-P3
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 09:07:46 +0000
X-Inumbo-ID: c8db06e4-d53c-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8db06e4-d53c-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 09:07:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B041B633;
 Thu, 12 Sep 2019 09:07:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a452903-76d0-0038-47f4-7cb63a8beead@suse.com>
Date: Thu, 12 Sep 2019 11:07:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-9-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 8/8] x86/cpuid: Enable CPUID Faulting for
 the control domain
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZG9tYWluIGJ1
aWxkZXIgbm8gbG9uZ2VyIHVzZXMgQ1BVSUQgaW5zdHJ1Y3Rpb25zIGZvciBwb2xpY3kgZGVjaXNp
b25zLgoKSG93IGNlcnRhaW4gYXJlIHdlIHRoYXQgdGhlcmUgYXJlIG5vIG90aGVyIGNvbXBvbmVu
dHMgbGVmdCByZWx5aW5nCm9uIGJlaW5nIGFibGUgdG8gc2VlIHJhdyBDUFVJRCBvdXRwdXQgaW4g
RG9tMD8gU2FkbHkgY3VzdG9tZXJzIGFyZQpvZnRlbiBkb2luZyBzdHJhbmdlIHRoaW5ncywgaW5z
aXN0aW5nIHRoYXQgdGhleSdyZSByaWdodCBpbiBkb2luZwpzby4gRm9yIHRoaXMgcmVhc29uIEkg
d29uZGVyIHdoZXRoZXIsIGF0IGxlYXN0IGFzIGEgdHJhbnNpdGlvbmFsCm1lYXN1cmUsIHdlIHNo
b3VsZCBoYXZlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiBhbGxvd2luZyB0byByZXN0b3JlCnByaW9y
IGJlaGF2aW9yLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
