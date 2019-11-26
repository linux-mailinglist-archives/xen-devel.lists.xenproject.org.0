Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D26109F4B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZavE-0003J9-MC; Tue, 26 Nov 2019 13:30:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFuF=ZS=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZavD-0003J4-2K
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:30:27 +0000
X-Inumbo-ID: e7c832c6-1050-11ea-a3a2-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7c832c6-1050-11ea-a3a2-12813bfff9fa;
 Tue, 26 Nov 2019 13:30:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n188so3340383wme.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 05:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4MU0JsPwWPECeo8Skl4zCCTpRBnpB8uZZ6g4AZNquBM=;
 b=boydBgIGMthRC7Tb3oTLAMmwfeVjTG3ZSXCNjw5i2EV8WPAYm+w/p5f7r6V1TQT08k
 hZmeFTNbifdC9gv0fu8HDvf5fxoveZzadePMh0FpuOcM+kpS2a8iE2rO65aqIekIHAq4
 EPVcygoTUQqVUzTJCaT+TwOLxfjOoNsfS6hrE4XSBipgnOadquSLNn4/DOk3ndGLYBlX
 ZQ1zVomgn7Z4Z9dIFhsntPrB2MuzcoUB+1VoAvAcCU+jqeMwQt3dw6Y9BNHMjb/1I/oE
 IA2VLabl91Ye4veWyYtiLSITfSrxyWGGjSktA7GiqkpKUwB6c9C4Hl+jfDhL4Kj4Owwn
 5DOw==
X-Gm-Message-State: APjAAAXnnBbtR82Wvo1uwSB5J78tPnuMtQaFW3hewTUcpUX/YdklqHo2
 A7trbN88tzh2ai2SL6bA4TNK5h70OHU=
X-Google-Smtp-Source: APXvYqyKno4GvQ8Wjsd5qjxzH5288ey6c7NiU+vhNvTWbqKk7jnas1/EvO73SSRk3VhttgHOWWTvSA==
X-Received: by 2002:a1c:3941:: with SMTP id g62mr4202096wma.165.1574775025562; 
 Tue, 26 Nov 2019 05:30:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id e7sm1714375wrp.43.2019.11.26.05.30.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 05:30:25 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 26 Nov 2019 13:30:23 +0000
Message-Id: <20191126133023.48592-1-julien@xen.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: Update path to the livepatch
 documentation
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGQ2NjE2MTFkMDggImRvY3MvbWFya2Rvd246IFN3aXRjaCB0byB1c2luZyBwYW5kb2Ms
IGFuZCBmaXgKdW5kZXJzY29yZSBlc2NhcGluZyIgY29udmVydGVkIHRoZSBsaXZlcGF0Y2ggZG9j
dW1lbnRhdGlvbiBmcm9tIG1hcmtkb3duCnRvIHBhbmRvYy4KClVwZGF0ZSBNQUlOVEFJTkVSUyB0
byByZWZsZWN0IHRoZSBjaGFuZ2Ugc28gdGhlIGNvcnJlY3QgbWFpbnRhaW5lcnMgYXJlCkNDZWQg
dG8gdGhlIHBhdGNoZXMuCgpGaXhlczogZDY2MTYxMWQwOCAoImRvY3MvbWFya2Rvd246IFN3aXRj
aCB0byB1c2luZyBwYW5kb2MsIGFuZCBmaXggdW5kZXJzY29yZSBlc2NhcGluZyIpClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDI4ZTdlYjU1NGUuLjljODI3
YWQ3NTkgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0zMDQs
NyArMzA0LDcgQEAgTElWRVBBVENICiBNOglLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+CiBNOglSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4
LmNvbT4KIFM6CVN1cHBvcnRlZAotRjoJZG9jcy9taXNjL2xpdmVwYXRjaC5tYXJrZG93bgorRjoJ
ZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5kb2MKIEY6CXRvb2xzL21pc2MveGVuLWxpdmVwYXRjaC5j
CiBGOgl4ZW4vYXJjaC8qL2xpdmVwYXRjaCoKIEY6CXhlbi9hcmNoLyovKi9saXZlcGF0Y2gqCi0t
IAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
