Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E046144B1B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LE-0005GN-Qu; Wed, 22 Jan 2020 05:14:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5LM-0006Bs-7A
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:02:08 +0000
X-Inumbo-ID: 0ae3b8ac-3cbb-11ea-9fd7-bc764e2007e4
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ae3b8ac-3cbb-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:01:02 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id n184so2501153ywc.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+peo1lNWpi8ay2FPpKP+1+5l21PnbXHs4DF9skrc64=;
 b=oRP3L/aelcF4tFkz0CMIRBrm2HlIEpmOVLczmta75UDs/rtMRw2G30h57Zn6Fq3my6
 +xeKZvZgEKoSru1pXuRrIDqgfpCEZzTicSTxauS1Ay7WfbK7U8QXv7TMGM4bSb2+mlwF
 xlIATscjyH5x82kDgHzuXt6Q9iUWf/PrvmXgU6TwhsCodyBodfaxAgR/AUrcdj14QSby
 d7xLAEk/X+sUnDc9p5pCSfwtPDaKOjrWEmkd4QskksMrOnR6HJP+qQCI3aChEHvu/mwJ
 +4nJuj7hAl0JiG42n99hffwDOtdNXicMhFRfPJ/uqTdPU7SfZTFQYvxE2ivfKpFOOy6p
 51Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+peo1lNWpi8ay2FPpKP+1+5l21PnbXHs4DF9skrc64=;
 b=qPGHXttJJNUxhr8zT5/nd8WS0PtW48qybWfs4GwGC+CigGuCC6SubERTB64TsMu/y0
 MIBTWVPnpz7pU7XPDW/buruJLS7cadK1HVF99M/FkENhnJskoxRBv3rFfxP/ALqYZsZs
 brcJtZQfuVVGD7ibSMrkoNh050IlM7J83WrGCgiUPFfXTzyHuXPKU7Tbjt18PrPypjzY
 0uTbDhlGu5U0vVZmNBwvlXGEUKJ7g4DT7U6UZgKF60Fz8ydPz5UDFIUy3Wl+JfzU8v0B
 uOet3RI4NjzP6wNIYGoQowHb8/0Qj2oIYreXQDgWxwoyLIDLvrv3TpiouQ88KajQ6mgP
 fPlg==
X-Gm-Message-State: APjAAAV/dQLB9akbHYPQRs86mgBUVXjd6eQ7qarHeP93N/Q0a3C+nTe4
 eA5ZtkJnqz15qeZKYm+Fw+vii7SLpJDwMQ==
X-Google-Smtp-Source: APXvYqx2r1H43IY+7X3aOHEgvtbRX+Vb4XbeqgOWzkZ1D0QjticLeKguljW5ZRjLMx7EBRI5lokZlQ==
X-Received: by 2002:a81:758a:: with SMTP id q132mr5634978ywc.162.1579658462108; 
 Tue, 21 Jan 2020 18:01:02 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:01:01 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:59 -0600
