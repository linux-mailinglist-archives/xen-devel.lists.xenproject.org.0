Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5671429BA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 12:42:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVPG-0004Uq-UJ; Mon, 20 Jan 2020 11:39:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itVPE-0004Uj-Tb
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 11:39:44 +0000
X-Inumbo-ID: 8b34e50a-3b79-11ea-b950-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b34e50a-3b79-11ea-b950-12813bfff9fa;
 Mon, 20 Jan 2020 11:39:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 932A7B131;
 Mon, 20 Jan 2020 11:39:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
 <20200117204223.30076-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ceb14a2d-3d49-8e3b-6937-bfe24b03ae2f@suse.com>
Date: Mon, 20 Jan 2020 12:39:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117204223.30076-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/5] x86/boot: Drop sym_fs()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAyMTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBbGwgcmVtYWluaW5n
IHVzZXJzIG9mIHN5bV9mcygpIGNhbiB0cml2aWFsbHkgYmUgc3dpdGNoZWQgdG8gdXNpbmcgc3lt
X2VzaSgpCj4gaW5zdGVhZC4gIFRoaXMgaXMgc2hvcnRlciB0byBlbmNvZGUgYW5kIGZhc3RlciB0
byBleGVjdXRlLgo+IAo+IFRoaXMgcmVtb3ZlcyB0aGUgZmluYWwgdXNlcyBvZiAlZnMgZHVyaW5n
IGJvb3QsIHdoaWNoIGFsbG93cyB1cyB0byBkcm9wCj4gQk9PVF9GUyBmcm9tIHRoZSB0cmFtcG9s
aW5lIEdEVCwgd2hpY2ggZHJvcHMgYW4gMTZNIGFyYml0cmFyeSBsaW1pdCBvbiBYZW4ncwo+IGNv
bXBpbGVkIHNpemUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
