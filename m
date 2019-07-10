Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AB64894
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 16:43:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlDlL-0001lK-5d; Wed, 10 Jul 2019 14:40:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yd/x=VH=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hlDlJ-0001d6-0g
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 14:40:01 +0000
X-Inumbo-ID: 97f2dfa2-a320-11e9-8980-bc764e045a96
Received: from mail-io1-xd2c.google.com (unknown [2607:f8b0:4864:20::d2c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 97f2dfa2-a320-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 14:39:59 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id u19so5169615ior.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2019 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=BSRc+PSmKBBB9rpyVzVdrF40f977ZOFWYJOQEgxmLtA=;
 b=ftIAtMOMR4Qycai2mPoX5SOC1twsN6sGq1XDkLtIBBFkLOKtakhufiC1KDpz0gZbde
 5Fy2Kd3e/oiydBVYt1OZMplBdKSSkNzrD4IsIYW0Sy1GFnjIx8+TNLuq7wCFIlsh6Fwf
 M67/M2JSM64y9vBPqhfUVNOdUu+EAppz9H69E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=BSRc+PSmKBBB9rpyVzVdrF40f977ZOFWYJOQEgxmLtA=;
 b=rkQvtOYvbCfxEtn5HIAYQ5V+uRYoTcPleOgMyy77Cot6j6vma5RVCz1CraIqlKD2kp
 YQRtxEO3L9maWG+yhDfQP9kK6ZYCfgxCNJGlJWojElRlCoTvoGqpf1SgUViiqbM10rDJ
 C11pvelMy7yN0Lz9xAtzMx0Pm4inZkhKmeZwc9EPy+8ee3JMnz+m+krSGYHIL5AE1tU5
 uTMnS0F1172ClsgNxLQ8PcP5o244Y3cUhvaPLirIyrJW/wwnMhhDJ20lm3pNedy/u0JV
 Wa8arHS91qIicybiERM30ShAwFOOY2vHKo8RkGs1siJB7FW7zaIFLYN4BLH9TjETMAPp
 8W1w==
X-Gm-Message-State: APjAAAWTPGLWy37aedepC1akRLMMfSF6bqeRvEX8Dx6M2p6/cDCMvbYY
 037ZSKXH5skPnfb9I7elr+ftKGThxxQ=
X-Google-Smtp-Source: APXvYqyDXz1UhdnJGetglii/ZjfYl+yAQfSlT9wllkCHhPwCUkmM+IdOPMCNoLGhZ6IjtnDFVaSgHg==
X-Received: by 2002:a05:6638:517:: with SMTP id
 i23mr6440928jar.71.1562769599073; 
 Wed, 10 Jul 2019 07:39:59 -0700 (PDT)
Received: from doug-macbook.local (nstatest12.n.subnet.rcn.com.
 [207.229.155.139])
 by smtp.gmail.com with ESMTPSA id k2sm1642341iom.50.2019.07.10.07.39.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 07:39:58 -0700 (PDT)
To: xen-devel@lists.xenproject.org
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <fc86e67f-7ab8-e2a4-a78f-c19e33d25af9@cardoe.com>
Date: Wed, 10 Jul 2019 09:39:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] XSA-300 Wording
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q291bGQgd2UgbG9vayBhdCB1cGRhdGluZyB0aGUgd29yZGluZyBvZiBYU0EtMzAwIHRvIG1ha2Ug
dGhpbmdzIGEgYml0IAptb3JlIGNsZWFyLiBJIGRvbid0IGhhdmUgZXhhY3Qgd29yZGluZyBzdWdn
ZXN0aW9ucyBidXQgcm91Z2hseSBzb21lIG9mIAp0aGUgcXVlc3Rpb25zIEkndmUgZmllbGRlZCBh
cmU6CgoKMS4gSW1wYWN0IHNob3VsZCBtYWtlIGl0IGNsZWFyIHRoZXJlIGFyZSB0d28gaXNzdWVz
IGhlcmUuIFNvIGl0cyByZWFsbHkgCiJhbmQvb3IiLiBPciBhIGJ1bGxldGVkIGxpc3QuCgoyLiBW
dWxuZXJhYmxlIFN5c3RlbXMuICJBbGwgdmVyc2lvbnMgb2YgTGludXggYXJlIHZ1bG5lcmFibGUi
IGRvZXMgdGhpcyAKYXBwbHkgdG8gZ3Vlc3RzLiBPbmx5IHJlYXNvbiB0aGF0IHdhcyBhc2tlZCBp
cyBiZWNhdXNlIHRoZSBuZXh0IHNlbnRlbmNlIApnb2VzIG9uIHRvIGRpc2N1c3MgZG9tMC4gQXJl
IHBlb3BsZSB0aGF0IGRpZG4ndCBwYXNzIGEgImRvbTBfbWVtPSIgb24gYSAKUFYgZG9tMCB2dWxu
ZXJhYmxlIG9yIG5vdD8KCjMuIE1pdGlnYXRpb24uIElzIHRoZXJlIG5vIG1pdGlnYXRpb24gZm9y
IFBWSCBkb20wJ3M/IFRoZXJlJ3Mgc29tZSAKaGFuZHdhdmluZyBhcm91bmQgInN1ZmZpY2llbnRs
eSBsYXJnZSIuIExhcmdlIGlzIHN1YmplY3RpdmUgdG8gZm9sa3MuIElmIApJIG9wZXJhdGUgd2l0
aCBtYWNoaW5lcyB3aXRoIDhHQiBvZiBSQU0gZGF5IGluIGFuZCBkYXkgb3V0IHRoZW4gbXkgCmRl
ZmluaXRpb24gb2YgImxhcmdlIiBpcyBkaWZmZXJlbnQgZnJvbSBzb21lb25lIHRoYXQgb3BlcmF0
ZXMgb24gCm1hY2hpbmVzIHdpdGggMjU2R0Igb2YgUkFNIGRheSBpbiBhbmQgZGF5IG91dC4KCjQu
IFJlc29sdXRpb24uIFRoZXJlJ3MgdHdvIGlzc3VlcyBoZXJlIChhcyB0aGUgSW1wYWN0IHNob3Vs
ZCBtYWtlIApjbGVhcikuIElkZW50aWZ5IHRoYXQgdGhlIHBhdGNoIGhhbmRsZXMgaXNzdWUgIiMx
IiB3aGlsZSBpc3N1ZSAiIzIiIGlzIApub3QgZml4ZWQgeWV0LgoKCkkgaG9wZSB0aGlzIGlzIGEg
cmVhc29uYWJsZSByZXF1ZXN0LgoKLS0KCkRvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
