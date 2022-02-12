Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2924B38AE
	for <lists+xen-devel@lfdr.de>; Sun, 13 Feb 2022 00:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270873.465209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJ1uk-0001WX-EQ; Sat, 12 Feb 2022 23:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270873.465209; Sat, 12 Feb 2022 23:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJ1uk-0001UA-BQ; Sat, 12 Feb 2022 23:34:50 +0000
Received: by outflank-mailman (input) for mailman id 270873;
 Sat, 12 Feb 2022 23:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0Ww=S3=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nJ1uj-0001U4-E4
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 23:34:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cef5486-8c5c-11ec-8eb8-a37418f5ba1a;
 Sun, 13 Feb 2022 00:34:46 +0100 (CET)
Received: from BN9PR03CA0878.namprd03.prod.outlook.com (2603:10b6:408:13c::13)
 by SJ0PR02MB8612.namprd02.prod.outlook.com (2603:10b6:a03:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Sat, 12 Feb
 2022 23:34:43 +0000
Received: from BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::22) by BN9PR03CA0878.outlook.office365.com
 (2603:10b6:408:13c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Sat, 12 Feb 2022 23:34:43 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT017.mail.protection.outlook.com (10.13.2.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sat, 12 Feb 2022 23:34:42 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 12 Feb 2022 23:34:41 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 12 Feb 2022 23:34:41 +0000
Received: from [10.108.8.223] (port=57002 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nJ1ua-0006SM-Bw; Sat, 12 Feb 2022 23:34:40 +0000
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
X-Inumbo-ID: 5cef5486-8c5c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkmLCrExvWYhBu+BALRYlojc8Wb5xC1MbS3pPB2f58tkOLEVQx0qd7OfBl2CcGT2AaT57iD+8gvSOc0xrB6a/Py0UHiljQToKa4mtGH/LKjeyJLhHsnuo3XS0UlfFDpPHcyv6fja/XaqDT4Y6FSd28c2DhpLgD9s0Z5Tgp1TTBZNIuZ2oxXH7GasK+NXAu2hKlG7DPBcid9kpx+dtHz5MgGR9H7L+K9wjQF7mCgG+m32URWPuc7LQclxbogkz9aZ5wQNqWtRQngqXmlH2Lure0S93CzKDF7p3+E8/jyaVCa/axYkuD4V6iYPgHQO/mE+Xq16E8G8H21mraCvRflhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xysOWxW0K4OJpfN/VdY+O8CJSYB9Lqyw/B18QsvDyeM=;
 b=kTVesOkgk8iBIK5Y/HzMDXNbZpWu0tJtHkWI8hCKSl/ogzpCvY67vkgQUsTob/ltmga1wrzG2dBt1fkGNH3Bz1b6LKOmXREWvSnyhdfCiPvIRMIuyden/Ivh7iun6nfvTbTq2KQFmXuJB4hMv7r9FdGUagmLB4kQLsUyeV9JeVVVQ8rjERXWxCQQ4PsxLAnMWNVcFsOe/SQoUU5xpfg1Ou0duS/cEJS6FShz6eyCpG95KisCk3oUL6ngEKhwyLudQvvCUsFSf/s0qLi2i249lIUWU4DOuuah+Q5TiC5MjssIQ0Pr36h6NvL2Jv5V7O5M0Q6umiV7kfPGadX1D9TK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xysOWxW0K4OJpfN/VdY+O8CJSYB9Lqyw/B18QsvDyeM=;
 b=INsI0d2utKqNt9NO0qg4GM3pvsJvlMQtAOlWblaWI4GXZ/UhmaL83fVGxSAxzEUqQTKUg67sHIQBFIJC24NL/+nclLQupq66aHbd86sRJCmpKE6F/wvf+Wc73fgwA6GqN4o6DkIm9WVenx/5rZS0ABbgg7oYk7lsvc4GkVQDQd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v8 0/2] xen/arm64: io: Decode ldr/str post-indexing instruction
Date: Sat, 12 Feb 2022 23:34:31 +0000
Message-ID: <20220212233433.46018-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d5bb0f7-e738-437b-609d-08d9ee803ee9
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8612:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB861267E369195A0181539BC0B2319@SJ0PR02MB8612.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HoSw3dAL0dja0y7LhdqV0cDF6oXjOd77SJxn7MS02HmgdfvdyVNbuQBQcp5su8MJ01bEO9iVO9YQoWNDlQU/dDcxuKQjaBqhobSJ3g6xGb+OBEWg5Jby4RqFGLzKRQPjKx7udXLASUW+mdWQ3XTzpnJ9+V2Xzq0wWJijbXzglAHB8+wucy9A4lTVmEoO/d5CJqety+vWkmOypLBxuXDLuCcH/L2SraXXQpS6OSUq1CRW87PuMu7iVt9m09dw4JPhWINLGhHUfnSTuB0uzPMUhbUEndl3kBDcWhoUmL+Dl0a6OniGzF/yL8YY5cK8qgao2e4rC5np0jn2KJ/y82NqVdTPXOIJsIeyXDKWwcGZiRI/krNWxu5z2/WgJ7fT/RCNq4I9IwIibq2342EqbbkOAmgK+gJbL/OzGjU+40l5NXfECs+gMal/YIPQeASOLLDLsiaQJX6vWIgdThfIvjwxuOH4V/u88OVL8g8O4jni8bpbpTlKSXMLCNU2UyDT8K5HfHC/GxhjyaN1H1E1nsedkXF5fVK1rfWJXj8ihHpe8uYZ3ZzdjDHWmQlLUnBNIsH8xxRynWbC3UON1UAtYnoQDYpu4+o2+GtXv45ozR7H9GQBk8918cebVouBax4RSG38v5/RYYnGS8kTVXvIFiKJbJc8g+zJT2Fmp2fgvFxAARVEHD6qSeK31lesRKxQXNDa3Gbq4amdJTqmcM+jfbSF2Q==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(6666004)(47076005)(356005)(336012)(426003)(9786002)(7636003)(7696005)(508600001)(1076003)(2616005)(6916009)(8676002)(4326008)(26005)(5660300002)(70586007)(82310400004)(70206006)(54906003)(316002)(186003)(8936002)(36860700001)(107886003)(2906002)(36756003)(83380400001)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2022 23:34:42.6780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5bb0f7-e738-437b-609d-08d9ee803ee9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8612

Hi All,

The patch series introduces support to decode instructions by Xen when ISS is
invalid. Currently, when the guest executes post indexing ldr/str instructions
on emulated MMIO, these instructions are trapped into Xen as a data abort.
Xen reads hsr_dabt.isv == 0, so ISS is invalid. Therefore, it reads the faulting
instruction's opcode from guest's PC. It decodes and executes the instruction on
the emulated region.

Ayan Kumar Halder (2):
  xen/arm64: Decode ldr/str post increment operations
  xen/arm64: io: Support instructions (for which ISS is not valid) on
    emulated MMIO region using MMIO/ioreq handler

 xen/arch/arm/arm32/traps.c        |  7 +++
 xen/arch/arm/arm64/traps.c        | 47 +++++++++++++++
 xen/arch/arm/decode.c             | 80 ++++++++++++++++++++++++-
 xen/arch/arm/decode.h             | 48 +++++++++++++--
 xen/arch/arm/include/asm/domain.h |  4 ++
 xen/arch/arm/include/asm/mmio.h   | 19 +++++-
 xen/arch/arm/include/asm/traps.h  |  2 +
 xen/arch/arm/io.c                 | 98 ++++++++++++++++++++-----------
 xen/arch/arm/ioreq.c              |  7 ++-
 xen/arch/arm/traps.c              | 80 +++++++++++++++++++++----
 xen/arch/x86/include/asm/ioreq.h  |  3 +
 xen/include/xen/sched.h           |  2 +
 12 files changed, 340 insertions(+), 57 deletions(-)

Changelog :-
v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
        Stefano)
     2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
     3. Fixed coding style issues (Pointed by Julien)
     4. In the previous patch, I was updating dabt->sign based on the signedness
        of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
        Page 3221, SSE indicates the signedness of the data item loaded. In our
        case, the data item loaded is always unsigned.

v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
       Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
       Andre)
    2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
    3. Added restriction for "rt != rn" (Suggested by Andre)
    4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
       by io.c and decode.c (where the union is referred). (Suggested by Jan)
    5. Indentation and typo fixes (Suggested by Jan)

