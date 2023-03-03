Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65216A9557
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505804.778754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2lc-00057D-Eh; Fri, 03 Mar 2023 10:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505804.778754; Fri, 03 Mar 2023 10:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2lc-00054d-Aw; Fri, 03 Mar 2023 10:36:00 +0000
Received: by outflank-mailman (input) for mailman id 505804;
 Fri, 03 Mar 2023 10:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY2la-0004aT-BC
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:35:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b66cfd3-b9af-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:35:55 +0100 (CET)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 05:33:58 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7085.namprd03.prod.outlook.com (2603:10b6:806:353::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 10:33:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 10:33:55 +0000
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
X-Inumbo-ID: 2b66cfd3-b9af-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677839755;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hQtdo1xNHOXdFD2yc95pzEBqcyuC5Z19hJyE3DEnEfU=;
  b=Iy3zvr4YKxD8cH4N6svj9NEF5i444//LbOZnVto0GyTYy2I/vxyk6oJP
   olZdAPuDfyxT11sr2gcDqVbi9cIYSrCFZ3ai0gfFbD5r9+9eJb6muUUIw
   oVwc6O5DbcjWwbGohpGInI1OfiGWk0D5/4TKQVta3J6WPEUcKQcNtQxu3
   c=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 99725549
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JVRhdau5Jl1QB3gtns6aabAIgefnVOJfMUV32f8akzHdYApBsoF/q
 tZmKTuPOvmPNDOjco0jO9/gphlXv5+EyIRnHQM/qiE0QX5D+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASGzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMRAMV0DZn/qM0J28Tcl92eA9FM3LI9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xbLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReznrKM33Az7Kmo7CEUofgaRq9OAr2WzXt5jI
 WIY23ElhP1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T8lHOhTaxrZHhVA8r4R7WWGnj5QR8DKavYIai+FXA7fJNKY+fZlaEt
 XkA3cOZ6YgmBJWMjzCEQf9LEqug4f2EKxXDjVUpFJ4knxym/HileoJc6S9/P29mN88FfXniZ
 0q7hO9KzJpaPX/vaLAtZYu0Up4u1fK4SYijUe3IZN1TZJQ3bBWA4CxleU+X2SbqjVQolqY8f
 5ycdK5AEEonNEiu9xLuL8917FPh7npjlAs/mbiTI8yb7Iej
IronPort-HdrOrdr: A9a23:Bh2Ai6u8Dbvg/Degfhw8udUq7skDRtV00zEX/kB9WHVpm6uj+/
 xG/c516faQsl0ssR4b9+xoVJPgfZq/z+8X3WBhB9eftWDd0QPDQb2Ki7GSpgEIcBeOlNK1u5
 0QFZRWOZndCkV7kNa/wCTQKadY/DBfytHNuQ4J9QYLcT1X
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="99725549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlXaF2zXrXer4eX+9blqpn/8q/1YSRYoOD9wKKBu22XnyLvcEC0mfcuAFr/tOdBfZZMTq3KaAwiVEVR7XBWCQrNJW+2/iLxfWOct4Kb8MtzLjuDSf87PJXnNq8b9GKZhBVNAJbTXD/uZDgio8M19jc3R5r5gVgXQ9KQSx1tJ8WmAUk5WgN1RI8YZ1Ouqzib/jEWdvyDUWaS5dTxMjo3m5kd+gxId1I8/34wlVCOmDdV8DxgT8nCkWW89REYsIknK7c/Bbt+3ok/lhds0bMqyei7ukeU01FefwNzog9YY2LE0kgwFnvWkgJJCQwPdoyXcEI0Hro3kWpTuzHf3X46hHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5n9hDcHY8X6iwfsyWRmEFEkECkAM83bv2we6AuXx98=;
 b=ZUJaJtBXkwIZMcXNPvFibRMV3GppyjvoXgMPHXUOZSqk7AWTkfltwoHHE7urmnjZnC0V6dXlyjOHE4WMGQASJyres84YLZz/PD9gEOGPVLqMp/3waQaMHn3561FQMNgpdehK/87bN5Y62quU0lDS0QZ4/Y0cRTMGpJNf1TRWE7vNb/+D0pDF9iQm+kLIA4HZcs5wZa8vDV7qe2eUKCNtuSAlXzSSw/mUsC/tLb6DLlBRrfWEtl1jWDdgnfrpPKb6W2N5fvPmcwWHRihkXehfQtONSLRBoB1NsJlqxzKrj8becz+ucFEqOKzm0Jp8BB7f6WZ88X6wlcoLE7zDJJ8qng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5n9hDcHY8X6iwfsyWRmEFEkECkAM83bv2we6AuXx98=;
 b=Msc5KXKYOQVJ9NKYUuYLsx0IySx1SHCluwl9czrmZWnffXP3dohs53F7pit3xQ2P12+b4hC2+nd25VQ5rseBnfAK9YSTILLvGoJBCe76XZFavlWld2LKuC83RjSGxBoicZoXEN78PFDASeNcrL1559tVmKyZD63OXFRcJULcuVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <009206ce-1750-95f2-7f6f-34c71f0b79ec@citrix.com>
Date: Fri, 3 Mar 2023 10:33:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: initialize .bss section
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
In-Reply-To: <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0653.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN7PR03MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 67afdada-8435-4cff-3805-08db1bd2c9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KUrFxyLB0ksUNd5SpKns6JDOIVh4zQSuI3iZ6zWMHIw7/Zy9ZtTVFG2F0eZUTk1f/+40ekQYPCWKHS7YyKVIDbXquIdCCxSQFB/hBQcvl+sUs0cF9mNNg6Q9/Yx1G5y+Gdb/93wqLYZCsj3BC23b17M6VKxJIjQtRUO1veTngC7h/yzTjyJSANgbN3CvMncm1aJK0/vzRDXeAI+bHSQGjCAqVhwBAj8G6UR1Bj52OG/9Cx4bFKq6isGhm2h4cXGFJMPciRd9pXWSIxt8PDormsm0zNvCMdQahtenIXqO2uz1cXZBFv4zECIknvU0HxO0jmHPJVPAA1RUmWyGIhZiQJaxiFU/Eg2nP+V/7AIgtSiUCU2GtVqPhSEGti6f/I8j8UBCwkqfimZ/iJPp5AOqLyIY+Y7GmC8sdpEvjiYf8UxGovJVjzxal9Y7hHMdWoGPAZlgcHEGgRsz1iP6iz7hVnwRBysVnzOf4Gs/sR9mvvHmub4bU8IpdC6N1Y4Xc4kHkLcOi67IfrrfetSC0tQSVM0mb7DkwxCnCcCG+ENqeTbAtmya7qKcA+4jTRzeF4U+H9W/w5v3S0lf6AlYCTjqQ60PF9Ke2WCVxxSvwO0w5iJKtkPwzXV3pZmgoQ3E9b54BqnjfJWmGtqxyy7zoS9oGRCPtWQkZ/PXO3saPy+1ILO2dkxz8kjsv+tXucT/X55WUJBoSCbLi9JGA2VTw0v9pq24F9zX0B4ryyQdslzfAKgtBd/Q8xa9ZEBKe9E6R6o0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199018)(31686004)(8936002)(6486002)(36756003)(54906003)(2616005)(66476007)(41300700001)(4326008)(8676002)(53546011)(66556008)(31696002)(86362001)(66946007)(2906002)(4744005)(26005)(5660300002)(316002)(6666004)(6506007)(478600001)(6512007)(38100700002)(82960400001)(186003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkQ1emkwWE1DU2Y3aS9qTlF2MXRSSnFKK1lBdWMzTkJiY1lzQ3VWeTdBYXNZ?=
 =?utf-8?B?TXNBWkdiQU5EL0JINmtHV2dhMzZJR1pNeE9sUU42d0ZxdWJTNE8xY2VDSjBn?=
 =?utf-8?B?N3lLZ0FmdG0vbFRUaHhpZFMwMjFmRGE1QVYwLzJtUkJ0WUQxN0tuN1M0SXMr?=
 =?utf-8?B?U3hlOCtEcmpjQ3F5aWkwL0dIOFlpc1B1bXA5RjBYNXVjV3ZoWGtpcytHNUp2?=
 =?utf-8?B?eWZRZ01LOG5ETzBHRjJkUzdHTmxGVmJCcDdnb2RWT0xQaUJ4VUtxNVB1N0oy?=
 =?utf-8?B?dkVsSVZsanAvNWR0VUNiLy9DeEdJa3NtTzltbjNyNVM2VkpWVmZLbWJNRjYz?=
 =?utf-8?B?YnVSU3JteTFWTkJzcjdWYW1NWlh2WnZsTU1XOXkrSEYwZndUR1MyWTQrQjB0?=
 =?utf-8?B?U1h3WklVMjlaMXRxYlJaUU4xSXI2cmJlYzFUVGlVVHBNVlhjamRCUkpndWJQ?=
 =?utf-8?B?UjU1Smgvb0l1ZnlQNlphRzJJQ1lxZnBSdUhXQU0rR1lqb2Y3cHp3dStSUVpS?=
 =?utf-8?B?aUxUTDhUTTBJTlJnL0p1Mlhna0NYc1ltNG5KTW1BazVDV3N4Nks3eFhkSC9Z?=
 =?utf-8?B?WVNKbVd6RXAwdkwya0htWXVhV0NpSjJMRkdxeFlDcGJwdUhqVnA0T1FDSmdm?=
 =?utf-8?B?Z094aWtjZWlsMzhSdWNYUzN0MGxucERiZDhpOHZQUk5rTlRkNGZWeUZaRXlJ?=
 =?utf-8?B?d29XMlJTZmlpc2NHZENvbjhIYWFnSmkyVzQ0OHRsanVLdDFDNXpXRkFCUGJV?=
 =?utf-8?B?TVE0V2RCNEhFRXp1bjFhdHlQNmN4WmFlZEJIRVd4L21lL2l2ZDk4SldrUnFy?=
 =?utf-8?B?L1VjM2wzOUx2VWI2SitzK3FFTDg4MDJqSmpyTWZmbUxaTUFHa1RTMG1weEpC?=
 =?utf-8?B?NGFIUnE0SjFJMXBvMU9sa1k2aFd5M1Y4ZFU4M0xvdjJtNlg3TUJMdXdvTWJR?=
 =?utf-8?B?ZHZJLytMM0djTmdtSDkySFlkalNKOWJXR0IzVWVsaEZUV1V6K284Umt3a3I5?=
 =?utf-8?B?Sk1DVDlTVGl6eHlaN1U2cWxTRWZ4RHFmUFVSdXY2R2NLa3BBckR1eTlmVHA3?=
 =?utf-8?B?Tk1zOEtydEZTZ0dUQXdLdjdwSGVFbEVVeTdLcXNXV3RhTGpvZmpQVWdrNlQ0?=
 =?utf-8?B?eVNEeFZXODNZWEROMHhnRE9oOGN2YnVxSDFweTd2SDZQYTl1OHJ0Z3FyRUpM?=
 =?utf-8?B?NTlIQzhFb0IvQVhzNVFYSEZIWnAxTHVOL1dabFlNZlVwY0djNTdMb3I3Qnc5?=
 =?utf-8?B?WHlBNUJRQmVIQk16bStzdDlwSllwTkthejYza2ZHa2VHeDY1UHF0RmUwWVdH?=
 =?utf-8?B?NWtHVVdzMjYxZXBEeXEvOFNud1NPYlJiZS9LcE9VYXJ4THJTa1RFWHNONXN5?=
 =?utf-8?B?ZmgyL1Z3NFk4WFhtWkIrZTFjc2VJemNJMXZkREd6ek85YnpwRHZ5eEViKzZl?=
 =?utf-8?B?Sms2SGZkanMva0VFZEptcmE2cVozRmVBeUd6Uml1OTI2ZGNZbDlZcVBKTUV6?=
 =?utf-8?B?a0wxQllueEQ4WnV6Uk9hSFFoVW9FS2NiWUxtZlRDQnVuUlN5enBSMDBIWHQz?=
 =?utf-8?B?UU5BTHJJUnlldFV6Sk5ydmpkUHpWOVFmRUlLcFRxc0VJSVdIV29xd2tHRFZv?=
 =?utf-8?B?MFhjaUVJVmNzUUVzWmQzd3hsRHlyeWF4TXVUOEFVMWJ2Qi8xV2pEVTZOck5j?=
 =?utf-8?B?alRRMHo4N1J4Y0I2MExLemg3eWpMMWtQRkpLbEt4VXg1WmlpSHVCTmtObGIv?=
 =?utf-8?B?d1gzMDl3SGs1aUo3NGZ4Z0t4VjJuUXpuWjNNazFmZHpYNWZaNlBNQXcrZ2dx?=
 =?utf-8?B?c3VqOStPUzR3cndqMmp4UVRYYytRTVVWWnNmODVUM2l4aWl2Z3ZVQ2JSeTJt?=
 =?utf-8?B?K0dyaTkxbFBoUlZyODZMVjR1WEFIUlQ0ZmVzZFB2MXNERHMzdlRMeGVIcTdl?=
 =?utf-8?B?Q1lKeng1UndDWlJESGhFMFVtWmpDWTJmdFp2ZzJ4UTZoL1JTNkE5QW5UNkhj?=
 =?utf-8?B?QUhzNUlLY2xWblhVMEFoUnp5TFptbVd6ankrM3ZqOXVyRGRiYjl3TmdjbWJp?=
 =?utf-8?B?Mm1CNysyTFp5bVVMbGJYSytpeVRtMHpIODNiYmdVK2YrSjlWOFRrcHk4d3Nj?=
 =?utf-8?B?TVJDUFBkVEVRaDk4VzliUVhOMVVMVFh2VmszSXJONzNaL1JmZjQvZ253YzJa?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	syBZR4c4BOcEJWf7Sl6cEwGQR2UCLkrlcx3JyyZ/M3Xh5qp4oL161tyrl8TfbgeHHlpxlFDEJqFWFTIf7MO15iGx4g4zioXX/ehqsH7AB2qTB60RU7bZ3V/NuRQXQnDYEU5Oa4nU6CZd9G8hihPAtG0O5qcOzEvpalxisHbCOb67hDdZp6UuD2/LTGg2w2/U/tkaCVmR3p4z/NIwNAySsqzViaHsW9qEadqQYUUeDnqwbCgwWdWZhATIfuhuVJ9eWADkQUg3lSwwSvLZX79hf4bkF6/1XWktwMDb62pOmhytOxWEdvm1S9ud68TO4ad/19AbZjN8EQ/8mFa18TWX1LBl1EEnUeIJ2Q0L1X1xg2iFGX4zjILWFcohTJ/564ifwwjt/5wNAc5hY64k8H6smsJVzQQmOB+FVh+XXPjhd0lYKnv0hRD+s1Tr2n55a6wBDanQEJOwpPJRmgNDQGE9B05ErbshBjqIsFd2alEP1YjlLBH1rf8/GGRRJdTIrUZsRvMc8IvANJkvCCo4jg99DnmFA4j4x1BCHLr1Cfq4cG0Vpcd3IO4w0O+EkHhko2r5/7h2SknBrSwgZ1X34r2+079W6WDVQ0SXttz5CiFX9Fo/vyO95uhR/NgAAQnaG3O36KueXPzQUT5I85bS9UrhX5j0pQwVVv/Q6o50ESWNhNgv47Gv5n5JpZwm3L2gH6TQ099UjjefvErBCJD28AgI15RH0p9zlxRAxfExAA5bFxU+a0AhJKfYnQD0CG5Y0IUXG6QPUa3qPcySXCfzmQEKFlwc1Tiojl74cm37LFgprBfkKOdLQTHLibmZXDr6FKrWJZ8Sfvz/ib3J0swY+6iP7uFfa1NJevkWprdU3Sp7XNdNM8WYMg9CH9GT+BV6geAcEtX/5FV8Z55htynbvgHMDGwkZBtuHUuPvVsP67491Gc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67afdada-8435-4cff-3805-08db1bd2c9de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:33:55.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWcit3UahJufG3nahpkGRyUuCugFQXGOjjsf6eiu0vcczL1YHmI1dPdZoeDo0re1vCQnvR/PnBVva9TprM5BV+XO8lKqNaTbZ0H3imkIx0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7085

On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index adf5d6c74a..8887f0cbd4 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -18,6 +19,14 @@ ENTRY(start)
>          li      t0, SSTATUS_FS
>          csrc    CSR_SSTATUS, t0
>  
> +        /* Clear the BSS */
> +        la      t3, __bss_start
> +        la      t4, __bss_end
> +.L_clear_bss:
> +        REG_S   zero, (t3)
> +        add     t3, t3, __SIZEOF_POINTER__
> +        bltu    t3, t4, .L_clear_bss

Using t3/t4 is fine, but it would also have been fine to use t0/t1.

~Andrew

