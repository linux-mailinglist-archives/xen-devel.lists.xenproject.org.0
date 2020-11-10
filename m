Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2A2ADD9C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 19:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23648.50551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXwo-0005FW-U2; Tue, 10 Nov 2020 18:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23648.50551; Tue, 10 Nov 2020 18:00:50 +0000
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
	id 1kcXwo-0005EJ-PH; Tue, 10 Nov 2020 18:00:50 +0000
Received: by outflank-mailman (input) for mailman id 23648;
 Tue, 10 Nov 2020 18:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXwn-00059I-HB
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:00:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe5ac561-eec2-4642-9b50-85772df026f8;
 Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXwh-0006qd-7R; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoS-0007RC-Gk; Tue, 10 Nov 2020 17:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXwn-00059I-HB
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:00:49 +0000
X-Inumbo-ID: fe5ac561-eec2-4642-9b50-85772df026f8
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fe5ac561-eec2-4642-9b50-85772df026f8;
	Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/V+Xsx5DyAJ7DrcbKg6+KBwsTjqitxu0fA7ODPAM4l8=; b=SSkY6Wm+6XNV8mzsO0jRUlugIB
	hWwAqvjfiM6g7mefDHPA9wKQ41EOnrQizDfX8PhGEdROla/sUXxwK+eQNoP8S/9u4jgYNxFrJNeHM
	6ajdsvN+jXf4qHNyOuF8kcl6Li4AE3OyFHcXvPvFJbeiNIge2hj5cXeRAWIbAuodZSMU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXwh-0006qd-7R; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoS-0007RC-Gk; Tue, 10 Nov 2020 17:52:12 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 23/24] docs/man: modify xl-pci-configuration(5) to add 'name' field to PCI_SPEC_STRING
Date: Tue, 10 Nov 2020 17:51:46 +0000
Message-Id: <20201110175147.7067-24-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Since assignable devices can be named, a subsequent patch will support use
of a PCI_SPEC_STRING containing a 'name' parameter instead of a 'bdf'. In
this case the name will be used to look up the 'bdf' in the list of assignable
(or assigned) devices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl-pci-configuration.5.pod | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index 4dd73bc498d6..db3360307cbd 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -51,7 +51,7 @@ is not specified, or if it is specified with an empty value (whether
 positionally or explicitly).
 
 B<NOTE>: In context of B<xl pci-detach> (see L<xl(1)>), parameters other than
-B<bdf> will be ignored.
+B<bdf> or B<name> will be ignored.
 
 =head1 Positional Parameters
 
@@ -70,7 +70,11 @@ B<*> to indicate all functions of a multi-function device.
 
 =item Default Value
 
-None. This parameter is mandatory as it identifies the device.
+None. This parameter is mandatory in its positional form. As a non-positional
+parameter it is also mandatory unless a B<name> parameter is present, in
+which case B<bdf> must not be present since the B<name> will be used to find
+the B<bdf> in the list of assignable devices. See L<xl(1)> for more information
+on naming assignable devices.
 
 =back
 
@@ -194,4 +198,21 @@ B<NOTE>: This overrides the global B<rdm> option.
 
 =back
 
+=item B<name>=I<STRING>
+
+=over 4
+
+=item Description
+
+This is the name given when the B<BDF> was made assignable. See L<xl(1)> for
+more information on naming assignable devices.
+
+=item Default Value
+
+None. This parameter must not be present if a B<bdf> parameter is present.
+If a B<bdf> parameter is not present then B<name> is mandatory as it is
+required to look up the B<BDF> in the list of assignable devices.
+
+=back
+
 =back
-- 
2.20.1


