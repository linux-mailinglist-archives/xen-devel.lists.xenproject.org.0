Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E70B2190C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 01:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078138.1439139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulbiM-0000MX-14; Mon, 11 Aug 2025 23:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078138.1439139; Mon, 11 Aug 2025 23:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulbiL-0000Jz-UA; Mon, 11 Aug 2025 23:14:01 +0000
Received: by outflank-mailman (input) for mailman id 1078138;
 Mon, 11 Aug 2025 23:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XhN=2X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ulbiK-0000Ja-66
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 23:14:00 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92319ee-7708-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 01:13:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C1A5F42B8B;
 Mon, 11 Aug 2025 23:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB218C4CEED;
 Mon, 11 Aug 2025 23:13:51 +0000 (UTC)
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
X-Inumbo-ID: d92319ee-7708-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954032;
	bh=bwC4EqjSsFYGlKn9k17jzkkCt8DFr5cjT8mwHg1dH5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G1moMz/DghypV3TcV8wnxVOI5OrSjEddGf0GTQdNk71z7wgZL5uDqiTziBaEmRxho
	 +oK++6bFQYfnrBOwBeZGWwDq/8na2XROl5SWrkGSg5IEKW0DG4Jb+3dOLMXEvlG2J0
	 1NpSiWybz9cFrh2C/I4fOi35W+sdFnEAO8sLHUtDTW4EdrEi3x8H0m7qVtR/bLOySG
	 m7vs9CITQ64ZNyQs8cu/lRQLHCvFI2OXO+9T7mbbYeMnl+LWntoyYG0W0N48WGMshq
	 og0Ny8Hf0ICiTJhb3YoeZaxHw1xvrnrIM15Mfz8ZoWIHu9iDaR+HUo+KHuvh7G2X26
	 y5O4DfgnahC4g==
Date: Mon, 11 Aug 2025 16:13:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, andrei.cherechesu@nxp.com, dmukhin@ford.com
Subject: Re: [ImageBuilder] Make DEVICE_TREE optional parameter
In-Reply-To: <20250807154614.456654-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2508111447010.2883419@ubuntu-linux-20-04-desktop>
References: <20250807154614.456654-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-146452198-1754953035=:2883419"
Content-ID: <alpine.DEB.2.22.394.2508111602110.2883419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-146452198-1754953035=:2883419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2508111602111.2883419@ubuntu-linux-20-04-desktop>

On Thu, 7 Aug 2025, Ayan Kumar Halder wrote:
> There are systems where device tree binary is passed by the U-Boot as
> $fdtcontroladdr. In such cases, no external device tree binary is provided
> during uboot script generation.
> 
> This is an enhancement on top of the following commit:-
> uboot-script-gen: Dynamically compute addr and size when loading bina…
> 
> When DEVICE_TREE is not present, $CALC is set as the addresses and sizes should
> be computed dynamically from U-Boot.

I would prefer if we did not automatically enable $CALC. If it doesn't
work without $CALC enabled, we could add a check for it and print an
error and exit. I would prefer that then enabling $CALC silently.

Also I don't think we should use the check ${DEVICE_TREE+x}. I'd prefer
to stick with the existing checks based on test ${DEVICE_TREE}.

The rest looks OK.

It might be possible to simplify this patch down to this (untested).
The last chunk of the diff is actually an unrelated fix, it looks like
we didn't test BOOT_CMD="none" when the -s option was introduced.

What do you think?


diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 9e97944..67e0f9a 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1646,6 +1646,15 @@ if test "$FIT"
 then
     echo 'fit_addr=$fileaddr' >>  $UBOOT_SOURCE
 fi
+if test -z "$DEVICE_TREE"
+then
+    if test -z "$CALC"
+    then
+       echo "DEVICE_TREE is unset and -s is not specified"
+       exit 1
+    fi
+    echo "setenv host_fdt_addr \${fdtcontroladdr}" >> $UBOOT_SOURCE
+fi
 
 memaddr=$(( $MEMORY_START + $offset ))
 # 12582912 is 0xc00000, 12MB
@@ -1689,9 +1698,12 @@ then
     done
 fi
 
-check_file_type $DEVICE_TREE "Device Tree Blob"
-device_tree_addr=$memaddr
-load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
+if test "$DEVICE_TREE"
+then
+    check_file_type $DEVICE_TREE "Device Tree Blob"
+    device_tree_addr=$memaddr
+    load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
+fi
 bitstream_load_and_config  # bitstream is loaded last but used first
 device_tree_editing $device_tree_addr
 
@@ -1719,8 +1731,11 @@ then
     fi
 else
     # skip boot command but store load addresses to be used later
-    echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-    echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    if test -z "$CALC"
+    then
+        echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
+        echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    fi
 fi
 
 if test "$FIT"
--8323329-146452198-1754953035=:2883419--

