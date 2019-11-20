Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67651103529
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 08:30:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXKP1-0006EU-AF; Wed, 20 Nov 2019 07:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXKOz-0006EP-M1
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 07:27:49 +0000
X-Inumbo-ID: 40bb4f2e-0b67-11ea-a309-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40bb4f2e-0b67-11ea-a309-12813bfff9fa;
 Wed, 20 Nov 2019 07:27:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0741AF3F;
 Wed, 20 Nov 2019 07:27:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191119170019.18450-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28619eda-3e94-7cb7-b9aa-3393b4be34ca@suse.com>
Date: Wed, 20 Nov 2019 08:27:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119170019.18450-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/cpuid: Fix Lisbon/Magny-Cours
 Opterons WRT SSSE3/SSE4A
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

T24gMTkuMTEuMjAxOSAxODowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgZmY2NmNjZWZl
NSAieDg2L0NQVUlEOiBhZGp1c3QgU1NFbiBkZXBlbmRlbmNpZXMiIG1hZGUgU1NFNEEgZGVwZW5k
IG9uCj4gU1NTRTMsIGJ1dCB0aGVzZSBwcm9jZXNzb3JzIHJlYWxseSBkbyBoYXZlIGhhdmUgU1NF
NEEgd2l0aG91dCBTU1NFMy4KPiAKPiBUaGlzIG1hbmlmZXN0cyBhcyBhbiB1cGdyYWRlIHJlZ3Jl
c3Npb24sIGFzIHRoZSBTU0U0QSBmZWF0dXJlIGRpc2FwcGVhcnMgZnJvbQo+IHZpZXcuCj4gCj4g
QWRqdXN0IHRoZSBTU0U0QSBmZWF0dXJlIHRvIGRlcGVuZCBvbiBTU0UzIHJhdGhlciB0aGFuIFNT
U0UzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
TmV2ZXJ0aGVsZXNzIGEgcmVtYXJrOgoKPiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4g
KysrIGIveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQo+IEBAIC0yMDUsOSArMjA1LDEwIEBAIGRlZiBj
cnVuY2hfbnVtYmVycyhzdGF0ZSk6Cj4gICAgICAgICAgIyB0aGFuIHRvIFNTRS4KPiAgICAgICAg
ICBTU0UyOiBbU1NFMywgTE0sIEFFU05JLCBQQ0xNVUxRRFEsIFNIQSwgR0ZOSV0sCj4gIAo+IC0g
ICAgICAgICMgT3RoZXIgU1NFbiBlYWNoIGRlcGVuZCBvbiB0aGVpciBwcmVkZWNlc3NvciB2ZXJz
aW9ucy4KPiAtICAgICAgICBTU0UzOiBbU1NTRTNdLAo+IC0gICAgICAgIFNTU0UzOiBbU1NFNF8x
LCBTU0U0QV0sCj4gKyAgICAgICAgIyBPdGhlciBTU0VuIGVhY2ggZGVwZW5kIG9uIHRoZWlyIHBy
ZWRlY2Vzc29yIHZlcnNpb25zLiAgQU1ECj4gKyAgICAgICAgIyBMaXNib24vTWFnbnktQ291cnMg
cHJvY2Vzc29ycyBpbXBsZW1lbnRlZCBTU0U0QSB3aXRob3V0IFNTU0UzLgo+ICsgICAgICAgIFNT
RTM6IFtTU1NFMywgU1NFNEFdLAo+ICsgICAgICAgIFNTU0UzOiBbU1NFNF8xXSwKPiAgICAgICAg
ICBTU0U0XzE6IFtTU0U0XzJdLAoKSWYgd2UnZCBiZSB0YWtpbmcgdGhlIFNETSBieSB0aGUgd29y
ZCwgdGhpcyB3b3VsZCBzdGlsbCBiZSB0b28gcmVzdHJpY3RpdmUuCkkgc3VwcG9zZSB0aG91Z2gg
aXQncyBiZWVuIG1vcmUgYSBjb3B5LWFuZC1wYXN0ZSBlZmZlY3QgdGhhdCBoYXMgbGVhZCB0bzoK
CiJCZWZvcmUgYW4gYXBwbGljYXRpb24gYXR0ZW1wdHMgdG8gdXNlIHRoZSBTSU1EIHN1YnNldCBv
ZiBTU0UzIGV4dGVuc2lvbnMsCiB0aGUgYXBwbGljYXRpb24gc2hvdWxkIGZvbGxvdyB0aGUgc3Rl
cHMgaWxsdXN0cmF0ZWQgaW4gU2VjdGlvbiAxMS42LjIsCiDigJxDaGVja2luZyBmb3IgU1NFL1NT
RTIgU3VwcG9ydC7igJ0gTmV4dCwgdXNlIHRoZSBhZGRpdGlvbmFsIHN0ZXAgcHJvdmlkZWQKIGJl
bG93Ogog4oCiIENoZWNrIHRoYXQgdGhlIHByb2Nlc3NvciBzdXBwb3J0cyB0aGUgU0lNRCBhbmQg
eDg3IFNTRTMgZXh0ZW5zaW9ucyAoaWYKICAgQ1BVSUQuMDFIOkVDWC5TU0UzW2JpdCAwXSA9IDEp
LiIKCiJCZWZvcmUgYW4gYXBwbGljYXRpb24gYXR0ZW1wdHMgdG8gdXNlIHRoZSBTU1NFMyBleHRl
bnNpb25zLCB0aGUgYXBwbGljYXRpb24KIHNob3VsZCBmb2xsb3cgdGhlIHN0ZXBzIGlsbHVzdHJh
dGVkIGluIFNlY3Rpb24gMTEuNi4yLCDigJxDaGVja2luZyBmb3IKIFNTRS9TU0UyIFN1cHBvcnQu
4oCdIE5leHQsIHVzZSB0aGUgYWRkaXRpb25hbCBzdGVwIHByb3ZpZGVkIGJlbG93OgrigKIgQ2hl
Y2sgdGhhdCB0aGUgcHJvY2Vzc29yIHN1cHBvcnRzIFNTU0UzIChpZiBDUFVJRC4wMUg6RUNYLlNT
U0UzW2JpdCA5XSA9IDEpLiIKCldoaWNoIHdvdWxkIGltcGx5IFNTU0UzIG9ubHkgdGFrZXMgU1NF
MiAoYW5kIGltcGxpY2l0bHkgU1NFKSBhcyBwcmVyZXEuCkFzIG9wcG9zZWQ6CgoiQmVmb3JlIGFu
IGFwcGxpY2F0aW9uIGF0dGVtcHRzIHRvIHVzZSBTU0U0LjEgaW5zdHJ1Y3Rpb25zLCB0aGUgYXBw
bGljYXRpb24KIHNob3VsZCBmb2xsb3cgdGhlIHN0ZXBzIGlsbHVzdHJhdGVkIGluIFNlY3Rpb24g
MTEuNi4yLCDigJxDaGVja2luZyBmb3IKIFNTRS9TU0UyIFN1cHBvcnQu4oCdIE5leHQsIHVzZSB0
aGUgYWRkaXRpb25hbCBzdGVwIHByb3ZpZGVkIGJlbG93OgogQ2hlY2sgdGhhdCB0aGUgcHJvY2Vz
c29yIHN1cHBvcnRzIFNTRTQuMSAoaWYKIENQVUlELjAxSDpFQ1guU1NFNF8xW2JpdCAxOV0gPSAx
KSwgU1NFMyAoaWYgQ1BVSUQuMDFIOkVDWC5TU0UzW2JpdCAwXSA9IDEpLAogYW5kIFNTU0UzIChp
ZiBDUFVJRC4wMUg6RUNYLlNTU0UzW2JpdCA5XSA9IDEpLiIKClNpbWlsYXIgdGV4dCBpcyB0aGVy
ZSBmb3IgZm9yIFNTRTQuMiwgdGFraW5nIGFkZGl0aW9uYWxseSBTU0U0LjEgYXMgcHJlcmVxLgoK
SSdsbCBmaXJlIG9mZiBhbiBlbWFpbCB0byBJbnRlbCByZXF1ZXN0aW5nIGNsYXJpZmljYXRpb24u
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
