Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E257292AE2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 17:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8766.23551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUXSI-0002iL-Vh; Mon, 19 Oct 2020 15:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8766.23551; Mon, 19 Oct 2020 15:52:14 +0000
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
	id 1kUXSI-0002hw-SG; Mon, 19 Oct 2020 15:52:14 +0000
Received: by outflank-mailman (input) for mailman id 8766;
 Mon, 19 Oct 2020 15:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xInf=D2=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1kUXSH-0002hr-Bi
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:52:13 +0000
Received: from asav22.altibox.net (unknown [109.247.116.9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6946994f-7421-43fc-95de-0f4a55e99e9a;
 Mon, 19 Oct 2020 15:52:09 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no
 (148-252-96.12.3p.ntebredband.no [148.252.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 39D3D20053;
 Mon, 19 Oct 2020 17:52:07 +0200 (CEST)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 5E9A3625EC1A;
 Mon, 19 Oct 2020 17:52:06 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id 043FD2410673;
 Mon, 19 Oct 2020 17:52:06 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xInf=D2=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
	id 1kUXSH-0002hr-Bi
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:52:13 +0000
X-Inumbo-ID: 6946994f-7421-43fc-95de-0f4a55e99e9a
Received: from asav22.altibox.net (unknown [109.247.116.9])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6946994f-7421-43fc-95de-0f4a55e99e9a;
	Mon, 19 Oct 2020 15:52:09 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no (148-252-96.12.3p.ntebredband.no [148.252.96.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hakon.alstadheim@ntebb.no)
	by asav22.altibox.net (Postfix) with ESMTPSA id 39D3D20053;
	Mon, 19 Oct 2020 17:52:07 +0200 (CEST)
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
	by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 5E9A3625EC1A;
	Mon, 19 Oct 2020 17:52:06 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: hakon)
	by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id 043FD2410673;
	Mon, 19 Oct 2020 17:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alstadheim.priv.no;
	s=smtp; t=1603122726;
	bh=gCQkAYoXZAqzIbnZy6o19rInCC30/RPKQBAXmh1Gs2k=;
	h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
	b=nQ2v03XQ/gS4QguIdw2gm5OBq5n1vLZVlC1ZegGW4r/thR7n1GzwfUWMikF4EjQEL
	 dBo938sjwNFHsaHSTp6T6cSUJNL4WLfm7KOYOF6QoKrICKB563vjPuX1AZSJYQlNWi
	 aMS4e6IyNOwXWsoFsgeEGTeTSilgN4tg8lDa/nU4=
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
To: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>
Cc: Rich Persaud <persaur@gmail.com>, =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?=
 <pasik@iki.fi>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jan Beulich <JBeulich@suse.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <646A4BEA-C544-4C62-A7A3-B736D3860912@gmail.com>
 <20200131153332.r4oe3sadhvoly7ho@debian>
 <A325DB30-0282-4512-96D4-06AE661ADB5A@citrix.com>
 <30109c0a-3aa3-8af7-dadf-66f508071963@alstadheim.priv.no>
Message-ID: <2d2693c9-f2a9-7914-7362-947a61c28acd@alstadheim.priv.no>
Date: Mon, 19 Oct 2020 17:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <30109c0a-3aa3-8af7-dadf-66f508071963@alstadheim.priv.no>
Content-Type: multipart/mixed;
 boundary="------------33D4BB3561895DBA69F01C76"
Content-Language: en-US
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Du94Bl3+ c=1 sm=1 tr=0
	a=pSdy67GPd25lyaVjMobptA==:117 a=pSdy67GPd25lyaVjMobptA==:17
	a=afefHYAZSVUA:10 a=M51BFTxLslgA:10 a=r77TgQKjGQsHNAKrUKIA:9
	a=mLnsDVdbAAAA:8 a=i0ZhjynrcT7MiOowqgUA:9 a=QEXdDO2ut3YA:10
	a=KNCrymi1MkcA:10 a=n3xS-gtqsLMA:10 a=L6mzFnP-7RsA:10 a=LJOHJtgqUKgA:10
	a=1T5jtObTL9Je9aXSS0AA:9 a=sdNDni57TT4C-w57:21 a=IGFs5n7OhTyz5cud:21
	a=B2y7HmGcmWMA:10 a=cWRNjhkoAAAA:8 a=wbyiEnzrXmTRt8bfFNkA:9
	a=e_foPgPAjL4A:10 a=ErHS4BFoGQUSCPzqX2cA:9 a=uJ3BPXZVW3gA:10
	a=xnp1pY6zelCj5OLna2To:22 a=sVa6W5Aao32NNC1mekxh:22

This is a multi-part message in MIME format.
--------------33D4BB3561895DBA69F01C76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Den 19.10.2020 17:16, skrev Håkon Alstadheim:
> Den 19.10.2020 13:00, skrev George Dunlap:
>>
>>> On Jan 31, 2020, at 3:33 PM, Wei Liu <wl@xen.org> wrote:
>>>
>>> On Fri, Jan 17, 2020 at 02:13:04PM -0500, Rich Persaud wrote:
>>>> On Aug 26, 2019, at 17:08, Pasi Kärkkäinen <pasik@iki.fi> wrote:
>>>>> ﻿Hi,
>>>>>
>>>>>> On Mon, Oct 08, 2018 at 10:32:45AM -0400, Boris Ostrovsky wrote:
>>>>>>> On 10/3/18 11:51 AM, Pasi Kärkkäinen wrote:
>>>>>>> On Wed, Sep 19, 2018 at 11:05:26AM +0200, Roger Pau Monné wrote:
>>>>>>>> On Tue, Sep 18, 2018 at 02:09:53PM -0400, Boris Ostrovsky wrote:
>>>>>>>>> On 9/18/18 5:32 AM, George Dunlap wrote:
>>>>>>>>>>> On Sep 18, 2018, at 8:15 AM, Pasi Kärkkäinen <pasik@iki.fi> 
>>>>>>>>>>> wrote:
>>>>>>>>>>> Hi,
>>>>>>>>>>> On Mon, Sep 17, 2018 at 02:06:02PM -0400, Boris Ostrovsky 
>>>>>>>>>>> wrote:
>>>>>>>>>>>> What about the toolstack changes? Have they been accepted? 
>>>>>>>>>>>> I vaguely
>>>>>>>>>>>> recall there was a discussion about those changes but don't 
>>>>>>>>>>>> remember how
>>>>>>>>>>>> it ended.
>>>>>>>>>>> I don't think toolstack/libxl patch has been applied yet 
>>>>>>>>>>> either.
>>>>>>>>>>> "[PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS 
>>>>>>>>>>> attribute":
>>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html 
>>>>>>>>>>>
>>>>>>>>>>> "[PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' 
>>>>>>>>>>> SysFS attribute":
>>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html 
>>>>>>>>>>>
>>>>>>>>> Will this patch work for *BSD? Roger?
>>>>>>>> At least FreeBSD don't support pci-passthrough, so none of this 
>>>>>>>> works
>>>>>>>> ATM. There's no sysfs on BSD, so much of what's in libxl_pci.c 
>>>>>>>> will
>>>>>>>> have to be moved to libxl_linux.c when BSD support is added.
>>>>>>> Ok. That sounds like it's OK for the initial pci 'reset' 
>>>>>>> implementation in xl/libxl to be linux-only..
>>>>>> Are these two patches still needed? ISTR they were written 
>>>>>> originally
>>>>>> to deal with guest trying to use device that was previously 
>>>>>> assigned to
>>>>>> another guest. But pcistub_put_pci_dev() calls
>>>>>> __pci_reset_function_locked() which first tries FLR, and it looks 
>>>>>> like
>>>>>> it was added relatively recently.
>>>>> Replying to an old thread.. I only now realized I forgot to reply 
>>>>> to this message earlier.
>>>>>
>>>>> afaik these patches are still needed. Håkon (CC'd) wrote to me in 
>>>>> private that
>>>>> he gets a (dom0) Linux kernel crash if he doesn't have these 
>>>>> patches applied.
>>>>>
>>>>>
>>>>> Here are the links to both the linux kernel and libxl patches:
>>>>>
>>>>>
>>>>> "[Xen-devel] [PATCH V3 0/2] Xen/PCIback: PCI reset using 'reset' 
>>>>> SysFS attribute":
>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00659.html
>>>>>
>>>>> [Note that PATCH V3 1/2 "Drivers/PCI: Export pcie_has_flr() 
>>>>> interface" is already applied in upstream linux kernel, so it's 
>>>>> not needed anymore]
>>>>>
>>>>> "[Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI 
>>>>> flr/slot/bus reset with 'reset' SysFS attribute":
>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00661.html
>>>>>
>>>>>
>>>>> "[Xen-devel] [PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' 
>>>>> SysFS attribute":
>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>>>>>
>>>>> "[Xen-devel] [PATCH V1 1/1] Xen/libxl: Perform PCI reset using 
>>>>> 'reset' SysFS attribute":
>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html
>>>> [dropping Linux mailing lists]
>>>>
>>>> What is required to get the Xen patches merged?  Rebasing against Xen
>>>> master?  OpenXT has been carrying a similar patch for many years and
>>>> we would like to move to an upstream implementation.  Xen users of PCI
>>>> passthrough would benefit from more reliable device reset.
>>> Rebase and resend?
>>>
>>> Skimming that thread I think the major concern was backward
>>> compatibility. That seemed to have been addressed.
>>>
>>> Unfortunately I don't have the time to dig into Linux to see if the
>>> claim there is true or not.
>>>
>>> It would be helpful to write a concise paragraph to say why backward
>>> compatibility is not required.
>> Just going through my old “make sure something happens with this” 
>> mails.  Did anything ever happen with this?  Who has the ball here / 
>> who is this stuck on?
>
> We're waiting for "somebody" to testify that fixing this will not 
> adversely affect anyone. I'm not qualified, but my strong belief is 
> that since "reset" or "do_flr"  in the linux kernel is not currently 
> implemented/used in any official distribution, it should be OK.
>
> Patches still work in current staging-4.14 btw.
>
Just for the record, attached are the patches I am running on top of 
linux gentoo-sources-5.9.1  and xen-staging-4.14 respectively. (I am 
also running with the patch to mark populated reserved memory that 
contains ACPI tables as "ACPI NVS", not attached here ).


--------------33D4BB3561895DBA69F01C76
Content-Type: text/x-patch; charset=UTF-8;
 name="pci_brute_reset-home-hack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pci_brute_reset-home-hack.patch"

--- a/drivers/xen/xen-pciback/pci_stub.c	2020-03-30 21:08:39.406994339 +0200
+++ b/drivers/xen/xen-pciback/pci_stub.c	2020-03-30 20:56:18.225810279 +0200
@@ -245,6 +245,90 @@
 	return found_dev;
 }
 
+struct pcistub_args {
+	struct pci_dev *dev;
+	unsigned int dcount;
+};
+
+static int pcistub_search_dev(struct pci_dev *dev, void *data)
+{
+	struct pcistub_device *psdev;
+	struct pcistub_args *arg = data;
+	bool found_dev = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pcistub_devices_lock, flags);
+
+	list_for_each_entry(psdev, &pcistub_devices, dev_list) {
+		if (psdev->dev == dev) {
+			found_dev = true;
+			arg->dcount++;
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
+
+	/* Device not owned by pcistub, someone owns it. Abort the walk */
+	if (!found_dev)
+		arg->dev = dev;
+
+	return found_dev ? 0 : 1;
+}
+
+static int pcistub_reset_dev(struct pci_dev *dev)
+{
+	struct xen_pcibk_dev_data *dev_data;
+	bool slot = false, bus = false;
+	struct pcistub_args arg = {};
+
+	if (!dev)
+		return -EINVAL;
+
+	dev_dbg(&dev->dev, "[%s]\n", __func__);
+
+	if (!pci_probe_reset_slot(dev->slot))
+		slot = true;
+	else if ((!pci_probe_reset_bus(dev->bus)) &&
+		 (!pci_is_root_bus(dev->bus)))
+		bus = true;
+
+	if (!bus && !slot)
+		return -EOPNOTSUPP;
+
+	/*
+	 * Make sure all devices on this bus are owned by the
+	 * PCI backend so that we can safely reset the whole bus.
+	 */
+	pci_walk_bus(dev->bus, pcistub_search_dev, &arg);
+
+	/* All devices under the bus should be part of pcistub! */
+	if (arg.dev) {
+		dev_err(&dev->dev, "%s device on bus 0x%x is not owned by pcistub\n",
+			pci_name(arg.dev), dev->bus->number);
+
+		return -EBUSY;
+	}
+
+	dev_dbg(&dev->dev, "pcistub owns %d devices on bus 0x%x\n",
+		arg.dcount, dev->bus->number);
+
+	dev_data = pci_get_drvdata(dev);
+	if (!pci_load_saved_state(dev, dev_data->pci_saved_state))
+		pci_restore_state(dev);
+
+	/* This disables the device. */
+	xen_pcibk_reset_device(dev);
+
+	/* Cleanup up any emulated fields */
+	xen_pcibk_config_reset_dev(dev);
+
+	dev_dbg(&dev->dev, "resetting %s device using %s reset\n",
+		pci_name(dev), slot ? "slot" : "bus");
+
+	return pci_reset_bus(dev);
+}
+
 /*
  * Called when:
  *  - XenBus state has been reconfigure (pci unplug). See xen_pcibk_remove_device
@@ -1492,6 +1576,33 @@
 }
 static DRIVER_ATTR_RW(allow_interrupt_control);
 
+static ssize_t reset_store(struct device_driver *drv, const char *buf,
+			      size_t count)
+{
+	struct pcistub_device *psdev;
+	int domain, bus, slot, func;
+	int err;
+
+	err = str_to_slot(buf, &domain, &bus, &slot, &func);
+	if (err)
+		return err;
+
+	psdev = pcistub_device_find(domain, bus, slot, func);
+	if (psdev) {
+		err = pcistub_reset_dev(psdev->dev);
+		pcistub_device_put(psdev);
+	} else {
+		err = -ENODEV;
+	}
+
+	if (!err)
+		err = count;
+
+	return err;
+}
+
+static DRIVER_ATTR_WO(reset);
+
 static void pcistub_exit(void)
 {
 	driver_remove_file(&xen_pcibk_pci_driver.driver, &driver_attr_new_slot);
@@ -1507,6 +1618,8 @@
 			   &driver_attr_irq_handlers);
 	driver_remove_file(&xen_pcibk_pci_driver.driver,
 			   &driver_attr_irq_handler_state);
+	driver_remove_file(&xen_pcibk_pci_driver.driver,
+			   &driver_attr_reset);
 	pci_unregister_driver(&xen_pcibk_pci_driver);
 }
 
@@ -1603,6 +1716,11 @@
 	if (!err)
 		err = driver_create_file(&xen_pcibk_pci_driver.driver,
 					&driver_attr_irq_handler_state);
+
+	if (!err)
+		err = driver_create_file(&xen_pcibk_pci_driver.driver,
+					 &driver_attr_reset);
+
 	if (err)
 		pcistub_exit();
 

--------------33D4BB3561895DBA69F01C76
Content-Type: text/x-patch; charset=UTF-8;
 name="pci_brute_reset-home-hack-doc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pci_brute_reset-home-hack-doc.patch"

--- a/Documentation/ABI/testing/sysfs-driver-pciback	2020-03-30 00:25:41.000000000 +0200
+++ b/Documentation/ABI/testing/sysfs-driver-pciback	2020-03-30 21:01:58.909583316 +0200
@@ -12,6 +12,19 @@
                 will allow the guest to read and write to the configuration
                 register 0x0E.
 
+
+What:           /sys/bus/pci/drivers/pciback/reset
+Date:           Nov 2017
+KernelVersion:  none
+Contact:        xen-devel@lists.xenproject.org
+Description:
+                An option to perform a slot or bus reset when a PCI device
+		is owned by Xen PCI backend. Writing a string of DDDD:BB:DD.F
+		will cause the pciback driver to perform a slot or bus reset
+		if the device supports it. It also checks to make sure that
+		all of the devices under the bridge are owned by Xen PCI
+		backend.
+
 What:           /sys/bus/pci/drivers/pciback/allow_interrupt_control
 Date:           Jan 2020
 KernelVersion:  5.6

--------------33D4BB3561895DBA69F01C76
Content-Type: text/x-patch; charset=UTF-8;
 name="pci-reset-min-egen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pci-reset-min-egen.patch"

--- a/tools/libxl/libxl_pci.c	2020-04-09 09:26:54.000000000 +0200
+++ b/tools/libxl/libxl_pci.c	2020-04-14 23:39:12.830752851 +0200
@@ -1452,7 +1452,7 @@
     char *reset;
     int fd, rc;
 
-    reset = GCSPRINTF("%s/do_flr", SYSFS_PCIBACK_DRIVER);
+    reset = GCSPRINTF("%s/reset", SYSFS_PCIBACK_DRIVER);
     fd = open(reset, O_WRONLY);
     if (fd >= 0) {
         char *buf = GCSPRINTF(PCI_BDF, domain, bus, dev, func);

--------------33D4BB3561895DBA69F01C76--

