Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B1165B1B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:06:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ihI-0007BF-Ju; Thu, 20 Feb 2020 10:04:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4ihG-0007B9-OO
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:04:42 +0000
X-Inumbo-ID: 69dfd79a-53c8-11ea-84f2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69dfd79a-53c8-11ea-84f2-12813bfff9fa;
 Thu, 20 Feb 2020 10:04:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4ihF-00055J-LJ; Thu, 20 Feb 2020 10:04:41 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4ihF-0002Cn-CW; Thu, 20 Feb 2020 10:04:41 +0000
Date: Thu, 20 Feb 2020 00:53:30 +0000
From: Wei Liu <wl@xen.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200220005330.bigbb7e7okuvez3x@debian>
References: <cover.1582143896.git.linux@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582143896.git.linux@eikelenboom.it>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 0/3] tools/xentop: Fix calculation of used
 memory and some cleanups
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

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDk6MzE6MjlQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IEZpeGVzIHNvbWUgZmFsbG91dCBmcm9tOiBjNTg4YzAwMmNjMSAoJ3Rvb2xz
OiByZW1vdmUgdG1lbSBjb2RlIGFuZCBjb21tYW5kcycpCgpUaGFua3MuIEkgbWFkZSBzb21lIHN1
Z2dlc3Rpb25zIG9uIGFkZGluZyBjb21taXQgbWVzc2FnZXMuIExldCBtZSBrbm93CmlmIHlvdSdy
ZSBva2F5IHdpdGggdGhvc2UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
