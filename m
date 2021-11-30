Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61108463E78
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 20:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235473.408470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms8Zb-0001SN-Uv; Tue, 30 Nov 2021 19:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235473.408470; Tue, 30 Nov 2021 19:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms8Zb-0001QA-Qs; Tue, 30 Nov 2021 19:13:51 +0000
Received: by outflank-mailman (input) for mailman id 235473;
 Tue, 30 Nov 2021 19:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSNa=QR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1ms8Za-0001Q4-Ax
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 19:13:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d72015-5211-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 20:13:47 +0100 (CET)
Received: from DM6PR18CA0006.namprd18.prod.outlook.com (2603:10b6:5:15b::19)
 by SJ0PR02MB8750.namprd02.prod.outlook.com (2603:10b6:a03:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 19:13:44 +0000
Received: from DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::99) by DM6PR18CA0006.outlook.office365.com
 (2603:10b6:5:15b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 19:13:44 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT026.mail.protection.outlook.com (10.13.5.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 19:13:44 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 19:13:42 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 30 Nov 2021 19:13:42 +0000
Received: from [10.71.116.21] (port=51026)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1ms8ZR-00024M-Nq; Tue, 30 Nov 2021 19:13:42 +0000
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
X-Inumbo-ID: a4d72015-5211-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKy84x67c0IFikAJ0tQPPYYma+SB6LTvs4YZLyE7Ur5KvaK4vctDetQken7jWTHMNQWwHU9IVIepo2guTsG9n6owmbzFALtAvxMa9wYlcoidSmWgrZE8XdxRyVk8MZAe4UVdapOfICaHmhoxx4/nzxBIKSU5/ldOINl+40uCfwyOxeeI2hmBNr2jo3xLptikafHkeZiHouYP2NdiimOtpMFmp8PXIkBx6XiI1di5JAMBsbg4IC/sh3XDOPQRgLoUJdzOefIGT3Z5LzZ9dsHYqv6qawUwRaqYndkEYWRSzZkgQNVtrU1M3FwGhyKInGHHEXNcrvRPbkmetPn/2le56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH414CXM64+XNKfxjz8iAVL9Lg5FOZ3kr8lKQMPQGdQ=;
 b=cIf64Zw5hwsq5ZOaXtZEAw48Hmddmpgmaaq/5EqZIxf4598SfYOjSXqDz/MuGsfaHXlFwfDc6pkyHrXkJjo5xON2dWwAmc53D5eZp/wYl/NTbO4KUXQ20qMCLDh8AQXmmervgaa2/K0WkP/r+mK8JQRRdIpV/lZeBg+FCwuOSRleoWZX86LFh/MFJxSNWZL8vDKhHmqJE1Nw+aKLKiEz59c2MTTy05nAHFXHGDWt8RXrqt0mpWPg2iYNcXPg4dp84Q1LFcVeQ+bxWeu+0muV6yVxnM+WasMvg5vNtCkjPStWw0zDHwjT8R8hVVe8RQG8oxywEGB7f1Uo9sa8UEDHnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=arm.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH414CXM64+XNKfxjz8iAVL9Lg5FOZ3kr8lKQMPQGdQ=;
 b=LTYsVgwwzH2JqnrU7olUioFC1eQxurMopIUAAInbxtzCaUW/nrlq3tFjeieVrrYNjWIkfjJljzPOVAuwhORqYx77g7K20tR7ooiTWzLminjCmuUOCcK41fSTtZh35A2jRsqbzlkwT3+c9uKwRmfnoH5kCd4pegMWJwZTvfGpTjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
Date: Tue, 30 Nov 2021 19:13:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
To: Andre Przywara <andre.przywara@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
	<bertrand.marquis@arm.com>, <jbeulich@suse.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c909f4-4c02-4234-108c-08d9b4358720
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8750:
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB875042B4B887D791AB5A66A3B2679@SJ0PR02MB8750.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QzVjkKesilO3nJBSiD8wKACSmrTAcGrFzg94sDopC/gSe+c+W9fMGYt6k8izmkTbWfQDS/6ES4VjEi7FLbqYve7eG+NxGkGlmr3pUUEng+ltPLXElUQTA/P583X+FLxfhlyhXzQnnAE07rrmZTrW9RgVnHEGjreKBN09+x+iAxpNdGHfqnHntf4l4rxTF/+wScFvZuklM/Hyx4QRuR8sc21XLjOGRT0P4h1IROZ4htjD107n8xlz60eW9NTyiZ8skPYzwo8kYtK5vJ2E6nqOwHyw4+90ZSB4IitUovOhmLdyd7vFRnKLWDbkVf+b5EwTjlCJ3eJzwoMg4Xj6lLGOe7rMH520QZEHxk+vhHiQmKXe0a6HAc/C+mMjEUatxCA2A1RNFEUi0f1sUSd7m41WAsNM9A1ijj6sT0IhRMvBf8Owj0io5d1q5XdP8sHIiph+nR6HEzI4JmN8HrdhFmUby3J4tvUuVSBMF/mygQWTdpW4vTcYZrIKlX0MybQU9lW0hLoPntOEB18Z2FJou0y6JNpKbJKk16f6Rz3uOQ81STvbuRqb9gztamJbnU949WMsjbe4ewGPNc/pcTcnO20gJZ0DkhjLRmbkhCYSmwgb0nHNfYn8AHhVTy6K/poZ6Xlw7QnmYf/4VRX+ylKtywaikvbLGopqaNelEnq/j1dB+DuyJEQmo9UH1kzZ65TjdjRXXm2iNGqPb5J10v2j11VCWf9+HmZNomOCPFvDjgGwVQej5WcdhD+ZiJOgbKl+XQSlfrWlvrIYY+ACgtVGQ7qxAw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(336012)(2906002)(54906003)(316002)(26005)(7636003)(8936002)(30864003)(508600001)(36860700001)(82310400004)(110136005)(9786002)(53546011)(36756003)(70586007)(31696002)(8676002)(31686004)(47076005)(5660300002)(186003)(4326008)(356005)(2616005)(70206006)(83380400001)(426003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 19:13:44.0658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c909f4-4c02-4234-108c-08d9b4358720
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8750

Hi Andre,

Thanks for your comments. They are useful.

On 30/11/2021 09:49, Andre Przywara wrote:
> On Mon, 29 Nov 2021 19:16:38 +0000
> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> 
> Hi,
> 
>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>> could use to access MMIO regions.
>>
>> For instance, Xilinx baremetal OS will use:
>>
>>          volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>          *LocalAddr = Value;
>>
>> This leave the compiler to decide which store instructions to use.
> 
> As mentioned in the other email, this is wrong, if this points to MMIO:
> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
> an MMIO area, you should not see traps that you cannot handle already.
> 
> So I don't think it's a good idea to use that as an example. And since
> this patch only seems to address this use case, I would doubt its
> usefulness in general.
Yes, I should have fixed the comment.

Currently, I am testing with baremetal app which uses inline assembly 
code with post indexing instructions, to access the MMIO.

ATM, I am testing with 32 bit MMIO only.

On the usefulness, I am kind of torn as it is legitimate for post 
indexing instructions to be used in an inline-assembly code for 
accessing MMIO. However, that may not be something commonly seen.

@Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can 
you comment if we should have decoding logic or not ?

> 
>> This
>> may be a post-index store instruction where the HW will not provide a
>> valid syndrome.
>>
>> In order to handle post-indexing store/load instructions, Xen will need
>> to fetch and decode the instruction.
>>
>> This patch only cover post-index store/load instructions from AArch64
>> mode. For now, this is left unimplemented for trap from AArch32 mode.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>> ---
>>
>> Changelog :-
>>
>> v2 :- 1. Updated the rn register after reading from it. (Pointed by
>> Julien, Stefano)
>> 2. Used a union to represent the instruction opcode (Suggestd by
>> Bertrand) 3. Fixed coding style issues (Pointed by Julien)
>> 4. In the previous patch, I was updating dabt->sign based on the
>> signedness of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI
>> 0487G.b, Page 3221, SSE indicates the signedness of the data item
>> loaded. In our case, the data item loaded is always unsigned.
>>
>> This has been tested for the following cases :-
>> ldr x2, [x1], #4
> 
> As Jan already mentioned: this is a bad example. First, this is a 64-bit
> access, which you don't emulate below. And second, you want to keep the
> pointer aligned. Unaligned accesses to device memory always trap, as per
> the architecture, even on bare metal.
> 
>>
>> ldr w2, [x1], #-4
>>
>> str x2, [x1], #4
> 
> Same as above.
> 
>> str w2, [x1], #-4
>>
>> The reason being  I am testing on 32bit MMIO registers only. I don't see
>> a 8bit or 16bit MMIO register.
> 
> Where did you look? There are plenty of examples out there, even the GIC
> allows 8-bit accesses to certain registers (grep for "VGIC_ACCESS_"), and
> the Linux GIC driver is using them (but with proper accessors, of course).
> Also GICv3 supports 64-bit accesses to some registers. Some PL011 UARTs use
> 16-bit MMIO accesses.
Yes, sorry I see them now. GICD_IPRIORITYR can be accessed with 8 bits.
Unfortunately, I have GIC-v2 on my hardware system. So, probably I can't 
test 64 bit access.

> 
>>   xen/arch/arm/decode.c     | 68 ++++++++++++++++++++++++++++++++++++++-
>>   xen/arch/arm/decode.h     |  3 +-
>>   xen/arch/arm/io.c         | 40 +++++++++++++++++++----
>>   xen/include/asm-arm/hsr.h | 26 +++++++++++++++
>>   4 files changed, 129 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 792c2e92a7..0b3e8fcbc6 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -84,6 +84,66 @@ bad_thumb2:
>>       return 1;
>>   }
>>   
>> +static int decode_32bit_loadstore_postindexing(register_t pc,
>> +                                               struct hsr_dabt *dabt,
>> +                                               union ldr_str_instr_class *instr)
>> +{
>> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
>> +        return -EFAULT;
>> +
>> +    /* First, let's check for the fixed values */
>> +    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
>> +         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
>> +    {
>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
>> +            " ldr/str post indexing\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    if ( instr->code.size != 2 )
> 
> I don't see a good reason for this limitation. If you are going to dissect
> the instruction, why not just support at least all access widths, so
> 64-bits, but also {ldr,str}{b,w}? I think the framework does the heavy
> lifting for you already?

I see your point. My intention was to test first with the restricted 
instruction set (ie ldr/str - 32 bit access with post indexing only) and 
get an opinion from the community. If the patch looks sane, then this 
can be extended with other variants as well.

> Same for the restriction to post-index above, supporting pre-index as well
> should be easy.
For Pre-indexing instruction, the ISS is valid. So I am not sure what is 
to be done here?

AFAIU, if the ISS is valid, there is no need to explicitly decode the 
instructions.
> 
> To me this has the bitter taste for being a one trick pony to work around
> your particular (broken!) use case.
> 
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "ldr/str post indexing is supported for 32 bit variant only\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    if ( instr->code.v != 0 )
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "ldr/str post indexing for vector types are not supported\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    /* Check for STR (immediate) - 32 bit variant */
>> +    if ( instr->code.opc == 0 )
>> +    {
>> +        dabt->write = 1;
>> +    }
>> +    /* Check for LDR (immediate) - 32 bit variant */
>> +    else if ( instr->code.opc == 1 )
>> +    {
>> +        dabt->write = 0;
>> +    }
>> +    else
>> +    {
>> +        gprintk(XENLOG_ERR,
>> +            "Decoding ldr/str post indexing is not supported for this variant\n");
>> +        goto bad_32bit_loadstore;
>> +    }
>> +
>> +    gprintk(XENLOG_INFO,
>> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
>> +        instr->code.rt, instr->code.size, instr->code.imm9);
>> +
>> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
>> +    dabt->valid = 1;
>> +
>> +    return 0;
>> +bad_32bit_loadstore:
>> +    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr->value);
>> +    return 1;
>> +}
>> +
>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>   {
>>       uint16_t instr;
>> @@ -150,11 +210,17 @@ bad_thumb:
>>       return 1;
>>   }
>>   
>> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt,
>> +                       union ldr_str_instr_class *instr)
>>   {
>>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>           return decode_thumb(regs->pc, dabt);
>>   
>> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
>> +    {
>> +        return decode_32bit_loadstore_postindexing(regs->pc, dabt, instr);
>> +    }
>> +
>>       /* TODO: Handle ARM instruction */
>>       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>   
>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>> index 4613763bdb..d82fc4a0f6 100644
>> --- a/xen/arch/arm/decode.h
>> +++ b/xen/arch/arm/decode.h
>> @@ -35,7 +35,8 @@
>>    */
>>   
>>   int decode_instruction(const struct cpu_user_regs *regs,
>> -                       struct hsr_dabt *dabt);
>> +                       struct hsr_dabt *dabt,
>> +                       union ldr_str_instr_class *instr);
>>   
>>   #endif /* __ARCH_ARM_DECODE_H_ */
>>   
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index 729287e37c..0d60754bc4 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -65,6 +65,16 @@ static enum io_state handle_write(const struct
>> mmio_handler *handler, return ret ? IO_HANDLED : IO_ABORT;
>>   }
>>   
>> +static void post_incremenet_register(union ldr_str_instr_class *instr)
>> +{
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    unsigned int val;
>> +
>> +    val = get_user_reg(regs, instr->code.rn);
>> +    val += instr->code.imm9;
>> +    set_user_reg(regs, instr->code.rn, val);
>> +}
>> +
>>   /* This function assumes that mmio regions are not overlapped */
>>   static int cmp_mmio_handler(const void *key, const void *elem)
>>   {
>> @@ -106,14 +116,26 @@ enum io_state try_handle_mmio(struct cpu_user_regs
>> *regs, .gpa = gpa,
>>           .dabt = dabt
>>       };
>> +    int rc;
>> +    union ldr_str_instr_class instr = {0};
>>   
>>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>   
>> +    /*
>> +     * Armv8 processor does not provide a valid syndrome for post-indexing
>> +     * ldr/str instructions. So in order to process these instructions,
>> +     * Xen must decode them.
>> +     */
>> +    if ( !info.dabt.valid )
>> +    {
>> +        rc = decode_instruction(regs, &info.dabt, &instr);
>> +        if ( rc )
>> +            return IO_ABORT;
>> +    }
>> +
>>       handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>>       {
>> -        int rc;
>> -
>>           rc = try_fwd_ioserv(regs, v, &info);
>>           if ( rc == IO_HANDLED )
>>               return handle_ioserv(regs, v);
>> @@ -122,7 +144,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs
>> *regs, }
>>   
>>       /* All the instructions used on emulated MMIO region should be
>> valid */
>> -    if ( !dabt.valid )
>> +    if ( !info.dabt.valid )
>>           return IO_ABORT;
>>   
>>       /*
>> @@ -134,7 +156,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs
>> *regs, {
>>           int rc;
>>   
>> -        rc = decode_instruction(regs, &info.dabt);
>> +        rc = decode_instruction(regs, &info.dabt, NULL);
>>           if ( rc )
>>           {
>>               gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
>> @@ -143,9 +165,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs
>> *regs, }
>>   
>>       if ( info.dabt.write )
>> -        return handle_write(handler, v, &info);
>> +        rc = handle_write(handler, v, &info);
>>       else
>> -        return handle_read(handler, v, &info);
>> +        rc = handle_read(handler, v, &info);
>> +
>> +    if ( instr.value != 0 )
>> +    {
>> +        post_incremenet_register(&instr);
>> +    }
>> +    return rc;
>>   }
>>   
>>   void register_mmio_handler(struct domain *d,
>> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
>> index 9b91b28c48..72d67d2801 100644
>> --- a/xen/include/asm-arm/hsr.h
>> +++ b/xen/include/asm-arm/hsr.h
>> @@ -15,6 +15,32 @@ enum dabt_size {
>>       DABT_DOUBLE_WORD = 3,
>>   };
>>   
>> +/*
>> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>> + * Page 318 specifies the following bit pattern for
>> + * "load/store register (immediate post-indexed)".
>> + *
>> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
>> + * ___________________________________________________________________
>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>> + * |____|______|__|____|____|__|_______________|____|_________|_______|
>> + */
>> +union ldr_str_instr_class {
>> +    uint32_t value;
>> +    struct ldr_str {
>> +        unsigned int rt:5;     /* Rt register */
> 
> I don't think it's a particular good idea to use a bit-field here, if that
> is expected to mimic a certain hardware provided bit pattern.
> It works in practise (TM), but the C standard does not guarantee the order
> the bits are allocated (ISO/IEC 9899:201x §6.7.2.1, stanza 11).
> Since you are *reading* only from the instruction word, you should get away
> with accessor macros to extract the bits you need. For instance for
> filtering the opcode, you could use: ((insn & 0x3fe00c00) == 0x38400400)

Yes, this is a very good point. I will use bitmasks to access the bits 
from the register.

I saw the same logic (ie using bitfields) is used for some other 
registers as well. For eg hsr_dabt, hsr_iabt in 
xen/include/asm-arm/hsr.h. May be that needs fixing as well for some 
other time. :)

- Ayan
> 
> Cheers,
> Andre
> 
>> +        unsigned int rn:5;     /* Rn register */
>> +        unsigned int fixed1:2; /* value == 01b */
>> +        int imm9:9;            /* imm9 */
>> +        unsigned int fixed2:1; /* value == 0b */
>> +        unsigned int opc:2;    /* opc */
>> +        unsigned int fixed3:2; /* value == 00b */
>> +        unsigned int v:1;      /* vector */
>> +        unsigned int fixed4:3; /* value == 111b */
>> +        unsigned int size:2;   /* size */
>> +    } code;
>> +};
>> +
>>   union hsr {
>>       register_t bits;
>>       struct {
> 

