Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A914D82D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 10:15:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix5sO-0004Ns-CJ; Thu, 30 Jan 2020 09:12:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix5sM-0004Nn-UA
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 09:12:38 +0000
X-Inumbo-ID: a8d787b0-4340-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8d787b0-4340-11ea-a933-bc764e2007e4;
 Thu, 30 Jan 2020 09:12:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53085B07B;
 Thu, 30 Jan 2020 09:12:37 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-146578-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d89fdcee-8e9e-c804-5b00-2b0551eb03ef@suse.com>
Date: Thu, 30 Jan 2020 10:12:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <osstest-146578-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 146578: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAwNDo1Niwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDY1NzggeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NjU3OC8KPiAKPiBSZWdyZXNzaW9ucyA6LSgK
PiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNs
dWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14
bC1xZW11dS13aW43LWFtZDY0ICA3IHhlbi1ib290ICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQ2
NTYzCgpBZmFpY3QgaXQgaXMgbm90ICJ4ZW4tYm9vdCIgd2hpY2ggZmFpbGVkIGhlcmUsIGJ1dCB0
aGUgZ29pbmcKZG93biBvZiB0aGUgcHJpb3IgbmF0aXZlIGtlcm5lbCB3aGljaCB3YXMgdXNlZCB0
byBkbyB0aGUKaW5zdGFsbDoKCkphbiAyOSAyMzoxOTozNC4zNzA2NjMgWyAgMTgyLjQ3MjA3M10g
ZTEwMDBlOiBldGgwIE5JQyBMaW5rIGlzIERvd24KSmFuIDI5IDIzOjE5OjM2LjQ3MDU4NyBbICAx
ODIuNDc2NzI4XSBrdm06IGV4aXRpbmcgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24KSmFuIDI5IDIz
OjE5OjM2LjQ3MDY2MCBbICAxODIuNDgxNTc0XSBzZCAzOjA6MDowOiBbc2RiXSBTeW5jaHJvbml6
aW5nIFNDU0kgY2FjaGUKSmFuIDI5IDIzOjE5OjM2LjQ4MjYxNyBbICAxODIuNDg2ODc0XSBzZCAy
OjA6MDowOiBbc2RhXSBTeW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKSmFuIDI5IDIzOjE5OjM2LjQ4
MjY4MyBbICAxODIuNTI4MjYzXSBlMTAwMGU6IEVFRSBUWCBMUEkgVElNRVI6IDAwMDAwMDAwCkph
biAyOSAyMzoxOTozNi41MzA1MTYgWyAgMTgyLjUzNzAzNl0gZTEwMDBlOiBFRUUgVFggTFBJIFRJ
TUVSOiAwMDAwMDAwMApKYW4gMjkgMjM6MTk6MzYuNTMwNTgyIFsgIDE4Mi41NDQ1MDRdIHVzYiA2
LTI6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDIKSmFuIDI5IDIzOjE5OjM2LjU0MjU3
OSBbICAxODIuNjI0MTI1XSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtCkphbiAyOSAyMzoxOToz
Ni42MTQ1NTQgWyAgMTgyLjYyNTUyN10gQU1ELVZpOiBFdmVudCBsb2dnZWQgWwpKYW4gMjkgMjM6
MTk6MzYuNjI2NjcxIFsgIDE4Mi42MjU1MjddIElPX1BBR0VfRkFVTFQgZGV2aWNlPTAwOjEzLjEg
ZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdCgpU
aGVzZSBsYXN0IHR3byBsaW5lcyB0aGVuIGxvb2sgdG8gcmVwZWF0IGluZGVmaW5pdGVseS4gSXMK
dGhlcmUgYSBuZXcga2VybmVsIHZlcnNpb24gaW4gdXNlIHdoaWNoIGhhcyByZWdyZXNzZWQgb24g
dGhpcwpwYXJ0aWN1bGFyIGhhcmR3YXJlPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
