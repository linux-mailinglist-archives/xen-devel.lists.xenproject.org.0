Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D303A22E5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 19:58:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3OdZ-0003C5-JO; Thu, 29 Aug 2019 17:55:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sCI=WZ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i3OdY-0003Bu-56
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 17:55:08 +0000
X-Inumbo-ID: 200852c7-ca86-11e9-ae72-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 200852c7-ca86-11e9-ae72-12813bfff9fa;
 Thu, 29 Aug 2019 17:55:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7THnKT0151799;
 Thu, 29 Aug 2019 17:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2019-08-05;
 bh=ahPXOIrwST7I1gE9vEb4FyS8dQoO0yxNK6e1NAtMyRw=;
 b=GS6BTPkjK5oG3mNuWmWXawk4sJTLavV/D0qx9njLF9sXycUaV6nyyXd4x3Qpyjtrnx0P
 RSHCCVprjac9rLtj5j+bkOUnZp4Qk4So17B73aUlVqA8n+kNcVwGLqHw56gCqDsSrMLl
 qrdAutH73vuXLt4dmTH2G8xYnIRgIMhGeOaQbAk83tXU1KHANKhUhR6OF1paOD1Q2zOS
 Cq/Rx24V6rpGTvakSyqwpwFxQ8pUjcntn8+b16vHRJH3P5RLYAW4hNTfl/dCMTnmRYge
 tMz1Alo3dvqORYa58XiAy6MKAu6JqZcn8s02pCd+WKRlZ4Im/PgyDm0RHNSGAUK9BgES 0A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2upkdd81kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 17:54:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7THmeeL124670;
 Thu, 29 Aug 2019 17:54:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2uphau4xr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 17:54:46 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7THsiGN030988;
 Thu, 29 Aug 2019 17:54:44 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 10:54:43 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 5D4726A013F; Thu, 29 Aug 2019 13:49:12 -0400 (EDT)
Date: Thu, 29 Aug 2019 13:49:12 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Message-ID: <20190829174912.GA22880@char.us.oracle.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-9-wipawel@amazon.de>
 <20190829155851.GA44799@konrads-mbp.lan>
 <A452587B-AE71-4848-81FD-8D3D2BCE4CEF@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <A452587B-AE71-4848-81FD-8D3D2BCE4CEF@amazon.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290187
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290187
Subject: Re: [Xen-devel] [PATCH v2 08/12] livepatch: Add support for inline
 asm hotpatching expectations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 04:16:13PM +0000, Wieczorkiewicz, Pawel wrote:
>=20
>=20
> On 29. Aug 2019, at 17:58, Konrad Rzeszutek Wilk <konrad.wilk@oracle.co=
m<mailto:konrad.wilk@oracle.com>> wrote:
>=20
> +CODE_GET_EXPECT=3D$(shell objdump -d --insn-width=3D1 $(1) | grep -A6 =
-E '<'$(2)'>:' | tail -n +2 | awk 'BEGIN {printf "{"} {printf "0x%s,", $$=
2}' | sed 's/,$$/}/g')
>=20
> Ony my Hikey 960 when I compile using an native compiler I get:
>=20
> gcc  -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-protot=
ypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unus=
ed-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -f=
no-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XE=
N__ -include /home/xen.git/xen/include/xen/config.h '-D__OBJECT_FILE__=3D=
"xen_expectations.o"' -Wa,--strip-local-absolute -g -MMD -MF ./.xen_expec=
tations.o.d -mcpu=3Dgeneric -mgeneral-regs-only   -I/home/xen.git/xen/inc=
lude -fno-stack-protector -fno-exceptions -Wnested-externs -DGCC_HAS_VISI=
BILITY_ATTRIBUTE  -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall -Wst=
rict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variabl=
e -Wno-unused-local-typedefs   -c xen_expectations.c -o xen_expectations.=
o
> /home/xen.git/xen/Rules.mk:202: recipe for target 'xen_expectations.o' =
failed
> make[3]: Circular expect_config.h <- xen_expectations.o dependency drop=
ped.
> In file included from xen_expectations.c:6:0:
> expect_config.h:1:23: error: large integer implicitly truncated to unsi=
gned type
> [-Werror=3Doverflow]
> #define EXPECT_BYTES {0xf0000260,0x00f00002,0xe000f000,0x12e000f0,0x911=
2e000,0x
> c09112e0}
>                       ^
> xen_expectations.c:28:17: note: in expansion of macro =E2=80=98EXPECT_B=
YTES=E2=80=99
>         .data =3D EXPECT_BYTES
>                 ^~~~~~~~~~~~
> expect_config.h:1:34: error: large integer implicitly truncated to unsi=
gned type
> [-Werror=3Doverflow]
> #define EXPECT_BYTES {0xf0000260,0x00f00002,0xe000f000,0x12e000f0,0x911=
2e000,0x
> c09112e0}
>                                  ^
> xen_expectations.c:28:17: note: in expansion of macro =E2=80=98EXPECT_B=
YTES=E2=80=99
>         .data =3D EXPECT_BYTES
>                 ^~~~~~~~~~~~
> expect_config.h:1:45: error: large integer implicitly truncated to unsi=
gned type
> [-Werror=3Doverflow]
> #define EXPECT_BYTES {0xf0000260,0x00f00002,0xe000f000,0x12e000f0,0x911=
2e000,0x
> c09112e0}
> =E2=80=A6
>=20
> make[3]: Leaving directory '/home/xen.git/xen/test/livepatch'
> Makefile:11: recipe for target 'build' failed
> make[2]: Leaving directory '/home/xen.git/xen/test'
> Makefile:85: recipe for target '_tests' failed
> make[1]: Leaving directory '/home/xen.git/xen'
> Makefile:45: recipe for target 'tests' failed
> root@hikey960:/home/xen.git/xen# cat test/livepatch/expect_config.h
> #define EXPECT_BYTES {0xf0000260,0x00f00002,0xe000f000,0x12e000f0,0x911=
2e000,0xc09112e0}
> #define EXPECT_BYTES_COUNT 6
>=20
>=20
>=20
> Could you please try with the patch attached?

It compiled, but the test-case was not happy. See attached the full seria=
l log

>=20
>=20
>=20
>=20
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
>=20
>=20


>=20
> If it still fails, could you please send me the output for the followin=
g
> command with this build?
>=20
> objdump -d xen-syms | sed -n -e '/<xen_extra_version>:$/,/^$/ p' | tail=
 -n +2

Also included in the serial log.

>=20
> Best Regards,
> Pawel Wieczorkiewicz
>=20
>=20
>=20


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="livepatch-hikey960.txt"
Content-Transfer-Encoding: quoted-printable

Loading driver at 0x000B87C8000 EntryPoint=3D0x000B8870370=20
Using modules provided by bootloader in FDT
Xen 4.13-unstable (c/s Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty)=
 EFI=20
loader
 Xen 4.13-unstable
