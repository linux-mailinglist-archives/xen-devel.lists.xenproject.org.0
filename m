Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88A221434
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 20:26:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvm5w-00068u-4v; Wed, 15 Jul 2020 18:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QyDK=A2=protonmail.com=peter.jac@srs-us1.protection.inumbo.net>)
 id 1jvl1G-0000D5-Cb
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:16:34 +0000
X-Inumbo-ID: edb623bd-c6be-11ea-9429-12813bfff9fa
Received: from mail-40140.protonmail.ch (unknown [185.70.40.140])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edb623bd-c6be-11ea-9429-12813bfff9fa;
 Wed, 15 Jul 2020 17:16:32 +0000 (UTC)
Date: Wed, 15 Jul 2020 17:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1594833391;
 bh=FGH8dWCw4hV8XCyDkS3efIcLcu5p/CZ6AfNx0XnEB7s=;
 h=Date:To:From:Reply-To:Subject:From;
 b=umYRc7WXhZFnrVxaJySJ2udSuyjRul8hIqy9yd2KKfPPTOhKAwGbXgjCJHY4qsW+d
 LNR5Kw4Rq2Kg45w9pkbfME1Ym2IAs829XI6v0Eg21BQjLPyrm6EOry78jVzO1gVgyI
 NGfw0W0hiO7ygzzXdwBBVsBPpQ4OGUriX8eI/+WM=
To: xen-users@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
From: peter.jac@protonmail.com
Subject: OpenSUSE and Xen
Message-ID: <jy5CG4DqGrBAir35SWF8DPAZHsHJPYzw4pdQWS8fMylQgEe3hrFhfJG2lZmgvXorh1TayKgqOgrEX8413UGzmF-RU4i_V479poF1OrnKNw8=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_F64iiwOB3gLbt06sPrBEgOIgF8BgaRWf0z9GLTC3c"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Wed, 15 Jul 2020 18:25:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: peter.jac@protonmail.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

--b1_F64iiwOB3gLbt06sPrBEgOIgF8BgaRWf0z9GLTC3c
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sCkkgaGF2ZSBhIHF1ZXN0aW9uIGZyb20gYWxsIFhlbiBQcm9qZWN0IGRldmVsb3BlcnMg
YW5kIHVzZXJzLiBJcyBPcGVuU1VTRSBzdXBwb3J0aW5nIFhlbiBQcm9qZWN0PwpEaWQgYW55b25l
IGluc3RhbGwgT3BlblNVU0U/IFdoeSBPcGVuU1VTRSBub3QgaGF2ZSBhbnkgb3B0aW9uIGFib3V0
IGluc3RhbGxpbmcgWGVuIGR1cmluZyBpbnN0YWxsYXRpb24gYnV0IGhhdmUgYW4gb3B0aW9uIGFi
b3V0IEtWTT8KV2h5IFhlbiBwYWNrYWdlIGRvZXNuJ3QgaW5jbHVkZWQ/CgpDaGVlcnMu

--b1_F64iiwOB3gLbt06sPrBEgOIgF8BgaRWf0z9GLTC3c
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGJyPkhlbGxvLDxicj5JIGhhdmUgYSBxdWVzdGlvbiBmcm9tIGFsbCBYZW4gUHJvamVjdCBkZXZl
bG9wZXJzIGFuZCB1c2Vycy4gSXMgT3BlblNVU0Ugc3VwcG9ydGluZyBYZW4gUHJvamVjdD88YnI+
RGlkIGFueW9uZSBpbnN0YWxsIE9wZW5TVVNFPyBXaHkgT3BlblNVU0Ugbm90IGhhdmUgYW55IG9w
dGlvbiBhYm91dCBpbnN0YWxsaW5nIFhlbiBkdXJpbmcgaW5zdGFsbGF0aW9uIGJ1dCBoYXZlIGFu
IG9wdGlvbiBhYm91dCBLVk0/PGJyPldoeSBYZW4gcGFja2FnZSBkb2Vzbid0IGluY2x1ZGVkPzxi
cj48YnI+PGJyPkNoZWVycy48YnI+PGJyPg==


--b1_F64iiwOB3gLbt06sPrBEgOIgF8BgaRWf0z9GLTC3c--


