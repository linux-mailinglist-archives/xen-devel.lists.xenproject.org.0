Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15872E9A1D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 11:39:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPlLX-0006bO-M2; Wed, 30 Oct 2019 10:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPlLV-0006bJ-VP
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 10:36:57 +0000
X-Inumbo-ID: 31ae2dec-fb01-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31ae2dec-fb01-11e9-bbab-bc764e2007e4;
 Wed, 30 Oct 2019 10:36:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70AC5B1AB;
 Wed, 30 Oct 2019 10:36:55 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
Date: Wed, 30 Oct 2019 11:36:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/2] x86: Protected Processor Inventory Number
 (PPIN) support
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTogaW5jbHVkZSB0aGUgUFBJTiBpbiBNQ0UgcmVjb3JkcyB3aGVuIGF2YWlsYWJsZQoyOiBleHBs
aWNpdGx5IGRpc2FsbG93IGd1ZXN0IGFjY2VzcyB0byBQUElOCgpJIHdpbGwgYWxzbyBzZWUgdG8g
Z2V0IGFyb3VuZCB0byBwb3N0IHRoZSBMaW51eCBzaWRlIGNvbnN1bWVyCnBhdGNoIG9mIHRoZSBp
bnRlcmZhY2UgYWRkaXRpb24gaW4gcGF0Y2ggMS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