(XEN) Xen version 4.13-unstable (root@lan) (gcc (Debian 6.3.0-18+deb9u1) 6.=
3.0 20170516) debug=3Dy  Thu Aug 29 17:26:25 UTC 2019
(XEN) Latest ChangeSet: Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
(XEN) build-id: 416315091386424648bd584d25c7224ee5b5d998
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v1.0
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 1920 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=3D00000000e82b1000
(XEN)         gic_cpu_addr=3D00000000e82b2000
(XEN)         gic_hyp_addr=3D00000000e82b4000
(XEN)         gic_vcpu_addr=3D00000000e82b6000
(XEN)         gic_maintenance_irq=3D25
(XEN) Using the new VGIC implementation.
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Allocated console ring of 64 KiB.
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain
(XEN) Bringing up CPU1
(XEN) Adding cpu 1 to runqueue 0
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
(XEN) Adding cpu 2 to runqueue 0
(XEN) CPU2: Guest atomics will try 20 times before pausing the domain
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
(XEN) Adding cpu 3 to runqueue 0
(XEN) CPU3: Guest atomics will try 20 times before pausing the domain
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
(XEN) Adding cpu 4 to runqueue 0
(XEN) CPU4: Guest atomics will try 8 times before pausing the domain
(XEN) CPU 4 booted.
(XEN) Bringing up CPU5
(XEN) Adding cpu 5 to runqueue 0
(XEN) CPU5: Guest atomics will try 18 times before pausing the domain
(XEN) CPU 5 booted.
(XEN) Bringing up CPU6
(XEN) Adding cpu 6 to runqueue 0
(XEN) CPU6: Guest atomics will try 15 times before pausing the domain
(XEN) CPU 6 booted.
(XEN) Bringing up CPU7
(XEN) Adding cpu 7 to runqueue 0
(XEN) CPU7: Guest atomics will try 18 times before pausing the domain
(XEN) CPU 7 booted.
(XEN) Brought up 8 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) alternatives: Patching with alt table 00000000002b3e00 -> 00000000002=
b4424
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 00000000b88f1000
(XEN) Allocating 1:1 mappings totalling 1500MB for dom0:
(XEN) BANK[0] 0x00000008000000-0x00000018000000 (256MB)
(XEN) BANK[1] 0x00000020000000-0x00000030000000 (256MB)
(XEN) BANK[2] 0x00000040000000-0x00000058000000 (384MB)
(XEN) BANK[3] 0x00000090000000-0x000000b4000000 (576MB)
(XEN) BANK[4] 0x000000ba800000-0x000000bc000000 (24MB)
(XEN) BANK[5] 0x000000bf800000-0x000000bfc00000 (4MB)
(XEN) Grant table range: 0x000000b87c8000-0x000000b8808000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 00000000b88f1000 to 0000000008080000-000000000903=
ca00
(XEN) Loading dom0 DTB to 0x0000000010000000-0x00000000100082a1
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: HMP COMPUTING HAS BEEN ENABLED.
(XEN) It has implications on the security and stability of the system,
(XEN) unless the cpu affinity of all domains is specified.
(XEN) ***************************************************
(XEN) WARNING: SILO mode is not enabled.
(XEN) It has implications on the security of the system,
(XEN) unless the communications have been forbidden between
(XEN) untrusted domains.
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) 3... 2... 1...=20
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 340kB init memory.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.12.0-linaro-hikey960+ (konrad@localhost.loca=
ldomain) (gcc version 7.0.1 20170309 (Red Hat Cross 7.0.1-0.4) (GCC) ) #3 S=
MP PREEMPT Mon Jul 17 13:26:13 EDT 2017
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Machine model: HiKey960
[    0.000000] Xen 4.13 support found
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x00000000bb000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x00000000bfb=
fffff]
[    0.000000] NUMA: Adding memblock [0x8000000 - 0x17ffffff] on node 0
[    0.000000] NUMA: Adding memblock [0x20000000 - 0x2fffffff] on node 0
[    0.000000] NUMA: Adding memblock [0x32000000 - 0x320fffff] on node 0
[    0.000000] NUMA: Adding memblock [0x40000000 - 0x57ffffff] on node 0
[    0.000000] NUMA: Adding memblock [0x90000000 - 0xb3ffffff] on node 0
[    0.000000] NUMA: Adding memblock [0xba800000 - 0xbbffffff] on node 0
[    0.000000] NUMA: Adding memblock [0xbf800000 - 0xbfbfffff] on node 0
[    0.000000] NUMA: Initmem setup node 0 [mem 0x08000000-0xbfbfffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbfbc2f80-0xbfbc4a7f]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000008000000-0x00000000bfbfffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000008000000-0x0000000017ffffff]
[    0.000000]   node   0: [mem 0x0000000020000000-0x000000002fffffff]
[    0.000000]   node   0: [mem 0x0000000032000000-0x00000000320fffff]
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000057ffffff]
[    0.000000]   node   0: [mem 0x0000000090000000-0x00000000b3ffffff]
[    0.000000]   node   0: [mem 0x00000000ba800000-0x00000000bbffffff]
[    0.000000]   node   0: [mem 0x00000000bf800000-0x00000000bfbfffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x00000000bfbff=
fff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] percpu: Embedded 22 pages/cpu @ffff8000bfb0f000 s59160 r0 d3=
0952 u90112
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Tota=
l pages: 378252
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: console=3Dtty0 console=3Dhvc0 root=3D/d=
ev/sdd10 rw efi=3Dnoruntime
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Memory: 1452892K/1537024K available (10172K kernel code, 113=
8K rwdata, 3648K rodata, 1088K init, 406K bss, 67748K reserved, 16384K cma-=
reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffff000000000000 - 0xffff000008000000   (   =
128 MB)
[    0.000000]     vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000   (129=
022 GB)
[    0.000000]       .text : 0xffff000008080000 - 0xffff000008a70000   ( 10=
176 KB)
[    0.000000]     .rodata : 0xffff000008a70000 - 0xffff000008e10000   (  3=
712 KB)
[    0.000000]       .init : 0xffff000008e10000 - 0xffff000008f20000   (  1=
088 KB)
[    0.000000]       .data : 0xffff000008f20000 - 0xffff00000903ca00   (  1=
139 KB)
[    0.000000]        .bss : 0xffff00000903ca00 - 0xffff0000090a2334   (   =
407 KB)
[    0.000000]     fixed   : 0xffff7dfffe7fd000 - 0xffff7dfffec00000   (  4=
108 KB)
[    0.000000]     PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000   (   =
 16 MB)
[    0.000000]     vmemmap : 0xffff7e0000000000 - 0xffff800000000000   (  2=
048 GB maximum)
[    0.000000]               0xffff7e0000200000 - 0xffff7e0002ff0000   (   =
 45 MB actual)
[    0.000000]     memory  : 0xffff800008000000 - 0xffff8000bfc00000   (  2=
940 MB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] arch_timer: cp15 timer(s) running at 1.92MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x1c570327e, max_idle_ns: 1763180809505 ns
[    0.000004] sched_clock: 56 bits at 1920kHz, resolution 520ns, wraps eve=
ry 4398046510977ns
[    0.000091] clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 58334160866034 ns
[    0.000424] Console: colour dummy device 80x25
[    0.000945] console [tty0] enabled
[    0.430141] console [hvc0] enabled
[    0.433672] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 3.84 BogoMIPS (lpj=3D7680)
[    0.443777] pid_max: default: 32768 minimum: 301
[    0.448502] Security Framework initialized
[    0.452910] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes)
[    0.460951] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes)
[    0.468350] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.474959] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 b=
ytes)
[    0.498249] ASID allocator initialised with 65536 entries
[    0.504028] xen:grant_table: Grant tables using version 1 layout
[    0.509966] Grant table initialized
[    0.513518] xen:events: Using FIFO-based ABI
[    0.517886] Xen: initializing cpu0
[    0.534476] EFI services will not be available.
[    0.554967] smp: Bringing up secondary CPUs ...
[    0.591579] Detected VIPT I-cache on CPU1
[    0.591662] Xen: initializing cpu1
[    0.591682] CPU1: Booted secondary processor [410fd034]
[    0.623642] Detected VIPT I-cache on CPU2
[    0.623686] Xen: initializing cpu2
[    0.623701] CPU2: Booted secondary processor [410fd034]
[    0.655720] Detected VIPT I-cache on CPU3
[    0.655763] Xen: initializing cpu3
[    0.655776] CPU3: Booted secondary processor [410fd034]
[    0.687814] CPU features: enabling workaround for ARM erratum 858921
[    0.687819] Detected VIPT I-cache on CPU4
[    0.688442] arch_timer: Enabling local workaround for ARM erratum 858921
[    0.688453] arch_timer: CPU4: Trapping CNTVCT access
[    0.688455] Xen: initializing cpu4
[    0.688472] CPU4: Booted secondary processor [410fd091]
[    0.719896] Detected VIPT I-cache on CPU5
[    0.719930] arch_timer: Enabling local workaround for ARM erratum 858921
[    0.719938] arch_timer: CPU5: Trapping CNTVCT access
[    0.719940] Xen: initializing cpu5
[    0.719953] CPU5: Booted secondary processor [410fd091]
[    0.751987] Detected VIPT I-cache on CPU6
[    0.752021] arch_timer: Enabling local workaround for ARM erratum 858921
[    0.752028] arch_timer: CPU6: Trapping CNTVCT access
[    0.752030] Xen: initializing cpu6
[    0.752043] CPU6: Booted secondary processor [410fd091]
[    0.784077] Detected VIPT I-cache on CPU7
[    0.784110] arch_timer: Enabling local workaround for ARM erratum 858921
[    0.784117] arch_timer: CPU7: Trapping CNTVCT access
[    0.784119] Xen: initializing cpu7
[    0.784132] CPU7: Booted secondary processor [410fd091]
[    0.784193] smp: Brought up 1 node, 8 CPUs
[    0.931646] SMP: Total of 8 processors activated.
[    0.936412] CPU features: detected feature: 32-bit EL0 Support
[    0.943431] CPU: All CPU(s) started at EL1
[    0.947489] alternatives: patching kernel code
[    0.952658] devtmpfs: initialized
[    0.958766] OF: Duplicate name in base, renamed to "memory#1"
[    0.964939] DMI not present or invalid.
[    0.968911] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.978614] futex hash table entries: 2048 (order: 6, 262144 bytes)
[    0.985417] pinctrl core: initialized pinctrl subsystem
[    0.991927] NET: Registered protocol family 16
[    0.998299] vdso: 2 pages (1 code @ ffff000008a77000, 1 data @ ffff00000=
8f25000)
[    1.005649] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    1.020741] DMA: preallocated 256 KiB pool for atomic allocations
[    1.026844] xen:swiotlb_xen: Warning: only able to allocate 4 MB for sof=
tware IO TLB
[    1.035003] software IO TLB [mem 0xb0400000-0xb0800000] (4MB) mapped at =
[ffff8000b0400000-ffff8000b07fffff]
[    1.045001] Serial: AMBA PL011 UART driver
[    1.068164] hi3660-mbox e896b000.mailbox: Mailbox enabled
[    1.083003] uart-pl011 ffd74000.serial: could not find pctldev for node =
/soc/pinmux@e896c000/uart3_pmx_func, deferring probe
[    1.094290] uart-pl011 fdf01000.serial: could not find pctldev for node =
/soc/pinmux@e896c000/uart4_pmx_func, deferring probe
[    1.126144] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    1.133629] ACPI: Interpreter disabled.
[    1.137884] xen:balloon: Initialising balloon driver
[    1.143231] xen_balloon: Initialising balloon driver
[    1.148775] vgaarb: loaded
[    1.151585] SCSI subsystem initialized
[    1.155543] ssp-pl022 ffd68000.spi: could not find pctldev for node /soc=
/pinmux@fff11000/spi2_pmx_func, deferring probe
[    1.166275] ssp-pl022 ff3b3000.spi: could not find pctldev for node /soc=
/pinmux@ff3b6000/spi3_pmx_func, deferring probe
[    1.177268] usbcore: registered new interface driver usbfs
[    1.182711] usbcore: registered new interface driver hub
[    1.188164] usbcore: registered new device driver usb
[    1.193168] tcpc_class_init_1.1.1_G
[    1.196712] TCPC class init OK
[    1.199844] Init Richtek RegMap
[    1.203194] i2c_designware ffd71000.i2c: could not find pctldev for node=
 /soc/pinmux@fff11000/i2c0_pmx_func, deferring probe
[    1.214341] i2c_designware ffd72000.i2c: could not find pctldev for node=
 /soc/pinmux@fff11000/i2c1_pmx_func, deferring probe
[    1.225618] i2c_designware fdf0b000.i2c: could not find pctldev for node=
 /soc/pinmux@fff11000/i2c7_pmx_func, deferring probe
