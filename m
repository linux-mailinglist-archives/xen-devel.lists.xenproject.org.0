Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12614DF5B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:43:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCt4-0000oK-Sv; Thu, 30 Jan 2020 16:41:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixCt3-0000oE-5d
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:41:49 +0000
X-Inumbo-ID: 68928594-437f-11ea-8aba-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68928594-437f-11ea-8aba-12813bfff9fa;
 Thu, 30 Jan 2020 16:41:48 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixCt1-0001SY-Hh; Thu, 30 Jan 2020 16:41:47 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixCt1-0006XY-8u; Thu, 30 Jan 2020 16:41:47 +0000
Date: Thu, 30 Jan 2020 16:41:44 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200130164144.ve3jbntz6adzcyqv@debian>
References: <fd03b80e-ff1a-f2c7-20db-4604ad4d0b2f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd03b80e-ff1a-f2c7-20db-4604ad4d0b2f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86: fold linker script pre-processing rules
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDM6NDQ6NTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBubyBuZWVkIHRvIGhhdmUgdHdpY2UgYWxtb3N0IHRoZSBzYW1lIHJ1bGUu
IFNpbXBseSBhZGQgdGhlIGV4dHJhCj4gLURFRkkgdG8gQUZMQUdTIGZvciB0aGUgRUZJIHZhcmlh
bnQsIGFuZCBzcGVjaWZ5IGJvdGggdGFyZ2V0cyBmb3IgdGhlCj4gdGhlbiBzaW5nbGUgcnVsZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZp
ZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
