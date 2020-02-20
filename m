Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0495165B28
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:09:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ijy-0007RL-CA; Thu, 20 Feb 2020 10:07:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4ijx-0007RG-SE
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:07:29 +0000
X-Inumbo-ID: cd657e78-53c8-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd657e78-53c8-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 10:07:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4ijw-00059w-KG; Thu, 20 Feb 2020 10:07:28 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4ijw-0002Vt-Bg; Thu, 20 Feb 2020 10:07:28 +0000
Date: Thu, 20 Feb 2020 00:56:17 +0000
From: Wei Liu <wl@xen.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200220005617.jbsgmv43rnx3onzj@debian>
References: <cover.1582143896.git.linux@eikelenboom.it>
 <a5d34e806a0798e411b405625d1ef74db998fc85.1582143896.git.linux@eikelenboom.it>
 <20200220005123.wtas2zrii4zgf3rz@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220005123.wtas2zrii4zgf3rz@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/3] tools/xentop: Remove dead code
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTI6NTE6MjNBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEZlYiAxOSwgMjAyMCBhdCAwOTozMTozMVBNICswMTAwLCBTYW5kZXIgRWlrZWxl
bmJvb20gd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4
QGVpa2VsZW5ib29tLml0Pgo+ID4gLS0tCj4gCj4gSSB3aWxsIGFkZCB0aGUgZm9sbG93aW5nIGNv
bW1pdCBtZXNzYWdlOgo+IAo+IFRoZSB2YXJpYWJsZSBmcmVlYWxiZV9tYiB3YXMgbmV2ZXIgcmVh
bGx5IHVzZWQuIERlbGV0ZSBpdCBhbmQgdGhlIGNvZGUKPiBhc3NvY2lhdGVkIHdpdGggaXQuCgpB
Y3R1YWxseSwgdXNlIHRoZSBmb2xsb3dpbmc6CgpUaGUgZnJlZWFibGVfbWIgdmFyaWFibGUgd2Fz
IG1hZGUgdG8gYWx3YXlzIGJlIHplcm8gd2hlbiBwdXJnaW5nIHRtZW0KZnJvbSB0b29scy4gV2Ug
Y2FuIGluIGZhY3QganVzdCBkZWxldGUgaXQgYW5kIHRoZSBjb2RlIGFzc29jaWF0ZWQgd2l0aApp
dC4KCkZpeGVzOiBjNTg4YzAwMmNjMSAoInRvb2xzOiByZW1vdmUgdG1lbSBjb2RlIGFuZCBjb21t
YW5kcyIpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