[    1.237265] pps_core: LinuxPPS API ver. 1 registered
[    1.242148] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    1.251351] PTP clock support registered
[    1.255440] dmi: Firmware registration failed.
[    1.260092] Advanced Linux Sound Architecture Driver Initialized.
[    1.267157] clocksource: Switched to clocksource arch_sys_counter
[    1.273352] VFS: Disk quotas dquot_6.6.0
[    1.277232] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.284299] pnp: PnP ACPI: disabled
[    1.293729] OF: /soc/thermal-zones/cls0/cooling-maps/map0: could not fin=
d phandle
[    1.301152] missing cooling_device property
[    1.305391] failed to build thermal zone cls0: -22
[    1.310340] NET: Registered protocol family 2
[    1.315025] TCP established hash table entries: 16384 (order: 5, 131072 =
bytes)
[    1.322259] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    1.329026] TCP: Hash tables configured (established 16384 bind 16384)
[    1.335578] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    1.341572] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    1.348194] NET: Registered protocol family 1
[    1.352873] RPC: Registered named UNIX socket transport module.
[    1.358704] RPC: Registered udp transport module.
[    1.363480] RPC: Registered tcp transport module.
[    1.368240] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.375629] kvm [1]: HYP mode not available
[    1.382109] audit: initializing netlink subsys (disabled)
[    1.387562] audit: type=3D2000 audit(1.084:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    1.387744] workingset: timestamp_bits=3D44 max_order=3D19 bucket_order=
=3D0
[    1.392019] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.392455] NFS: Registering the id_resolver key type
[    1.392482] Key type id_resolver registered
[    1.392483] Key type id_legacy registered
[    1.392490] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.392493] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regist=
ering...
[    1.392626] 9p: Installing v9fs 9p2000 file system support
[    1.395236] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 247)
[    1.395241] io scheduler noop registered
[    1.395337] io scheduler cfq registered (default)
[    1.395340] io scheduler mq-deadline registered
[    1.395341] io scheduler kyber registered
[    1.403061] pinctrl-single e896c000.pinmux: 124 pins at pa ffff0000094d7=
000 size 496
[    1.403139] pinctrl-single ff37e000.pinmux: 6 pins at pa ffff0000094d900=
0 size 24
[    1.403195] pinctrl-single ff3b6000.pinmux: 12 pins at pa ffff0000094db0=
00 size 48
[    1.403236] pinctrl-single ff3fd000.pinmux: 6 pins at pa ffff0000094dd00=
0 size 24
[    1.403310] pinctrl-single fff11000.pinmux: 42 pins at pa ffff0000094df0=
00 size 168
[    1.403433] pinctrl-single e896c800.pinmux: 128 pins at pa ffff0000094e1=
800 size 512
[    1.403473] pinctrl-single ff3b6800.pinmux: 6 pins at pa ffff0000094e380=
0 size 24
[    1.403512] pinctrl-single ff3fd800.pinmux: 6 pins at pa ffff0000094e580=
0 size 24
[    1.403561] pinctrl-single ff37e800.pinmux: 6 pins at pa ffff0000094e780=
0 size 24
[    1.403624] pinctrl-single fff11800.pinmux: 47 pins at pa ffff0000094e98=
00 size 188
[    1.404471] pl061_gpio e8a0b000.gpio: PL061 GPIO chip @0x00000000e8a0b00=
0 registered
[    1.404653] pl061_gpio e8a0c000.gpio: PL061 GPIO chip @0x00000000e8a0c00=
0 registered
[    1.404837] pl061_gpio e8a0d000.gpio: PL061 GPIO chip @0x00000000e8a0d00=
0 registered
[    1.405009] pl061_gpio e8a0e000.gpio: PL061 GPIO chip @0x00000000e8a0e00=
0 registered
[    1.405177] pl061_gpio e8a0f000.gpio: PL061 GPIO chip @0x00000000e8a0f00=
0 registered
[    1.405350] pl061_gpio e8a10000.gpio: PL061 GPIO chip @0x00000000e8a1000=
0 registered
[    1.405521] pl061_gpio e8a11000.gpio: PL061 GPIO chip @0x00000000e8a1100=
0 registered
[    1.405690] pl061_gpio e8a12000.gpio: PL061 GPIO chip @0x00000000e8a1200=
0 registered
[    1.405857] pl061_gpio e8a13000.gpio: PL061 GPIO chip @0x00000000e8a1300=
0 registered
[    1.406028] pl061_gpio e8a14000.gpio: PL061 GPIO chip @0x00000000e8a1400=
0 registered
[    1.406209] pl061_gpio e8a15000.gpio: PL061 GPIO chip @0x00000000e8a1500=
0 registered
[    1.406378] pl061_gpio e8a16000.gpio: PL061 GPIO chip @0x00000000e8a1600=
0 registered
[    1.406550] pl061_gpio e8a17000.gpio: PL061 GPIO chip @0x00000000e8a1700=
0 registered
[    1.406723] pl061_gpio e8a18000.gpio: PL061 GPIO chip @0x00000000e8a1800=
0 registered
[    1.406894] pl061_gpio e8a19000.gpio: PL061 GPIO chip @0x00000000e8a1900=
0 registered
[    1.407068] pl061_gpio e8a1a000.gpio: PL061 GPIO chip @0x00000000e8a1a00=
0 registered
[    1.407246] pl061_gpio e8a1b000.gpio: PL061 GPIO chip @0x00000000e8a1b00=
0 registered
[    1.407419] pl061_gpio e8a1c000.gpio: PL061 GPIO chip @0x00000000e8a1c00=
0 registered
[    1.407605] pl061_gpio ff3b4000.gpio: PL061 GPIO chip @0x00000000ff3b400=
0 registered
[    1.407777] pl061_gpio ff3b5000.gpio: PL061 GPIO chip @0x00000000ff3b500=
0 registered
[    1.407949] pl061_gpio e8a1f000.gpio: PL061 GPIO chip @0x00000000e8a1f00=
0 registered
[    1.408120] pl061_gpio e8a20000.gpio: PL061 GPIO chip @0x00000000e8a2000=
0 registered
[    1.408299] pl061_gpio fff0b000.gpio: PL061 GPIO chip @0x00000000fff0b00=
0 registered
[    1.408473] pl061_gpio fff0c000.gpio: PL061 GPIO chip @0x00000000fff0c00=
0 registered
[    1.408654] pl061_gpio fff0d000.gpio: PL061 GPIO chip @0x00000000fff0d00=
0 registered
[    1.408842] pl061_gpio fff0e000.gpio: PL061 GPIO chip @0x00000000fff0e00=
0 registered
[    1.409017] pl061_gpio fff0f000.gpio: PL061 GPIO chip @0x00000000fff0f00=
0 registered
[    1.409197] pl061_gpio fff10000.gpio: PL061 GPIO chip @0x00000000fff1000=
0 registered
[    1.409372] pl061_gpio fff1d000.gpio: PL061 GPIO chip @0x00000000fff1d00=
0 registered
[    1.412294] xen:xen_evtchn: Event-channel device installed
[    1.416016] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.417008] SuperH (H)SCI(F) driver initialized
[    1.417167] msm_serial: driver initialized
[    1.421092] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.424895] loop: module loaded
[    1.425090] [I/GPIO_HUB] gpio_hub_init:gpio hub init status:0
[    1.426329] ufshcd-hi3660 ff3b0000.ufs: ufshcd_populate_vreg: Unable to =
find vdd-hba-supply regulator, assuming enabled
[    1.426333] ufshcd-hi3660 ff3b0000.ufs: ufshcd_populate_vreg: Unable to =
find vcc-supply regulator, assuming enabled
[    1.426336] ufshcd-hi3660 ff3b0000.ufs: ufshcd_populate_vreg: Unable to =
find vccq-supply regulator, assuming enabled
[    1.426340] ufshcd-hi3660 ff3b0000.ufs: ufshcd_populate_vreg: Unable to =
find vccq2-supply regulator, assuming enabled
[    1.448657] scsi host0: ufshcd
[    1.463331] hisi_sas: driver version v1.6
[    1.464937] libphy: Fixed MDIO Bus: probed
[    1.465193] tun: Universal TUN/TAP device driver, 1.6
[    1.465844] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.465845] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.465870] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.=
0-k
[    1.465871] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.465895] igbvf: Intel(R) Gigabit Virtual Function Network Driver - ve=
rsion 2.4.0-k
[    1.465896] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.466066] sky2: driver version 1.30
[    1.466317] xen_netfront: Initialising Xen virtual ethernet driver
[    1.466359] usbcore: registered new interface driver asix
[    1.466380] usbcore: registered new interface driver ax88179_178a
[    1.466538] VFIO - User Level meta-driver version: 0.3
[    1.467009] [USB3][hisi_dwc3_probe]+
[    1.467090] [USB3][get_phy_param]eye diagram param: 0x1c466e3
[    1.467093] [USB3][get_phy_param]eye diagram host param: 0x1c466e3
[    1.467095] [USB3][get_phy_param]usb3_phy_cr_param: 0xb80
[    1.467097] [USB3][get_phy_param]usb3_phy_host_cr_param: 0x980
[    1.467100] [USB3][get_phy_param]usb3_phy_tx_vboost_lvl: 5
[    1.467120] [USB3][get_resource]this is asic platform (fpga flag 0)
[    1.467121] [USB3][create_attr_file]+
[    1.467206] [USB3][create_attr_file]-
[    1.467210] [USB3][hi3660_usb3phy_init]+
[    1.495310] [USB3][config_femtophy_param]set hs phy param 0x1c466e3 for =
device
[    1.495861] [USB3][config_femtophy_param]set ss phy rx equalization 0xb80
[    1.496895] [USB3][config_femtophy_param]set ss RX_SCOPE_VDCC 0x1
[    1.496898] [USB3][config_femtophy_param]set ss phy tx vboost lvl 0x5
[    1.496902] [USB3][set_hisi_dwc3_power_flag]set hisi_dwc3_power_flag 1
[    1.496903] [USB3][hi3660_usb3phy_init]-
[    1.497967] [dwc3_otg_init]+
[    1.497971] DWC3_OCFG:	0x0
[    1.497972] DWC3_OCTL:	0x40
[    1.497974] DWC3_OEVT:	0x80000000
[    1.497975] DWC3_OEVTEN:	0x0
[    1.497976] DWC3_OSTS:	0x19
[    1.497978] DWC3_BCFG:	0x0
[    1.497979] DWC3_BCEVT:	0x0
[    1.497980] DWC3_BCEVTEN:	0x0
[    1.497981] [dwc3_otg_init]-
[    1.498003] dwc3 ff100000.dwc3: dwc3_host_init if otg, otg will do devic=
e_add.
[    1.499800] [USB3][hisi_dwc3_wake_lock]usb otg wake lock
[    1.499807] [USB3][hisi_dwc3_probe]init state: OFF
[    1.499810] [USB3][hisi_usb_otg_event]hisi_usb_otg_event in:1
[    1.499812] [USB3][hisi_usb_otg_event]hisi_usb_otg_event in otg:1
[    1.499814] [USB3][hisi_usb_otg_event]event: 1
[    1.499823] [USB3][event_work]+
[    1.499826] [USB3][handle_event][handle_event] type: 1
[    1.499831] [USB3][handle_event]cancel bc_again_work sync:0
[    1.499834] [dwc3_otg_work]+
[    1.499834]  evt =3D 4
[    1.499837] [dwc3_otg_stop_peripheral]+
[    1.499838] [dwc3_otg_stop_peripheral]-
[    1.499839] [dwc3_otg_work]-
[    1.499841] [USB3][hisi_dwc3_wake_unlock]usb otg wake unlock
[    1.499845] [USB3][handle_event]hisi usb status: DEVICE -> OFF
[    1.499846] [USB3][event_work]-
[    1.499851] [USB3][hisi_dwc3_probe]-
[    1.500311] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.500314] ehci-pci: EHCI PCI platform driver
[    1.500339] ehci-platform: EHCI generic platform driver
[    1.500408] ehci-orion: EHCI orion driver
[    1.500461] ehci-exynos: EHCI EXYNOS driver
[    1.500515] ehci-msm: Qualcomm On-Chip EHCI Host Controller
[    1.500561] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.500571] ohci-pci: OHCI PCI platform driver
[    1.500597] ohci-platform: OHCI generic platform driver
[    1.500655] ohci-exynos: OHCI EXYNOS driver
[    1.500914] usbcore: registered new interface driver usb-storage
[    1.501365] [I/hisi_pd] pd_dpm_init
[    1.501429] [I/hisi_pd] pd_dpm_probe : +++++++++
[    1.501472] [I/hisi_pd] pd_dpm_probe ++++
[    1.501472]=20
[    1.501665] rt1711h_init (1.1.8_G): initializing...
[    1.501676] rt1711h node found...
[    1.502348] rtc-pl031 fff04000.rtc: rtc core: registered pl031 as rtc0
[    1.502711] i2c /dev entries driver
[    1.504014] hi3660_thermal fff30000.tsensor: failed to register thermal =
sensor0: -19
[    1.504022] hi3660_thermal fff30000.tsensor: failed to register thermal =
sensor1: -19
[    1.504029] hi3660_thermal fff30000.tsensor: failed to register thermal =
sensor2: -19
[    1.504035] hi3660_thermal fff30000.tsensor: failed to register thermal =
sensor3: -19
[    1.504043] hi3660_thermal fff30000.tsensor: failed to register thermal =
sensor4: -517
[    1.504050] hi3660_thermal fff30000.tsensor: failed to register thermal =
sensor5: -19
[    1.504052] hi3660_thermal fff30000.tsensor: Thermal Sensor Loaded
[    1.504663] cpu cpu0: failed to get clock: -2
[    1.504674] cpufreq-dt: probe of cpufreq-dt failed with error -2
[    1.504883] sdhci: Secure Digital Host Controller Interface driver
[    1.504884] sdhci: Copyright(c) Pierre Ossman
[    1.505070] Synopsys Designware Multimedia Card Interface Driver
[    1.505467] dwmmc_k3 ff37f000.dwmmc1: fifo-depth property not found, usi=
ng value of FIFOTH register as default
[    1.507636] dwmmc_k3 ff37f000.dwmmc1: IDMAC supports 64-bit address mode.
[    1.507808] dwmmc_k3 ff37f000.dwmmc1: Using internal DMA controller.
[    1.507815] dwmmc_k3 ff37f000.dwmmc1: Version ID is 270a
[    1.507881] dwmmc_k3 ff37f000.dwmmc1: DW MMC controller at irq 46,32 bit=
 host data width,256 deep fifo
