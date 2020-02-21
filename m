Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F0F167F19
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 14:51:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58fT-0003P0-SG; Fri, 21 Feb 2020 13:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j58fR-0003Ov-T2
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 13:48:33 +0000
X-Inumbo-ID: d8820041-54b0-11ea-8664-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8820041-54b0-11ea-8664-12813bfff9fa;
 Fri, 21 Feb 2020 13:48:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 896E6AFA7;
 Fri, 21 Feb 2020 13:48:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200220195845.5676-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a9cb7ca-317d-16e2-3528-04275e1fde47@suse.com>
Date: Fri, 21 Feb 2020 14:48:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220195845.5676-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/splitlock: CPUID and MSR details
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

T24gMjAuMDIuMjAyMCAyMDo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBIHNwbGl0bG9jayBp
cyBhbiBhdG9taWMgb3BlcmF0aW9uIHdoaWNoIGNyb3NzZXMgYSBjYWNoZSBsaW5lIGJvdW5kYXJ5
LiAgSXQKPiBzZXJpYWxpc2VzIG9wZXJhdGlvbnMgaW4gdGhlIGNhY2hlIGNvaGVyZW5jeSBmYWJy
aWMgYW5kIGNvbWVzIHdpdGggYQo+IG11bHRpLXRob3VzYW5kIGN5Y2xlIHN0YWxsLgo+IAo+IElu
dGVsIFRyZW1vbnQgQ1BVcyBpbnRyb2R1Y2UgTVNSX0NPUkVfQ0FQUyB0byBlbnVtZXJhdGUgdmFy
aW91cyBjb3JlLXNwZWNpZmljCj4gZmVhdHVyZXMsIGFuZCBNU1JfVEVTVF9DVFJMIHRvIGFkanVz
dCB0aGUgYmVoYXZpb3VyIGluIHRoZSBjYXNlIG9mIGEKPiBzcGxpdGxvY2suCj4gCj4gVmlydHVh
bGlzaW5nIHRoaXMgZm9yIGd1ZXN0cyBpcyBkaXN0aW5jdGx5IHRyaWNreSBvd2luZyB0byB0aGUg
ZmFjdCB0aGF0Cj4gTVNSX1RFU1RfQ1RSTCBoYXMgY29yZSByYXRoZXIgdGhhbiB0aHJlYWQgc2Nv
cGUuICBJbiB0aGUgbWVhbnRpbWUgaG93ZXZlciwKPiBwcmV2ZW50IHRoZSBNU1IgdmFsdWVzIGxl
YWtpbmcgaW50byBndWVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkZlZWwgZnJlZSB0byB0aHJvdyBpbiAtIHdpdGggV2Vp
J3MgUi1iIHlvdSBkb24ndCBuZWVkIG15IGFjayBhbnltb3JlLApidXQgSSB0aG91Z2h0IEknZCBy
ZXBseSBhbnl3YXkgdG8gYXZvaWQgeW91IGhhdmluZyB0byB3YWl0IGEgY291cGxlCm9mIGRheXMu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
