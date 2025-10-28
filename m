Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A27C17581
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 00:29:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152456.1483021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDt6x-00043f-Tj; Tue, 28 Oct 2025 23:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152456.1483021; Tue, 28 Oct 2025 23:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDt6x-00041t-Qg; Tue, 28 Oct 2025 23:28:19 +0000
Received: by outflank-mailman (input) for mailman id 1152456;
 Tue, 28 Oct 2025 23:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQG5=5F=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vDt6w-00041l-FH
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 23:28:18 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5ea95c5-b455-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 00:28:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 708047791AD6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:28:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ktnb9_k3UW6d for <xen-devel@lists.xenproject.org>;
 Tue, 28 Oct 2025 18:28:12 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DC81A7791B68
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:28:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SwsIzSdNYKGt for <xen-devel@lists.xenproject.org>;
 Tue, 28 Oct 2025 18:28:11 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B96ED7791AD6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:28:11 -0500 (CDT)
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
X-Inumbo-ID: c5ea95c5-b455-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DC81A7791B68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761694091; bh=oc2vxb9Rrjo+rAFaXjwTtcG7fVl6qe6ldYdpCXRznnk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=GyeU/gIgbUycoLBUxRcgn3dN1fByRVzV0K2v5Oc8HkmeNKhFmK/MpQyd0xILqAO/W
	 eeuGsVLOvKVW/Rsv/p0kUqwnnWjyVni8chWMsbIVFAy3zH9W9whxi8An6MEnIy0flG
	 3aPUt5EnEAEilIYZXY1G+5MFdjGLL688FkoEFYuk=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Tue, 28 Oct 2025 18:28:09 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1073632839.4116.1761694089023.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: w1FkJduz6E49ygNyqHsmJZ5pCS/MpA==
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer

Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
maintainer.

