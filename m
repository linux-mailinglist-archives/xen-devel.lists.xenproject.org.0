Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4450146303
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 09:06:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuXSo-00071h-Qb; Thu, 23 Jan 2020 08:03:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ed1=3M=ip-10-0-107-235.ec2.internal=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuXSm-00071c-Vw
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 08:03:41 +0000
X-Inumbo-ID: d934c1e6-3db6-11ea-8e9a-bc764e2007e4
Received: from ip-10-0-107-235.ec2.internal (unknown [35.173.76.244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d934c1e6-3db6-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 08:03:32 +0000 (UTC)
Received: from ip-10-0-107-235.ec2.internal (localhost [127.0.0.1])
 by ip-10-0-107-235.ec2.internal (8.15.2/8.15.2/Debian-10) with ESMTP id
 00MM3WVg027496; Wed, 22 Jan 2020 22:03:32 GMT
Received: (from elnikety@localhost)
 by ip-10-0-107-235.ec2.internal (8.15.2/8.15.2/Submit) id 00MM3W9p027495;
 Wed, 22 Jan 2020 22:03:32 GMT
From: Eslam Elnikety <elnikety@amazon.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 22:03:16 +0000
Message-Id: <cover.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v1 0/4] x86/microcode: Improve documentation and
 code
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw@amazon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
