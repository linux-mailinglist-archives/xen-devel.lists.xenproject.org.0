Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3AA37E7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 15:40:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3h6j-0005XM-1Q; Fri, 30 Aug 2019 13:38:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3h6h-0005XC-Ds
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:38:27 +0000
X-Inumbo-ID: 71bdb11a-cb2b-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71bdb11a-cb2b-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 13:38:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC10FADCF;
 Fri, 30 Aug 2019 13:38:25 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <793a54c4-902f-ca02-357f-5080f938e0d6@suse.com>
Date: Fri, 30 Aug 2019 15:38:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 0/3] x86: S3 resume adjustments
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

MTogeDg2L0FDUEk6IHJlc3RvcmUgVkVTQSBtb2RlIHVwb24gcmVzdW1lIGZyb20gUzMKMjogeDg2
OiBhIGxpdHRsZSBiaXQgb2YgMTYtYml0IHZpZGVvIG1vZGUgc2V0dGluZyBjb2RlIGNsZWFudXAK
MzogeDg2OiBzaHJpbmsgdmlkZW9fe2ZsYWdzLG1vZGV9IHRvIHs4LDE2fSBiaXRzCgpQYXRjaCAx
IGlzIG1lYW50IHRvIGFkZHJlc3MgYW4gaXNzdWUgSSd2ZSBvYnNlcnZlZCB3aGlsZSB0ZXN0aW5n
CnRoZSB2MSBwYXRjaCB0aGF0IHdhcyBjb21taXR0ZWQgYWxyZWFkeSwgYW5kIHBhdGNoIDIgaXMg
c2ltcGx5IGEKY29sbGVjdGlvbiBvZiBtaXNjIGNoYW5nZXMgbm90aWNlZCB3aGlsZSBwdXR0aW5n
IHRvZ2V0aGVyIHBhdGNoIDEKYXMgcG9zc2libHkgd29ydGh3aGlsZSB0byBtYWtlLiBQYXRjaCAz
IGlzIGEgcmVzdWx0IG9mIHYxIHJldmlldwpmZWVkYmFjay4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
