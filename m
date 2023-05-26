Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9E7120F3
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 09:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539983.841400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtP-0003ma-NC; Fri, 26 May 2023 07:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539983.841400; Fri, 26 May 2023 07:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtP-0003k3-GR; Fri, 26 May 2023 07:29:43 +0000
Received: by outflank-mailman (input) for mailman id 539983;
 Fri, 26 May 2023 07:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xc68=BP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2RtO-0003UM-FD
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 07:29:42 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12f7af00-fb97-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 09:29:41 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4Q7TX64X
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 May 2023 09:29:33 +0200 (CEST)
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
X-Inumbo-ID: 12f7af00-fb97-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685086173; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=l1i/SpN7IoXyLCxtKbRcE8qxemJPzqzhZiiabaWtd8WLn+qgtkSOJOsO07vC8PyCrH
    0tU5ArybFAiqgIrW3AyIPnYeZBX/ilDR+HtbCuUcphuFrpuYhCsD9TCQf9pmrNHdPyzO
    O4KMPY6v4oJAICXF853449xMDiyRgaQLIvC3Mgl6M7HI2fwAdySVQj+OOkcgEKdUcdLi
    TkPpyp1D+8CiENDUdERdN5tYYTp/kmxico2RCNYFfxKWpPgp6f0iaibJbH2+ZW36+mm9
    wa0TtLEe07LgMAHTZjySnonJU9xwv9RCcGXsL/MFskehM0QxxUTSfITeVNQwxSh72DbG
    VK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086173;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WpoeBuGWahQjx/3EeADqCoRxafSHjWOb2yRv/RTe6Uo=;
    b=CNJ3dvKAoMGNLpiIxAvXaQHTpNikEjPtwMG9JacnTIOf/iKgd7MdCIEQ1RSANa5M1y
    E8zfs63wZJKlHIhW9WLT5BKZTX+jl34aA4Pvx2AUztlO6y+0YdvBFTztLJOMm6/AQ2Cq
    5ZReVSJHjmKabF/skGUxoTW7TjaAdiDkuc2Gzq7iybW8yP09N4Hw5OyMRFXNxWqhn5Lp
    ILfnRosz5OCSKTLCPjsA7e8nLdOvhwQAbyG9ap/uwFiQfMm2tCz4zyiVVwZc9a90fyOH
    hYQ5CliZGoyip+WCXl8gLRXzMsSRnwXs5ZseL55Bbv1viJWAvDq/Hm9vXmBCBjfP7Mx4
    oL2g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086173;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WpoeBuGWahQjx/3EeADqCoRxafSHjWOb2yRv/RTe6Uo=;
    b=T5w+qTlNfVPYH50sWMUQyIOgq2tZbX8fDtIAT+Rq9j6GRIDMB6NL0pHmsWW5B2c3N+
    iCFt3SSZYaI6LMvvLK9eK00+S20chnJyigJRQXQZNB/fr4JWpNtuBCyoQzWmwLwewEP0
    5BXurV1dRGRfXu+kKLSR1kiCwo3YbnZm/if2AUwHq4pbYnj6RovPTeDjWLlwsJt/3Yam
    ea4+8selNmD6cfQwzfATMgc9IqXVp5SezkOy0km1OWyg5rDW1sKhCmRkd8Dwxo9ab2bC
    m3/V7M491uiPxP1jgo00pY3dw6tirenWI3NcrtRDHUkGi59kX0X5W8VyKTGF5qs+aTLx
    kJlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685086173;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WpoeBuGWahQjx/3EeADqCoRxafSHjWOb2yRv/RTe6Uo=;
    b=0huKukAolae739l9QzADDZQTc3VDAUFQwHadcUOSh4Vlxh7dRZQHLrz913NCWi2egX
    09Ywh8DrvlUFlCLeVJDQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 2/3] xentrace: remove return value from monitor_tbufs
Date: Fri, 26 May 2023 09:29:15 +0200
Message-Id: <20230526072916.7424-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230526072916.7424-1-olaf@aepfle.de>
References: <20230526072916.7424-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The function always returns zero.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xentrace.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index b81abe8a51..a073cab26d 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -668,7 +668,7 @@ static void wait_for_event_or_timeout(unsigned long milliseconds)
  * monitor_tbufs - monitor the contents of tbufs and output to a file
  * @logfile:       the FILE * representing the file to log to
  */
-static int monitor_tbufs(void)
+static void monitor_tbufs(void)
 {
     int i;
 
@@ -795,8 +795,6 @@ static int monitor_tbufs(void)
     free(data);
     /* don't need to munmap - cleanup is automatic */
     close(outfd);
-
-    return 0;
 }
 
 
@@ -1164,7 +1162,6 @@ static void parse_args(int argc, char **argv)
 
 int main(int argc, char **argv)
 {
-    int ret;
     struct sigaction act;
 
     opts.outfile = 0;
@@ -1226,9 +1223,9 @@ int main(int argc, char **argv)
     sigaction(SIGINT,  &act, NULL);
     sigaction(SIGALRM, &act, NULL);
 
-    ret = monitor_tbufs();
+    monitor_tbufs();
 
-    return ret;
+    return 0;
 }
 
 /*

