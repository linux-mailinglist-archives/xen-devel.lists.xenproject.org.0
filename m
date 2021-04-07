Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66F3565F8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106461.203582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU39G-0003x5-JB; Wed, 07 Apr 2021 08:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106461.203582; Wed, 07 Apr 2021 08:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU39G-0003wg-FV; Wed, 07 Apr 2021 08:02:50 +0000
Received: by outflank-mailman (input) for mailman id 106461;
 Wed, 07 Apr 2021 08:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU39F-0003wb-19
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:02:49 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e1a63dba-272f-4261-8376-0771010f71df;
 Wed, 07 Apr 2021 08:02:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-3vwqlkLAMi6RrwlSJkb-nQ-1; Wed, 07 Apr 2021 04:02:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C467801FD8;
 Wed,  7 Apr 2021 08:02:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A83C39A73;
 Wed,  7 Apr 2021 08:02:40 +0000 (UTC)
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
X-Inumbo-ID: e1a63dba-272f-4261-8376-0771010f71df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617782567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sN1ZinGNVMiswNMJoV0Ajh8GcG1uz/4TMl5/jc3dOY0=;
	b=gXuC6a2g8Q2laYc7d3kpUUoV9xJmqEB2BHj5uUZgdkSBknA/8TNAmR93ZKMBcg/Y7ACrCb
	vCfZCS6NjwS00T8O58nDcKNY2GCR0o6d6m7BPwNQkQk27qw1OgBTSatNNtLMUdWhwfF6O/
	y7YsE6DoeA3DCdgmuNrqLT9if059u/Q=
X-MC-Unique: 3vwqlkLAMi6RrwlSJkb-nQ-1
Subject: Re: [edk2-devel] [PATCH v2 4/7] OvmfPkg/IndustryStandard: Introduce
 PageTable.h
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-5-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0e507eda-316f-5609-1380-3239ce0d0276@redhat.com>
Date: Wed, 7 Apr 2021 10:02:39 +0200
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-5-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/25/21 16:47, Anthony PERARD via groups.io wrote:
> We are going to use the page table structure in yet another place,
> collect the types and macro that can be used from another module
> rather that making yet another copy.
> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CC: Tom Lendacky <thomas.lendacky@amd.com>
> CC: Brijesh Singh <brijesh.singh@amd.com>
> ---
> 
> Notes:
>     v2:
>     - new patch
> 
>  .../IndustryStandard/PageTable.h}             | 117 +-------------
>  .../BaseMemEncryptSevLib/X64/VirtualMemory.h  | 143 +-----------------
>  2 files changed, 5 insertions(+), 255 deletions(-)
>  copy OvmfPkg/{Library/BaseMemEncryptSevLib/X64/VirtualMemory.h => Include/IndustryStandard/PageTable.h} (60%)
> 
> diff --git a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h b/OvmfPkg/Include/IndustryStandard/PageTable.h
> similarity index 60%
> copy from OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> copy to OvmfPkg/Include/IndustryStandard/PageTable.h
> index 996f94f07ebb..e3da4e8cf21c 100644
> --- a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> +++ b/OvmfPkg/Include/IndustryStandard/PageTable.h
> @@ -1,6 +1,6 @@
>  /** @file
>  
> -  Virtual Memory Management Services to set or clear the memory encryption bit
> +  x86_64 Page Tables structures
>  
>    Copyright (c) 2006 - 2016, Intel Corporation. All rights reserved.<BR>
>    Copyright (c) 2017 - 2020, AMD Incorporated. All rights reserved.<BR>
> @@ -11,17 +11,10 @@
>  
>  **/
>  
> -#ifndef __VIRTUAL_MEMORY__
> -#define __VIRTUAL_MEMORY__
> +#ifndef __PAGE_TABLE_H__
> +#define __PAGE_TABLE_H__

Should be PAGE_TABLE_H_ nowadays (no leading underscore, and one
trailing underscore suffices).

Thanks
Laszlo