Message-Id: <a549947575a335a6e3fc4cbd2335d1e6d2a43ff9.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 20/23] riscv: Add smpboot.c
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9hcmNoL3Jpc2N2L3NtcGJvb3QuYyB8IDExNCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3Jpc2N2L3NtcGJvb3QuYwoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3Jpc2N2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3Jpc2N2L3NtcGJvb3QuYwpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mMTI1MTc5YTNlCi0tLSAvZGV2L251bGwKKysr
IGIveGVuL2FyY2gvcmlzY3Yvc21wYm9vdC5jCkBAIC0wLDAgKzEsMTE0IEBACisvKgorICogRHVt
bXkgc21wYm9vdCBzdXBwb3J0CisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cisg
KiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBM
aWNlbnNlLCBvcgorICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisg
KiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBp
bXBsaWVkIHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBmb3IgbW9yZSBkZXRhaWxzLgorICovCisKKyNpbmNsdWRlIDx4ZW4vY3B1Lmg+CisjaW5jbHVk
ZSA8eGVuL2NwdW1hc2suaD4KKyNpbmNsdWRlIDx4ZW4vZGVsYXkuaD4KKyNpbmNsdWRlIDx4ZW4v
ZG9tYWluX3BhZ2UuaD4KKyNpbmNsdWRlIDxwdWJsaWMvZG9tY3RsLmg+CisjaW5jbHVkZSA8eGVu
L2Vycm5vLmg+CisjaW5jbHVkZSA8eGVuL2luaXQuaD4KKyNpbmNsdWRlIDx4ZW4vbW0uaD4KKyNp
bmNsdWRlIDx4ZW4vc2NoZWQuaD4KKyNpbmNsdWRlIDx4ZW4vc21wLmg+CisjaW5jbHVkZSA8eGVu
L3NvZnRpcnEuaD4KKyNpbmNsdWRlIDx4ZW4vdGltZXIuaD4KKyNpbmNsdWRlIDx4ZW4vd2Fybmlu
Zy5oPgorI2luY2x1ZGUgPHhlbi9pcnEuaD4KKyNpbmNsdWRlIDx4ZW4vY29uc29sZS5oPgorCitj
cHVtYXNrX3QgY3B1X29ubGluZV9tYXA7CitjcHVtYXNrX3QgY3B1X3ByZXNlbnRfbWFwOworY3B1
bWFza190IGNwdV9wb3NzaWJsZV9tYXA7CisKKy8qIEZha2Ugb25lIG5vZGUgZm9yIG5vdy4gU2Vl
IGFsc28gaW5jbHVkZS9hc20tYXJtL251bWEuaCAqLworbm9kZW1hc2tfdCBfX3JlYWRfbW9zdGx5
IG5vZGVfb25saW5lX21hcCA9IHsgeyBbMF0gPSAxVUwgfSB9OworCisvKiBCb290IGNwdSBkYXRh
ICovCitzdHJ1Y3QgaW5pdF9pbmZvIGluaXRfZGF0YSA9Cit7Cit9OworCisvKiBTaGFyZWQgc3Rh
dGUgZm9yIGNvb3JkaW5hdGluZyBDUFUgdGVhcmRvd24gKi8KK3N0YXRpYyBib29sIGNwdV9pc19k
ZWFkOworCisvKiBJRCBvZiB0aGUgUENQVSB3ZSdyZSBydW5uaW5nIG9uICovCitERUZJTkVfUEVS
X0NQVSh1bnNpZ25lZCBpbnQsIGNwdV9pZCk7CisvKiBYWFggdGhlc2Ugc2VlbSBhd2Z1bGx5IHg4
NmlzaC4uLiAqLworLyogcmVwcmVzZW50aW5nIEhUIHNpYmxpbmdzIG9mIGVhY2ggbG9naWNhbCBD
UFUgKi8KK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIGNwdV9zaWJs
aW5nX21hc2spOworLyogcmVwcmVzZW50aW5nIEhUIGFuZCBjb3JlIHNpYmxpbmdzIG9mIGVhY2gg
bG9naWNhbCBDUFUgKi8KK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3Qs
IGNwdV9jb3JlX21hc2spOworCisvKgorICogQnkgZGVmYXVsdCBub24tYm9vdCBDUFVzIG5vdCBp
ZGVudGljYWwgdG8gdGhlIGJvb3QgQ1BVIHdpbGwgYmUKKyAqIHBhcmtlZC4KKyAqLworc3RhdGlj
IGJvb2wgX19yZWFkX21vc3RseSBvcHRfaG1wX3Vuc2FmZSA9IGZhbHNlOworYm9vbGVhbl9wYXJh
bSgiaG1wLXVuc2FmZSIsIG9wdF9obXBfdW5zYWZlKTsKKworaW50IF9fY3B1X3VwKHVuc2lnbmVk
IGludCBjcHUpCit7CisgICAgcHJpbnRrKCJCcmluZ2luZyB1cCBDUFUlZFxuIiwgY3B1KTsKKwor
ICAgIGNvbnNvbGVfc3RhcnRfc3luYygpOyAvKiBTZWNvbmRhcnkgbWF5IHVzZSBlYXJseV9wcmlu
dGsgKi8KKworICAgIC8qIFRPRE8gKi8KKworICAgIHJldHVybiAwOworfQorCisvKiBTaHV0IGRv
d24gdGhlIGN1cnJlbnQgQ1BVICovCit2b2lkIF9fY3B1X2Rpc2FibGUodm9pZCkKK3sKKyAgICB1
bnNpZ25lZCBpbnQgY3B1ID0gZ2V0X3Byb2Nlc3Nvcl9pZCgpOworCisgICAgLyogVE9ETyAqLwor
CisgICAgLyogSXQncyBub3cgc2FmZSB0byByZW1vdmUgdGhpcyBwcm9jZXNzb3IgZnJvbSB0aGUg
b25saW5lIG1hcCAqLworICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmNwdV9vbmxpbmVfbWFw
KTsKKworICAgIHNtcF9tYigpOworCisgICAgLyogUmV0dXJuIHRvIGNhbGxlcjsgZXZlbnR1YWxs
eSB0aGUgSVBJIG1lY2hhbmlzbSB3aWxsIHVud2luZCBhbmQgdGhlIAorICAgICAqIHNjaGVkdWxl
ciB3aWxsIGRyb3AgdG8gdGhlIGlkbGUgbG9vcCwgd2hpY2ggd2lsbCBjYWxsIHN0b3BfY3B1KCku
ICovCit9CisKK3ZvaWQgX19jcHVfZGllKHVuc2lnbmVkIGludCBjcHUpCit7CisgICAgdW5zaWdu
ZWQgaW50IGkgPSAwOworCisgICAgd2hpbGUgKCAhY3B1X2lzX2RlYWQgKQorICAgIHsKKyAgICAg
ICAgbWRlbGF5KDEwMCk7CisgICAgICAgIGNwdV9yZWxheCgpOworICAgICAgICBwcm9jZXNzX3Bl
bmRpbmdfc29mdGlycXMoKTsKKyAgICAgICAgaWYgKCAoKytpICUgMTApID09IDAgKQorICAgICAg
ICAgICAgcHJpbnRrKEtFUk5fRVJSICJDUFUgJXUgc3RpbGwgbm90IGRlYWQuLi5cbiIsIGNwdSk7
CisgICAgICAgIHNtcF9tYigpOworICAgIH0KKyAgICBjcHVfaXNfZGVhZCA9IGZhbHNlOworICAg
IHNtcF9tYigpOworfQorCit2b2lkIHN0b3BfY3B1KHZvaWQpCit7CisgICAgbG9jYWxfaXJxX2Rp
c2FibGUoKTsKKyAgICBjcHVfaXNfZGVhZCA9IHRydWU7CisKKyAgICAvKiBUT0RPICovCisKKyAg
ICB3aGlsZSAoIDEgKQorICAgICAgICB3YWl0X2Zvcl9pbnRlcnJ1cHQoKTsKK30KLS0gCjIuMjUu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
