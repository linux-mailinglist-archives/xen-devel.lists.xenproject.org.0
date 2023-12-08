Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8968098A6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650308.1015725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPot-0001Jn-9s; Fri, 08 Dec 2023 01:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650308.1015725; Fri, 08 Dec 2023 01:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPot-0001HO-6q; Fri, 08 Dec 2023 01:38:23 +0000
Received: by outflank-mailman (input) for mailman id 650308;
 Fri, 08 Dec 2023 01:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBPos-0001HI-Ho
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:38:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77656487-956a-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 02:38:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BCDEFCE2279;
 Fri,  8 Dec 2023 01:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1E9C433C8;
 Fri,  8 Dec 2023 01:38:16 +0000 (UTC)
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
X-Inumbo-ID: 77656487-956a-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701999497;
	bh=snK43I7fr7DFrsRReQ4Sh46xlev1Lwez9q+eOxuqSbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fgU/J0EQe5udxfrD4Ub1UD48j82YyCfuxcI3jmeGQeKdp88D8owjhfHTwDQ6nSEpR
	 6t6ADJIFBiMjdZDnDZ1Rtlm6sNfs76lstxtYNMeVoNFWUB9JTsK/LZVJ7UR1xvthgz
	 4hGPWVNoe24zevDXVli9waFqK/cHQJ51FH+d5mTtoyIRHnvy9crC/Ej/mI4fAEdMvb
	 I5NKZFDvZEX8pBsKh/zovmaX4JF8LVDXsbxZkb+fecKHHGm7t9Qsdf7ZmEEX/d+Fwn
	 LqZCNvtKzgu+ltEBkWpPUdKS8uHkEKPnMtMSReiC3GoCcDW3sdG7AhUZalP/iAP/t6
	 FCODJsj950Glg==
Date: Thu, 7 Dec 2023 17:38:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 3/5] automation: Add the expect script with test case
 for FVP
In-Reply-To: <20231207135318.1912846-4-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312071736190.1265976@ubuntu-linux-20-04-desktop>
References: <20231207135318.1912846-1-Henry.Wang@arm.com> <20231207135318.1912846-4-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Henry Wang wrote:
> To interact with the FVP (for example entering the U-Boot shell
> and transferring the files by TFTP), we need to connect the
> corresponding port by the telnet first. Use an expect script to
> simplify the automation of the whole "interacting with FVP" stuff.
> 
> The expect script will firstly detect the IP of the host, then
> connect to the telnet port of the FVP, set the `serverip` and `ipaddr`
> for the TFTP service in the U-Boot shell, and finally boot Xen from
> U-Boot and wait for the expected results by Xen, Dom0 and DomU.

I am not an expert in "expect" but this script looks great


> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  .../expect/fvp-base-smoke-dom0-arm64.exp      | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
> 
> diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
> new file mode 100755
> index 0000000000..25d9a5f81c
> --- /dev/null
> +++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
> @@ -0,0 +1,73 @@
> +#!/usr/bin/expect
> +
> +set timeout 2000
> +
> +# Command to use to run must be given as first argument
> +# if options are required, quotes must be used:
> +# xxx.exp "cmd opt1 opt2"
> +set runcmd [lindex $argv 0]
> +
> +# Maximum number of line to be printed, this can be used to prevent runs to
> +# go forever on errors when Xen is rebooting
> +set maxline 1000
> +
> +# Configure slow parameters used with send -s
> +# This allows us to slow down console writes to prevent issues with slow
> +# emulators or targets.
> +# Format here is: {NUM TIME} which reads as wait TIME seconds each NUM of
> +# characters, here we send 1 char each 100ms
> +set send_slow {1 .1}
> +
> +proc test_boot {{maxline} {host_ip}} {
> +    expect_after {
> +        -re "(.*)\r" {
> +            if {$maxline != 0} {
> +                set maxline [expr {$maxline - 1}]
> +                if {$maxline <= 0} {
> +                    send_user "ERROR-Toomuch!\n"
> +                    exit 2
> +                }
> +            }
> +            exp_continue
> +        }
> +        timeout {send_user "ERROR-Timeout!\n"; exit 3}
> +        eof {send_user "ERROR-EOF!\n"; exit 4}
> +    }

Why do we need this "expect_after" ?


> +    # Extract the telnet port numbers from FVP output, because the telnet ports
> +    # are not guaranteed to be fixed numbers.
> +    expect -re {terminal_0: Listening for serial connection on port [0-9]+}
> +    set terminal_0 $expect_out(0,string)
> +    if {[regexp {port (\d+)} $terminal_0 match port_0]} {
> +        puts "terminal_0 port is $port_0"
> +    } else {
> +        puts "terminal_0 port not found"
> +        exit 5
> +    }
> +
> +    spawn bash -c "telnet localhost $port_0"
> +    expect -re "Hit any key to stop autoboot.*"
> +    send -s "  \r"
> +    send -s "setenv serverip $host_ip; setenv ipaddr $host_ip; tftpb 0x80200000 boot.scr; source 0x80200000\r"
> +
> +    # Initial Xen boot
> +    expect -re "\(XEN\).*Freed .* init memory."
> +
> +    # Dom0 and DomU
> +    expect -re "Domain-0.*"
> +    expect -re "BusyBox.*"
> +    expect -re "/ #.*"

This is clear, excellent


> +}
> +
> +# Get host IP
> +spawn bash -c "hostname -I | awk '{print \$1}'"
> +expect -re {(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})}

Why d{1,3}?


> +set host_ip $expect_out(0,string)
> +
> +# Start the FVP and run the test
> +spawn bash -c "$runcmd"
> +
> +test_boot 2000 "$host_ip"
> +
> +send_user "\nExecution with SUCCESS\n"

Won't this always return SUCCESS even in case of failure?


> +exit 0
> -- 
> 2.25.1
> 