>  
> -#include <Library/BaseLib.h>
> -#include <Library/BaseMemoryLib.h>
> -#include <Library/CacheMaintenanceLib.h>
> -#include <Library/DebugLib.h>
> -#include <Library/MemoryAllocationLib.h>
> -#include <Uefi.h>
> -
> -#define SYS_CODE64_SEL 0x38
> +#include <Base.h>
>  
>  #pragma pack(1)
>  
> @@ -165,106 +158,4 @@ typedef union {
>  #define PTE_OFFSET(x)               ( (x >> 12) & PAGETABLE_ENTRY_MASK)
>  #define PAGING_1G_ADDRESS_MASK_64   0x000FFFFFC0000000ull
>  
> -#define PAGE_TABLE_POOL_ALIGNMENT   BASE_2MB
> -#define PAGE_TABLE_POOL_UNIT_SIZE   SIZE_2MB
> -#define PAGE_TABLE_POOL_UNIT_PAGES  \
> -  EFI_SIZE_TO_PAGES (PAGE_TABLE_POOL_UNIT_SIZE)
> -#define PAGE_TABLE_POOL_ALIGN_MASK  \
> -  (~(EFI_PHYSICAL_ADDRESS)(PAGE_TABLE_POOL_ALIGNMENT - 1))
> -
> -typedef struct {
> -  VOID            *NextPool;
> -  UINTN           Offset;
> -  UINTN           FreePages;
> -} PAGE_TABLE_POOL;
> -
> -/**
> -  Return the pagetable memory encryption mask.
> -
> -  @return  The pagetable memory encryption mask.
> -
> -**/
> -UINT64
> -EFIAPI
> -InternalGetMemEncryptionAddressMask (
> -  VOID
> -  );
> -
> -/**
> -  This function clears memory encryption bit for the memory region specified by
> -  PhysicalAddress and Length from the current page table context.
> -
> -  @param[in]  Cr3BaseAddress          Cr3 Base Address (if zero then use
> -                                      current CR3)
> -  @param[in]  PhysicalAddress         The physical address that is the start
> -                                      address of a memory region.
> -  @param[in]  Length                  The length of memory region
> -  @param[in]  Flush                   Flush the caches before applying the
> -                                      encryption mask
> -
> -  @retval RETURN_SUCCESS              The attributes were cleared for the
> -                                      memory region.
> -  @retval RETURN_INVALID_PARAMETER    Number of pages is zero.
> -  @retval RETURN_UNSUPPORTED          Clearing the memory encyrption attribute
> -                                      is not supported
> -**/
> -RETURN_STATUS
> -EFIAPI
> -InternalMemEncryptSevSetMemoryDecrypted (
> -  IN  PHYSICAL_ADDRESS        Cr3BaseAddress,
> -  IN  PHYSICAL_ADDRESS        PhysicalAddress,
> -  IN  UINTN                   Length,
> -  IN  BOOLEAN                 Flush
> -  );
> -
> -/**
> -  This function sets memory encryption bit for the memory region specified by
> -  PhysicalAddress and Length from the current page table context.
> -
> -  @param[in]  Cr3BaseAddress          Cr3 Base Address (if zero then use
> -                                      current CR3)
> -  @param[in]  PhysicalAddress         The physical address that is the start
> -                                      address of a memory region.
> -  @param[in]  Length                  The length of memory region
> -  @param[in]  Flush                   Flush the caches before applying the
> -                                      encryption mask
> -
> -  @retval RETURN_SUCCESS              The attributes were set for the memory
> -                                      region.
> -  @retval RETURN_INVALID_PARAMETER    Number of pages is zero.
> -  @retval RETURN_UNSUPPORTED          Setting the memory encyrption attribute
> -                                      is not supported
> -**/
> -RETURN_STATUS
> -EFIAPI
> -InternalMemEncryptSevSetMemoryEncrypted (
> -  IN  PHYSICAL_ADDRESS        Cr3BaseAddress,
> -  IN  PHYSICAL_ADDRESS        PhysicalAddress,
> -  IN  UINTN                   Length,
> -  IN  BOOLEAN                 Flush
> -  );
> -
> -/**
> -  Returns the encryption state of the specified virtual address range.
> -
> -  @param[in]  Cr3BaseAddress          Cr3 Base Address (if zero then use
> -                                      current CR3)
> -  @param[in]  BaseAddress             Base address to check
> -  @param[in]  Length                  Length of virtual address range
> -
> -  @retval MemEncryptSevAddressRangeUnencrypted  Address range is mapped
> -                                                unencrypted
> -  @retval MemEncryptSevAddressRangeEncrypted    Address range is mapped
> -                                                encrypted
> -  @retval MemEncryptSevAddressRangeMixed        Address range is mapped mixed
> -  @retval MemEncryptSevAddressRangeError        Address range is not mapped
> -**/
> -MEM_ENCRYPT_SEV_ADDRESS_RANGE_STATE
> -EFIAPI
> -InternalMemEncryptSevGetAddressRangeState (
> -  IN PHYSICAL_ADDRESS         Cr3BaseAddress,
> -  IN PHYSICAL_ADDRESS         BaseAddress,
> -  IN UINTN                    Length
> -  );
> -
>  #endif
> diff --git a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> index 996f94f07ebb..b621d811ca6f 100644
> --- a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> +++ b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> @@ -20,151 +20,10 @@
>  #include <Library/DebugLib.h>
>  #include <Library/MemoryAllocationLib.h>
>  #include <Uefi.h>
> +#include <IndustryStandard/PageTable.h>
>  
>  #define SYS_CODE64_SEL 0x38
>  
> -#pragma pack(1)
> -
> -//
> -// Page-Map Level-4 Offset (PML4) and
> -// Page-Directory-Pointer Offset (PDPE) entries 4K & 2MB
> -//
> -
> -typedef union {
> -  struct {
> -    UINT64  Present:1;                // 0 = Not present in memory,
> -                                      //   1 = Present in memory
> -    UINT64  ReadWrite:1;              // 0 = Read-Only, 1= Read/Write
> -    UINT64  UserSupervisor:1;         // 0 = Supervisor, 1=User
> -    UINT64  WriteThrough:1;           // 0 = Write-Back caching,
> -                                      //   1 = Write-Through caching
> -    UINT64  CacheDisabled:1;          // 0 = Cached, 1=Non-Cached
> -    UINT64  Accessed:1;               // 0 = Not accessed,
> -                                      //   1 = Accessed (set by CPU)
> -    UINT64  Reserved:1;               // Reserved
> -    UINT64  MustBeZero:2;             // Must Be Zero
> -    UINT64  Available:3;              // Available for use by system software
> -    UINT64  PageTableBaseAddress:40;  // Page Table Base Address
> -    UINT64  AvabilableHigh:11;        // Available for use by system software
> -    UINT64  Nx:1;                     // No Execute bit
> -  } Bits;
> -  UINT64    Uint64;
> -} PAGE_MAP_AND_DIRECTORY_POINTER;
> -
> -//
> -// Page Table Entry 4KB
> -//
> -typedef union {
> -  struct {
> -    UINT64  Present:1;                // 0 = Not present in memory,
> -                                      //   1 = Present in memory
> -    UINT64  ReadWrite:1;              // 0 = Read-Only, 1= Read/Write
> -    UINT64  UserSupervisor:1;         // 0 = Supervisor, 1=User
> -    UINT64  WriteThrough:1;           // 0 = Write-Back caching,
> -                                      //   1 = Write-Through caching
> -    UINT64  CacheDisabled:1;          // 0 = Cached, 1=Non-Cached
> -    UINT64  Accessed:1;               // 0 = Not accessed,
> -                                      //   1 = Accessed (set by CPU)
> -    UINT64  Dirty:1;                  // 0 = Not Dirty, 1 = written by
> -                                      //   processor on access to page
> -    UINT64  PAT:1;                    //
> -    UINT64  Global:1;                 // 0 = Not global page, 1 = global page
> -                                      //   TLB not cleared on CR3 write
> -    UINT64  Available:3;              // Available for use by system software
> -    UINT64  PageTableBaseAddress:40;  // Page Table Base Address
> -    UINT64  AvabilableHigh:11;        // Available for use by system software
> -    UINT64  Nx:1;                     // 0 = Execute Code,
> -                                      //   1 = No Code Execution
> -  } Bits;
> -  UINT64    Uint64;
> -} PAGE_TABLE_4K_ENTRY;
> -
> -//
> -// Page Table Entry 2MB
> -//
> -typedef union {
> -  struct {
> -    UINT64  Present:1;                // 0 = Not present in memory,
> -                                      //   1 = Present in memory
> -    UINT64  ReadWrite:1;              // 0 = Read-Only, 1= Read/Write
> -    UINT64  UserSupervisor:1;         // 0 = Supervisor, 1=User
> -    UINT64  WriteThrough:1;           // 0 = Write-Back caching,
> -                                      //   1=Write-Through caching
> -    UINT64  CacheDisabled:1;          // 0 = Cached, 1=Non-Cached
> -    UINT64  Accessed:1;               // 0 = Not accessed,
> -                                      //   1 = Accessed (set by CPU)
> -    UINT64  Dirty:1;                  // 0 = Not Dirty, 1 = written by
> -                                      //   processor on access to page
> -    UINT64  MustBe1:1;                // Must be 1
> -    UINT64  Global:1;                 // 0 = Not global page, 1 = global page
> -                                      //   TLB not cleared on CR3 write
> -    UINT64  Available:3;              // Available for use by system software
> -    UINT64  PAT:1;                    //
> -    UINT64  MustBeZero:8;             // Must be zero;
> -    UINT64  PageTableBaseAddress:31;  // Page Table Base Address
> -    UINT64  AvabilableHigh:11;        // Available for use by system software
> -    UINT64  Nx:1;                     // 0 = Execute Code,
> -                                      //   1 = No Code Execution
> -  } Bits;
> -  UINT64    Uint64;
> -} PAGE_TABLE_ENTRY;
> -
> -//
> -// Page Table Entry 1GB
> -//
> -typedef union {
> -  struct {
> -    UINT64  Present:1;                // 0 = Not present in memory,
> -                                      //   1 = Present in memory
> -    UINT64  ReadWrite:1;              // 0 = Read-Only, 1= Read/Write
> -    UINT64  UserSupervisor:1;         // 0 = Supervisor, 1=User
> -    UINT64  WriteThrough:1;           // 0 = Write-Back caching,
> -                                      //   1 = Write-Through caching
> -    UINT64  CacheDisabled:1;          // 0 = Cached, 1=Non-Cached
> -    UINT64  Accessed:1;               // 0 = Not accessed,
> -                                      //   1 = Accessed (set by CPU)
> -    UINT64  Dirty:1;                  // 0 = Not Dirty, 1 = written by
> -                                      //   processor on access to page
> -    UINT64  MustBe1:1;                // Must be 1
> -    UINT64  Global:1;                 // 0 = Not global page, 1 = global page
> -                                      //   TLB not cleared on CR3 write
> -    UINT64  Available:3;              // Available for use by system software
> -    UINT64  PAT:1;                    //
> -    UINT64  MustBeZero:17;            // Must be zero;
> -    UINT64  PageTableBaseAddress:22;  // Page Table Base Address
> -    UINT64  AvabilableHigh:11;        // Available for use by system software
> -    UINT64  Nx:1;                     // 0 = Execute Code,
> -                                      //   1 = No Code Execution
> -  } Bits;
> -  UINT64    Uint64;
> -} PAGE_TABLE_1G_ENTRY;
> -
> -#pragma pack()
> -
> -#define IA32_PG_P                   BIT0
> -#define IA32_PG_RW                  BIT1
> -#define IA32_PG_PS                  BIT7
> -
> -#define PAGING_PAE_INDEX_MASK       0x1FF
> -
> -#define PAGING_4K_ADDRESS_MASK_64   0x000FFFFFFFFFF000ull
> -#define PAGING_2M_ADDRESS_MASK_64   0x000FFFFFFFE00000ull
> -#define PAGING_1G_ADDRESS_MASK_64   0x000FFFFFC0000000ull
> -
> -#define PAGING_L1_ADDRESS_SHIFT     12
> -#define PAGING_L2_ADDRESS_SHIFT     21
> -#define PAGING_L3_ADDRESS_SHIFT     30
> -#define PAGING_L4_ADDRESS_SHIFT     39
> -
> -#define PAGING_PML4E_NUMBER         4
> -
> -#define PAGETABLE_ENTRY_MASK        ((1UL << 9) - 1)
> -#define PML4_OFFSET(x)              ( (x >> 39) & PAGETABLE_ENTRY_MASK)
> -#define PDP_OFFSET(x)               ( (x >> 30) & PAGETABLE_ENTRY_MASK)
> -#define PDE_OFFSET(x)               ( (x >> 21) & PAGETABLE_ENTRY_MASK)
> -#define PTE_OFFSET(x)               ( (x >> 12) & PAGETABLE_ENTRY_MASK)
> -#define PAGING_1G_ADDRESS_MASK_64   0x000FFFFFC0000000ull
> -
>  #define PAGE_TABLE_POOL_ALIGNMENT   BASE_2MB
>  #define PAGE_TABLE_POOL_UNIT_SIZE   SIZE_2MB
>  #define PAGE_TABLE_POOL_UNIT_PAGES  \
> 


