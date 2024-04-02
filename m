Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F8895A9F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 19:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700230.1093043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrhrI-0007U4-0J; Tue, 02 Apr 2024 17:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700230.1093043; Tue, 02 Apr 2024 17:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrhrH-0007R8-T9; Tue, 02 Apr 2024 17:23:39 +0000
Received: by outflank-mailman (input) for mailman id 700230;
 Tue, 02 Apr 2024 17:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbjO=LH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rrhrG-0007R2-CT
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 17:23:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bca042d7-f115-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 19:23:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 439C04EE0737;
 Tue,  2 Apr 2024 19:23:35 +0200 (CEST)
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
X-Inumbo-ID: bca042d7-f115-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 02 Apr 2024 19:23:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 1/7] x86/msi: address violation of MISRA C Rule
 20.7 and coding style
In-Reply-To: <c958ad3e-5371-4a4e-81b5-8c313ac83258@suse.com>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
 <2f2c865f20d0296e623f1d65bed25c083f5dd497.1711700095.git.nicola.vetrini@bugseng.com>
 <c958ad3e-5371-4a4e-81b5-8c313ac83258@suse.com>
Message-ID: <c1c90ad849a217f00afc386fee3db689@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-02 17:05, Jan Beulich wrote:
> On 29.03.2024 10:11, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> While at it, the style of these macros has been somewhat uniformed.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - Make the style change more consistent
>> ---
>>  xen/arch/x86/include/asm/msi.h | 49 
>> +++++++++++++++++-----------------
>>  1 file changed, 25 insertions(+), 24 deletions(-)
>> 
>> diff --git a/xen/arch/x86/include/asm/msi.h 
>> b/xen/arch/x86/include/asm/msi.h
>> index 997ccb87be0c..bd110c357ce4 100644
>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -147,33 +147,34 @@ int msi_free_irq(struct msi_desc *entry);
>>   */
>>  #define NR_HP_RESERVED_VECTORS 	20
>> 
>> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
>> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
>> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
>> -#define msi_data_reg(base, is64bit)	\
>> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
>> -#define msi_mask_bits_reg(base, is64bit) \
>> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
>> +#define msi_control_reg(base)        ((base) + PCI_MSI_FLAGS)
>> +#define msi_lower_address_reg(base)  ((base) + PCI_MSI_ADDRESS_LO)
>> +#define msi_upper_address_reg(base)  ((base) + PCI_MSI_ADDRESS_HI)
>> +#define msi_data_reg(base, is64bit) \
>> +    (((is64bit) == 1) ? (base) + PCI_MSI_DATA_64 : (base) + 
>> PCI_MSI_DATA_32)
>> +#define msi_mask_bits_reg(base, is64bit)                \
>> +    (((is64bit) == 1) ? (base) + PCI_MSI_MASK_BIT       \
>> +                      : (base) + PCI_MSI_MASK_BIT - 4)
>>  #define msi_pending_bits_reg(base, is64bit) \
>> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
>> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
>> +    ((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
>> +#define msi_disable(control)         ({ (control) &= 
>> ~PCI_MSI_FLAGS_ENABLE })
>>  #define multi_msi_capable(control) \
>> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
>> +    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
>>  #define multi_msi_enable(control, num) \
>> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
>> -#define is_mask_bit_support(control)	(!!(control & 
>> PCI_MSI_FLAGS_MASKBIT))
>> -#define msi_enable(control, num) multi_msi_enable(control, num); \
>> -	control |= PCI_MSI_FLAGS_ENABLE
>> -
>> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
>> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
>> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
>> -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
>> -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
>> -#define msix_table_size(control) 	((control & 
>> PCI_MSIX_FLAGS_QSIZE)+1)
>> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
>> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
>> +    ({ (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE) })
>> +#define is_64bit_address(control)    (!!((control) & 
>> PCI_MSI_FLAGS_64BIT))
>> +#define is_mask_bit_support(control) (!!((control) & 
>> PCI_MSI_FLAGS_MASKBIT))
>> +#define msi_enable(control, num)     ({ multi_msi_enable(control, 
>> num); \
>> +                                        (control) |= 
>> PCI_MSI_FLAGS_ENABLE })
> 
> Neither this nor ...
> 
>> +#define msix_control_reg(base)       ((base) + PCI_MSIX_FLAGS)
>> +#define msix_table_offset_reg(base)  ((base) + PCI_MSIX_TABLE)
>> +#define msix_pba_offset_reg(base)    ((base) + PCI_MSIX_PBA)
>> +#define msix_enable(control)         ({ (control) |= 
>> PCI_MSIX_FLAGS_ENABLE })
>> +#define msix_disable(control)        ({ (control) &= 
>> ~PCI_MSIX_FLAGS_ENABLE })
> 
> ... these would compile afaict, if  they were used.
> 
> Once again - before fiddling with these we need to settle on which of 
> these
> we want to keep (and then also use, rather than open-coding), and which 
> to
> drop (instead of massaging).
> 
> Jan

Ok, we can drop this patch from this for now.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

