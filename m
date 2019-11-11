Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3599F7700
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:48:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAxe-0003MP-N9; Mon, 11 Nov 2019 14:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUAxd-0003MA-Dy
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:46:33 +0000
X-Inumbo-ID: 0d5ea076-0492-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d5ea076-0492-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 14:46:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C882B02E;
 Mon, 11 Nov 2019 14:46:32 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Message-ID: <07358162-1d03-63f5-ad14-95a2e0e23018@suse.com>
Date: Mon, 11 Nov 2019 15:46:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/3] xen/mcelog: also allow building for 32-bit
 kernels
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

VGhlcmUncyBubyBhcHBhcmVudCByZWFzb24gd2h5IGl0IGNhbiBiZSB1c2VkIG9uIDY0LWJpdCBv
bmx5LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEvZHJpdmVycy94ZW4vS2NvbmZpZworKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnCkBAIC0yODUs
NyArMjg1LDcgQEAgY29uZmlnIFhFTl9BQ1BJX1BST0NFU1NPUgogCiBjb25maWcgWEVOX01DRV9M
T0cKIAlib29sICJYZW4gcGxhdGZvcm0gbWNlbG9nIgotCWRlcGVuZHMgb24gWEVOX0RPTTAgJiYg
WDg2XzY0ICYmIFg4Nl9NQ0UKKwlkZXBlbmRzIG9uIFhFTl9ET00wICYmIFg4NiAmJiBYODZfTUNF
CiAJaGVscAogCSAgQWxsb3cga2VybmVsIGZldGNoaW5nIE1DRSBlcnJvciBmcm9tIFhlbiBwbGF0
Zm9ybSBhbmQKIAkgIGNvbnZlcnRpbmcgaXQgaW50byBMaW51eCBtY2Vsb2cgZm9ybWF0IGZvciBt
Y2Vsb2cgdG9vbHMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