[    1.508052] dwmmc_k3 ff37f000.dwmmc1: Got CD GPIO
[    1.529636] mmc_host mmc0: Bus speed (slot 0) =3D 400000Hz (slot req 400=
000Hz, actual 400000HZ div =3D 0)
[    1.547340] dwmmc_k3 ff37f000.dwmmc1: 1 slots initialized
[    1.547557] dwmmc_k3 ff3ff000.dwmmc2: fifo-depth property not found, usi=
ng value of FIFOTH register as default
[    1.549710] dwmmc_k3 ff3ff000.dwmmc2: IDMAC supports 64-bit address mode.
[    1.549900] dwmmc_k3 ff3ff000.dwmmc2: Using internal DMA controller.
[    1.549906] dwmmc_k3 ff3ff000.dwmmc2: Version ID is 270a
[    1.549955] dwmmc_k3 ff3ff000.dwmmc2: DW MMC controller at irq 47,32 bit=
 host data width,256 deep fifo
[    1.550486] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.558007] ledtrig-cpu: registered to indicate activity on CPUs
[    1.558668] usbcore: registered new interface driver usbhid
[    1.558669] usbhid: USB HID core driver
[    1.560131] NET: Registered protocol family 17
[    1.560222] 9pnet: Installing 9P2000 support
[    1.560269] Key type dns_resolver registered
[    1.560791] registered taskstats version 1
[    1.567071] ffd74000.serial: ttyAMA3 at MMIO 0xffd74000 (irq =3D 12, bas=
e_baud =3D 0) is a PL011 rev2
[    1.569673] fdf01000.serial: ttyAMA4 at MMIO 0xfdf01000 (irq =3D 13, bas=
e_baud =3D 0) is a PL011 rev2
[    1.569758] serial serial0: tty port ttyAMA4 registered
[    1.570128] ssp-pl022 ffd68000.spi: ARM PL022 driver, device ID: 0x00041=
022
[    1.570166] ssp-pl022 ffd68000.spi: mapped registers from 0x00000000ffd6=
8000 to ffff0000095ee000
[    1.578995] ssp-pl022 ffd68000.spi: Failed to work in dma mode, work wit=
hout dma!
[    1.579239] ssp-pl022 ff3b3000.spi: ARM PL022 driver, device ID: 0x00041=
022
[    1.579268] ssp-pl022 ff3b3000.spi: mapped registers from 0x00000000ff3b=
3000 to ffff0000095f0000
[    1.579301] ssp-pl022 ff3b3000.spi: Failed to work in dma mode, work wit=
hout dma!
[    1.631197] rt1711_i2c_probe
[    1.631200] I2C functionality : OK...
[    1.722701] ufshcd-hi3660 ff3b0000.ufs: ufshcd_print_pwr_info:[RX, TX]: =
gear=3D[1, 1], lane[1, 1], pwr[SLOWAUTO_MODE, SLOWAUTO_MODE], rate =3D 0
[    1.754676] rt_parse_dt
[    1.754687] rt1711h_chipID =3D 0x2171
[    1.754695] regmap_device_register: name =3D rt1711-4e
[    1.754718]  rt_regmap_rt1711-4e: rt register cache data init
[    1.754724]  rt_regmap_rt1711-4e: cache cata init successfully
[    1.754797] tcpc_device_register register tcpc device (type_c_port0)
[    1.754861] [I/hisi_pd] tcpc_device_register register_pd_wake_unlock_not=
ifier OK
[    1.754863] PD Timer number =3D 37
[    1.754942] tcpci_timer_init : init OK
[    1.755009] pd_parse_pdata
[    1.755017] pd_parse_pdata src pdo data =3D
[    1.755019] pd_parse_pdata 0: 0x00019064
[    1.755020] pd_parse_pdata snk pdo data =3D
[    1.755022] pd_parse_pdata 0: 0x000190c8
[    1.755023] pd_parse_pdata 1: 0x0002d0c8
[    1.755026] pd_parse_pdata id vdos data =3D
[    1.755027] pd_parse_pdata 0: 0xd00029cf
[    1.755028] pd_parse_pdata 1: 0x00000000
[    1.755029] pd_parse_pdata 2: 0x00010000
[    1.755031] dpm_caps: local_dr_power
[    1.755033] dpm_caps: local_dr_data
[    1.755038] dpm_caps: local_ext_power
[    1.755039] dpm_caps: local_usb_comm
[    1.755041] dpm_caps: local_usb_suspend
[    1.755042] dpm_caps: local_high_cap
[    1.755043] dpm_caps: local_give_back
[    1.755044] dpm_caps: local_no_suspend
[    1.755046] dpm_caps: local_vconn_supply
[    1.755047] dpm_caps: attemp_discover_cable_dfp
[    1.755048] dpm_caps: attemp_enter_dp_mode
[    1.755050] dpm_caps: attemp_discover_cable
[    1.755052] dpm_caps: attemp_discover_id
[    1.755053] dpm_caps: pr_reject_as_source
[    1.755054] dpm_caps: pr_reject_as_sink
[    1.755055] dpm_caps: pr_check_gp_source
[    1.755056] dpm_caps: pr_check_gp_sink
[    1.755058] dpm_caps: dr_reject_as_dfp
[    1.755059] dpm_caps: dr_reject_as_ufp
[    1.755060] dpm_caps: snk_prefer_low_voltage
[    1.755062] dpm_caps: snk_ignore_mismatch_current
[    1.755064] dpm_caps =3D 0xc010c10b
[    1.755066] [I/hisi_pd] PE:pd_core_init
[    1.806683] rt1711_init_alert name =3D type_c_port0
[    1.806684] rt1711_init_alert gpio # =3D 291
[    1.806706] GPIO requested...
[    1.806711] rt1711_init_alert : IRQ number =3D 271
[    1.806711] rt1711_init_alert : irq initialized...
[    1.806778] IRQF_NO_THREAD Test
[    2.031644] [I/hisi_pd] [TCPC-I]SkipAlert:0x20000
[    2.287025] ufs final power mode: gear =3D 3, lane =3D 1, pwr =3D 1, rat=
e =3D 2
[    2.287031] ufshcd-hi3660 ff3b0000.ufs: set TX_EQUALIZER 3.5db
[    2.353315] [I/hisi_pd] TPC-I:typec_init: DRP
[    2.584086] ufshcd-hi3660 ff3b0000.ufs: check TX_EQUALIZER DB value lane=
0 =3D 0x1
[    2.584090] ufshcd-hi3660 ff3b0000.ufs: ufshcd_print_pwr_info:[RX, TX]: =
gear=3D[3, 3], lane[1, 1], pwr[FAST MODE, FAST MODE], rate =3D 2
[    2.592913] ufshcd-hi3660 ff3b0000.ufs: ufshcd_find_max_sup_active_icc_l=
evel: Regulator capability was not set, actvIccLevel=3D0
[    2.598707] [E/hisi_pd] typec_wait_ps_change: typec_wait_ps_change!!!+++=
++++++++
[    2.598709] [E/hisi_pd] typec_wait_ps_change: typec_wait_ps_change!!!---=
--------
[    2.598710] [E/hisi_pd] typec_unattached_power_entry:!!!+++++++++++
[    2.627703] scsi 0:0:0:49488: scsi_add_lun: correcting incorrect periphe=
ral device type 0x0 for W-LUN 0x            c150hN
[    2.627709] scsi 0:0:0:49488: Well-known LUN    SAMSUNG  KLUBG4G1CE-B0B1=
  1000 PQ: 0 ANSI: 6
[    2.650767] [E/hisi_pd] tcpci_disable_vbus_control: !!!++++++++
[    2.650770] [E/hisi_pd] pd_dpm_handle_pe_event:!!!,event=3D0,+++
[    2.650771] [E/hisi_pd] typec_unattached_power_entry:!!!-----------
[    2.650774] [E/GPIO_HUB] gpio_hub_switch_to_hub: otg_switch_gpio is err
[    2.650776] [E/GPIO_HUB] gpio_hub_change_typec_power: typec power gpio i=
s err
[    2.650778] [E/GPIO_HUB] gpio_hub_power_on: gpio hub hub vbus set err
[    2.650782] [USB3][hisi_usb_otg_event]hisi_usb_otg_event in:1
[    2.650783] [USB3][hisi_usb_otg_event]hisi_usb_otg_event in otg:1
[    2.650785] [USB3][hisi_usb_otg_event]hisi_usb_otg_event in:2
[    2.650786] [USB3][hisi_usb_otg_event]hisi_usb_otg_event in otg:2
[    2.650788] [USB3][hisi_usb_otg_event]event: 2
[    2.650796] [I/hisi_pd] TPC-I:** Unattached.SNK
[    2.660119] [USB3][event_work]+
[    2.660121] [USB3][handle_event][handle_event] type: 2
[    2.660123] [USB3][set_vbus_power]set port power 1
[    2.660127] [dwc3_otg_work]+
[    2.660127]  evt =3D 2
[    2.660128] [dwc3_otg_start_host]+
[    2.660504] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    2.660521] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned b=
us number 1
[    2.660955] xhci-hcd xhci-hcd.0.auto: hcc params 0x0220fe65 hci version =
0x110 quirks 0x00010010
[    2.661010] xhci-hcd xhci-hcd.0.auto: irq 285, io mem 0xff100000
[    2.661448] hub 1-0:1.0: USB hub found
[    2.661466] hub 1-0:1.0: 1 port detected
[    2.661613] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    2.661624] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned b=
us number 2
[    2.661676] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    2.661972] hub 2-0:1.0: USB hub found
[    2.661986] hub 2-0:1.0: 1 port detected
[    2.662096] [dwc3_otg_start_host]-
[    2.662097] [dwc3_otg_work]-
[    2.662101] [USB3][hisi_dwc3_wake_lock]usb otg wake lock
[    2.662105] [USB3][handle_event]hisi usb_status: OFF -> HOST
[    2.662106] [USB3][event_work]-
[    2.721402] tcpc_device_irq_enable : tcpc irq enable OK!
[    2.721404] rt1711_i2c_probe probe OK!
[    2.723130] dwmmc_k3 ff3ff000.dwmmc2: fifo-depth property not found, usi=
ng value of FIFOTH register as default
[    2.725307] dwmmc_k3 ff3ff000.dwmmc2: IDMAC supports 64-bit address mode.
[    2.725439] dwmmc_k3 ff3ff000.dwmmc2: Using internal DMA controller.
[    2.725446] dwmmc_k3 ff3ff000.dwmmc2: Version ID is 270a
[    2.725490] dwmmc_k3 ff3ff000.dwmmc2: DW MMC controller at irq 47,32 bit=
 host data width,128 deep fifo
[    2.725595] mmc_host mmc1: card is non-removable.
[    2.751421] scsi 0:0:0:49456: scsi_add_lun: correcting incorrect periphe=
ral device type 0x0 for W-LUN 0x            c130hN
[    2.751426] scsi 0:0:0:49456: Well-known LUN    SAMSUNG  KLUBG4G1CE-B0B1=
  1000 PQ: 0 ANSI: 6
[    2.833026] scsi 0:0:0:49476: scsi_add_lun: correcting incorrect periphe=
ral device type 0x0 for W-LUN 0x            c144hN
[    2.833031] scsi 0:0:0:49476: Well-known LUN    SAMSUNG  KLUBG4G1CE-B0B1=
  1000 PQ: 0 ANSI: 6
