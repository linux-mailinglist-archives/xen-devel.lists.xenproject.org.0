Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596111E586
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:25:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflqL-0003xu-BG; Fri, 13 Dec 2019 14:22:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iflqK-0003xp-7w
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:22:56 +0000
X-Inumbo-ID: 0dd341de-1db4-11ea-8f1d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0dd341de-1db4-11ea-8f1d-12813bfff9fa;
 Fri, 13 Dec 2019 14:22:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EA31B14A;
 Fri, 13 Dec 2019 14:22:54 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52ba5440212540e691d0e998ff44448c@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d050059e-adc7-7142-e933-b569ea34bac2@suse.com>
Date: Fri, 13 Dec 2019 15:23:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <52ba5440212540e691d0e998ff44448c@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNDo1MywgRHVycmFudCwgUGF1bCB3cm90ZToKPiBTaW5jZSAqbm90KiBo
YXZpbmcgdGhlICdzaW5rJyBwYWdlIGFsbG93cyBhIGd1ZXN0IHB1bGwgb2ZmIGEgaG9zdCBEb1MK
PiBpbiB0aGUgcHJlc2VuY2Ugb2Ygc3VjaCBoL3csIHNlY3VyaXR5IGlzIHN1cmVseSBpbmNyZWFz
ZWQgYnkgaGF2aW5nIGl0PwoKaG9zdAkJZGV2aWNlCQlyZXN1bHQgdy9vIHNpbmsJCXJlc3VsdCB3
LyBzaW5rCmdvb2QJCWdvb2QJCWdvb2QJCQlnb29kCmdvb2QJCWJhYmJsaW5nCWdvb2QgCQkJZ29v
ZAp3ZWRnZSBvbiBmYXVsdAlnb29kCQlEb1MgKHJ1bnRpbWUpCQlEb1MgKHJ1bnRpbWUpCndlZGdl
IG9uIGZhdWx0CWJhYmJsaW5nCURvUyAocnVudGltZS9sYXRlKQlEb1MgKHJ1bnRpbWUgb25seSwg
c2lsZW50KQoKSSB3b3VsZG4ndCBjYWxsIGl0IGFuIGluY3JlYXNlIG9mIHNlY3VyaXR5IHRvIGZ1
bGx5IGhpZGUgcG9zdC0KZGVhc3NpZ25tZW50IGlzc3VlcyB3aXRob3V0IGRvaW5nIGFueXRoaW5n
IGFib3V0IGlzc3VlcyB0aGF0IGNhbgphcmlzZSB3aGlsZSB0aGUgZGV2aWNlIGlzIHN0aWxsIGFz
c2lnbmVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
