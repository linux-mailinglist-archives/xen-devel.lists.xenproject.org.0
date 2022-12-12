Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0726498CB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 07:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459059.716730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4br0-0001HT-2J; Mon, 12 Dec 2022 05:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459059.716730; Mon, 12 Dec 2022 05:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4bqz-0001Ek-VU; Mon, 12 Dec 2022 05:59:53 +0000
Received: by outflank-mailman (input) for mailman id 459059;
 Mon, 12 Dec 2022 05:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zalI=4K=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p4bqy-0001Eb-21
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 05:59:53 +0000
Received: from mail.zlw.email (unknown [112.49.95.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29451767-79e2-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 06:59:47 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id 2E9C0174161;
 Mon, 12 Dec 2022 06:00:00 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wFCEGbdjmc0; Mon, 12 Dec 2022 13:59:55 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id 3050C173BFD;
 Mon, 12 Dec 2022 13:59:55 +0800 (CST)
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
X-Inumbo-ID: 29451767-79e2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	in-reply-to:from:from:references:to:content-language:subject
	:subject:user-agent:mime-version:date:date:message-id
	:content-type:content-type; s=dkim; t=1670824795; x=1673416796;
	 bh=3iJAT9mEMpl/tOLUEg1sRfP85jeYQy6CU25idGQmavg=; b=FR4OinYCeF6M
	UB8OEDOeG8uS4vYig5XdphwlYtedgXLSLy02UUwoWWaWaok0f8TNztFoiMgk6LTK
	X+2f/9Fml69Ls7oz/tBARkvFeWSogGPQfWMmrDfTgkq2AmCK/wMH5fhsmLUkuH0K
	JmU5u2PjA9DCi9BDXSXLkqDFJt09gww=
X-Virus-Scanned: amavisd-new at zlw.email
Content-Type: multipart/alternative;
 boundary="------------twmZYvIWUWAfqTa7A2RDV568"
Message-ID: <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
Date: Mon, 12 Dec 2022 13:49:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
From: sisyphean <sisyphean@zlw.email>
In-Reply-To: <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>

This is a multi-part message in MIME format.
--------------twmZYvIWUWAfqTa7A2RDV568
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

在 2022/12/9 17:50, Rahul Singh 写道:
> Hi Sisyphean,
>
> > On 9 Dec 2022, at 6:15 am, sisyphean <sisyphean@zlw.email> wrote:
> >
> > Hi,
> >
> > I try to run XEN on my ARM board(Sorry, for some commercial reasons, 
> I can't tell you
> > on which platform I run XEN)  and add PCIE device passthrough to 
> DomU.But an error
> > occurred while adding the PCIE device to SMMUv3.
>
> PCI passthrough support is not fully upstream to Xen on ARM. We have 
> working
> PCI passthrough branch that you can use to test it.
>
> https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough
>
> >
> > Through reading the code and tracing debugging, the error is found 
> in the function
> > arm_smmu_add_device, which will obtain and determine whether the 
> fwspec of the
> > device to be added to SMMU exists.But for the XEN of arm, the fwspec 
> of the device is
> > created and added by judging whether the iommu field exists in the 
> device node when
> > XEN parses the device tree.However, the PCIE device does not appear 
> in the device tree,
> > so there will be no fwspec for all PCIE devices. When attempting to 
> add a PCIE device to
> > SMMU, a ENODEV error will be returned.
>
> As of now Xen doesn’t support to add PCI device to IOMMU on ARM.
> >
> > In addition, the code at xen/drivers/passthrough/pci.c also verifies 
> the above view.
> > For PCIE devices, pdev is alloc in function pci_add_device by 
> alloc_pdev.However,
> > the function alloc_pdev does not create and add fwspec to the PCIE 
> device.Therefore,
> > when function pci_add_device executes to iommu_add_device,it will 
> get the error
> > return of ENODEV.
> >
> > How can I resolve the above errors?
>
> If you want to test the PCI passthrough please follow below steps.
>
> Xen setup:
>     • A checkout of the “integration/pci-passthrough” branch from the  
> gitlab 
> https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough
>     • Pass iommu=yes  and pci-passthrough=on to Xen command line to 
> enable PCI passthrough.
>
>  Linux Kernel setup:
>
>     • Some changes are required for the kernel to work with PCI 
> passthrough. First are some configuration options, enable them in 
> kernel config.
>          CONFIG_XEN=y
>          CONFIG_XEN_BACKEND=y
>          CONFIG_XEN_PCIDEV_BACKEND=y
>     • Then a patch needs to be applied for enabling the pciback 
> driver. Patch is attached in this email.
>
> Using PCI passthrough:
>
>     • In order to pass a device to a guest, you first need its PCI 
> address(SBDF). You can either get it from a bare-metal
>       Linux running on the platform or by having pciutils installed 
> (if you are using a yocto-based dom0 or have apt available), which 
> provides lspci.
>
>      For example, let's pass one ethernet interface to the guest. 
> Running lspci gives us this output (truncated) :
>        0000:00:00.0 Host bridge: Ampere Computing, LLC Device e100
>        0000:00:01.0 PCI bridge: Ampere Computing, LLC Device e101 (rev 04)
>        0000:01:00.0 Ethernet controller: Intel Corporation Ethernet 
> Controller X710/X557-AT 10GBASE-T (rev 01)
>                [...]
>
>      We will pass one of the ethernet from the PCI network card : 
> 0000:01:00.0 .
>
>     • Add the following line to the guest configuration file :
>           pci = ['0000:01:00.0']
>
>     • Run the following command before starting the guest :
>            xl pci-assignable-add 0000:01:00.0
>     • Start the guest. The network interface should appear as 00:00.0  
> in the guest and be usable.
>
> Please let me know if you need more info.
>
>
>
> Regards,
> Rahul
>
Thank you for your reply.

After setting XEN and kernel as above, I tried the following two methods 
to add a PCIE device passthrough:

1. According to your suggestion, use the command xl pci-assignable-add 
0002:21:00.0 to set in the Dom0. But in function
iommu_do_pci_domctl,  after device_assigned is called, ENODEV error is 
obtained.

2. Add xen-pciback.hide=(0002:21:00.0) to dom0-bootargs in the device 
tree, I encountered the same problem as before
when initializing the kernel. In function pci_add_device, PCIE devices 
cannot be added to SMMUv3.

The kernel version I use is 5.10. Does this have an impact?

In addition, an error was encountered after XEN enabling ITS:

In function gicv3_cpu_init, gicv3_its_setup_collection return 
-ETIMEDOUT. This problem was solved after I made the
following changes:

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9558bad..a12c0d1 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -118,11 +118,11 @@ static int its_send_command(struct host_its 
*hw_its, const void *its_cmd)
      }

      memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
-    if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
+    // if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
          clean_and_invalidate_dcache_va_range(hw_its->cmd_buf + writep,
                                               ITS_CMD_SIZE);
-    else
-        dsb(ishst);
+    // else
+    //     dsb(ishst);

      writep = (writep + ITS_CMD_SIZE) % ITS_CMD_QUEUE_SZ;
      writeq_relaxed(writep & BUFPTR_MASK, hw_its->its_base + GITS_CWRITER);

Cheers,

--
Sisyphean

--------------twmZYvIWUWAfqTa7A2RDV568
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">在 2022/12/9 17:50, Rahul Singh 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">Hi Sisyphean,<br>
              <br>
              &gt; On 9 Dec 2022, at 6:15 am, sisyphean
              <a class="moz-txt-link-rfc2396E" href="mailto:sisyphean@zlw.email">&lt;sisyphean@zlw.email&gt;</a> wrote:<br>
              &gt; <br>
              &gt; Hi,<br>
              &gt; <br>
              &gt; I try to run XEN on my ARM board(Sorry, for some
              commercial reasons, I can't tell you<br>
              &gt; on which platform I run XEN)  and add PCIE device
              passthrough to DomU.But an error<br>
              &gt; occurred while adding the PCIE device to SMMUv3.<br>
              <br>
              PCI passthrough support is not fully upstream to Xen on
              ARM. We have working<br>
              PCI passthrough branch that you can use to test it. <br>
              <br>
              <a
href="https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough</a><br>
              <br>
              &gt; <br>
              &gt; Through reading the code and tracing debugging, the
              error is found in the function<br>
              &gt; arm_smmu_add_device, which will obtain and determine
              whether the fwspec of the<br>
              &gt; device to be added to SMMU exists.But for the XEN of
              arm, the fwspec of the device is<br>
              &gt; created and added by judging whether the iommu field
              exists in the device node when<br>
              &gt; XEN parses the device tree.However, the PCIE device
              does not appear in the device tree,<br>
              &gt; so there will be no fwspec for all PCIE devices. When
              attempting to add a PCIE device to<br>
              &gt; SMMU, a ENODEV error will be returned.<br>
              <br>
              As of now Xen doesn’t support to add PCI device to IOMMU
              on ARM. <br>
              &gt; <br>
              &gt; In addition, the code at
              xen/drivers/passthrough/pci.c also verifies the above
              view.<br>
              &gt; For PCIE devices, pdev is alloc in function
              pci_add_device by alloc_pdev.However,<br>
              &gt; the function alloc_pdev does not create and add
              fwspec to the PCIE device.Therefore,<br>
              &gt; when function pci_add_device executes to
              iommu_add_device,it will get the error<br>
              &gt; return of ENODEV.<br>
              &gt; <br>
              &gt; How can I resolve the above errors?<br>
              <br>
              If you want to test the PCI passthrough please follow
              below steps.<br>
              <br>
              Xen setup:<br>
                  • A checkout of the “integration/pci-passthrough”
              branch from the  gitlab <a
href="https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough"
                moz-do-not-send="true" class="moz-txt-link-freetext">
https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough</a><br>
                  • Pass iommu=yes  and pci-passthrough=on to Xen
              command line to enable PCI passthrough.<br>
              <br>
               Linux Kernel setup:<br>
               <br>
                  • Some changes are required for the kernel to work
              with PCI passthrough. First are some configuration
              options, enable them in kernel config.<br>
                       CONFIG_XEN=y<br>
                       CONFIG_XEN_BACKEND=y<br>
                       CONFIG_XEN_PCIDEV_BACKEND=y<br>
                  • Then a patch needs to be applied for enabling the
              pciback driver. Patch is attached in this email.<br>
               <br>
              Using PCI passthrough:<br>
               <br>
                  • In order to pass a device to a guest, you first need
              its PCI address(SBDF). You can either get it from a
              bare-metal<br>
                    Linux running on the platform or by having pciutils 
              installed (if you are using a yocto-based dom0 or have apt
              available), which provides lspci.<br>
               <br>
                   For example, let's pass one ethernet interface to the
              guest. Running lspci gives us this output (truncated) :<br>
                     0000:00:00.0 Host bridge: Ampere Computing, LLC
              Device e100<br>
                     0000:00:01.0 PCI bridge: Ampere Computing, LLC
              Device e101 (rev 04)<br>
                     0000:01:00.0 Ethernet controller: Intel Corporation
              Ethernet Controller X710/X557-AT 10GBASE-T (rev 01)<br>
                             [...]<br>
               <br>
                   We will pass one of the ethernet from the PCI network
              card : 0000:01:00.0 .<br>
               <br>
                  • Add the following line to the guest configuration
              file :<br>
                        pci = ['0000:01:00.0']<br>
               <br>
                  • Run the following command before starting the guest
              :<br>
                         xl pci-assignable-add 0000:01:00.0<br>
                  • Start the guest. The network interface should appear
              as 00:00.0  in the guest and be usable.<br>
               <br>
              Please let me know if you need more info.<br>
              <br>
            </div>
          </span></font></div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText"><br>
              <br>
              Regards,<br>
              Rahul<br>
              <br>
            </div>
          </span></font></div>
    </blockquote>
    <p><font size="2">Thank you for your reply.</font></p>
    <p><font size="2">After setting XEN and kernel as above, I tried the
        following two methods to add a PCIE device passthrough:</font></p>
    <p><font size="2">1. According to your suggestion, use the command
        xl pci-assignable-add 0002:21:00.0 to set in the Dom0. But in
        function<br>
        iommu_do_pci_domctl,  after device_assigned is called, ENODEV
        error is obtained.<br>
      </font></p>
    <p><font size="2">2. Add xen-pciback.hide=(0002:21:00.0) to
        dom0-bootargs in the device tree, I encountered the same problem
        as before <br>
        when initializing the kernel. In function pci_add_device, PCIE
        devices cannot be added to SMMUv3.<br>
      </font></p>
    <p><font size="2">The kernel version I use is 5.10. Does this have
        an impact?<br>
      </font></p>
    <p><font size="2">In addition, an error was encountered after XEN
        enabling ITS:</font></p>
    <p><font size="2">In function gicv3_cpu_init,
        gicv3_its_setup_collection return -ETIMEDOUT. This problem was
        solved after I made the<br>
        following changes:</font></p>
    <p><font size="2">diff --git a/xen/arch/arm/gic-v3-its.c
        b/xen/arch/arm/gic-v3-its.c<br>
        index 9558bad..a12c0d1 100644<br>
        --- a/xen/arch/arm/gic-v3-its.c<br>
        +++ b/xen/arch/arm/gic-v3-its.c<br>
        @@ -118,11 +118,11 @@ static int its_send_command(struct
        host_its *hw_its, const void *its_cmd)<br>
             }<br>
         <br>
             memcpy(hw_its-&gt;cmd_buf + writep, its_cmd, ITS_CMD_SIZE);<br>
        -    if ( hw_its-&gt;flags &amp; HOST_ITS_FLUSH_CMD_QUEUE )<br>
        +    // if ( hw_its-&gt;flags &amp; HOST_ITS_FLUSH_CMD_QUEUE )<br>
                 clean_and_invalidate_dcache_va_range(hw_its-&gt;cmd_buf
        + writep,<br>
                                                      ITS_CMD_SIZE);<br>
        -    else<br>
        -        dsb(ishst);<br>
        +    // else<br>
        +    //     dsb(ishst);<br>
         <br>
             writep = (writep + ITS_CMD_SIZE) % ITS_CMD_QUEUE_SZ;<br>
             writeq_relaxed(writep &amp; BUFPTR_MASK,
        hw_its-&gt;its_base + GITS_CWRITER);<br>
      </font></p>
    <p><font size="2">Cheers,</font></p>
    <p><font size="2">--<br>
        Sisyphean<br>
      </font></p>
  </body>
</html>

--------------twmZYvIWUWAfqTa7A2RDV568--

