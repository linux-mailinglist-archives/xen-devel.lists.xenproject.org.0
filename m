Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69337139C40
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 23:15:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7x2-00024m-3V; Mon, 13 Jan 2020 22:12:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir7x0-00024h-Jr
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 22:12:46 +0000
X-Inumbo-ID: d35d9ea8-3651-11ea-82f0-12813bfff9fa
Received: from mail-wm1-f47.google.com (unknown [209.85.128.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d35d9ea8-3651-11ea-82f0-12813bfff9fa;
 Mon, 13 Jan 2020 22:12:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id f129so11512370wmf.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 14:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pJTXjzMxIe8ST33LriGClk4UKgp3ybPvjw+mDaw6PXs=;
 b=fkgdQipAFBjFCXwd4JlBHDDxqK+LUyBEWjkdElXOnv2+pgxSy9ShhEuWOVObVcb2yk
 6nHiknKvbHsCX58+gYsbIquD1heB/YqQ9Zq8p8JUzT5SP0tRBzzo7VlUBx05w2x9tVI6
 YCz3MW23LAduZPQre+jyG9wWbozIS8VqG/zu8uoVQqEUdmiRa4Ek73hnEZ0PNwyIlVBm
 5HDIU93Cj6GzrZibqPnI5KOOjWdF+E8LjNEVUfxLFC+fW4z+/HioAEuQkt0IVOcy4rCq
 H+E3AypjRHKG7xlYHBji20L5yFg0H1TlZWQMvZVzQP12rQGGH7xJp8GegbEb1H3gE2hF
 NRtQ==
X-Gm-Message-State: APjAAAWOKRnk1F66DXr/q9tcp1P+LtlO9y9A6ljUFy+A0rDbL2qL1pha
 QigvXM0T17UeeQvVWGSjGaPGDuEge/roxA==
X-Google-Smtp-Source: APXvYqxY8n1p/u89pJPQXmWKXKmU9F+iQMZKo5F/bcDBkdLDYtsGDamEPBPkOXNjL0btkQH8UXHmZQ==
X-Received: by 2002:a1c:6404:: with SMTP id y4mr22821313wmb.143.1578953564990; 
 Mon, 13 Jan 2020 14:12:44 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id j12sm18384785wrw.54.2020.01.13.14.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 14:12:44 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 13 Jan 2020 22:12:27 +0000
Message-Id: <20200113221227.20857-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] docs/misc: livepatch: Espace backslash
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGFuZG9jIGlzIGN1cnJlbnRseSBmYWlsaW5nIHRvIGdlbmVyYXRlIHRoZSBwZGYgd2l0aCB0aGUg
Zm9sbG93aW5nCmVycm9yOgohIFVuZGVmaW5lZCBjb250cm9sIHNlcXVlbmNlLgpsLjEwNDggICBt
ZXRhZGF0YSBzdHJpbmcgZm9ybWF0IGlzOiBrZXk9dmFsdWVcMAoKSW4gdGhpcyBjYXNlLCB3ZSB3
YW50IHRvIHByaW50IFwwIHNvIHdlIG5lZWQgdG8gYmFja3NsYXNoLWVzY2FwZSB0aGUKZmlyc3Qg
Y2hhcmFjdGVyLgoKSW50ZXJlc3RpbmdseSBwYW5kb2Mgd2lsbCBub3QgY29tcGxhaW4gd2hlbiBj
cmVhdGluZyBodG1sIGFuZCB3aWxsIGp1c3QKaWdub3JlIFwwIGNvbXBsZXRlbHkuCgpGaXhlczog
NTA4M2UwZmY5MyAoImxpdmVwYXRjaDogQWRkIG1ldGFkYXRhIHJ1bnRpbWUgcmV0cmlldmFsIG1l
Y2hhbmlzbSIpClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNj
OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Ci0tLQogZG9jcy9taXNj
L2xpdmVwYXRjaC5wYW5kb2MgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvbGl2ZXBhdGNoLnBhbmRvYyBi
L2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jCmluZGV4IDJmM2Y5NWVkMzcuLjk0NzNhZDU5OTEg
MTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jCisrKyBiL2RvY3MvbWlzYy9s
aXZlcGF0Y2gucGFuZG9jCkBAIC03MzksNyArNzM5LDcgQEAgVGhlIGNhbGxlciBwcm92aWRlczoK
ICAgIENhbGxlciAqTVVTVCogYWxsb2NhdGUgZW5vdWdoIHNwYWNlIHRvIGJlIGFibGUgdG8gc3Rv
cmUgYWxsIHJlY2VpdmVkIGRhdGEKICAgIChpLmUuIHRvdGFsIGFsbG9jYXRlZCBzcGFjZSAqTVVT
VCogbWF0Y2ggdGhlIGBtZXRhZGF0YV90b3RhbF9zaXplYCB2YWx1ZQogICAgcHJvdmlkZWQgYnkg
dGhlIGh5cGVydmlzb3IpLiBJbmRpdmlkdWFsIHBheWxvYWQgbWV0YWRhdGEgc3RyaW5nIGNhbiBi
ZSBvZgotICAgYXJiaXRyYXJ5IGxlbmd0aC4gVGhlIG1ldGFkYXRhIHN0cmluZyBmb3JtYXQgaXM6
IGtleT12YWx1ZVwwLi4ua2V5PXZhbHVlXDAuCisgICBhcmJpdHJhcnkgbGVuZ3RoLiBUaGUgbWV0
YWRhdGEgc3RyaW5nIGZvcm1hdCBpczoga2V5PXZhbHVlXFwwLi4ua2V5PXZhbHVlXFwwLgogICog
YG1ldGFkYXRhX2xlbmAgLSBWaXJ0dWFsIGFkZHJlc3Mgb2Ygd2hlcmUgdG8gd3JpdGUgdGhlIGxl
bmd0aCBvZiBlYWNoIG1ldGFkYXRhCiAgICBzdHJpbmcgb2YgdGhlIHBheWxvYWQuIENhbGxlciAq
TVVTVCogYWxsb2NhdGUgdXAgdG8gYG5yYCBvZiB0aGVtLiBFYWNoICpNVVNUKgogICAgYmUgb2Yg
c2l6ZW9mKHVpbnQzMl90KSAoNCBieXRlcykuCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
