Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2416C44B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:46:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6bQ3-0007oL-Jx; Tue, 25 Feb 2020 14:42:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6bQ1-0007oG-Vm
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:42:42 +0000
X-Inumbo-ID: 11165dfa-57dd-11ea-931c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11165dfa-57dd-11ea-931c-12813bfff9fa;
 Tue, 25 Feb 2020 14:42:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E19F9AFCA;
 Tue, 25 Feb 2020 14:42:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200224142231.31097-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9c5ead4-0a2f-ed74-273d-3000bc896d61@suse.com>
Date: Tue, 25 Feb 2020 15:42:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224142231.31097-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/msr: Drop {pv,
 hvm}_max_vcpu_msrs objects
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

T24gMjQuMDIuMjAyMCAxNToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtMTAzLDEwICsx
MDAsNyBAQCBpbnQgaW5pdF9kb21haW5fbXNyX3BvbGljeShzdHJ1Y3QgZG9tYWluICpkKQo+ICAK
PiAgaW50IGluaXRfdmNwdV9tc3JfcG9saWN5KHN0cnVjdCB2Y3B1ICp2KQo+ICB7Cj4gLSAgICBz
dHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+IC0gICAgc3RydWN0IHZjcHVfbXNycyAqbXNy
cyA9Cj4gLSAgICAgICAgeG1lbWR1cChpc19wdl9kb21haW4oZCkgPyAgJnB2X21heF92Y3B1X21z
cnMKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICZodm1fbWF4X3ZjcHVfbXNy
cyk7Cj4gKyAgICBzdHJ1Y3QgdmNwdV9tc3JzICptc3JzID0geHphbGxvYygqbXNycyk7CgpBcyBz
YWlkIG9uIHRoZSBvdGhlciB0aHJlYWQsIEkgZG9uJ3QgdGhpbmsgdGhpcyB2aXN1YWwgKGV2ZW4g
aWYKbm90IGZhY3R1YWwpIHVzZSBvZiBhbiB1bmluaXRpYWxpemVkIHZhcmlhYmxlIGlzIG5vdCBo
ZWxwZnVsLiBJCmRvbid0IHNlZSBhbnl0aGluZyB3cm9uZyB3aXRoIGNvbnRpbnVpbmcgdGhlIHRy
YWRpdGlvbmFsCgogICAgc3RydWN0IHZjcHVfbXNycyAqbXNycyA9IHh6YWxsb2Moc3RydWN0IHZj
cHVfbXNycyk7Cgp3YXkuIEl0IHdvdWxkIGJlIGEgZGlmZmVyZW50IHRoaW5nIGlmIHRoZSB2YXJp
YWJsZSB0byBiZQppbml0aWFsaXplZCB3YXMgcGFzc2VkIGludG8gdGhlIG1hY3JvLCBhbmQgaGVu
Y2UgdGhlcmUKd291bGRuJ3QgYmUgYW55IGV4cGxpY2l0IGFzc2lnbm1lbnQgKG9yIGluaXRpYWxp
emF0aW9uKQphdCB0aGUgdXNlIHNpdGVzIC4uLgoKRm9yIHRoZSBzdWdnZXN0ZWQgYWx0ZXJuYXRp
dmUgZm9ybQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
