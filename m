Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36911165CE8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:44:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kDA-0000Rr-J7; Thu, 20 Feb 2020 11:41:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4kD8-0000Rm-S4
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:41:42 +0000
X-Inumbo-ID: f6acdbc0-53d5-11ea-850a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6acdbc0-53d5-11ea-850a-12813bfff9fa;
 Thu, 20 Feb 2020 11:41:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kD6-0007B5-RR; Thu, 20 Feb 2020 11:41:40 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4kD6-00082C-IR; Thu, 20 Feb 2020 11:41:40 +0000
Date: Thu, 20 Feb 2020 11:41:37 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220114137.7jkku2hv4yxq47w6@debian>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
 <c7adfa84-2310-3d1d-a6db-574a10247380@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7adfa84-2310-3d1d-a6db-574a10247380@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 4/5] libxl/PCI: pass correct "hotplug"
 argument to libxl__device_pci_setdefault()
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDQ6NDc6MjdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVW5pZm9ybWx5IHBhc3NpbmcgImZhbHNlIiBjYW4ndCBiZSByaWdodCwgYnV0IGhhcyBi
ZWVuIGJlbmlnbiBiZWNhdXNlIG9mCj4gdGhlIGZ1bmN0aW9uIG5vdCB1c2luZyB0aGlzIHBhcmFt
ZXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
