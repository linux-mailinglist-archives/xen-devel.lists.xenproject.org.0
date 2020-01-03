Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30BE12F8BE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:25:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMvC-0006N4-AI; Fri, 03 Jan 2020 13:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inMvB-0006My-Dp
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:23:21 +0000
X-Inumbo-ID: 35bd7970-2e2c-11ea-a485-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35bd7970-2e2c-11ea-a485-12813bfff9fa;
 Fri, 03 Jan 2020 13:23:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0BB6CAD55;
 Fri,  3 Jan 2020 13:23:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200102135624.30787-1-andrew.cooper3@citrix.com>
 <20200102164607.ichqzymxpwnb4pno@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9efef567-dd4d-1c04-586d-a113e411226a@suse.com>
Date: Fri, 3 Jan 2020 14:24:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200102164607.ichqzymxpwnb4pno@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/efi: Drop infinite loops and use
 unreachable()/noreturn
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDEuMjAyMCAxNzo0NiwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAwMiwgMjAy
MCBhdCAwMTo1NjoyNFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
