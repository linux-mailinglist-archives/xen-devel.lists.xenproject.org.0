Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52314F0CE
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:44:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixZNk-0008El-Hm; Fri, 31 Jan 2020 16:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixZNi-0008Ea-M8
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:42:58 +0000
X-Inumbo-ID: bc50be5c-4448-11ea-8bec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc50be5c-4448-11ea-8bec-12813bfff9fa;
 Fri, 31 Jan 2020 16:42:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57D92AF27;
 Fri, 31 Jan 2020 16:42:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Message-ID: <ad9784af-8688-5713-eaa2-68f4c23b035c@suse.com>
Date: Fri, 31 Jan 2020 17:42:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4 2/7] x86/HVM: rename a variable in
 __hvm_copy()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0byByZWZsZWN0IGl0cyBhY3R1YWwgcHVycG9zZS4gQWxzbyB1c2UgaW4gYSAybmQg
cGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0t
LQp2NDogTmV3LgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jCkBAIC0zMjU1LDkgKzMyNTUsOSBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNs
YXRpb25fcmVzdWx0IF9faHZtCiAgICAgd2hpbGUgKCB0b2RvID4gMCApCiAgICAgewogICAgICAg
ICBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgcmVzOwotICAgICAgICBwYWRkcl90IGdwYSA9
IGFkZHIgJiB+UEFHRV9NQVNLOworICAgICAgICB1bnNpZ25lZCBpbnQgcGdvZmYgPSBhZGRyICYg
flBBR0VfTUFTSzsKIAotICAgICAgICBjb3VudCA9IG1pbl90KGludCwgUEFHRV9TSVpFIC0gZ3Bh
LCB0b2RvKTsKKyAgICAgICAgY291bnQgPSBtaW5fdChpbnQsIFBBR0VfU0laRSAtIHBnb2ZmLCB0
b2RvKTsKIAogICAgICAgICByZXMgPSBodm1fdHJhbnNsYXRlX2dldF9wYWdlKHYsIGFkZHIsIGZs
YWdzICYgSFZNQ09QWV9saW5lYXIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGZlYywgcGZpbmZvLCAmcGFnZSwgJmdmbiwgJnAybXQpOwpAQCAtMzI3OSw3ICszMjc5LDcg
QEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bQogICAgICAgICAgICAg
cmV0dXJuIEhWTVRSQU5TX25lZWRfcmV0cnk7CiAgICAgICAgIH0KIAotICAgICAgICBwID0gKGNo
YXIgKilfX21hcF9kb21haW5fcGFnZShwYWdlKSArIChhZGRyICYgflBBR0VfTUFTSyk7CisgICAg
ICAgIHAgPSBfX21hcF9kb21haW5fcGFnZShwYWdlKSArIHBnb2ZmOwogCiAgICAgICAgIGlmICgg
ZmxhZ3MgJiBIVk1DT1BZX3RvX2d1ZXN0ICkKICAgICAgICAgewoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
