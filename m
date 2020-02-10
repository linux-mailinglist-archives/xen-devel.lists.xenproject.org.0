Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BA157E03
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 15:59:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1AU7-00089E-Hf; Mon, 10 Feb 2020 14:56:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1AU6-000897-G7
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:56:26 +0000
X-Inumbo-ID: 80ccca22-4c15-11ea-b4d5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ccca22-4c15-11ea-b4d5-12813bfff9fa;
 Mon, 10 Feb 2020 14:56:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7259FAC4B;
 Mon, 10 Feb 2020 14:56:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-2-andrew.cooper3@citrix.com>
 <199147c5-1769-5cbb-9848-325e42952bcc@suse.com>
 <57f91310-d029-ac83-0326-d6136db69c8d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40360da6-0d68-b7a9-3140-88db2a532e7a@suse.com>
Date: Mon, 10 Feb 2020 15:56:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <57f91310-d029-ac83-0326-d6136db69c8d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] AMD/IOMMU: Move headers to be local
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxNTozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wMi8yMDIw
IDA5OjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFdlIGN1cnJlbnRseSBoYXZlIGFtZC1pb21tdS1kZWZzLmgsIGFt
ZC1pb21tdS1wcm90by5oIGFuZCBhbWQtaW9tbXUuaCwgYW5kIG5vCj4+PiByZWZlcmVuY2VzIG91
dHNpZGUgb2YgdGhlIEFNRCBJT01NVSBkcml2ZXIuCj4+Pgo+Pj4gS2VlcCBpb21tdS1kZWZzLmgg
YXMgaXMsIGJ1dCBtZXJnZSBhbWQtaW9tbXUuaCBhbmQgYW1kLWlvbW11LXByb3RvLmggdG8ganVz
dAo+Pj4gaW9tbXUuaCwgYW5kIG1vdmUgdGhlbSBib3RoIGludG8gZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvLiAgKFdoaWxlIG1lcmdpbmcsCj4+PiBkcm9wIHRoZSBib2d1cyAjcHJhZ21hIHBhY2sg
YXJvdW5kIHRoZSAqX2VudHJ5IHN0cnVjdHVyZXMuKQo+Pj4KPj4+IFRha2UgdGhlIG9wcG9ydHVu
aXR5IHRvIHRyaW0gdGhlIGluY2x1ZGUgbGlzdHMsIGluY2x1ZGluZyB4ODYvbW0vcDJtLmMKPj4g
SSBndWVzcyB5b3UgbWVhbiBwMm0uaCBoZXJlLgo+IAo+IFdoeT8KPiAKPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+PiBpbmRleCBk
ZWYxM2Y2NTdiLi5mZDlmMDk1MzZkIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJt
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4+IEBAIC0zOCw3ICszOCw2IEBACj4+
ICAjaW5jbHVkZSA8YXNtL21lbV9zaGFyaW5nLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2h2bS9uZXN0
ZWRodm0uaD4KPj4gICNpbmNsdWRlIDxhc20vYWx0cDJtLmg+Cj4+IC0jaW5jbHVkZSA8YXNtL2h2
bS9zdm0vYW1kLWlvbW11LXByb3RvLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3ZtX2V2ZW50Lmg+Cj4+
ICAjaW5jbHVkZSA8eHNtL3hzbS5oPgo+PiAgCj4gCj4gSSByZWFsbHkgZG8gbWVhbiBwMm0uYwoK
T2theSwgSSBtaXN1bmRlcnN0b29kIHRoZW4uIEkndmUgYmVlbiBqdWRnaW5nIGZyb20KCj4tLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMKPisrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwo+QEAgLTE4LDEyICsxOCw4IEBACj4gICov
Cj4gCj4gI2luY2x1ZGUgPHhlbi9hY3BpLmg+Cj4tI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgo+LSNp
bmNsdWRlIDxhc20vcDJtLmg+Cj4tI2luY2x1ZGUgPGFzbS9hbWQtaW9tbXUuaD4KPi0jaW5jbHVk
ZSA8YXNtL2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmg+Cj4tI2luY2x1ZGUgIi4uL2F0cy5oIgo+
LSNpbmNsdWRlIDx4ZW4vcGNpLmg+Cj4rCj4rI2luY2x1ZGUgImlvbW11LmgiCgp3aGVyZSB5b3Ug
X2Fsc29fIChyZSltb3ZlIHAybS5oLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
