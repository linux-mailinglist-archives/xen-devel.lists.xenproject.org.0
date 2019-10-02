Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C391FC487C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:30:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZ2O-0001B5-B2; Wed, 02 Oct 2019 07:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZ2M-0001B0-Qc
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:27:02 +0000
X-Inumbo-ID: 05ff01c0-e4e6-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 05ff01c0-e4e6-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 07:27:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27A23AD6B;
 Wed,  2 Oct 2019 07:27:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9cfa35b6-697c-5be1-f846-0bb8288a8708@suse.com>
Date: Wed, 2 Oct 2019 09:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/2] tools/xen-cpuid: two small adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTogTUFJTlRBSU5FUlM6IGFkZCB0b29scy9taXNjL3hlbi1jcHVpZCB0byAiWDg2IEFSQ0hJVEVD
VFVSRSIKMjogdG9vbHMveGVuLWNwdWlkOiBhdm9pZCBwcm9kdWNpbmcgYm9ndXMgb3V0cHV0CgpU
aGV5J3JlIG5vdCBvdmVybHkgaW1wb3J0YW50IHRvIGhhdmUgZm9yIDQuMTMsIGJ1dCB0aGV5J3Jl
IGFsc28gcmF0aGVyCmxvdyByaXNrLCBzbyBJIHRoaW5rIHRoZXkncmUgd29ydGh3aGlsZSBjb25z
aWRlcmluZyBhdCB0aGlzIHBvaW50IGluCnRpbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
