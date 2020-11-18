Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808B2B7D90
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 13:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29795.59465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfMVA-0008LL-Id; Wed, 18 Nov 2020 12:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29795.59465; Wed, 18 Nov 2020 12:23:56 +0000
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
	id 1kfMVA-0008Kw-Eu; Wed, 18 Nov 2020 12:23:56 +0000
Received: by outflank-mailman (input) for mailman id 29795;
 Wed, 18 Nov 2020 12:23:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfMV9-0008Kr-HL
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:23:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfMV8-0002g8-Vm; Wed, 18 Nov 2020 12:23:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfMV9-0008Kr-HL
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:23:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfMV8-0002g8-Vm; Wed, 18 Nov 2020 12:23:55 +0000
Subject: Re: AW: AW: AW: AW: Xen data from meta-virtualization layer
To: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Leo Krueger <leo.krueger@zal.aero>
Cc: Peng Fan <peng.fan@nxp.com>, "brucea@xilinx.com" <brucea@xilinx.com>,
 Cornelia Bruelhart <cornelia.bruelhart@zal.aero>,
 oleksandr_andrushchenko@epam.com, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com
References: <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <HE1PR05MB47941E23CE053CE72F18867C8BEA0@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011091858010.21307@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794B5C57A54A29A48EE8EAE8BE90@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s>
 <DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <5dc63ee2-f1ce-31fc-cb6a-fe4dae929fb3@xen.org>
Date: Wed, 18 Nov 2020 12:23:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 17/11/2020 23:53, Stefano Stabellini wrote:
> Adding Bertrand, Oleksandr, Julien, and others -- they have a more
> recent experience with GICv3 ITS than me and might be able to help.
> I am attaching the device tree Leo sent a few days ago for reference.
> 
> 
> Typically when you can set the ethernet link up and no packets are
> exchanged it is because of a missing interrupt. In this case a missing
> MSI.
> 
> Bertrand, I believe you tried the GIC ITS driver with PCI devices
> recently. It is expected to work correctly with MSIs in Dom0, right?

OSSTest has some hardware (e.g. Thunder-X) where ITS is required to boot 
Dom0. I haven't seen any failure on recent Xen. We are testing 4.11 and 
onwards on Thunder-X.

However, it may be possible that some more work is necessary for other 
hardware (e.g. workaround, missing code...). See more below.

