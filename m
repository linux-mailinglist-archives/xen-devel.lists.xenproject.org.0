Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95890136564
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 03:34:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipk4o-0004lg-Sn; Fri, 10 Jan 2020 02:31:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iVu5=27=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipk4m-0004kx-Mi
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 02:31:04 +0000
X-Inumbo-ID: 3adf1b64-3351-11ea-a985-bc764e2007e4
Received: from mail-il1-f193.google.com (unknown [209.85.166.193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3adf1b64-3351-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 02:30:56 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id v15so604745iln.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 18:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/yjllHkFnMQGLT8VfSEgGxQb9zI/JFOCa8xhRGm7k8=;
 b=qgj8beyiTkTH26v44LjI6wKmGPc1BK9QGxiJITZf5ksGkA0Rgrz2Pq2KaqXzTmh1qm
 SkdR7fwETtadONjbqE08dxou2WEuHIt/3j+YEVZwLoRQRrl9po6xIC92V0osyvVGR8Gg
 nPvsMYY/LY0/aK1q4+s98jCaANybAcbhDFXWN60rh2si7vo5sLyK62+Pf9d4i0IrWLBL
 Aab/QF79dY8ax4tUiIW4F/KJ0P7Rnm4iwhaaJx8GFfXAGVogC8GTqt1YsHaLaVyz7DxV
 h1/fVLLL2w5YI7se15q3W3rihE2ZZOj4fMmlWhCRQL7VKw3CpeXr3K6E7hGrcclNYxZy
 w0bw==
X-Gm-Message-State: APjAAAUOHfpl8LH8fk13pfWDEtWynpewx+ZXCqgpPSvfPkkhB8Ozz4BI
 qptmD2+h3LfXWsa3gBgQlvcHbMEP1uk=
X-Google-Smtp-Source: APXvYqz6E5a9E7Erm8umj69G1U4RuTdQc0VwHwYHiG5fwEQaz7pTi1wWoakMOoB2JKeUhvcIFiD2XQ==
X-Received: by 2002:a92:1f16:: with SMTP id i22mr664477ile.206.1578623455486; 
 Thu, 09 Jan 2020 18:30:55 -0800 (PST)
Received: from l1.lan ([2601:280:4c00:797:7e7a:91ff:fe03:32f2])
 by smtp.gmail.com with ESMTPSA id p12sm233622ilk.66.2020.01.09.18.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 18:30:54 -0800 (PST)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 Jan 2020 19:30:51 -0700
Message-Id: <20200110023052.21159-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] MAINTAINERS: adjust path of actually
 maintained memshr code in tools
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25seSB0b29scy90ZXN0cy9tZW0tc2hhcmluZyBpcyBtYWludGFpbmVkIHVuZGVyIHRoZSB0b29s
cyBmb2xkZXIuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCmluZGV4IGE0MmZlZjZhYjkuLjIxNzQ0YWNlNmQgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJT
CisrKyBiL01BSU5UQUlORVJTCkBAIC01MDQsNyArNTA0LDcgQEAgWDg2IE1FTU9SWSBTSEFSSU5H
CiBNOglUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CiBTOglPZGQgRml4ZXMK
IEY6CXhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCi1GOgl0b29scy9tZW1zaHIKK0Y6CXRv
b2xzL3Rlc3RzL21lbS1zaGFyaW5nLwogCiBYODYgU0hBRE9XIFBBR0VUQUJMRVMKIE06CVRpbSBE
ZWVnYW4gPHRpbUB4ZW4ub3JnPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
