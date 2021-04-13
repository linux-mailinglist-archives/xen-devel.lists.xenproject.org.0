Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDE35DC0C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 12:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109621.209272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFpg-0006Qf-SJ; Tue, 13 Apr 2021 09:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109621.209272; Tue, 13 Apr 2021 09:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFpg-0006QG-Nv; Tue, 13 Apr 2021 09:59:44 +0000
Received: by outflank-mailman (input) for mailman id 109621;
 Tue, 13 Apr 2021 09:59:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBYq=JK=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lWFpf-0006QB-BB
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 09:59:43 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 510a276a-22b1-412b-b68a-17c362c720cc;
 Tue, 13 Apr 2021 09:59:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-HQzQOgAWPtyv3vb86wDJsw-1; Tue, 13 Apr 2021 05:59:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71E9E9126D;
 Tue, 13 Apr 2021 09:59:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-199.ams2.redhat.com
 [10.36.115.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21B3571287;
 Tue, 13 Apr 2021 09:59:29 +0000 (UTC)
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
X-Inumbo-ID: 510a276a-22b1-412b-b68a-17c362c720cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618307978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PC9iOqfTfZP07nfc1h3ik3+YFxj0evh+vBjeUVFJEik=;
	b=jM7E2FaLKxKD7nLvNc6C7ickZQ8d1Pee1yxtzs8Fr7rU+A6NvCsGOZJZ33xi9hUZE2Z3f4
	HLFBUUjZgiHPD0Eowp+eopECmXO/c2sinIt/qsw0D1zN+ju3lbfAcGEkR5qq2YmEUdoASU
	WYoU9TvHA1z9xi2gEDFj1aQuimas5BI=
X-MC-Unique: HQzQOgAWPtyv3vb86wDJsw-1
Subject: Re: [PATCH v3 4/7] OvmfPkg/IndustryStandard: Introduce PageTable.h
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
 <20210412133003.146438-5-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6cfddec5-db6d-64e9-0008-638bffae586e@redhat.com>
Date: Tue, 13 Apr 2021 11:59:29 +0200
MIME-Version: 1.0
In-Reply-To: <20210412133003.146438-5-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/12/21 15:30, Anthony PERARD wrote:
> We are going to use the page table structure in yet another place,
> collect the types and macro that can be used from another module
> rather than making yet another copy.
> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
> 
> Notes:
>     CC: Brijesh Singh <brijesh.singh@amd.com>
>     
>     v3:
>     - fix typos and coding style
>     
>     v2:
>     - new patch
> 
>  .../IndustryStandard/PageTable.h}             | 117 +-------------
>  .../BaseMemEncryptSevLib/X64/VirtualMemory.h  | 143 +-----------------
>  2 files changed, 5 insertions(+), 255 deletions(-)
>  copy OvmfPkg/{Library/BaseMemEncryptSevLib/X64/VirtualMemory.h => Include/IndustryStandard/PageTable.h} (60%)

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

> 
> diff --git a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h b/OvmfPkg/Include/IndustryStandard/PageTable.h
> similarity index 60%
> copy from OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> copy to OvmfPkg/Include/IndustryStandard/PageTable.h
> index 996f94f07ebb..5e797eeea8ef 100644
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
> +#ifndef PAGE_TABLE_H_
> +#define PAGE_TABLE_H_
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
> index 996f94f07ebb..fe2a0b2826cd 100644
> --- a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> +++ b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> @@ -14,6 +14,7 @@
>  #ifndef __VIRTUAL_MEMORY__
>  #define __VIRTUAL_MEMORY__
>  
> +#include <IndustryStandard/PageTable.h>
>  #include <Library/BaseLib.h>
>  #include <Library/BaseMemoryLib.h>
>  #include <Library/CacheMaintenanceLib.h>
> @@ -23,148 +24,6 @@
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


