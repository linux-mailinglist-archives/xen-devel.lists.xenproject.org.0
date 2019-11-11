Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ECDF76E7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:46:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAue-00035g-KA; Mon, 11 Nov 2019 14:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUAud-00035b-8J
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:43:27 +0000
X-Inumbo-ID: 9e2db930-0491-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e2db930-0491-11ea-b678-bc764e2007e4;
 Mon, 11 Nov 2019 14:43:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CD1CB234;
 Mon, 11 Nov 2019 14:43:25 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Date: Mon, 11 Nov 2019 15:43:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/3] xen/mcelog: assorted adjustments
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
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIDFzdCBjaGFuZ2UgaXMgc2ltcGxlIGNsZWFudXAsIG5vdGljZWQgd2hpbGUgcHJlcGFyaW5n
IGZvciB0aGUKMm5kIHBhdGNoLCB3aGljaCBwcmVzZW50cyB0aGUgY29uc3VtZXIgb2YgdGhlIGlu
dGVyZmFjZSBleHRlbnNpb24KcHJvcG9zZWQgaW4KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTExL21zZzAwMzc3Lmh0bWwuClRoZSAzcmQg
cGF0Y2ggaXMgc29ydCBvZiBvcHRpb25hbCwgY29uc2lkZXJpbmcgdGhhdCAzMi1iaXQgWGVuCnN1
cHBvcnQgaXMgc2xhdGVkIHRvIGJlIHBoYXNlZCBvdXQgb2YgdGhlIGtlcm5lbC4KCjE6IGRyb3Ag
X19NQ19NU1JfTUNHQ0FQCjI6IGFkZCBQUElOIHRvIHJlY29yZCB3aGVuIGF2YWlsYWJsZQozOiBh
bHNvIGFsbG93IGJ1aWxkaW5nIGZvciAzMi1iaXQga2VybmVscwoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