> 
> 
> 
> On Tue, 17 Nov 2020, Leo Krueger wrote:
>> Hi,
>>
>> I enabled CONFIG_HAS_ITS (what a stupid mistake by me to not set it before...) but then had to add the following node to my device tree
>>
>> 	gic_lpi_base: syscon@0x80000000 {
>> 		compatible = "gic-lpi-base";

I couldn't find this compatible defined/used in Linux 5.10-rc4. @Leo, 
could you clarify which flavor/version of Linux you are using?

>> 		reg = <0x0 0x80000000 0x0 0x100000>;
>> 		max-gic-redistributors = <2>;
>> 	};
>>
>> to somehow change something in regard to the ITS and MSI/MSI-X
>>
>> (XEN) GICv3 initialization:
>> (XEN)       gic_dist_addr=0x00000006000000
>> (XEN)       gic_maintenance_irq=25
>> (XEN)       gic_rdist_stride=0
>> (XEN)       gic_rdist_regions=1
>> (XEN)       redistributor regions:
>> (XEN)         - region 0: 0x00000006040000 - 0x00000006080000
>> (XEN) GICv3: using at most 57344 LPIs on the host.
>> (XEN) GICv3: 288 lines, (IID 0001143b).
>> (XEN) GICv3: Found ITS @0x6020000
>> (XEN) using non-cacheable ITS command queue
>> (XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000
>>
>> [    0.000000] GICv3: Distributor has no Range Selector support
>> [    0.000000] GICv3: no VLPI support, no direct LPI support
>> [    0.000000] ITS [mem 0x06020000-0x0603ffff]
>> [    0.000000] ITS@0x0000000006020000: allocated 65536 Devices @dc880000 (flat, esz 8, psz 64K, shr 1)
>> [    0.000000] ITS@0x0000000006020000: allocated 32768 Interrupt Collections @dc820000 (flat, esz 2, psz 64K, shr 1)
>> [    0.000000] GIC: using LPI property table @0x00000000dc830000
>> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000006040000
>> [    0.000000] CPU0: using LPI pending table @0x00000000dc840000
>> ...
>> [    0.040080] Platform MSI: gic-its domain created
>> [    0.040136] PCI/MSI: /interrupt-controller/gic-its domain created
>> [    0.040181] fsl-mc MSI: /interrupt-controller/gic-its domain created
>>
>>
>> Still I am ending up with the " Failed to add - passthrough or MSI/MSI-X might fail!" log messages for some PCI devices, but at least the on-board ethernet ports (fsl_enetc ) are initialized.
>> I can set the link up and a link is successfully established.

This message is normal. Xen on Arm is not yet aware of PCI devices and 
therefore the hypercalls to add PCI devices will return -EOPNOTSUPP.

However, this is not an issue because the virtual ITS implementation 
will allow dom0 to configure any devices.

>>
>> But (!) I cannot receive or transmit anything (no error message...) and there seem to be no interrupts:
>>
>> 29:          0   ITS-MSI   1 Edge      gbe0-rxtx0
>>   32:          0   ITS-MSI 8192 Edge      ptp_qoriq
>>
>> (from /proc/interrupts).
>>
>> Any idea on this one? I keep digging and checking whether my device tree needs some additional fixes.

Can you apply patch [1] and provide the logs? This will dump more 
information about the command received by the vITS and the one send to 
the host ITS.

Note that Xen will need to be build with CONFIG_DEBUG=y in order to get 
some of the messages.

[...]

>>>> [    0.000000] GICv3: Distributor has no Range Selector support
>>>>
>>>> [    0.000000] GICv3: no VLPI support, no direct LPI support
>>>>
>>>> [    0.000000] GICv3: CPU0: found redistributor 0 region
>>>> 0:0x0000000006040000
>>>
>>> "no VLPI support" is very suspicious, it looks like Dom0 doesn't find any ITS
>>> support.
VLPI is a feature that was introduced in GICv4 to directly inject LPI in 
the guest. So this is normal to see this message when running on Xen 
because we are going to only expose a GICv3 to a domain until at least 
we support nested virt.

However, you were right about that Xen didn't expose the ITS because the 
following lines were missing:

[    0.000000] ITS@0x0000000006020000: allocated 65536 Devices @dc880000 
(flat, esz 8, psz 64K, shr 1)

Cheers,

[1]
diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9558bad96ac3..8a0a02308e74 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -87,6 +87,10 @@ static int its_send_command(struct host_its *hw_its, 
const void *its_cmd)
      /* No ITS commands from an interrupt handler (at the moment). */
      ASSERT(!in_irq());

+    printk(XENLOG_WARNING, "pITS  cmd 0x%02lx: %016lx %016lx %016lx 
%016lx\n",
+           its_cmd_get_command(command),
+           command[0], command[1], command[2], command[3]);
+
      spin_lock(&hw_its->cmd_lock);

      do {
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 869bc97fa1aa..e7c5bcd8d423 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -183,7 +183,10 @@ void gicv3_do_LPI(unsigned int lpi)
      /* Find out if a guest mapped something to this physical LPI. */
      hlpip = gic_get_host_lpi(lpi);
      if ( !hlpip )
+    {
+        printk("%s: Received LPI %u but it is not mapped?\n", __func__, 
lpi);
          goto out;
+    }

      hlpi.data = read_u64_atomic(&hlpip->data);

@@ -222,6 +225,9 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, 
int domain_id,
  {
      union host_lpi *hlpip, hlpi;

+    printk("%s: host_lpi %u domain %d virq_lpi %u\n",
+           __func__, host_lpi, domain_id, virq_lpi);
+
      ASSERT(host_lpi >= LPI_OFFSET);

      host_lpi -= LPI_OFFSET;
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 58d939b85f92..89ef137b3e6b 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -897,7 +897,7 @@ out_unlock:

  static void dump_its_command(uint64_t *command)
  {
-    gdprintk(XENLOG_WARNING, "  cmd 0x%02lx: %016lx %016lx %016lx 
%016lx\n",
+    gdprintk(XENLOG_WARNING, "vITS  cmd 0x%02lx: %016lx %016lx %016lx 
%016lx\n",
               its_cmd_get_command(command),
               command[0], command[1], command[2], command[3]);
  }
@@ -926,6 +926,8 @@ static int vgic_its_handle_cmds(struct domain *d, 
struct virt_its *its)
          if ( ret )
              return ret;

+        dump_its_command(command);
+
          switch ( its_cmd_get_command(command) )
          {
          case GITS_CMD_CLEAR:


-- 
Julien Grall

