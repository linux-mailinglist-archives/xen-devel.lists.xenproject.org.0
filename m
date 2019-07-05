Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904856068D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 15:25:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOAv-0004Cm-U0; Fri, 05 Jul 2019 13:22:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vD9p=VC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hjOAu-0004Ch-Sd
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:22:52 +0000
X-Inumbo-ID: fcd48dec-9f27-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fcd48dec-9f27-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 13:22:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4ABFAFAB;
 Fri,  5 Jul 2019 13:22:49 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9443019a-34a9-c26c-d33c-51e163f0e056@suse.com>
Date: Fri, 5 Jul 2019 15:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMTkgMTU6MTcsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGkgSnVlcmdlbiwKPiAK
PiBJIGRpZCBzb21lIHRlc3Rpbmcgb2YgdGhpcyBzZXJpZXMgKHdpdGggc2NoZWQtZ3Jhbj1jb3Jl
KSBhbmQgcG9zdGluZyBhIGNvdXBsZSBvZgo+IGNyYXNoIGJhY2t0cmFjZXMgaGVyZSBmb3IgeW91
ciBpbmZvcm1hdGlvbi4KPiAKPiBBZGRpdGlvbmFsbHksIHJlc3VtaW5nIGEgRGViaWFuIDcgZ3Vl
c3QgYWZ0ZXIgc3VzcGVuZCBpcyBicm9rZW4uCj4gCj4gSSB3aWxsIGJlIGFibGUgdG8gcHJvdmlk
ZSBhbnkgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBvbmx5IGFmdGVyIFhlblN1bW1pdCA6KQoKVGhh
bmtzIGZvciB0aGUgcmVwb3J0cyEKCkkgd2lsbCBsb29rIGF0IHRoaXMgYWZ0ZXIgWGVuU3VtbWl0
LiA6LSkKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
