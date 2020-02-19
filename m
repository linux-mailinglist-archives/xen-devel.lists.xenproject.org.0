Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C316495C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:59:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Rik-00068Z-Bt; Wed, 19 Feb 2020 15:57:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Rij-00068T-0L
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:57:05 +0000
X-Inumbo-ID: 78c26d6a-5330-11ea-83b7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78c26d6a-5330-11ea-83b7-12813bfff9fa;
 Wed, 19 Feb 2020 15:57:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F829B1E6;
 Wed, 19 Feb 2020 15:57:03 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a3501b3-2246-fdac-cd36-004e201d22ed@suse.com>
Date: Wed, 19 Feb 2020 16:57:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219081126.29534-8-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 7/8] xen: add /buildinfo/config entry to
 hypervisor filesystem
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAwOToxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL01ha2VmaWxlCj4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+IEBAIC0xLDYgKzEsNyBA
QAo+ICBvYmotJChDT05GSUdfQVJHTykgKz0gYXJnby5vCj4gIG9iai15ICs9IGJpdG1hcC5vCj4g
IG9iai15ICs9IGJzZWFyY2gubwo+ICtvYmoteSArPSBjb25maWdfZGF0YS5vCgpJbiBwYXJ0aWN1
bGFyIHdpdGggZW1iZWRkZWQgdXNlcyBpbiBtaW5kLCBJIHRoaW5rIHRoaXMgd2FudHMgdG8KaGF2
ZSBhIEtjb25maWcgY29udHJvbC4KCj4gQEAgLTQxNCw2ICs0MjEsOSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBidWlsZGluZm9faW5pdCh2b2lkKQo+ICAgICAgaHlwZnNfYWRkX2xlYWYoJnZlcnNpb24s
ICZtYWpvciwgdHJ1ZSk7Cj4gICAgICBoeXBmc19hZGRfbGVhZigmdmVyc2lvbiwgJm1pbm9yLCB0
cnVlKTsKPiAgCj4gKyAgICBjb25maWcuZS5zaXplID0geGVuX2NvbmZpZ19kYXRhX3NpemU7CgpU
aGlzIGJlaW5nIHRoZSBvbmx5IHVzZSBvZiB4ZW5fY29uZmlnX2RhdGFfc2l6ZSwgaXQgc3VnZ2Vz
dHMgdGhhdAppdCBjb3VsZCBpbiBwcmluY2lwbGUgbGl2ZSBpbiAuaW5pdC5yb2RhdGEuIEkgcmVh
bGl6ZSB0aGlzIG1heQptZWFuIG1vcmUgY3VzdG9taXphdGlvbiB0byB0aGUgYmluZmlsZSBzY3Jp
cHQgdGhhbiBpcyB3YXJyYW50ZWQKYnkgdGhlc2UgNCBieXRlcyBvZiBkYXRhLCBidXQgSSB3YW50
ZWQgdG8gYXQgbGVhc3QgcG9pbnQgb3V0IHRoZQphc3BlY3QuCgo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9rZXJuZWwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaAo+IEBAIC0xMDAs
NSArMTAwLDggQEAgZXh0ZXJuIGVudW0gc3lzdGVtX3N0YXRlIHsKPiAgCj4gIGJvb2xfdCBpc19h
Y3RpdmVfa2VybmVsX3RleHQodW5zaWduZWQgbG9uZyBhZGRyKTsKPiAgCj4gK2V4dGVybiBjaGFy
IHhlbl9jb25maWdfZGF0YTsKPiArZXh0ZXJuIHVuc2lnbmVkIGludCB4ZW5fY29uZmlnX2RhdGFf
c2l6ZTsKCmNvbnN0IGZvciBib3RoPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