[    2.837307] mmc_host mmc1: Bus speed (slot 0) =3D 400000Hz (slot req 400=
000Hz, actual 400000HZ div =3D 0)
[    2.855317] dwmmc_k3 ff3ff000.dwmmc2: 1 slots initialized
[    2.855876] input: keys as /devices/platform/keys/input/input0
[    2.861879] rtc-pl031 fff04000.rtc: setting system clock to 1970-01-01 0=
3:30:03 UTC (12603)
[    2.879145] dwmmc_k3 ff3ff000.dwmmc2: card claims to support voltages be=
low defined range
[    2.879155] scsi 0:0:0:0: Direct-Access     SAMSUNG  KLUBG4G1CE-B0B1  10=
00 PQ: 0 ANSI: 6
[    2.881882] ALSA device list:
[    2.881884]   No soundcards found.
[    2.948100] scsi 0:0:0:1: Direct-Access     SAMSUNG  KLUBG4G1CE-B0B1  10=
00 PQ: 0 ANSI: 6
[    2.974891] sd 0:0:0:0: [sda] 1024 4096-byte logical blocks: (4.19 MB/4.=
00 MiB)
[    2.974894] sd 0:0:0:0: [sda] 16384-byte physical blocks
[    2.974942] scsi 0:0:0:2: Direct-Access     SAMSUNG  KLUBG4G1CE-B0B1  10=
00 PQ: 0 ANSI: 6
[    2.980630] sd 0:0:0:0: [sda] Write Protect is off
[    2.989718] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 supports DPO and FUA
[    3.004486] scsi 0:0:0:3: Direct-Access     SAMSUNG  KLUBG4G1CE-B0B1  10=
00 PQ: 0 ANSI: 6
[    3.013821] sd 0:0:0:1: [sdb] 1024 4096-byte logical blocks: (4.19 MB/4.=
00 MiB)
[    3.013825] sd 0:0:0:1: [sdb] 16384-byte physical blocks
[    3.018086] sd 0:0:0:1: [sdb] Write Protect is off
[    3.029960] sd 0:0:0:1: [sdb] Write cache: enabled, read cache: enabled,=
 supports DPO and FUA
[    3.034509] sd 0:0:0:2: [sdc] 2048 4096-byte logical blocks: (8.39 MB/8.=
00 MiB)
[    3.034512] sd 0:0:0:2: [sdc] 16384-byte physical blocks
[    3.039744] sd 0:0:0:2: [sdc] Write Protect is off
[    3.050072] sd 0:0:0:2: [sdc] Write cache: enabled, read cache: enabled,=
 supports DPO and FUA
[    3.052216] mmc_host mmc1: Bus speed (slot 0) =3D 25000000Hz (slot req 2=
5000000Hz, actual 25000000HZ div =3D 0)
[    3.053582] random: fast init done
[    3.072447] sd 0:0:0:3: [sdd] 7805952 4096-byte logical blocks: (32.0 GB=
/29.8 GiB)
[    3.072450] sd 0:0:0:3: [sdd] 16384-byte physical blocks
[    3.079050] sd 0:0:0:3: [sdd] Write Protect is off
[    3.082679] sd 0:0:0:3: [sdd] Write cache: enabled, read cache: enabled,=
 supports DPO and FUA
[    3.135756] sd 0:0:0:0: [sda] Attached SCSI disk
[    3.173035] sd 0:0:0:1: [sdb] Attached SCSI disk
[    3.173065] Alternate GPT is invalid, using primary GPT.
[    3.173072]  sdc: sdc1
[    3.243944]  sdd: sdd1 sdd2 sdd3 sdd4 sdd5 sdd6 sdd7 sdd8 sdd9 sdd10 sdd=
11 sdd12 sdd13
[    3.258638] sd 0:0:0:2: [sdc] Attached SCSI disk
[    3.315172] sd 0:0:0:3: [sdd] Attached SCSI disk
[    3.613991] mmc1: new SDIO card at address 0001
[    3.652858] wl18xx_driver wl18xx.1.auto: Direct firmware load for ti-con=
nectivity/wl18xx-conf.bin failed with error -2
[    3.652864] wlcore: ERROR could not get configuration binary ti-connecti=
vity/wl18xx-conf.bin: -2
[    3.652866] wlcore: WARNING falling back to default config
[    4.210100] wlcore: wl18xx HW: 183x or 180x, PG 2.2 (ROM 0x11)
[    4.219088] wlcore: loaded
[    4.222294] EXT4-fs (sdd10): couldn't mount as ext3 due to feature incom=
patibilities
[    4.232524] EXT4-fs (sdd10): mounted filesystem with ordered data mode. =
Opts: (null)
[    4.240232] VFS: Mounted root (ext4 filesystem) on device 8:58.
[    4.246415] devtmpfs: mounted
[    4.249638] Freeing unused kernel memory: 1088K
[    4.322030] systemd[1]: System time before build time, advancing clock.

