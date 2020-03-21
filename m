Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC818E30C
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2020 17:52:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFhKI-0003Gs-02; Sat, 21 Mar 2020 16:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uw1z=5G=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jFhKG-0003Gc-2R
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2020 16:50:20 +0000
X-Inumbo-ID: 0c67623e-6b94-11ea-bf89-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c67623e-6b94-11ea-bf89-12813bfff9fa;
 Sat, 21 Mar 2020 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=bRPYIP7LVLFI+w2BWklYmS+SZuVw0nd/aOpiL78nddk=; b=x3er2ZdD/3ZhiMHssoHArEdDy5
 wOfRHkOsvPMnFFMfyxeSuVBY56vUiuXfFAlaNRHvW2CcM9RXCMc9KRB/e7QtAnbmYh5MnT3biQdqZ
 PH91JxH8aSboRBJs98A0Fb/ZZeKCcXxCcqeKWPOzN3OlUGS/qdYSPbeaSsgKP35bc1eY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jFhKE-0006zu-Oh; Sat, 21 Mar 2020 16:50:18 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jFhKE-0002B7-Fp; Sat, 21 Mar 2020 16:50:18 +0000
Date: Sat, 21 Mar 2020 16:50:15 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200321165015.yvjfeqaj56icbu5g@debian>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320212453.21685-4-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 3/4] xen: Drop raw_smp_processor_id()
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
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDk6MjQ6NTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGVyZSBpcyBvbmx5IGEgc2luZ2xlIHVzZXIgb2YgcmF3X3NtcF9wcm9jZXNzb3Jf
aWQoKSBsZWZ0IGluIHRoZSB0cmVlIChhbmQgaXQKPiBpcyB1bmNvbmRpdGlvbmFsbHkgY29tcGls
ZWQgb3V0KS4gIERyb3AgdGhlIGFsaWFzIGZyb20gYWxsIGFyY2hpdGVjdHVyZXMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
