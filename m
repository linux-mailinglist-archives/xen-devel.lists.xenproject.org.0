Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E721DF4F71
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 16:25:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT65b-00065l-1J; Fri, 08 Nov 2019 15:22:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iT65Z-00065g-IF
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 15:22:17 +0000
X-Inumbo-ID: 8bc3d5e8-023b-11ea-a1d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bc3d5e8-023b-11ea-a1d5-12813bfff9fa;
 Fri, 08 Nov 2019 15:22:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54FE3AF35;
 Fri,  8 Nov 2019 15:22:15 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
Date: Fri, 8 Nov 2019 16:22:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 0/3] x86: Protected Processor Inventory
 Number (PPIN) support
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
aWNpdGx5IGRpc2FsbG93IGd1ZXN0IGFjY2VzcyB0byBQUElOCjM6IHByb3ZpZGUgRG9tMCBhY2Nl
c3MgdG8gUFBJTiB2aWEgWEVOUEZfcmVzb3VyY2Vfb3AKCkkgaGF2ZSB5ZXQgdG8gZ2V0IGFyb3Vu
ZCB0byBwb3N0IHRoZSBMaW51eCBzaWRlIGNvbnN1bWVyCnBhdGNoIG9mIHRoZSBpbnRlcmZhY2Ug
YWRkaXRpb24gaW4gcGF0Y2ggMS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
