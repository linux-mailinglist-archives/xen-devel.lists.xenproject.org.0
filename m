Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8C28E986
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 02:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7049.18444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSrHf-0000Ka-DD; Thu, 15 Oct 2020 00:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7049.18444; Thu, 15 Oct 2020 00:38:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSrHf-0000KE-9v; Thu, 15 Oct 2020 00:38:19 +0000
Received: by outflank-mailman (input) for mailman id 7049;
 Thu, 15 Oct 2020 00:38:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0U26=DW=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
 id 1kSrHd-0000K9-5n
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 00:38:17 +0000
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e283bce3-2633-4cf9-b245-c34d745a5b1b;
 Thu, 15 Oct 2020 00:38:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0U26=DW=protonmail.com=dylangerdaly@srs-us1.protection.inumbo.net>)
	id 1kSrHd-0000K9-5n
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 00:38:17 +0000
X-Inumbo-ID: e283bce3-2633-4cf9-b245-c34d745a5b1b
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e283bce3-2633-4cf9-b245-c34d745a5b1b;
	Thu, 15 Oct 2020 00:38:14 +0000 (UTC)
Date: Thu, 15 Oct 2020 00:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1602722292;
	bh=/fqAIMxPWPvzaXeK8gBlRXsB72ne3oC35pwC7ZnmDbM=;
	h=Date:To:From:Reply-To:Subject:From;
	b=MNyNJ6f163HsWWNZga8uncBJHsFuX2ma55N+Z33YlxQQA+XqnrlgV3Z45hLFSJ1AA
	 Z7T7uG+YN3+O2V4VrMU1rdBETDjAbWs0tndhRlniuL8V2BCC0RcvTcCgxWCPPJihje
	 u/cApWv+/BF59J4qoyI1IT+iyORuWshCFkaUa4W4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Dylanger Daly <dylangerdaly@protonmail.com>
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
Message-ID: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_0o8C518sVj5uzonzPIXYDTCbYqkejcC6SFvq1G2c"
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
	shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

This is a multi-part message in MIME format.

--b1_0o8C518sVj5uzonzPIXYDTCbYqkejcC6SFvq1G2c
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgQWxsLAoKSSdtIGN1cnJlbnRseSB1c2luZyBYZW4gNC4xNCAoUXViZXMgNC4xIE9TKSBvbiBh
IFJ5emVuIDcgNDc1MFUgUFJPLCBieSBkZWZhdWx0IEknbGwgZXhwZXJpZW5jZSBzb2Z0bG9ja3Mg
d2hlcmUgdGhlIG1vdXNlIGZvciBleGFtcGxlIHdpbGwgam9sdCBmcm9tIHRpbWUgdG8gdGltZSwg
aW4gdGhpcyBzdGF0ZSBpdCdzIG5vdCB1c2FibGUuCgpBZGRpbmcgYGRvbTBfbWF4X3ZjcHVzPTEg
ZG9tMF92Y3B1c19waW5gIHRvIFhlbidzIENNRExJTkUgcmVzdWx0cyBpbiBubyBtb3JlIGpvbHRp
bmcgaG93ZXZlciBwZXJmb3JtYW5jZSBpc24ndCB3aGF0IGl0IHNob3VsZCBiZSBvbiBhbiA4IGNv
cmUgQ1BVLCBzb2Z0bG9ja3MgYXJlIHN0aWxsIGEgcHJvYmxlbSB3aXRoaW4gZG9tVSdzLCBhbnkg
c29ydCBvZiBVSSBhbmltYXRpb24gZm9yIGV4YW1wbGUuCgpSZXZlcnRpbmcgW3RoaXMgY29tbWl0
ICg4ZTJhYTc2ZGMxNjcwZTgyZWFhMTU2ODMzNTM4NTNiYzY2YmY1NGZjKV0oaHR0cHM6Ly9naXRo
dWIuY29tL3hlbi1wcm9qZWN0L3hlbi9jb21taXQvOGUyYWE3NmRjMTY3MGU4MmVhYTE1NjgzMzUz
ODUzYmM2NmJmNTRmYykgcmVzdWx0cyBpbiBldmVuIHdvcnNlIHBlcmZvcm1hbmNlIHdpdGggb3Ig
d2l0aG91dCB0aGUgYWJvdmUgY2hhbmdlcyB0byBDTURMSU5FLCBhbmQgaXQncyBub3QgdXNhYmxl
IGF0IGFsbC4KCkRvZXMgYW55b25lIGhhdmUgYW55IHBvaW50ZXJzPwoKQ2hlZXJz

--b1_0o8C518sVj5uzonzPIXYDTCbYqkejcC6SFvq1G2c
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSdtIGN1cnJlbnRseSB1
c2luZyBYZW4gNC4xNCAoUXViZXMgNC4xIE9TKSBvbiBhIFJ5emVuIDcmbmJzcDs0NzUwVSBQUk8s
IGJ5IGRlZmF1bHQgSSdsbCBleHBlcmllbmNlIHNvZnRsb2NrcyB3aGVyZSB0aGUgbW91c2UgZm9y
IGV4YW1wbGUgd2lsbCBqb2x0IGZyb20gdGltZSB0byB0aW1lLCBpbiB0aGlzIHN0YXRlIGl0J3Mg
bm90IHVzYWJsZS48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BZGRpbmcgYGRvbTBfbWF4
X3ZjcHVzPTEgZG9tMF92Y3B1c19waW5gIHRvIFhlbidzIENNRExJTkUgcmVzdWx0cyBpbiBubyBt
b3JlIGpvbHRpbmcgaG93ZXZlciBwZXJmb3JtYW5jZSBpc24ndCB3aGF0IGl0IHNob3VsZCBiZSBv
biBhbiA4IGNvcmUgQ1BVLCBzb2Z0bG9ja3MgYXJlIHN0aWxsIGEgcHJvYmxlbSB3aXRoaW4gZG9t
VSdzLCBhbnkgc29ydCBvZiBVSSBhbmltYXRpb24gZm9yIGV4YW1wbGUuPGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+UmV2ZXJ0aW5nJm5ic3A7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L3hlbi1wcm9qZWN0L3hlbi9jb21taXQvOGUyYWE3NmRjMTY3MGU4MmVhYTE1NjgzMzUzODUzYmM2
NmJmNTRmYyIgdGFyZ2V0PSJfYmxhbmsiIHRpdGxlPSJodHRwczovL2dpdGh1Yi5jb20veGVuLXBy
b2plY3QveGVuL2NvbW1pdC84ZTJhYTc2ZGMxNjcwZTgyZWFhMTU2ODMzNTM4NTNiYzY2YmY1NGZj
IiByZWw9Im5vZm9sbG93Ij50aGlzIGNvbW1pdCAoOGUyYWE3NmRjMTY3MGU4MmVhYTE1NjgzMzUz
ODUzYmM2NmJmNTRmYyk8L2E+Jm5ic3A7cmVzdWx0cyBpbiBldmVuIHdvcnNlIHBlcmZvcm1hbmNl
IHdpdGggb3Igd2l0aG91dCB0aGUgYWJvdmUgY2hhbmdlcyB0byBDTURMSU5FLCBhbmQgaXQncyBu
b3QgdXNhYmxlIGF0IGFsbC48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Eb2VzIGFueW9u
ZSBoYXZlIGFueSBwb2ludGVycz88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DaGVlcnM8
L2Rpdj4=


--b1_0o8C518sVj5uzonzPIXYDTCbYqkejcC6SFvq1G2c--


