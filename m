Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9F13166C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 18:02:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVkC-0004V9-1G; Mon, 06 Jan 2020 17:00:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioVkA-0004V4-L6
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 17:00:42 +0000
X-Inumbo-ID: 1236fa36-30a6-11ea-ab37-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1236fa36-30a6-11ea-ab37-12813bfff9fa;
 Mon, 06 Jan 2020 17:00:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E96FAD33;
 Mon,  6 Jan 2020 17:00:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <5e702563-7cf9-ed29-6aba-5fbbc97d6b06@suse.com>
 <07122b31-ae3c-1c32-f9e9-4af2d135c7cc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed18dbed-139a-d09b-1155-ec6dec55f55f@suse.com>
Date: Mon, 6 Jan 2020 18:01:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <07122b31-ae3c-1c32-f9e9-4af2d135c7cc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/8] x86emul: support MOVDIRI insn
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
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNzo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDE2OjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTm90ZSB0aGF0IFNETSByZXZpc2lvbiAwNzAg
ZG9lc24ndCBzcGVjaWZ5IGV4Y2VwdGlvbiBiZWhhdmlvciBmb3IKPj4gTW9kUk0ubW9kICE9IDBi
MTE7IGFzc3VtaW5nICNVRCBoZXJlLgo+IAo+IERvbid0IHlvdSBtZWFuIG1vZCA9PSAxMSBoZXJl
PwoKT2gsIHllcywgb2YgY291cnNlIEkgZG8gLSBjb3JyZWN0ZWQuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
