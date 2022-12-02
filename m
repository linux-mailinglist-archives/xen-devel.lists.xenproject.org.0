Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C336403CE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451758.709528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12jt-0001Jn-DO; Fri, 02 Dec 2022 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451758.709528; Fri, 02 Dec 2022 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12jt-0001HJ-AA; Fri, 02 Dec 2022 09:53:49 +0000
Received: by outflank-mailman (input) for mailman id 451758;
 Fri, 02 Dec 2022 09:53:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p12jr-0001HD-RT
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:53:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p12jo-0006W1-3G; Fri, 02 Dec 2022 09:53:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p12jn-0001QU-T0; Fri, 02 Dec 2022 09:53:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=1N+kd9SOJWC8ZGNBOYwaGBvTv+xiwpis+8gpeicTk+4=; b=uVS8/8gD6r3mZ0stGA9b5DZnD/
	z7U4mIbPp3MFjsrLDVYJDRTSCbjqpUNIvPafEgMfGMsOcKXB4oCJR8DuHz6DOeeIPdz1sPFM5s2Xv
	pJZWmOTefC7EnlQbisWRMtnFITiv1aStN43TSdt6FYXdNsjxk2+3OSMPIoJWAzWFbX78=;
Message-ID: <a534bc75-7877-cf02-6493-777dc064e42b@xen.org>
Date: Fri, 2 Dec 2022 09:53:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Content-Language: en-US
To: "Garhwal, Vikram" <vikram.garhwal@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
 <MW3PR12MB44096CC3AD5CD01D6043B0E79F159@MW3PR12MB4409.namprd12.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <MW3PR12MB44096CC3AD5CD01D6043B0E79F159@MW3PR12MB4409.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/12/2022 03:24, Garhwal, Vikram wrote:
> Hi Julien,

Hi Vikram,

I am having trouble to differentiate your answers from my remark. For 
instance...


> From: Julien Grall <julien@xen.org>
> Date: Sunday, October 16, 2022 at 10:48 AM
> To: Garhwal, Vikram <vikram.garhwal@amd.com>, qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, open list:ARM TCG CPUs <qemu-arm@nongnu.org>, open list:X86 Xen CPUs <xen-devel@lists.xenproject.org>
> Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
> Hi,
> 
> There seem to be some missing patches on xen-devel (including the cover
> letter). Is that expected?
> Not sure what went wrong there. I can see all of these on QEMU-devel. Perhaps xen-devel is not in maintainer’s list for all the xen files?
> 
> 
> On 15/10/2022 06:07, Vikram Garhwal wrote:
>> Add a new machine xenpv which creates a IOREQ server to register/connect with
>> Xen Hypervisor.
> 
> I don't like the name 'xenpv' because it doesn't convey the fact that
> some of the HW may be emulated rather than para-virtualized. In fact one
> may only want to use for emulating devices.
> 
> Potential name would be 'xen-arm' or re-using 'virt' but with
> 'accel=xen' to select a Xen layout.
> 
>>
>> Xen IOREQ connection expect the TARGET_PAGE_SIZE to 4096, and the xenpv machine
>> on ARM will have no CPU definitions. We need to define TARGET_PAGE_SIZE
>> appropriately ourselves.
>>
>> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
>> TPM emulator and connects to swtpm running on host machine via chardev socket
>> and support TPM functionalities for a guest domain.
>>
>> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>>       -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>>       -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>
>> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
>> provides access to TPM functionality over socket, chardev and CUSE interface.
>> Github repo: https://github.com/stefanberger/swtpm
>> Example for starting swtpm on host machine:
>>       mkdir /tmp/vtpm2
>>       swtpm socket --tpmstate dir=/tmp/vtpm2 \
>>       --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> I see patches for QEMU but not Xen. How can this be tested with existing
> Xen? Will libxl ever create QEMU?
> Will send the patch for libxl Xen separately.

... the first two lines are my remarks and the 3rd is your answer. Can 
you configure your e-mail client to do proper quoting?

[...]

>> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
>> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
>> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(busdev, &error_fatal);
>> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> 
> I can't find where GUEST_TPM_BASE is defined. But then the guest memory
> layout is not expected to be stable. With your current approach, it
> means QEMU would need to be rebuilt for every Xen version. Is it what we
> want?
> I cannot think of better way to do this. Either we add the the def here or rebuild it if GUEST_TPM_BASE changes for each xen version.

The alternative would be to specify the address on the QEMU command 
line. The advantage is you could build a system where each guests have 
different layout.

Cheers,

-- 
Julien Grall

