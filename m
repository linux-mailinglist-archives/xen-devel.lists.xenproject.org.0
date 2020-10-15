Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8F28F667
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7547.19835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5on-0000oi-Rg; Thu, 15 Oct 2020 16:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7547.19835; Thu, 15 Oct 2020 16:09:29 +0000
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
	id 1kT5on-0000nv-NQ; Thu, 15 Oct 2020 16:09:29 +0000
Received: by outflank-mailman (input) for mailman id 7547;
 Thu, 15 Oct 2020 16:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5om-0000mi-3O
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd437341-70cf-41f8-ab23-e7417d87276f;
 Thu, 15 Oct 2020 16:09:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5ol-0000gl-0Z
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:27 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5ok-0006fE-W1
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:26 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WR-0000oB-0p; Thu, 15 Oct 2020 16:50:31 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5om-0000mi-3O
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:28 +0000
X-Inumbo-ID: dd437341-70cf-41f8-ab23-e7417d87276f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dd437341-70cf-41f8-ab23-e7417d87276f;
	Thu, 15 Oct 2020 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Eb2yZLxvdxwd6Ruht+D5KNOOBqV7wkTSytbhDN+ksww=; b=pcoWROS+3Qx7axDTdPcbd1X2zg
	YDzlPXdGcMkg/HXAmGrVVr1QZWy5Wg8HIj+akL2PuMqCmwHJXN7xugVx+ur3oVxQWafXfeDn3qqjN
	TH8HThuWkxsRhpotYAAJwqkEuUNhqwu9ZJoGJdfmTGlNd3Jw8AMb1SPJthZQHHtL8hK4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5ol-0000gl-0Z
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:27 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5ok-0006fE-W1
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:26 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WR-0000oB-0p; Thu, 15 Oct 2020 16:50:31 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 17/17] cr-daily-branch: Heuristics for when to do immediate retest flight
Date: Thu, 15 Oct 2020 16:50:19 +0100
Message-Id: <20201015155019.20705-18-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not do a retest if it would involve retesting more than 10% of the
original flight, or if it wouldn't get a push even if the retests
pass.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/cr-daily-branch b/cr-daily-branch
index 9b1961bd..e54ca227 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -497,11 +497,26 @@ while true; do
 	OSSTEST_IMMEDIATE_RETRY=false
 	retry_jobs=$(
 		perl <$mrof -wne '
+			$n_blockers = $1 if m/^nblockers (\d+)\s*$/;
+			$n_jobs     = $1 if m/^njobs (\d+)\s*$/;
 			next unless m/^regression (\S+) /;
 			my $j = $1;
 			next if $j =~ m/^build/;
 			$r{$j}++;
+			sub nope {
+				print STDERR "no retry: @_\n";
+				exit 0;
+			}
 			END {
+				my $n_retry_jobs = scalar(keys %r);
+ 				print STDERR <<"END";
+n_retry_jobs=$n_retry_jobs n_blockers=$n_blockers n_jobs=$n_jobs
+END
+				nope("other blockers") if 
+                                        $n_retry_jobs < $n_blockers;
+				nope("too many regressions") if
+					$n_retry_jobs > 1 &&
+					$n_retry_jobs > $n_jobs/10;
 				print "copy-jobs '$flight' $_ "
 					foreach sort keys %r;
 			}'
-- 
2.20.1


