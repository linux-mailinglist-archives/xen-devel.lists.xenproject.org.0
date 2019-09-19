Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D8B7852
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:20:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuRD-0005xW-CU; Thu, 19 Sep 2019 11:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r/sg=XO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iAuRB-0005xR-Vx
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:17:26 +0000
X-Inumbo-ID: 0e70a078-dacf-11e9-b76c-bc764e2007e4
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e70a078-dacf-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 11:17:25 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h7so2649750wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 04:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=aGjbCTIRTIEn4zg1pcQFT3IUWjv9PCP6+YAQX2Yanzs=;
 b=B5PZRFXTiyklrcRgY1HyJQ3e0CQkOCd5XZHhlBllVAFYDSV01slV9jNRE91VDNc1q+
 Zc9apK2s+kQ/3Z8Psa3M3L2vSJeQRgHw54Cz8/pZLe1ELsseY/s1VztiSk54M3uxMoeg
 hZRluBelWoGTZhlCQguGHV7QF8I5+lobJ4v5YivpiXmuju+XBCMqKb1qdO3Fkdk1smod
 lTqgagFFHGf56XOEoFunrvSbGYR4EzwviFms3xnOltN6BpdHwgnyMd/Q4E6QJFGKvyru
 v4QgI0RXQYT2HXTn+UA4/qR/8fF3iUQ7Jd58N8G3eH1A58pVYA2eEwOg3dwmI4gsgnlx
 Ne5A==
X-Gm-Message-State: APjAAAUjPcqzS2ou4T4+6P5A9tmFbfQZ1VXAAf+qj/ouXXt2i4pVA1yh
 ryIy7X63VipJSPQAr9InO0x52eQnu0c=
X-Google-Smtp-Source: APXvYqwJ8PKiFliV5eWsZr3CDMdOUKiQKMSwJTSO5ychxlOtdmEgCnbNuxtpSfsfdzo4zdgwjqR2Cw==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr6771345wrn.352.1568891844202; 
 Thu, 19 Sep 2019 04:17:24 -0700 (PDT)
Received: from debian (104.163.200.146.dyn.plus.net. [146.200.163.104])
 by smtp.gmail.com with ESMTPSA id a192sm6643620wma.1.2019.09.19.04.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 04:17:23 -0700 (PDT)
Date: Thu, 19 Sep 2019 12:17:22 +0100
From: Wei Liu <wl@xen.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20190919111722.iajioonuzqfharaf@debian>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Subject: [Xen-devel] [PATCH for-4.13] configure: fix print syntax for python
 3
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTZjYzMzNjJhIG1pc3NlZCBvbmUgcHJpbnQgc3RhdGVtZW50LgoKU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KLS0tCiBtNC9weXRob25fZGV2ZWwubTQgfCAyICstCiB0b29scy9j
b25maWd1cmUgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tNC9weXRob25fZGV2ZWwubTQgYi9tNC9weXRob25f
ZGV2ZWwubTQKaW5kZXggN2YyNjM4MTM3Ni4uZTM2NWNkNjU4ZSAxMDA2NDQKLS0tIGEvbTQvcHl0
aG9uX2RldmVsLm00CisrKyBiL200L3B5dGhvbl9kZXZlbC5tNApAQCAtNiw3ICs2LDcgQEAgQUNf
UEFUSF9QUk9HKFtweWNvbmZpZ10sIFskUFlUSE9OLWNvbmZpZ10sIFtub10pCiBBU19JRihbdGVz
dCB4IiRweWNvbmZpZyIgPSB4Im5vIl0sIFsKICAgICBkbmwgRm9yIHRob3NlIHRoYXQgZG9uJ3Qg
aGF2ZSBweXRob24tY29uZmlnCiAgICAgQ1BQRkxBR1M9IiRDRkxBR1MgYCRQWVRIT04gLWMgJ2lt
cG9ydCBkaXN0dXRpbHMuc3lzY29uZmlnOyBcCi0gICAgICAgIHByaW50ICItSSIgKyBkaXN0dXRp
bHMuc3lzY29uZmlnLmdldF9jb25maWdfdmFyKCJJTkNMVURFUFkiKSdgIgorICAgICAgICBwcmlu
dCgiLUkiICsKZGlzdHV0aWxzLnN5c2NvbmZpZy5nZXRfY29uZmlnX3ZhcigiSU5DTFVERVBZIikp
J2AiCiAgICAgQ1BQRkxBR1M9IiRDUFBGTEFHUyBgJFBZVEhPTiAtYyAnaW1wb3J0IGRpc3R1dGls
cy5zeXNjb25maWc7IFwKICAgICAgICAgcHJpbnQoZGlzdHV0aWxzLnN5c2NvbmZpZy5nZXRfY29u
ZmlnX3ZhcigiQ0ZMQUdTIikpJ2AiCiAgICAgTERGTEFHUz0iJExERkxBR1MgYCRQWVRIT04gLWMg
J2ltcG9ydCBkaXN0dXRpbHMuc3lzY29uZmlnOyBcCmRpZmYgLS1naXQgYS90b29scy9jb25maWd1
cmUgYi90b29scy9jb25maWd1cmUKaW5kZXggMWJhYWNlYTlhYy4uNjE0ZDFmNWI2MSAxMDA3NTUK
LS0tIGEvdG9vbHMvY29uZmlndXJlCisrKyBiL3Rvb2xzL2NvbmZpZ3VyZQpAQCAtNzQ0MSw3ICs3
NDQxLDcgQEAgZmkKIGlmIHRlc3QgeCIkcHljb25maWciID0geCJubyI7IHRoZW4gOgogCiAgICAg
ICAgIENQUEZMQUdTPSIkQ0ZMQUdTIGAkUFlUSE9OIC1jICdpbXBvcnQgZGlzdHV0aWxzLnN5c2Nv
bmZpZzsgXAotICAgICAgICBwcmludCAiLUkiICsgZGlzdHV0aWxzLnN5c2NvbmZpZy5nZXRfY29u
ZmlnX3ZhcigiSU5DTFVERVBZIiknYCIKKyAgICAgICAgcHJpbnQoIi1JIiArCmRpc3R1dGlscy5z
eXNjb25maWcuZ2V0X2NvbmZpZ192YXIoIklOQ0xVREVQWSIpKSdgIgogICAgIENQUEZMQUdTPSIk
Q1BQRkxBR1MgYCRQWVRIT04gLWMgJ2ltcG9ydCBkaXN0dXRpbHMuc3lzY29uZmlnOyBcCiAgICAg
ICAgIHByaW50KGRpc3R1dGlscy5zeXNjb25maWcuZ2V0X2NvbmZpZ192YXIoIkNGTEFHUyIpKSdg
IgogICAgIExERkxBR1M9IiRMREZMQUdTIGAkUFlUSE9OIC1jICdpbXBvcnQgZGlzdHV0aWxzLnN5
c2NvbmZpZzsgXAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
