Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E6217942
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 14:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOLVt-0001eX-Nn; Wed, 08 May 2019 12:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nDO7=TI=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1hOLVs-0001eS-7D
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:17:32 +0000
X-Inumbo-ID: 40adafca-718b-11e9-8f44-abdfeabc2890
Received: from mx2.freebsd.org (unknown [8.8.178.116])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40adafca-718b-11e9-8f44-abdfeabc2890;
 Wed, 08 May 2019 12:17:31 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id BF30A77E47;
 Wed,  8 May 2019 12:17:29 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 085497064F;
 Wed,  8 May 2019 12:17:29 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (172.red-83-42-105.dynamicip.rima-tde.net
 [83.42.105.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4E78E7D95;
 Wed,  8 May 2019 12:17:28 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Wed, 8 May 2019 14:17:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190508121719.jxj7e7tl77qpfn7e@Air-de-Roger>
References: <osstest-135810-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-135810-mainreport@xen.org>
User-Agent: NeoMutt/20180716
X-Rspamd-Queue-Id: 085497064F
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.98 / 15.00];
 local_wl_from(0.00)[FreeBSD.org];
 NEURAL_HAM_MEDIUM(-1.00)[-0.999,0];
 NEURAL_HAM_SHORT(-0.98)[-0.982,0];
 NEURAL_HAM_LONG(-1.00)[-1.000,0];
 ASN(0.00)[asn:11403, ipnet:2610:1c1:1::/48, country:US]
Subject: Re: [Xen-devel] [freebsd-master test] 135810: regressions - FAIL
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

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMTE6MTc6MTRBTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxMzU4MTAgZnJlZWJzZC1tYXN0ZXIgcmVhbCBbcmVhbF0K
PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1ODEw
Lwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBh
bmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVu
Ogo+ICBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAg
ICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKPiAgYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAg
ICAgNSBob3N0LWluc3RhbGwoNSkgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM1MjMzCgpUaGlz
IGZsaWdodCBzdGlsbCBkb2Vzbid0IGhhdmUgdGhlIGNvbW1pdCB0aGF0IGZpeGVkIHRoZSBpc3N1
ZToKCmh0dHBzOi8vc3Zud2ViLmZyZWVic2Qub3JnL2Jhc2U/dmlldz1yZXZpc2lvbiZyZXZpc2lv
bj0zNDcxODMKCkknbSBzbGlnaHRseSBwdXp6bGVkIGF0IHdoeSB0aGlzIGZsaWdodCBwaWNrZWQg
dXAgc3VjaCBhbiBvbGQgY29tbWl0LApmcm9tICJNb24gTWF5IDYgMDg6NDk6NDMgMjAxOSArMDAw
MCIuIEl0IGRpZG4ndCBkbyB0aGF0IG11Y2ggd29yayBhbmQKdG9vayAzIGRheXMgdG8gZmluaXNo
LiBUaGUgdXBzdHJlYW0gZ2l0IHJlcG8gc2VlbXMgdG8gYmUgZmluZS4KClJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
