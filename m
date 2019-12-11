Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A711A520
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 08:32:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iewQL-0003SK-3d; Wed, 11 Dec 2019 07:28:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iewQK-0003SF-0j
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 07:28:40 +0000
X-Inumbo-ID: d85bcfc6-1be7-11ea-8ac0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d85bcfc6-1be7-11ea-8ac0-12813bfff9fa;
 Wed, 11 Dec 2019 07:28:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AE94B04F;
 Wed, 11 Dec 2019 07:28:36 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec80c318-355b-21cf-2152-f396c41dda16@suse.com>
Date: Wed, 11 Dec 2019 08:28:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] clock source in PV Linux
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiwgQm9yaXMsCgpJJ3ZlIG5vdGljZWQKCjw2PmNsb2Nrc291cmNlOiBTd2l0Y2hlZCB0
byBjbG9ja3NvdXJjZSB0c2MKCmFzIHRoZSBmaW5hbCBjbG9ja3NvdXJjZSByZWxhdGVkIGJvb3Qg
bWVzc2FnZSBpbiBhIFBWIERvbTAncwpsb2cgd2l0aCA1LjQuMi4gSXMgaXQgaW50ZW50aW9uYWwg
dGhhdCBpdCdzIG5vdCB0aGUgInhlbiIgb25lCnRoYXQgZ2V0cyB1c2VkIGJ5IGRlZmF1bHQ/CgpU
aGFua3MsIEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
