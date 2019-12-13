Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786B011DF86
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 09:34:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifgMB-0004HI-4Q; Fri, 13 Dec 2019 08:31:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifgM9-0004HD-Oq
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 08:31:25 +0000
X-Inumbo-ID: f1d16546-1d82-11ea-8ebd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1d16546-1d82-11ea-8ebd-12813bfff9fa;
 Fri, 13 Dec 2019 08:31:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5221FAD4A;
 Fri, 13 Dec 2019 08:31:22 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julien Grall <julien@xen.org>
References: <osstest-144736-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
Date: Fri, 13 Dec 2019 09:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <osstest-144736-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMTkgMjM6MzUsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQ0NzM2IHhlbi00LjEzLXRlc3RpbmcgcmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ0NzM2Lwo+IAo+IFJlZ3Jlc3Npb25zIDot
KAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICAgdGVzdC1hcm02NC1hcm02
NC14bC1jcmVkaXQxICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4g
MTQ0NjczCgpMb29raW5nIGludG8gdGhlIHNlcmlhbCBsb2cgdGhpcyBsb29rcyBsaWtlIGEgaGFy
ZHdhcmUgcHJvYmxlbSB0byBtZS4KCklhbiwgZG8geW91IGFncmVlPwoKPiAgIHRlc3QtYXJtaGYt
YXJtaGYteGwtdmhkICAgICAgMTggbGVhay1jaGVjay9jaGVjayAgICAgICAgIGZhaWwgUkVHUi4g
dnMuIDE0NDY3MwoKVGhhdCBvbmUgaXMgc3RyYW5nZS4gQSBxZW11IHByb2Nlc3Mgc2VlbXMgdG8g
aGF2ZSBoYXZlIGRpZWQgcHJvZHVjaW5nCmEgY29yZSBmaWxlLCBidXQgSSBjb3VsZG4ndCBmaW5k
IGFueSBsb2cgY29udGFpbmluZyBhbnkgb3RoZXIgaW5kaWNhdGlvbgpvZiBhIGNyYXNoZWQgcHJv
Z3JhbS4KCkFuZCBJIGNhbid0IGJlbGlldmUgdGhlIEFSTSBjaGFuZ2VzIGluIHRoZSBoeXBlcnZp
c29yIHdvdWxkIHJlc3VsdCBpbgpxZW11IGNyYXNoaW5nIG5vdy4uLgoKSnVsaWVuLCBjb3VsZCB5
b3UgcGxlYXNlIGhhdmUgYSBsb29rPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
