Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFE79A762
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599263.934593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeO5-0001Wj-N5; Mon, 11 Sep 2023 10:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599263.934593; Mon, 11 Sep 2023 10:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeO5-0001Tp-I4; Mon, 11 Sep 2023 10:43:25 +0000
Received: by outflank-mailman (input) for mailman id 599263;
 Mon, 11 Sep 2023 10:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qfeO4-0001Tj-3q
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:43:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 053f5e9b-5090-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 12:43:20 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 06:43:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5235.namprd03.prod.outlook.com (2603:10b6:a03:21b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 10:43:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 10:43:09 +0000
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
X-Inumbo-ID: 053f5e9b-5090-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694429000;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pp8TW6h6gQWRbsMDcZIDc0oDznyscu4o8sVdZV3lvDo=;
  b=dvCDWE++4B6jp+6bSKyfoUEKMJcSpfw8hmSSNIFXhGRhint8uOvuaB3I
   TOy/Vrvw12+n1VA2kI4Q2+HINdRV/8vzXK2eBdPSL+Y5/h/xeh7a29ydp
   ZNL3ri7WaDaixKxT3Kpe2QvWLSrwOj6QUbzpwDfGfUScKJNMNZEXGnovf
   w=;
X-CSE-ConnectionGUID: Hudl4EFVQPihImSEPywTHA==
X-CSE-MsgGUID: oq4TacBLSLKCU+qO1yHHRA==
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 120907144
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:cE+aWq8BYhxeVNo6OLskDrUDXn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TEbD2zSPa2ONGSkKdwjaouwpklVvJfWxtIwTAVupXg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKkT5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklu6
 PAcdB0jUCm7huKXxYmWcvhzuuQKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdhKReXnr6I26LGV7msKVCEfXnGfmt2aoXP9QvUGO
 mw0wAN7+MDe82TuFLERRSaQoneav1gZVsBRFeoS4wWK16aS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfD0ohUd4wzWWiep611/bYv8P4iwswGDvLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:dfJdZKnXA6j5AsDVpFKu7XLPPwLpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3AvheeuWiWYRdO1ESVAP9PZj4FSzJuUmDRyCv9DXG?=
 =?us-ascii?q?BMWdpabiuZGeB559Eup87?=
X-Talos-MUID: 9a23:ic6v2gTmJyH8gE4kRXTrnW1ePcxCx5+KK2sw0owh4tikFRZZbmI=
X-IronPort-AV: E=Sophos;i="6.02,243,1688443200"; 
   d="scan'208";a="120907144"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKhi8aqdg28Yd/Ilvf6zzZY9hhP4xhgBtICgu1Ih3aJSK5eEsRAzibKeUDcbIRvqveV3kju85rvXCPEUto4Iq9KisfYA6s1OWKOSGpmGTYq/YRH2pbjg/Q4TpFdnW3AaJnBg4I4lAMOBxDZR7MkyfkKN4+4ocdhWSWDTFsYbLkc2JZmBRNcu89bfA1oW88Gg/AuzOanqHDLh7IfFbpVJHyENLjyQk1BDn7kQta+9ZkEyKbeISbxvpDLPr38271GzQXRYM0Ko1T3bC3VjnM+AZW1iIVTmcqQy8puKVuJpqd+CtzGaqen+M7OUYrYAcmXa56j3NSAjKyvG9PnEObtKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp8TW6h6gQWRbsMDcZIDc0oDznyscu4o8sVdZV3lvDo=;
 b=MqYW49840orPLS6UpfbNbPb3ry4Ht2iDf1OXwb2G1Gw49E8aEgN5OV+97+JG4gWNYPvnPKFJGOYg9GvW6zfzEFG29W8oaw3m6uyz4/RFbxAGh3fJM7TEjH59ouittwlsRHSIEaQkG9kH6sxlEN0NPToB+zR5Pu3lx6JQeRMfOu7mYE3fexxujQkpRNp15MHSkKmnFuFXxpybJnrTMBOs7pTYKb+FPDQKvnYGAO0xKySBHwcJSdhhdsA+pMxsnD8cfpQlgrYrlDbGkplebKMePrnfnnlxiMk+3pUpdJFkXLJhfuRSxmwBtBU9SUNor7HXCStnYPchO3B//IRf8ug7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp8TW6h6gQWRbsMDcZIDc0oDznyscu4o8sVdZV3lvDo=;
 b=vtcnip5VJ7eEA5/O3QR3MY+1RM50EUtjiePVNAKj2ONddFKWlDgECZ1J/OpJa8PRbgD3blm1jxsntsbqdP1sTuaPrAbXDvyLcviDs4oNTnyTqeCL4HYtOZztmCu1h0DVbbj8dl/BnxiZpVEAQadPNfK9PFFc6qsc8XT0JPLqhFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <92cf8f8e-d48a-42bc-502c-9e6656c9b2d7@citrix.com>
Date: Mon, 11 Sep 2023 11:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools/misc/xencov_split: Add python 3 compatibility
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230905201653.98425-1-javi.merino@cloud.com>
In-Reply-To: <20230905201653.98425-1-javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5606c0-f6a9-4215-c1c5-08dbb2b3e35b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJwjCpInIRtEVjLHsmn8GASjV7TsgyS0V4WJWKqJdvi883avtQXTOa8KvpVJnywBjR6USjOn4ECSrbRmpaTuSlMk+ubeviXPNiUU1/r0SrpygQmanSn+11tHJh7gS8azRa8X3zc9inRz41IVq55cpvNc+0V8hcm4P02xQSo0D9joTfNNZ6Q7olH6vrj0CI6wRMkylzYzi+ArJS3hYUW+qYfcRvP07oPNnwt8CJCna1FCRSjFyYjQDNT+pLtoPM083Z4T39DpBz526KRVSqUyCQi7PvPDYhQDX5RAEOcq6sOokIPQ3PPSjZ5fKZiyXTMedkQhwwIdBnylcXg9fzz2jFdKAJBfbI2xxdEFmvUL+l4ErllPIWRvooZqSrXxqHdb7ovcxNsqNL1is4ojZ4FWcAW0bMBeM0prLywYiOwyXO2rLuT4MSfz+EolOeSbw+4gNCJ1f7ZFxG26Tn6OXbJHpaK+cl18B+y4VpGytJYZ10ebyzgNMXoG+I6Ybz2BeydfBXZgYxUtQLocMUY8AYbYV+dJPV+XmABZXATxIgOzuX5otbjn87zqv6Y03UUTBpKOjdPUyn/qbbLbpIsh5cGMgcrEMJAgHcj6Hrok1mp9HQ3rXdgSdH+vjVbg+EI6l0rspKHQwcoBpDBMEZd9HlKIfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(186009)(451199024)(1800799009)(86362001)(2906002)(26005)(83380400001)(6506007)(6666004)(53546011)(6486002)(2616005)(558084003)(6512007)(82960400001)(38100700002)(31696002)(478600001)(36756003)(5660300002)(4326008)(31686004)(8676002)(8936002)(316002)(66476007)(66556008)(66946007)(54906003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2tYaWFEbldacmxiYmw3WnBuUmY0ZGhoWkxvcFBBUmxKclgyVWpMbVJTN2dY?=
 =?utf-8?B?cEk2TEk5QmJua0JwRjFBMWZkYlZWanpWSWQxTGI2RHdTM0FHUFI5MHN4V2o4?=
 =?utf-8?B?RUs5R014STVpenl5K1NUOEJFa0ZISXM0RzZxOUp0alI3NVdYU0Z2Q0ErMUJZ?=
 =?utf-8?B?QnllcjlvdHpIdE8xNkFrUHp5YkZJQnZOY0NwYno0Y0lrSXpDbnVWQ0FnSkpX?=
 =?utf-8?B?MmJYNXQvYTlVZk9GSmpBa2NRblhvTGZEOFA5NGh0VkI5b2pYTkpCeXdzQmwv?=
 =?utf-8?B?QnRxS2IwZDRYTDlaYnVjMHNQZkttaWgwWFNiM0wzK3dVeHdPK0tXZ2xMSGlU?=
 =?utf-8?B?RkhmeElRR2ZmSFZNSG5kV3NiczR3eTRsbHRrUUhpT2lmSzdKQlpSZHcrM1Q1?=
 =?utf-8?B?Tk1jTHk5MG1INkxMNzBVUE1mRk5aZm1HK1EvTWdZVG9sTmZOWS8vUmFwMEF5?=
 =?utf-8?B?Q3NtaDRSZlBzTlo5NmVNNkpKRXB3Nm9MMi9sRWsrUmJ5SlJORjhoOFh5b3pX?=
 =?utf-8?B?OEd5aFg1akp1cCtWNnkvY0F3a1ZYUm5zWDNNUmlSaFpPTm0zUGs5OGIvdGJq?=
 =?utf-8?B?MUdjbDQvVlh3TjF1TUxublRtTUdQdEhHR1lMejlJN2Z5L0l0N2tIeC81aFRk?=
 =?utf-8?B?RWdROEwzUUhTL21qT0UvdmMyQTd0OTdRL0ZUUUVsUzBDOGNoNHFQUit1ZWUv?=
 =?utf-8?B?WjFPSnZzLzdlWTBXUkwzYnFvTDJxUDZPWlBTTStaUWx1WG1JdjRES3VJUE5L?=
 =?utf-8?B?RktwMFQ5TE9LTUZFalR6UnNraUo0UnZuZnJvc0pXWXR3V0x0ZmY4RHVPN3la?=
 =?utf-8?B?RVBoZmZDK3RlZ2RydDErdTlHZDJsVkNhNFF4RXhza0JXSUdyaCtKZXZObGp4?=
 =?utf-8?B?dXoxRUlqMXZFZ2xBYWlRMWUyRFRhaS96WE5ITWwvekJjemRIU3d3UVZYQ1dF?=
 =?utf-8?B?cjVJd2VoN3ZiclhqL0NmODFqR2NxbVY5cktScFplOXcxQWVjUGM4V0JjNEFN?=
 =?utf-8?B?NmN5VGJVMHlmYnlmRGtDa0N6V3JuYnR3cUZOUDVTL1hwcWh2dVh5L0FEZTFw?=
 =?utf-8?B?ck1oMnBjcmhXK0wzd2RsSVpCVjJMVnVJa3FOMkpOTC85Tk83bzNkN3JsNjhv?=
 =?utf-8?B?OUhhWlQrV25CRzkwNXZTbnEyeHBZTUZkOTR4em1zalMzVTNPaXJKeDRRbWt5?=
 =?utf-8?B?S1YrODVnd2tibVlJV3VKQldoK29NMDZyZXZFSmpRLzRRSllGN0tVTmRhM1JG?=
 =?utf-8?B?UTEwVm1NUlYweW1oV1hNUHBHbGc5TmtqalhFU1NMT3Bzd2NlUStDTVFzZVZG?=
 =?utf-8?B?aDJremJFUkpuSEZ2ai9oSGt3NWkwSHFTSWx5NUpGdU1XRFIvSnRsSWNmNE43?=
 =?utf-8?B?ODE3RnFNeVYzR2xMV3JGTzk4MzFQU0ZuaStIQTIwcVNYNTFIV29Zc1FiN0hK?=
 =?utf-8?B?TjhiY0RMSmU5dUp0ZnhIOWd6eXdGNlg2S0MyQytramRlM3c5eC9jZjN1VGx0?=
 =?utf-8?B?YVlyUTJweWFIQTZvOHFsbFY3eDlXNVVoeW5nTFFJdlNKVUl3LzcwK1JjSzV0?=
 =?utf-8?B?WE9JaFdBTFhKdThydFpidUV2WW9jeHlXNlR1d0sxbStPeU9pQ24xdzVGeWhQ?=
 =?utf-8?B?YUtFYm43TEYxMVlwTFB6R2ZSTXRLK3NCM0ZodzVlVU14elpaaFlXRkhhamhy?=
 =?utf-8?B?Y2dlMGxnUHhSa1RBWm1CZjdwWDZLeUJ0R01xUmtocENBUGNjYkxCbEJYTlhJ?=
 =?utf-8?B?Ry9McHp0WTBmWjBDMUxCTTZnQzFzQ2duaFoyeXN3d2t2eDBHVDBaNWJveG1j?=
 =?utf-8?B?ejJMdXFxMzNVNFI5Z3UrSDljVkhQUytSZEFqUW1BU3ZkTmZHMDJIMU8xY1Vk?=
 =?utf-8?B?VFNHV1FKTlpCcVhNSGkwNDFCQ0FmZWwyQTRXdDIrZ2FES1I1clBRVVd2NDlh?=
 =?utf-8?B?L0FKRnZDUkdON3VLbjY2cDlURHhvSWxacFJvTk9NL2IydTBrdEZrODFZUzha?=
 =?utf-8?B?SUtkZkNaVm9qUG9DZDVUMExkbUhacFl1Y295TUtPQlpOSU5IK295d3UrM0tQ?=
 =?utf-8?B?YzAxZFdPL3lvSkpvODhlZUlhMEZxRVp6NnpKWkpoYTR5aE1CMGVvbzZBUVd2?=
 =?utf-8?B?d3N5OTVTZGkrN0R5UkxpdlAreXZJZC83cGd2dHJHOGc4a1NMQ3VhUktsdWZw?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5zBTrR9FSxx/M3a3tqTM6E7irVxw8iXqXtOcyilbGKG/fGfgTyAykT7uXoZ1F0C0bcxfvdN8oNc8SqjABL1tHb5cFvOPFqSpLHB3sgPOjFZAZ0fTT+BmSXw7iS+dNR6lrwY9A2vJaVSXrNbBla/uuRW/wepGbSvcJlUZ15LkBwucqJRbFSg5UZX5TgWfdobH/d2RaRbLKYk2TeYrZOpwdpKt9TE0/uyiejBiNsbdYDL1qqMomdU6Q/EZO0NLFe8jkE8F9NCprdWRdUkrE+Elf/r7k6H0vnBWfrZMSJ2xkXKEbABi0t5CvDWPEfvnMPSbffFmsd4S6MGxmyUS7tG5pSfR98Mn4titzCh8lED1zjB0gegh4Z/EaxplAiT3h0L7H4HBAYNwWPH5eDVf0ulpXfDJ9mXDRiNPC03kqNjWHzFbQ+ikbRRfO8TrZtYXNataKjOTscBIe7iV/2aiz4EiEBEWVBjLmmiLwuaO9IW2E17+bQgyZx2iKPbFKe7Xb4gvKnBxHm6Y1nPwhJt8tZAP0irA9UMkkO4c40IlmKwL0srBiEUg3QKgLPQ5IVC3PwRGOxfAhoKYsnGxYOuFVR+8eeiJYnqYqutfk42U8knU3lSUcG6anqmtHfB1tvlZZCE9cJgC+dFjrRyhT1koAKqLYxKS6X9h2B5mQJVUoVpekkzHq9/UJZs92JDVIRO/1NkKvCQLWYQUo8it2JmyZC+Po6ayKQk3cq4DxHEZD90aHJxTgeI6HbnnunwgdB/leij8qnEYNa1BByDKtCypxCc8psiccN8+cCGTZ8feyDW92xbgJSIZBy8lqCyXJ2okStj//7xZKJ8Dm+zpc6nLMujjWE1rQV9XR3Su8EL5CL63Le8fxnWAkVe2NtKJF9i0WS+G
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5606c0-f6a9-4215-c1c5-08dbb2b3e35b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:43:08.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /94i1JZ6/tsCKVvkFt5kvdjd8OCTjOraJgCX+lM5PkXi1Tdb43wsD9Ga4X05FtE5deYAQsGAGtS6v6XIR0KGhDbDJTxU+7QpLPqRkt/0fVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5235

On 05/09/2023 9:15 pm, Javi Merino wrote:
> Closes #154

This wants to be:

Resolves: xen-project/xen#154

I'll fix on commit.

> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