v4- 1. Fixed the patch as per Stefano's comments on v3. They are as follows :-
        1.1 Use macros to determine the fixed values in the instruction opcode
        1.2 Checked if instr != NULL
        1.3 Changed some data types and added #define ARM_64 for AArch64 specific
            code
        1.4 Moved post_increment_register() to decode.c so that the decoding
            logic is confined to a single file.
        1.5 Moved some checks from post_increment_register() to
            decode_loadstore_postindexing()
        1.6 Removed a duplicate check
    2. Updated the commit message as per Andre's comments.
    3. Changed the names of a label and some comments. *32bit* was erroneously
       mentioned in a label and comments in decode_loadstore_postindexing()
       although the function handled all variants of ldr/str post indexing.

v5- 1. Renamed decode_loadstore_postindexing() to decode_arm64(). The reason
       being this will be extended in future to support more instructions for
       which hsr_badt.isv = 0
    2. Introduce a function try_decode_instruction_invalid_iss() to determine
       if the instruction needs to be decoded before invoking decode_instruction().

       It checks :-
       2.1  dabt->s1ptw - Returns IO_UNHANDLED
       2.2  dabt->cache - Returns IO_IGNORED. (new enum instroduced to let the
            caller know that the instruction needs to be ignored by Xen. Thus
            the caller needs to increment the PC and return to the guest.

    3. Invoked try_decode_instruction_invalid_iss() from the following 2 places :-
        3.a - try_handle_mmio() - When we have determined that there is a valid
              mmio handler.
        3.b - try_fwd_ioserv()
        When ioserver completes the io request, the acknowledgement is sent via
        handle_ioserv(). Here, we need to increment the register. As there is no
        common data shared between try_fwd_ioserv() and handle_ioserv(), we need
        to decode the instruction again in handle_ioserv() to determine rn, imm9.

        (NOTE to Reviewers) - This does not feel correct. However, I could not
        think of a better approach. Please provide your inputs.

    4. Augumented struct hsr_dabt{} with struct hsr_dabt_instr_details{} to hold
       rn and imm9. This is passed to post_increment_register() to update rn.
    5. Other style changes as suggested in v4.

v6 - 1. Split the patch into three parts.

v7 - 1. Merged patch2 and patch3 into a single patch.

v8 - 1. Changes mentioned in the individual patches.

-- 
2.17.1