Welcome to =1B[1mDebian GNU/Linux 9 (stretch)=1B[0m!

NetworkManager-wait-online.service: Cannot add dependency job, ignoring: Un=
it NetworkManager-wait-online.service is masked.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket (/dev/log).
[=1B[0;32m  OK  =1B[0m] Created slice User and Session Slice.
[=1B[0;32m  OK  =1B[0m] Started Dispatch Password Requests to Console Direc=
tory Watch.
[=1B[0;32m  OK  =1B[0m] Created slice System Slice.
         Mounting Debug File System...
[=1B[0;32m  OK  =1B[0m] Reached target Slices.
[=1B[0;32m  OK  =1B[0m] Listening on /dev/initctl Compatibility Named Pipe.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket.
         Starting Remount Root and Kernel File Systems...
         Starting Nameserver information manager...
         Starting Set the console keyboard layout...
         Starting Load Kernel Modules...
[=1B[0;32m  OK  =1B[0m] Listening on udev Kernel Socket.
[=1B[0;32m  OK  =1B[0m] Created slice system-serial\x2dgetty.slice.
[=1B[0;32m  OK  =1B[0m] Reached target Remote File Systems.
[=1B[0;32m  OK  =1B[0m] Started Forward Password Requests to Wall Directory=
 Watch.
[=1B[0;32m  OK  =1B[0m] Reached target Encrypted Volumes.
         Starting Create Static Device Nodes in /dev...
[=1B[0;32m  OK  =1B[0m] Listening on udev Control Socket.
         Mounting Huge Pages File System...
         Mounting POSIX Message Queue File System...
[=1B[0;32m  OK  =1B[0m] Created slice system-getty.slice.
[=1B[0;32m  OK  =1B[0m] Listening on Network Service Netlink Socket.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Audit Socket.
[=1B[0;32m  OK  =1B[0m] Listening on Syslog Socket.
         Starting Journal Service...
[=1B[0;32m  OK  =1B[0m] Mounted POSIX Message Queue File System.
[=1B[0;32m  OK  =1B[0m] Mounted Debug File System.
[=1B[0;32m  OK  =1B[0m] Mounted Huge Pages File System.
[=1B[0;32m  OK  =1B[0m] Started Remount Root and Kernel File Systems.
[=1B[0;32m  OK  =1B[0m] Started Load Kernel Modules.
[=1B[0;32m  OK  =1B[0m] Started Create Static Device Nodes in /dev.
[=1B[0;32m  OK  =1B[0m] Started Nameserver information manager.
[=1B[0;32m  OK  =1B[0m] Started Set the console keyboard layout.
         Starting udev Kernel Device Manager...
         Starting Apply Kernel Variables...
         Mounting Configuration File System...
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems (Pre).
         Starting Load/Save Random Seed...
         Starting udev Coldplug all Devices...
[=1B[0;32m  OK  =1B[0m] Mounted Configuration File System.
[=1B[0;32m  OK  =1B[0m] Started Journal Service.
[=1B[0;32m  OK  =1B[0m] Started Apply Kernel Variables.
[=1B[0;32m  OK  =1B[0m] Started Load/Save Random Seed.
[=1B[0;32m  OK  =1B[0m] Started udev Kernel Device Manager.
         Starting Network Service...
         Starting Flush Journal to Persistent Storage...
[=1B[0;32m  OK  =1B[0m] Started Network Service.
[    4.787441] systemd-journald[1510]: Received request to flush runtime jo=
urnal from PID 1
[=1B[0;32m  OK  =1B[0m] Started Flush Journal to Persistent Storage.
[=1B[0;32m  OK  =1B[0m] Started udev Coldplug all Devices.
[=1B[0;32m  OK  =1B[0m] Found device /dev/hvc0.
[=1B[0;32m  OK  =1B[0m] Found device KLUBG4G1CE-B0B1 vendor.
[=1B[0;32m  OK  =1B[0m] Found device KLUBG4G1CE-B0B1 userdata.
         Mounting /home...
         [    5.075784] EActivating swap /dev/sdd11...XT4-fs (sdd13):=20
mounted filesystem with ordered data mode. Opts: (null)
[    5.086896] Adding 802812k swap on /dev/sdd11.  Priority:-1 extents:1 ac=
ross:802812k SS
[=1B[0;32m  OK  =1B[0m] Mounted /home.
[=1B[0;32m  OK  =1B[0m] Activated swap /dev/sdd11.
[=1B[0;32m  OK  =1B[0m] Reached target Swap.
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems.
         Starting Raise network interfaces...
         Starting Set console font and keymap...
         Starting Create Volatile Files and Directories...
[=1B[0;32m  OK  =1B[0m] Started Set console font and keymap.
[=1B[0;32m  OK  =1B[0m] Started Create Volatile Files and Directories.
         Starting Network Time Synchronization...
         Starting Update UTMP about System Boot/Shutdown...
[=1B[0;32m  OK  =1B[0m] Started Update UTMP about System Boot/Shutdown.
[=1B[0;32m  OK  =1B[0m] Started Raise network interfaces.
[=1B[0;32m  OK  =1B[0m] Started Network Time Synchronization.
[=1B[0;32m  OK  =1B[0m] Reached target System Initialization.
[=1B[0;32m  OK  =1B[0m] Listening on D-Bus System Message Bus Socket.
[=1B[0;32m  OK  =1B[0m] Listening on OpenBSD Secure Shell server socket.
[=1B[0;32m  OK  =1B[0m] Started Daily Cleanup of Temporary Directories.
[=1B[0;32m  OK  =1B[0m] Listening on ACPID Listen Socket.
[=1B[0;32m  OK  =1B[0m] Reached target Sockets.
[=1B[0;32m  OK  =1B[0m] Started ACPI Events Check.
[=1B[0;32m  OK  =1B[0m] Reached target Paths.
[=1B[0;32m  OK  =1B[0m] Reached target Basic System.
         Starting Initialize hardware monitoring sensors...
[=1B[0;32m  OK  =1B[0m] Started D-Bus System Message Bus.
         Starting Network Manager...
         Starting Login Service...
         Starting System Logging Service...
         Starting Modem Manager...
         Starting Restore /etc/resolv.conf i=E2=80=A6fore the ppp link was =
shut down...
         Starting Provide limited super user privileges to specific users...
[=1B[0;32m  OK  =1B[0m] Started Regular background program processing daemo=
n.
         Starting RealtimeKit Scheduling Policy Service...
         Starting WPA supplicant...
         Starting LSB: Load kernel modules needed to enable cpufreq scaling=
=2E..
[=1B[0;32m  OK  =1B[0m] Started ACPI event daemon.
[=1B[0;32m  OK  =1B[0m] Reached target System Time Synchronized.
[=1B[0;32m  OK  =1B[0m] Started Daily apt download activities.
[=1B[0;32m  OK  =1B[0m] Started Daily apt upgrade and clean activities.
[=1B[0;32m  OK  =1B[0m] Reached target Timers.
[=1B[0;32m  OK  =1B[0m] Started System Logging Service.
[=1B[0;32m  OK  =1B[0m] Started Restore /etc/resolv.conf if=E2=80=A6before =
the ppp link was shut down.
[=1B[0;32m  OK  =1B[0m] Started Provide limited super user privileges to sp=
ecific users.
[=1B[0;32m  OK  =1B[0m] Started Initialize hardware monitoring sensors.
[=1B[0;32m  OK  =1B[0m] Started RealtimeKit Scheduling Policy Service.
[=1B[0;32m  OK  =1B[0m] Started LSB: Load kernel modules needed to enable c=
pufreq scaling.
[=1B[0;32m  OK  =1B[0m] Started WPA supplicant.
[=1B[0;32m  OK  =1B[0m] Started Network Manager.
[=1B[0;32m  OK  =1B[0m] Started Login Service.
         Starting Network Manager Script Dispatcher Service...
[=1B[0;32m  OK  =1B[0m] Reached target Network.
         Starting Network Name Resolution...
[=1B[0;32m  OK  =1B[0m] Reached target Network is Online.
         Starting /etc/rc.local Compatibility...
         Starting LSB: Advanced IEEE 802.11 management daemon...
         Starting LSB: exim Mail Transport Agent...
         Starting Permit User Sessions...
         Starting Authorization Manager...
         Starting LSB: set CPUFreq kernel parameters...
[=1B[0;32m  OK  =1B[0m] Started /etc/rc.local Compatibility.
[=1B[0;32m  OK  =1B[0m] Started LSB: Advanced IEEE 802.11 management daemon.
[=1B[0;32m  OK  =1B[0m] Started Permit User Sessions.
[=1B[0;32m  OK  =1B[0m] Started Network Manager Script Dispatcher Service.
[=1B[0;32m  OK  =1B[0m] Started Authorization Manager.
[=1B[0;32m  OK  =1B[0m] Started Modem Manager.
[=1B[0;32m  OK  =1B[0m] Started LSB: set CPUFreq kernel parameters.
         Starting Hostname Service...
[=1B[0;32m  OK  =1B[0m] Started Getty on tty1.
[=1B[0;32m  OK  =1B[0m] Started Serial Getty on hvc0.
[=1B[0;32m  OK  =1B[0m] Reached target Login Prompts.
[=1B[0;32m  OK  =1B[0m] Started Hostname Service.
[=1B[0;32m  OK  =1B[0m] Started Network Name Resolution.
[    6.081315] mmc_host mmc1: Bus speed (slot 0) =3D 400000Hz (slot req 400=
000Hz, actual 400000HZ div =3D 0)
[    6.124893] mmc_host mmc1: Bus speed (slot 0) =3D 25000000Hz (slot req 2=
5000000Hz, actual 25000000HZ div =3D 0)
[    6.541622] wlcore: PHY firmware version: Rev 8.2.0.0.236
[    6.652461] wlcore: firmware booted (Rev 8.9.0.0.69)
[    6.675754] wlcore: down
[    6.809294] mmc_host mmc1: Bus speed (slot 0) =3D 400000Hz (slot req 400=
000Hz, actual 400000HZ div =3D 0)
[    6.853278] mmc_host mmc1: Bus speed (slot 0) =3D 25000000Hz (slot req 2=
5000000Hz, actual 25000000HZ div =3D 0)
[    7.263605] wlcore: PHY firmware version: Rev 8.2.0.0.236
[    7.369249] wlcore: firmware booted (Rev 8.9.0.0.69)
[=1B[0;32m  OK  =1B[0m] Started LSB: exim Mail Transport Agent.
[=1B[0;32m  OK  =1B[0m] Reached target Multi-User System.
[=1B[0;32m  OK  =1B[0m] Reached target Graphical Interface.
         Starting Update UTMP about System Runlevel Changes...
[=1B[0;32m  OK  =1B[0m] Started Update UTMP about System Runlevel Changes.

Debian GNU/Linux 9 hikey960 hvc0

hikey960 login: root (automatic login)

Last login: Thu Aug 29 16:47:49 UTC 2019 on hvc0
Linux hikey960 4.12.0-linaro-hikey960+ #3 SMP PREEMPT Mon Jul 17 13:26:13 E=
DT 2017 aarch64

HiKey 960
root@hikey960:~# [   11.675304] wlcore: down
[   11.751925] wlan0: authenticate with 70:3a:cb:23:d7:dc
[   11.767979] wlan0: send auth to 70:3a:cb:23:d7:dc (try 1/3)
[   11.805622] wlan0: authenticated
[   11.811227] wlan0: associate with 70:3a:cb:23:d7:dc (try 1/3)
[   11.820091] wlan0: RX AssocResp from 70:3a:cb:23:d7:dc (capab=3D0x1011 s=
tatus=3D0 aid=3D4)
[   11.840447] wlan0: associated
[   11.850740] wlcore: Association completed.

root@hikey960:~# xl info
host                   : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : -unstable
xen_version            : 4.13-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
root@hikey960:~# ./live=07patch_test.pl
Have 37 test-cases
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch list)' .. ID     =
                                | status
----------------------------------------+------------
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch list)' .. ID     =
                                | status
----------------------------------------+------------
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : -unstable
xen_version            : 4.13-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : -unstable
xen_version            : 4.13-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch revert xen_hello_=
world)' ..Failed to get status of xen_hello_world.
Error 2: No such file or directory
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch load xen_hello_wo=
rld.livepatch)' ..Uploading xen_hello_world.livepatch... (XEN) livepatch.c:=
379: livepatch: xen_hello_world: Loaded .note.gnu.build-id at 0000000000a04=
000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .text at 00000000=
00a02000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata at 000000=
0000a04028
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .altinstructions =
at 0000000000a04052
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .altinstr_replace=
ment at 0000000000a04060
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata.str1.8 at=
 0000000000a04068
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata.str at 00=
00000000a040e8
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .bug_frames.1 at =
0000000000a040fc
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.depend=
s at 0000000000a0410c
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.xen_de=
pends at 0000000000a04130
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.funcs =
at 0000000000a03000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.hooks.=
load at 0000000000a03068
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.hooks.=
unload at 0000000000a03078
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04052 (.altinstructions)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04060 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04068 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa040e8 (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa040fc (.bug_frames.1)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa0410c (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04130 (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:319: livepatch: xen_hello_world: Absolute symbol: xen=
_hello_world_func.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa04060 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04068 (.rodata.str1.8)
(XEN) livepatch_elf.c:319: livepatch: xen_hello_world: Absolute symbol: xen=
_hello_world.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa02010 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: app=
ly_hook =3D> 0xa02010 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: rev=
ert_hook =3D> 0xa0202c (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: hi_=
func =3D> 0xa02048 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: che=
ck_fnc =3D> 0xa0207c (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa040fc (.bug_frames.1)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: __f=
unc__.4777 =3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: __f=
unc__.4781 =3D> 0xa04030 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: hel=
lo_world_patch_this_fnc =3D> 0xa04040 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: cnt=
 =3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04078 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: .L2=
=021 =3D> 0xa040e8 (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: .L3=
=021 =3D> 0xa040fa (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_load_data_hi_func =3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: xen=
_hello_world =3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:314: livepatch: xen_hello_world: Undefined symbol res=
olved: xen_extra_version =3D> 0x23cd50
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_check_fnc =3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_load_data_apply_hook =3D> 0xa03070 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_revert_hook =3D> 0xa03088 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:314: livepatch: xen_hello_world: Undefined symbol res=
olved: printk =3D> 0x241e2c
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_xen_hello_world =3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_hi_func =3D> 0xa03080 (.livepatch.hooks.unload)
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.preappl=
y is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.apply i=
s missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.postapp=
ly is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.prereve=
rt is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.revert =
is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.postrev=
ert is missing
(XEN) alternatives: Patching with alt table 0000000000a04052 -> 0000000000a=
0405e
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol apply_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol revert_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol hi_func
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol check_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol __func__.4777
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol __func__.4781
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol hello_world_p=
atch_this_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol cnt
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_loa=
d_data_hi_func
(XEN) livepatch.c:968: livepatch: xen_hello_world: overriding symbol xen_he=
llo_world
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_check_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_loa=
d_data_apply_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_revert_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_xen=
_hello_world
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_hi_func
completed(XEN) livepatch: xen_hello_world: Verifying enabled expectations f=
or all functions

(XEN) livepatch.c:1501: livepatch: xen_hello_world: timeout is 30000000ns
Applying xen_hello_world... (XEN) livepatch.c:1609: livepatch: xen_hello_wo=
rld: CPU2 - IPIing the other 7 CPUs
(XEN) livepatch: xen_hello_world: Applying 1 functions
(XEN) hi_func: Hi! (called 1 times)
(XEN) Hook executing.
(XEN) livepatch: xen_hello_world finished APPLY with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch load xen_hello_wo=
rld.livepatch)' ..Uploading xen_hello_world.livepatch... failed
Error 17: File exists
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch list)' .. ID     =
                                | status
----------------------------------------+------------
xen_hello_world                         | APPLIED
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : Hello World
xen_version            : 4.13Hello World
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch revert xen_hello_=
world)' ..(XEN) livepatch.c:1501: livepatch: xen_hello_world: timeout is 30=
000000ns
Reverting xen_hello_world... (XEN) livepatch.c:1609: livepatch: xen_hello_w=
orld: CPU1 - IPIing the other 7 CPUs
(XEN) livepatch: xen_hello_world: Reverting
(XEN) check_fnc: Hi func called 1 times
(XEN) hi_func: Hi! (called 2 times)
(XEN) Hook unloaded.
(XEN) livepatch: xen_hello_world finished REVERT with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : -unstable
xen_version            : 4.13-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_hello_=
world)' ..Unloading xen_hello_world... completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_hello_=
world)' ..Failed to get status of xen_hello_world.
Error 2: No such file or directory
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : -unstable
xen_version            : 4.13-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch load xen_hello_wo=
rld.livepatch)' ..Uploading xen_hello_world.livepatch... (XEN) livepatch.c:=
379: livepatch: xen_hello_world: Loaded .note.gnu.build-id at 0000000000a04=
000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .text at 00000000=
00a02000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata at 000000=
0000a04028
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .altinstructions =
at 0000000000a04052
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .altinstr_replace=
ment at 0000000000a04060
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata.str1.8 at=
 0000000000a04068
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata.str at 00=
00000000a040e8
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .bug_frames.1 at =
0000000000a040fc
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.depend=
s at 0000000000a0410c
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.xen_de=
pends at 0000000000a04130
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.funcs =
at 0000000000a03000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.hooks.=
load at 0000000000a03068
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.hooks.=
unload at 0000000000a03078
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04052 (.altinstructions)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04060 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04068 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa040e8 (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa040fc (.bug_frames.1)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa0410c (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04130 (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:319: livepatch: xen_hello_world: Absolute symbol: xen=
_hello_world_func.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa04060 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04068 (.rodata.str1.8)
(XEN) livepatch_elf.c:319: livepatch: xen_hello_world: Absolute symbol: xen=
_hello_world.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa02010 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: app=
ly_hook =3D> 0xa02010 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: rev=
ert_hook =3D> 0xa0202c (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: hi_=
func =3D> 0xa02048 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: che=
ck_fnc =3D> 0xa0207c (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa040fc (.bug_frames.1)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: __f=
unc__.4777 =3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: __f=
unc__.4781 =3D> 0xa04030 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: hel=
lo_world_patch_this_fnc =3D> 0xa04040 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: cnt=
 =3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04078 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: .L2=
=021 =3D> 0xa040e8 (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: .L3=
=021 =3D> 0xa040fa (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_load_data_hi_func =3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: xen=
_hello_world =3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:314: livepatch: xen_hello_world: Undefined symbol res=
olved: xen_extra_version =3D> 0x23cd50
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_check_fnc =3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_load_data_apply_hook =3D> 0xa03070 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_revert_hook =3D> 0xa03088 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:314: livepatch: xen_hello_world: Undefined symbol res=
olved: printk =3D> 0x241e2c
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_xen_hello_world =3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_hi_func =3D> 0xa03080 (.livepatch.hooks.unload)
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.preappl=
y is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.apply i=
s missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.postapp=
ly is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.prereve=
rt is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.revert =
is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.postrev=
ert is missing
(XEN) alternatives: Patching with alt table 0000000000a04052 -> 0000000000a=
0405e
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol apply_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol revert_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol hi_func
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol check_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol __func__.4777
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol __func__.4781
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol hello_world_p=
atch_this_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol cnt
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_loa=
d_data_hi_func
(XEN) livepatch.c:968: livepatch: xen_hello_world: overriding symbol xen_he=
llo_world
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_check_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_loa=
d_data_apply_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_revert_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_xen=
_hello_world
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_hi_func
completed(XEN) livepatch: xen_hello_world: Verifying enabled expectations f=
or all functions

(XEN) livepatch.c:1501: livepatch: xen_hello_world: timeout is 30000000ns
Applying xen_hello_world... (XEN) livepatch.c:1609: livepatch: xen_hello_wo=
rld: CPU7 - IPIing the other 7 CPUs
(XEN) livepatch: xen_hello_world: Applying 1 functions
(XEN) hi_func: Hi! (called 1 times)
(XEN) Hook executing.
(XEN) livepatch: xen_hello_world finished APPLY with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : Hello World
xen_version            : 4.13Hello World
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch load xen_bye_worl=
d.livepatch)' ..Uploading xen_bye_world.livepatch... (XEN) livepatch.c:379:=
 livepatch: xen_bye_world: Loaded .note.gnu.build-id at 0000000000a08000
(XEN) livepatch.c:379: livepatch: xen_bye_world: Loaded .text at 0000000000=
a06000
(XEN) livepatch.c:379: livepatch: xen_bye_world: Loaded .rodata at 00000000=
00a08028
(XEN) livepatch.c:379: livepatch: xen_bye_world: Loaded .rodata.str1.8 at 0=
000000000a08040
(XEN) livepatch.c:379: livepatch: xen_bye_world: Loaded .livepatch.depends =
at 0000000000a0804b
(XEN) livepatch.c:379: livepatch: xen_bye_world: Loaded .livepatch.xen_depe=
nds at 0000000000a0806f
(XEN) livepatch.c:379: livepatch: xen_bye_world: Loaded .livepatch.funcs at=
 0000000000a07000
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa08000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa06000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa08028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa08040 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa0804b (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa0806f (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved:  =3D>=
 0xa07000 (.livepatch.funcs)
(XEN) livepatch_elf.c:319: livepatch: xen_bye_world: Absolute symbol: xen_b=
ye_world_func.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: $x =
=3D> 0xa06000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: $d =
=3D> 0xa08040 (.rodata.str1.8)
(XEN) livepatch_elf.c:319: livepatch: xen_bye_world: Absolute symbol: xen_b=
ye_world.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: $d =
=3D> 0xa08028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: bye_w=
orld_patch_this_fnc =3D> 0xa08028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: $d =
=3D> 0xa07000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: livep=
atch_xen_bye_world =3D> 0xa07000 (.livepatch.funcs)
(XEN) livepatch_elf.c:314: livepatch: xen_bye_world: Undefined symbol resol=
ved: xen_extra_version =3D> 0x23cd50
(XEN) livepatch_elf.c:343: livepatch: xen_bye_world: Symbol resolved: xen_b=
ye_world =3D> 0xa06000 (.text)
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.load is m=
issing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.unload is=
 missing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.preapply =
is missing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.apply is =
missing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.postapply=
 is missing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.prerevert=
 is missing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.revert is=
 missing
(XEN) livepatch.c:533: livepatch: xen_bye_world: .livepatch.hooks.postrever=
t is missing
(XEN) livepatch.c:962: livepatch: xen_bye_world: new symbol bye_world_patch=
_this_fnc
(XEN) livepatch.c:962: livepatch: xen_bye_world: new symbol livepatch_xen_b=
ye_world
(XEN) livepatch.c:968: livepatch: xen_bye_world: overriding symbol xen_bye_=
world
completed(XEN) livepatch: xen_bye_world: Verifying enabled expectations for=
 all functions

(XEN) livepatch.c:1501: livepatch: xen_bye_world: timeout is 30000000ns
Applying xen_bye_world... (XEN) livepatch.c:1609: livepatch: xen_bye_world:=
 CPU0 - IPIing the other 7 CPUs
(XEN) livepatch: xen_bye_world: Applying 1 functions
(XEN) livepatch: xen_bye_world finished APPLY with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : Bye World!
xen_version            : 4.13Bye World!
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch upload xen_replac=
e xen_replace_world.livepatch)' ..Uploading xen_replace_world.livepatch... =
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .note.gnu.build-id at=
 0000000000a0c000
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .text at 0000000000a0=
a000
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .rodata at 0000000000=
a0c028
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .rodata.str1.8 at 000=
0000000a0c040
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .livepatch.depends at=
 0000000000a0c053
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .livepatch.xen_depend=
s at 0000000000a0c077
(XEN) livepatch.c:379: livepatch: xen_replace: Loaded .livepatch.funcs at 0=
000000000a0b000
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0c000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0a000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0c028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0c040 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0c053 (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0c077 (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved:  =3D> 0=
xa0b000 (.livepatch.funcs)
(XEN) livepatch_elf.c:319: livepatch: xen_replace: Absolute symbol: xen_rep=
lace_world_func.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: $x =3D>=
 0xa0a000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: $d =3D>=
 0xa0c040 (.rodata.str1.8)
(XEN) livepatch_elf.c:319: livepatch: xen_replace: Absolute symbol: xen_rep=
lace_world.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: $d =3D>=
 0xa0c028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: xen_rep=
lace_world_name =3D> 0xa0c028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: $d =3D>=
 0xa0b000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: livepat=
ch_xen_replace_world =3D> 0xa0b000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_replace: Symbol resolved: xen_rep=
lace_world =3D> 0xa0a000 (.text)
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.load is mis=
sing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.unload is m=
issing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.preapply is=
 missing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.apply is mi=
ssing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.postapply i=
s missing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.prerevert i=
s missing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.revert is m=
issing
(XEN) livepatch.c:533: livepatch: xen_replace: .livepatch.hooks.postrevert =
is missing
(XEN) livepatch.c:226: livepatch: xen_replace: Resolved old address xen_ext=
ra_version =3D> 000000000023cd50
(XEN) livepatch.c:962: livepatch: xen_replace: new symbol xen_replace_world=
_name
(XEN) livepatch.c:962: livepatch: xen_replace: new symbol livepatch_xen_rep=
lace_world
(XEN) livepatch.c:968: livepatch: xen_replace: overriding symbol xen_replac=
e_world
completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch replace xen_repla=
ce)' ..(XEN) livepatch.c:1501: livepatch: xen_replace: timeout is 30000000ns
Replacing all live patches with xen_replace... (XEN) livepatch.c:1609: live=
patch: xen_replace: CPU7 - IPIing the other 7 CPUs
(XEN) livepatch: xen_bye_world: Reverting
(XEN) livepatch: xen_hello_world: Reverting
(XEN) check_fnc: Hi func called 1 times
(XEN) hi_func: Hi! (called 2 times)
(XEN) Hook unloaded.
(XEN) livepatch: xen_replace: Verifying enabled expectations for all functi=
ons
(XEN) livepatch: xen_replace: Applying 1 functions
(XEN) livepatch: xen_replace finished REPLACE with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : Hello Again Wor
xen_version            : 4.13Hello Again Wor
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch apply xen_hello_w=
orld)' ..(XEN) livepatch: xen_hello_world: can't revert as payload has .dat=
a. Please unload
Applying xen_hello_world... failed
Error 22: Invalid argument
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch apply xen_bye_wor=
ld)' ..(XEN) livepatch: xen_bye_world: check against xen_replace build-id f=
ailed
Applying xen_bye_world... failed
Error 22: Invalid argument
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch apply xen_replace=
)' ..No action needed.
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch revert xen_replac=
e)' ..(XEN) livepatch.c:1501: livepatch: xen_replace: timeout is 30000000ns
Reverting xen_replace... (XEN) livepatch.c:1609: livepatch: xen_replace: CP=
U7 - IPIing the other 7 CPUs
(XEN) livepatch: xen_replace: Reverting
(XEN) livepatch: xen_replace finished REVERT with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_replac=
e)' ..Unloading xen_replace... completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_hello_=
world)' ..Unloading xen_hello_world... completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_bye_wo=
rld)' ..Unloading xen_bye_world... completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch list)' .. ID     =
                                | status
----------------------------------------+------------
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : -unstable
xen_version            : 4.13-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch load xen_nop.live=
patch)' ..Uploading xen_nop.livepatch... (XEN) livepatch.c:379: livepatch: =
xen_nop: Loaded .note.gnu.build-id at 0000000000a03000
(XEN) livepatch.c:379: livepatch: xen_nop: Loaded .livepatch.depends at 000=
0000000a03024
(XEN) livepatch.c:379: livepatch: xen_nop: Loaded .livepatch.xen_depends at=
 0000000000a03048
(XEN) livepatch.c:379: livepatch: xen_nop: Loaded .livepatch.funcs at 00000=
00000a02000
(XEN) livepatch_elf.c:343: livepatch: xen_nop: Symbol resolved:  =3D> 0xa03=
000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_nop: Symbol resolved:  =3D> 0xa03=
024 (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_nop: Symbol resolved:  =3D> 0xa03=
048 (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_nop: Symbol resolved:  =3D> 0xa02=
000 (.livepatch.funcs)
(XEN) livepatch_elf.c:319: livepatch: xen_nop: Absolute symbol: xen_nop.c =
=3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_nop: Symbol resolved: $d =3D> 0xa=
02000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_nop: Symbol resolved: livepatch_n=
op =3D> 0xa02000 (.livepatch.funcs)
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.load is missing
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.unload is missi=
ng
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.preapply is mis=
sing
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.apply is missing
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.postapply is mi=
ssing
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.prerevert is mi=
ssing
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.revert is missi=
ng
(XEN) livepatch.c:533: livepatch: xen_nop: .livepatch.hooks.postrevert is m=
issing
(XEN) livepatch.c:962: livepatch: xen_nop: new symbol livepatch_nop
completed(XEN) livepatch: xen_nop: Verifying enabled expectations for all f=
unctions

(XEN) livepatch.c:1501: livepatch: xen_nop: timeout is 30000000ns
Applying xen_nop... (XEN) livepatch.c:1609: livepatch: xen_nop: CPU0 - IPIi=
ng the other 7 CPUs
(XEN) livepatch: xen_nop: Applying 1 functions
(XEN) livepatch: xen_nop finished APPLY with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch revert xen_nop)' =
=2E.(XEN) livepatch.c:1501: livepatch: xen_nop: timeout is 30000000ns
Reverting xen_nop... (XEN) livepatch.c:1609: livepatch: xen_nop: CPU7 - IPI=
ing the other 7 CPUs
(XEN) livepatch: xen_nop: Reverting
(XEN) livepatch: xen_nop finished REVERT with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch apply xen_nop)' .=
=2E(XEN) livepatch: xen_nop: Verifying enabled expectations for all functio=
ns
Applying xen_nop... (XEN) livepatch.c:1501: livepatch: xen_nop: timeout is =
30000000ns
(XEN) livepatch.c:1609: livepatch: xen_nop: CPU1 - IPIing the other 7 CPUs
(XEN) livepatch: xen_nop: Applying 1 functions
(XEN) livepatch: xen_nop finished APPLY with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xl info)' ..host               =
    : hikey960
release                : 4.12.0-linaro-hikey960+
version                : #3 SMP PREEMPT Mon Jul 17 13:26:13 EDT 2017
machine                : aarch64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 1.920
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000=
000:00000000:00000000
virt_caps              :
total_memory           : 2262
free_memory            : 713
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 4
xen_extra              : -unstable
xen_version            : 4.4-unstable
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0x200000
xen_changeset          : Thu Aug 29 15:43:23 2019 +0000 git:0a1b27af47-dirty
xen_commandline        : console=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=
=3Dno-rs dom0_mem=3D1500M hmp-unsafe=3Dtrue
cc_compiler            : gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
cc_compile_by          : root
cc_compile_domain      : lan
cc_compile_date        : Thu Aug 29 17:26:25 UTC 2019
build_id               : 416315091386424648bd584d25c7224ee5b5d998
xend_config_format     : 4
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_nop)' =
=2E.xen_nop is in the wrong state.
Current state: APPLIED
Expected state: CHECKED
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch revert xen_nop)' =
=2E.(XEN) livepatch.c:1501: livepatch: xen_nop: timeout is 30000000ns
Reverting xen_nop... (XEN) livepatch.c:1609: livepatch: xen_nop: CPU6 - IPI=
ing the other 7 CPUs
(XEN) livepatch: xen_nop: Reverting
(XEN) livepatch: xen_nop finished REVERT with rc=3D0
completed
Executing: '(set -e;cd /root/test/livepatch;xen-livepatch unload xen_nop)' =
=2E.Unloading xen_nop... completed
Livepatch test returned 0root@hikey960:~# echo $?
0
root@hikey960:~# xl =08=08=08=1B[K
root@hikey960:~# xen-livepatch load test/livepatch/xen_he=07llo_world.livep=
atch=20
Uploading test/livepatch/xen_hello_world.livepatch... (XEN) livepatch.c:379=
: livepatch: xen_hello_world: Loaded .note.gnu.build-id at 0000000000a04000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .text at 00000000=
00a02000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata at 000000=
0000a04028
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .altinstructions =
at 0000000000a04052
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .altinstr_replace=
ment at 0000000000a04060
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata.str1.8 at=
 0000000000a04068
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .rodata.str at 00=
00000000a040e8
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .bug_frames.1 at =
0000000000a040fc
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.depend=
s at 0000000000a0410c
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.xen_de=
pends at 0000000000a04130
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.funcs =
at 0000000000a03000
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.hooks.=
load at 0000000000a03068
(XEN) livepatch.c:379: livepatch: xen_hello_world: Loaded .livepatch.hooks.=
unload at 0000000000a03078
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04052 (.altinstructions)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04060 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04068 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa040e8 (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa040fc (.bug_frames.1)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa0410c (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa04130 (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved:  =
=3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:319: livepatch: xen_hello_world: Absolute symbol: xen=
_hello_world_func.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa04060 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04068 (.rodata.str1.8)
(XEN) livepatch_elf.c:319: livepatch: xen_hello_world: Absolute symbol: xen=
_hello_world.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $x =
=3D> 0xa02010 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: app=
ly_hook =3D> 0xa02010 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: rev=
ert_hook =3D> 0xa0202c (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: hi_=
func =3D> 0xa02048 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: che=
ck_fnc =3D> 0xa0207c (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa040fc (.bug_frames.1)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: __f=
unc__.4777 =3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: __f=
unc__.4781 =3D> 0xa04030 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: hel=
lo_world_patch_this_fnc =3D> 0xa04040 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: cnt=
 =3D> 0xa03090 (.bss)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: $d =
=3D> 0xa04078 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: .L2=
=021 =3D> 0xa040e8 (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: .L3=
=021 =3D> 0xa040fa (.rodata.str)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_load_data_hi_func =3D> 0xa03068 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: xen=
_hello_world =3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:314: livepatch: xen_hello_world: Undefined symbol res=
olved: xen_extra_version =3D> 0x23cd50
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_check_fnc =3D> 0xa03078 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_load_data_apply_hook =3D> 0xa03070 (.livepatch.hooks.load)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_revert_hook =3D> 0xa03088 (.livepatch.hooks.unload)
(XEN) livepatch_elf.c:314: livepatch: xen_hello_world: Undefined symbol res=
olved: printk =3D> 0x241e2c
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_xen_hello_world =3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:343: livepatch: xen_hello_world: Symbol resolved: liv=
epatch_unload_data_hi_func =3D> 0xa03080 (.livepatch.hooks.unload)
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.preappl=
y is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.apply i=
s missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.postapp=
ly is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.prereve=
rt is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.revert =
is missing
(XEN) livepatch.c:533: livepatch: xen_hello_world: .livepatch.hooks.postrev=
ert is missing
(XEN) alternatives: Patching with alt table 0000000000a04052 -> 0000000000a=
0405e
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol apply_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol revert_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol hi_func
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol check_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol __func__.4777
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol __func__.4781
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol hello_world_p=
atch_this_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol cnt
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_loa=
d_data_hi_func
(XEN) livepatch.c:968: livepatch: xen_hello_world: overriding symbol xen_he=
llo_world
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_check_fnc
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_loa=
d_data_apply_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_revert_hook
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_xen=
_hello_world
(XEN) livepatch.c:962: livepatch: xen_hello_world: new symbol livepatch_unl=
oad_data_hi_func
completed
Applying xen_hello_world... (XEN) livepatch: xen_hello_world: Verifying ena=
bled expectations for all functions
(XEN) livepatch.c:1501: livepatch: xen_hello_world: timeout is 30000000ns
(XEN) livepatch.c:1609: livepatch: xen_hello_world: CPU0 - IPIing the other=
 7 CPUs
(XEN) livepatch: xen_hello_world: Applying 1 functions
(XEN) hi_func: Hi! (called 1 times)
(XEN) Hook executing.
(XEN) livepatch: xen_hello_world finished APPLY with rc=3D0
completed
root@hikey960:~# xl debug-keys x
(XEN) 'x' pressed - Dumping all livepatch patches
(XEN) build-id: 416315091386424648bd584d25c7224ee5b5d998
(XEN)  name=3Dxen_hello_world state=3DAPPLIED(2) 0000000000a02000 (.data=3D=
0000000000a03000, .rodata=3D0000000000a04000) using 3 pages.
(XEN)     xen_extra_version patch 000000000023cd50(12) with 0000000000a0200=
0 (16)
(XEN) build-id=3Dda6f7f5b5de26f9f5581b0e14670d81b2ff8f6bb
(XEN) depend-on=3D416315091386424648bd584d25c7224ee5b5d998
(XEN) depend-on-xen=3D416315091386424648bd584d25c7224ee5b5d998
root@hikey960:~# =1B[A=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B=
[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B=
[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B=
[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B=
[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B=
[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[C=1B[K=20
Uploading ./xen_expectations.livepatch... (XEN) livepatch.c:379: livepatch:=
 xen_expectations: Loaded .note.gnu.build-id at 0000000000a04000
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .text at 0000000=
000a02000
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .rodata at 00000=
00000a04028
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .altinstructions=
 at 0000000000a0403a
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .altinstr_replac=
ement at 0000000000a04048
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .rodata.str1.8 a=
t 0000000000a04050
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .livepatch.depen=
ds at 0000000000a0405c
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .livepatch.xen_d=
epends at 0000000000a04080
(XEN) livepatch.c:379: livepatch: xen_expectations: Loaded .livepatch.funcs=
 at 0000000000a03000
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa04000 (.note.gnu.build-id)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa0403a (.altinstructions)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa04048 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa04050 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa0405c (.livepatch.depends)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa04080 (.livepatch.xen_depends)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved:  =
=3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:319: livepatch: xen_expectations: Absolute symbol: xe=
n_expectations.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: $d=
 =3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: li=
vepatch_exceptions_str =3D> 0xa04028 (.rodata)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: $d=
 =3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch_elf.c:319: livepatch: xen_expectations: Absolute symbol: xe=
n_hello_world_func.c =3D> 0
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: $x=
 =3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: $x=
 =3D> 0xa04048 (.altinstr_replacement)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: $d=
 =3D> 0xa04050 (.rodata.str1.8)
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: xe=
n_hello_world =3D> 0xa02000 (.text)
(XEN) livepatch_elf.c:314: livepatch: xen_expectations: Undefined symbol re=
solved: xen_extra_version =3D> 0x23cd50
(XEN) livepatch_elf.c:343: livepatch: xen_expectations: Symbol resolved: li=
vepatch_exceptions =3D> 0xa03000 (.livepatch.funcs)
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.load i=
s missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.unload=
 is missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.preapp=
ly is missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.apply =
is missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.postap=
ply is missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.prerev=
ert is missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.revert=
 is missing
(XEN) livepatch.c:533: livepatch: xen_expectations: .livepatch.hooks.postre=
vert is missing
(XEN) alternatives: Patching with alt table 0000000000a0403a -> 0000000000a=
04046
(XEN) livepatch.c:962: livepatch: xen_expectations: new symbol livepatch_ex=
ceptions_str
(XEN) livepatch.c:968: livepatch: xen_expectations: overriding symbol xen_h=
ello_world
(XEN) livepatch.c:962: livepatch: xen_expectations: new symbol livepatch_ex=
ceptions
completed
Applying xen_expectations... (XEN) livepatch: xen_expectations: Verifying e=
nabled expectations for all functions
(XEN) livepatch: xen_extra_version: expectation failed: expected:f000024091=
1fe000, actual:400200f000e01f91
(XEN) livepatch: xen_expectations: expectations of xen_extra_version failed=
 (rc=3D-22), aborting!
failed
Error 22: Invalid argument
Unloading xen_expectations... completed
root@hikey960:~/test/livepatch# (cd /home/xen.git/xen;objdump -d xen-syms |=
 sed -n -e '/<xen_extra_version>:$/,/^$/ p' | tail -n +2)
  23cd50:	f0000240 	adrp	x0, 287000 <symbols_sorted_offsets+0xc800>
  23cd54:	911fe000 	add	x0, x0, #0x7f8
  23cd58:	d65f03c0 	ret

root@hikey960:/home/xen.git/xen#=20

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--nFreZHaLTZJo0R7j--

